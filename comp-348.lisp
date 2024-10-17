(declaim (optimize (debug 3)))

;; linked list
(list 1 2 3 4 5)

;; Core functions

(defvar my-list (list 1 2 3 4 5))

(car my-list) ; list[0]
(cdr my-list) ; list[1:]

(cons 1 (list 2 3 4 5))

(defun list-identity (list)
  (if (null list)
      ()
      (cons (car list) (list-identity (cdr list)))))

;; adding constant value to every member of the list
(defun list-add-constant (list constant)
  (if (null list)
      ()
      (cons (+ (car list) constant)
            (list-add-constant (cdr list) constant))))

;; Trees

(defvar mytree '(7 (1 nil (2 nil nil)) (8 nil (9 nil nil))))

#|
    7
  /   \
 1     8
/ \   / \
   2     9
  / \   / \
|#

(defun binary-search (list element)
  (cond
    ;; If the subtree is empty, return false
    ((null list) nil)
    ;; If the head is equal to what we're searching for, return true
    ((equal (car list) element) t)
    ;; If the head is greater than the element, binary search the left subtree
    ((> (car list) element)
     (binary-search (second list) element))
    ;; If the head is less than the element, binary search the right subtree
    ((< (car list) element)
     (binary-search (third list) element))))

;; Tree Traversals

(defun in-order-traversal (tree)
  (cond
    ((null tree) nil)  ;; Base case: If the tree is empty, do nothing.
    (t
     (in-order-traversal (second tree))   ;; Traverse the left subtree
     (format t "~a " (first tree))        ;; Visit the root node
     (in-order-traversal (third tree))))) ;; Traverse the right subtree

(in-order-traversal mytree)


;; Declaring top-level variables

;; defvar for creating variables that are outside of function scope

(defvar sym 'hello)
(defvar num 20)
(defvar str "Hello lisp")
(defvar lst '(hello 20 "hello world"))

;; locally-scoped variables 

(let ((sym 'hello)
      (num 20)
      (str "Hello world")
      (lst '(hello 20 "hello world")))
      (format t "Values: ~s, ~d, ~s, ~a" sym num str lst))

(print "None of those variables are visible here")

(let* ((sym 'hello)
       (num 20)
       (str "Hello world")
       (lst (list sym num str))) ; No need to declare here
    (format t "Values: ~s, ~d ~s, ~a" sym num str lst)
(print "None of those variable are visinle here"))


(set 'x 10)
(defvar x)
(setq x 10)

;; you can use setf for the values inside the list

(let ((x 10) (y 20))
    (setq x 20)
    (setf y 30)
    (print x)
    (print y))

(defvar lst '(1 2 3 4 5))
(setf (car lst) 10)
(setf (car lst) 10)
(print lst)


(let ((c 1))
  (let ((c 2)
        (a (+ c 1)))
    a)); RETURNS 2

;; second variable shadows due to let*
(let ((c 1))
  (let* ((c 2)
         (a (+ c 1)))
    a))

(let ((c 1))
  (let* ((c 2))
    (setf c 20)
    (print c))
    (format t "Prints: ~d" c)
  (print c))


;; debug
;; buggy on purpose

(defun sum (list)
  (if (null list)
    0
    (+ (car list) (sum (cdr list)))))

(trace sum)
(sum '(1 2 3 4 5))

;(step (sum '(1 2 3 4 5)))


(makunbound 'lst)  ;; Unbind lst
(defvar lst '(1 2 3 4 5 6 7))  ;; Redefine lst
(print lst)  ;; Should print (1 2 3 4 5 6 7)

(setf lst '(1 3 4 5))  ;; Modify lst
(print lst)  ;; Should print (1 3 4 5)

(defun func-name (a b &optional c d)
  (print a)
  (print b)
  (print c)
  (print d))


(func-name 1 2 3) ;; 1 2 3 nil

(defun function-name (a &optional (b 2))
  (print a)
  (print b)
)

(function-name 1 3) ;; 1 3

;; keyword parameters must be passed explicityly

(defun functwo (a b &key c d)
  (print a)
  (print b)
  (print c)
  (print d))

(functwo 1 2 :c 3) ;; 1 2 3 nil

(defun functhree (a b &rest rest-args)
  (print a)
  (print rest-args))


(defun function-four (a &optional b &rest c)
  (print a)
  (print b)
  (print c))


;; namespaces

(let ((list '("abc" 14 25)))
  (print list) ;; outputs defined list
  (print (list)))  ;; will call list function with no parameters ()

