;;; email.el --- Formation avec Mike Zamansky (YT)
;;; Commentary:
;; Formation du 14/10/2026, fin prévue le 31/10/2026
;; Support: https://www.youtube.com/@mzamansky/videos
;; Videos Learning Elisp 18 - extracting emails from text

;; Texte généré par duck.ai
"""
Le soir du 24 décembre, Noémie aidait sa grand-mère à préparer la salle des fêtes de Floconville. On avait accroché des guirlandes aux fenêtres, posé des bougies sur les tables et installé, au milieu de la pièce, un sapin si grand que son étoile touchait presque le plafond.

Presque.

— Il manque trois centimètres, annonça Noémie.

— Dans ce cas, il nous faut une échelle, répondit sa grand-mère.

Mais l’échelle était introuvable. À sa place, sur le bureau de l’entrée, il y avait une boîte en fer blanc que personne n’avait jamais vue. Un vieux grelot était peint sur le couvercle, avec ces mots : **Bureau de poste du pôle Nord — courrier urgent**.

Noémie l’ouvrit. La boîte était pleine d’enveloppes, toutes adressées à des destinataires étranges. La première portait l’adresse **flocon.pilote@traineau.example**. À l’intérieur, un billet demandait de transmettre un message au responsable du traîneau : « Le renne de tête a encore inversé les panneaux. Nous volons vers le sud depuis vingt minutes et nous venons de croiser un flamant rose en manteau. »

— C’est forcément une blague, dit Noémie.

À cet instant, un renne passa la tête par la fenêtre.

— Le sud, c’est par où ? demanda-t-il.

Noémie lui montra la direction du nord, et le renne repartit en trottinant dans les airs, comme si cela allait de soi.

La deuxième enveloppe était adressée à **rudolphe.veilleuse@nezrouge.example**. Elle contenait une petite ampoule et un mot : « À remplacer avant le départ. Le nez clignote au lieu de briller, et les enfants croient que le Père Noël envoie des messages en morse. » Noémie posa l’ampoule près du grelot. Elle se mit aussitôt à clignoter trois fois.

La boîte tinta. Une troisième enveloppe apparut, portant l’adresse **pistache.lutin@atelier.example**. Le message disait : « Qui a rangé les biscuits dans la réserve des patins ? Le traîneau a mangé tout le stock en glissant. Nous n’avons plus que des miettes et un bonbon qui date de l’an dernier. »

Noémie sentit son ventre gargouiller. Elle prit un biscuit sur le plateau de sa grand-mère et le plaça dans la boîte. Une lueur dorée jaillit du métal.

— Les biscuits voyagent par courrier, maintenant ? demanda sa grand-mère.

— Seulement ceux qui croient à la magie, répondit Noémie, sans savoir pourquoi elle en était certaine.

La boîte se mit à vibrer. Une quatrième lettre, adressée à **mere.noel@cuisinepolaire.example**, s’ouvrit toute seule. « Le pudding de tante Gudule miaule à nouveau. Quelqu’un a-t-il vu le couvercle ? Sans lui, il se promène dans le garde-manger et réclame du lait. »

Un petit « miaou » s’éleva de derrière le sapin. Noémie souleva une boîte en carton et découvrit un pudding rond, couvert de raisins secs, qui ronronnait comme un chat. Elle lui donna une goutte de lait dans une soucoupe. Il cessa de miauler et se mit à chanter *Vive le vent* d’une voix de baryton.

La cinquième enveloppe était destinée à **rennes.en.vacances@ecuries.example**. « Nous avons réservé une semaine au soleil, mais le calendrier indique le 24 décembre. Quelqu’un peut-il expliquer aux rennes qu’ils ont posé leurs vacances le soir le plus chargé de l’année ? »

— Ils ont peut-être besoin d’un peu de repos, dit la grand-mère.

La boîte tinta de nouveau. Noémie lut la sixième adresse : **la.lune@ciel-nocturne.example**. Le mot, écrit d’une encre argentée, disait : « Chers voyageurs, merci de ne pas stationner le traîneau sur mon cratère préféré. J’y garde mes rêves du mardi. »

— Il faudra prendre une autre route, dit Noémie.

Sa grand-mère hocha la tête, comme si c’était une demande tout à fait ordinaire.

Une septième enveloppe apparut : **sapin.susceptible@foret.example**. « Je vous prie de cesser de m’utiliser comme rond-point. La semaine dernière, trois étoiles filantes m’ont demandé leur chemin et sont reparties dans la mauvaise direction. » Noémie sourit et nota sur le billet : « Promis. On passera au-dessus de la cime. »

La huitième lettre, adressée à **facteur.bonhomme@neige.example**, annonçait : « Le bonhomme de neige du village a perdu son nez. Il l’a échangé contre une carotte au marché, mais il regrette son choix : il ne peut plus sentir les chocolats chauds. » Noémie prit une carotte dans le panier des légumes et la glissa dans la boîte. En échange, un petit nez de carotte apparut sur son bureau.

Puis vint la neuvième adresse : **etoile.du.sapin@hautduplafond.example**. « Je suis trop basse de trois centimètres. Quelqu’un peut-il me hisser sans réveiller les boules en verre ? Elles se croient déjà danseuses étoile. »

Noémie leva les yeux vers la pointe du sapin. L’étoile du sommet tremblait, comme si elle avait entendu. Sa grand-mère alla chercher un escabeau, mais la dixième enveloppe se posa sur la marche supérieure. Elle portait l’adresse **escabeau.volant@grange.example**. « Je suis parti livrer une botte de foin à un cheval qui éternue des paillettes. Je reviens dès que j’ai fini. »

— Même l’escabeau a des aventures, remarqua Noémie.

La porte s’ouvrit brusquement. Le Père Noël entra, couvert de neige, tenant une botte de foin sous le bras.

— Bonsoir ! Je cherche un escabeau, un pudding qui chante, une ampoule pour le nez de Rodolphe et, si possible, quelqu’un qui sait où se trouve le nord.

La boîte s’agita. Une onzième enveloppe en sortit, adressée à **pere.noel@atelier.des.reves.example**. Noémie l’ouvrit et lut : « Cher Père Noël, vous êtes dans la bonne maison. Le nord est par la fenêtre, juste au-dessus du toit bleu. Votre escabeau devrait revenir dans deux minutes. N’oubliez pas votre sac : il est dans la salle des fêtes, derrière le sapin. »

— Qui a écrit ça ? demanda le Père Noël.

— La boîte, répondit Noémie.

Comme pour confirmer, le couvercle se referma avec un *ploc* satisfait. Au même instant, l’escabeau réapparut devant la porte, tout poussiéreux, mais accompagné d’un cheval miniature qui éternua une pluie de paillettes.

Le Père Noël installa l’étoile au sommet du sapin. Elle se mit à briller si fort que toute la place fut éclairée, et les flocons tournoyèrent autour de la salle des fêtes comme des danseurs.

Avant de repartir, il tendit à Noémie une enveloppe. Son adresse était écrite dessus : **noemie.etincelle@floconville.example**.

Elle l’ouvrit. À l’intérieur, il n’y avait qu’un mot : « Pour les fêtes, le plus beau cadeau est parfois une lettre envoyée au bon endroit. »

Dehors, le traîneau s’éleva dans le ciel. La lune lui céda le passage, les rennes trouvèrent enfin le nord, et le pudding miaula une dernière fois pour dire au revoir.

Noémie rangea la boîte sous le sapin. Le lendemain, elle serait vide. Pourtant, chaque Noël, elle réapparaîtrait avec une nouvelle pile d’enveloppes, et toujours une adresse un peu plus improbable que la précédente.
"""
;;; Code:


