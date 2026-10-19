;;; web-api.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;; Videos Learning Elisp 16 - using a web API et suivantes
;;; Code:

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
         (json-resp (json-parse-string resp)))
    json-resp
  ))

(get-synonyms word)

;;


;;; web-api.el ends here
