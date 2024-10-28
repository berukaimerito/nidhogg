;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname fun-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WIDTH 400) ; 
(define HEIGHT 600)

( * WIDTH HEIGHT)

(define FOO ( * 2 3))
(define BAR ( * FOO 2))
(* FOO BAR)

; first evaluation step is (define FOO 6)

(define (bulb c)
  (circle 40 "solid" c))

(above (bulb "red") (bulb "yellow") (bulb "green"))

(define (pythag a b)
  (sqrt (+ (sqr a) (sqr b))))

(= 1 1)

(> 3 9)

(string=? "foo" "f0o")

(define T1 (rectangle 10 20 "solid" "red"))
(define T2 (rectangle 20 10 "solid" "blue"))

(if (< (image-width T1)
   (image-width T2))
    "tall"
    "wide")
