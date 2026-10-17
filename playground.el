;;; playground.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;;; Code:

(lisp-interaction-mode)

;; Variable definition
(defvar ops)
(setq ops '(+ 1 2))
(car ops) ; retourne le premier élément de la liste: ici +
(cdr ops) ; retourne les éléments aprés le premier
(message "%s" ops)

;; On est pas obligé de déclarer les variables
(setq l2 '(1 2 3 4 5))

;; Function definitions
(defun g (c)
  "Plus 1 of C."
  (+ c 1)
  )

(defun gg (c)
  "Minus 1 of C."
  (- c 1)
  )

(defun f (c)
  "Insert 1+C."
  (insert (g c))
  )

(defun ff (c)
  "Insert C - 1."
  (insert (gg c))
  )

;; Modifie le buffer courant car appelle (insert) dans les fonctions f et ff
;; (mapcar 'f "Hello, World!")
;; (mapcar 'ff "Ifmmp-!Xpsme\"")

;; Local variables
(setq x "Tata")
(let (
      (c 65)
      (x "Toto"))
  (message "%s: %d" x c)
  )
(if (equal x "Tata") ; See: https://lisp-journey.gitlab.io/blog/common-lisp-equality-predicates/
    (message "GOOD: Variable x has not been modified by let: %s" x)
    (message "ERROR: Variable x HAS been modified by let: %s" x)
    )

;; Let peut déclarer puis assigner des valeurs.
(let (
      (c)
      (x))
  (setq c 20)
  (setq x "titi")
  (message "%s: %d" x c)
  )

;; rot13 rotate by 13
;; Simple example:
;; - rotate by 3 "abc -> def", "z -> c"
;;
;; hello world -> uryyb jbeyq
;; 
;; hello world
;; (rot13-string "hello world")
(defun rotate-s (c offset)
  "Rotation d'un charactere C par OFFSET.
- Ramène c à 0 (-`a' -> -97)
- Ajoute l'offset
- Modulo 26 (nb.  lettres de l'alphabet)
- Ajoute `a'"
  (+ 97 (mod (+ offset (- c 97)) 26))
  )


(rotate-s (string-to-char "a") 3)
(rotate-s ?z 3) ; (string-to-char "z)" peut être remplacé par ?z !!?

; (1 2 3 4 5)   ;; Ceci genère une erreur sans le commentaire car 1 n'est pas une fn
(+ 2 3 4 5)     ;; Ceci vaut 14 car évalué avec la fonction +
'(+ 2 3 4 5)    ;; Ceci est une liste et ne sera pas évaluée directement contrairement à la précédente.

(defun carre (x)
  "Elève une valeur X au carré."
  (* x x))

;; Ne fonctionne pas car il "pense" que carre n'est pas une variable.
;; (mapcar carre '(1 2 3 4 5))

;; Force `carre' à être reconnue en tant que fonction et non en tant que variable.
;;       /---- le #' force `carre' en tant que fonction.
;;      \/
(mapcar #'carre '(1 2 3 4 5))

;; Fonction identité -> identity.
(identity ?a)        ; retourne l'argument, ici 97 ou a
(identity "Xvolks")  ; retourne l'argument, ici "Xvolks"

;; Transforme une chaine en liste d'entiers.
(mapcar #'identity "xvolks") ; (120 118 111 108 107 115)


(defun rotate-13 (c)
  "Rotation par 13 du charactere C. Le but est d'avoir un seul parametre pour mapcar."
  (rotate-s c 13))


(rotate-13 ?c)
(if (= (rotate-s ?a 13) (rotate-13 ?a))
    (message "GOOD: rotate-13 idem rotate-s .. 13")
    (message "BAD: rotate-13 failed to emulate rotate-s .. 13")
    )

;; Maintenant on assemble tout ça pour faire la fonction rot13
(defun rot13 (s)
  "Fonction rot13 pour une chaine S contenant uniquement [a-z]."
  (concat (mapcar #'rotate-13 s))
  )

(setq xvolks "xvolks")
(rot13 xvolks)
(rot13 "kibyxf")

;; Teste la fonction
(if (equal (rot13 (rot13 xvolks)) xvolks)
    (message "GOOD: double rot13 donne la même entrée")
  (message "BAD: double rot13 a donné un résultat inattendu: %s" (rot13 (rot13 xvolks))))


(if (equal (rot13 xvolks) "kibyxf")
    (message "GOOD: rot13 donne la bonne sortie: %s"  (rot13 xvolks))
  (message "BAD: rot13 a donné un résultat inattendu: %s vs. %s" (rot13 xvolks) "kibyxf"))

;; Lambda
(
 (lambda (x) (* x x))
 5
 )

;; Remplace la fonction rot13 par une version qui ne nécessite pas rotate-13.
(defun rot13 (s)
  "Fonction rot13 pour une chaine S contenant uniquement [a-z]."
  (concat (mapcar (lambda (c)
                    (rotate-s c 13)
                    ) s))
  )


;; Remplace la fonction rot13 par une version qui gère les majuscules.
;; (defun rot13 (s)
;;   "Fonction rot13 pour une chaine S contenant uniquement [a-z]."
;;   (concat (mapcar (lambda (c)
;;                     (if (and (>= c ?a) (<= c ?z))
;;                         (rotate-s c 13)
;;                       c)
;;                     ) s))
;;   )

(defun rotate (start c offset modulo)
  "Rotation d'un charactere C par OFFSET avec une base en START et le MODULO est appliqué.
- Ramène C à 0 (-START)
- Ajoute l'OFFSET
- Modulo `MODULO' (nb.  lettres de l'alphabet par exemple)
- Ajoute `START'"
  (+ start (mod (+ offset (- c start)) modulo))
  )


(defun rot13 (s)
  "Fonction rot13 pour une chaine S contenant uniquement [a-z]."
  (concat (mapcar (lambda (c)
                    (cond
                     ((and (>= c ?a) (<= c ?z)) (rotate ?a c 13 26))
                     ((and (>= c ?A) (<= c ?Z)) (rotate ?A c 13 26))
                     ((and (>= c ?0) (<= c ?9)) (rotate ?0 c 5 10))
                     (t c)
                     )
                  ) s))
  )

(setq xvolks "Xvolks1337")

;; Teste la fonction
(if (equal (rot13 (rot13 xvolks)) xvolks)
    (message "GOOD: double rot13 donne la même entrée: %s" (rot13 (rot13 xvolks)))
  (message "BAD: double rot13 a donné un résultat inattendu: %s" (rot13 (rot13 xvolks))))

;; (defun rotate-interactive ()
;;   "Interactive version of rot13."
;;   (interactive)
;;   (let ((s (thing-at-point 'line)))
;;     (print s)
;;     )
;;   )
(defun rotate-interactive ()
  "Interactive version of rot13. Ne fonctionne pas si le curseur est sur la premiere lettre du mot."
  (interactive)
  (let* ((s (word-at-point))      ; `let*' contrairement à `let' permet d'utiliser les variables définies dans le bloc.
        (rotated-text (rot13 s))
        )
    (backward-word 1)
    (kill-word 1)
    (insert rotated-text)
    )
  )

;; En tant que cmd interactive, elle est dispo dans M-x rotate-interactive
;; et on peut l'invoquer par un (ou plusieurs) raccourci clavier.
(keymap-local-set "C-c r" 'rotate-interactive)
(keymap-local-set "C-c C-r" 'rotate-interactive)


(defun ft (n)
  "Fonction de test.  Soit on lui passe `N' en arg, soit Emacs demande sa valeur, si invoqué via \\[ft]."
  (interactive "N")
  (print n))

;; (ft)
(ft 6)
(print "ptp")


(defun rot (s offset)
  "Fonction rot pour une chaine S avec l'`OFFSET' pour uniquement [a-z][A-Z]."
  (concat (mapcar (lambda (c)
                    (cond
                     ((and (>= c ?a) (<= c ?z)) (rotate ?a c offset 26))
                     ((and (>= c ?A) (<= c ?Z)) (rotate ?A c offset 26))
                     ((and (>= c ?0) (<= c ?9)) (rotate ?0 c 5 10))
                     (t c)
                     )
                  ) s))
  )

(defun rotate-interactive (n)
  "Interactive version of rot13. `N' est la rotation à appliquer (13 par défaut).  Donné par \\[universal-argument] avant \\[rotate-interactive]."
  (interactive "P")
  (let* ((offset (if n n 13))
         (s (word-at-point))      ; `let*' contrairement à `let' permet d'utiliser les variables définies dans le bloc.
        (rotated-text (rot s offset))
        )
    (backward-word 1)
    (kill-word 1)
    (insert rotated-text)
    )
  )

;; Episode `Rotating the region'

(defun rotate-interactive (n)
  "Interactive version of rot13. `N' est la rotation à appliquer (13 par défaut).  Donné par \\[universal-argument] avant \\[rotate-interactive]."
  (interactive "P")
  (let ((offset (if n n 13)))
    (if mark-active
        (let*
            ((s (buffer-substring-no-properties (point) (mark)))
             (rotated-text (rot s offset)))
          (kill-region (point) (mark))
          (insert rotated-text))

      (let*
          ((s (word-at-point))
           (orotated-text (rot s offset)))
        (backward-word 1)
        (kill-word 1)
        (insert orotated-text)) ;; original code
      )
    )
  )



(print mark-active)

;; hello --> rot13 --> uryyb
;; block mode 1 --> oybpx zbqr 6
;; block mode 2 --> oybpx zbqr 7
;; hello --> rot10 --> rovvy
;; hallo --> rot10 --> rkvvy
;; hullo --> rot10 --> revvy
;; hillo --> rot10 --> rsvvy
;; (rotate-interactive 13)


;; Regular Expressions
;; Impossible de faire fonctionner le ou \| comme dans la vidéo :(

;; Dates au format américain (mm/dd/YYYY)
;; 10/15/1975
;; 3/6/22

;; Version simple, ne gère pas les dates invalides comme 1/1/123
;; ([0-9]+)/([0-9]+)/([0-9]+)
;; Il faut échaper les paranthèses bizarrement ?!
;; \([0-9]+\)/\([0-9]+\)/\([0-9]+\)
;; Valeur de remplacement: \2-\1-\3
;;
;; Dates au format américain remplacées
;; 15-10-1975
;; 6-3-22

;; Tests avec des signatures de fonctions C.
;; int funname (int a, double b) {}
;; double my_function2(int a, double b) {}

;; Première version, il manque beaucoup de choses
;; \([a-z]+\)[ \t]+\([A-Z_a-z0-9]+\)[ \t]?(\(.*\))
;; Dans la vidéo il utilise regex-builder, ici j'ai utilisé replace-regexp

;; Regex part 2

;; Construction de regex avec la macro `rx'.

(rx
 (any "a-z")                        ; [a-z]
 )

(rx
 (group (one-or-more (any "a-z"))   ; \\([a-z]+
        "ZAP"                       ; ZAP
        (one-or-more digit)))       ; "\\([a-z]+ZAP[[:digit:]]+\\)"

;; xr permet de faire l'inverse (le package `xr' doit être installé: M-x package-install xr)
(xr-pp "\\([a-z]+ZAP[[:digit:]]+\\)")(group (one-or-more (any "a-z")) "ZAP" (one-or-more digit))
  ; (group (one-or-more (any "a-z")) "ZAP" (one-or-more digit))


(setq INHIBIT-MODIFY nil)
(boundp 'INHIBIT-MODIFY)

(if (and (boundp 'INHIBIT-MODIFY) INHIBIT-MODIFY)
    (print "match-string va probablement foirer")
  (print "ok, INHIBIT-MODIFY est void ou nil, match-string devrait fonctionner!")
  )

;; Region start
(setq line " int add_two(int a, int b)")
(setq regex "\\([a-z0-9]+\\) +\\([a-zA-Z0-9_]+\\)(\\([a-zA-Z0-9_ ,]+\\))")

(string-match regex line)
(setq ret (match-string 1 line))
(setq fun (match-string 2 line))
(setq par (match-string 3 line))

(insert ret)
(insert " ")
(insert fun)
(insert "(")
(insert par)
(insert ")")

;; Region stop
;; M-x eval-region --> int add_two(int a, int b)

;; Impossible d'évaluer ligne par ligne à cause de l'état global de la regex,
;;   modifié entre 2 lignes par le paramétrage d'Emacs (sauf si rien ne tourne?)

;; Utilisation de la fonction format
(format "fn %s(%s) -> %s" fun par ret)   ; "fn add_two(int a, int b) -> int"

;; Regex Conclusion

;; Test signature

;; int add_two(int a, int b)

(defun header-parse-params (line)
  "Découpe `LINE' sur la chaine ', ', mappe chaque texte avec le format.  Retourne une liste de chaines."
  (mapcar (lambda (x) (format " * @param %s\n" x))
          (string-split line ", ")))

(header-parse-params "int a, double d, char c")

(defun function-header ()
  "Créé une documentation type Javadoc sur une fonction très basique de type `C'."
  (interactive)
  (save-excursion                     ; or (search-backward ...)
    (beginning-of-line)
    (set-mark (point))
    (end-of-line)
    (let* (
           (line (buffer-substring-no-properties (mark) (point)))
           (regex "\\([a-z0-9]+\\) +\\([a-zA-Z0-9_]+\\)(\\([a-zA-Z0-9_ ,]+\\))")
           (index (string-match regex line))
           (ret (match-string 1 line))
           (fun (match-string 2 line))
           (par (match-string 3 line))
           (header1 (format "\n/** <p>Description </p>\n * @name: %s\n *\n" fun))
           (header2 (format "%s\n" (string-join (header-parse-params par))))
           (header3 (format " * @returns %s \n *\n */\n" ret))
           (header (format "%s%s%s" header1 header2 header3))
           )
      (beginning-of-line)
      (insert header)
                                       ; (search-backward "Descrip")
      )
    )
  )

;; (keymap-global-set "M-c" 'function-header)

;; Built-in data structures
;; Utilisation du pkg Eros (Evaluation Result OverlayS for Emacs Lisp)
(eros-mode)

(+ 2 3)

;; Listes
;; Structure basique nommée Cons (la bse quoi).
(setq cons1 (cons #'+ (cons 1 (cons 2 (cons 3 '())))))  ; Ne pas oublier la liste vide (nullptr en C++) à la fin.
(setq cons2 (cons  '+ (cons 1 (cons 2 (cons 3 '())))))  ; Quelle difference si on ne met pas le # ?
(setq cons3 (cons 2 3))                                 ; Paire aussi notée (2 . 3)
(type-of cons1)                                         ; cons
(type-of cons2)                                         ; cons
(type-of cons3)                                         ; cons

;; Vecteurs
(setq v1 ["un" "deux" "trois" "quatre"])
(type-of v1)                                            ; vector
(aref v1 1)                                             ; deux
(aset v1 1 "two")                                       ; two
v1                                                      ; ["un" "two" "trois" "quatre"]
(setq v2 [1 2 3 4 5])                                   ; [1 2 3 4 5]
(mapcar #'1+ v2)                                        ; (2 3 4 5 6) <- transformé en list
(type-of (mapcar #'1+ v2))                              ; cons        <- verifié: cons et non vector

;; Hashtables
(setq h (make-hash-table :test 'equal))                 ; crée une hashtable vide avec la fonction de test -> equal
(gethash "test-key" h)                                  ; nil         <- la table est vide
(puthash "test-key" v1 h)                               ; ajoute le vecteur v1 sous la clef "test-key"
(gethash "test-key" h)                                  ; ["un" "two" "trois" "quatre"]

;; Liste de paires (mot clef `assoc') -> voir la doc, beaucoup de functions utiles.
(setq map '( ("a" . 10) ("b" . 11) ("c" . 12) ("d" . 13) ("e" . 14) ("f" . 15)))
(assoc "a" map)                                         ; ("a" . 10)
(cdr (assoc "c" map))                                   ; 12

;; On peut se passer du point, mais dans ce cas, le résultat de `cdr' sera une liste d'un élément.
;; Ce n'est donc pas totalement interchangeable.
(setq mop '( ("a"   10) ("b"   11) ("c"   12) ("d"   13) ("e"   14) ("f"   15)))
(assoc "a" mop)                                         ; ("a" 10)
(cdr (assoc "c" mop))                                   ; (12)

;; Emoji Replace part 1
;; c.f. voir le fichier emoji-replace.el

;;; playground.el ends here
