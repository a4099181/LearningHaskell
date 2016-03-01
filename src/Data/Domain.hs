{- |
Module      :  $Header$
Description :  This applicaton domain.
Copyright   :  (c) seb!
License     :  MIT

Maintainer  :  sebi|at|sebi.one.pl
Stability   :  experimental
Portability :  portable
-}
module Data.Domain (Domain, invokeCommand, getDefaultDomain) where

import           Data.Domain.Command (Command(Exit, Switch))
import           Data.Domain.Event (Event(Finished))
import           Data.LightSwitch (LightSwitch, getDefaultLightSwitch, switch)

-- | This application domain.
data Domain = Domain LightSwitch
  deriving (Show)

-- | Gets default domain
getDefaultDomain :: Domain
getDefaultDomain = Domain getDefaultLightSwitch

-- | Invokes command passed into domain.
invokeCommand :: Domain -> Command -> IO (Domain, Event)
invokeCommand domain Switch = do
  let (l, e) = (switch . getLightSwitch) domain
  return (Domain l, e)
invokeCommand domain Exit = do
  return (domain, Finished)

getLightSwitch :: Domain -> LightSwitch
getLightSwitch (Domain l) = l
