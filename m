Return-Path: <linux-input+bounces-4888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7692999A
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:56:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4AF31C20A30
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEBB3FB96;
	Sun,  7 Jul 2024 19:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="bTuCrrbH"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2115.outbound.protection.outlook.com [40.107.94.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBC528DD1;
	Sun,  7 Jul 2024 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382212; cv=fail; b=E/NkHNyFz2dSVRkGR3FyNqsQ/tI5nOyj4a3OAfnpeyoCmkkvN3DTuaNdh5+Ta4/LxheqQc1N8+gfowWrCU0jvOWFAbTbLcqHTPS7MX+8DONLirzvYRKma/1fPgHzlOaQesehf86Jia2Qt7PUiC5AylqXGmS61oo92dVcmDSNsF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382212; c=relaxed/simple;
	bh=0s/MBi/fdGjFrPoxn3yRI1UzBHB1FFeAUBjppD2+nvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X9qdPnQYR9X07/Clblt5dmb+INHD4/nA4Q7WLXUuqIqS3zxwuFe0JldY0Ozo0VxqnfFv+4SpUKXJgAXHaBt7opyDNnTJAaASuTEnTJUkk38THGwin0sSlxk7e8oO9VZQzwmhnAiufvh1z/Lan2nPsTHxTbkuilJPZJmEv4ignTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=bTuCrrbH; arc=fail smtp.client-ip=40.107.94.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FesKDJ/uldcRd/sDwRJ8Q4ZSMRIHMR7eGtwQgq5FB6Zy6Vo7ZosrgGzYy4VMpRbMQ2OPsz7DBSNpI7iR2698pMTnI+STjB/nOt9agco55egRnVDpCPuPA/sFX+dWRs13nVbgMQczVfZKiW8UnN8wXyoUi0zLBzBxNb6tMSAf6r+mYHTPNJynh/0vMvzuSwcSAcPmHj3jAjk74awV6M9uHGhmLD/BqnJgWqzB9SzywOFZZJCWFGwlcNUqlUH7E9hyAPS7GdNFK6OHyl1yzl1kFX55Pn3pzUKJhfrrXtXHasHFd/N8UHmhCfal/dEeViYklB47ziVBxl6DfUShgel80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KdX6uAy0Ki4jM4Oyw6211NG4xI0ajnD93eD/8fK4odo=;
 b=lzDys6qkr+NznLKA5xFOl0abOg+LuTFcDk0XGSsZm8LNKYW8Z3ivLN+rTTwJ2SF+1+GOHu8F3DFwVl2VeAnqQJ5jAUTayCgcHwU2PvvqnjoI6yD2HLrIMfb25N7jSgI4DwhaGQlVax9GdxBohSCrGXN2R17KhTyiHER2u9iMBLNihmZfxNwsn38wjQPZrTQkG6UVyZ/N6mBF8ueHu7soXPV7kssgE/DfTIspKwDNkcxsBaAfKNR1WYN2SpFu6Q+91NiZLN6mlBHaFhnjpBWpAtXnF0TYgdR6M8lNL2J77ZDVmQhKhtYMWn17UIBsvNrHVMD93tGVbxqlxYMn+2ij2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdX6uAy0Ki4jM4Oyw6211NG4xI0ajnD93eD/8fK4odo=;
 b=bTuCrrbHgrgQf9BnQUfBBtsWNzgEywZP6RbiOubOKA7mT5sRxZ6ONitqshRud9pJINyJ5G5cBegCworrD0yz9xTVSbyvkhrFXPoEO/rSiBfRnMmF7Mjxe0uPKLQu+fIZR2oaKfDeMcPbVep0kBM+/zA8ZzLzZ1vzeT4skXbMODo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:56:48 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:56:48 +0000
Date: Sun, 7 Jul 2024 14:56:44 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] Input: preallocate memory to hold event values
Message-ID: <Zory/JLaf/Y4/YGD@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-7-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-7-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c885b1-bf09-4ef4-05df-08dc9ebeef7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VdmLnwjPXTZ+EVtYKK4b+bCoP9zNmjHU5pSThE6Neaj2es6BbDXsQw6XL7k5?=
 =?us-ascii?Q?is2hF00lwFPoUaMcbdEyboCD+CjnI36I6C2F/e/xDbwt+gyQ+L3e38txg8im?=
 =?us-ascii?Q?Mh/3tmDD639b+TKn1oDXZouxWAaTPSjTUA5aKELm/y5FGVp2U1CbbFg6n9OG?=
 =?us-ascii?Q?K766Isqg3tr6LT5gBsWRYK6zA63aVDKtaWGaRoZc7sNk+mr5nQfpwT/f+xEJ?=
 =?us-ascii?Q?I4wgfErcggUzqweKeIe4p6x6nY3vS26tLDQ4CmfQm2fNOJKYjXJmTbCTTQay?=
 =?us-ascii?Q?OecAul/h9WgBSYIZbPs3ORUVvtxuXkBhBywgYph3wm0ZBHADQViGkBiFbitL?=
 =?us-ascii?Q?I71d6u76biteQ1sqQbSPwZlv9q6GWX6qNrTlogbNtK6xXKOma3vEiJe4Qsjk?=
 =?us-ascii?Q?8gazFdQM6+zd+hpocglt9sr48AmC8Ujv9nkSIzZfF8POxxzlQL1FooZIxCAS?=
 =?us-ascii?Q?n/iv8bEeVlMYzPIuDoLTCkLibVpUM7dSpGcl6PPQk0GZ24QKZAydOgvx6Ns5?=
 =?us-ascii?Q?1qQl5EGyI21FfyUy8BYoj/LO5pRyDnKNuQ3dPR0Cu++VyXUXJPJbko1wo8SJ?=
 =?us-ascii?Q?NADaNaT4882roWKC/CE5M74Kc/rQ/SmXjLAPsgJK7XgUhRTF4E017o/tB/B9?=
 =?us-ascii?Q?VK3pCdQ7169PKbB0HVkwSsDRQqoyLc1ecTa4dyUimNCUTDXa22/xjwGWkTpV?=
 =?us-ascii?Q?jC1ZGnt58J1K20Ea5YyEYqjPA6EOKu5lz/c2sp3M7EZaxId74DVJoFQVpwl9?=
 =?us-ascii?Q?UFA6wnz/IEIIPDG32x61Y31RBoKlCPdfwRsMGrpX/wLvdVjtV/R9FeSiyk0/?=
 =?us-ascii?Q?5pGYQoB6w/S1mmb5exrl0uvbyeTuQkx92997znwP6+MvCafqXGa2VD2DHbxT?=
 =?us-ascii?Q?0vkDpRCKshac+dRPM5RBmboPNaBqUT+Ft8iAf/WcJx9+zzDO9meYJZPbN57j?=
 =?us-ascii?Q?HX9RB1rQYJlSJcSlxU6IGQ8sa8Rf4w52Wynci56BhT+USvBY00s0yyTW/raP?=
 =?us-ascii?Q?CbsuYhN8yX0AoUvbiwp6WKE+6GmwjclM+iTlW5ek1pGVbHpgCg1QIiTFuCN/?=
 =?us-ascii?Q?k156MB+HG/VIYUqR+qrgmNtR3C3o85KNmrq/cIPS8H7mSEoesW/rSsEEMq0n?=
 =?us-ascii?Q?R29sTKV8BmGHswsS/4razXdeM3ubOZ6fmUOjtpdJFQaUMI+7p99SPUS76a5r?=
 =?us-ascii?Q?sjI14DF6n3Ajv2oHeb21uQF+kTE8YagJBhX0fuIC5j349f7eAjZyQInD0IXR?=
 =?us-ascii?Q?l2WvbuyDW+Y44aBk9LseBuh6HihQO8Cvh5Sl/cydsrJlzg3Bkafr4Aq/00ae?=
 =?us-ascii?Q?d4ewp9dfGJgUKEmK47FFs+Ake4L7UrdIZEtwmS4Ry3Oaew=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nVsI7uaJAV5jqaPIcWUTmGaC5CUg8oD6dJDsOcQiLtRJkj7wSza9k5ykhPT2?=
 =?us-ascii?Q?ZfwiV5MMAox1d0Jl9xOpez8+gL5RLyO7J/tS8jDfj5vCa4e/2euak304leWw?=
 =?us-ascii?Q?74kePe1bNVbmKhChQPRUz8Y72b2TnM3pHvySb8Y760NEkmvG2b+ioEu8pr/h?=
 =?us-ascii?Q?3yRyLUe5Bogsh2wlfvYJ20tv8e7mCv1O2pq5s//6ZIQVEhIpKFapyQMY2KHq?=
 =?us-ascii?Q?ijila0+YKFGpDDPLXC0ii3W6m956BkzRulyAit1VHxz+J/ugJ/j8ZM57peER?=
 =?us-ascii?Q?NXrD2e3pOuXDM6ulzPGqYC1HFkBdxQSXix0XTKrNPMG4mc+hKrKP2l6lZUt0?=
 =?us-ascii?Q?xe0yAsa+OirwD058Iuw04XSJb9qHfbE2XPBY660XMiqAIqZyN8/hxhH9ArY/?=
 =?us-ascii?Q?QKIG6JkPrW1ZPXn5+5aebs9QAc8S/4V2YSWFRX1m6tSwAR9mIqmjSHQmrhOl?=
 =?us-ascii?Q?Or3bvKxz+mq7q03FM0zySeKriluQzB4bImNaUgS5GabiXbALbmE2wD5QTSoD?=
 =?us-ascii?Q?KzvLbxg6QpAOEoHlcZGlyNHuGf0vitK+mb48hfD5Ooc+NU9SVEQDvGzYCpUo?=
 =?us-ascii?Q?wrVu3CHrFYat7q0VAB8/bMf7ac+93YpdJWQQjjqQlPbD4+TKSO6qP4BkBhXC?=
 =?us-ascii?Q?+MaMYlb5I3jeREw3nFuuR3KmcvfrvY3KGpncYp38u3Rn3Mn2dnNVlU/XGxAu?=
 =?us-ascii?Q?ztkV6/5niq6bWvb2KHWnEAsWpfDMmvvMlojgthCQfq8X1cFao3w+cJDBCdBy?=
 =?us-ascii?Q?D0ePHEfGlDFyVeNYRYuOA+uLfh/sUnVV6sdgzXCEmWybS6wFNEHr2IVORwy1?=
 =?us-ascii?Q?3JL5dheEQO489uBtCrNJRG6HMIWRonsNg+K3qCAmvl4xwA7aVoIDoCrCz+XL?=
 =?us-ascii?Q?D9WuWzOEGcybeaK5QlAK8aTAUrNrDE2Xn5Z3qzXgRt6s775FF5+XqEvXVJfY?=
 =?us-ascii?Q?9GMrs54s5DiRYnOXwA2lD7UP5ER+2UasvwYGnOco46Iq9iymUD6dYUFPKjYr?=
 =?us-ascii?Q?oykvU7NF5QjA355eFv1+lN10LxfM+I97ibjHifvbjnmUUnERW12CxgaW4shL?=
 =?us-ascii?Q?0fHlr3m6tzwdI6f047FSAVo+sNrfkC2K++mBJ2bu8MDk3EZbtjZYQwGqzm8o?=
 =?us-ascii?Q?m2X2eWyqw/TjIH0Hxaig//2lL9fPcyWuj4xdFLWZS7P/+t/cMpjr6Da9M1OG?=
 =?us-ascii?Q?6+T+B6v95Xq3itD1sBSFZCG2aVwkUjilbCc99YPL3+p+ZEFPE0v0K/0vO626?=
 =?us-ascii?Q?+B1fZGS3G40MvyXShyny+niQS39voxk/4X1V+8K6vQRTmgLT1z/2pZJGeuZC?=
 =?us-ascii?Q?jnMOlQJ9DIXfcK2kDQVY3R/lFJxK6ZOZ2KeRU3Xlw4p8XQPllkqf29nAzDFq?=
 =?us-ascii?Q?scSsoM0C5hkrDhg+ezemjB6AF3IAhcjXMHVwAb2uRpw2LPpZrHsIvqxP6Xpk?=
 =?us-ascii?Q?fumrbpNRUht8hsm8B/pB5jvin7s48r5HmvnYZ3zOi5qF8kVXAOpe5GwN78zG?=
 =?us-ascii?Q?RvMKSUTxJCUcsVPP/4xmRPyqiC0Jp9zRwCkDYqEIvMZ//vj5ZyDSWJwVeJFe?=
 =?us-ascii?Q?26EhD2Ggf8VFyjz8A3CBzMXtCzthRv2rmftc60mp?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c885b1-bf09-4ef4-05df-08dc9ebeef7a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:56:47.9800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fnUFXuFwGcjO1OZIh0q5od07fpl0z3DUjfl+cQsh4msDxuRk0qcWJQPPBBSRDPyCI4+vHiyek1D7zRrsx3qtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:53PM -0700, Dmitry Torokhov wrote:
