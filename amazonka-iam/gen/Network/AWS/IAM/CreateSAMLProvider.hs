{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.IAM.CreateSAMLProvider
-- Copyright   : (c) 2013-2015 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Creates an IAM entity to describe an identity provider (IdP) that
-- supports SAML 2.0.
--
-- The SAML provider that you create with this operation can be used as a
-- principal in a role\'s trust policy to establish a trust relationship
-- between AWS and a SAML identity provider. You can create an IAM role
-- that supports Web-based single sign-on (SSO) to the AWS Management
-- Console or one that supports API access to AWS.
--
-- When you create the SAML provider, you upload an a SAML metadata
-- document that you get from your IdP and that includes the issuer\'s
-- name, expiration information, and keys that can be used to validate the
-- SAML authentication response (assertions) that are received from the
-- IdP. You must generate the metadata document using the identity
-- management software that is used as your organization\'s IdP.
--
-- This operation requires
-- <http://docs.aws.amazon.com/general/latest/gr/signature-version-4.html Signature Version 4>.
--
-- For more information, see
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_enable-console-saml.html Enabling SAML 2.0 Federated Users to Access the AWS Management Console>
-- and
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html About SAML 2.0-based Federation>
-- in the /IAM User Guide/.
module Network.AWS.IAM.CreateSAMLProvider
    (
    -- * Creating a Request
      createSAMLProvider
    , CreateSAMLProvider
    -- * Request Lenses
    , csamlpSAMLMetadataDocument
    , csamlpName

    -- * Destructuring the Response
    , createSAMLProviderResponse
    , CreateSAMLProviderResponse
    -- * Response Lenses
    , csamlprsSAMLProviderARN
    , csamlprsResponseStatus
    ) where

import           Network.AWS.IAM.Types
import           Network.AWS.IAM.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'createSAMLProvider' smart constructor.
data CreateSAMLProvider = CreateSAMLProvider'
    { _csamlpSAMLMetadataDocument :: !Text
    , _csamlpName                 :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateSAMLProvider' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csamlpSAMLMetadataDocument'
--
-- * 'csamlpName'
createSAMLProvider
    :: Text -- ^ 'csamlpSAMLMetadataDocument'
    -> Text -- ^ 'csamlpName'
    -> CreateSAMLProvider
createSAMLProvider pSAMLMetadataDocument_ pName_ =
    CreateSAMLProvider'
    { _csamlpSAMLMetadataDocument = pSAMLMetadataDocument_
    , _csamlpName = pName_
    }

-- | An XML document generated by an identity provider (IdP) that supports
-- SAML 2.0. The document includes the issuer\'s name, expiration
-- information, and keys that can be used to validate the SAML
-- authentication response (assertions) that are received from the IdP. You
-- must generate the metadata document using the identity management
-- software that is used as your organization\'s IdP.
--
-- For more information, see
-- <http://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_saml.html About SAML 2.0-based Federation>
-- in the /IAM User Guide/
csamlpSAMLMetadataDocument :: Lens' CreateSAMLProvider Text
csamlpSAMLMetadataDocument = lens _csamlpSAMLMetadataDocument (\ s a -> s{_csamlpSAMLMetadataDocument = a});

-- | The name of the provider to create.
csamlpName :: Lens' CreateSAMLProvider Text
csamlpName = lens _csamlpName (\ s a -> s{_csamlpName = a});

instance AWSRequest CreateSAMLProvider where
        type Rs CreateSAMLProvider =
             CreateSAMLProviderResponse
        request = postQuery iAM
        response
          = receiveXMLWrapper "CreateSAMLProviderResult"
              (\ s h x ->
                 CreateSAMLProviderResponse' <$>
                   (x .@? "SAMLProviderArn") <*> (pure (fromEnum s)))

instance Hashable CreateSAMLProvider

instance ToHeaders CreateSAMLProvider where
        toHeaders = const mempty

instance ToPath CreateSAMLProvider where
        toPath = const "/"

instance ToQuery CreateSAMLProvider where
        toQuery CreateSAMLProvider'{..}
          = mconcat
              ["Action" =: ("CreateSAMLProvider" :: ByteString),
               "Version" =: ("2010-05-08" :: ByteString),
               "SAMLMetadataDocument" =:
                 _csamlpSAMLMetadataDocument,
               "Name" =: _csamlpName]

-- | Contains the response to a successful < CreateSAMLProvider> request.
--
-- /See:/ 'createSAMLProviderResponse' smart constructor.
data CreateSAMLProviderResponse = CreateSAMLProviderResponse'
    { _csamlprsSAMLProviderARN :: !(Maybe Text)
    , _csamlprsResponseStatus  :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'CreateSAMLProviderResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'csamlprsSAMLProviderARN'
--
-- * 'csamlprsResponseStatus'
createSAMLProviderResponse
    :: Int -- ^ 'csamlprsResponseStatus'
    -> CreateSAMLProviderResponse
createSAMLProviderResponse pResponseStatus_ =
    CreateSAMLProviderResponse'
    { _csamlprsSAMLProviderARN = Nothing
    , _csamlprsResponseStatus = pResponseStatus_
    }

-- | The Amazon Resource Name (ARN) of the SAML provider.
csamlprsSAMLProviderARN :: Lens' CreateSAMLProviderResponse (Maybe Text)
csamlprsSAMLProviderARN = lens _csamlprsSAMLProviderARN (\ s a -> s{_csamlprsSAMLProviderARN = a});

-- | The response status code.
csamlprsResponseStatus :: Lens' CreateSAMLProviderResponse Int
csamlprsResponseStatus = lens _csamlprsResponseStatus (\ s a -> s{_csamlprsResponseStatus = a});
