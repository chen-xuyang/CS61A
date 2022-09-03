(define (filter-lst fn lst)
  (if (null? lst)
      ()
      (if (null? (cdr lst))
          (if (fn (car lst))
              (cons (car lst) ())
              ()
          )
          (if (fn (car lst))
              (cons (car lst) (filter-lst fn (cdr lst)))
              (filter-lst fn (cdr lst))
          )
      )
  )
)

; ;; Tests
(define (even? x) (= (modulo x 2) 0))

(filter-lst even? '(0 1 1 2 3 5 8))

; expect (0 2 8)
(define (interleave first second)
  (if (null? first)
      second
      (if (null? second)
          first
          (cons (car first) (interleave second (cdr first)))
      )
  )
)

(interleave (list 1 3 5) (list 2 4 6))

; expect (1 2 3 4 5 6)
(interleave (list 1 3 5) nil)

; expect (1 3 5)
(interleave (list 1 3 5) (list 2 4))

; expect (1 2 3 4 5)
(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n)
                (accumulate combiner start (- n 1) term)
      )
  )
)

(define (no-repeats lst)
  (if (null? lst)
      ()
      (begin (define x (car lst))
             (cons x
                   (no-repeats
                    (filter (lambda (t) (not (= x t))) lst)
                   )
             )
      )
  )
)

(no-repeats (list 5 4 5 4 2 2))
; expect (5 4 2)