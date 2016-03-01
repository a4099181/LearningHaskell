{- |
Module      :  $Header$
Description :  Light switch.
Copyright   :  (c) seb!
License     :  MIT

Maintainer  :  sebi|at|sebi.one.pl
Stability   :  experimental
Portability :  portable
-}
module Data.LightSwitch (LightSwitch(..), getDefaultLightSwitch, switch) where

import           Control.Monad.State (State, get, put, runState)
import           Data.Domain.Event (Event(Switched))
import           Data.Tuple (swap)

-- | Describes stateful light switch.
data LightSwitch = SwitchClosed
                 | SwitchOpened
  deriving (Eq, Show)

-- | Gets closed light switch.
getDefaultLightSwitch :: LightSwitch
getDefaultLightSwitch = SwitchClosed

-- | It switches the light switch state (close - open - close).
switch :: LightSwitch -> (LightSwitch, Event)
switch lightSwitch = swap $ runState switchState lightSwitch

switchState :: State LightSwitch Event
switchState = do
  lightSwitch <- get
  case lightSwitch of
    SwitchClosed -> put SwitchOpened
    SwitchOpened -> put SwitchClosed
  return Switched
