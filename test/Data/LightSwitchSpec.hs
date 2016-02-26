module Data.LightSwitchSpec (spec) where

import Test.Hspec
import Data.LightSwitch 

spec :: Spec
spec = do

    describe "getDefaultLightSwitch" $ do
        it "returns closed switch" $ do
            getDefaultLightSwitch `shouldBe` SwitchClosed

    describe "when defaultLightSwitch switches" $ do
        it "returns opened switch" $ do
            switch getDefaultLightSwitch `shouldBe` SwitchOpened

    describe "when closed switch switches" $ do
        it "returns opened switch" $ do
            switch SwitchClosed `shouldBe` SwitchOpened

    describe "when opened switch switches" $ do
        it "returns closed switch" $ do
            switch SwitchOpened `shouldBe` SwitchClosed
