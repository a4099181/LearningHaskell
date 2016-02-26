module Data.LightSwitch (getDefaultLightSwitch) where

data LightSwitch = SwitchClosed | SwitchOpened deriving (Show)

getDefaultLightSwitch :: LightSwitch
getDefaultLightSwitch = SwitchClosed
