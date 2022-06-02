Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3653BF10
	for <lists+linux-input@lfdr.de>; Thu,  2 Jun 2022 21:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbiFBTp3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jun 2022 15:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239133AbiFBTpL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jun 2022 15:45:11 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12olkn2091.outbound.protection.outlook.com [40.92.22.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CE40237DC;
        Thu,  2 Jun 2022 12:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctELMz7mSWlEhde7SHS6bxDComYnTEOtsFLgz34eG+Zi/Hd1FwAeytEIsQhX+GcVwY7i5eeCYdf/z4JL7x9Hyj792ozhW5YPsyqlBsHwcd/+80Dxtd/4XspanZLobCzfQPNehOVT7I2+3yK3cf6DyJ5maSJtRFDCr9OZdMrRuNyfmQs5QC/VzbwI6gW7ltZfCxdkHQHXUtaIfOPhEXwAAoMie2RDX7qrw8+Pob4msMAbIEIqBkixOwNGe5ERHKAftgoUAxvu2BfND+YBxCn5ISSzuVyb15a2ew9BCiKmSeh8qokylSK6XwcmuKhkowN2eTVdzhbpKkBCLLN49whChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0iSiZhM0r7zVdmisXz1tpQuUgcioBMMJNptSn/ZiWQ=;
 b=B2QyRRKl8FhtBxTiufi0fjPXZutePFe0zABsr0iNMz3DElxPELn5CB7AgW6z0K3Q8dXnxXSI5lePToBuVrnLTQG2kkELOiG5wXak+alBbSid2X1mhn6ZNHagkPfCJ73lP2iYfaln/jtJ5nQLEPCwVnPSHhZoF+MSyXf7irApt0/wdb+TQTL8sIw95Nqhg2u08sFki51qmUoopuoSbEa5ofVlAhhFpRcH98GDarDsguVzBcFUll1JPp9SSeLkQEbSYWGSuy3jA4uPY/G4/xV6xahvZs9sXazQIpcqB0+FJlKzWgJkNrPkbs+agn9EYp2vGP8b4c5K40HGzwc7Ff5MQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0iSiZhM0r7zVdmisXz1tpQuUgcioBMMJNptSn/ZiWQ=;
 b=D2tCwBj6oaZtmelbF7iOdEGGoXUB/pF0hZJFqlf8FSWxwAGuEv5SkeyZuS+tZ5MMN5Lw8VhdYgKgWcykHA9k0VMMIFRl9QHnPhea37hCpgdo8in9G72KNrjzrfqCHR75sTHOpcPPfJNt76ty/3eZrj8lY+RZWVtonI+VfQ6751fkB9k5h83ogwK5pJM0AJQximKYa872yH8aPSBCRhZrWLN4omBje17ALzMBuVB9KRMoBBTPPsoXJaLX/QvyEm44Nr5qnKE0n8Jyb8wIRnjHMUDjD5Z0a8E7r19AV9tkIEvDh5K2yQYVKBOiWDXpHOdbyfX90G/2oAEK1kRLl6CwuQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM5PR06MB3179.namprd06.prod.outlook.com (2603:10b6:4:44::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 19:44:53 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::c0e4:f1d:b373:4360%7]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 19:44:53 +0000
Date:   Thu, 2 Jun 2022 14:44:48 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu
Subject: Re: [PATCH v2 1/3] dt-bindings: adc-joystick: add
 adc-joystick,polled option
Message-ID: <SN6PR06MB5342F372D3810B8EDA15BB99A5DE9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
 <20220601204927.10256-2-macroalpha82@gmail.com>
 <12a65f1d-4f3a-417f-3c90-5461870abe2a@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12a65f1d-4f3a-417f-3c90-5461870abe2a@linaro.org>
X-TMN:  [H1C2Kvr6Kip7JJqx16P+xEnshh5fFimf]
X-ClientProxiedBy: DS7PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:5:3b8::28) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220602194448.GA25883@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45c21f80-f575-4577-c334-08da44d05ca8
X-MS-TrafficTypeDiagnostic: DM5PR06MB3179:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O37dQ0Ice5O7VixNBPWF5zwCUzTkCyPBgVGVRLLgJ6MAHIzTFwSjElS5TnLxJAO898nTsn4gWOVc2yJdHfailcuK13glZfFyEb2R3AzYtwQEKbDxLbqDdBqUA7IXySD/5V7MQHqwmalNmqvydtPKCu7mXI8oOdaZB6CdkkdUlJiUP18Uee7KCd90wu3L0RGC1khk8p+bjT1qoWQyY0FlLffQCYFD/Ej7AkCns4ShD+Jp05IQx7vgxZMz2BhT92h4P+rbnPKnYIZCp+iC+HCwATMBYJOkaplawNdh5AFrYm81vUG+irOv5bwUDoBaFad3/iViYVzTv/fMXiv7hmdz32B8B0b3jSz89f4qeWFn56U8TejQGnlI6fjeQY3Q2u5qMjIDrNF5CqIyuwtUxbOOFarup9+LDX2ypAM6lRR6wBtqs7w1YotU+zJhfsRqsYv8YdY/XSkNHl7Hgj3YPxBim3YsYbNhyZlaCRCRMdK6Y7WQcOsK2oZjXnbMToS1Uq+Z9/SMEhZJwUHiSWL8UZK1CUetmLHdD2/RDzSeQLd8WVhAigDLPS8sO0rCprsoRLwbl3h73keORFU7PErxVQOnwQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?961slaUZF60dqy/RIRSrk5bddA74tk9Vhn7gzNjS3bKQn4undoIMHxS8w9E0?=
 =?us-ascii?Q?W+G3W5pNT2PVsB2hy9dTCwsaeWt7G/GVy2Pt9tGVkx43WnMirDCumI/+ClwK?=
 =?us-ascii?Q?rV95JdxSNeSKkVULvsKUl2ksxDrrncqCXmyJhWA2OAnVva93fynTsa10EwMs?=
 =?us-ascii?Q?e3OH+m3VTOfFK5NBg9/3K6opI/ev1fDAvtPvvvEEGe4kTGe35jCtgHMb7zQd?=
 =?us-ascii?Q?jNzjIRNcJR/h3b0vadkBt/RJJYHVrnnQ7o8ImDKEUdhmyWrp+NqdMl84YmOE?=
 =?us-ascii?Q?1EGaClBnKk5vGzZx4X5C5d81Wml7lFCf5SOjWRMbeu50eVoWAnXbt2fpAyyN?=
 =?us-ascii?Q?IHOS3EnAM77rLgJOOCP+OZFCnyZhmswUr2U+s1uTiu9eoAVP2RTt0ugFYudJ?=
 =?us-ascii?Q?eZHTVuh2s4BGcvdc+lPGaVizlZAK90+1G22hMxMso6W80ym+ffm1+pbBcw/I?=
 =?us-ascii?Q?tSb59OjJxowMWHdiazgS5c66VkLYATaHp2diZpt6OXnfR7N93ql6dxNRWD/J?=
 =?us-ascii?Q?awWlniMyEsXHGAM7OQ0+LAwra8KPYCqV9lBgypOWGLUi842n5B+fVYqdVipY?=
 =?us-ascii?Q?2wTGvoDGBfb6noekEumXDFk0T7RFNyh+/M6lSh47rJiSN5tlhcN4i3/G39Rp?=
 =?us-ascii?Q?b7W7e/h0lJF9Bb6SoCEp3r6EASqnQRKe4NUFjF+iEh2G3bllmS3azm7LkzJl?=
 =?us-ascii?Q?WsYoZwlMnObPXo/AfDhot2CAbvDRG7ekGJDQdSL3OkzvWy+COFPYTKdS1GaB?=
 =?us-ascii?Q?kyBV6llUesI+M7y1tmEajT66eIy+2thd+bJA1Gel0o4ep3Tt4trK2Y/hJbh8?=
 =?us-ascii?Q?/WcWbcQULCEVgzd9TbNSGQTc4ONosLAPjoDUkLGiC2ING8pZ4jjjoXEjRe05?=
 =?us-ascii?Q?9BPuUm0YGZXjrETx4Zcx4ydetGuZ3g0Sp4RJRdtoZlEkxHbxQ06qsFwSBGkq?=
 =?us-ascii?Q?EGG/Mmhy0Jkb/qJXCFoV1fO9R9XnaXE9SQwmoyN16aEX/H1IWVftg+QRWM3s?=
 =?us-ascii?Q?xn00lhpNLjdGpus1BV1IyUH3SNnziNG0Tp2yGxLgH0Vui/nqdclfM/geT57U?=
 =?us-ascii?Q?fDLTFiXK1Z/9v/vYypVOzgUDg2sZXA9PsDr/Y9ti25U5aQ2NA1DR/IYOu3dw?=
 =?us-ascii?Q?uxhNIUpoEujQ8KowYCotCZGWweg6+gETxpJnLHTA2sweyqgjIGloZ7VTIRui?=
 =?us-ascii?Q?/slDY/mZZLL/Ar2+lBrEb1RDzUcdRS1af6qOz2+0sw+crCt4wnESoYfCA7KK?=
 =?us-ascii?Q?ZHGIt+nhjCLYRVax0jDDFjeTUQh+fHTfxgrtFFDEFakPxyRvagcWE0F3oilr?=
 =?us-ascii?Q?4M2cfn97hkR3NT0mIk/Mw1liR9CUCHuAR64npiQW4WYxrAn24V9No90Ot2Tv?=
 =?us-ascii?Q?4TYt7wH30Hs6LCIhqT/wqj+6Ww53vaJ9v0P3TJLeonKJjrAx43Tw8mbjZZt7?=
 =?us-ascii?Q?YtHCoWjRN6M=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c21f80-f575-4577-c334-08da44d05ca8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 19:44:53.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR06MB3179
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 02, 2022 at 11:56:10AM +0200, Krzysztof Kozlowski wrote:
> On 01/06/2022 22:49, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add documentation for adc-joystick,polled. New device-tree properties
> > have been added.
> > 
> > - adc-joystick,polled: A boolean value noting the joystick device
> > 		       should be polled rather than use a triggered
> > 		       buffer.
> > 
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > index 2ee04e03bc22..4f49a1a5772e 100644
> > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > @@ -12,12 +12,19 @@ maintainers:
> >  
> >  description: >
> >    Bindings for joystick devices connected to ADC controllers supporting
> > -  the Industrial I/O subsystem.
> > +  the Industrial I/O subsystem. Supports both polled devices where no
> > +  iio trigger is available and non-polled devices which are triggered
> > +  by iio.
> >  
> >  properties:
> >    compatible:
> >      const: adc-joystick
> >  
> > +  adc-joystick,polled:
> > +    type: boolean
> > +    description:
> > +      If the device does not support triggered buffers and needs to be polled.
> 

What would your recommendation be? I'm basically proposing polling
instead of utilizing a triggered buffer, so instead of the driver
relying on a hardware trigger or a software trigger being set up to
fill the buffer that is read by the input subsystem we use the input
subsystem polling function directly (this is useful for my use-case
where the Rockchip SARADC doesn't have a hardware trigger).

Thank you for your help.

> You described desired Linux feature or behavior, not the actual
> hardware. The bindings are about the latter, so instead you need to
> rephrase the property and it's description to match actual hardware
> capabilities/features/configuration etc.
> 
> 
> Best regards,
> Krzysztof
