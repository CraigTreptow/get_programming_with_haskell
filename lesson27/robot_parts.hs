import qualified Data.Map as Map

type Html = String

data RobotPart = RobotPart
   { name :: String
   , description :: String
   , cost :: Double
   , count :: Int
   } deriving Show

partsDB :: Map.Map Int RobotPart
partsDB = Map.fromList keyVals
 where keys = [1,2,3]
       vals = [leftArm,rightArm,robotHead]
       keyVals = zip keys vals

renderHtml :: RobotPart -> Html
renderHtml part = mconcat ["<h2>",partName, "</h2>"
                          ,"<p><h3>desc</h3>",partDesc
                          ,"</p><p><h3>cost</h3>"
                          ,partCost
                          ,"</p><p><h3>count</h3>"
                          ,partCount,"</p>"]
 where partName = name part
       partDesc = description part
       partCost = show (cost part)
       partCount = show (count part)

leftArm :: RobotPart
leftArm  = RobotPart
   { name = "left arm"
   , description = "left arm for face punching!"
   , cost = 1000.00
   , count = 3
   }

rightArm :: RobotPart
rightArm  = RobotPart
   { name = "right arm"
   , description = "right arm for kind hand gestures"
   , cost = 1025.00
   , count = 5
   }

robotHead :: RobotPart
robotHead  = RobotPart
   { name = "robot head"
   , description = "this head looks mad"
   , cost = 5092.25
   , count = 2
   }

partVal :: Maybe RobotPart
partVal = Map.lookup 1 partsDB

-- All examples of Functor

partHtml :: Maybe Html
partHtml = renderHtml <$> partVal

allParts :: [RobotPart]
allParts = map snd (Map.toList partsDB)

allPartsHtml :: [Html]
allPartsHtml = renderHtml <$> allParts

htmlPartsDB :: Map.Map Int Html
htmlPartsDB = renderHtml <$> partsDB

leftArmIO :: IO RobotPart
leftArmIO = return leftArm

htmlSnippet :: IO Html
htmlSnippet = renderHtml <$> leftArmIO


