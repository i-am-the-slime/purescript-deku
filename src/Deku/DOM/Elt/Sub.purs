module Deku.DOM.Elt.Sub where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Sub_

sub
  :: forall lock payload
   . Event (Attribute Sub_)
  -> Array (Domable lock payload)
  -> Domable lock payload
sub attributes kids = Domable
  ( Element'
      ( DC.elementify "sub" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

sub_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
sub_ = sub empty

sub__
  :: forall lock payload
   . String
  -> Domable lock payload
sub__ t = sub_ [ DC.text_ t ]
