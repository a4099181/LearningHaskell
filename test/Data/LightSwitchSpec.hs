module Data.LightSwitchSpec (spec) where

import           Test.Hspec
import           Data.LightSwitch
import           Control.Monad.State

spec :: Spec
spec = do
  describe "getDefaultLightSwitch" $ do
    it "always returns closed switch" $ do
      execState getDefaultLightSwitch SwitchClosed `shouldBe` SwitchClosed
      execState getDefaultLightSwitch SwitchOpened `shouldBe` SwitchClosed

  describe "when defaultLightSwitch switches" $ do
    it "returns opened switch" $ do
      execState switch (execState getDefaultLightSwitch SwitchOpened) `shouldBe` SwitchOpened

  describe "when closed switch switches" $ do
    it "returns opened switch" $ do
      execState switch SwitchClosed `shouldBe` SwitchOpened

  describe "when opened switch switches" $ do
    it "returns closed switch" $ do
      execState switch SwitchOpened `shouldBe` SwitchClosed
