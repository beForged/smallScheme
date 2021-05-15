module Types where

data Sexp
	= Expr Expr
	| Num Int
	| Boolean Bool
	| Empty

data Expr	
	= Unary Unary
	| Binary Binary
	| If Sexp Sexp Sexp
	| Let Id Sexp
	| Letrec [(Id, Sexp)] Sexp
	| Lambda [Id] Sexp
	| Quote Sexp

data Unary	
	= IsZero Sexp
	| IsEmpty Sexp
	| Box Sexp
	| Unbox Sexp
	| Car Sexp
	| Cdr Sexp
	
data Binary	
	= Plus Sexp Sexp
	| Minus Sexp Sexp
	| Eq Sexp Sexp
	| Cons Sexp Sexp

type Id	= String
