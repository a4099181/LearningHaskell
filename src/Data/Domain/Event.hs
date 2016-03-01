{- |
Module      :  $Header$
Description :  Domain events.
Copyright   :  (c) seb!
License     :  MIT

Maintainer  :  sebi|at|sebi.one.pl
Stability   :  experimental
Portability :  portable
-}
module Data.Domain.Event (Event(..)) where

-- | Specifies all domain events that may occure in this domain.
data Event = Finished
           | Started
           | Switched
  deriving (Eq, Show)
