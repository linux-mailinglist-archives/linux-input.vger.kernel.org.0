Return-Path: <linux-input+bounces-6315-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BF970AB7
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 02:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EEDC1C2092D
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 00:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73C7EC5;
	Mon,  9 Sep 2024 00:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="VRs0Pgtj"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2125.outbound.protection.outlook.com [40.107.93.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79E94C6D;
	Mon,  9 Sep 2024 00:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725840739; cv=fail; b=bsfkiU3EZ238sD0U1KUpg7F9Za8SU5JKZfNdxv3N0dSDiKDXTtb8hrltwQS6Tceg9pJ4jHjgek/Osp5BDBz3WVI0d4mrcOBZu9SjvL3PYs+22+TFfIBCbu1pZyKvA+7o/SkjRUPXQOul+gGnKyPj1JsiUElm/8MKLei8/iyye0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725840739; c=relaxed/simple;
	bh=ozqoQZ3TErvCmpXCOLG0O9Gv68YjiAool1MNLCVLom4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rC5uCnKe/mTxCx7fNm9v4kq3YxXo0No5QQF/e1xS/W9J2xyi2Jb/a1blPCneR4rl7EdlWvYvzD/Q8YcovkUiwbbchyWOXF+rd+kbIaYaS5I6nvjUL3fVSNxA198FjrU/ydqmbSa1tFndGvALwmIBF8g99saVx2vVst3wzn+oeWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=VRs0Pgtj; arc=fail smtp.client-ip=40.107.93.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAzULS/bVonSCO47Zd/24eMdrSZt52PKruETeAcTlAeFnrxk59zb/azvA15Vrowlhko+VZCCLYL0jqPIslk5mRQk3DQTWFl6PKagvSfRDKfQtdLnkVGteF+UOeyT4GsysWl7bN+6utT1mXaiMBQhNNtcJqBlHIF+IaUw2fBoQYFiPveciMA2RouqsFzB0U3aJ3vDJVlDl/d8v7voaHUjYbVGzj6htFnGsFZcQo4Ig8BkcFAT+5DYBRWMesoaOSVLBXMdBjZTZUXuBCoWFQaJGcdOThUwTg52LYnKZiYxG1V8yEE1O6m8/1tk7Tr8tMUuw4G3GRH243C8C9reQ4o2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKDWo1cpH7LNZQTyaTA60J/bz9Ldq7u2M5GHpobkLcw=;
 b=I2EOOCgGLuotXwDSP0f3ndFCFtzWBCXC19cdvYRaKrPMwbvTIGoSxU4S5PrY3u9qpoo/s7/6dOdlhCMszxk2i+cQXn+y6yAwGFx0/XPbEbpyvpk0ajEfhKhQbKYfQBvEdBeQH35iUQE14XG9fIMetJI2Ku4Y5AWwGfcfFPgEFcO9qV1G6/8sX4Oj6kNeONmnUIdWjHmd42aUXgLfQ5cC4gUoTfyCg52Ba50XwMB3npm2u7T3dc2ya/cuOWA2QOsEn916//qeLw1FBuTcoQ0dzST2GKynI/3B6NXC7iBIkdYbIyWe3L4Xn88/kDTpK+S5gmhNP3e6BX7cJkWnnX96oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKDWo1cpH7LNZQTyaTA60J/bz9Ldq7u2M5GHpobkLcw=;
 b=VRs0Pgtjy+jkR4fElLss4LjYsRDHhDTB2p3AhFMuCEp2a+DwfKzLIZ8opHF/g7VT9A6AeZnU56xCL/MI47BvX/x1/hUfgH8tFBw5HiHoS/JOCjE3iE8T/8Rw86u7ifJpOmITgT5ilOhrPvj2vXQnWbhz6RKefPoird0V98dHiB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SA6PR08MB10549.namprd08.prod.outlook.com (2603:10b6:806:437::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.31; Mon, 9 Sep
 2024 00:12:14 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 00:12:14 +0000
Date: Sun, 8 Sep 2024 19:12:10 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/22] Input: iqs7222 - use cleanup facility for fwnodes
Message-ID: <Zt49WnZBar2D822M@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904044825.1048256-1-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN6PR2101CA0010.namprd21.prod.outlook.com
 (2603:10b6:805:106::20) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SA6PR08MB10549:EE_
X-MS-Office365-Filtering-Correlation-Id: 00528c48-eed6-4199-3c83-08dcd0640ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uqqG9pvCmTKxt6/zsbKZ3uwUw5RWFEsZ4t6fxgsnDiGJ2OgFpI5Dc8sBMGnh?=
 =?us-ascii?Q?F2F1s1C8VnbgwhqmGezZpvmR3UYEJqZFQCuYfXkRnraNNohPWO+1pbPfU8tD?=
 =?us-ascii?Q?kNMcy41+KVoDLoemJN7jvefX3z+eGDUpQiEbiObQJwH3eoFdxOBVElKKeu9I?=
 =?us-ascii?Q?Vs1osWdrUHp5Mj5xrWmO0xyYtcGNRW0eQE9FJmxBR3bbEwo/M2N/BKgvut0q?=
 =?us-ascii?Q?zsAdsIwYnrW8io17POlPGZ7mY7Nh/aEf6ztF1Jtd3Zmv0Pzlt9S7uz+IsNXl?=
 =?us-ascii?Q?KVQAoMI2HKYXYhTYBbLn+q1vkicHEOdllukaQCxTa4cbIRQ4lcNplWICVro2?=
 =?us-ascii?Q?Z17Qd1rjUZvgwuKqvoae4Fg+kXX8lqQeskVZ4NUphN/jNoGicBClBlHuZcT3?=
 =?us-ascii?Q?9Xp1quQCOmIlogPMSBZygFJ7qWGHI/IQ4HeOBNBucv6i7l6UOAW75x9A3Do+?=
 =?us-ascii?Q?g9vswlO4tjInQKwTAP/7qlk+BrayrsoSxUIcPbFXgvzcDFU+hvhmlFQCg4XK?=
 =?us-ascii?Q?s4yBNmidDGtvsIMSwpbfE/mPtJ3ouak3CGV674tYhgUIGT24FafPf2rCd/aL?=
 =?us-ascii?Q?uXO+TzvS433WhEoUP1DtMZnepHwp5xFdb1uetyOXYlD6lR8IWh3c9YLtbHr2?=
 =?us-ascii?Q?RRHYRiE1dqlx0pG7ukJ0C6WdKnt9WSFqsnGUeVA8eoLyC6TU708skZwp1EIr?=
 =?us-ascii?Q?VNUfyyU2S0CyTwi4ozSHOOSVBxjgO1zVK8Yy+vx1Esvlr03OHZRFJoLAJIAG?=
 =?us-ascii?Q?70I27+vWx45wGpHPq9Id7lb/giMUL+nMk95YLE/6O+D4Azs0jcKIAkF14Fer?=
 =?us-ascii?Q?IWpatMWJsddcz4sMB1nn8l+YdqLFDPqlEaCbrBxS1ZOWI3hoQ6SjSLl2h6IM?=
 =?us-ascii?Q?r5UhEDOwd2BOaPC2a4ieul16ZoDYeYIL253zhyGs35Y+qyyGJPMuP+0s/+Y9?=
 =?us-ascii?Q?iPYMPl1c3jMQLqH0vcdHeShgnrxuiIWwnrHcZDVnHaePe/WPI/4u0fy07yuZ?=
 =?us-ascii?Q?EXmR965MzDqSPNCJHr0/2x64u3788yfEYM6kGAttCwVbcjS6b8jTMbX5sZSJ?=
 =?us-ascii?Q?I/JssfLyrVGONLY1GfFSNSN3/nM4S1n5uXfRrbefjLg6UKKyfn5iFJSBjGdk?=
 =?us-ascii?Q?4myP2Cn+Jcs7mGKfkzwV2cQHMV+zmCqXWpNsoRJMl08/57KYS9Z6tLlRO1ek?=
 =?us-ascii?Q?qClsep006ORiTlfKJ3xgU7rIUvcwdulkb1RYh3yWDnEoWypm1f+gT0I8LHET?=
 =?us-ascii?Q?xCXamC6W9gedQ1OWx/dZ40e2Pmk7vOChT/St4AElQMCl0VLcTqkCP3awPPoz?=
 =?us-ascii?Q?C0zlSh6qjKSVVCCYsSq1359V8RmQyBAGicSu9aOyFTYkIA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X4pl7ejNOL9uWrBPTQ9szgWKaJLcAGd+5rAZuhTOwIENACGlkWkIBnwdX6Te?=
 =?us-ascii?Q?3+E2l57YeDJKr08sQYd86eA9fs+Dsb+v5G8OSF+RESSIEp5+Ty0CtNOrxIs4?=
 =?us-ascii?Q?Kfu8+mfQdxPWLxX7hYBwS0UqDJiYmSNkQiGxuLdheuXIDcXtEhbCWVbmcbzL?=
 =?us-ascii?Q?Hq3Ep6ESgnyMLZs5yznqXXFC8Ku6WB45dW3f5qIpaLxnBI23c50eBV7JRMCd?=
 =?us-ascii?Q?ZtWSFqBsrWUhqWXUa3+D0Jr6CJUkruEadVVgBpWTY6ip02g2STiF4Cdfkmmw?=
 =?us-ascii?Q?2eE78G1GpYOjP0y3V1aZTO2IfXaMhJx5KvUw86f8FZE6O2dCYDk6YAXVEvD3?=
 =?us-ascii?Q?eqYJKW+WOAHrfFwNzSZvxM5BvLoM1UamXEL83g3BTET0txSkoZ+7CV9DtoTA?=
 =?us-ascii?Q?A00SDcXElgFGPP/3xU/T64gFIfmLRe19xO891QWb3Q4Vk6UiprNzzv03FhCP?=
 =?us-ascii?Q?8gjbLxdnX3fjvrWEJqB+aNrO625gNb9naNOCwBe4J60RL30CxTNYC81uYqZN?=
 =?us-ascii?Q?NCgzer8rPrEQup3JsMGyDQQnDzKs3ilxoxDm9sx5Dj9jGeaHtgDFRMTjQTnE?=
 =?us-ascii?Q?JqWJz9XHmuv41m2MMHYR5gimkmBjPrVQdlo1wtjBvEAbJoNFbFbD76HHlymA?=
 =?us-ascii?Q?FTQdGGWEe3lbHWIlNKpa7M4Q6MmfAjYA3BBaQSksXF8+jEXhzULaX5oVP03n?=
 =?us-ascii?Q?eWonRpqRGMEuTJqaRj615gueVJyBfXyLqGCjEYRtFsTzFB8hJjb0YrzBvGv1?=
 =?us-ascii?Q?xXkBps+ASptk0ZFBBHGC89kcYrqUX2t23L8qoUR5hJEr/QxOJmuYaAPWFLiX?=
 =?us-ascii?Q?crZKGMElqzKMlQC3JS7LTXw14gIpWYDbzKIfRK3BO4UsoPxEjJFudxBV+cba?=
 =?us-ascii?Q?unHvUAbDmmt7gucq9KLZVTNbXLOVNuf4qf1+5AT9TD3S7BRfiCz1AhUZKcYF?=
 =?us-ascii?Q?ApcdAKUcP8+lFUvSsLIPaAY0/MntCjEXiHwiSrS0z+bddvQXYuJ4pxDBVYmH?=
 =?us-ascii?Q?tWZr/UXhuJjUaH4Zg5yWtvTdeBBqYKkk8m/+qGS5kMGH/Fjs8iSHRgkFeSo+?=
 =?us-ascii?Q?Ro+U5kuG2jFGwNHmPizpDgcRvibxeSgzlNTo5SE3rvbjwf56bVREgGHT3E7t?=
 =?us-ascii?Q?qjxZd5mfzC5mY1/0xtitMmgkPxX4VU+oUJUWq0zefJSy9+KT9V/bb1bW8mzJ?=
 =?us-ascii?Q?9mitBR3DbDi4mJxmXlCrA9TLW1aANwcUPf1ovGylYhg+pNlXAMX3iNOKvDBo?=
 =?us-ascii?Q?vTu74Aem1eu4Wuss/GOMiLf9il2vEgD1ICBmh7ophcPzQCe16+jsrlnAMLlV?=
 =?us-ascii?Q?loxZ2pdhMdTQfptPFZNhhuMHklMslVgiXiZTcPnxqEUOWOurJ5U4nX/xCVpR?=
 =?us-ascii?Q?LyBksY41sezGuUq2wN/wVnfnM/jovh8Wb6iWGIKH5X/qffdXwI4iHqEET2r5?=
 =?us-ascii?Q?y+0sqlp/0pKQ58oQvGrdLLjlOuCmdlF4BpYFRanc04V+m7jW3XkvHav0ySJ/?=
 =?us-ascii?Q?yhjAW4fV0PQ7T/ploGJyZsT78MJOoz4aCgtBTSy3IiUUWVlnl8j2sRgtTV8r?=
 =?us-ascii?Q?DwP1xS6+/MPmI6LHecmA4ipBLfaUNe7V/WksHSuS?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00528c48-eed6-4199-3c83-08dcd0640ed9
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 00:12:14.6151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WholHZMRUy4W1U6hVV7Khwy62OQ1m54iWq/RMi4lhfaBulNHHDgp4FbSF7AmXXYe+RfSxNWxRWyw8ZOo+URafQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR08MB10549

Hi Dmitry,

On Tue, Sep 03, 2024 at 09:48:25PM -0700, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs7222.c | 30 ++++++++++++++----------------
>  1 file changed, 14 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> index 9ca5a743f19f..d9b87606ff7a 100644
> --- a/drivers/input/misc/iqs7222.c
> +++ b/drivers/input/misc/iqs7222.c
> @@ -2385,9 +2385,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  	for (i = 0; i < ARRAY_SIZE(iqs7222_kp_events); i++) {
>  		const char *event_name = iqs7222_kp_events[i].name;
>  		u16 event_enable = iqs7222_kp_events[i].enable;
> -		struct fwnode_handle *event_node;
>  
> -		event_node = fwnode_get_named_child_node(chan_node, event_name);
> +		struct fwnode_handle *event_node __free(fwnode_handle) =
> +			fwnode_get_named_child_node(chan_node, event_name);

This leaves a newline amongst the declarations, but not in between the
declarations and code. I don't feel strongly against this, but it's
opposite of what I understand to be more common; please let me know in
case I have misunderstood. This comment applies to the other chunks as
well.

>  		if (!event_node)
>  			continue;
>  
> @@ -2408,7 +2408,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  				dev_err(&client->dev,
>  					"Invalid %s press timeout: %u\n",
>  					fwnode_get_name(event_node), val);
> -				fwnode_handle_put(event_node);
>  				return -EINVAL;
>  			}
>  
> @@ -2418,7 +2417,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  			dev_err(&client->dev,
>  				"Failed to read %s press timeout: %d\n",
>  				fwnode_get_name(event_node), error);
> -			fwnode_handle_put(event_node);
>  			return error;
>  		}
>  
> @@ -2429,7 +2427,6 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
>  					    dev_desc->touch_link - (i ? 0 : 2),
>  					    &iqs7222->kp_type[chan_index][i],
>  					    &iqs7222->kp_code[chan_index][i]);
> -		fwnode_handle_put(event_node);
>  		if (error)
>  			return error;
>  
> @@ -2604,10 +2601,10 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
>  		const char *event_name = iqs7222_sl_events[i].name;
> -		struct fwnode_handle *event_node;
>  		enum iqs7222_reg_key_id reg_key;
>  
> -		event_node = fwnode_get_named_child_node(sldr_node, event_name);
> +		struct fwnode_handle *event_node __free(fwnode_handle) =
> +			fwnode_get_named_child_node(sldr_node, event_name);
>  		if (!event_node)
>  			continue;
>  
> @@ -2639,7 +2636,6 @@ static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222,
>  					      : sldr_setup[4 + reg_offset],
>  					    NULL,
>  					    &iqs7222->sl_code[sldr_index][i]);
> -		fwnode_handle_put(event_node);
>  		if (error)
>  			return error;
>  
> @@ -2742,9 +2738,9 @@ static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs7222_tp_events); i++) {
>  		const char *event_name = iqs7222_tp_events[i].name;
> -		struct fwnode_handle *event_node;
>  
> -		event_node = fwnode_get_named_child_node(tpad_node, event_name);
> +		struct fwnode_handle *event_node __free(fwnode_handle) =
> +			fwnode_get_named_child_node(tpad_node, event_name);
>  		if (!event_node)
>  			continue;
>  
> @@ -2760,7 +2756,6 @@ static int iqs7222_parse_tpad(struct iqs7222_private *iqs7222,
>  					    iqs7222_tp_events[i].link, 1566,
>  					    NULL,
>  					    &iqs7222->tp_code[i]);
> -		fwnode_handle_put(event_node);
>  		if (error)
>  			return error;
>  
> @@ -2818,9 +2813,9 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
>  				 int reg_grp_index)
>  {
>  	struct i2c_client *client = iqs7222->client;
> -	struct fwnode_handle *reg_grp_node;
>  	int error;
>  
> +	struct fwnode_handle *reg_grp_node __free(fwnode_handle) = NULL;
>  	if (iqs7222_reg_grp_names[reg_grp]) {
>  		char reg_grp_name[16];
>  
> @@ -2838,14 +2833,17 @@ static int iqs7222_parse_reg_grp(struct iqs7222_private *iqs7222,
>  
>  	error = iqs7222_parse_props(iqs7222, reg_grp_node, reg_grp_index,
>  				    reg_grp, IQS7222_REG_KEY_NONE);
> +	if (error)
> +		return error;
>  
> -	if (!error && iqs7222_parse_extra[reg_grp])
> +	if (iqs7222_parse_extra[reg_grp]) {
>  		error = iqs7222_parse_extra[reg_grp](iqs7222, reg_grp_node,
>  						     reg_grp_index);
> +		if (error)
> +			return error;
> +	}
>  
> -	fwnode_handle_put(reg_grp_node);
> -
> -	return error;
> +	return 0;
>  }
>  
>  static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
> -- 
> 2.46.0.469.g59c65b2a67-goog
> 

Kind regards,
Jeff LaBundy

