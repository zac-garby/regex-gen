data Regex a
    = Empty
    | Item a
    | Concat (Regex a) (Regex a)
    | Alternate (Regex a) (Regex a)
    | Kleene (Regex a)
    deriving Eq

instance Show a => Show (Regex a) where
    show Empty = "ε"
    show (Item a) = show a
    show (Concat a b) = "(" ++ show a ++ show b ++ ")"
    show (Alternate a b) = "(" ++ show a ++ "|" ++ show b ++ ")"
    show (Kleene r) = show r ++ "*"

set :: (Eq a) => Regex a -> [[a]]
set Empty = []
set (Item a) = [[a]]
set (Concat a b) = (++) <$> set a <*> set b
set (Alternate a b) = set a ++ set b
set (Kleene a) = set a ++ set (Concat a (Kleene a))
