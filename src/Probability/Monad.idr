module Probability.Monad


%default total

%access export

infixr 6 >=>
(>=>) : Monad m => (a -> m b) -> (b -> m c) -> a -> m c
f >=> g = (>>= g) . f

infixl 6 <=<
(<=<) : Monad m => (b -> m c) -> (a -> m b) -> a -> m c
(<=<) = flip (>=>)


sequ : Monad m => List (a -> m a) -> a -> m a
sequ = foldl (>=>) pure


perform : Monad m => Nat -> (a -> m a) -> a -> m a
perform n g = sequ $ replicate n g
