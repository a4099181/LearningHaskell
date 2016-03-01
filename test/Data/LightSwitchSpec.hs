module Data.LightSwitchSpec (spec) where

import           Data.Domain.Event (Event(Switched))
import           Data.LightSwitch (LightSwitch(SwitchOpened, SwitchClosed), getDefaultLightSwitch,
                                   switch)
import           Test.Hspec

spec :: Spec
spec = do
  describe "getDefaultLightSwitch" $ do
    it "returns closed switch" $ do
      getDefaultLightSwitch `shouldBe` SwitchClosed

  describe "when defaultLightSwitch switches" $ do
    it "should switch to opened state" $ do
      (fst . switch) getDefaultLightSwitch `shouldBe` SwitchOpened

  describe "when closed switch switches" $ do
    it "should switch to opened state" $ do
      (fst . switch) SwitchClosed `shouldBe` SwitchOpened

  describe "when opened switch switches" $ do
    it "should switch to closed state" $ do
      (fst . switch) SwitchOpened `shouldBe` SwitchClosed

  describe "when opened switch switches" $ do
    it "returns switched event" $ do
      (snd . switch) SwitchOpened `shouldBe` Switched

  describe "when closed switch switches" $ do
    it "returns switched event" $ do
      (snd . switch) SwitchClosed `shouldBe` Switched
