Return-Path: <linux-input+bounces-4889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D16B92999E
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83FB01F21761
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36743FB96;
	Sun,  7 Jul 2024 19:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="jhIL5G9w"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2135.outbound.protection.outlook.com [40.107.94.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4D239AD5;
	Sun,  7 Jul 2024 19:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382250; cv=fail; b=k0yrkE5nDfDt34qUEXjd7kqSQYZeUTzlXcc1f0G7sdUJ8ZM2v6XAwNep/UvZYXDgXkbq4h0NrUvf7YEPZphCW8yKrVH6SUtQkarBnVrsPlYLb+9Q+PI8AmyzHYZoN+rdqojlD5UxTni781HQdEVwLcOa8yPlVAKr5p/8e/bmECc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382250; c=relaxed/simple;
	bh=S3RwoGIXJR+ZqVMzcJ+7m5fntm4K1Qy14XaPpTXSNe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CoWawemKJkt+UtwSJ49fE9NaRJU2ZRqItLyQt3TL8t9PCuBWulJwpYRSvTrx5OthhJTYWKHhaCGs2kV/DfrlEZcUdfzZmMQJQKUkOhlbwApT8lxB0JTEmBi/wkpxu6AfLzfT/dSEU0RD8NtpDewWDrwIMpxRJ1m4KZYt07meMeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=jhIL5G9w; arc=fail smtp.client-ip=40.107.94.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJdCKGpERls+D6JoqNuu46PByUgZO96JhXJO0L0WIZdJtk4/Ml/7a5eN2EmRAfCwTnTTFjNVn8MmVOyhwtI+Q20q49+LrgsjkvrUpSEv9Wa9/xM6doM4rpdbrtUTbfMSLjleZ3AiUyPOgXAPbttbbYL9iPssvp166IFo/Qdm/ruwCDuzRKgzsTEcSAREshwvuwiw8qh/kZ9zGzxbX614XDtx6FUqaPgDJJDnE5k760gZSMDV9UuoqNyt+13IYyS5DtKw/P+alEFsQwajB3qQmBz6GXCsKHDW5Y13ETYQDSxg1fhXec9jhajMFI1sbsXe8EC4m7opzvIr1lBti5ot1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKRgLpmvjxPin5F643qG9XJWP8i6nji8fqz9InU3tKQ=;
 b=F/I+MRfg8fJxBOqBzHjMguJ0X+QfoUW+snwZYeyWpa367khYXN5o6TVewVa8quZrTaIWy0Ka4tH9/UbGIIEgMKKphcR+0FnCHZ08LSI5I/ivdSYnIhH6xaVfvLiEMCvpBAv4m3w0mW48+UuFBTYbhaDfIF0sN0dGbkI8cl15tIDkqL9RId8m3cJp5D2syEbTPynkBNbh1Euo/EHZuSDEt83gDF/I0yUZNU240OIhOG9GwU8RgYUICsmSFW9aD+UXitsIyIl7geybONiS+CZxt/bXkJkw3VMs4HbGnMpVww6bDnWD/N4Yeyvv1OL8unZN1OWL0YzZfB6NX3tibdYxKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKRgLpmvjxPin5F643qG9XJWP8i6nji8fqz9InU3tKQ=;
 b=jhIL5G9wMs3YUQWHWqogniY/mXNd0uNNic4MDTsYHjhjuuu9nTwzNDwxxjotXOVuktGOlMXo1QGvgA9pKyrMDqiqk66xrF/rCydcyQ4b+gbMRIysfuJtKSsiLYzyjY7HCdxee6ec8J4Df+mFZio5zHYk4WtPZb1vPwRl0xVBocs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:57:27 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:57:27 +0000
Date: Sun, 7 Jul 2024 14:57:24 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] Input: do not check number of events in
 input_pass_values()
