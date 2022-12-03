(defvar *ranks* '('ace 'two 'three 'four 'five 'six 'seven 'eight 'nine 'ten 'jack 'queen 'king))
(defvar *suits* '('spade 'club 'diamond 'heart))

(defclass playing-card ()
  ((rank
    :initarg :rank
    :reader rank
    :documentation "The card's rank, a member of {'ace, 'two, ..., 'king}.")
   (suit
    :initarg :suit
    :reader suit
    :documentation "The card's suit, a member of {'spade, 'club, 'diamond, 'heart}."))
  (:documentation "A card of the playing variety."))

(defun make-deck ()
  (let* ((num-cards (* (length *suits*) (length *ranks*)))
         (deck (make-array num-cards :fill-pointer 0)))
    (dolist (suit *suits*)
      (dolist (rank *ranks*)
        (vector-push (make-instance 'playing-card :rank rank :suit suit) deck)))
    deck))
