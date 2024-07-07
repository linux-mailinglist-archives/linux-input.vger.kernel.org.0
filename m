Return-Path: <linux-input+bounces-4884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C409929992
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0FE1B2079C
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D1D3A8CE;
	Sun,  7 Jul 2024 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="l8cvRzfl"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2117.outbound.protection.outlook.com [40.107.93.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2CE28DD1;
	Sun,  7 Jul 2024 19:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382037; cv=fail; b=DSDO4zb6AxTXtcsmbGQqgiVhnGpL/7/g5ob5gIaBbl56C6r6HzWwoD7HVQR+G8AaVgUtTG5rCjeXf7BevDdcdYjn61eY8Vr8gjSxNuPNUH8yY1Uu6JRTCiWd2amzxrkFrdy3gZ0z/nIktcWv7/D/PF2rfrgbWQPlasa5HA0mRQQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382037; c=relaxed/simple;
	bh=m0s6UynEMrp69P2pIZaa6vmG6eGqD8y5NrVTJnTxFus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=CrBC82Mb9G+INy9umJW2YPfRu60h5tBtH6z351wsswW6GkEFv5ddP5g7hshC/2aK6m05TTcP7I3pUg9awhgFb7sBYPu+/E47gvNm+tDZrbhoyiOZqClK9+Eg7PoC6Qf2coo9MdHx3TRduM0lD8hYY3yy2NDqubh17k5DIY/Efis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=l8cvRzfl; arc=fail smtp.client-ip=40.107.93.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bbd4bWMvrvdWwuHlsoR+Y1fPYKLpTvVSLs2sSnX5GkVlWDUPlMVP3OiSHIO4KR3wW1XZMH6bDIBLo37pmRgJfffIxaI4zntLlBOmIaf5WpN4fJo6qZN2juFFatEbEjBt+fNF4grxNjG4+JwQDXw94N8fPhV5+352DvcZnYACa6igQjwmDyuOEM47ECfUEkJ2pfBcouWj4TilWJKwk0Oasw5EJJkZ0AKk52NSW62BLakgXn5abgD4eASxMWt+/r3FyAPwcuXxcoT6zHZqw6tsnK15A43dL/hhiHGHCgmK+2G8vIhgVVU8e3rXcdSPoDxQggvESi8HByTk4esf8HdtNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjZDkRLMN31zsDx2xkW+EQ1WcHPVfn/xJj8luAdgOOs=;
 b=Oz1SIyI1qssUpzS6U0wPsYcpMEf9Q3tQ3Wi7wbC+kyCY18hjX68OCC4jdB52yoEUIjlQMoVxpX4JdHpsME5BMykEyTDTY8g62V1U3hVwq88qPqSx9OwNKJv5AKiG6lwLZX+P4BwI9z2Bk9fxUB9ZA0EFvo8au/beWo5i+0zC8TxVtgo+ENdyRWcKahIKd7GT8rFqBjVC0VrDIAXRbNOR91oiSC/NbtaFQiHOj1A1o8w+OZqE6fhLUMXxxQGWXvQ2UXr7bSz3Z45eNAAIhNseItB+TUPEnEWeDXX9HV0WSEAGa0LpXRdX4LepVisotMOGqzzHUg7sin75JPF17M+/Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjZDkRLMN31zsDx2xkW+EQ1WcHPVfn/xJj8luAdgOOs=;
 b=l8cvRzflpJq1hS19vi0T4L4JtaSai2pdajrMRxPweMxo72DtiSnd6zna+gBZQj+AXtlNWtB+F/hzpwPob4x6+nwa5jqtRWXn0yvCt0Amq3Vqd8R1JcOPVzy1rEXHFiq6X4CeD248LFih3zJEIjBdn2HEP8JlwITBIwkGw4AqGmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:53:54 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:53:54 +0000
Date: Sun, 7 Jul 2024 14:53:51 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/7] Input: make sure input handlers define only one
 processing method
