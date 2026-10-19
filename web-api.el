;;; web-api.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;; Videos Learning Elisp 16 - using a web API et suivantes
;;; Code:


(eros-mode)
;; using a web API
(load-file "./key.el")                   ; Ne pas pousser la clef dans Github.
(defvar key my-key)

(defvar base-url "https://dictionaryapi.com/api/v3/references/ithesaurus/json/")
(defvar word "umpire")

;; (switch-to-buffer                     ; Ouvre dans un nouveau buffer la réponse à l'appel HTTP
;;  (url-retrieve-synchronously
;;   (concat base-url word "?key=" key)))

;; HTTP/1.1 200 OK
;; Date: Mon, 19 Oct 2026 09:06:49 GMT
;; Content-Type: application/json; charset=utf-8
;; Transfer-Encoding: chunked
;; Connection: keep-alive
;; Server: nginx
;; Vary: Accept-Encoding
;; Access-Control-Allow-Origin: *
;; X-Rid: 4a0aaead-25e9-4a50-a5fc-3fc5d96b0540
;; Referrer-Policy: no-referrer-when-downgrade
;; Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
;; X-Frame-Options: DENY
;; X-Content-Type-Options: nosniff
;;
;; [{"meta":{"id":"umpire","uuid":"95702747-e10f-4738-895c-c04301c0799b","src":"int_thes","section":"alpha","target":{"tuuid":"897edcad-2e88-4ab7-b81b-170ddf8eb4ec","tsrc":"collegiate"},"stems":["umpire","umpires"],"syns":[["arbiter","arbitrator","judge","referee"]],"ants":[],"offensive":false},"hwi":{"hw":"um...


(defun get-synonyms (word)
  "Lit les synonymes du mot `WORD' à partir de l'API Web."
  (let* ((url (concat base-url word "?key=" key))
         (resp (with-current-buffer (url-retrieve-synchronously url)
                 (goto-char (point-min))               ; Va sur le premier caractère de la réponse
                 (re-search-forward "^$")              ; Cherche la première ligne vide (qui sépare les entêtes du json)
                 (delete-region (point-min) (point))   ; Supprime les entêtes
                 (buffer-string)
                 ))
         (json-resp (json-parse-string resp))          ; Parse le texte en objet JSON
         (tmp (aref json-resp 0))                      ; La réponse est un tableau: on prend le 1er élément
         (meta (gethash "meta" tmp))                   ; L'info est dans un objet `meta'
         (syns (aref (gethash "syns" meta) 0))         ; Puis dans un objet `syns' -> tableau on prend le 1er
         )
    (mapcar #'identity syns)                           ; On transforme le tableau en liste Lisp et retoune
  ))

(get-synonyms word)

;; A Thesaurus mode

;; (completing-read "Synonyme: " (get-synonyms "dork"))



(defun word-to-syn (w)
  "Remplace le mot courant par un synomyme choisi dans le retour du webservice.  `W' est inutilisé ici."
  (interactive "p")
  ;  (message "W: %s" w)
  (let* (( word (current-word))
         (word-list (get-synonyms word))
         (new-word (completing-read "Remplace: " word-list))
         )
    (backward-word)
    (kill-word 1)
    (insert new-word)
    ))

;; My mate is a smart<M-x word-to-syn RET select sharp> -> sharp bird

(define-minor-mode zsyn-mode
  "Mode qui definit un raccourci pour remplacer un mot par son synonyme."
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "C-c z") 'word-to-syn)
                        map))

(add-hook 'org-mode-hook 'zsyn-mode)

;; Suite --> email.el


;;; web-api.el ends here
