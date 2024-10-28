(require 'asdf)
(require 'uiop)

;; (defun name (params) body)
;; (lambda (params) body) ; anonymous function

;; (if test then else)
;; (when test &body)
;; (unles test &body)

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

;; :initarg for initialization
;; :accessor creates get/set methods

(defclass user ()
    ((name :initarg :name :accessor user-name)
     (age :initarg :age :accessor user-age)))

(defvar *john* (make-instance 'user :name "John" :age 25))

(defmethod greet ((u user))
    (format nil "Hello, ~a!" (user-name u)))

(greet *john*) 

;; quote is for constants, list for computed values

(car `(1 2 3)) ; first element
(cdr `(1 2 3)) ; rest of the list
(cons 1 `(2 3))

(defun sum-list-recursive (lst)
    (if (null lst)
        0
        (+ (car lst) (sum-list-recursive (cdr lst)))))

(defun sum-list-iterative (lst)
    (loop for x in lst sum x))

;; define a stack 

;; clos initialization with :initform
(defclass stack()
    ((elements :initform nil :accessor stack-elements)))

(defmethod push-element ((s stack) elem)
    (push elem (stack-elements s)))

;; Usage:
(defvar *stack1* (make-instance 'stack))  ; elements starts as nil
(push-element *stack1* 10)
(push-element *stack1* 40)
(push-element *stack1* 30)
(stack-elements *stack1*) 


;; returns done
(dolist (x '(1 2 3) 'done)
    (print x))

(let ((x 10))
    (setf x 20)
    (setf x (+ x 1)))  ;x = 20


(let ((x 5))
  (defun get-x () x)
  (let ((x 10)) ; bound x to 10 in inner let
    (get-x)))  ; returns 5


(mapcar #'1+ '(1 2 3)) ; =: ( 2 3 4) non-descructive

(mapcan (lambda (x) (if (evenp x) (list x))) '(1 2 3 4 5 6))
