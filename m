Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA7F718FF6
	for <lists+linux-input@lfdr.de>; Thu,  1 Jun 2023 03:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjFABYL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 May 2023 21:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjFABYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 May 2023 21:24:10 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 430C4101;
        Wed, 31 May 2023 18:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzGwZmzvvrnQssbt+Xycaz2UGGcuHJ4gYtJVEbW1+3hpylejQ9izuEYnGdi/UIYM4fgVsBiUV6kH0Os5ySF5RPG0I126W1YpvbmzQHdDTWY8y8gl/sl2KOVZm9Lr1eOYo8BzMHqSl9jGYA1SmtvQkojD4HhCxOsUm5my+psglHBosymh68PtOnkLeObNfuWDLl1cXieXMzOsKqdYpEoPo/jYigkkLGvSv3eYogpkOxyx9ZeqKxvaykZsiGOLaQg/BguMooGlhs83QE3A+C4b5daQD0PWEH9DtTTkvx+XFEMoSwaWYAA6DcUHBFhYhNh8swdWkT/1/cPf0C1Sr2Z9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjr2bQYLse3kEoHQ7EyHfOFPf6uG097zxArUacmvRo8=;
 b=EIeB2ZMgtDsgVZDWtx4OkCB6RqhLCLO7BFUjphVf8pngg1u6jwsxD3Qyra3bWZ1XagHpm7499JxQGE45nRO+RJLrj8iuqhuFYowRF4p7JThFvFJsf5Uw5CYfROlbxD4/8ftW8jGcETEIunRnL1KNYYBeZCpqx9rmEVHuxLkPhnrmtjQgWf3FemR4IEcCI6Lkl+jrs7FWoG8Fjm8EBsdsfbkPbXKUrq0pD7Be6CY2dHr2Ek5bgj60ilWTCEO/KXd7aOP74haqrJBNnXzRu68rCR632F3VwEhNl5txG1TF/wBzMnVSgl5Ayx8aNxgdRVg/XAOs31A+hY/3CGo40JU3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjr2bQYLse3kEoHQ7EyHfOFPf6uG097zxArUacmvRo8=;
 b=gj94quFJdOA7NL/+ShE9SOGBEOYvx/PRs4P2v4Wo/a696lNKT/s5q/7YrIYiPXZYGxJIxDilf58TCM/1EYI3pruPqIAazMlDE7uLxjQ4fZarUN8441zChZCDtHPHFUsoRUw74OOo31pdJH7kv2p79dQFOIIPzy7L1A8z6/y98Ms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM4PR08MB8673.namprd08.prod.outlook.com
 (2603:10b6:8:190::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 01:24:04 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::c696:d0df:10ac:8071%3]) with mapi id 15.20.6433.022; Thu, 1 Jun 2023
 01:24:03 +0000
Date:   Wed, 31 May 2023 20:23:57 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Message-ID: <ZHfzLUrWZc0Bp+Ap@nixie71>
References: <ZHanv+8fOYhpyMEC@nixie71>
 <e3b35a40-daf2-c06a-1de4-1d2fdd1c68c8@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b35a40-daf2-c06a-1de4-1d2fdd1c68c8@kernel.org>
