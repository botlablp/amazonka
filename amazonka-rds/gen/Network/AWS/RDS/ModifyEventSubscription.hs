{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE RecordWildCards            #-}
{-# LANGUAGE TypeFamilies               #-}

-- {-# OPTIONS_GHC -fno-warn-unused-imports #-}
-- {-# OPTIONS_GHC -fno-warn-unused-binds  #-} doesnt work if wall is used
{-# OPTIONS_GHC -w #-}

-- Module      : Network.AWS.RDS.ModifyEventSubscription
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Modifies an existing RDS event notification subscription. Note that you
-- cannot modify the source identifiers using this call; to change source
-- identifiers for a subscription, use the AddSourceIdentifierToSubscription
-- and RemoveSourceIdentifierFromSubscription calls. You can see a list of the
-- event categories for a given SourceType in the Events topic in the Amazon
-- RDS User Guide or by using the DescribeEventCategories action.
module Network.AWS.RDS.ModifyEventSubscription
    (
    -- * Request
      ModifyEventSubscriptionMessage
    -- ** Request constructor
    , modifyEventSubscription
    -- ** Request lenses
    , mesmEnabled
    , mesmEventCategories
    , mesmSnsTopicArn
    , mesmSourceType
    , mesmSubscriptionName

    -- * Response
    , ModifyEventSubscriptionResult
    -- ** Response constructor
    , modifyEventSubscriptionResponse
    -- ** Response lenses
    , mesrEventSubscription
    ) where

import Network.AWS.Prelude
import Network.AWS.Request.Query
import Network.AWS.RDS.Types

data ModifyEventSubscriptionMessage = ModifyEventSubscriptionMessage
    { _mesmEnabled          :: Maybe Bool
    , _mesmEventCategories  :: [Text]
    , _mesmSnsTopicArn      :: Maybe Text
    , _mesmSourceType       :: Maybe Text
    , _mesmSubscriptionName :: Text
    } deriving (Eq, Ord, Show, Generic)

-- | 'ModifyEventSubscriptionMessage' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mesmEnabled' @::@ 'Maybe' 'Bool'
--
-- * 'mesmEventCategories' @::@ ['Text']
--
-- * 'mesmSnsTopicArn' @::@ 'Maybe' 'Text'
--
-- * 'mesmSourceType' @::@ 'Maybe' 'Text'
--
-- * 'mesmSubscriptionName' @::@ 'Text'
--
modifyEventSubscription :: Text -- ^ 'mesmSubscriptionName'
                        -> ModifyEventSubscriptionMessage
modifyEventSubscription p1 = ModifyEventSubscriptionMessage
    { _mesmSubscriptionName = p1
    , _mesmSnsTopicArn      = Nothing
    , _mesmSourceType       = Nothing
    , _mesmEventCategories  = mempty
    , _mesmEnabled          = Nothing
    }

-- | A Boolean value; set to true to activate the subscription.
mesmEnabled :: Lens' ModifyEventSubscriptionMessage (Maybe Bool)
mesmEnabled = lens _mesmEnabled (\s a -> s { _mesmEnabled = a })

-- | A list of event categories for a SourceType that you want to subscribe
-- to. You can see a list of the categories for a given SourceType in the
-- Events topic in the Amazon RDS User Guide or by using the
-- DescribeEventCategories action.
mesmEventCategories :: Lens' ModifyEventSubscriptionMessage [Text]
mesmEventCategories =
    lens _mesmEventCategories (\s a -> s { _mesmEventCategories = a })

-- | The Amazon Resource Name (ARN) of the SNS topic created for event
-- notification. The ARN is created by Amazon SNS when you create a topic
-- and subscribe to it.
mesmSnsTopicArn :: Lens' ModifyEventSubscriptionMessage (Maybe Text)
mesmSnsTopicArn = lens _mesmSnsTopicArn (\s a -> s { _mesmSnsTopicArn = a })

-- | The type of source that will be generating the events. For example, if
-- you want to be notified of events generated by a DB instance, you would
-- set this parameter to db-instance. if this value is not specified, all
-- events are returned. Valid values: db-instance | db-parameter-group |
-- db-security-group | db-snapshot.
mesmSourceType :: Lens' ModifyEventSubscriptionMessage (Maybe Text)
mesmSourceType = lens _mesmSourceType (\s a -> s { _mesmSourceType = a })

-- | The name of the RDS event notification subscription.
mesmSubscriptionName :: Lens' ModifyEventSubscriptionMessage Text
mesmSubscriptionName =
    lens _mesmSubscriptionName (\s a -> s { _mesmSubscriptionName = a })

instance ToPath ModifyEventSubscriptionMessage where
    toPath = const "/"

instance ToQuery ModifyEventSubscriptionMessage

newtype ModifyEventSubscriptionResult = ModifyEventSubscriptionResult
    { _mesrEventSubscription :: Maybe EventSubscription
    } deriving (Eq, Show, Generic)

-- | 'ModifyEventSubscriptionResult' constructor.
--
-- The fields accessible through corresponding lenses are:
--
-- * 'mesrEventSubscription' @::@ 'Maybe' 'EventSubscription'
--
modifyEventSubscriptionResponse :: ModifyEventSubscriptionResult
modifyEventSubscriptionResponse = ModifyEventSubscriptionResult
    { _mesrEventSubscription = Nothing
    }

mesrEventSubscription :: Lens' ModifyEventSubscriptionResult (Maybe EventSubscription)
mesrEventSubscription =
    lens _mesrEventSubscription (\s a -> s { _mesrEventSubscription = a })

instance AWSRequest ModifyEventSubscriptionMessage where
    type Sv ModifyEventSubscriptionMessage = RDS
    type Rs ModifyEventSubscriptionMessage = ModifyEventSubscriptionResult

    request  = post "ModifyEventSubscription"
    response = xmlResponse $ \h x -> ModifyEventSubscriptionResult
        <$> x %| "EventSubscription"
