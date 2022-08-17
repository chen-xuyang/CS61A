(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  'YOUR-CODE-HERE
  (car (cdr s))
)

(define (caddr s)
  'YOUR-CODE-HERE
  (car (cddr s))
)


(define (sign num)
  'YOUR-CODE-HERE
  (cond ((< 0 num) 1)
        ((= 0 num) 0)
        ((> 0 num) -1))
)


(define (square x) (* x x))

(define (pow x y)
  'YOUR-CODE-HERE
  (if (< 0 y)
      (begin
          (define a (pow x (quotient y 2)))
          (if (even? y)
              (square a)
              (* x (square a)))
      )
      1
  )
)

