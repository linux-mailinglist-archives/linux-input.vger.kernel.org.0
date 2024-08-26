Return-Path: <linux-input+bounces-5889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 679EE95FD2D
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2024 00:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18FD7283343
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 22:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CFD1A01C8;
	Mon, 26 Aug 2024 22:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="Cctz77ir"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2113.outbound.protection.outlook.com [40.107.223.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37BC1A01BC;
	Mon, 26 Aug 2024 22:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724712223; cv=fail; b=XgEwPdZ119Yv2AB9rCh/pKh107PTTmLGWfZw5sC5KKJMF9/M0FcAl+cqz68R/xpBBOlt8L4TSptS9YGBELZwGHLB4vFOAdZGGlzafkrKQ1DYyfoBPC3QoosNL6/YZkXZKq0agMj7AXpN4Uo3SfYam5XOtHyVYUly5h8Lc4n8yck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724712223; c=relaxed/simple;
	bh=hN1l7FZDem3VXYogvOUv8pAQnGhfA+MkPQrZqJsFWCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d0+ZHmWB4l/SFY7o3eyoinh2N5654zqE/+T4GHRTi8TMP2ISn63nvo5RhfFqrZnYvkKWPjdKcBdzOM5KA9ojg6KNIaBo+HWY2XnwhRD2ZSS2faLm5AJBdej9G0Xbg+mTik6hVVvvgtIhPgpqYcEM1CWEJttUeVmPONvTTB+3seQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=Cctz77ir; arc=fail smtp.client-ip=40.107.223.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSk5QHK2AMjDQVKJwA1WkHv8RdOxqAoU2HUBvFaG6Gloa2dgmsL8FX0On0S1RNQ0HgttV72Uz2tUU+FFicTMHF+mZSQoTrhdsMikfapoK63g2ck5F1X6AWq8OD0+1u40KPOz85c0An/O9m7wIa10X2HnzubPVC4txUWUOE2t1lAmVZoWrXs1CivDhkjeV6tfo4QQlmGavK3u1fcDUOp21iK6Jy9vjOM9/l7XKNsegiPebx0Iz8mQ1s7uS9TXQmfx/3jZese7xSk+xUCc9CTuRo7JCn+clbq129yOkIlirA7l/bhdGwfLaKOhwippnu9ULAbSbIJ4V++7X5T3QbfLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrNs3ioX0jA5ZsRhmWhYTkp8S6mYmq6Qn/qmt7cZFmU=;
 b=H4Mbv9WsTx1Qd15evyCRaAzzsTs5a/FK6LfLVDkiyA02wUcfjOFgrAV4DuxgDv4iih2XVhmU3tjoZ921UwXw1QslzcD5W23x8jJ2DXF7MhjLUVsu/9b6eeMA1VKdrFDeNyRoDSxW1Eq49Xz8Q/GWH2b//6Mxvw+wUWXqmeElvGuAdjUD5n+TIeek6EjbWH2g0DbobOJHEcSlLNJ6Nm2eRV9hc9kXAzjhSu2kCDDQjyFGTpsjNpDe87RRlD86ADZZaaOexowGucW7Ey8MUk5ADSr4E7FlRkzSnc7yQVBRAzjz6egYfNf6mPQm+vBbVCRD4TJ6JTmtVTqjiOTcQhfaqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrNs3ioX0jA5ZsRhmWhYTkp8S6mYmq6Qn/qmt7cZFmU=;
 b=Cctz77irugrjWvIgTtg9K2zgmcer59+9OR0EPvMyeItrGnCRvAnD00g1VuE2Xk5dN5ooLzvzd1qzu0HVLQCcMaEvzAyLG2+mHA+OyoKhDozM41DL6Iah3QbCM1mdGHj8AEE57BnCjZsUheVi6mPVfGMnXWOzNkoN63puf85GFN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SA1PR08MB7584.namprd08.prod.outlook.com (2603:10b6:806:1f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 22:43:39 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 22:43:38 +0000
Date: Mon, 26 Aug 2024 17:43:34 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 08/17] Input: iqs62x-keys - use cleanup facility for
 fwnodes
Message-ID: <Zs0FFtUKI7sZBl4r@nixie71>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-9-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240825051627.2848495-9-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN6PR01CA0021.prod.exchangelabs.com (2603:10b6:805:b6::34)
 To BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SA1PR08MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: ad7e69df-14b1-494c-4389-08dcc62086af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cjYTB4meFiZeaaIaJmz1wxED6OvNgsmEMwMtFsCE2DXOKOzAXYb4HKQQTlZH?=
 =?us-ascii?Q?+K57ysE/vsM/nneb7F5AEsWGsMM1emCo7PXv7e6FhQSFl9yozd98X/zGHXPA?=
 =?us-ascii?Q?kHOdiEujz8C7JTEpF6iX+jcpoNvPhp8LqlEYVUOIccHL+iHjBwNuPDMga0Iq?=
 =?us-ascii?Q?IlxvgpjsL66HNVMaBiZrgCvcaPi644AypU3CVdAQ04ocyLMG0XsLAlgr9Mu/?=
 =?us-ascii?Q?DCsOAzKcUwd2eNqDSW5KTzUp9uOmqr1z0U4a9ODjIp2EP70A6voJTaPdkvLC?=
 =?us-ascii?Q?dphlHEZdGcRZDh88+gXJ0b22sONKaROHgmg/bk6wm3wsTbGEEKBq/jF++C5C?=
 =?us-ascii?Q?tOzupBYXkVwypy9FWR7rMy8NoAg6nmwgnDlwqlB43GnbVK02Ue3X/sAIp4TM?=
 =?us-ascii?Q?kgA8YTUFRS+4F4UQ8PcaeyVrGgG3EWqGZ6kP2oZTCzt5mIDJA6bRsId8302Z?=
 =?us-ascii?Q?L1aopZdjVCC2pXLx41xY2wV12SLvOOX0nU3e2+D+2BMj4xYE6KklPttcOsS5?=
 =?us-ascii?Q?fEdfG6/zaRHloEGH/vIWoVTANxlEYqWu9PgNueGX2Ga6cBvJ3dZUvavFHld7?=
 =?us-ascii?Q?uS0bnwymuJWrcMlUJTy1lxmysyWC5zWxQ6hn3QFVZ2nFvCHE0tRtg5+qG0lE?=
 =?us-ascii?Q?PWTFjJ94z/SbtFIzo2qRVSsrZkYqtSK36E5d0yoJiUTlUdI97AyldkMflgy7?=
 =?us-ascii?Q?byxA11KxiyAgLmhNEpjtWyn9ZYVd4vjdrm4zj3H2wfU/wKqyXuT2t4wG5YvI?=
 =?us-ascii?Q?geETGZUM5jOIe8G1HxV5sw1PtGGyWHiVPJfORZG5wgTLUintbjpymQrZEnyN?=
 =?us-ascii?Q?mCrsXINFWufIrQKg1Fht6psmaSnqnmkUl8qtaOxgBbjYqr0ZzH1F+U9Y7Fdh?=
 =?us-ascii?Q?2+7L9W3wu2rTGXlMELQdaYN2mK49D+40I05FFEQN6ou70vwvzf7MWcsEZRRH?=
 =?us-ascii?Q?Lt9umVjYuwUFJMz4K+i/Q0SDmpmjg3TY3VFLzNyEz9ebxn7osCLRVAaHvRRx?=
 =?us-ascii?Q?tNTyPx1Hns7MCnxkBQ8OZ1V6YTiVB7rjkcFgDvAZo7bHwx4RJuvLbwkaYai1?=
 =?us-ascii?Q?ExAzefxny+35TXkkDP9UlyRDOR1zhUoby6iAE1JAm518tN7QTQs19A+6lvJZ?=
 =?us-ascii?Q?h6TvqIY7ffCO3AphFmIHdJOS24cGAIZhLdCsbCYFAQe7Sz5lb35R7i1dS6/o?=
 =?us-ascii?Q?ZubsIaMErGEjhB5O8+Yc28v0wxfqiiUpJ+KD5l0HG4gzKhBDJpp5TV5wyYWc?=
 =?us-ascii?Q?rKAni8/Go6bVRbeYdy6F9qgEKUcBdVy6bhbYZqq1ByDM9jmQbyXIvExMSPnC?=
 =?us-ascii?Q?MHpAuQH90J1bCBq74NliZqPhwDJX/nY2Ym/Ta5FbLESlaA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PldRMhFN8voScMjU+pXfO7QHLl+tSu3AzweQGO9hw8XZXDu/cxE36lGfKcLY?=
 =?us-ascii?Q?2nfnBCNd8zKMLiKCDs2XREfgJ6X5klf09BL4Y9DSg/ZqCiuSD7gdx+gpR5NJ?=
 =?us-ascii?Q?C/g5YyUZNMy5jCZp4xoh06zd39sEcBgU9EGl4mbDPA8lnprPGerHNgeil30H?=
 =?us-ascii?Q?5KaoYNI9EFH7InAZ6JmDZYy4iHaaJ6YPjpdTjyanGAwUvLQJEsKZsq2k5FBv?=
 =?us-ascii?Q?XYhFj3FgMlLxrMvbf80TebbNC8oV2cnkiXZyLlsfcCmKT/2YW16d2fGxbfyh?=
 =?us-ascii?Q?WpZFmwcksxS7B9/y0BuQoh8Epfkup5GFUiGLkF9SMAVmzkPgOXS5gM8jTnug?=
 =?us-ascii?Q?am4j/P/oNsXPvs9O7ypZiC0m+Z+gBQD7264euHq7UdKBlIQbHM2DWJQZZvL/?=
 =?us-ascii?Q?G0DQk3QSk/l6K10uLXXOSkcb75+cmC26quR4f+4faCisfKDd0EsiDi5t/cxP?=
 =?us-ascii?Q?PBgVZl+cZXnvt++eucD61yoXh7N65NfYr8RvjxaiGAZcyxAl3y0VeQvSKxEI?=
 =?us-ascii?Q?RcTTBeko4Vn3BLZ+fsFN5dS5KKhgyLL1gSZfMI4w71V6wWTRxoeEgT2mU7EN?=
 =?us-ascii?Q?rCp1iHTyeg4Xqw2XXffDf3zs04GGCbNDWv5tSoO4Q8KRPn+9oLRVf5A/3qVB?=
 =?us-ascii?Q?Xu2xsO6TKCxnezOiGGgorcKroLkgsN74Fqf6tbGcBpjlCqx1DFuMNeIgPBzh?=
 =?us-ascii?Q?4RXObXndNYYWe+Xmd3NyEM79iqFv14fx1A46hvV7ukVB3zwSime9TI/SGN0P?=
 =?us-ascii?Q?BCmIOlh2Ah4NUIiXoBxQ3PksQM0iqRsC/o+K7WQ7/1QYlVKiA3iom0Kld2sj?=
 =?us-ascii?Q?nXKwOm1vCxJ5drT3eUUvCRmT71DCI0+k4vX4KpnKQTR5R5HtzzN8iZodODjm?=
 =?us-ascii?Q?jv+uohUItI70lfIVnn/tFPyAQP3mAAOOjYKLCbWOZXB5vsFWoiWraEj13D0y?=
 =?us-ascii?Q?94iNA11lQCT+nrUyQoTM+BTFxNV4FacjUp2MyMhNWYav7x8aVlDOekJxf10W?=
 =?us-ascii?Q?THZfDIEHVTZnOGsf8IFtlQEIWJCniN9gGXZhmyle6qapLcNjX77sPuVgso0C?=
 =?us-ascii?Q?C3JzYh9K+R/q3wNK7e3O9Do14isjBbNotiB+Gh29+nGynUfF6o5q/Ae8KnZA?=
 =?us-ascii?Q?NP3aPR1IWESlIdKzsGWOABgQ27NHptPA0tBaS/4DfNlBnDa0j6USkSAyR2Gi?=
 =?us-ascii?Q?edd8KPBnsXfP5YwuoOU1aEL26HyqCwZxKbQoriMkY4b+B5Zi4vumOjRM1H+3?=
 =?us-ascii?Q?tXKdaUqpOdwWx7YnyHMsENrGlTmX6EECu4IK6TB+ljkgxuaBsJzgEQLrprC2?=
 =?us-ascii?Q?P+99EjI4I90lxgoTuhXORsSk81hEgQxEkdh8hTogbwoFvllpXQ9YoiwpaSnk?=
 =?us-ascii?Q?Z0RmGwwfp9UbenAx9/PUc3vUQfY0UpMiR5Zv5RdkbwuG8aRBiirh8lh7xGHL?=
 =?us-ascii?Q?N85zrbrxm+vC3u/yFQE974HgFRVzyUavnUq/T9EZDylC2GDnfCEF6+iWnftM?=
 =?us-ascii?Q?boaIDWcHzhyqR0e/N9iDZE6YZS6wnpFW2SUX4GVFes6YWsZe0Ojisul6HISh?=
 =?us-ascii?Q?tJlCsSEPSdnrfMpvJVYHql1ce/LzNRDDKIRI4HSn?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad7e69df-14b1-494c-4389-08dcc62086af
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 22:43:38.3956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/JKzthWf9aUyf/RrVmWrRbNqOKUwf6Emp+rLLhSUsqxeZXuUBHJzoOo/5h+nmiY6MICF4vKENNjrDZoQ5GZdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB7584

Hi Dmitry,

On Sat, Aug 24, 2024 at 10:16:12PM -0700, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references
> to acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/keyboard/iqs62x-keys.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
> index 688d61244b5f..1315b0f0862f 100644
> --- a/drivers/input/keyboard/iqs62x-keys.c
> +++ b/drivers/input/keyboard/iqs62x-keys.c
> @@ -45,7 +45,6 @@ struct iqs62x_keys_private {
>  static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  				  struct iqs62x_keys_private *iqs62x_keys)
>  {
> -	struct fwnode_handle *child;
>  	unsigned int val;
>  	int ret, i;
>  
> @@ -68,7 +67,8 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs62x_keys->switches); i++) {
> -		child = device_get_named_child_node(&pdev->dev,
> +		struct fwnode_handle *child __free(fwnode_handle) =
> +			device_get_named_child_node(&pdev->dev,
>  						    iqs62x_switch_names[i]);
>  		if (!child)
>  			continue;
> @@ -77,7 +77,6 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to read switch code: %d\n",
>  				ret);
> -			fwnode_handle_put(child);
>  			return ret;
>  		}
>  		iqs62x_keys->switches[i].code = val;
> @@ -91,8 +90,6 @@ static int iqs62x_keys_parse_prop(struct platform_device *pdev,
>  			iqs62x_keys->switches[i].flag = (i == IQS62X_SW_HALL_N ?
>  							 IQS62X_EVENT_HALL_N_T :
>  							 IQS62X_EVENT_HALL_S_T);
> -
> -		fwnode_handle_put(child);
>  	}
>  
>  	return 0;
> -- 
> 2.46.0.295.g3b9ea8a38a-goog
> 

Kind regards,
Jeff LaBundy

