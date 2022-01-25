Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDDD49A6A0
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 03:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3419723AbiAYCUK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 21:20:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S3416032AbiAYByL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 20:54:11 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::607])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EA9C028BFE;
        Mon, 24 Jan 2022 17:14:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuBrcmX69g/0dhOz6+2f95ZZb7tSOAatpcsEXOxxsYRz+3DHybhdoyF26cV+zEwe9+8AhEBlisXaDSivPhgPP3cuZ8DUVBlL9j/jT7U9glZsN55lt6+lnxg98mWnAMfUcACD3fWGQmCuEYVrCRrNzJPH8K3JGzrgJ3rIydIoxnSFdE158L4eiYsH9y0iEFKidBkU/A+2te1fixB7JyI5O/C4vqwdgM0JbPAbYvj+/W/KizFb1ExnoV7aBlDqJ24Ek4HZ2mk1Abh5nXs0osY8Ubfrs+6mEU++hParG/2urr8/RAcoVsfvtxbV4UEr+t36z9hwvvjVvgqfCA0h3q6Jhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxdJThU+sEX9KktssoTZzzyJuaMvQxyyCypv68wNuNw=;
 b=UpvLFt7/NCHhaYIonM9ODl5l63DXT1pwlw5BR3kH7CxxG6OEDmeURjbd7J3fLKIZAUvmgeDM74X6qxGaYhMN1BRQ9K9l4MRKLJ+dNgri+jpghu3dgjI4AIG2LSM/aaU0XbHvUvSRxsE2EXPFej0Cx365nU3UJYoIMG/uuNe5jm1oJahHfJlNgtnDzxXByrXrx8RvogzA2CrkWX6CTuLA9puTUC5PwVkL8ArrkL987SO/Im5c3Wh58EjoxvtO542lAt62s9Q5VwIg0fTGawmyi+4x0dVeRqYbuAcPXLLdKLBDw+ZC9WvL0s2Qv0FQPe2FxFaPBAI1+7fK1S+/76y3ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxdJThU+sEX9KktssoTZzzyJuaMvQxyyCypv68wNuNw=;
 b=t3Zq0Zf061VTLpDI4mlKi0Q4/gRJcaQ3Nef8W2BIRAIDZyXpJ5z6kTp7dKk+/zgPHaAyMwDOvQKyZoDNnFsU+fn/n9BtGR+nR7204qtu3cIpUlPGPcSbxsbKnf27PL3CkQNQ0m5FGSlvyGC6OmC8QZWLjOE/0k7K1u2zd2UWSus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by CO1PR08MB6997.namprd08.prod.outlook.com (2603:10b6:303:d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Tue, 25 Jan
 2022 01:14:10 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::e8be:49c5:397e:d3ba%5]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 01:14:10 +0000
Date:   Mon, 24 Jan 2022 19:14:03 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7222A/B/C
Message-ID: <20220125011403.GA5131@nixie71>
References: <20220123194232.85288-1-jeff@labundy.com>
 <20220123194232.85288-2-jeff@labundy.com>
 <Ye8158K42TLfG+7I@robh.at.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ye8158K42TLfG+7I@robh.at.kernel.org>
