module Main where


-------------------------------------------------------------
data BStree = BNil | Node { value :: Int 
						  , bstl :: BStree
						  , bstr :: BStree
						  }  deriving (Show, Eq)
--Interp. Binary search tree

empty_tree :: BStree
empty_tree = BNil


-------------------------------------------------------------
--function which do binary search tree from list
genBStree :: [Int] -> BStree
genBStree [] = BNil
genBStree (x:xs) = Node x (genBStree (filter (<x) xs))
                          (genBStree (filter (>x) xs))


-------------------------------------------------------------
--finding high of binary search tree
high_of_bstree :: BStree -> Int
high_of_bstree bst = let 
                        go bst' count = if bst' /= empty_tree 
                                            then go (bstl bst') count+1
                                        else count
                     in go bst (if bst /= empty_tree then 1 else 0)


-------------------------------------------------------------
--getting sum of elements of binary search tree
sum_elem :: BStree -> Int
sum_elem bst = let
                  go bst' sum = if bst' /= empty_tree
                                    then (value bst') + go (bstl bst') 0 + go (bstr bst') 0
                                else sum
               in go bst 0

-------------------------------------------------------------
--finding element in binary search tree
find_elem :: BStree -> Int -> String
find_elem bst elem = let
                        go bst' res = if (value bst') == elem
                                          then (res ++ show (value bst'))
                                      else
                                          if elem < (value bst')
                                              then go (bstl bst') (res ++ show (value bst') ++ ", Left ")
                                          else
                                              go (bstr bst') (res ++ show (value bst') ++ ", Right ")
											  
                     in go bst "root "




main = print(find_elem (genBStree [7,2,4,8]) 4)
