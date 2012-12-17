/*
 * JBoss, Home of Professional Open Source.
 * Copyright 2012 Red Hat, Inc., and individual contributors
 * as indicated by the @author tags.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "AGIncrementalStore.h"
#import "AGIncrementalStoreHttpClient.h"

@implementation AGIncrementalStore

#pragma mark - AFIncrementalStore.h

+ (void)initialize {
    [NSPersistentStoreCoordinator registerStoreClass:self forStoreType:[self type]];
}

+ (NSString *)type {
    return NSStringFromClass(self);
}

+ (NSManagedObjectModel *)model {
    return [[NSManagedObjectModel alloc] initWithContentsOfURL:[[NSBundle mainBundle] URLForResource:[self modelName] withExtension:[self extension]]];
}

// it's a getter of AFIncStore...
- (id <AFIncrementalStoreHTTPClient>)HTTPClient {
    
    // THIS needs to be initialized ...............
    return [AGIncrementalStoreHttpClient clientFor:[self baseURL] authModule:[self authModule]];
}

#pragma mark - AGIncrementalStoreAdapter

-(id<AGAuthenticationModule>) authModule {
    @throw([NSException exceptionWithName:AFIncrementalStoreUnimplementedMethodException reason:NSLocalizedString(@"Unimplemented method: -authModule. Must be overridden in a subclass", nil) userInfo:nil]);
    
}

-(NSURL *) baseURL {
    @throw([NSException exceptionWithName:AFIncrementalStoreUnimplementedMethodException reason:NSLocalizedString(@"Unimplemented method: -baseURL. Must be overridden in a subclass", nil) userInfo:nil]);
}

+(NSString *) modelName {
    @throw([NSException exceptionWithName:AFIncrementalStoreUnimplementedMethodException reason:NSLocalizedString(@"Unimplemented method: +modelName. Must be overridden in a subclass", nil) userInfo:nil]);
}

+(NSString *) extension {
    @throw([NSException exceptionWithName:AFIncrementalStoreUnimplementedMethodException reason:NSLocalizedString(@"Unimplemented method: +extension. Must be overridden in a subclass", nil) userInfo:nil]);
}

@end