X-ClientProxiedBy: SN7PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:806:f2::9) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91eb74c3-eef5-4500-0c63-08d9df9ffdb6
X-MS-TrafficTypeDiagnostic: CO1PR08MB6997:EE_
X-Microsoft-Antispam-PRVS: <CO1PR08MB6997DBCEDA8C3BC697CE617ED35F9@CO1PR08MB6997.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CjQA828/ySpkoqwBxFxhdjfh9vlTNEIDGGghQG+0NPh1jPCH7798tQfcrWRQEOo+9+Kc5wcUITpVuU4atBMwUtY4zDvn+FHMn+vHThwDAM4964gq1I7iP74r65obUD/IJwECQmkNB8vYIu7Uh0cRz01ze7ut4wjBl50WWpaKMUKQzVdUK7ugb3yarG/cqaZb2ErB9xS7RJfuVIsVcCkC1XQcW8BSNfXRRB12cFJ6Sd5nmlIoUyNKgolHpK01x9tpcsQ78wofFChXJmm25X3IBXg1DPaEXoqXuAUCsI+/+zIFDA3VCoXtm8T8+HxLTV1QzzauTMx6usEAWeLrkK0Gad40TFxt5PUhqZ68gv7r35ZXWtW/t+crzw22ZUZAdZKDl/tflCZeSXXDM7GrUl6JbNpd5/y01icXkd1lhPnc5qzruvQES0hjWSCAkJIAKBh7Ca/ZVc96vA5uEjToNKxn10AqPC5jjpR0VQbGZ6jNPSDG3Ov6fAhjET9hB1zeFcQVhO5uM6BL+E1EBjYDCYryRjhex42BDjDd3fuaR7ZGPH1px8HdaWfigj9gPhgw2wZRmfCtUge3paxj4Xyxs8idppBUD/fviPlz7XDdx+FvcHW34jnTUhrJvxf1Ri3x7++c4e+dg2WNnJM/hNImlX/GE2umd3FX5w+1Ei8JrOQ0ILpIOslj4s67C3MIMrT6HFOlff6GiCD+EaVT+z2pGDC+Frozuf92YdRYtL8P4bjEIUSMmFgd8n8MtljynRbQPE8SNCsxLsJEp1AHOziaQF5DDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(396003)(136003)(39830400003)(346002)(376002)(366004)(6486002)(86362001)(52116002)(26005)(66556008)(83380400001)(6506007)(2906002)(186003)(966005)(4326008)(6916009)(66946007)(38100700002)(66476007)(38350700002)(508600001)(1076003)(6666004)(8676002)(30864003)(8936002)(33716001)(33656002)(5660300002)(9686003)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D4ax0mElhyDZpH+OLKcyhZljY8RJFN0OKwAWSG1318aq2us9A67VcFASs/5O?=
 =?us-ascii?Q?NeQDJB/xAqn7gPxU7UwztLz95XFYfLQUds/WgWiUhRJwJpsSoGFF8AyKBW2D?=
 =?us-ascii?Q?H6a3KOzBEqz7Iy3OhPgdtof8Ai8peqw+jxtVPkCgwIwNE8nfJgDi66h3+1vo?=
 =?us-ascii?Q?TRaNo+m0JyA7NiRyNLIK2xbdZ1uEyH/bcvbXH1shu8XDIDeAoML4qlCCCrWh?=
 =?us-ascii?Q?FIuRyK1tX/D2z28ZSH4rACEkJSK22wX++L/4XnKaO0ptrN6gISht7qhhp9kk?=
 =?us-ascii?Q?IhZHGceNMG/OCglVphxu0M+wTARohwfa/NFwwUnxYnfdFwnmiqty+sj0rHmA?=
 =?us-ascii?Q?IJm5UJxgsHgivyBebAjFInOPsJ/SdwbcVwNGo0XhEsggZyZYR7OtbnaMSunL?=
 =?us-ascii?Q?jwelmArL9XrIgUVacaxARG4+9fEGN/cWoiUR+2YwKkRcxr3kyIADpMXb9wIQ?=
 =?us-ascii?Q?BScEvVq88yJwmB7ZjNPz9zOLoJf8cDXiCcuQc5HgGZaXYVbEBiTQ61PeMuwg?=
 =?us-ascii?Q?MQTL+OpSJ3WwTvyLz+Cuxacc1w3Eqpu7nvpY1o2ArkoQ5xygWJ0fqXxuYsbR?=
 =?us-ascii?Q?DrZGNM1K3lgKRqESYZnEb7Wwzvh2gHxsGM6N3euIidwXhBu3s1CAhhy1ZfrC?=
 =?us-ascii?Q?7/1Izf7HvBCPjsU0qOoCl8Y+MpbyiDsEl4D8ItXNlswgUag9a0gflrGI0C4i?=
 =?us-ascii?Q?Q1K5M9Lg82sdYUulNwaEOHvkn/4Fc2nkH/1kt+buZ9Dm960Gp0rb8oCO4E1+?=
 =?us-ascii?Q?I8GNO7qfMOftZCIcu0g86LlfKHXpBDQGzvmhOXXKaYfMyuqU6dGMI4K6HBbl?=
 =?us-ascii?Q?d/nQTITxJQAQFnPuBwi7tgQylAU1F1XxQItUiLeecOd+5o+aD3nUzfhJQaih?=
 =?us-ascii?Q?QY656ttFOmZ/cTzd4fPc9pKgEALEKDtr4UrsUbXIo4nVqGwhcj7STEPS7wbl?=
 =?us-ascii?Q?2F3evM2pCjtXzyiECdkE2S1fvfat1mQ11mfYWFyrmqCVrEt/Xh9rfWbMndRH?=
 =?us-ascii?Q?cubWM+dj/KvDGktS0dgNPVJj9EaMqvxEHJOSAwCZ9o7TsSQHJu6u7Op6cXIP?=
 =?us-ascii?Q?FVV7xDT3FVsPtYoJS/2NAaR5uoHGScJ50jv/DSdfH1rWptOLtIP7S7s67VRc?=
 =?us-ascii?Q?LesoQUoxRsmhXowFDAut8qBk6lPWd03VDvAV5EVASo6C3B6B72mRLPx6+x3K?=
 =?us-ascii?Q?BvxtXk/VN/C51r2K+dXD6NE2YGNpvr+Rz1mtx1BRR+Ryu1MVeY04ZNCS+1xF?=
 =?us-ascii?Q?x3oEodahsOdmSRzdiFkrCry7v1WyXEQCeogrhpDlqDcoenqRJNGOVEAxSlQs?=
 =?us-ascii?Q?9Ad8rmOH4iekWL/F6jQiFhJU+jzr91sHLuXjY3TS6LiToCIxx6gCpfvVYmIV?=
 =?us-ascii?Q?BncY14fo9tA5d9NGeC8soGa2tngSAMN0lRY21Fhv/3pTjUSVzkJ2snF8e0D+?=
 =?us-ascii?Q?oZ1T2TavdUsiFk62bDPYWNXXJo3fBFKfwYi3OgHvwOiFBV521zB6DDVdSxGd?=
 =?us-ascii?Q?qzMYmDyjmkJbKtu+KMj30NFMD+rv5aJ18P+TJPfyW8q/xoHKbVj8W6CzkSbB?=
 =?us-ascii?Q?ocs++G9YO+iLotb7283cYfN5rDepDtVoZgL8z/EqhRrqa/CGY0HGfNLhJphk?=
 =?us-ascii?Q?Y1zcZWbWJ0vwdL+4uM6FfQY=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91eb74c3-eef5-4500-0c63-08d9df9ffdb6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 01:14:10.3082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: em6uOcS+yFxHOaIgYaZePsJnbITHI+gwsV9KMCTfWa1aWqplJdOW1wyj8dRQLEFX3VB9pr21dCSEWo2hvfjHdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6997
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thank you for your prompt review.

