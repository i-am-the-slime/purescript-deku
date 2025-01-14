module Deku.DOM.Elt.Main where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Main_

main
  :: forall lock payload
   . Event (Attribute Main_)
  -> Array (Domable lock payload)
  -> Domable lock payload
main attributes kids = Domable
  ( Element'
      ( DC.elementify "main" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

main_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
main_ = main empty

main__
  :: forall lock payload
   . String
  -> Domable lock payload
main__ t = main_ [ DC.text_ t ]
