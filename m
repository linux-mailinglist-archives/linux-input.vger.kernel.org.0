Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023A02DF2B0
	for <lists+linux-input@lfdr.de>; Sun, 20 Dec 2020 03:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgLTCCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 19 Dec 2020 21:02:08 -0500
Received: from mail-bn8nam08on2072.outbound.protection.outlook.com ([40.107.100.72]:65095
        "EHLO NAM04-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726660AbgLTCCI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 19 Dec 2020 21:02:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKlID1nk+3zMDydOGoboLbo7GSd6FDEM6mf/MeiKL4rYpJYDCVB5hf1EsjzXMB2p5EOrXT4hHmoK1+c2JkhgRhiJSI6z3rXNcZUxc8xlNxuu1mI9RMtGaN36pKGZl0N62m5zKAdk8tfVCL0/ggKugHIaIZ92tLONtfleRQEMcftSmmUauvFSX8CnWR/7NsRUiVr9oDgD5QaO6XOFz61TJiGtdNDgild/TDWax/aiSHIzZ48pydIVktkXx06D4UPRR8XKoAzaj70Lq8GPcNY7izJQF+aLa2KyLhLTmScGjvKTy5wySo/UxYTbWwISbcByCxyjOrl8JukC5b20yfR7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6u/ZcdJRqvCku24Go5EZ626qr72KPBtmMNxjNMZsjj0=;
 b=Vc4dh+T8ST59cQQ5+OYg0LiUPCxGlKDR9en4MSZ6+9b2clBKd6PBLCMA3GxgouVcRHitiTiv4IfOXZ3oQPaZXoIzymsAw59g4+y6OTqp9TTJ3sPE027+csWmgGIzqDfiRx4BCRQ11RT40JZHs5gvXUeZviEeIX4GmEmMfdnBJVqUlGY7OnJbhhq3vRtdBlOat0OZl/gluSDMsTgdVH+vtPKwuAxiHoe7FWvK5ybVQMraWlAbbVqKMlmoLW/orfIbuMv3iIZeXLC6yAEIzvVE6B1MQuBVmSFzlHTxoOsSfKSsH49Yqy70IJvKrEu2pggcMPe/sBgXjJnEFchxA2a4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6u/ZcdJRqvCku24Go5EZ626qr72KPBtmMNxjNMZsjj0=;
 b=TRJZf4fN4uDI5D51U1/BL9JhU8wF6UzzvOsFbG03dPEN196NfjjBvFKqUyQ4o2M2JsvL7xv6mMgsUFf5/vZ0gcoGWM1Kwh9VABa7qcPL8ys7R+H3KvSVI/GVDEP+cI/td4fWBJKTFpSl6mEig1Gr2lar21CEevhhmCX5cgBrnaQ=
Authentication-Results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN2PR0801MB2287.namprd08.prod.outlook.com (2603:10b6:804:8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sun, 20 Dec
 2020 02:01:14 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::b8cc:fd9d:8dab:c76f]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::b8cc:fd9d:8dab:c76f%6]) with mapi id 15.20.3654.019; Sun, 20 Dec 2020
 02:01:14 +0000
