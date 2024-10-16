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

(7 (1 nil
    (2 nil nil))
    (8 nil 
    (9 nil nil)))

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
        ; if the subtree is empty, return false
        ((null list) list)
        ; If the head is equal to what we're search for, return true
        ((equal (car list) element) t)
        ; If the head is greater than the element, binary search the left subtr
        ((> (car list ) element)
            (binary-search (second list) element))
            ; If the head is less than the element, binary search the right subtr
            ((< (car list) element)
                (binary-search (third list) element))))
    ))

;; Tree Traversals