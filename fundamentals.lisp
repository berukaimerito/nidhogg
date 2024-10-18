(require 'asdf)
(require 'uiop)

(defun make-cube (col)
    (mapcar (lambda (x) (expt x 3)) col))

(make-cube '(1 2 3 4))

(defun hello ()
    "say hello to USER"
    (format t "hello ~a%" (uiop:getenv "USER")))

(hello)

(defun stdio (string-like)
    (format t "~a~%" string-like))

(stdio 23249)

(defun math-low (x y z)
    (let ((res (+ x z)))
    (- y res)))


(math-low 2 7 3) ;; should return 2


(defun fibonacci (n)
    (if (<= n 1)   
    n 
    (+ (fibonacci (- n 1))
       (fibonacci (- n 2)))))
    
(defun print-fibonacci-sequence (n)
    (dotimes (i (+ n 1))
        (format t "~a " (fibonacci i))))

        
(print-fibonacci-sequence 7)