Date:   Sat, 19 Dec 2020 20:01:09 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Roy Im <roy.im.opensource@diasemi.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: da7280 - protect OF match table with CONFIG_OF
Message-ID: <20201220020109.GA13501@labundy.com>
References: <X9xRLVPt9eBi0CT6@google.com>
 <AM6PR10MB1926A5AB8951B4DE62A96EE385C30@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR10MB1926A5AB8951B4DE62A96EE385C30@AM6PR10MB1926.EURPRD10.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SN2PR01CA0002.prod.exchangelabs.com (2603:10b6:804:2::12)
 To SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SN2PR01CA0002.prod.exchangelabs.com (2603:10b6:804:2::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend Transport; Sun, 20 Dec 2020 02:01:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1350c87a-03b3-4fa0-8bba-08d8a48b2187
X-MS-TrafficTypeDiagnostic: SN2PR0801MB2287:
X-Microsoft-Antispam-PRVS: <SN2PR0801MB228710EF95FB5B303FC3D6D6D3C10@SN2PR0801MB2287.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RvvNF59pFLOKkdO+rLjUYnBv3WHp9IWZX1/g8ip7a0VJbXeSJB4+5b+kVsfvpw8ItyqjEmT4luEczCCuzU59Q8eO8ZNOKzaJAlx+Na58UJM3fE8mAMUDoggEK3qNtrltVJtH0l/0mpbAIsH4D0yzliQLySpn3KfAAUpVtDHGQChrhBzgMTaDUgxeYIbur4J+UjlKCj/DHmmT75co6569fJJKneZ0W6O8D67d/cWTukkg/zzOxNm7JufaPQxqhGL3cQoF9Za3D9Gmr94gUKwjjblQUvO2EvKaggALql2KDV5V9077q3LwZD7PHxkLgepb6Ic5Ap3zr6ZiOLbq7FvuHOUiVa09i/ehgIXzmI1nl9fzdKTG/GGLsZaUOr1KvZCK7BPSCfgwQPPqJKO3+3PNig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(376002)(39830400003)(346002)(956004)(55016002)(478600001)(2906002)(16526019)(5660300002)(26005)(2616005)(1076003)(54906003)(52116002)(316002)(7696005)(6916009)(8936002)(8886007)(66556008)(66946007)(53546011)(66476007)(186003)(4326008)(36756003)(8676002)(6666004)(33656002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cZeBmf9x8I5KRKf+vr1kvaONA3zYb0dgg7xjv80Ee4McMZ97Vj3ZyRTzYjOz?=
 =?us-ascii?Q?Olixw2kAaH7tssodPySf7gVNSaQaypl1h3TDLg4ivdXpPq4ljIk9pAJzS1LY?=
 =?us-ascii?Q?WJY9uhQKQD5acmoVnOUzi1+nk7NElX2v9tIdE9JMs9onk0e+jFmRJ5WZ543V?=
 =?us-ascii?Q?DRe/yPUP9YtmNmy4JqdGr9fUjwqK9J05s0GBvEBXHJSQ1hqtvBweNUG6jj4G?=
 =?us-ascii?Q?nQSzB8OThByUH4C2+c9Vr0LlNQQPDmrGQnyeTmXK7/LXJmQAT3dCvwykKg1j?=
 =?us-ascii?Q?pqCESQ0HV2khnJo3UW/gp8FXd5yAV5tWWs0gAJAC3lCBlGJ8//g2tfXFWkTm?=
 =?us-ascii?Q?sNVIravCFOzuD5TjiWn/Yh1lIDDXlasn0uuGh+pBxXAkz1EK38nbhAhN/JtN?=
 =?us-ascii?Q?StX09+fgCyXBkJcl8QD3qLq66p9LlAlNCqbN7ke9ZmG57htzCsb87qTWhdMb?=
 =?us-ascii?Q?8pFBR/sSFaw2Ka5TJkCFMbm2Fz+I4XMXX49AWKWWlJikqG52LM/dKw+qPTwx?=
 =?us-ascii?Q?mPWd9m9FcD2seZU+uooZBiQivnohUE8UOjt8snNlQKTlerU4QSP+vgoqsGQG?=
 =?us-ascii?Q?GYuxupU1/q26D+MZnkLfwqyjuhz1KddUvdjDXGR57AL9l8rH//JoB/zSs6CE?=
 =?us-ascii?Q?vIYWD47kEK4WT8eXFXXd1CBI/lUXq2h6p9OPJ+IlHGxHEV8XS3P0/+YRUMmo?=
 =?us-ascii?Q?DDxar7E2bQRzbtpg6mSveGLC33uomTH0UDsCavXHVBkV/gbiJr+R9SyAFE8X?=
 =?us-ascii?Q?E6OSBkDdoQVRAJgnxpz+Nv5nLtiOxTOcdL8gupuNh4T3Zj8duiGVacy2obb3?=
 =?us-ascii?Q?mnNDRONSqygj1JHEKtavfCftqGYzMSCJQZrRisyP3pTHVY1qCp3s32SLaW+M?=
 =?us-ascii?Q?j/rTmbemc9luI4HXy+xS5LaEX5rCjbiOdc4b63htq3+xQLsxjfWxVJjKPtMb?=
 =?us-ascii?Q?nI5eVq2ULQH4QU2x8cCqxlNWjZi1cE2NuEx94/AzzWYdS7nWxmENCF2ACdB4?=
 =?us-ascii?Q?X2zd?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2020 02:01:14.0996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1350c87a-03b3-4fa0-8bba-08d8a48b2187
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzjYi0NI9I9SX1rUxiLn1LlSW12GPreUUQ2q2S7k17sstfql6u6GbVTt+iuJumw8ltUTe9Zs+4geucz0Dm27TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR0801MB2287
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Fri, Dec 18, 2020 at 04:49:48PM +0000, Roy Im wrote:
> On Friday, December 18, 2020 3:50 PM, Dmitry Torokhov wrote:
> 
> > The OF match table is only used when OF is enabled.
> > 
> > Fixes: cd3f609823a5 ("Input: new da7280 haptic driver")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/da7280.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c index 2f698a8c1d65..b08610d6e575 100644
> > --- a/drivers/input/misc/da7280.c
> > +++ b/drivers/input/misc/da7280.c
> > @@ -1300,11 +1300,13 @@ static int __maybe_unused da7280_resume(struct device *dev)
> >  	return retval;
> >  }
> > 
> > +#ifdef CONFIG_OF
> >  static const struct of_device_id da7280_of_match[] = {
> >  	{ .compatible = "dlg,da7280", },
> >  	{ }
> >  };
> >  MODULE_DEVICE_TABLE(of, da7280_of_match);
> > +#endif

Just for my own understanding, would it not work just as well
to include of_device.h? This includes mod_devicetable.h which
in turn defines the of_device_id struct (even if CONFIG_OF is
not set).

The reason for asking is because it seems many drivers do not
include these guards.

> > 
> >  static const struct i2c_device_id da7280_i2c_id[] = {
> >  	{ "da7280", },
> > --
> > 2.29.2.729.g45daf8777d-goog
> > 
> > 
> > --
> > Dmitry
> 
> Thanks!
> 
> Acked-by: Roy Im <roy.im.opensource@diasemi.com>
> 

Kind regards,
Jeff LaBundy
