Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2430315DBA
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 04:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhBJDLB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 22:11:01 -0500
Received: from mail-bn8nam11on2048.outbound.protection.outlook.com ([40.107.236.48]:19137
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229761AbhBJDLA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 22:11:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqTCFMsFau7IhpE2AtbltyOMo5zivaXiC/cR/7zIQkpRxdFKuT+bB1TwGbw61oSVxoyVb9Rc+tpcdrfdFPtjCHvDS57oBekKbnWZX/iHg6nre0GNta+BWPhBYHlR7JNw+2Vr3GQsFl4bIjX5sk+UpI1S4IZrARu4sHxh+l9E8ml7Si19IXlyFe1CPglwGfbwxNnBPYBQAADj+pWAntbUv17UumSlEAQy5N+lRJl0Ms09zk7nEJeKr9T3uzBsV0J2jw8SzT6QHqxnYFHBJjQ6Tt3g0H7z6S7EVlJ5UstFRJBtjWXK9gj14e4jR6cT17dFIdycA4wUqWBc4i5zBSc/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rcq+j9tLHprYSY1NX9mSUUPz2xmVHI/wNQhfqjY7no=;
 b=HlViRkDR/mr6cn5RLEDPP91ARskDdkM7Y5Z2wvB+ExY50Nj9yRwhGNWWM4UcPFuEZuhgyXZ0HhLcl4xkTwVaSFldyO/Am73Lk0uivJGBfcizHT94XODzPmo6tRHFP/TlH48bSF5DctHSYO1vWQY7WXggiUFJUp++WpVDrdAI7dT/yCAIeuBATFxJ7J4C269mLoFopJJuytRSUU25AsqV71VB+RG5+axBORwfl19OjQD2jPVVPz8zVKf+DabYhb7ZsfiHO2JVp2/8GPkrAnXvL+7X1m2IBYK+ASj6dwySyhy/FknQ+zy0hNoyrZu//yijdu0hV5Mdzf/PUsO0Vqzofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rcq+j9tLHprYSY1NX9mSUUPz2xmVHI/wNQhfqjY7no=;
 b=pP2i/S+xjegtR6uy+hdMd1ew354VVC9cXVBjE8PvA/DLqNFYo9NGeralMMVNHvudqe2U/7uHMy/WuSohAaE4YF0bF7JPqjnfoDCJKowiXXqK+d+A4Ks3hCFdVgbsAfYsdWAa1ncXM1BIQ4C/0j5bIvJNxWH/F0UGo6RKohHekRA=
Authentication-Results: mailoo.org; dkim=none (message not signed)
 header.d=none;mailoo.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB7040.namprd08.prod.outlook.com (2603:10b6:806:1a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Wed, 10 Feb
 2021 03:10:06 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Wed, 10 Feb 2021
 03:10:06 +0000
Date:   Tue, 9 Feb 2021 21:10:00 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: add bindings for
 msg26xx
Message-ID: <20210210031000.GA10151@labundy.com>
References: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
 <20210209161319.GA3849081@robh.at.kernel.org>
 <07cac63721a9ca63733617e461d640e8927a78f3.camel@mailoo.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07cac63721a9ca63733617e461d640e8927a78f3.camel@mailoo.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:806:23::13) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SA9PR13CA0068.namprd13.prod.outlook.com (2603:10b6:806:23::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Wed, 10 Feb 2021 03:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3543e146-0260-4c53-4a88-08d8cd715dab
X-MS-TrafficTypeDiagnostic: SA1PR08MB7040:
X-Microsoft-Antispam-PRVS: <SA1PR08MB70400198589B69F04A98F789D38D9@SA1PR08MB7040.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8b0AGxDeyRLbdLGvtf1y7p/56+q5rMO6UOsk5Efm8IqIQt8hNaM8Zcs9+SwOR13b0SZNXoWouEcFcdwxLN/knKsdC+RDc6i1QwYQeXMtPCOSDgplIpOJlgg6N85Wyu54+mhApB8qE3zHmEK+IZeJ0jiV2DVjpuIJs2ve1yzts0PgmGfmq095Pa/kGTRzJWPJde7UADVSalF3GJER5hID27KSTFhZhQkvSiCpWhBD2hDFUdlnUsguFhZMfs/Lyk+8TNJlaZZmVlC/s+3Acv3QXT4LW0mDXF92Mv0u4J2mDz+F5SbYwLQpTmDjHZGVsKptkFMLnsmYyztAqIGDPNbPdFbGMjlw8SaDZ/YI+tBR60SeorQagzgN3R7TnZ0/K1iFJT05eLCGgsZfw2H55P8RpnKUaT/Tuvl/XL9IP0AYCUXif8vfVAC9wsvt9lZ1RdoYJuiMNmgHJl3QipyKQX9hFfkQNCMSgfUSAi/b3UPX47YVYmQ7akKAFJaAyHkaaPyC7wtZySZfnKivYg0dcHTaYJJQhmot1ZeYx7aLIHN7djQ+rLSbhnycCCA/StgBJ7/6GibEDpsWrCK4xcVsPa+765EhdxD6j2RJ+eY37/POcCc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(39830400003)(136003)(478600001)(2616005)(956004)(966005)(66574015)(6916009)(83380400001)(16526019)(186003)(36756003)(8936002)(26005)(33656002)(66946007)(66476007)(52116002)(7696005)(66556008)(316002)(5660300002)(54906003)(1076003)(86362001)(8886007)(4326008)(2906002)(8676002)(7416002)(55016002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?JhV+9wylmlLmS8QADqDkcrHFXur35veVZF8b2oHzT1BiY6dC4PZAaT9G86?=
 =?iso-8859-1?Q?6f5j9TjzJfZIP0u0KuuJfB/OLDZd6YcPM76mY8T00c68Opyq6A9H/sRl8k?=
 =?iso-8859-1?Q?CKhVfTDCmRH73y6BMlNwEs1m2SUIDPi4QEEzX8/Vu9uAihgd7tSelnU/45?=
 =?iso-8859-1?Q?stQxWiyTYybETOaEFKKW5fpjfb+zWb3QyU7EtW2pzLmNqY5EfCxJ7bSk8u?=
 =?iso-8859-1?Q?srAS6zFLhrl+XIQY9WdixICnWtaidRCHeV51WIm5adQdpR4/IWMnApnIet?=
 =?iso-8859-1?Q?WrexT/ViHR1885hyIE4hdshNVvRKneblnCIoOu2zrxbHO9h0y2Wk+sIuK8?=
 =?iso-8859-1?Q?Tds0FPUDExRdQ/JCv6KGTgzRSFiW0xX88CUunCiiz7TeX9h2dmKd+hTS2L?=
 =?iso-8859-1?Q?90vTNs+ELLcW7rKorS6xfs9NdlSfHtzvDFv1i1Ao66ZXxTInrGLBM7p0KR?=
 =?iso-8859-1?Q?HSoQoLR0vHUvhizWaZfIclsS2W/+Z+fgwf0AUw/W//RAOERWirqvBqUNj8?=
 =?iso-8859-1?Q?nyBG5YzolDWEf2TU5XItzqCAuLdqT1VamGK33jZvuIK3JhydnoaS2v522W?=
 =?iso-8859-1?Q?AtODJbbQkP+LDhpnc7bFHQFbyHDzzS09WV12QINskTsANTtIMHqCTWXeoc?=
 =?iso-8859-1?Q?0ywmtKM2vm19Dwu22KEjKqWxOgPaDNr6INdPCX2mK8Hmik63x+7X/5hKW7?=
 =?iso-8859-1?Q?Et266ab5xLnT19u4GuXQjzU5h2J2PaXVHmLWdobj25EEpVLLG3wU7Q+THB?=
 =?iso-8859-1?Q?YfhTX5COWpyLBAy/VGzFJj85wIyaJBoeKUnWAlF+vgqkZvzWjdiPYijs2y?=
 =?iso-8859-1?Q?SmiLZNXUYJIFrWUBj+ZSQihO9jNW5+4RMiUDhR5IJPeEOb/8y3RBuiGZ6N?=
 =?iso-8859-1?Q?f2qx22nhenRw8b+4YVW0BICI3kQ4OkMhwe37peKcLW6j+JrxL01JFrfQUJ?=
 =?iso-8859-1?Q?NNQOpp60sSyBShKj2rSxI49E5RliRyegg4lg+FUZqZOz0dq3uJ2QEaL/Vg?=
 =?iso-8859-1?Q?cV11xQrFXlsltDHkcNmNZUlQAEKbUzLS1YFfUbtqe7lZOuXy31MAdspCaA?=
 =?iso-8859-1?Q?gnbVDD2/Fw4JslDX14M8i3bIxlkULYjc7RxJHFStdz9HpdmG1jclbRvUqB?=
 =?iso-8859-1?Q?c/LmbQAXDT4ctdRO5Wy4UUdqX6xaBoAjNUti2vmDVNE46vt+QzNUnbT6pV?=
 =?iso-8859-1?Q?P92uF2zZLDW/XfqFcwotKL8euTB3CgLtWgxptdttJfcMMu+loSu7NK4xcO?=
 =?iso-8859-1?Q?qT/Eld9XWpuoPHHVAV/VSQvJUJTlqx6mtFCgKVvjd0YhxhkIz60BDwHBS/?=
 =?iso-8859-1?Q?8ai8YKoonyaz1qGcNZQ6xIWpD7H4lib7oud6qeV73MpIriA9q8sk6O1LTV?=
 =?iso-8859-1?Q?s06fEzmWpj?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3543e146-0260-4c53-4a88-08d8cd715dab
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 03:10:06.1689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBOQwtIgRxbre+JKr/qzLF76seHA6Dfiy8yJICJ8fWeTrCDdtuC4E9pTtC88sPldosdXcCb2vxONMnali+k4dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7040
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vincent,

On Tue, Feb 09, 2021 at 07:58:33PM +0100, Vincent Knecht wrote:
> Le mardi 09 février 2021 à 10:13 -0600, Rob Herring a écrit :
> > On Thu, Jan 21, 2021 at 06:43:47PM +0100, Vincent Knecht wrote:
> > > This adds dts bindings for the mstar msg26xx touchscreen.
> > > 
> > > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > > ---
> > > Changed in v3:
> > > - added `touchscreen-size-x: true` and `touchscreen-size-y: true` properties
> > > Changed in v2:
> > > - changed M-Star to MStar in title line
> > > - changed reset gpio to active-low in example section
> > > ---
> > >  .../input/touchscreen/mstar,msg26xx.yaml      | 69 +++++++++++++++++++
> > >  1 file changed, 69 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> > > b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> > > new file mode 100644
> > > index 000000000000..5d26a1008bf1
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yaml
> > > @@ -0,0 +1,69 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: MStar msg26xx touchscreen controller Bindings
> > > +
> > > +maintainers:
> > > +  - Vincent Knecht <vincent.knecht@mailoo.org>
> > > +
> > > +allOf:
> > > +  - $ref: touchscreen.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mstar,msg26xx
> > 
> > Don't use wildcards in compatible strings.
> 
> Thank you for the input...
> 
> Let's say I set it to "mstar,msg2638", is it better to rename the driver file and functions too ?
> According to downstream source file naming, msg2638 is the model I have and test this driver with.

This is ultimately Dmitry's call, but it's fairly common to use wildcards
for driver names and function calls if the driver is known to work across
all devices that fit in the wildcard (see iqs5xx and many others).

The risk with wildcards, however, is that vendors can introduce different
devices later with similar part numbers. Therefore, some subsystems (e.g.
iio) tend to frown upon wildcards for that reason.

You should try and make the driver cover as many devices as possible. But
if the driver is only known to work for one device then I don't think you
can use a wildcard in the name unless you support all other devices (just
my opinion).

In either case, however, compatible strings must be unique just as with a
part number in a schematic or bill of materials. As such, it is perfectly
fine to have multiple compatible strings in a single driver.

> 
> 
> There's a possibility this driver works as-is or with minor mods for msg2633 too,
> and a more remote one for msg21xx and msg22xx...
> 

Kind regards,
Jeff LaBundy
