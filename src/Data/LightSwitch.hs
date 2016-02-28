module Data.LightSwitch (LightSwitch(..), getDefaultLightSwitch, switch) where

import           Control.Monad.State

data LightSwitch = SwitchClosed
                 | SwitchOpened
  deriving (Eq, Show)

getDefaultLightSwitch :: State LightSwitch ()
getDefaultLightSwitch = do
  put SwitchClosed

switch :: State LightSwitch ()
switch = do
  lightSwitch <- get
  case lightSwitch of
    SwitchClosed -> put SwitchOpened
    SwitchOpened -> put SwitchClosed
