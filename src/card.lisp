(defvar *ranks* '(ace two three four five six seven eight nine ten jack queen king))
(defvar *suits* '(spade club diamond heart))

(defclass playing-card ()
  ((rank
    :initarg :rank
    :reader rank
    :documentation "The card's rank, a member of {ace, two, ..., king}.")
   (suit
    :initarg :suit
    :reader suit
    :documentation "The card's suit, a member of {spade, club, diamond, heart}.")
   (color
    :reader color
    :documentation "The card's color, a member of {black, red}."))
  (:documentation "A card of the playing variety."))

(defmethod initialize-instance :after ((card playing-card) &key)
  "Sets the color of the card based on its suit."
  (let ((suit (suit card)))
    (setf (slot-value card 'color)
          (cond ((or (eql suit 'spade) (eql suit 'club)) 'black)
                ((or (eql suit 'heart) (eql suit 'diamond)) 'red)))))

(defun make-deck ()
  "Makes an unshuffled vector of the 52 standard playing cards."
  (let* ((num-cards (* (length *suits*) (length *ranks*)))
         (deck (make-array num-cards :fill-pointer 0)))
    (dolist (suit *suits*)
      (dolist (rank *ranks*)
        (vector-push (make-instance 'playing-card :rank rank :suit suit) deck)))
    deck))
