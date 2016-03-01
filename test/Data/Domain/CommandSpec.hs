module Data.Domain.CommandSpec (spec) where

import           Data.Domain.Command (Command(Exit, Switch), getCommand)
import           Test.Hspec

spec :: Spec
spec = do
  describe "when input char is 'q'" $ do
    it "should be recognized as exit command" $ do
      getCommand 'q' `shouldBe` Just Exit

  describe "when input char is 'Q'" $ do
    it "should not be recognized as a command" $ do
      getCommand 'Q' `shouldBe` Nothing

  describe "when input char is 's'" $ do
    it "should be recognized as switch command" $ do
      getCommand 's' `shouldBe` Just Switch

  describe "when input char is 'S'" $ do
    it "should not be recognized as a command" $ do
      getCommand 'S' `shouldBe` Nothing
