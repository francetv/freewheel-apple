//
//  FWGPPCMPAPIConsentConfiguration.h
//  AdManager
//
//  Created by Daniel Xiaofeng Wang on 3/23/23.
//  Copyright © 2023 FreeWheel Media Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FWConstants.h"

/**
 A class used for configuring FWConsentConfiguration with user GPP CMP API consent information.
 
 Note, this class is intended for readonly purposes. FWConsentConfiguration will handle its implementation.
 
 See also `FWConsentConfiguration`.
 */
@interface FWGPPCMPAPIConsentConfiguration : NSObject <NSCopying>

@property (nullable, nonatomic, copy, readonly) NSString* fwGPPString;
@property (nullable, nonatomic, copy, readonly) NSString* fwGPPsectionId;

@end
