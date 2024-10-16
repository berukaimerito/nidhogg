(require 'asdf)
(require 'uiop)

(defun make-sqr (col)
    (mapcar (lambda (x) (expt x 3)) col))

(make-sqr '(1 2 3 4))

(defun hello ()
    "say hello to USER"
    (format t "hello ~a" (uiop:getenv "USER")))

(hello)