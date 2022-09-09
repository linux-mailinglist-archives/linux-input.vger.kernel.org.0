Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 973CC5B2C0A
	for <lists+linux-input@lfdr.de>; Fri,  9 Sep 2022 04:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiIICSd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 22:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbiIICSb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 22:18:31 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171CD1582B;
        Thu,  8 Sep 2022 19:18:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2OU+xvC5Ljo6v6Ls6M5oixPNSuJesN9NyiFStA5QzvkozmjNq8Is0CF2CiQTFJGSe1uO8rXUCkCdIj0EET5QAg2+A5EiHQotbh8pjG63uRmhBZF/d4JYjn9JhuwvbIRDJYoNvdpccfxUw2ZMeOsYWaay80wCx9JFdoVJHGSuW/5uxyL2khMcYeozRG/jCTIue/KdHx62FTJXf53pwG2ms+Bo03he1MWeddtKSlM1q4XxBW+97lYpWgGtDj/UEe0cp+cZ1nVPdNmYcZi4c1kLIh7gLB6ebaoRaGtaURqJ4NZYS59M4B79jmoa2Bb7z2f/g6hM6zWqq4YlewXVkoZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ceq33XxP5L+PQuKwk0eTPde1PSQrPW+Hs9mtK6AL3+g=;
 b=GrFSHsFFPiBcJ7jnOAau1J5XoDGNX3VcR5hs7Nqerogp2xdiLfHKk9b5f5zyMzYtu11YXlKFQcWHwf4g8RmLxmz5+HFa3LJtLNQAaR5dItUvZvuLmR+YzmKwq3YnjaE08LO2hTqSXaLXLphDOwSsIBSc2nJSxU+m0jbi9Ky7WpeCwOC3lAvcJx+hca6fBwIFSFWxLV6jw3cOeRSJRGJ15Fpib60+fb2kCzyyqkn95kVtBrDZKMebXkdQ5ZWyihbAMV8UB7o95OrdSPTp1aUB3PCjoKPm/m9ykOa3PxT2+TYTthX1EY+4LLFUid8PGLtoHmnQPZeqi3BlZDpvdxCPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ceq33XxP5L+PQuKwk0eTPde1PSQrPW+Hs9mtK6AL3+g=;
 b=oxZ1mVaNS0RYyGa3MZg1gBxRzqwCFNjEnz98ZvKpYBwfuzpC7jNg0yhi3tfK0vmNgI9crUGafIjQSvlRe1zU5sOChqjAv7zm0wf3+fdoPuns1Tc+8TNMRYNSZtMlHv0lNQhBJDObu14IzhTdq3BB8Zs35QDY7pXnc2rv2BaQI24=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by SN6PR08MB5293.namprd08.prod.outlook.com
 (2603:10b6:805:90::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 9 Sep
 2022 02:18:18 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::90a1:7f76:cf5:f9ca%7]) with mapi id 15.20.5588.016; Fri, 9 Sep 2022
 02:18:18 +0000
Date:   Thu, 8 Sep 2022 21:18:15 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <20220909021815.GC3306@nixie71>
References: <20220902141424.90063-1-jeff@labundy.com>
 <20220902141424.90063-2-jeff@labundy.com>
 <20220908195909.GA3217447-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908195909.GA3217447-robh@kernel.org>