I missed the new DT_CHECKER_FLAGS since I last submitted a binding; I
will take a look at what is happening there.

On Mon, Jan 24, 2022 at 05:27:35PM -0600, Rob Herring wrote:
> On Sun, Jan 23, 2022 at 01:42:31PM -0600, Jeff LaBundy wrote:
> > This patch adds bindings for the Azoteq IQS7222A/B/C family of
> > capacitive touch controllers.
> 
> Overall, wow, that's a lot of properties. It leaves me wondering why 
> does this h/w need so many and others don't?

Indeed, we had a similar discussion in [1] for a related device. The
reason is that these devices support several additional sensing modes
(e.g. self/mutual capacitance, inductive, Hall), with many registers
that may need to be configured differently based on use-case.

Devices with this level of configurability (e.g. touchscreens) often
lack long bindings because they simply rely on firmware from a vendor;
however, these particular devices have no nonvolatile memory.

[1] https://patchwork.ozlabs.org/patch/1273068/

> 
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  .../devicetree/bindings/input/iqs7222.yaml    | 967 ++++++++++++++++++
> 
> azoteq,iqs7222.yaml

Is this a new standard? I'm happy to do this; just trying to understand
if I should send a separate patch to rename all other .../input/iqs*.yaml
bindings that don't follow this convention.

> 
> >  1 file changed, 967 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/iqs7222.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/iqs7222.yaml b/Documentation/devicetree/bindings/input/iqs7222.yaml
> > new file mode 100644
> > index 000000000000..0c23d1d49ebd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/iqs7222.yaml
> > @@ -0,0 +1,967 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/iqs7222.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Azoteq IQS7222A/B/C Capacitive Touch Controller
> > +
> > +maintainers:
> > +  - Jeff LaBundy <jeff@labundy.com>
> > +
> > +description: |
> > +  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
> > +  controllers that feature additional sensing capabilities.
> > +
> > +  Link to datasheets: https://www.azoteq.com/
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - azoteq,iqs7222a
> > +      - azoteq,iqs7222b
> > +      - azoteq,iqs7222c
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  irq-gpios:
> 
> Use 'interrupts'. Interrupt capable GPIO lines are also interrupt 
> providers.

This device is a bit like the Goodix touchscreen where we need to bring
in the interrupt as a GPIO for some additional functions besides just an
interrupt. From a comment I added to the driver:

/*
 * The RDY pin behaves as an interrupt, but must also be polled ahead
 * of unsolicited I2C communication. As such, it is first opened as a
 * GPIO and then passed to gpiod_to_irq() to register the interrupt.
 */

There is no equivalent irq_to_gpio(), so I opted not to use 'interrupts'.
The Goodix example specifies both, but this is redundant. In the driver
I have added logic to apply the GPIO polarity specified in dts to the
IRQF flags.

> 
> > +    maxItems: 1
> > +    description:
> > +      Specifies the GPIO connected to the device's active-low RDY output.
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Specifies the GPIO connected to the device's active-low MCLR input. The
> > +      device is temporarily held in hardware reset prior to initialization if
> > +      this property is present.
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  azoteq,rf-filt-enable:
> > +    type: boolean
> > +    description: Enables the device's internal RF filter.
> > +
> > +  azoteq,max-counts:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Specifies the maximum counts as follows:
> 
> Counts of what?

