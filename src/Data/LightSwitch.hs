module Data.LightSwitch ( 

    LightSwitch(..)

    , getDefaultLightSwitch
    , switch 

) where

data LightSwitch      =  SwitchClosed | SwitchOpened 
    deriving (Eq, Show)

getDefaultLightSwitch :: LightSwitch
getDefaultLightSwitch =       SwitchClosed

switch                :: LightSwitch -> LightSwitch
switch SwitchClosed   =       SwitchOpened
switch SwitchOpened   =       SwitchClosed
