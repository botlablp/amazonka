{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TemplateHaskell             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.DeleteVpc
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Deletes the specified VPC. You must detach or delete all gateways and
-- resources that are associated with the VPC before you can delete it. For
-- example, you must terminate all instances running in the VPC, delete all
-- security groups associated with the VPC (except the default one), delete
-- all route tables associated with the VPC (except the default one), and so
-- on. Example This example deletes the specified VPC.
-- https://ec2.amazonaws.com/?Action=DeleteVpc &amp;VpcId=vpc-1a2b3c4d
-- &amp;AUTHPARAMS &lt;DeleteVpcResponse
-- xmlns="http://ec2.amazonaws.com/doc/2014-06-15/"&gt;
-- &lt;requestId&gt;7a62c49f-347e-4fc4-9331-6e8eEXAMPLE&lt;/requestId&gt;
-- &lt;return&gt;true&lt;/return&gt; &lt;/DeleteVpcResponse&gt;.
module Network.AWS.EC2.V2014_06_15.DeleteVpc where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'DeleteVpc' request.
deleteVpc :: Text -- ^ '_dvsVpcId'
          -> DeleteVpc
deleteVpc p1 = DeleteVpc
    { _dvsVpcId = p1
    , _dvsDryRun = Nothing
    }

data DeleteVpc = DeleteVpc
    { _dvsVpcId :: Text
      -- ^ The ID of the VPC.
    , _dvsDryRun :: Maybe Bool
      -- ^ 
    } deriving (Show, Generic)

makeLenses ''DeleteVpc

instance ToQuery DeleteVpc where
    toQuery = genericQuery def

data DeleteVpcResponse = DeleteVpcResponse
    deriving (Eq, Show, Generic)

makeLenses ''DeleteVpcResponse

instance AWSRequest DeleteVpc where
    type Sv DeleteVpc = EC2
    type Rs DeleteVpc = DeleteVpcResponse

    request = post "DeleteVpc"
    response _ = nullaryResponse DeleteVpcResponse
