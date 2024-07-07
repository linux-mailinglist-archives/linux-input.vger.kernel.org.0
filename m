Return-Path: <linux-input+bounces-4887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7F929998
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 058E7280F55
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9D339AD5;
	Sun,  7 Jul 2024 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="ett0xspP"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2129.outbound.protection.outlook.com [40.107.93.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F007C6F2E5;
	Sun,  7 Jul 2024 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720382172; cv=fail; b=IGjX4ExKuTjugeTmIhBAQSVpYsJT0QwJDHcZZI4VpR8Ro3BGd6bsJVwLjsn7k6Em09ULn1kyFmXeXaNRrf/TtfNs6KI1AwWmhHRhz4AQEx4bVG9FgNvj/GsP6J0lzuLBUHo2zLx6vC5rh0iluiN6dzZmlubYS3Hp93W2HSDL+9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720382172; c=relaxed/simple;
	bh=usqL7shUYaty7BCB4XzuktLCyyOhGDn8mhRVF5pkNmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G7KexkwntUhOK0SQB2DEEfX1Sd+jgMa+yZPHxFCeEm+A1x9ubg+RzRsvg1N5vFkEn/fHlAl2CsdC+Bm/DLlIgmiKbAOYtd78L5SNOZrishiZzkbx1w8lv5rgDtZQT3ZGgoH3KLtyvBWkDoBDwKlk4zKu8URn1gXP4ChkZzGVW0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=ett0xspP; arc=fail smtp.client-ip=40.107.93.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WH2t57ctWJgUgLq92st2SH6lFyMNh7jR1VRU2NFvrldcaVBUAsSAm9GuA1PbYIb2DcXDzcUBwZ/1ouApZP3SWTzcDzs/G3NJELqPMl/n48xpUfjPbQNn1vPJ09jt4bMmoATxDxy7nfmcGQvI+RIYLTunRv1A9rdYzMJbqNPy7b7n2gmvI41Gp9K5NmsD9w+b0OMHp9k/FcdklLEAK+SGk5FCLTXjl9camERApHGRZbshj7QdIoYFeJLJRpQhu8WAsG0UkzymZw8GVHxWeirOwo9zCKw8varr3CZlobwT/zb6YxTQPrvesAa1fvG1qUVK1ZOFumLw6uE8dIrDJoFqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDhqDiKmFwjFHZVuVtJqWWjqDeJ7usgXakOKZsjuihY=;
 b=kDvrH9d/QX7NtGe3nVXr+dwxSbp3MhoGTjOAXlJDoLSABfavXCmLbemfBvePzvZcrVNfSWcodVhq4mI180uCj+Tn6IfdLbjMY3OHVE8zn9g4fe0ykYOzOL3GPPF6WauncbM0+5MHiQYDLupIG3g58dMtxe/aug49MPgYQdDpOFX1DNSM3HHqe0rjAusvQOG/hhSoVzOgysJiXO2dDH1H0YYeyvNd+0BJJ7ADnYdQHE9Bjo1vTyJSyGXnr0dymTAd4RBldIVKhxf7uxPIcTrNhrmKEWKd66pIxtnHfCIDkNoXrFiCJ9vGP0ChsKCwZbr7/2iX6p0IAiiXKRGkR4CJuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDhqDiKmFwjFHZVuVtJqWWjqDeJ7usgXakOKZsjuihY=;
 b=ett0xspPnwKtI1JAgHdkI608jOSlq6PE192oXJR5cFdeU7dvmn//gd1KHrUPbtV9N6Gn40coilWfJjnqU2AO/llKTFfJkN4etJonQCoPb2E2xHhLIpwCL/NJw8V0dAithEK92LBTr3hWykgVIudEAYcjR7QIc2Ijd781lngGUYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6431.namprd08.prod.outlook.com (2603:10b6:208:1ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 19:56:09 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:56:09 +0000
Date: Sun, 7 Jul 2024 14:56:06 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] Input: rearrange input_alloc_device() to prepare
 for preallocating of vals