X-ClientProxiedBy: DS7PR05CA0100.namprd05.prod.outlook.com
 (2603:10b6:8:56::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08c12029-51ba-4c90-1bf8-08da92098f1d
X-MS-TrafficTypeDiagnostic: SN6PR08MB5293:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8fZ3EOzjiXWi6d5jFBpHuft7QwPROVpcAFKACm8B89mRfM0IY1NLqN7UqPPcb7nv68waO47LWD7vbe4l1iA2KAAVjoTa0swdSTmJ++hLlT3tih5yDVMsk56BBbf6MPSKL9tWo0tLYybgKQmEh0sBeiJcTeSqN4bQSfu/aBIcgFgOxHLPLCfVh+q8rDLLN91nqz+bnwt54N4ZHZCOUsOOW/0bZq2GInDBpfMvi5ZQtr+VaC7C0tl/RhwSGFgqIvYHjz3y0uhAnGz7Zf6vh5A5L52oZ8URJbiOeTfaF6r7RflatWJ+sggqF6WBdC7qRWDIXuevuCvvU5z4EKEyCp5/DL4NIs1PPbr6kUt8g0qBAcXuhQh27w3wMqRbVH++4HpQ/wQYZnItotng6CXTLieJE3wTf9H8BJVjL/FS0F/ORW1jMNk/ubwzWd7RZXqjSkIMdEMLzHIKkPnP9IGcddFEMeqpT+fABiRCqq0wq+a/i62czyrHfC8x7H94NKsUGyIFHV6V/GUhzkW/zG+LwJgjx5SMvEi1fhBEwf1FpZaYXCvKbqtxibOLfd4VmZIEwg16yEnC6Y+jTYOetYmkS5jF2N6oY+yHmdEFyy+b9McbU2XWfgMLw4ARrdIPIGATFD0HOT/ySWVpgNvmjv+2Zww7YQ2+OlRrJ1x/6k99F05Yn9fRXTuhSeKlkOyziBjpN7FBMdCa04FXsDBHX9BGiHInU6IVtqoArGpR0zZ3tyH3rNyQR4pMa9nB0Wtj7U10ElMuoWHDdYibk1h/JArBT+8q29wK8bUhguVnDHjBOoiUDKw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(396003)(136003)(366004)(39830400003)(376002)(346002)(33716001)(86362001)(38350700002)(478600001)(4326008)(66476007)(66946007)(8676002)(66556008)(38100700002)(8936002)(5660300002)(30864003)(41300700001)(316002)(6916009)(966005)(6486002)(1076003)(83380400001)(6506007)(26005)(33656002)(6512007)(2906002)(9686003)(6666004)(52116002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PfvlvNv9r46Ie3QGradmO/K6iRZ+PU3k9I4NSM6CoQuE/zty5Bn2JU4X+vaz?=
 =?us-ascii?Q?DwY85nnjWxNs8x1NV95WJtnVV4z2shcts+rfIzGmkL/9/SDkvh6zkLFLBYV4?=
 =?us-ascii?Q?s6A5ZTA1Bisq5Hf0g7H5Vn0x5sX6LY9tho6kOSR2OLswVpzdkrQl697gd/7I?=
 =?us-ascii?Q?kXb3q81ojOO0Cz5o+XjhJjqxplQeDx4MSs7Dqvz//7QIUVKvvAYbosfG+RCD?=
 =?us-ascii?Q?7ftISjInuQ6YL7IYgSLQqGxt447jk6/971UU24WyC7OCpQfOAWojAmWi2C5u?=
 =?us-ascii?Q?+r731yqNZMxWQAMFaPJWgC90KXj2RHkx9HAat7MuW+tv3Ze1dMfCglvAAFXx?=
 =?us-ascii?Q?xFmnl+fYbOLuQpIYbp8/5zB+tlGqIDQpypXbBlg+yJrJQ5caqGzTZaXC1LPp?=
 =?us-ascii?Q?xmmLEXVqMRwqmF7ifTIXTmFEPTkksqPgJthrYTMJh60kMWq4TJIUtBiadO05?=
 =?us-ascii?Q?zOFC92chmWs8i7qNd2p5uihPheOK7VkHmoAS6VWZ//oNRoWW4d023wBY6rAr?=
 =?us-ascii?Q?kOILdj36zaNkmVpCHV0MaEjcDChwTqtB+oIRTs2SIKZ3r99gD2i9uZUBMjew?=
 =?us-ascii?Q?oGiiGtmbT0Ju5hf9NVEmhCyOvobUz/gcCmj3y0JEC7HFmDRQ6QY+zrzx+dzI?=
 =?us-ascii?Q?zD+S1tXw0lzR/q3PBqB+XU4rNJF7EsKKNqq6PZW+v9PpbQMxazTDa2B2ZTQd?=
 =?us-ascii?Q?0zTZ+rUUHCNkZnzhtFl6aNq03TitWk6OM/jl4SlfoC/2SmwQlx3NuwFuu9wh?=
 =?us-ascii?Q?wd0mGy/UaIo/ySFAb879PkGPwYfGoDjNpkhIGsMsQczDrtinmU8cJxvb13iD?=
 =?us-ascii?Q?5f2nznRgMj0lkmstOdqhakK8BG4OF0GJGcK/ppRssPfeqCxv06AKn9kV/rb8?=
 =?us-ascii?Q?nSVzemH2HPHp54kAO9Un/peBt/+c4L/cWs3Rm0+jE4iQVkdHpi6pplbZHt5D?=
 =?us-ascii?Q?y3VnNbMAJ2SqKmQWybVyevXEDkF01KnrjSEIYM23nLO530Kcn28Q9iSo0iIp?=
 =?us-ascii?Q?lkbUrsensLyfmv6SrBT7NZOTfTbieTRUTJVwv/8VNe6vHE1YSgt5D/dA0oeq?=
 =?us-ascii?Q?1LLqTtSPiAQF3kOwfg/qMFkm4+hqyt7VClQCZAw559FHRIux0vDhrrhuXIiK?=
 =?us-ascii?Q?NP4gx8mWfzmZpWvscjijqkTtnuTcNfd+X99OfMCjcMZujix1D27MXBJGOBuC?=
 =?us-ascii?Q?PNOIm5w5srs3s+VvFC0HacBViIIhIbYnsAQ0FeZHYLvgOPDy+mAV7ZMEiWsR?=
 =?us-ascii?Q?zJyqHj7N15e28tlg4KEBFm3Wa2SjX0Ghmwr0USXkTGB61Q7xFBabutxHZU9E?=
 =?us-ascii?Q?MBTZb1cdZWha54T8WqYG5QCWcJsp6vZ8uY9K7V88JpBQmpOZve3FqtrMZXPK?=
 =?us-ascii?Q?dodiaeyZuPyBMzLo9KKMN7ShtXp6EwyeyUFdX67ZjFUc3RBRbD7CGTCCWO+D?=
 =?us-ascii?Q?3ZkuYizb/Ca/p1E/5/USRd101OM/vLzV/jGBziZja7RL9WxPzq72IqyPDnX+?=
 =?us-ascii?Q?Oi6HrZqCDDcVyv38QEVtXZAAigYjZ+qsfiKiq+O4uZsLWqf9XmfcQbqaBieK?=
 =?us-ascii?Q?bDs1QIQybmvbTep4SJ+SjgCFTfOfXbzVcKyx+iu7?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c12029-51ba-4c90-1bf8-08da92098f1d
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 02:18:18.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbjCqG4TSDnOA5CSbx126UBMZnpnO7QdWltWBUAFakmiHQhDLXyy2EkL+H93NNHvHQzyfDH5efTGeYSd3xnwZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5293
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Rob,

Thank you for your review.

On Thu, Sep 08, 2022 at 02:59:09PM -0500, Rob Herring wrote:
> On Fri, Sep 02, 2022 at 09:14:23AM -0500, Jeff LaBundy wrote:
> > This patch adds bindings for the Azoteq IQS7210A/7211A/E family of
> > trackpad/touchscreen controllers.
> 
> Another touchpad/touchscreen with a boat load of properties. Seems like 
> an opportunity for some common properties.
> 
> Some of these properties already exist. Ideally, you should not be 
> defining them again (and even worse is if they end up different types). 
> Can't they be pulled out to a common Azoteq schema?

That seems reasonable; I'll give it a try.

> 
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  .../input/touchscreen/azoteq,iqs7211.yaml     | 765 ++++++++++++++++++
> >  1 file changed, 765 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> > new file mode 100644
> > index 000000000000..190bcd9a864f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> > @@ -0,0 +1,765 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/azoteq,iqs7211.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Azoteq IQS7210A/7211A/E Trackpad/Touchscreen Controller
> > +
> > +maintainers:
> > +  - Jeff LaBundy <jeff@labundy.com>
> > +
> > +description: |
> > +  The Azoteq IQS7210A, IQS7211A and IQS7211E trackpad and touchscreen control-
> > +  lers employ projected-capacitance sensing and can track two contacts.
> > +
> > +  Link to datasheets: https://www.azoteq.com/
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - azoteq,iqs7210a
> > +      - azoteq,iqs7211a
> > +      - azoteq,iqs7211e
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  irq-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Specifies the GPIO connected to the device's active-low RDY output. The
> > +      pin doubles as the IQS7211E's active-low MCLR input, in which case this
> > +      GPIO must be configured as open-drain.
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description:
> > +      Specifies the GPIO connected to the device's active-low MCLR input. The
> > +      device is temporarily held in hardware reset prior to initialization if
> > +      this property is present.
> > +
> > +  azoteq,default-comms:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 2
> > +    default: 0
> > +    description: |
> > +      Specifies the device's initial communication mode as follows:
> > +      0: Unknown (wait for device to open initial communication window)
> > +      1: Forced communication disabled by default
> > +      2: Forced communication enabled by default
> 
> This kind of property is typically not present to use default, 0 to 
> disable, or 1 to enable.

Your suggestion seems more natural; I will change this.

> 
> > +
> > +  azoteq,forced-comms:
> > +    type: boolean
> > +    description:
> > +      Enables forced communication throughout the remainder of operation; for
> > +      use with host adapters that cannot tolerate clock stretching.
> > +
> > +  azoteq,rate-active-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the report rate (in ms) during active mode.
> > +
> > +  azoteq,rate-touch-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the report rate (in ms) during idle-touch mode.
> > +
> > +  azoteq,rate-idle-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the report rate (in ms) during idle mode.
> > +
> > +  azoteq,rate-lp1-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the report rate (in ms) during low-power mode 1.
> > +
> > +  azoteq,rate-lp2-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description: Specifies the report rate (in ms) during low-power mode 2.
> > +
> > +  azoteq,timeout-active-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 65535000
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from active mode to idle or idle-touch modes.
> > +
> > +  azoteq,timeout-touch-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 65535000
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from idle-touch mode to idle mode.
> > +
> > +  azoteq,timeout-idle-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 65535000
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from idle mode to low-power mode 1.
> > +
> > +  azoteq,timeout-lp1-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 65535000
> > +    description:
> > +      Specifies the length of time (in ms) to wait for an event before moving
> > +      from low-power mode 1 to low-power mode 2.
> > +
> > +  azoteq,timeout-lp2-ms:
> 
> Use existing azoteq,timeout-lp-ms and allow 2 values?

I'm not as sold here; 'LP1' and 'LP2' are terms commonly used throughout
the datasheets, and operate differently than the 'LP' mode referenced by
the cousin device (IQS7222x).

Unless you feel strongly, I'm biased toward leaving this one as-is.

> 
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 60000
> > +    description:
> > +      Specifies the rate (in ms) at which the trackpad reference values
> > +      are updated during low-power modes 1 and 2.
> > +
> > +  azoteq,timeout-ati-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 60000
> > +    description:
> > +      Specifies the delay (in ms) before ATI is retried following an ATI error.
> > +
> > +  azoteq,timeout-comms-ms:
> > +    minimum: 0
> > +    maximum: 65535
> > +    description:
> > +      Specifies the delay (in ms) before a communication window is closed.
> > +
> > +  azoteq,timeout-press-ms:
> > +    multipleOf: 1000
> > +    minimum: 0
> > +    maximum: 60000
> > +    description:
> > +      Specifies the length of time (in ms) to wait before automatically
> > +      releasing a press event. Specify zero to allow the press state to
> > +      persist indefinitely.
> > +
> > +  azoteq,fosc-freq:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [0, 1]
> > +    description: |
> > +      Specifies the device's core clock frequency as follows:
> > +      0: 14 MHz
> > +      1: 18 MHz
> > +
> > +  azoteq,fosc-trim:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 15
> > +    description: Specifies the device's core clock frequency trim.
> > +
> > +  azoteq,num-contacts:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 2
> > +    default: 0
> > +    description: Specifies the number of contacts reported by the device.
> > +
> > +  azoteq,contact-split:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    description: Specifies the contact (finger) split factor.
> > +
> > +  azoteq,trim-x:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    description: Specifies the horizontal trim width.
> > +
> > +  azoteq,trim-y:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 255
> > +    description: Specifies the vertical trim height.
> > +
> > +  trackpad:
> > +    type: object
> > +    description: Represents all channels associated with the trackpad.
> > +
> > +    properties:
> > +      azoteq,rx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          minimum: 0
> > +          maximum: 7
> > +        description:
> > +          Specifies the order of the CRx pin(s) associated with the trackpad.
> > +
> > +      azoteq,tx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 12
> > +        items:
> > +          minimum: 0
> > +          maximum: 11
> > +        description:
> > +          Specifies the order of the CTx pin(s) associated with the trackpad.
> > +
> > +      azoteq,channel-select:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 36
> > +        items:
> > +          minimum: 0
> > +          maximum: 255
> > +        description: |
> > +          Specifies the channels mapped to each cycle in the following order:
> > +          Cycle 0, slot 0
> > +          Cycle 0, slot 1
> > +          Cycle 1, slot 0
> > +          Cycle 1, slot 1
> > +          ...and so on. Specify 255 to disable a given slot.
> > +
> > +      azoteq,ati-frac-div-fine:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the trackpad's ATI fine fractional divider.
> > +
> > +      azoteq,ati-frac-mult-coarse:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 15
> > +        description: Specifies the trackpad's ATI coarse fractional multiplier.
> > +
> > +      azoteq,ati-frac-div-coarse:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the trackpad's ATI coarse fractional divider.
> > +
> > +      azoteq,ati-comp-div:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the trackpad's ATI compensation divider.
> > +
> > +      azoteq,ati-target:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 65535
> > +        description: Specifies the trackpad's ATI target.
> > +
> > +      azoteq,touch-enter:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's touch entrance factor.
> > +
> > +      azoteq,touch-exit:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's touch exit factor.
> > +
> > +      azoteq,thresh:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's stationary touch threshold.
> > +
> > +      azoteq,conv-period:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's conversion period.
> > +
> > +      azoteq,conv-frac:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 255
> > +        description: Specifies the trackpad's conversion frequency fraction.
> > +
> > +    patternProperties:
> > +      "^event-(tap(-double|-triple)?|hold|palm|swipe-(x|y)-(pos|neg)(-hold)?)$":
> > +        type: object
> > +        $ref: ../input.yaml#
> > +        description:
> > +          Represents a gesture event reported by the trackpad. In the case of
> > +          axial gestures, the duration or distance specified in one direction
> > +          applies to both directions along the same axis.
> > +
> > +        properties:
> > +          linux,code: true
> > +
> > +          azoteq,gesture-max-ms:
> > +            minimum: 0
> > +            maximum: 65535
> > +            description: Specifies the maximum duration of tap/swipe gestures.
> > +
> > +          azoteq,gesture-mid-ms:
> > +            minimum: 0
> > +            maximum: 65535
> > +            description:
> > +              Specifies the maximum duration between subsequent tap gestures
> > +              (IQS7211E only).
> > +
> > +          azoteq,gesture-min-ms:
> > +            minimum: 0
> > +            maximum: 65535
> > +            description: Specifies the minimum duration of hold gestures.
> > +
> > +          azoteq,gesture-dist:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 65535
> > +            description:
> > +              Specifies the minimum (swipe) or maximum (tap and hold) distance
> > +              a finger may travel to be considered a gesture.
> > +
> > +          azoteq,gesture-dist-rep:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 65535
> > +            description:
> > +              Specifies the minimum distance a finger must travel to elicit a
> > +              repeated swipe gesture (IQS7211E only).
> > +
> > +          azoteq,gesture-angle:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 255
> > +            description:
> > +              Specifies the maximum angle a finger may travel to be considered
> > +              a swipe gesture, expressed as 64 * tan(theta).
> 
> degrees would be nicer units.

That's a reasonable request; I will consider a look-up table in the
driver to make the translation.

> 
> > +
> > +          azoteq,thresh:
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            minimum: 0
> > +            maximum: 42
> > +            description: Specifies the palm gesture threshold (IQS7211E only).
> > +
> > +        additionalProperties: false
> > +
> > +    dependencies:
> > +      azoteq,tx-enable: ["azoteq,rx-enable"]
> > +      azoteq,channel-select: ["azoteq,rx-enable"]
> > +
> > +    additionalProperties: false
> > +
> > +  alp:
> > +    type: object
> > +    $ref: ../input.yaml#
> > +    description: Represents the alternate low-power channel (ALP).
> > +
> > +    properties:
> > +      azoteq,rx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          minimum: 0
> > +          maximum: 7
> > +        description:
> > +          Specifies the CRx pin(s) associated with the ALP in no particular
> > +          order.
> > +
> > +      azoteq,tx-enable:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 12
> > +        items:
> > +          minimum: 0
> > +          maximum: 11
> > +        description:
> > +          Specifies the CTx pin(s) associated with the ALP in no particular
> > +          order.
> > +
> > +      azoteq,ati-frac-div-fine:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        minimum: 0
> > +        maximum: 31
> > +        description: Specifies the ALP's ATI fine fractional divider.
> 
> Is ATI defined anywhere?

Not here, but it will be in v2 :)

> 
> Rob

Kind regards,
Jeff LaBundy