X-ClientProxiedBy: DM6PR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:5:80::31) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM4PR08MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 56532ec8-5e73-461a-8a83-08db623ee2d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvtCWE/IGird7RYMYVY2s+OiqfwsmM4A8dDZRTXfNi3LQiMWEencSvt3OPexGCPagshG69Cvy3uI2LTQ9KqDCSo/16s/zR5nXx05lnjDMKscaxASWSi0V8bFGidZUC0yzvatFZ8/fopIWVyj8ZfYZUU+k2pi5e1JSYMYIEIh27f/CW7mYk1cRBdv7+mJPf48st5t0IqpkHjYgCydsmEuaWhrduzrPV9YFT5M8zC3XIExI5Wxigimlp2QUDdaocIDwXI2z+XKU9RojO/GzQ8dskCEYAR+7AoZgJeSpFc8FkI6ajukF4CbtbEdkhGFmzXbzpqNhQeAEarIvF+zTEG5ww8HZXBI9jPCKsgY2nPKMnduiFl1AJ2I7i1VRrlsE0W0YH9fqZurONCz4D2sNSxWxfU/kQ1dyPy2U7Y3YPCfHls77bndvE4LQtIxYao7X509QsG4cbL/K/2MnWyZB0jiwYy9ls8YjNeDVX4Vb2nIW7kHH0iz14dj+uzGCJXYsenIg48Zt0Z1D6iLYC/JiYEpke/J3vk5lbbcsxzE0meXl+7dNx1fstsCHtVfW91d5j4kMW4zppp0B4W7J1M8ZjfT07IzdJRLJ48uLOykuDtnEHk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(366004)(396003)(39830400003)(136003)(346002)(376002)(451199021)(478600001)(86362001)(6486002)(966005)(83380400001)(41300700001)(6506007)(38100700002)(53546011)(9686003)(4326008)(186003)(6916009)(33716001)(8936002)(26005)(6512007)(5660300002)(8676002)(30864003)(316002)(66556008)(2906002)(6666004)(66476007)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DOwfSP4etiHGZGPVWgmOUcqaW5iQcWRZXCcgiUbkYCnUmv8uMYSGQwPm4esN?=
 =?us-ascii?Q?Iz9Wupo82RH1KRK6Q/IWFISwWwHhY9TgBBNV3n9ZgKV39CZBQjZKmwE5vYvu?=
 =?us-ascii?Q?oVs+5Id+tUkmcO0rN4tyb56dHz8ZFdTbAa246GeWWgj0vWM6x/lAPaZnDJC7?=
 =?us-ascii?Q?zA3VMo75uwZpXpc1w5NB4jpLZth0OFMcGo8rZl3cPwNYKWz7KGNBeyF5eIBp?=
 =?us-ascii?Q?nHectvUgT+HLxRZ7CdZ9lqmqfymbpbengd/SVk6RTUBwQrsDB/GkRSKyMqQd?=
 =?us-ascii?Q?koJhpkigNKMvjsvwdhIhs6N3sbhQKVjwjCcz8ym1k6kj2SZ+8lsEpNqMLbz/?=
 =?us-ascii?Q?OdGIIJ9vscpkhonv9drl/geTyLGMyLsGvsaQ9rVX4X7PTgjEGmD7dqSz8Rnj?=
 =?us-ascii?Q?w5aJr8h4zo3dPcYBk5eNXCHrYB/dLVxE7XO98dTNBJY4NGszbV6XwwHfHKBs?=
 =?us-ascii?Q?783nFS/4YuiQ+7rFHY+88ozNGYbkCqD0ViL/jxphVM/gfG3ZpifPDqf/mQuB?=
 =?us-ascii?Q?hxAJ97/LypES+ZBcTdMwPspGN0JzXFZYas3Ysx0iMGzDNSGAbO05+gxPexsp?=
 =?us-ascii?Q?r3d5Oo0Rom4x6lh0RgDM8pClEP4v8gfi9vM0Rw3AEdRGLXHDXc4q0iIY231a?=
 =?us-ascii?Q?piFuYu0VJVpeO0X92G3dyky63w+Rmr512njt/fBPgctNHIPVOED5gBZmXzik?=
 =?us-ascii?Q?km4hZZ1eT+0/wPeeOP06HZrt1H5b6cd7qrGhH6CkUSHn4ezhjDqfCORYY+7A?=
 =?us-ascii?Q?mfy/R4WE9K48ofIaEqyKUd/TtAyzcub00lASwg6W4u8Sm1hi36jxQlZjsO94?=
 =?us-ascii?Q?nlarHWlCWy9YC1Zp2V97ljpWOk/6fSdyLiQ8WmO0954Ad5+u5PPCxY0Jh6Fb?=
 =?us-ascii?Q?wJMSBWDTlVqnX8FjQvdRX0WeHNJHqCetMWpOAE464uTeL1mXBzXvpX8RcQFB?=
 =?us-ascii?Q?hb9bx7i0+QnFWBNkUz+8mLsFwJ+8Y22ULjcBFUEg9y4/XarredEeNUNp8ZhW?=
 =?us-ascii?Q?vTFtq4073SVbsAeiTXPj/obnfqmJOOSPsFgJ4Y1iepT4sTmxfOG0842oqTuf?=
 =?us-ascii?Q?Ms2RZSyYj+Qm9KNpuYLjo+wmg/R/wbwhbMz7PhZJr2Q01QF4pEZ82iVrs06/?=
 =?us-ascii?Q?Y/V7AD3crcHpQAmMqB1/yCjfxK8yWNTJ6uDEhahQ2VTFbOIO3uZG5w9jQwi2?=
 =?us-ascii?Q?x7cykKcup2Y9nAZ1m96NZhk8Sd4FEL6cXpc0ltgQhBIfDOUCRcdq+mgQgwX0?=
 =?us-ascii?Q?hrUxy5Lpll79goHqjNkk6vMdkj1oqZjvcooIeyXswcpTN/oVHrvv9jMADfvE?=
 =?us-ascii?Q?lxd4pwhLgmIDskkJ9MXXJfFlEgcBz85mqkalQQ8c6KXO9cOea4RI+HMk4A4I?=
 =?us-ascii?Q?LlJnl0J6gFDJbpBf6WslKGdDiKEXDbQf9mltJVtPtEouQuPXC7DMc4UbVZa+?=
 =?us-ascii?Q?rG+XI3i6+fpeMrw7SUdDs2XTE8f58Vfea79sx7dITEZfb4YtVXJ1u2hX0q0x?=
 =?us-ascii?Q?qru+xYhBLXl/ejBm+EHEyAaA1Z2apSYtXztH8d2J2Hvpl6Y54V0JO3TOCzC8?=
 =?us-ascii?Q?CtHmoZ8q7zUur1G8H/0vZUlBycim6DLiKNDojxao?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56532ec8-5e73-461a-8a83-08db623ee2d1
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 01:24:03.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E35NtfDsCA8P5dD0IEvNVI/ENrY5vMZcGzx8RWGZNQtfM2F0kc9ioRRQ40XhXfSf2Ba2SAw41XqfgkQoQd958g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR08MB8673
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Krzysztof,