Message-ID: <Zory1pyXKbsvUFqU@nixie71>
References: <20240703213756.3375978-1-dmitry.torokhov@gmail.com>
 <20240703213756.3375978-6-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703213756.3375978-6-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SA0PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:d3::29) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 6007cecf-cfae-4f02-130f-08dc9ebed85e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F1aVZF8wDr0a3Ecs2fuK4AnbSItvg5ZXGvsKfra5N0zF+q7xjuzyKdrC87+U?=
 =?us-ascii?Q?Au38pmn1b5Drdpxo/Q0GJfVUl/eoOA8AQQDvXXlfpvxfIm6vLw5cNI/qdeA0?=
 =?us-ascii?Q?U5RiozPY8adxAXkGBdeSDvkqF7vMQvSM8OrIDFSCX4VPcJ69tvD9vMWqw2qX?=
 =?us-ascii?Q?3YI7hhsd56EFYBNXPhCSTYLHZSAyuhNGjbzx4ujcItK4hQ2HxdoXL2Fyzaao?=
 =?us-ascii?Q?V/58FwAcDVm9MHzTMEkQ4IsXsHvqMkG1frTkC8jBNFV+2AWx2hwCrbjEepDE?=
 =?us-ascii?Q?aGoc9knf3l6ZHUl0dEHkze0RjRvKHaa11yeRTrIT2bisYOWnDeToOrsadklw?=
 =?us-ascii?Q?RqwOjvkQWb2r1FuCvdpk6FZtSHmvcdcPQ/KJi6jhLKHnYnRFjozw5ZjPCtqR?=
 =?us-ascii?Q?/ZJ3rBkCEz6t6iKBPxXXA5MUUbJsdeaBMlCyMUjjEFuwzZ8DcN4litssxOUZ?=
 =?us-ascii?Q?rCLt1cfrEdU4pk/XPGVhn7UUA2xAu2F/QnBZNRMjB5XLmdPIundTqGZyIyfF?=
 =?us-ascii?Q?sIbnk3H7G2Z/Snof3RPd15PSjNEpul7MsxSBtc/+RokFw9Rxtf+ZslZbIA8g?=
 =?us-ascii?Q?dkGnnkhiPUh13dIsr8NYm0UpelR/apeL4jGtKJPpRj9VFVwSu5Tbir2vRLUP?=
 =?us-ascii?Q?0FWIqBNhBIR/EKaS2w7UqlfCYLY/ZUJ9I/KBNJ20bwqPLixaeIsB2cG+ps9x?=
 =?us-ascii?Q?WwjLl5wviJ+cHvLkqLf/HOkRG+m3ETsIIkP98QqkfjbNG4WBpCqe533qSe5y?=
 =?us-ascii?Q?gz3E/HuLFrdPkcoU01Dm25zJedys44TeG2H+7kw+l+v9CzgT1YVrqc6Nh8xh?=
 =?us-ascii?Q?147w3Rv1aFvTeDdmKUJgboaTpHw+1ZaORxSye3WGrK1z4ijAphVr+MFuJPqZ?=
 =?us-ascii?Q?7TLd11EQ8ue/eY00aA2n2uSpXwJuxpjIoED8xOMhwSWllGZhFPdmtbIasysh?=
 =?us-ascii?Q?BfWqV6WXgXbHEMv5R8RGcRgglxL6/nFQxIM7mSTSoOicWy3p3FO8gWY6WLAl?=
 =?us-ascii?Q?2B0vS1AjFFALaEpghYtgyEJvCr3qwzbsIFXdynxlyFMW1tTyG7vDi9RDPylp?=
 =?us-ascii?Q?GVmdqprTapmIZsfAQAXbrQIys54vXBjyKrJKjJvabToUpx/ICc2L9RwsGZK5?=
 =?us-ascii?Q?pyxOIVBNzCZb4rfrHoOJGJsTVbG29QqrYtTVr8F51ZbVGvc/uw6GteWhDo+P?=
 =?us-ascii?Q?8S3cTUdZkIfry2U6HGGssdsC61/58PAuVrVhwaVrMlOM6d3F9ZsMMpea6Ia1?=
 =?us-ascii?Q?AVizfv6Ls0myanRdS3R7PhHjZFDkQBnhHihNKSny4EBhvWqZBzGfU1v5DPL/?=
 =?us-ascii?Q?RuYwC+MwRuUiJ8o58XHyXe1AFydam1OQH8kRgjltLlsVeQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6c8PtY/KBCZWyWlZ+Ljmj9rY8Plwq+fTpXlI0uTVWWi2NEyQOcA3MXk0v3e?=
 =?us-ascii?Q?NEBvtFxNkGI33lpxfsvMKAJRktPksLCFKYNO+uSlaMOq+5FtLQpN1IkUHPYS?=
 =?us-ascii?Q?SanTL+HhJZ5B7PFSaK5jaJrSp+UhkWA5UDe01crWeYPBSeJkSZjhPvXw5UlD?=
 =?us-ascii?Q?LhtpWTg9VLWs2Y3/eIDWvQfPNRAk3sA3vtd+pa2h3Baz9T3sBxrgSXurXoqQ?=
 =?us-ascii?Q?/NYmH9bD+2kina7kni4LbtUskUpKi2rWqfEGqlQti/q9UfFciJhtU3rYjXwD?=
 =?us-ascii?Q?LX1zaaaMxLkPWRQ90afzGampwEhk8KN6RSqZHHEwW2LsizWzmYlWDx53x0on?=
 =?us-ascii?Q?2cdT74/BbEL1usIh5u8e0+qRvtTV2/6Np7d4ZKsmY3O3G5sP1mN9cavT7dG6?=
 =?us-ascii?Q?//m9tjIUltJGi4MwKVnoLUfmQTIbsuUfbf4RMBAlZTuQFiy3CPd1mXTz4bHF?=
 =?us-ascii?Q?oJ7sLUKhdvI22RR+3KSKaazwkaDYFiSqtkGgvTtzQMBeProajps76O2+YqQj?=
 =?us-ascii?Q?PumYRKsVXK9iJzb6ZL5l30SB5vV4ooMT6rpz7MX28dV0S0QQAlaCymY1FJrn?=
 =?us-ascii?Q?NNbNZTi9bZgOhsnxGxU5CnXmUw6rNbze8TeHtsGqlqPpq5lPQcaO4N8pQSwp?=
 =?us-ascii?Q?Rl9WdoRzw5s2zIySaJCfvvmiFCS9FBvlkYzQUUXDwj9I9jTRGYoO3znNDo3e?=
 =?us-ascii?Q?UgkT5VlxfcHuMsuR6TAVpa5wuM6fDCUxnEFo3YIJ7vN0nEZ9LgCGUdzxqgLK?=
 =?us-ascii?Q?G1t9EipMJGFzVLbfRNWtoBuWKzqCGROCs6G7SSlM+I6x/Ib2EjH7hjhWazrL?=
 =?us-ascii?Q?KFZ5sNPeu5CdXCyMlzIfwU7A2Abw5jKD00Q4UlKg4beyZ+ZBOOnBQTqwi5v+?=
 =?us-ascii?Q?PJz1/iKUTM4ZEZtnZ+0Rsi8Ty0tPnOP7lEA065MTrpotvNSduWj1OqRx+A0e?=
 =?us-ascii?Q?F4FyucB1C0xgTU7gflfdwXNBhtMbmuiDKXViMLe8xdxenOkLak1CQcKWUzH/?=
 =?us-ascii?Q?mqsvObBRRjPWq5PQmMBKyXK+Uu/0gCWrVMXfEV2GNQy/nJrqwVclK6z4aRO7?=
 =?us-ascii?Q?hZsxUF0XS/sGRkv51CKi+7h4+uRrXr2svwBbvpPj27+EyWGf1Voyh+0row8r?=
 =?us-ascii?Q?x/3xRm7mcnSN1QOF1nPGYh+vJdzc8cHiLlvpW6zAFQBZbTCJr8eEurlCrwEt?=
 =?us-ascii?Q?BEK1VcJX/Y3eQtDPEh8SVmjB8DCd4YygYtfhh9YcpALoag5TOswH9yXrl+4W?=
 =?us-ascii?Q?xWfPOTzRElEi78a7h2EwKR7pnoZ7YlyiipCP9icKsf3s3aQTmyIqZzFDpNha?=
 =?us-ascii?Q?yeOYOEGHOvrP5e5YzYU52/cOkH9UDsdbo/zG5g2BWCMxPvKkqEcHa61I2A3k?=
 =?us-ascii?Q?t2Ux0vhfigDzqt8s+V2A5hXromzhuoHlhLBju9/fVwmfY1/NmCtItC7V+1KR?=
 =?us-ascii?Q?5AxlEywaZl+/GGw17i0B4tbXno6DSqAYsYCoRFPefew/EOsAkLI57sT18iQu?=
 =?us-ascii?Q?Moc1wfUBBbbOhAj0ApewOQDBkouzjQMI4Cpa+nlL+DqAqXhMbq+t+w7EJ1/5?=
 =?us-ascii?Q?0z2R1eYcS5TOm/2enaAN1+enWiYq5yZ+hrovc195?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6007cecf-cfae-4f02-130f-08dc9ebed85e
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:56:09.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wr+LquxpE+kCjnpTQHww5pS/Si7BL1Ou7f5RstIaBCwLTyQmfoZHAB1SPtvfvyNChLmPEKRRNLhBKOtpaBvrIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6431

