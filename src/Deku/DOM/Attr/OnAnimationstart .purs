module Deku.DOM.Attr.OnAnimationstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart Cb where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' value }

instance Attr anything OnAnimationstart (Effect Unit) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (Effect Boolean) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationstart (Zora Unit) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart "
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnAnimationstart (Zora Boolean) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' (Cb (const (runImpure value))) }