# needed in order to do string replacement
String.prototype.format = ->
  args = arguments
  return this.replace /{(\d+)}/g, (match, number) ->
    return if typeof args[number] isnt 'undefined' then args[number] else match

OskarTexts =
  statusText:
    '1': 'pas bien du tout'
    '2': 'un peu triste'
    '3': 'bien'
    '4': 'super bien'
    '5': 'merveilleusement bien'

  introduction: "Salut {0} ! Permets-moi de me présenter rapidement.\nJe m\'appelle Oskar et j\'ai atterri ici parce qu\'ARIS m\'a embauché pour être son coach en bien-être sur Slack. Ne t\'inquiète pas, je ne t\'embêterai pas souvent... Juste deux fois par jour, en général ! Bon, maintenant, je vais te demander comment tu te sens. Prêt·e ? *Réponds juste à ce message que je t\'explique la suite* :smile:"

  firstMessage: "Super ! À partir de maintenant, je viendrai te faire un petit coucou de temps en temps pour te demander comment tu vas. Et tu n\'auras qu\'à me répondre avec un chiffre entre 1 et 5 !\n\nJe suis un écureuil un peu bavard donc je dois te prévenir que, comme avec les noisettes, je fais des provisions : je garderai tes réponses quelque part en mémoire et je me permettrai de les partager avec tes collègues.\n\nAllez, on essaye ? *Comment te sens-tu là, tout de suite ?*\n
          (5) :heart_eyes: Merveilleusement bien\n
          (4) :smile: Super bien\n
          (3) :slightly_smiling_face: Bien\n
          (2) :pensive: Un peu triste\n
          (1) :sob: Pas bien du tout\n"

  firstMessageSuccess: "C\'était facile, non ? :smile: Bon, je dois m\'éclipser, tes collègues m\'attendent ! Je reviendrai te voir demain, ou dans quelques heures si tu me manques déjà." # todo: is now afternoon or next day"

  firstMessageFailure: "Oups, j\'ai bien l\'impression que tu essayes de me dire comment tu te sens mais j\'ai encore un peu de mal avec le français ou la LSF... Je m\'en sors mieux avec les chiffres entre 1 et 5. Tu veux bien réessayer pour moi ? :grin:"

  requestFeedback:
    random: [
      "Salut {0} ! Comment tu te sens ? Donne-moi un petit chiffre à partager avec tes collègues.\n",
      "Hello ! C\'est re-moi ! Je voulais juste voir comment ça allait. Envie de partager ton humeur avec nous ?\n",
      "Content de te voir, {0} ! Envie de nous dire comment tu te sens ? Un chiffre entre 1 et 5 me suffira !\n"
    ]
    selection: "(5) :heart_eyes: Merveilleusement bien\n
                (4) :smile: Super bien\n
                (3) :slightly_smiling_face: Bien\n
                (2) :pensive: Un peu triste\n
                (1) :sob: Pas bien du tout\n"
    options: [
      "Tu as peut-être raté mon dernier message... Ça bouge tout le temps à l\'ARIS ! J\'aimerais vraiment savoir si tout va bien pour toi. Ça ne t\'ennuierait pas de me le dire ?"
      "Hey ! On dirait qu\'on s\'est ratés la dernière fois. C\'est un peu la folie à l\'ARIS aujourd\'hui ! Allez, un chiffre entre 1 et 5 et je m\'en vais, parole d\'écureuil ! :smile:"
    ]

  faq: "On dirait que tu as besoin d\'aide, non ? Tu peux aller voir *Antony* ou la <http://oskar.herokuapp.com/faq|FAQ Oskar>"

  revealChannelStatus:
    error: "*{0}* n\'a pas encore partagé son état."
    status: "*{0}* se sent *{1}/5*"
    message: "\n>\"{0}\""

  revealUserStatus:
    error: "Attends, je vérifie... Hum, on dirait que je n\'ai pas eu de nouvelles de {0} depuis un petit moment. Désolé !"
    status: "*{0}* se sent *{1}/5*"
    message: "\n>\"{0}\""

  newUserFeedback: "*{0}* se sent *{1}/5*\n>\"{2}\""

  alreadySubmitted: [
    "On dirait que tu m\'as déjà dit comment tu te sentais il n\'y a pas si longtemps... On en reparle un peu plus tard ! :wink:",
    "Oh, coucou ! Tu m\'as déjà donné ton humeur dans les 4 dernières heures... On attend encore un peu et on en rediscute ? :smile:",
    "Doucement, gourmand·e ! Je sais que tu adores nos petits jeux de chiffres, mais attendons un peu avant de rejouer ensemble :wink: Promis, je te ferai signe d\'ici quelques heures !"
  ]

  invalidInput: [
    "Euh, je ne suis pas sûr de ce que tu veux dire... Le français et la LSF, c\'est encore nouveau pour moi, tu sais ? Ça t\'ennuierait de passer par un chiffre entre 1 et 5 ? :kissing_heart:",
    "Je pourrais faire semblant, mais je vais être honnête : je ne comprends ni le français, ni la LSF... :sweat_smile: Tu me traduis ça par un chiffre entre 1 et 5 ?",
    "J\'aimerais vraiment comprendre tout ce que tu me dis, mais j\'attends encore ma PPS pour pouvoir suivre des cours de français et de LSF... En attendant, ça te va si on passe par des chiffres entre 1 à 5 ? :sweat_smile:"
  ]

  lowFeedback: [
    "Ça craint ! J\'espérais vraiment que tu choisirais une autre réponse... *Est-ce que je peux faire quelque chose ? Qu\'est-ce que je peux dire à tes collègues ?*",
    "Oh mince ! :worried: Je passe pas une super journée non plus, si ça peut te réconforter... :sob: *Tu veux m\'en dire plus ?* Peut-être qu\'un·e de tes collègues pourrait t\'aider...",
    "Awww :disappointed: Je n\'aime pas quand un·e ami·e vit un moment difficile... *Tu veux nous dire ce qui t\'arrives ?* "
  ]

  averageFeedback: [
    "Ça marche ! Allez, je te laisse : tu as de belles choses à accomplir ! *Si tu veux partager quelque chose avec tes collègues, n\'hésite pas à l\'écrire maintenant. Sinon, passe une bonne journéeeeeee !* :sunny:",
    "Bon courage pour le boulot ! *Si tu veux en dire plus sur ton humeur à tes collègues, n\'hésite pas.*",
    "Entendu ! Je t\'envoie plein de courage ! *Si tu as envie d\'en dire plus sur ton humeur, n\'hésite pas!*"
  ]

  highFeedback: [
    ":trophy: On a un vainqueur ! Je suis ravi de lire ça. *Pourquoi ne pas écrire un petit message pour dire à tes collègues pourquoi tu te sens si bien ?*",
    ":thumbsup: Hé, mais tu es _on fire_ :fire: aujourd\'hui ! *Tu veux en dire plus à tes collègues ?*",
    "Ah, j\'adore quand les gens sont d\'humeur exceptionnelle ! :clap::skin-tone-2: *Veux-tu dire à tes collègues ce qui te met de si bonne humeur ?*"
  ]

  # feedback already received
  feedbackReceived: [
    "Merci, très cher·e ! Continue à travailler comme ça, tout le monde adore ce que tu fais pour l\'ARIS !",
    "C\'est noté, champion·ne ! Merci pour ta réponse et bonne journée à l\'ARIS !",
    "Super, ça m\'aide beaucoup ! Plein de bonnes ondes pour ta journée à l\'ARIS !"
  ]

  # feedback received
  feedbackMessageReceived: [
    "Merci de m\'en avoir parlé ! :wink: On se revoit plus tard avec plaisir !",
    "Merci pour ta franchise ! On se reparle dans quelques heures.",
    "Compris ! Je me suis permis d\'en toucher un mot à tes collègues :wink:"
  ]

module.exports = OskarTexts
