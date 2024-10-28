;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname strings-imgs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(string-append "Ada" " " "Lovelace")

(string-length "Maxwell")

(substring "Canbera" 2 4) ; from 3 until 5. exclusive range

(substring "01234567" 2 4)

(string-append "9876" (substring "0123456789" 5 10))

(substring "Caribou" 0 3)

(circle 10 "solid" "red") ; cool

(rectangle 30 45 "outline" "blue")

(text "hello" 24 "orange") ; produces of an image of the string

(overlay (circle 10 "solid" "red")
       (circle 20 "solid" "orange")
       (circle 30 "solid" "green")
       (circle 40 "solid" "blue"))  ; above is a like string-append for images

(overlay (text "STOP" 48 "white")
         (regular-polygon 60 8 "solid" "red"))



(beside (square 20 "outline" "blue")
        (above (circle 15 "solid" "red")
               (triangle 20 "solid" "green")))
