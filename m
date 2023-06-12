Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4740972B4FC
	for <lists+linux-input@lfdr.de>; Mon, 12 Jun 2023 02:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjFLA37 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Jun 2023 20:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjFLA36 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Jun 2023 20:29:58 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70640A7;
        Sun, 11 Jun 2023 17:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCneTIgvXoOHv1BJr74iWPicX+s0h5eGNSmOh7tEtFm0emTOd4/9zvVATxJnhQr0ygS9SuD+TJTXzrs0XqmTKMJ9VcJbqGQYBmxxeRvyZtKJadksC812M47BTFVQ66HAW7D26XN2H//JS4/f6W+t6MOKiYSJuIF8wOr1/2mBj4ZDf8d1Q00cU3GwqEd8e0xcbKUkzFHz9WifuND/QQTZxUM10QQ9lk99OSDJtxq2zmwb/11LBRXVenbHhEhUXMz4hvfs30tVYMOfRFmCU+lPcuqdx7O3kZV9q/P5o4GY02HxePjXzxz9UVz+JoJGPc2SPY4SpWG5hVsirGAUZLMhsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xpw28+NY6GFrMWWCCpu1ZOK/vVujkMPr+fu2LAIq/ww=;
 b=ASqMsiLz2oUcEbGvoPUhJv129NB7vCdsipHvmKxecFoQgA6EFLtDX4BZf//VotV9aenXX+3s3m3pWWE/7mFIfl9xpyqbJOlkZ0JWUjm7DWpkQi6yy7ugdS/LU7C6hFsxzA/G+469COrMFmpZSx5g3sakcMJxfJsJmjO4oCx3uqw5qVaPCpbtQT4tGtXchpLzCHXYwkQczndOk7rM2N+o+qDJ0mRh1ZYoZDa2wV4mf/4/Lvtc0792Macf6jeHUg+dLYLllmVOZSvgfUkrAGd2QXbRKNkuho2SleF34wF1hJwcthsRauV3t4cnmvjim7Y8DH0ytdVMNhINvZL28clRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xpw28+NY6GFrMWWCCpu1ZOK/vVujkMPr+fu2LAIq/ww=;
 b=jikM8snkfISxLyEHkIs54BoWqIrrFqmpCEYYyVhMT2cZRj6XRZyNab8+4utqMy8R/vunTtAirlgEXZVW8uFyfGzdv3LXB5mY4rVfT9q9TtcU1wJoD2RFITurNIglHJBlVJPQ5PI+uUFy7lH9H+XgqcXLcqbGRipHsMUFD6u5v34=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN4PR0801MB7727.namprd08.prod.outlook.com
 (2603:10b6:806:202::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Mon, 12 Jun
 2023 00:29:53 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ca3a:84ac:381c:1506%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 00:29:53 +0000
Date:   Sun, 11 Jun 2023 19:29:44 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Message-ID: <ZIZm+P/N8sWIgz/n@nixie71>
References: <ZHanv+8fOYhpyMEC@nixie71>
 <e3b35a40-daf2-c06a-1de4-1d2fdd1c68c8@kernel.org>
 <ZHfzLUrWZc0Bp+Ap@nixie71>
 <1bdaee8a-b327-d97f-a96a-25367e34cdad@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bdaee8a-b327-d97f-a96a-25367e34cdad@linaro.org>
X-ClientProxiedBy: DM6PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:5:190::39) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|SN4PR0801MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: 155a87bc-8b9c-4962-f26a-08db6adc23bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwJjUfQjtg8Ovy7GmIPmWhps50iS9A12SLed87OZr5VCyxJB4uIUMid8c2wxkoIpxo7KFJHJ44TUnN+LxaZjSdC+6j7MW1hP53Es19RzuF41wZJgmOu9K4BVoeBPEtByn11oeYvY0OpRhwboAd8X3j/Nq1qXIPMZ0Antj+mE0e0IOZfxgeecpwgv6trrc8mt3MfwXcKM2YRN6v38fiB9Vzy8idEXoBFUNjYdAn8f8poCYw8+Ejj5YHSw4vwlZo61KeHw5qsMbsi9UZXFmLKump3lczh7lPx8eYye6pMOxx0VysdHAeGTfoo9mv+18hn9q9wKcb6gkM29N4m/xA4tSBJ8c5uRr/F61GUN2KdFNjCJqrx4qoTSmiOH7nZ5aTOfRvRUO7F6+zn6xRcRz4XwSy5v1yl50vayf22DJOGb/79hiZyIGRlfG5biT8BZz3u76rv8KX1+/ax5h2it2dNZl83lqykhkxtissbm0QHtxnigaYoPayjVPdYYZ3fsSwrUvRtHiMoqz2K6OjKJ7aXYEr/nYLo9DGMO1qgJo0iYRwIRlXgL7vf1NCsgCFmQVlNh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(366004)(396003)(39830400003)(376002)(136003)(451199021)(66899021)(26005)(6512007)(41300700001)(6506007)(9686003)(5660300002)(186003)(53546011)(33716001)(66946007)(4326008)(6666004)(8936002)(83380400001)(66476007)(66556008)(478600001)(8676002)(2906002)(86362001)(6486002)(6916009)(316002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o/Yi+AtkdBbSmU2Gz/kZIOHIADMmUM0cFm5EHWzXnl4dDdi4QIwix6LJEgGw?=
 =?us-ascii?Q?cs/KI/BoPGtQp/dIQJJMXeL7uKj3X+GJj6tF78McsWXuy4FJiU+zxtcJR1RN?=
 =?us-ascii?Q?Xa/mScPmbAvW+Hmv0zPXMZ7lOegKIESUZhxrQ+rbDmoNMZYMSotKXSHVTdvI?=
 =?us-ascii?Q?llgv4+wSADmIJPKJDpD6iRQhbTVkOBoiwLjFzjt/lIFVrXB2loCq6sKHxduV?=
 =?us-ascii?Q?40yUmigUvS++kicWk2Slapudr+Wmxf4MaImwP38ZdX99n9hL3tgqg3qzEGLM?=
 =?us-ascii?Q?+tW9iyM0SmyU5slq9l4DeMXoj3wAXXmKtZjVp9kBZHaAASPPnUqqc6xKn1n6?=
 =?us-ascii?Q?94U6/CD/z8aYAk5n6yYpmjRqiUhEv9aUo3RSjlYNuvah5X1qpCA8eRyT8yi3?=
 =?us-ascii?Q?OYPUVWtc6QJtYVKaiZPG5/FEaU4yc8Ah/N8QBI1nWpdAkfh6VB2wnzrjJ0fi?=
 =?us-ascii?Q?uSCLrdYmz738Wk/U/hJld3x4N1F8hv3QX0LGEp6lg6DV1+tmelT0g01gQH9N?=
 =?us-ascii?Q?CYJtHHLnrpWuUQXV2nIJAz7YGevrivllPvwYzOT4J5KGqykOWBnrEI1gqnos?=
 =?us-ascii?Q?ExEbOc5LDwzTckEpclMjMYyOjPlQCXjELh0DxtLGXf4FnZimn4QpC1UFex4x?=
 =?us-ascii?Q?Fb3ZUKu2XaGRGJFxOBjUoMlUP+UNSv7p4jxOdnhe84wY1RN+wiZaq9qoC1uy?=
 =?us-ascii?Q?jbaUgg6bPkP7AceqXBzcZ92S+2MFj8HBObkRjF2ZWkROwpLwAp8O8OJaZGcl?=
 =?us-ascii?Q?7d2aMDYr7ripXcOX0zW90ee5LJpkk1xyguEmIQ2FiKnHHjwvMiJC6ORTH0Hk?=
 =?us-ascii?Q?Bb84eJ5HjpPe7mGpbWvuuyamz2QKkJYFioTVgWVOiQoVfHdgjF+EuXZuOHQo?=
 =?us-ascii?Q?SbmGFnCQFsgoyoekywwaJKj477AEknZ9RxWZ+zVqtkkRAGVfqW/DSSLHsO0O?=
 =?us-ascii?Q?9r9eIp0k8fqc8SL5dmuCDnOrqmrkoi9V8MUjZlb4Jpq66Hwv2f85bN+TKld2?=
 =?us-ascii?Q?e3qtnIJIxG7JrVVpHNkB7CFVOALHtWrVDIMna2AKK51QE+qeBkL4bm6KVzLr?=
 =?us-ascii?Q?HNLTxKZIWeZhJx7VAot8+68ife5+8PqfhHsQQMvX4pK2j7fA4kjZ/wZrMVEJ?=
 =?us-ascii?Q?A2Lgn/h0zCoa2MRY4nbp0MJjo5um2Y5LMztVgH4SHO+kVcXB+UzkUINmo5hk?=
 =?us-ascii?Q?FPFbHWvsQsgenTbV/UPFYAHypk+M9BU4eYU8gR3VXknzfV2PgiLjqbpN2pIJ?=
 =?us-ascii?Q?ICuWj0NT55YvM4NrakRc98KsilOnqgGQ3mWxAe1uclXU/VrDv725nNb3z+fm?=
 =?us-ascii?Q?w5EhuqRsd0jHtCgDVZw9wX2R5eLRG7pyCUZn6FX79UklN9xUbBG/fajiECuJ?=
 =?us-ascii?Q?hfCEAXdPbWtxjbyenYL4jhET/Nf5dftFtgAIdXIIieLtF+TXTwJViEw8vI3T?=
 =?us-ascii?Q?/vo8Q9nRgrz7Y6brvd8U3GLCFAVr24BXsy2liL6CFIh3hBfDUVCWrqjboQlm?=
 =?us-ascii?Q?OM3mUSQlQ27f16/DKWkY/PI83ZNcV0XT50SvE4nt177m5a+2Wi7v1ZHsv9N6?=
 =?us-ascii?Q?A3++PZNksTU+dEp/gvCy4Ct9GyYMMoiIIZ5OOUw9?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155a87bc-8b9c-4962-f26a-08db6adc23bb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 00:29:53.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnU84LrWKlA6JYAWKtQzmckbIeGHFtZUxQJDQTGbDjtOImFX7fYb+ivnKGsKmnE9WOt5fnzGoFBmVNe+nG8YnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7727
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Krzysztof,

On Fri, Jun 02, 2023 at 09:21:00AM +0200, Krzysztof Kozlowski wrote:
> On 01/06/2023 03:23, Jeff LaBundy wrote:
> >>>  
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -173,6 +174,148 @@ properties:
> >>>      maximum: 3000
> >>>      description: Specifies the report rate (in ms) during ultra-low-power mode.
> >>>  
> >>> +  touchscreen-size-x: true
> >>> +  touchscreen-size-y: true
> >>> +  touchscreen-inverted-x: true
> >>> +  touchscreen-inverted-y: true
> >>> +  touchscreen-swapped-x-y: true
> >>
> >> Why? Aren't they coming from common schema?
> > 
> > Yes, but because additionalProperties is set to false here, we must explicitly
> > include the subset of properties from the common schema that are allowed for
> > this particular instance. I counted over a dozen other bindings doing the same.
> > 
> > In case I have misunderstood, please let me know.
> 
> If you are listing now most of touchscreen properties, it is a sign you
> should use just unevaluatedProperties: false (instead
> additionalProperties) and then no need for any of these here.

At present, touchscreen.yaml offers 17 properties. I am only replicating 5
of them, so this binding may not be such a case for this idea. That said, I
tried your suggestion locally.

In the present implementation (additionalProperties: false), the tooling
rightfully presents an error if the example includes a property that is not
explicitly offered (e.g. 'touchscreen-x-plate-ohms').

If I change the binding to use "unevaluatedProperties: false", the tooling
accepts an example which includes this same property that is not supported
by this particular hardware. This seems like a regression.

In my humble opinion, the present implementation is optimal. It is for that
reason we see multiple bindings with this same block of inherited properties.
I will leave this unchanged; please let me know in case I have misunderstood.

> 
> > 
> >>
> >>> +
> >>> +  trackpad:
> >>> +    type: object
> >>> +    description: Represents all channels associated with the trackpad.
> >>> +
> >>> +    properties:
> >>> +      azoteq,channel-select:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +        minItems: 1
> >>> +        maxItems: 12
> >>> +        items:
> >>> +          minimum: 0
> >>> +          maximum: 13
> >>> +        description:
> >>> +          Specifies the order of the channels that participate in the trackpad.
> >>> +          Specify 255 to omit a given channel for the purpose of mapping a non-
> >>> +          rectangular trackpad.
> >>> +
> >>> +      azoteq,num-rows:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        minimum: 1
> >>> +        maximum: 12
> >>> +        description: Specifies the number of rows that comprise the trackpad.
> >>> +
> >>> +      azoteq,num-cols:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        minimum: 1
> >>> +        maximum: 12
> >>> +        description: Specifies the number of columns that comprise the trackpad.
> >>> +
> >>> +      azoteq,top-speed:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        multipleOf: 4
> >>> +        minimum: 0
> >>> +        maximum: 1020
> >>> +        description:
> >>> +          Specifies the speed of movement after which coordinate filtering is
> >>> +          no longer applied.
> >>
> >> Units?
> > 
> > This is a ratiometric, i.e. unitless value that represents a hardware filter
> > coefficient. It already exists in this binding prior to this patch under the
> > slider-0/1 node and is simply re-used here.
> 
> Then mention the ratio (e.g. "speed of movement expressed as ratio
> of..."). Description said "speed" and we usually measure speed in very
> specific units.

ACK; this is a good call-out. Please note that the existing binding uses the
same language elsewhere; I will mirror the updated language to the existing
instances in a separate patch.

> 
> > 
> >>
> >>> +
> >>> +      azoteq,bottom-speed:
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        minimum: 0
> >>> +        maximum: 255
> >>> +        description:
> >>> +          Specifies the speed of movement after which coordinate filtering is
> >>> +          linearly reduced.
> >>
> >> Units?
> > 
> > Same here.
> > 
> >>
> >>> +
> >>> +      azoteq,use-prox:
> >>> +        type: boolean
> >>> +        description:
> >>> +          Directs the trackpad to respond to the proximity states of the se-
> >>> +          lected channels instead of their corresponding touch states. Note
> >>
> >> Don't split the words.
> > 
> > ACK.
> > 
> >>
> >>> +          the trackpad cannot report granular coordinates during a state of
> >>> +          proximity.
> >>> +
> >>> +    patternProperties:
> >>> +      "^azoteq,lower-cal-(x|y)$":
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        minimum: 0
> >>> +        maximum: 255
> >>> +        description: Specifies the trackpad's lower starting points.
> >>
> >> Why would you need this property? Why does this represent hardware property?
> > 
> > This property and its cousin below define the physical boundaries of the
> > touch surface. They are typically used to mask areas that cannot elicit
> > an electrical response due to manufacturing tolerances or the presence of
> > an overlay. For that reason, they descend directly from properties of the
> > hardware.
> > 
> > Similar properties already exist in this binding for the slider case; this
> > device simply extends the functionality to a second dimenstion.
> 
> OK
> 
> > 
> >>
> >>> +
> >>> +      "^azoteq,upper-cal-(x|y)$":
> >>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>> +        minimum: 0
> >>> +        maximum: 255
> >>> +        description: Specifies the trackpad's upper starting points.
> >>> +
> >>> +      "^event-(press|tap|(swipe|flick)-(x|y)-(pos|neg))$":
> >>> +        type: object
> >>> +        $ref: input.yaml#
> >>> +        description:
> >>> +          Represents a press or gesture event reported by the trackpad. Specify
> >>> +          'linux,code' under the press event to report absolute coordinates.
> >>> +
> >>> +        properties:
> >>> +          linux,code: true
> >>> +
> >>> +          azoteq,gesture-angle-tighten:
> >>> +            type: boolean
> >>> +            description:
> >>> +              Limits the tangent of the gesture angle to 0.5 (axial gestures
> >>> +              only). If specified in one direction, the effect is applied in
> >>> +              either direction.
> >>> +
> >>> +          azoteq,gesture-max-ms:
> >>> +            multipleOf: 16
> >>> +            minimum: 0
> >>> +            maximum: 4080
> >>> +            description:
> >>> +              Specifies the length of time (in ms) within which a tap, swipe
> >>> +              or flick gesture must be completed in order to be acknowledged
> >>> +              by the device. The number specified for any one swipe or flick
> >>> +              gesture applies to all other swipe or flick gestures.
> >>> +
> >>> +          azoteq,gesture-min-ms:
> >>> +            multipleOf: 16
> >>> +            minimum: 0
> >>> +            maximum: 4080
> >>> +            description:
> >>> +              Specifies the length of time (in ms) for which a tap gesture must
> >>> +              be held in order to be acknowledged by the device.
> >>> +
> >>> +          azoteq,gesture-dist:
> >>> +            $ref: /schemas/types.yaml#/definitions/uint32
> >>> +            minimum: 0
> >>> +            maximum: 65535
> >>> +            description:
> >>> +              Specifies the distance across which a tap, swipe or flick gesture
> >>> +              must travel in order to be acknowledged by the device. The number
> >>> +              specified for any one swipe or flick gesture applies to all other
> >>> +              swipe or flick gestures.
> >>> +
> >>> +          azoteq,gpio-select:
> >>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> >>> +            minItems: 1
> >>> +            maxItems: 3
> >>> +            items:
> >>> +              minimum: 0
> >>> +              maximum: 2
> >>> +            description: |
> >>> +              Specifies one or more GPIO mapped to the event as follows:
> >>> +              0: GPIO0
> >>> +              1: GPIO3
> >>> +              2: GPIO4
> >>> +
> >>> +              Note that although multiple events can be mapped to a single
> >>> +              GPIO, they must all be of the same type (proximity, touch or
> >>> +              trackpad gesture).
> >>> +
> >>> +        additionalProperties: false
> >>> +
> >>> +    required:
> >>> +      - azoteq,channel-select
> >>> +
> >>> +    additionalProperties: false
> >>> +
> >>>  patternProperties:
> >>>    "^cycle-[0-9]$":
> >>>      type: object
> >>> @@ -288,6 +431,10 @@ patternProperties:
> >>>            Activates the reference channel in response to proximity events
> >>>            instead of touch events.
> >>>  
> >>> +      azoteq,counts-filt-enable:
> >>> +        type: boolean
> >>> +        description: Applies counts filtering to the channel.
> >>> +
> >>>        azoteq,ati-band:
> >>>          $ref: /schemas/types.yaml#/definitions/uint32
> >>>          enum: [0, 1, 2, 3]
> >>> @@ -432,12 +579,12 @@ patternProperties:
> >>>              description: |
> >>>                Specifies one or more GPIO mapped to the event as follows:
> >>>                0: GPIO0
> >>> -              1: GPIO3 (IQS7222C only)
> >>> -              2: GPIO4 (IQS7222C only)
> >>> +              1: GPIO3
> >>> +              2: GPIO4
> >>
> >> Why changing this? Is it valid for IQS7222A?
> > 
> > It's not, only for 'C' and now 'D'. However, the restriction for 'A' is already
> > conveyed in an if/then schema in the original binding. So rather than updating
> > this text to say "(IQS7222C and IQS7222D only)", I opted to drop the open-coded
> > text and rely on the existing schema.
> 
> OK
> 
> > 
> 
> 
> Best regards,
> Krzysztof
> 

Kind regards,
Jeff LaBundy
