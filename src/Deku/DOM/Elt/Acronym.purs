module Deku.DOM.Elt.Acronym where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Acronym_

acronym
  :: forall lock payload
   . Event (Attribute Acronym_)
  -> Array (Domable lock payload)
  -> Domable lock payload
acronym attributes kids = Domable
  ( Element'
      ( DC.elementify "acronym" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

acronym_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
acronym_ = acronym empty

acronym__
  :: forall lock payload
   . String
  -> Domable lock payload
acronym__ t = acronym_ [ DC.text_ t ]
