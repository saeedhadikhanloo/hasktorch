{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE RecordWildCards #-}

module Main where

--import GHC.Generics
import GHC.Types (Nat)
import qualified Torch.DType as D
import qualified Torch.Device as D
import Torch.Tensor (Tensor, shape)
import Torch.Typed.NN
  ( Conv2d,
    Conv2dSpec,
  )
import Torch.Utils.Image (readImage)

-- let spec = Conv2dSpec @10 @5 @3 @2 @'D.Float @'( 'D.CPU, 0)
data UNET
  = UNET
      { c1 :: Conv2d (Nat) (Nat) (Nat) (Nat) 'D.Float ('D.CPU, Nat)
      }
  deriving (Show)

main :: IO ()
main = do
  img <- readImage "1.png"
  case img of
    Left err -> print err
    Right tensor -> print $ shape tensor