> Preallocate memory for holding event values (input_dev->vals) so that
> there is no need to check if it was allocated or not in the event
> processing code.
> 
> The amount of memory will be adjusted after input device has been fully
> set up upon registering device with the input core.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/input.c | 61 +++++++++++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 9981fdfaee9f..4e12fa79883e 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -323,9 +323,6 @@ static void input_event_dispose(struct input_dev *dev, int disposition,
>  	if ((disposition & INPUT_PASS_TO_DEVICE) && dev->event)
>  		dev->event(dev, type, code, value);
>  
> -	if (!dev->vals)
> -		return;
> -
>  	if (disposition & INPUT_PASS_TO_HANDLERS) {
>  		struct input_value *v;
>  
> @@ -1985,6 +1982,18 @@ struct input_dev *input_allocate_device(void)
>  	if (!dev)
>  		return NULL;
>  
> +	/*
> +	 * Start with space for SYN_REPORT + 7 EV_KEY/EV_MSC events + 2 spare,
> +	 * see input_estimate_events_per_packet(). We will tune the number
> +	 * when we register the device.
> +	 */
> +	dev->max_vals = 10;
> +	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
> +	if (!dev->vals) {
> +		kfree(dev);
> +		return NULL;
> +	}
> +
>  	mutex_init(&dev->mutex);
>  	spin_lock_init(&dev->event_lock);
>  	timer_setup(&dev->timer, NULL, 0);
> @@ -2344,6 +2353,35 @@ bool input_device_enabled(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL_GPL(input_device_enabled);
>  
> +static int input_device_tune_vals(struct input_dev *dev)
> +{
> +	struct input_value *vals;
> +	unsigned int packet_size;
> +	unsigned int max_vals;
> +
> +	packet_size = input_estimate_events_per_packet(dev);
> +	if (dev->hint_events_per_packet < packet_size)
> +		dev->hint_events_per_packet = packet_size;
> +
> +	max_vals = dev->hint_events_per_packet + 2;
> +	if (dev->max_vals >= max_vals)
> +		return 0;
> +
> +	vals = kcalloc(max_vals, sizeof(*vals), GFP_KERNEL);
> +	if (!vals)
> +		return -ENOMEM;
> +
> +	spin_lock_irq(&dev->event_lock);
> +	dev->max_vals = max_vals;
> +	swap(dev->vals, vals);
> +	spin_unlock_irq(&dev->event_lock);
> +
> +	/* Because of swap() above, this frees the old vals memory */
> +	kfree(vals);
> +
> +	return 0;
> +}
> +
>  /**
>   * input_register_device - register device with input core
>   * @dev: device to be registered
> @@ -2371,7 +2409,6 @@ int input_register_device(struct input_dev *dev)
>  {
>  	struct input_devres *devres = NULL;
>  	struct input_handler *handler;
> -	unsigned int packet_size;
>  	const char *path;
>  	int error;
>  
> @@ -2399,16 +2436,9 @@ int input_register_device(struct input_dev *dev)
>  	/* Make sure that bitmasks not mentioned in dev->evbit are clean. */
>  	input_cleanse_bitmasks(dev);
>  
> -	packet_size = input_estimate_events_per_packet(dev);
> -	if (dev->hint_events_per_packet < packet_size)
> -		dev->hint_events_per_packet = packet_size;
> -
> -	dev->max_vals = dev->hint_events_per_packet + 2;
> -	dev->vals = kcalloc(dev->max_vals, sizeof(*dev->vals), GFP_KERNEL);
> -	if (!dev->vals) {
> -		error = -ENOMEM;
> +	error = input_device_tune_vals(dev);
> +	if (error)
>  		goto err_devres_free;
> -	}
>  
>  	/*
>  	 * If delay and period are pre-set by the driver, then autorepeating
> @@ -2428,7 +2458,7 @@ int input_register_device(struct input_dev *dev)
>  
>  	error = device_add(&dev->dev);
>  	if (error)
> -		goto err_free_vals;
> +		goto err_devres_free;
>  
>  	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
>  	pr_info("%s as %s\n",
> @@ -2458,9 +2488,6 @@ int input_register_device(struct input_dev *dev)
>  
>  err_device_del:
>  	device_del(&dev->dev);
> -err_free_vals:
> -	kfree(dev->vals);
> -	dev->vals = NULL;
>  err_devres_free:
>  	devres_free(devres);
>  	return error;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

