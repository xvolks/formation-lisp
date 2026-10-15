;;; playground.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;;; Code:

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
(mapcar carre '(1 2 3 4 5))

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

 
;;; playground.el ends here