Hi Dmitry,

On Wed, Jul 03, 2024 at 02:37:52PM -0700, Dmitry Torokhov wrote:
> In preparation to have dev->vals memory pre-allocated rearrange
> code in input_alloc_device() so that it allows handling multiple
> points of failure.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/input.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index 40a04154f99d..9981fdfaee9f 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -1982,21 +1982,28 @@ struct input_dev *input_allocate_device(void)
>  	struct input_dev *dev;
>  
>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> -	if (dev) {
> -		dev->dev.type = &input_dev_type;
> -		dev->dev.class = &input_class;
> -		device_initialize(&dev->dev);
> -		mutex_init(&dev->mutex);
> -		spin_lock_init(&dev->event_lock);
> -		timer_setup(&dev->timer, NULL, 0);
> -		INIT_LIST_HEAD(&dev->h_list);
> -		INIT_LIST_HEAD(&dev->node);
> -
> -		dev_set_name(&dev->dev, "input%lu",
> -			     (unsigned long)atomic_inc_return(&input_no));
> -
> -		__module_get(THIS_MODULE);
> -	}
> +	if (!dev)
> +		return NULL;
> +
> +	mutex_init(&dev->mutex);
> +	spin_lock_init(&dev->event_lock);
> +	timer_setup(&dev->timer, NULL, 0);
> +	INIT_LIST_HEAD(&dev->h_list);
> +	INIT_LIST_HEAD(&dev->node);
> +
> +	dev->dev.type = &input_dev_type;
> +	dev->dev.class = &input_class;
> +	device_initialize(&dev->dev);
> +	/*
> +	 * From this point on we can no longer simply "kfree(dev)", we need
> +	 * to use input_free_device() so that device core properly frees its
> +	 * resources associated with the input device.
> +	 */
> +
> +	dev_set_name(&dev->dev, "input%lu",
> +		     (unsigned long)atomic_inc_return(&input_no));
> +
> +	__module_get(THIS_MODULE);
>  
>  	return dev;
>  }
> -- 
> 2.45.2.803.g4e1b14247a-goog
> 

Kind regards,
Jeff LaBundy

