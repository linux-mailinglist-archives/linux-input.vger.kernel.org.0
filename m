Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0405F0EB6
	for <lists+linux-input@lfdr.de>; Fri, 30 Sep 2022 17:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbiI3PV3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 11:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbiI3PV2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 11:21:28 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10olkn2102.outbound.protection.outlook.com [40.92.40.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD7DD169E63;
        Fri, 30 Sep 2022 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R6BczkKvN1HNNTVYdhJvYZw0yY3FUBJskYEhll0H7igTuyjErUSxtGrdikbVZ55G0Jt8z3izp8+XV5JCjDFLkBjBiAt4YjSr/uW3o8h4A5M12a9AD6uhdKGDoq/GKLxnZjJLxski6oI5xUieDezDm/Xv6OeZZiwMcqKv1+YyVqGxxHWVrUthWsrbSbyGtucTtDb1S1YIF/i5qGzm+o9tzOkcSa0dCZg2ue54uQ2bFbhWeZSm1lNJSAAcWUnt6rhEZ0VhYCRbV8YypV7qZeR2C1w1xj3KVOPIHdUd99YEYz0EO6UkKZTu8UxycWa0zEPr/JrIiM11kcJQY/dSV+aFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCfijvsf5nlN3OXmfgox/GfKHN3KH0rubdPFX36Je1o=;
 b=hu4kx+m8X6Yl5BCUBNJgsqYSyUuCR7KBZhm9IALsxSdBusXhlguc4Vib8jfce7q2lTYLafPJbl6A98ZfWr8UtPvIGXqrhGrXTnb0me1eobhPKi5CBMs8W5Nf3P99Wq4yNkkPgORbhe/YCV+ZCK83OH2OiuHcGSp/BTCFB+gRsNw6VfR3xNo8fZk79IzKLZESeV+tMb06oAxmFHhPQogsH+EbjLO0l9UAtb8RPnZ6b0QodObpLgrL2REhKs5IZP2ol2ftSzkeSr43glTnfxlNxRUBhcRWUzeZdTcsJtO0KgZimKJ6mMT6jE1PLmnBmF3No2yxkWBxcNuQWu4y6mRq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCfijvsf5nlN3OXmfgox/GfKHN3KH0rubdPFX36Je1o=;
 b=ih1jOPb6HxKvYJhirjNaWFvQa4rOVjkl7y/cKJAWDwq0azX/G+P7lZJYsHtxBrQ5FOYdiPj6NAug5C9KoZq9VAl/UhByDhI8skyPFZy29GHSd2LsTku9VkOkMgOlJc+dPQGd1IlQwFIXb/X1rDjb+t2/gUpulY0JTv31sJvyJEzylhTbWf0IZquwjZoMJsJE4Ds3qKJQQy3sOBBnLpaMd2vOnWk8U/c/rvXoOY8vO3ab7Ly/w5JDvP5acB9B+z3Og9subaKf79EhSt5+Ylzzsk+eQTHoVvSbA5r9baWISFmmZtVr2XhwPajvrUVnNj5Hd/p5eobfWNIxxQ/LXx+jbw==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by BLAPR06MB6866.namprd06.prod.outlook.com (2603:10b6:208:297::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 15:21:26 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::433a:1493:6a39:ee43%5]) with mapi id 15.20.5676.017; Fri, 30 Sep 2022
 15:21:25 +0000
Date:   Fri, 30 Sep 2022 10:21:21 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, rydberg@bitmath.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com
Subject: Re: [PATCH 2/3] dt-bindings: input: touchscreen: Add Hynitron cstxxx
 bindings
Message-ID: <SN6PR06MB5342305DA33462161BC7020DA5569@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220928214806.13572-1-macroalpha82@gmail.com>
 <20220928214806.13572-3-macroalpha82@gmail.com>
 <bcf0e3fe-ba69-2898-ed99-49afd08d1f72@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bcf0e3fe-ba69-2898-ed99-49afd08d1f72@linaro.org>
