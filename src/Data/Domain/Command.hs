{- |
Module      :  $Header$
Description :  This applicaton domain command.
Copyright   :  (c) seb!
License     :  MIT

Maintainer  :  sebi|at|sebi.one.pl
Stability   :  experimental
Portability :  portable
-}
module Data.Domain.Command (Command(..), getCommand) where

-- | Command executable by this domain.
data Command = Switch
             | Exit
  deriving (Eq, Show)

-- | Recognizes command from user input.
getCommand :: Char -> Maybe Command
getCommand input
  | input `elem` [fst t | t <- knownCommands] = Just $ (snd . head) [t | t <- knownCommands
                                                                       , fst t == input]
  | otherwise = Nothing

knownCommands :: [(Char, Command)]
knownCommands = [('q', Exit), ('s', Switch)]
