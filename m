Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2E162E8FB0
	for <lists+linux-input@lfdr.de>; Mon,  4 Jan 2021 05:05:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726176AbhADEE6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 23:04:58 -0500
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:64224
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726173AbhADEE6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 3 Jan 2021 23:04:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ+l03+23opW5fJdp8cJGemc65AbVhiTJs8CJ3p0619yq6R4W3RBEGeP/8EBFseYgJvrk8JNpYwl3G7k+DlCCApv54H2JA7pPzpcecuuovYDWZEQbeSbtVAmXxsVoK72B8Uk9iFr0FcnvIwGjPaLNC5wWv/NDr8WKby3bDMnX2RUqrljHftIZp+fGzZEaWO/1yVakz76tQvvyly5hWJ4mhYH8HybJTsGrqKxc/aJxfe37Hpc9s6LvmP9jM3JSMWelqD7YNzY2NNeAJXNrMAZkiIEGWNYbo0WsaZNoNhXjaRhhkyY4P9pjjnT1J19cbo1w05dB12enBZeF+XqKONA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx+WgPhNnbwATIHLTplogpDoJB4rc4Ayyas7ek3Dflc=;
 b=lgbqvbSPoavB0CRDuRIHGqvMd31LsXZwudPetm0W375gZiNA97hflEdjOptDoKW6eXV7o8ewoGRIo+u++vmM8d7nx/VKc7HQhzX4gAFKF9ebHyK0VYCtnb18H0R5usUpTkOGS8fc37wn4VOIrWkYJkj80gM3w03O22Lvhf73fakIUCC0KhrcQbDFG3RcysAvmmLBrRMUsJRulmy/qq/FPMI026zv7p17yfQI5HyVAoYscaTcBKbw2xYyn9SdefPvo7b36P8s+2OfJjogSZ7aDcvymYMZTJ232V3nZxePhWWYhf9N47s6dNta94hcbhrGR09iBH3omFy004e8pZYk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx+WgPhNnbwATIHLTplogpDoJB4rc4Ayyas7ek3Dflc=;
 b=cuQguy9DwsEPVMY+4BtwxDLfWU6vCEaCES5tp0havBCEcXvIzGOiKV6F+HuxNmqrrdJQXHb05MZLxwoZQlj16t8TwXSqpRkwoBW3ovEgBpcWbT/CQuoYwvHzHjflbZXZHOuPbT0Zxk0+rG3L07hty6HRJQzyEA8e3K3/IDC5ALw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB7181.namprd08.prod.outlook.com (2603:10b6:806:185::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Mon, 4 Jan
 2021 04:04:04 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::b568:46ab:17f2:c918]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::b568:46ab:17f2:c918%3]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 04:04:03 +0000