(eros-mode)
;; Extracting emails from text

(defun re-seq (regexp)
  "Retourne une liste de toutes les correspondances de la `REGEXP'."
  (let ((matches ))
    (save-excursion
      (save-restriction
        (widen)
        (goto-char 1)
        (while (search-forward-regexp regexp nil t 1)
          (push (match-string-no-properties 0) matches)
          ))
      )
    matches
    )
  )

(defvar email-regex "[a-zA-Z0-9_\.-]+@[a-zA-Z0-9_\.-]+\.[a-zA-Z]+"
  "Expression réguliere très naive pour détecter les adresses emails.")

(defun extract-emails ()
  "Retourne la liste des emails trouvés dans le document courant."
  (interactive)
  (let ((addresses (re-seq email-regex))
        )
    addresses
    )
  )

(extract-emails)

(defun insert-emails (str)
  "Insère les emails trouvés plus haut dans le buffer courant préfixés de la chaine `STR' entrée en interactif."
  (interactive "s")
  (mapcar (lambda (x) (insert str x "\n")) (extract-emails))
  )

;; M-x insert-emails avec ";; " en parametre.

;; noemie.etincelle@floconville.example
;; pere.noel@atelier.des.reves.example
;; escabeau.volant@grange.example
;; etoile.du.sapin@hautduplafond.example
;; facteur.bonhomme@neige.example
;; sapin.susceptible@foret.example
;; la.lune@ciel-nocturne.example
;; rennes.en.vacances@ecuries.example
;; mere.noel@cuisinepolaire.example
;; pistache.lutin@atelier.example
;; rudolphe.veilleuse@nezrouge.example
;; flocon.pilote@traineau.example
 
;;; Email.el ends here
