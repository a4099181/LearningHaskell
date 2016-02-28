module Data.LightSwitchSpec (spec) where

import           Test.Hspec
import           Data.LightSwitch
import           Control.Monad.State

spec :: Spec
spec = do
  describe "getDefaultLightSwitch" $ do
    it "returns closed switch" $ do
      getDefaultLightSwitch `shouldBe` SwitchClosed

  describe "when defaultLightSwitch switches" $ do
    it "returns opened switch" $ do
      execState switch getDefaultLightSwitch `shouldBe` SwitchOpened

  describe "when closed switch switches" $ do
    it "returns opened switch" $ do
      execState switch SwitchClosed `shouldBe` SwitchOpened

  describe "when opened switch switches" $ do
    it "returns closed switch" $ do
      execState switch SwitchOpened `shouldBe` SwitchClosed