Message-ID: <ZorzJNnQKXoWE+wr@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-8-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-8-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SA0PR11CA0122.namprd11.prod.outlook.com
 (2603:10b6:806:131::7) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 9691329c-2b3e-45d0-edd3-08dc9ebf0736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yzx5G11cv/rvjBmXxmm5gyyc2f5ngrGvtO7Lu9k5y6DIwHAsfGmrFuvnGend?=
 =?us-ascii?Q?K2vrRPeF76dJeWAVdZjYKLS3Wpu0PcJGntqGcLCMqiMuWrfY6ZbEC9F23yiL?=
 =?us-ascii?Q?xTdJ415KdaELjhgUREerVVa+Rv0AFAJF07t1Vdp/knBAWkEhGN29DXEo4ak0?=
 =?us-ascii?Q?BJfEjaPfnbln50c6s5M+sBbdyBnEkEQEAOzvCWrPwtOrHZb21EEedS67e9T6?=
 =?us-ascii?Q?ZEMZYbn1shYL7RrULvJCfDrjQvK9lBE/2pUwP1WN+dIZhAIKLRonlLBf1SEB?=
 =?us-ascii?Q?Iq4BphqD0RON86MRSZb+q+9vtwArx9uTm9CDVCTqlXfiJeKcB+jLK1c9SkRP?=
 =?us-ascii?Q?YdJHFn7uIpE8OQTJuB4VBXkCweEBk+RXn4HQClAc6Ctry8zT2OVWc0e+RAGI?=
 =?us-ascii?Q?gjeVqHU9MzqumH0vEPCM6f4OXdp25sajAyw/x60+qrXUkhPVO3ErDOaCU6YB?=
 =?us-ascii?Q?CXH6fbsvp9+3u5nP8rt3eLjy8T4vTeaxFiYL3k/F/Tmtc5CFZZpPVghbZsnz?=
 =?us-ascii?Q?GH6LFooYpPyP693EVa4mOHlHfdivpqJzrEr2iWu9BlHL3PO+1TTNCrHH+/sW?=
 =?us-ascii?Q?wgfRf83vanTr2pqT9G1YSupfMbVLnMj+pqvq7aXfC71bVD6t1WJ8cNLVm+Jt?=
 =?us-ascii?Q?uOZjJNhaNIlfv3aMXOFDGSVjtSeux8CttS4OeUhvSMUUSjM+vwQvaYUlkG97?=
 =?us-ascii?Q?xJfXtTlT8VHR58pVzeiSs4XxwE8M3bBwxsMNndMi5dFx7dXFyd1GGkp7YsHQ?=
 =?us-ascii?Q?WbFS2teKFEnNkK4OTC2/0w3dAcpVCDpMdbkNtQ92HT8wJfJGb/XCA/pYclDz?=
 =?us-ascii?Q?776OFhK0d29sXD64aDl3hvn1+fDICDymZ6IgVhx0958f3jT+CnHR8sb6nJD2?=
 =?us-ascii?Q?tYH9ZCE99RfZ+QjQ57KsG31EKlUaUB6oTWAUAvJZsGzOd4GmuX5UnyapDCwX?=
 =?us-ascii?Q?QU52Ekeva9EVhuAFgU6S1Z9dHnNOIHESvRuvcq+siXqR5TS8wOjFbuq48oPF?=
 =?us-ascii?Q?W3kI40SRB73/7G2SI+5Ahha7xwJO6lUAiJOSf4l8TVWkQoeTG9uAcxbGbB5f?=
 =?us-ascii?Q?FIY+RQMr1AqOdY4Ic8sovmOwTlAaC892NG5ITVc/IWyIMbCCFhxBvvAwaVmf?=
 =?us-ascii?Q?mZY59Alh2U/c/cnfqFxtdzsn6svxX3EEvIoIfYabS81LfqvcaE2IWUjyiANI?=
 =?us-ascii?Q?ogjU9CvAe/0/JBZWOS6sAgitHFEcqAVfxzl5vanbPLJpT8Ce7iEUMgJ4I+oJ?=
 =?us-ascii?Q?5SuHAVUwEsVLC9ghv8hy7CdVyxFIW3xOW8nWhoha6hKpIFNc3RUNRwfPdy0/?=
 =?us-ascii?Q?RhfLVrPJdS/OnUOT2uyBH1W1VzPSI1SgXcO7bwU3umesRg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uSAopfSPnG4WAGoRoEkiVp2pSLVSmOD8LZF52n8YhGI6JllqUjw+Zp3XKilf?=
 =?us-ascii?Q?epfM9rs59M7QPnk19l8URGdAjKrWtR25ji8NDp4uJSR4AQv9Ck5NyWVR46q3?=
 =?us-ascii?Q?6cRv8DKjDWVLjSK872YSEzWCwaue8njHutqxVPjaRYzqFt8GYE1/4WOG169k?=
 =?us-ascii?Q?eyva3fJ8Dpd2uNwrobpGPT2WJQT1yQEsMjerubt7fzgy6pcJCAYOsFaP/c7w?=
 =?us-ascii?Q?CfsvgKtJEvhTO9r/GN78wcX3PcL0v+Dp1rKTCsSwmgiMv/fc5hjsMGfKfcJu?=
 =?us-ascii?Q?2jwTrEJ9yvD3RbW9gG9ODZg75y43pZyDTFBeaKLLtT6+ejN8FTKeGR+zb80P?=
 =?us-ascii?Q?tjdP0AIvXnSUjSNtozJ+s5g5aGhbR6uRiPERBeqeSiZkGeVVYNpqRB2Nr/f+?=
 =?us-ascii?Q?5Y23LRABzxw/7MsfTB4msYBht11VAfy8sZ0zoMCWdHVLxAZgPeLGtMCGs9do?=
 =?us-ascii?Q?0wFtj/Aq3BBPeM7BzhS9LA0Rm0uevG55qyQT3sfZY+V7L/RFZPBetsQy1z6m?=
 =?us-ascii?Q?xvgkB34pitSrf/mAhvvV/zZcKSgP5hGp6iPoD0qZk+YlLgpRQUxP+mPnEaIb?=
 =?us-ascii?Q?R4BOYNtxzAaMdUQnSaUlBrzJvkBu7WRmDIPlrFfYP7bmpVrLF9OZVDjffuJZ?=
 =?us-ascii?Q?0Ui/Cl1GZ4lIwXwLLuJOaSm6EyzMvA1wLpeoQNq5OPgMElGBbue4wtio6rcz?=
 =?us-ascii?Q?BLYypa/yp5ZkwbUgFl4ViZyRvo3njLe7XKoAuMDxgx/zP708ymZSXFl6hS++?=
 =?us-ascii?Q?JKPQ+A7Y1eaCA882ttsRgPDDsDKAF0PHNpy25ttrG/M2VMG5rmaI9k/iMpmh?=
 =?us-ascii?Q?08SFlcPu8VfOa07y7l2CgGJOjAEFFpUvA6S9qhJv7Dz3uCTzioOSWMhrC+Hb?=
 =?us-ascii?Q?sZSwiGGsXtaTWnj0UZ9OnaQ0oQILjBEACtqFx4yMCnN47lwuA0doOyv+GhMs?=
 =?us-ascii?Q?krIGUjBVKNOGbNLTxhj8XVaGLZjxgZ7xbpOUtjHjvjYr+Q1aMZd8QC3sWepo?=
 =?us-ascii?Q?CUXYjdTutToxk9WzgHYM0fxSaipiFCkyvOr/p2X8JWKj/yoYnR7dCn39Y+v/?=
 =?us-ascii?Q?dfnIdbNjOdtu4LFvX1Rir5NfMwtul2U1OoJWmHdR1JpsIvBcEZBp6P5MvH/D?=
 =?us-ascii?Q?MeJoKTNj+6RF8D7pKywH6aUcSeCdVvZ9Fe3g2vq8yyyKYYxP6qhmAKTj/zRo?=
 =?us-ascii?Q?IzlRuoSl6nlyTR3sPtBR1a0ogKBIHzLdU7V3JhWd0KBdEmQftIYswAP7JKL9?=
 =?us-ascii?Q?fg+RJ/l48QQGQpUwlU6Wm8Cwh+vhujfYD8lcdT5p8jiNihrwxBhC7/dyTAs5?=
 =?us-ascii?Q?Cwx5jPTBKYahiITmrvqaeuoB+9VzyGDWOSvUd5WvxGcONtmCEaeEfnqCKfY3?=
 =?us-ascii?Q?a3TFLMk+YQBSE73IJdsHrtoMEmK9vJBzVoleLoSOkAphMVri80KmKe4UG1Es?=
 =?us-ascii?Q?hIuHKPVrayoBkOuURW6+djpGxTJEG7boh8XSZ8aCAeaOYSO6WwpIWm8sdzei?=
 =?us-ascii?Q?8+PDEegmfudBGqIauDHSyWywYGXZU+d5WMHjlIJrTmJWmwwY7gg/zySVzDlp?=
 =?us-ascii?Q?Zy2PMW60zKMrFhEUj2czlID22vNku8p+h2AmCgrg?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9691329c-2b3e-45d0-edd3-08dc9ebf0736
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:57:27.7249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XOhAAIuTM98tRYxJq1S/eaqxb7ernTGUgVmvsH37hS3r9f6GntjlYpJ7PYzvDubms/Av2NWlMyDMkwizv7KXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:54PM -0700, Dmitry Torokhov wrote:
> Now that the input_dev->vals array is always there we can be assured
> that input_pass_values() is always called with a non-0 number of
> events. Remove the check.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/input.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 4e12fa79883e..54c57b267b25 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -115,9 +115,6 @@ static void input_pass_values(struct input_dev *dev,
>  
>  	lockdep_assert_held(&dev->event_lock);
>  
> -	if (!count)
> -		return;
> -
>  	rcu_read_lock();
>  
>  	handle = rcu_dereference(dev->grab);
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