X-TMN:  [FjWmZsnzKntmfmFYg+CrKIZWYqqGk9Qx]
X-ClientProxiedBy: DS7PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::29) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220930152121.GA20@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR06MB5342:EE_|BLAPR06MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 937485ec-78f2-42c8-0817-08daa2f76f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXoi2LDyAI9iQYRWocjkl0kmSewFS58j73cSPWQLVLhdyYtwQfQAinKRyOJw48rVj+bNwDiwdwag0ikuTqsXEPJw77VKiBI3/HzMPAzTttQJG16vbW8uNWekRYUjYhhuGMq6XvUCryeRDl0TrtZj2Cr5bsFxDtYz4UrMadgoNZPZSBHgMxhE7PxweXvXWSzCo+4uOZksSLa/3TaGniMWJGBZZm8aaZcIF2bQUZ6gvhkQC8FXBsUvsgGv8Zq/f1OmhR0e0lnfXTCz3SeToYq6u5Fcid5u6XqVEJyUGk3g4PW9zsXymWxoboF7GxLIRXhn8zlyaTz/oSKd3FHJ/sXXIwEwvBbUG85kiVCziqKzgBKJ5noYxzrw5IBi1tjDTND3ymGbGZpxSPrl7eraytKfwb19dZtIfKl9lNGpcnSzur1XvJEA5H8Iqv2GjS3O2/WLOtxUmkk+q6XV7S+s8xqRRhJOF4XI79nrfE6jJmiBxjyxNhtJj67piYX6v6/HkuQUzTNI9ZPtG7lcrLKVCtAMFPiWzBnkzCBl8KoCptaLwn3l5trYnr9hyj/tvKknCCWYEYUb6RM1HWXpCDONKzfNJFCTPkGJR8YtpZjaYUFM2Zl7kiqsC9HfHkt3ArPc+YneZIzERjqPZLFMUGKww7Q7WNRnojkEzByL3VB5PX0DTmfEJXikTpnXtO3bGmZF/IRS
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+B2FkOLhZy+IaTHF3Eo5lj6HoVmZevDoMrlssXlIKwzZ7rK3aSSNPh5fOtrN?=
 =?us-ascii?Q?fRPf76a+YdqWG0oAx62aJmqFX1VfekZ3WNy6dgeFB4XjWn9ufIN14pHpL6jU?=
 =?us-ascii?Q?bKGhWGTeDBUpob69RANmWHqMmiAxN4L+XQpF15f1C7/F/87heVMdpb+J2fON?=
 =?us-ascii?Q?ebdjD/asw+rwju/bVtl2xnaCMDhDDMCnoJ41XJavTPIYpEqfotDneqd6//B5?=
 =?us-ascii?Q?zvqhMu24B5/Oti4FIszCsbXpHt3gvNL4f4NhCldu5qS4bK4F8IOlfcqxXksL?=
 =?us-ascii?Q?LGyH0OMQjHjjt99xNYNE25iFEEcDUNupYjnK86Od2wd1TqfUYtr+5HlWwTeP?=
 =?us-ascii?Q?nSHekbfmnA3ylrwYgLhf/3F3FL8IFef3qOMoD+qyV7UwvQifks3+/VYuRn+B?=
 =?us-ascii?Q?/xMB02DLnidR5tBuUX5/bGoa2G/BroDcEMb52AJKUkCGqU621X/u+kPWHOx7?=
 =?us-ascii?Q?N4/bze7gGZA4ND3W3DEzJHDLw9Glpl0j3UF15i2Yi5b/c3xfQ1/cwmwmRzS6?=
 =?us-ascii?Q?iCifyzcLqZAMdAj8L1tZKtTF831RmIwqCskgrUGCHk4ZQHr6fHeriJ4V7UsN?=
 =?us-ascii?Q?2lKAHWqyEoVX0Jjf4V5RIW2mmQn2MXhJ+ld1gG7RUeMD44czxzOGV6yZAq+r?=
 =?us-ascii?Q?eHqnbIvZpmA/XbydQtTqu3FhpPfRLXbDBI5xQ5+F+QzmWQk7t15Ps+xLKfBR?=
 =?us-ascii?Q?1JtFjT1a/9hZmhNBbE0K03bMQ8PtdqLXl7YDT4RtWmdy3861EflRQfPcIgcV?=
 =?us-ascii?Q?4naNjGFgUkgDY20J9f6A6JRvPeKLoGnMjLChjPKUCDOmsyE0U3lGB/C50oko?=
 =?us-ascii?Q?ciOGv/Q57jX0WwDOH8UaMUD+XN1aHrItl7s987hUhpkc+WU/+yBAc1aiDPT6?=
 =?us-ascii?Q?cflect+XKdzuNqJx3uFkN1iUn6SE+vrYEhI9EYIs5ENlEwaEWx1umP937bTB?=
 =?us-ascii?Q?Nt9RZFI8A5HcuGlO68pNlwbxcBfv0afM+FsbFMDtLWODhKwGtb5CxJ35IN2y?=
 =?us-ascii?Q?kGbkSkg4KWrEWq1hMfAIFOf4Afb3ruXkn3JOSBweAq/6AanrEJ7cCBCk8P4W?=
 =?us-ascii?Q?RwydrpaoW8q74yIlDMosnyA80g613o3WhHCg5zNAdbAWFLMKRjDqghUirBRt?=
 =?us-ascii?Q?S2q8SNy2Bc85mGbpGtNDxqlRJ5LfVWRTgRQRLGmj/fXZoVba9l+SXxMSByaj?=
 =?us-ascii?Q?INdflX88Wkfj+LGGNLmq1P1/P03FMCRo+4OIlQqBFYqwn8K4UTndeCT2Vjxh?=
 =?us-ascii?Q?6C4Ah16dhXLwI5ICiwraUxPoffCxo39n9ZQGpV8mfg=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 937485ec-78f2-42c8-0817-08daa2f76f8b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 15:21:25.8505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR06MB6866
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 30, 2022 at 12:54:34PM +0200, Krzysztof Kozlowski wrote:
> On 28/09/2022 23:48, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add documentation for the Hynitron cstxxx touchscreen bindings.
> > Hynitron makes a series of touchscreen controllers, however for
> > now this is expected to only be compatible with the cst3xx series.
> 
> Drop redundant (second) bindings from subject.