ADC counts before an internal interrupt is generated; I will add some more
details here.

> 
> > +      0: 1023
> > +      1: 2047
> > +      2: 4095
> > +      3: 16384
> > +
> > +  azoteq,auto-mode:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1, 2, 3]
> > +    description: |
> > +      Specifies the number of conversions to occur before an interrupt is
> > +      generated as follows:
> > +      0: 4
> > +      1: 8
> > +      2: 16
> > +      3: 32
> > +
> > +  azoteq,ati-frac-div-fine:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 31
> > +    description: Specifies the preloaded ATI fine fractional divider.
> > +
> > +  azoteq,ati-frac-div-coarse:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 31
> > +    description: Specifies the preloaded ATI coarse fractional divider.
> > +
> > +  azoteq,ati-comp-select:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 1023
> > +    description: Specifies the preloaded ATI compensation selection.
> > +
> > +  azoteq,lta-beta-lp:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the long-term average filter damping factor to be applied during
> > +      low-power mode.
> > +
> > +  azoteq,lta-beta-np:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the long-term average filter damping factor to be applied during
> > +      normal-power mode.
> > +
> > +  azoteq,counts-beta-lp:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the counts filter damping factor to be applied during low-power
> > +      mode.
> > +
> > +  azoteq,counts-beta-np:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the counts filter damping factor to be applied during normal-
> > +      power mode.
> > +
> > +  azoteq,lta-fast-beta-lp:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the long-term average filter fast damping factor to be applied
> > +      during low-power mode.
> > +
> > +  azoteq,lta-fast-beta-np:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies the long-term average filter fast damping factor to be applied
> > +      during normal-power mode.
> > +
> > +  azoteq,timeout-ati-ms:
> > +    multipleOf: 500
> > +    minimum: 0
> > +    maximum: 32767500
> > +    description:
> > +      Specifies the delay (in ms) before ATI is retried following an ATI error.
> > +
> > +  azoteq,rate-ati-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the rate (in ms) at which ATI status is evaluated.
> > +
> > +  azoteq,timeout-np-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from normal-power mode to low-power mode.
> > +
> > +  azoteq,rate-np-ms:
> > +    minimum: 0
> > +    maximum: 3000
> > +    description: Specifies the report rate (in ms) during normal-power mode.
> > +
> > +  azoteq,timeout-lp-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from low-power mode to ultra-low-power mode.
> > +
> > +  azoteq,rate-lp-ms:
> > +    minimum: 0
> > +    maximum: 3000
> > +    description: Specifies the report rate (in ms) during low-power mode.
> > +
> > +  azoteq,timeout-ulp-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description:
> > +      Specifies the rate (in ms) at which channels not regularly sampled during
> > +      ultra-low-power mode are updated.
> > +
> > +  azoteq,rate-ulp-ms:
> > +    minimum: 0
> > +    maximum: 3000
> > +    description: Specifies the report rate (in ms) during ultra-low-power mode.
> > +
> > +patternProperties:
> > +  "^cycle-[0-9]$":
> > +    type: object
> > +    description: Represents a conversion cycle serving two sensing channels.
> > +
> > +    properties:
> > +      azoteq,conv-period:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the cycle's conversion period.
> > +
> > +      azoteq,conv-frac:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the cycle's conversion frequency fraction.
> > +
> > +      azoteq,tx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 9
> > +        items:
> > +          minimum: 0
> > +          maximum: 8
> > +        description: Specifies the CTx pin(s) associated with the cycle.
> > +
> > +      azoteq,rx-float-inactive:
> > +        type: boolean
> > +        description: Floats any inactive CRx pins instead of grounding them.
> > +
> > +      azoteq,dead-time-enable:
> > +        type: boolean
> > +        description:
> > +          Increases the denominator of the conversion frequency formula by one.
> > +
> > +      azoteq,tx-freq-fosc:
> > +        type: boolean
> > +        description:
> > +          Fixes the conversion frequency to that of the device's core clock.
> > +
> > +      azoteq,vbias-enable:
> > +        type: boolean
> > +        description: Enables the bias voltage for use during inductive sensing.
> > +
> > +      azoteq,sense-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          Specifies the cycle's sensing mode as follows:
> > +          0: None
> > +          1: Self capacitive
> > +          2: Mutual capacitive
> > +          3: Inductive
> > +
> > +          Note that in the case of IQS7222A, cycles 5 and 6 are restricted to
> > +          Hall-effect sensing.
> > +
> > +      azoteq,iref-enable:
> > +        type: boolean
> > +        description:
> > +          Enables the current reference for use during various sensing modes.
> > +
> > +      azoteq,iref-level:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the cycle's current reference level.
> > +
> > +      azoteq,iref-trim:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the cycle's current reference trim.
> > +
> > +    dependencies:
> > +      azoteq,iref-level: ["azoteq,iref-enable"]
> > +      azoteq,iref-trim: ["azoteq,iref-enable"]
> > +
> > +    additionalProperties: false
> > +
> > +  "^channel-[0-19]$":
> > +    type: object
> > +    description:
> > +      Represents a single sensing channel. A channel is active if defined and
> > +      inactive otherwise.
> > +
> > +      Note that in the case of IQS7222A, channels 10 and 11 are restricted to
> > +      Hall-effect sensing with events reported on channel 10 only.
> > +
> > +    properties:
> > +      azoteq,ulp-allow:
> > +        type: boolean
> > +        description:
> > +          Permits the device to enter ultra-low-power mode while the channel
> > +          lies in a state of touch or proximity.
> > +
> > +      azoteq,ref-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 9
> > +        description: Specifies a separate reference channel to be followed.
> > +
> > +      azoteq,ref-weight:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 65535
> > +        description: Specifies the relative weight of the reference channel.
> > +
> > +      azoteq,use-prox:
> > +        type: boolean
> > +        description:
> > +          Activates the reference channel in response to proximity events
> > +          instead of touch events.
> > +
> > +      azoteq,ati-band:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          Specifies the channel's ATI band as a fraction of its ATI target as
> > +          follows:
> > +          0: 1/16
> > +          1: 1/8
> > +          2: 1/4
> > +          3: 1/2
> > +
> > +      azoteq,global-halt:
> > +        type: boolean
> > +        description:
> > +          Specifies that the channel's long-term average is to freeze if any
> > +          other participating channel lies in a proximity or touch state.
> > +
> > +      azoteq,invert-enable:
> > +        type: boolean
> > +        description:
> > +          Inverts the polarity of the states reported for proximity and touch
> > +          events relative to their respective thresholds.
> > +
> > +      azoteq,dual-direction:
> > +        type: boolean
> > +        description:
> > +          Specifies that the channel's long-term average is to freeze in the
> > +          presence of either increasing or decreasing counts, thereby permit-
> > +          ting events to be reported in either direction.
> > +
> > +      azoteq,rx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 4
> > +        items:
> > +          minimum: 0
> > +          maximum: 7
> > +        description: Specifies the CRx pin(s) associated with the channel.
> > +
> > +      azoteq,samp-cap-double:
> > +        type: boolean
> > +        description: Doubles the sampling capacitance from 40 pF to 80 pF.
> > +
> > +      azoteq,vref-half:
> > +        type: boolean
> > +        description: Halves the discharge threshold from 1.0 V to 0.5 V.
> > +
> > +      azoteq,proj-bias:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3]
> > +        description: |
> > +          Specifies the bias current applied during mutual (projected)
> > +          capacitive sensing as follows:
> > +          0: 2 uA
> > +          1: 5 uA
> > +          2: 7 uA
> > +          3: 10 uA
> > +
> > +      azoteq,ati-target:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        multipleOf: 8
> > +        minimum: 0
> > +        maximum: 2040
> > +        description: Specifies the channel's ATI target.
> > +
> > +      azoteq,ati-base:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        multipleOf: 16
> > +        minimum: 0
> > +        maximum: 496
> > +        description: Specifies the channel's ATI base.
> > +
> > +      azoteq,ati-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        enum: [0, 1, 2, 3, 4, 5]
> > +        description: |
> > +          Specifies the channel's ATI mode as follows:
> > +          0: Disabled
> > +          1: Compensation
> > +          2: Compensation divider
> > +          3: Fine fractional divider
> > +          4: Coarse fractional divider
> > +          5: Full
> > +
> > +      azoteq,ati-frac-div-fine:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the channel's ATI fine fractional divider.
> > +
> > +      azoteq,ati-frac-mult-coarse:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the channel's ATI coarse fractional multiplier.
> > +
> > +      azoteq,ati-frac-div-coarse:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the channel's ATI coarse fractional divider.
> > +
> > +      azoteq,ati-comp-div:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the channel's ATI compensation divider.
> > +
> > +      azoteq,ati-comp-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 1023
> > +        description: Specifies the channel's ATI compensation selection.
> > +
> > +      azoteq,debounce-enter:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the channel's debounce entrance factor.
> > +
> > +      azoteq,debounce-exit:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the channel's debounce exit factor.
> > +
> > +    patternProperties:
> > +      "^event-(prox|touch)$":
> > +        type: object
> > +        description:
> > +          Represents a proximity or touch event reported by the channel.
> > +
> > +        properties:
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
> > +              1: GPIO3 (IQS7222C only)
> > +              2: GPIO4 (IQS7222C only)
> > +
> > +              Note that although multiple events can be mapped to a single
> > +              GPIO, they must all be of the same type (proximity, touch or
> > +              slider gesture).
> > +
> > +          azoteq,thresh:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            description:
> > +              Specifies the threshold for the event. Valid entries range from
> > +              0-127 and 0-255 for proximity and touch events, respectively.
> > +
> > +          azoteq,hyst:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 255
> > +            description:
> > +              Specifies the hysteresis for the event (touch events only).
> > +
> > +          azoteq,timeout-press-ms:
> > +            multipleOf: 500
> > +            minimum: 0
> > +            maximum: 127500
> > +            description:
> > +              Specifies the length of time (in ms) to wait before automatically
> > +              releasing a press event. Specify zero to allow the press state to
> > +              persist indefinitely.
> > +
> > +              The IQS7222B does not feature channel-specific timeouts; the time-
> > +              out specified for any one channel applies to all channels.
> > +
> > +          linux,code:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            description:
> > +              Numeric key or switch code associated with the event. Specify
> > +              KEY_RESERVED (0) to opt out of event reporting.
> > +
> > +          linux,input-type:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            enum: [1, 5]
> > +            default: 1
> > +            description:
> > +              Specifies whether the event is to be interpreted as a key (1)
> > +              or a switch (5).
> > +
> > +        required:
> > +          - linux,code
> > +
> > +        additionalProperties: false
> > +
> > +    dependencies:
> > +      azoteq,ref-weight: ["azoteq,ref-select"]
> > +      azoteq,use-prox: ["azoteq,ref-select"]
> > +
> > +    additionalProperties: false
> > +
> > +  "^slider-[0-1]$":
> > +    type: object
> > +    description: Represents a slider comprising three or four channels.
> > +
> > +    properties:
> > +      azoteq,channel-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 3
> > +        maxItems: 4
> > +        items:
> > +          minimum: 0
> > +          maximum: 9
> > +        description:
> > +          Specifies the order of the channels that participate in the slider.
> > +
> > +      azoteq,slider-size:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 65535
> > +        description:
> > +          Specifies the slider's one-dimensional resolution, equal to the
> > +          maximum coordinate plus one.
> > +
> > +      azoteq,lower-cal:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the slider's lower starting point.
> > +
> > +      azoteq,upper-cal:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the slider's upper starting point.
> > +
> > +      azoteq,top-speed:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 65535
> > +        description:
> > +          Specifies the speed of movement after which coordinate filtering is
> > +          no longer applied.
> > +
> > +      azoteq,bottom-speed:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        multipleOf: 4
> > +        minimum: 0
> > +        maximum: 1020
> > +        description:
> > +          Specifies the speed of movement after which coordinate filtering is
> > +          linearly reduced.
> > +
> > +      azoteq,bottom-beta:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 7
> > +        description:
> > +          Specifies the coordinate filter damping factor to be applied
> > +          while the speed of movement is below that which is specified
> > +          by azoteq,bottom-speed.
> > +
> > +      azoteq,static-beta:
> > +        type: boolean
> > +        description:
> > +          Applies the coordinate filter damping factor specified by
> > +          azoteq,bottom-beta regardless of the speed of movement.
> > +
> > +      azoteq,use-prox:
> > +        type: boolean
> > +        description:
> > +          Directs the slider to respond to the proximity states of the selected
> > +          channels instead of their corresponding touch states. Note the slider
> > +          cannot report granular coordinates during a state of proximity.
> > +
> > +      linux,axis:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Specifies the absolute axis to which coordinates are mapped. Specify
> > +          ABS_WHEEL to operate the slider as a wheel (IQS7222C only).
> > +
> > +    patternProperties:
> > +      "^event-(press|tap|(swipe|flick)-(pos|neg))$":
> > +        type: object
> > +        description:
> > +          Represents a press or gesture (IQS7222A only) event reported by
> > +          the slider.
> > +
> > +        properties:
> > +          linux,code:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            description: Numeric key code associated with the event.
> > +
> > +          azoteq,gesture-max-ms:
> > +            multipleOf: 4
> > +            minimum: 0
> > +            maximum: 1020
> > +            description:
> > +              Specifies the length of time (in ms) within which a tap, swipe
> > +              or flick gesture must be completed in order to be acknowledged
> > +              by the device. The number specified for any one swipe or flick
> > +              gesture applies to all remaining swipe or flick gestures.
> > +
> > +          azoteq,gesture-min-ms:
> > +            multipleOf: 4
> > +            minimum: 0
> > +            maximum: 124
> > +            description:
> > +              Specifies the length of time (in ms) for which a tap gesture must
> > +              be held in order to be acknowledged by the device.
> > +
> > +          azoteq,gesture-dist:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            multipleOf: 16
> > +            minimum: 0
> > +            maximum: 4080
> > +            description:
> > +              Specifies the distance across which a swipe or flick gesture must
> > +              travel in order to be acknowledged by the device. The number spec-
> > +              ified for any one swipe or flick gesture applies to all remaining
> > +              swipe or flick gestures.
> > +
> > +          azoteq,gpio-select:
> > +            $ref: /schemas/types.yaml#/definitions/uint32-array
> > +            minItems: 1
> > +            maxItems: 1
> > +            items:
> > +              minimum: 0
> > +              maximum: 0
> > +            description: |
> > +              Specifies an individual GPIO mapped to a tap, swipe or flick
> > +              gesture as follows:
> > +              0: GPIO0
> > +              1: GPIO3 (reserved)
> > +              2: GPIO4 (reserved)
> > +
> > +              Note that although multiple events can be mapped to a single
> > +              GPIO, they must all be of the same type (proximity, touch or
> > +              slider gesture).
> > +
> > +        required:
> > +          - linux,code
> > +
> > +        additionalProperties: false
> > +
> > +    required:
> > +      - azoteq,channel-select
> > +
> > +    additionalProperties: false
> > +
> > +  "^gpio-[0-2]$":
> > +    type: object
> > +    description: |
> > +      Represents a GPIO mapped to one or more events as follows:
> > +      gpio-0: GPIO0
> > +      gpio-1: GPIO3 (IQS7222C only)
> > +      gpio-2: GPIO4 (IQS7222C only)
> > +
> > +    allOf:
> > +      - $ref: ../pinctrl/pincfg-node.yaml#
> > +
> > +    properties:
> > +      drive-open-drain: true
> > +
> > +    additionalProperties: false
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: azoteq,iqs7222b
> > +
> > +    then:
> > +      patternProperties:
> > +        "^cycle-[0-9]$":
> > +          properties:
> > +            azoteq,iref-enable: false
> > +
> > +        "^channel-[0-19]$":
> > +          properties:
> > +            azoteq,ref-select: false
> > +
> > +          patternProperties:
> > +            "^event-(prox|touch)$":
> > +              properties:
> > +                azoteq,gpio-select: false
> > +
> > +        "^slider-[0-1]$": false
> > +
> > +        "^gpio-[0-2]$": false
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: azoteq,iqs7222a
> > +
> > +    then:
> > +      patternProperties:
> > +        "^channel-[0-19]$":
> > +          patternProperties:
> > +            "^event-(prox|touch)$":
> > +              properties:
> > +                azoteq,gpio-select:
> > +                  maxItems: 1
> > +                  items:
> > +                    maximum: 0
> > +
> > +        "^slider-[0-1]$":
> > +          properties:
> > +            azoteq,slider-size:
> > +              multipleOf: 16
> > +              maximum: 4080
> > +
> > +            azoteq,top-speed:
> > +              multipleOf: 4
> > +              maximum: 1020
> > +
> > +    else:
> > +      patternProperties:
> > +        "^channel-[0-19]$":
> > +          properties:
> > +            azoteq,ulp-allow: false
> > +
> > +        "^slider-[0-1]$":
> > +          patternProperties:
> > +            "^event-(press|tap|(swipe|flick)-(pos|neg))$":
> > +              properties:
> > +                azoteq,gesture-max-ms: false
> > +
> > +                azoteq,gesture-min-ms: false
> > +
> > +                azoteq,gesture-dist: false
> > +
> > +                azoteq,gpio-select: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - irq-gpios
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/input/input.h>
> > +
> > +    i2c {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            iqs7222a@44 {
> > +                    compatible = "azoteq,iqs7222a";
> > +                    reg = <0x44>;
> > +                    irq-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> > +                    azoteq,lta-beta-lp = <7>;
> > +                    azoteq,lta-beta-np = <8>;
> > +                    azoteq,counts-beta-lp = <2>;
> > +                    azoteq,counts-beta-np = <3>;
> > +                    azoteq,lta-fast-beta-lp = <3>;
> > +                    azoteq,lta-fast-beta-np = <4>;
> > +
> > +                    cycle-0 {
> > +                            azoteq,conv-period = <5>;
> > +                            azoteq,conv-frac = <127>;
> > +                            azoteq,tx-enable = <1>, <2>, <4>, <5>;
> > +                            azoteq,dead-time-enable;
> > +                            azoteq,sense-mode = <2>;
> > +                    };
> > +
> > +                    cycle-1 {
> > +                            azoteq,conv-period = <5>;
> > +                            azoteq,conv-frac = <127>;
> > +                            azoteq,tx-enable = <5>;
> > +                            azoteq,dead-time-enable;
> > +                            azoteq,sense-mode = <2>;
> > +                    };
> > +
> > +                    cycle-2 {
> > +                            azoteq,conv-period = <5>;
> > +                            azoteq,conv-frac = <127>;
> > +                            azoteq,tx-enable = <4>;
> > +                            azoteq,dead-time-enable;
> > +                            azoteq,sense-mode = <2>;
> > +                    };
> > +
> > +                    cycle-3 {
> > +                            azoteq,conv-period = <5>;
> > +                            azoteq,conv-frac = <127>;
> > +                            azoteq,tx-enable = <2>;
> > +                            azoteq,dead-time-enable;
> > +                            azoteq,sense-mode = <2>;
> > +                    };
> > +
> > +                    cycle-4 {
> > +                            azoteq,conv-period = <5>;
> > +                            azoteq,conv-frac = <127>;
> > +                            azoteq,tx-enable = <1>;
> > +                            azoteq,dead-time-enable;
> > +                            azoteq,sense-mode = <2>;
> > +                    };
> > +
> > +                    cycle-5 {
> > +                            azoteq,conv-period = <2>;
> > +                            azoteq,conv-frac = <0>;
> > +                    };
> > +
> > +                    cycle-6 {
> > +                            azoteq,conv-period = <2>;
> > +                            azoteq,conv-frac = <0>;
> > +                    };
> > +
> > +                    channel-0 {
> > +                            azoteq,ulp-allow;
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <3>;
> > +                            azoteq,ati-target = <800>;
> > +                            azoteq,ati-base = <208>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-1 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <3>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <208>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-2 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <3>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <208>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-3 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <3>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <208>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-4 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <3>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <208>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-5 {
> > +                            azoteq,ulp-allow;
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <6>;
> > +                            azoteq,ati-target = <800>;
> > +                            azoteq,ati-base = <144>;
> > +                            azoteq,ati-mode = <5>;
> > +                    };
> > +
> > +                    channel-6 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <6>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <160>;
> > +                            azoteq,ati-mode = <5>;
> > +
> > +                            event-touch {
> > +                                    linux,code = <KEY_MUTE>;
> > +                            };
> > +                    };
> > +
> > +                    channel-7 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <6>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <160>;
> > +                            azoteq,ati-mode = <5>;
> > +
> > +                            event-touch {
> > +                                    linux,code = <KEY_VOLUMEDOWN>;
> > +                            };
> > +                    };
> > +
> > +                    channel-8 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <6>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <160>;
> > +                            azoteq,ati-mode = <5>;
> > +
> > +                            event-touch {
> > +                                    linux,code = <KEY_VOLUMEUP>;
> > +                            };
> > +                    };
> > +
> > +                    channel-9 {
> > +                            azoteq,global-halt;
> > +                            azoteq,invert-enable;
> > +                            azoteq,rx-enable = <6>;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <160>;
> > +                            azoteq,ati-mode = <5>;
> > +
> > +                            event-touch {
> > +                                    linux,code = <KEY_POWER>;
> > +                            };
> > +                    };
> > +
> > +                    channel-10 {
> > +                            azoteq,ulp-allow;
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <112>;
> > +
> > +                            event-touch {
> > +                                    linux,code = <SW_LID>;
> > +                                    linux,input-type = <EV_SW>;
> > +                            };
> > +                    };
> > +
> > +                    channel-11 {
> > +                            azoteq,ati-target = <496>;
> > +                            azoteq,ati-base = <112>;
> > +                    };
> > +
> > +                    slider-0 {
> > +                            azoteq,channel-select = <1>, <2>, <3>, <4>;
> > +                            azoteq,slider-size = <4080>;
> > +                            azoteq,upper-cal = <50>;
> > +                            azoteq,lower-cal = <30>;
> > +                            azoteq,top-speed = <200>;
> > +                            azoteq,bottom-speed = <1>;
> > +                            azoteq,bottom-beta = <3>;
> > +
> > +                            event-tap {
> > +                                    linux,code = <KEY_PLAYPAUSE>;
> > +                                    azoteq,gesture-max-ms = <600>;
> > +                                    azoteq,gesture-min-ms = <24>;
> > +                            };
> > +
> > +                            event-flick-pos {
> > +                                    linux,code = <KEY_NEXTSONG>;
> > +                                    azoteq,gesture-max-ms = <600>;
> > +                                    azoteq,gesture-dist = <816>;
> > +                            };
> > +
> > +                            event-flick-neg {
> > +                                    linux,code = <KEY_PREVIOUSSONG>;
> > +                            };
> > +                    };
> > +            };
> > +    };
> > +
> > +...
> > -- 
> > 2.25.1
> > 
> > 

Kind regards,
Jeff LaBundy