Message-ID: <ZoryTwR3iKYkmvQE@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-3-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 430ff9d7-361d-4b0d-06cc-08dc9ebe87d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2OsbI92CXqvS9rF/rO+SEjNUs3pUdjdNwT2WS5MWvpy9mt0r0zsax2H692MJ?=
 =?us-ascii?Q?ir5sgRJ6H9aix+3czzGXZLdOeoqOytPyfZi1D+uC6RjPWGfGPVkhm9K21y0b?=
 =?us-ascii?Q?Xq3abdtTsSVFsrkz/Ve0RfV6Cq6UpNPOphgWMHIEQ1fy7Y59fYfcpo9biZHO?=
 =?us-ascii?Q?QM3LAgtszGLMuxvADNwVMX9O2GG3JnxiXIKwRDnOBT8PrQDeiXbyXCT0rLYY?=
 =?us-ascii?Q?NnSu5Bz6D9y0RWlBUfR5Kls7hhLWV1Gcdba+TkPqFnEU139+hYfsvTrqr1Oo?=
 =?us-ascii?Q?jwy+iNb2w5uPgnj9WgYXstMShaPJMDTdBRFxNFhH4uzoBQnn8TIDRf/Gvj8b?=
 =?us-ascii?Q?KDFI3Vg/4dpXmac5Z+pLi2VfGq8UI4zOdSWcvBnMfieU1G3et6cqldI9blJs?=
 =?us-ascii?Q?o9yY9r4qHNAlESwpBE1rTdbuvTtNAI2H2l+m5DQRM1wfi2rkQ/HzCkFzAaQF?=
 =?us-ascii?Q?9o2Mt+h6QEIG+YQgBFMGcGZN66QUwe+/Jr4R6rT7qYBwXVoNBBMb3LFZWlbb?=
 =?us-ascii?Q?Uk0Z/Czh3HzrEOLpVnXG6XNuoHdraYvCpsGlLjncpSVePEgRViZr0LGdbWg0?=
 =?us-ascii?Q?YWHDALlQnK+O6HinMNH1y486iF1/gDxFi2DW8FDWc0yIHjT9UzY6hm4EQPTY?=
 =?us-ascii?Q?Ka2TRtQwL5RzIYx3ldxG3/uRU0CXiJRiuuq0pWOrNzfRxzgJOtn5628YFJDw?=
 =?us-ascii?Q?s1xYtd5kHHGCNEmr7WY0zwTcYJp4YIoEFuuZ1KHvtmY/kOA30oq5UK6G2hwq?=
 =?us-ascii?Q?6QqGwKnCG/lIQspZbK4HjrxqkLY4UfWlB9SNX4G6nG69zNkR3YxTb/m4J2f+?=
 =?us-ascii?Q?QXBGn4tGvkTnYA3D8w+3cTCzaRQ5k7yHud4oDjfMJxUCPc+5Qx1x4AKVZfmb?=
 =?us-ascii?Q?LxMRNnEEWQUxIDPQrp73bjDkIJ/EMvM8mQH73waHQPQ2ts978MOCrI+LAXly?=
 =?us-ascii?Q?VF/a/ThgLA3fjFX+b6aHB0jghFXxclIewN2jvq6aOrn2IzfWkoLJc40kMb+k?=
 =?us-ascii?Q?/FQpncEglcSJ5liHf1bZFDryTd9nyQqLOL7q9L5Lv99qJ7IPjku97Mz+zqMr?=
 =?us-ascii?Q?zVViy/AH8i41xdY9Al31qJB4tO/oaKBkmoJO3YxM8SQpvnEwqrMdOGwMu2nf?=
 =?us-ascii?Q?E3NjgzqCJaxiKlhAxoQA0cZrDqymG8sheNx2ALuL2PeBNrnnFQyRVMN80mnq?=
 =?us-ascii?Q?m/dfn3MKqMV0gapm8w7nwpuZnOeZSWsG1bbgWGbjMcA22v/SIE8lkqO3Rmxv?=
 =?us-ascii?Q?hp+ckDFj9x9zUTzNS0m5Lo3v2eajlEDKhRHD/6xSUOsZw/xnlIlY/YHamEQW?=
 =?us-ascii?Q?rrfhMSnZP/UI4kTA+rk7LFay/nLPPz1D/k2gEIVkKbIWGA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gzRQXa47xwsvFmB1SfasBHeO3Mdiw1F155p8DwEfj+btqvf3aHGCFf47xD5O?=
 =?us-ascii?Q?h5LUYY0pGZt9ZM6K79QXEABIXcxT/rV9mp03gI8p8VhPTMJc3pTHALN0HXEw?=
 =?us-ascii?Q?lhMdXObktLrGG40hJTR1qJixQ2ykNFqqjTGCvdApgu/V+c+8bNR/WTfnf5aL?=
 =?us-ascii?Q?nWtO/HTZj+YNnGWZYnVgGPa9flcQWTUNxnZrB0RMEqlUMk0FrDW7ncWp1nXI?=
 =?us-ascii?Q?8mEJiTQMzh/jNQ+dq5DfB06ivMFk9mNAB7UpqP0/W2Fg35noxW3Jc8gLaadr?=
 =?us-ascii?Q?jcE92eLs7mbETnHfIrnr81EUMVxtzmYgQ6EaGVhUcFQ+b4CWpojKWe/dIAIm?=
 =?us-ascii?Q?8RGhIYxtaNaCXXuRPFRhKa4lNN3Y0a2FTDJsvghhnKZH8nxVoxGVGlng6qPf?=
 =?us-ascii?Q?GrIYHf8bKAozXMMSUGeyLI9IH5LbQnKAW+XGcwM+f6GSCBlDsbHIPN+32mNR?=
 =?us-ascii?Q?35vIzL2XqdsJw+zwHnjvZa9lrBlbRivIPbWiq7P9SxRgskdRYcXNRjkasYv4?=
 =?us-ascii?Q?+3sjpaGzp5fOntqvNcIAeWO6uKWsBEU7fCOi4yWp8nm8qEO+5HbyvOcFAGoH?=
 =?us-ascii?Q?MiD05HMK5sMqfDbbKfEIvBP85JyzFiLWKJ3bWe/yXLDRKgCzZNlS/I7GZdxh?=
 =?us-ascii?Q?ozVWKwU2ph/CpiEv8LJAiNe2p3nm7puYHbfq7a+6LKoCrAwDKnKmEx04Dr54?=
 =?us-ascii?Q?bKrkQZepKo7xbKCMM7fKQY6tnc5jVMxFNEBssWaLiT1NuYS6aaM0XqqRN4tF?=
 =?us-ascii?Q?bXmWPYZpiIdwCq52O3eqmQnZ3FVnbh5mtNRd2/9EFByVjZOQZvpRZ+umPsge?=
 =?us-ascii?Q?vrBzhM1Hob6ei/MrKQnF+gKBvfCDPishxpPOcUrI8MA/7db4Kxupvuvtudv5?=
 =?us-ascii?Q?YQq5qoKBPpyjznkuJlJL9lYXPTqpVirgG+s19DH+t8verO/VM9NNXArKU/9q?=
 =?us-ascii?Q?w1qxp4iGaicv7A6LoWaORf3sInxGBh6Xb7RME1PknXd5XYMbRyhwq0Vat3bY?=
 =?us-ascii?Q?efcG6YvrNEq6QRfrJjQuIG+QOvEGYfFhH8jZcTMQdBv9CISh2J/r+95arJhs?=
 =?us-ascii?Q?oS3U6Tv4waNwF1X5N1SVopvxcudo6qABYBKNpXpmoRK0sbISjYLtYEM67gSM?=
 =?us-ascii?Q?zgkApxMOek3jZQl9QeRpQVGgU/7LtqlGRBxgaky6xfk0nx9YDStntWO4q+g5?=
 =?us-ascii?Q?kfXiWM2XCZyngXEfDrfppF4Gl1Rxdz/zFXqFmj3Ra0qG4UGimwINNd16Ti0x?=
 =?us-ascii?Q?7NuCjvDqO+q3ROonvyyCUo8ZBUxSzI0nC084//beScSoa73yhbsgHLJOOvAM?=
 =?us-ascii?Q?CGs+OiVwkms1WpGxiINEu2LNBili2v36uRecd7y/UAReQCzOTxvfM/rp00b9?=
 =?us-ascii?Q?P+HaJSwTHYEpBfSy97tIOprTOEnhMqVsDqISWPh/Inls00hWbvVYvTcGipFm?=
 =?us-ascii?Q?+SE3lOZL0Hbj7wlDt4twqjtlEXdC7BZxpH90nt891EJY9jMKsWJy74Zl6NTO?=
 =?us-ascii?Q?Z/oguZ1eY1NL6FrI96hi/gm1H2VNW4ToA0Cb91y46NJYZHpcd1ZH0msvDdV6?=
 =?us-ascii?Q?U81zrVxINP6FL+9kwuicyp2znexoRaGAUYYAH+xT?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430ff9d7-361d-4b0d-06cc-08dc9ebe87d4
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:53:54.1079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmlGMcX8K9mUfcLOd0b//ukHX0g109SEcWOUAKT2pGhe4OeCy5xfpcSW5I4tt2wqQR7N05L1TomW6JzY50s6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:49PM -0700, Dmitry Torokhov wrote:
> Input core expects input handlers to be either filters, or regular
> handlers, but not both. Additionally, for regular handlers it does
> not make sense to define both single event method and batch method.
> 
> Refuse registering handler if it defines more than one method.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/input.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index fd4997ba263c..7e4f8824f4fd 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -2517,6 +2517,26 @@ void input_unregister_device(struct input_dev *dev)
>  }
>  EXPORT_SYMBOL(input_unregister_device);
>  
> +static int input_handler_check_methods(const struct input_handler *handler)
> +{
> +	int count = 0;
> +
> +	if (handler->filter)
> +		count++;
> +	if (handler->events)
> +		count++;
> +	if (handler->event)
> +		count++;
> +
> +	if (count > 1) {
> +		pr_err("%s: only one event processing method can be defined (%s)\n",
> +		       __func__, handler->name);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * input_register_handler - register a new input handler
>   * @handler: handler to be registered
> @@ -2530,6 +2550,10 @@ int input_register_handler(struct input_handler *handler)
>  	struct input_dev *dev;
>  	int error;
>  
> +	error = input_handler_check_methods(handler);
> +	if (error)
> +		return error;
> +
>  	error = mutex_lock_interruptible(&input_mutex);
>  	if (error)
>  		return error;
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