Acknowledged.

> 
> > 
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../input/touchscreen/hynitron,cstxxx.yaml    | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> > new file mode 100644
> > index 000000000000..c98d14e9844a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fschemas%2Finput%2Ftouchscreen%2Fhynitron%2Ccstxxx.yaml%23&amp;data=05%7C01%7C%7C15d98f57ab8a4668227508daa2d22a4f%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C638001320776366532%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=qn5TpFejnoa7B3eo6vM3FkKwoi8kAWo1IgxMlKWCkJM%3D&amp;reserved=0
> > +$schema: https://nam12.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=05%7C01%7C%7C15d98f57ab8a4668227508daa2d22a4f%7C84df9e7fe9f640afb435aaaaaaaaaaaa%7C1%7C0%7C638001320776366532%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=zdV1diLy%2FujTHO6DB2%2BqMp47Eafi4Uz%2FK1kChij4CiQ%3D&amp;reserved=0
> > +
> > +title: Hynitron cstxxx series touchscreen controller bindings
> 
> Drop "bindings"
> 

Acknowledged.

> > +
> > +description: |
> > +  Bindings for Hynitron cstxxx series multi-touch touchscreen
> > +  controllers.
> > +
> > +maintainers:
> > +  - Chris Morgan <macromorgan@hotmail.com>
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - hynitron,cst3xx
> 
> Isn't the panel CST3240? No wildcards in compatibles.
> 

The controller IC I'm using is CST348. This driver SHOULD
also work with a CST340 and a CST356 (untested though).

Should I just have 3 compatible strings then, one for each IC?
I could also just have cst340 as the compatible and note it
should work for the 3 ICs listed.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> 
> Best regards,
> Krzysztof
> 

Once again, thank you for your input.