On Wed, May 31, 2023 at 07:22:31PM +0200, Krzysztof Kozlowski wrote:
> On 31/05/2023 03:49, Jeff LaBundy wrote:
> > Extend the common binding to include a new variant of the silicon.
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC.  It might happen, that command when run on an older
> kernel, gives you outdated entries.  Therefore please be sure you base
> your patches on recent Linux kernel.
> 
> It's not the first time - you keep ignoring maintainers output all the time.

You'll have to forgive me; I'm submitting using some homemade tooling that
is not yet stitched to get_maintainers, and I neglected to see that we're
fortunate to have two more great maintainers. I'll fix that going forward.

> 
> > ---
> >  .../bindings/input/azoteq,iqs7222.yaml        | 202 +++++++++++++++++-
> >  1 file changed, 192 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > index 9ddba7f2e7aa..a4c251a430fa 100644
> > --- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > +++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> > @@ -4,14 +4,14 @@
> >  $id: http://devicetree.org/schemas/input/azoteq,iqs7222.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  
> > -title: Azoteq IQS7222A/B/C Capacitive Touch Controller
> > +title: Azoteq IQS7222A/B/C/D Capacitive Touch Controller
> >  
> >  maintainers:
> >    - Jeff LaBundy <jeff@labundy.com>
> >  
> >  description: |
> > -  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
> > -  controllers that feature additional sensing capabilities.
> > +  The Azoteq IQS7222A, IQS7222B, IQS7222C and IQS7222D are multichannel capac-
> > +  itive touch controllers that feature additional sensing capabilities.
> 
> Don't split words.

ACK.

> 
> >  
> >    Link to datasheets: https://www.azoteq.com/
> >  
> > @@ -21,6 +21,7 @@ properties:
> >        - azoteq,iqs7222a
> >        - azoteq,iqs7222b
> >        - azoteq,iqs7222c
> > +      - azoteq,iqs7222d
> >  
> >    reg:
> >      maxItems: 1
> > @@ -173,6 +174,148 @@ properties:
> >      maximum: 3000
> >      description: Specifies the report rate (in ms) during ultra-low-power mode.
> >  
> > +  touchscreen-size-x: true
> > +  touchscreen-size-y: true
> > +  touchscreen-inverted-x: true
> > +  touchscreen-inverted-y: true
> > +  touchscreen-swapped-x-y: true
> 
> Why? Aren't they coming from common schema?

Yes, but because additionalProperties is set to false here, we must explicitly
include the subset of properties from the common schema that are allowed for
this particular instance. I counted over a dozen other bindings doing the same.