Date:   Sun, 3 Jan 2021 22:03:59 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Roy Im <roy.im.opensource@diasemi.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Message-ID: <20210104040359.GA18606@labundy.com>
References: <X9xRLVPt9eBi0CT6@google.com>
 <AM6PR10MB1926A5AB8951B4DE62A96EE385C30@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
 <20201220020109.GA13501@labundy.com>
 <X/J2Ud24zs7ZJdTU@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/J2Ud24zs7ZJdTU@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN6PR16CA0054.namprd16.prod.outlook.com
 (2603:10b6:805:ca::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN6PR16CA0054.namprd16.prod.outlook.com (2603:10b6:805:ca::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend Transport; Mon, 4 Jan 2021 04:04:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c467562d-0737-47fa-a698-08d8b065c66c
X-MS-TrafficTypeDiagnostic: SA1PR08MB7181:
X-Microsoft-Antispam-PRVS: <SA1PR08MB7181D19724BA123B2B6FDC50D3D20@SA1PR08MB7181.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+hhBDNwVPXgK1lNoIfJHO/6PseaR2TASmJqGcKQqOI8H83FsVjNKY5ISgAKMvJdLcSBxupp1LaVf7LyqFCrfv6PtIdnEPkvJLkYRTPoGfGB6mfeKovgXsT/+SbV5s+ZxHj0t0Bqx19pXr1i5gE/yeiwgtMAg1qh389ACzd3BJoMwQZtQLCcjHlv09f0rjj0rfDNc90B7BVVHNk3nBS1SHIQAObT6ggCTGNFpMEjw0SkKPWbNuE6ocGd+T4b9cy4aKnhNQM55ToKZAW6wmhBMl7sDc+8JBDAlAi2I5If/OMx37cpdTPHARvSMEsvB1gLThXEsLSfsRokmO2OLNsf9Hp5Co5ERH3TZWy/UAvDyYBlKPgJecyPCPOpTeJoqFXv3IPb90NK6v4NGXtJQN7GOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(136003)(366004)(346002)(376002)(396003)(6666004)(26005)(5660300002)(4326008)(316002)(54906003)(1076003)(55016002)(6916009)(8676002)(36756003)(956004)(2616005)(8886007)(53546011)(186003)(86362001)(16526019)(2906002)(8936002)(478600001)(33656002)(52116002)(66946007)(66476007)(66556008)(7696005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ftdEUfp0+cArpa9cAPN7gI//UwoFHHDeOpLvuk5J7lZw17JkybGaiDMH2Gy1?=
 =?us-ascii?Q?30bmbXPk/8RnfhIsKW0GF0rAOBMYInEVKV5dkybjiTYcxIy8t/mi26YV6M9x?=
 =?us-ascii?Q?0aO3wYzWOGO4HZ/yE/3p+BHCtwHVCIZwOC2IZnVhLYOEg9bX0YU0zfevPVM0?=
 =?us-ascii?Q?of7221Ku2yHN32+jTaiqL5jvWOlvgbUSmjYrNGaCWpBG1BZIYOAHatQFsudy?=
 =?us-ascii?Q?x6/IzVqbLSaVTAckf9ILqTLo5aWiDDnthKslIjav//+NlWdGo9+sh6RqTTc+?=
 =?us-ascii?Q?ND7l8I56z2pq8ypA5Un8qcGAFJ8a/PNlDFSRW5TJdu9dUA/lMTI0u5YrMALv?=
 =?us-ascii?Q?+kh2jBL87IAsKj7gnAPQehST0fZfRlpcudqdnyo7mEivmgSCVRjbX5J/KbUC?=
 =?us-ascii?Q?jZETI01whXe4zAIv+a3V62fe+D+DoT74Dt3w+xgMAb0xt8MPdQbbQ3U5+W8E?=
 =?us-ascii?Q?+FXgyD6mnAYXMkaLCdw+sO8mJTu45xHdmaqnChlFoAqOfvmtHA0xX6/5cDS1?=
 =?us-ascii?Q?n9WVUIevYdDq+MnJgBd7TB7o2RXHAxT1MXk2XuMgvo0wOiYu+90Pd4oFTx3h?=
 =?us-ascii?Q?Om7oSQM3S0efIYufAsK0ZDQcon9fpeaYKT6VH5E9k/0Wu/ntNVA58mfn15nY?=
 =?us-ascii?Q?Zhzi6/Q9e47tnKzHQi4/7qk/1QAbPALiegRO7JVslLpMuHy+mnDslTLSSTFG?=
 =?us-ascii?Q?MY96Rh25pQnGEElTZDv+Ehsoc8OptOAPgNyo2Z2+JWy6gPud6dCAqT0zjlwm?=
 =?us-ascii?Q?RaXd+Qh8dKPnAJqcr1yIT16BNrtCtbpGORqZzsAhMrIAU0JdE52MwtAMy8cN?=
 =?us-ascii?Q?aUtNtgG22evhjAVI4rLOb/dV6SfthjJuPdEfKPqGZNsQV7PPbGsV9WEp4NOq?=
 =?us-ascii?Q?1uokyRx+76IFFdOfU6+3O0GdA+8JkkwlDAToM74ZuQgGEXVUiqBUnLTIPcKG?=
 =?us-ascii?Q?eZsMCA2rAqfFKC8nzMYBnT2ViOuScAQj7ypDcVZxXnQaMTZDSLL3uOVzBGh0?=
 =?us-ascii?Q?giIh?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 04:04:03.8301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-Network-Message-Id: c467562d-0737-47fa-a698-08d8b065c66c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VZvcddhBqkBq9pFnshEVKuGuUVm7h0uIyiGiBvkHYiHRa+2aRllNzIk4ILVKjqLqWPlL+2LIoVhqcQCKEKwFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7181
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Sun, Jan 03, 2021 at 05:58:41PM -0800, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sat, Dec 19, 2020 at 08:01:09PM -0600, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > On Fri, Dec 18, 2020 at 04:49:48PM +0000, Roy Im wrote:
> > > On Friday, December 18, 2020 3:50 PM, Dmitry Torokhov wrote:
> > > 
> > > > The OF match table is only used when OF is enabled.
> > > > 
> > > > Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > >  drivers/input/misc/da7280.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c index 2f698a8c1d65..b08610d6e575 100644
> > > > --- a/drivers/input/misc/da7280.c
> > > > +++ b/drivers/input/misc/da7280.c
> > > > @@ -1300,11 +1300,13 @@ static int __maybe_unused da7280_resume(struct device *dev)
> > > >  	return retval;
> > > >  }
> > > > 
> > > > +#ifdef CONFIG_OF
> > > >  static const struct of_device_id da7280_of_match[] = {
> > > >  	{ .compatible = "dlg,da7280", },
> > > >  	{ }
> > > >  };
> > > >  MODULE_DEVICE_TABLE(of, da7280_of_match);
> > > > +#endif
> > 
> > Just for my own understanding, would it not work just as well
> > to include of_device.h? This includes mod_devicetable.h which
> > in turn defines the of_device_id struct (even if CONFIG_OF is
> > not set).
> 
> The issue here is not that the structure is undefined, but the variable
> is unused. We could also fix this by not using of_match_ptr() when
> assigning the match table to the driver structure, making the variable
> referenced even if CONFIG_OF is off.

ACK. The call to of_match_ptr() is what I was missing; the other
drivers I was looking at do not use it which must be why the bot
has not complained.

> 
> > 
> > The reason for asking is because it seems many drivers do not
> > include these guards.
> 
> It could be that they are either only compiled with OF, or they decided
> it is not worth saving a few bytes, or maybe they are used on ACPI-based
> systems with PRP0001 bindings in which case the match table in the
> driver might still be needed.

Makes perfect sense; thank you for the follow-up.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
