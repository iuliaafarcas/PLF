A. The following function definition in LISP is given
(DEFUN F(L)
(COND
((NULL L) 0)
((> (F (CAR L)) 2) (+ (CAR L) (F (CDR L))))
(T (F (CAR L)))
)
)

Rewrite the definition in order to avoid the double recursive call (F (CAR L)). Do NOT redefine
the function. Do NOT use SET, SETQ, SETF. Justify your answer.

------------------------------------------------------
(DEFUN F(L)
  ( 
    ( LAMBDA (V)
         (COND
            ((NULL L) 0)
            ((> V 2) (+ (CAR L) (F (CDR L))))
            (T V)
         )
    )
    (F (CAR L))

  )
)

--------------------------------------------------------