In case I have misunderstood, please let me know.

> 
> > +
> > +  trackpad:
> > +    type: object
> > +    description: Represents all channels associated with the trackpad.
> > +
> > +    properties:
> > +      azoteq,channel-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 12
> > +        items:
> > +          minimum: 0
> > +          maximum: 13
> > +        description:
> > +          Specifies the order of the channels that participate in the trackpad.
> > +          Specify 255 to omit a given channel for the purpose of mapping a non-
> > +          rectangular trackpad.
> > +
> > +      azoteq,num-rows:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 12
> > +        description: Specifies the number of rows that comprise the trackpad.
> > +
> > +      azoteq,num-cols:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 1
> > +        maximum: 12
> > +        description: Specifies the number of columns that comprise the trackpad.
> > +
> > +      azoteq,top-speed:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        multipleOf: 4
> > +        minimum: 0
> > +        maximum: 1020
> > +        description:
> > +          Specifies the speed of movement after which coordinate filtering is
> > +          no longer applied.
> 
> Units?

This is a ratiometric, i.e. unitless value that represents a hardware filter
coefficient. It already exists in this binding prior to this patch under the
slider-0/1 node and is simply re-used here.

> 
> > +
> > +      azoteq,bottom-speed:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description:
> > +          Specifies the speed of movement after which coordinate filtering is
> > +          linearly reduced.
> 
> Units?

Same here.

> 
> > +
> > +      azoteq,use-prox:
> > +        type: boolean
> > +        description:
> > +          Directs the trackpad to respond to the proximity states of the se-
> > +          lected channels instead of their corresponding touch states. Note
> 
> Don't split the words.

ACK.

> 
> > +          the trackpad cannot report granular coordinates during a state of
> > +          proximity.
> > +
> > +    patternProperties:
> > +      "^azoteq,lower-cal-(x|y)$":
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's lower starting points.
> 
> Why would you need this property? Why does this represent hardware property?

This property and its cousin below define the physical boundaries of the
touch surface. They are typically used to mask areas that cannot elicit
an electrical response due to manufacturing tolerances or the presence of
an overlay. For that reason, they descend directly from properties of the
hardware.

Similar properties already exist in this binding for the slider case; this
device simply extends the functionality to a second dimenstion.

> 
> > +
> > +      "^azoteq,upper-cal-(x|y)$":
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's upper starting points.
> > +
> > +      "^event-(press|tap|(swipe|flick)-(x|y)-(pos|neg))$":
> > +        type: object
> > +        $ref: input.yaml#
> > +        description:
> > +          Represents a press or gesture event reported by the trackpad. Specify
> > +          'linux,code' under the press event to report absolute coordinates.
> > +
> > +        properties:
> > +          linux,code: true
> > +
> > +          azoteq,gesture-angle-tighten:
> > +            type: boolean
> > +            description:
> > +              Limits the tangent of the gesture angle to 0.5 (axial gestures
> > +              only). If specified in one direction, the effect is applied in
> > +              either direction.
> > +
> > +          azoteq,gesture-max-ms:
> > +            multipleOf: 16
> > +            minimum: 0
> > +            maximum: 4080
> > +            description:
> > +              Specifies the length of time (in ms) within which a tap, swipe
> > +              or flick gesture must be completed in order to be acknowledged
> > +              by the device. The number specified for any one swipe or flick
> > +              gesture applies to all other swipe or flick gestures.
> > +
> > +          azoteq,gesture-min-ms:
> > +            multipleOf: 16
> > +            minimum: 0
> > +            maximum: 4080
> > +            description:
> > +              Specifies the length of time (in ms) for which a tap gesture must
> > +              be held in order to be acknowledged by the device.
> > +
> > +          azoteq,gesture-dist:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 65535
> > +            description:
> > +              Specifies the distance across which a tap, swipe or flick gesture
> > +              must travel in order to be acknowledged by the device. The number
> > +              specified for any one swipe or flick gesture applies to all other
> > +              swipe or flick gestures.
> > +
> > +          azoteq,gpio-select:
> > +            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            minItems: 1
> > +            maxItems: 3
> > +            items:
> > +              minimum: 0
> > +              maximum: 2
> > +            description: |
> > +              Specifies one or more GPIO mapped to the event as follows:
> > +              0: GPIO0
> > +              1: GPIO3
> > +              2: GPIO4
> > +
> > +              Note that although multiple events can be mapped to a single
> > +              GPIO, they must all be of the same type (proximity, touch or
> > +              trackpad gesture).
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - azoteq,channel-select
> > +
> > +    additionalProperties: false
> > +
> >  patternProperties:
> >    "^cycle-[0-9]$":
> >      type: object
> > @@ -288,6 +431,10 @@ patternProperties:
> >            Activates the reference channel in response to proximity events
> >            instead of touch events.
> >  
> > +      azoteq,counts-filt-enable:
> > +        type: boolean
> > +        description: Applies counts filtering to the channel.
> > +
> >        azoteq,ati-band:
> >          $ref: /schemas/types.yaml#/definitions/uint32
> >          enum: [0, 1, 2, 3]
> > @@ -432,12 +579,12 @@ patternProperties:
> >              description: |
> >                Specifies one or more GPIO mapped to the event as follows:
> >                0: GPIO0
> > -              1: GPIO3 (IQS7222C only)
> > -              2: GPIO4 (IQS7222C only)
> > +              1: GPIO3
> > +              2: GPIO4
> 
> Why changing this? Is it valid for IQS7222A?

