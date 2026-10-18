;;; emoji-replace.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;; Videos Learning elisp 11 et suivantes à propos des emojis
;;; Code:

(lisp-interaction-mode)
(eros-mode)

;; Le but est d'avoir un mode qui lorsque on tape un mot entre :, ce soit remplacé par l'émoji associé.
;; :bat: --> 🦇

(cdr '(":ghost:" . 👻))                                  ; Etrangement on peut mettre le 👻 sans les quotes
(if (boundp 'DISABLED)                                   ; Désactive le code pour éviter de poluer le buffer
    (
     (insert (symbol-name (cdr '(":ghost:" . 👻))))      ; Mais avec insert, ça ne fonctionne pas sauf si on utilise symbol-name
     (insert (cdr '(":ghost:" . "👻")))                  ; Ou plus simplement des quotes...
     ))

(setq emoji-list
      '(
        (":gnu:" . "🐃")
        (":panda:" . "🐼")
        (":koala:" . "🐨")
        (":lion:" . "🦁")
        (":racoon:" . "🦝")
        (":turtle:" . "🐢")
        (":snake:" . "🐍")
        (":whale:" . "🐋")
        (":sheep:" . "🐏")
        (":gorilla:" . "🦍")
        (":elephant:" . "🐘")
        (":dolphin:" . "🐬")
        (":squid:" . "🦑")
        (":ghost:" . "👻")
        (":shark:" . "🦈")
        )
      )

;; (cdr (assoc ":gnu:" emoji-list))

(defun emoji-replace-insert ()
  "Remplace un tag d'emoji par cet emoji.  Doit être dans la liste `emoji-list'.  Exemple: `:gnu: ' est remplacé par 🐃."
  (interactive)
  (save-excursion
    (backward-char 1)  ; on considère que ce sera actif lors de la touche espace après avoir tapé :gnu:_
    (set-mark (point)) ; on est sur le : après le mot clef, on mémorise ce `point'
    (backward-word 1)  ; on revient sur la 1re lettre du mot clef
    (backward-char 1)  ; on recule sur le premier :
    (let* (
           (word (buffer-substring-no-properties (point) (mark))) ; le mot + les `:' -> `:gnu:'
           (pair (assoc word emoji-list)))                        ; pair vaut une des paires, ex:(":gnu:", "🐃") ou nil si pas dans la liste
      ;; (message "word: %s, pair: %s" word pair)
      (if (not pair)
          nil                                                     ; ne fait rien si nil
        (kill-region (point) (mark))                              ; bute le mot -> :mot:
        (insert-before-markers (cdr pair))                        ; insere l'emoji
        )
      ))
  (deactivate-mark)  ; Cette fonction permet d'enlever la selection qui traine si le mot n'est pas trouvé dans la liste.
  )


;; Emoji replace part 2 - hooks
(defun trigger-emoji-replace-insert (begin end len)
  ;; (message "beg: %s, end: %d, len: %d" begin end len)
  (let ((s (buffer-substring begin end)))
    (when (equal s " ")
      ;; (message "trigger: [%s]" s)
      (emoji-replace-insert)
      )
    )
  )

;; (add-hook 'after-change-functions #'trigger-emoji-replace-insert nil t)
;; (remove-hook 'after-change-functions #'trigger-emoji-replace-insert t)
;; (symbol-value 'after-change-functions)
;; (remove-hook 'after-change-functions (car
;;  (symbol-value 'after-change-functions)) t
;;  )
;; The 👻 is talking to the 🐘.


;; Emoji replace part 3 - text properties
;; l'overlay est juste une décoration sur le texte, mais il me modifie pas le buffer
;; dans cet exemple, si je tape  :whale: , je vois une baleine mais le texte :whale: est toujours là.
;; et l'emoji n'est pas réellement inséré dans le texte

;; Savoir où on se trouve dans le texte courant
;; (point)                                 ; 3508

(defun emoji-replace-overlay (begin end len)
  "Remplace un tag d'emoji par cet emoji visuellement.  Doit être dans la liste `emoji-list'.  Exemple: `:gnu: ' est remplacé par 🐃."
  (let ((s (buffer-substring begin end)))
    (when (equal s " ")
      (save-excursion
        (backward-char 1)  ; on considère que ce sera actif lors de la touche espace après avoir tapé :gnu:_
        (set-mark (point)) ; on est sur le : après le mot clef, on mémorise ce `point'
        (backward-word 1)  ; on revient sur la 1re lettre du mot clef
        (backward-char 1)  ; on recule sur le premier :
        (let* (
               (word (buffer-substring-no-properties (point) (mark))) ; le mot + les `:' -> `:gnu:'
               (pair (assoc word emoji-list)))                        ; pair vaut une des paires, ex:(":gnu:", "🐃") ou nil si pas dans la liste
          (message "word: %s, pair: %s" word pair)
          (when  pair
            (put-text-property (point) (mark) 'display (cdr pair))  ; superpose l'emoji au text cachant celui-ci
            )
          ))))
  (deactivate-mark)  ; Cette fonction permet d'enlever la selection qui traine si le mot n'est pas trouvé dans la liste.
  )


;; (add-hook 'after-change-functions #'emoji-replace-overlay nil t)
;; (remove-hook 'after-change-functions #'emoji-replace-overlay)

;;

;;; emoji-replace.el ends here