It's not, only for 'C' and now 'D'. However, the restriction for 'A' is already
conveyed in an if/then schema in the original binding. So rather than updating
this text to say "(IQS7222C and IQS7222D only)", I opted to drop the open-coded
text and rely on the existing schema.

> >  
> >                Note that although multiple events can be mapped to a single
> >                GPIO, they must all be of the same type (proximity, touch or
> > -              slider gesture).
> > +              slider/trackpad gesture).
> >  
> >            azoteq,thresh:
> >              $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -610,8 +757,8 @@ patternProperties:
> >              description: |
> >                Specifies one or more GPIO mapped to the event as follows:
> >                0: GPIO0
> > -              1: GPIO3 (IQS7222C only)
> > -              2: GPIO4 (IQS7222C only)
> > +              1: GPIO3
> > +              2: GPIO4
> >  
> >                Note that although multiple events can be mapped to a single
> >                GPIO, they must all be of the same type (proximity, touch or
> > @@ -629,8 +776,8 @@ patternProperties:
> >      description: |
> >        Represents a GPIO mapped to one or more events as follows:
> >        gpio-0: GPIO0
> > -      gpio-1: GPIO3 (IQS7222C only)
> > -      gpio-2: GPIO4 (IQS7222C only)
> > +      gpio-1: GPIO3
> > +      gpio-2: GPIO4
> >  
> >      allOf:
> >        - $ref: ../pinctrl/pincfg-node.yaml#
> > @@ -641,6 +788,41 @@ patternProperties:
> >      additionalProperties: false
> >  
> >  allOf:
> > +  - $ref: touchscreen/touchscreen.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: azoteq,iqs7222d
> > +
> > +    then:
> > +      patternProperties:
> > +        "^cycle-[0-9]$":
> > +          properties:
> > +            azoteq,iref-enable: false
> > +
> > +        "^channel-([0-9]|1[0-9])$":
> > +          properties:
> > +            azoteq,ref-select: false
> > +
> > +        "^slider-[0-1]$": false
> > +
> > +    else:
> > +      properties:
> > +        touchscreen-size-x: false
> > +        touchscreen-size-y: false
> > +        touchscreen-inverted-x: false
> > +        touchscreen-inverted-y: false
> > +        touchscreen-swapped-x-y: false
> > +
> > +        trackpad: false
> 
> The binding got quite complicated. Are you sure these are similar devices?

Yes, I'm quite sure. The silicon is largely the same, the primary difference
being the way two access are reported (2x 1-D vs. 1x 2-D).

The binding hasn't necessarily grown functionally; rather, most properties
from the slider-0/1 node are simply re-used or extended to two dimensions
for the new trackpad node.

My long-term goal is to defer most of these properties to a common vendor
schema as per my note to Rob in [1], but it does not seem possible yet. If
I'm mistaken, or there is a more efficient means of re-use under the current
tooling, I'll happily follow suit.

[1] https://patchwork.kernel.org/patch/13259035/

> 
> Best regards,
> Krzysztof
> 

Kind regards,
Jeff LaBundy
