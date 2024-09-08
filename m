Return-Path: <linux-input+bounces-6313-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB957970A54
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 00:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2749B1F2165C
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 22:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5291175D2F;
	Sun,  8 Sep 2024 22:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="c3AUpxmT"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2107.outbound.protection.outlook.com [40.107.93.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21DA139CF2;
	Sun,  8 Sep 2024 22:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725833308; cv=fail; b=p6ICYsrycItg4ZzWZIEzLJn+7gwMH5/F9xptq2lh+3WYlQiUwguWdLkYu3k1BcBNJPRKQNeSPI9fYAB30vX42Lpam2CoQOLI7QUX46wGv4B1FQ54n19xkyOhrAmcVPc8On7OwYIq2xGhUlzGrZGRIk2mSJhjUxGQXi6xg0xqCIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725833308; c=relaxed/simple;
	bh=BEALB5KhNW0KgM00T/abiBW4UYPMYfgLGuZ+4xIUSuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HZBwPkJdnYLrz48zHspU9M281JbB0VPCT4ZlhKqELyhOxvWjX2PIcdx395nQ5SzKaBxmHIoie75SbgArGgEVk2mRn3OGbimnYq3O2I3J5QvpbiifiP7F40k9j7GMlzmUvms2AssDUrM2IMHqGMiLtqDus7wX3WTxdzHTm1FsEqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=c3AUpxmT; arc=fail smtp.client-ip=40.107.93.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqnWMa0WcqkjS/1Vk7PQlns/0PsrGhy0O09bTHH/TSu7HeS0zTLyCH/Gtbw4PjM1345wUZX1cr8OnOMyN5Ox77YOndukPqKFtD/4MB2M3sKIvq+0u0OjMR41BWQSm+B/BNpcLdtiBoxrfd1wbNUX2vUx9IUldtFP9YPZM7x+iiomU0GxlGta6ZScgEM0/ISFf4P/bp/FmVou9wyDEajDCZIXU2S88E1ApMPYmyjoFRFj+NT8EmM7eC2iD/fWVJjsM8Y1aL9goc7j2RWuA29hvfhf5gfKh9XZ72k6vTZi2XlVAWPE6t/NVe4hiMeymqfpHz6o+Ir37qYO7z4rZOcURg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wIdtsPA2LlBkOe0blEO3aGT5LvG3QnI0n0w6IHLp5kg=;
 b=I1yhrUPYgrL4Wfe1kw3Z+e9sWNDhKe2YcYWem2PpYG3YS1+4ObMCqEChDUyPCLyUrPsMl2tovUNez2d8W1ewSxJzWGwpXwpmDXeeZ/251DIm1L1ocKw7X2KNs/mPZ9/QZxTHbTQDulwj3SNgGqvUYihfoMEqDpI5Ozn+ro8LETZaFdNiNIj0h4E4Y3k2Ct1rMuxBsl0LJuVJng0LS1wrXJEmlknC8D8yXElN5/LR3jbmgpkjxKI1sDSnV8YsaBZ1XgExjRNjrFdms+CjV70s+wr0cBDZzGmQagoWZ+UDoIL/yLVb4c4C2kyZVr63AtdLgfePWpjmxVopclkLJJZT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wIdtsPA2LlBkOe0blEO3aGT5LvG3QnI0n0w6IHLp5kg=;
 b=c3AUpxmTpk/3vGMdArMAB4HMtgMkHSCVNa4AYtjsZORJvSZ1ayZfuD5SCYgZNUCVWQDcYIshfbrB+EduDfUf8qOs4i47Xwz9jZ/6e1aThHifd49binIhuSiVHQyUoYh9RhOXX8JoX4V+AXww0E/nccix2w8H9hiNBqXuaSQZ9RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH3PR08MB9493.namprd08.prod.outlook.com (2603:10b6:610:1d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sun, 8 Sep
 2024 22:08:25 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 22:08:25 +0000
Date: Sun, 8 Sep 2024 17:08:21 -0500
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
Subject: Re: [PATCH 13/22] Input: iqs269a - use cleanup facility for fwnodes
Message-ID: <Zt4gVfE5PCNmP4v+@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044806.1047847-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904044806.1047847-1-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN1PR12CA0050.namprd12.prod.outlook.com
 (2603:10b6:802:20::21) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH3PR08MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: f0342c31-0a47-440c-5081-08dcd052c2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L+uudE3YJzSkd272yZKPJsH0Qnew4p0msfWY4xZ+/v1zuNl2WknY1p89UPCe?=
 =?us-ascii?Q?+48fLdF+WvxdIeWlj7VQ85kiLcNWsrsk/Tpx6pEW9yH70sBN1NzOcZPHAzKg?=
 =?us-ascii?Q?c6gT6R8TE4QzNMRao6pEodbFucWMotNM36K9EEqNNMN4+IqlSSX2u9J/8lI2?=
 =?us-ascii?Q?PglMyjHGzVa2Y6Ueh3zwP1TCOHfKFbCjaBZ3wyrwaPUmxk0Ty9RPRzz2bQ6U?=
 =?us-ascii?Q?BuTBYYwIX+FCkIQgW7Nyl3UeZdlQTZKFijnk91J2RrslPvbPShjRvPiqA16A?=
 =?us-ascii?Q?H9gzENOBkhhDJpi14KJp2iRPXr73iTtTHHzzbek1gbKp35vp0UYam0LilRZb?=
 =?us-ascii?Q?dRgTHisumkOBBgA8VjfLx2tZmpmmSlTFrekOrTqSWgvwo9kjylL9ZojMXVq3?=
 =?us-ascii?Q?+4QWNBaDWeD5v6N5qlKJOq5uU/r9VHikaf47AWg3hpSHy+iYFCHFAfXy0+0B?=
 =?us-ascii?Q?DsaHSfvO/IzSvoU+gYofEiPen4Cf/5NNPJhD/p6Z8fZ+i2sW4ZTCWK+6l5gh?=
 =?us-ascii?Q?tCvnQ6CaTo/h4eOZ88w0zBmt0V0ovohCGshK+okNZsGeMSjmDY8/KoLiESBw?=
 =?us-ascii?Q?Mg3+aJZjji+jARD1nqCDeF7+hBqc/XxwyJtfrBeNqCPZ34lKrmYPkj91YUEQ?=
 =?us-ascii?Q?2Psc/k09nWnQGzVTXMArVLb+brdFSVTK7kXgvAMYOpvmzpJbm+fHcGRrYx4n?=
 =?us-ascii?Q?zIh7L1WWMWE62PFzuQQ264CHMGTQ2hfE03kLlk5/1xexGcxULTHQzDtXNuAi?=
 =?us-ascii?Q?lPS/GNF1QF//dQoY5Lfc0DwrkxsYsY4aW4xed9pSxCZZE4/bSiQjXVQS1GZW?=
 =?us-ascii?Q?QLdGMl8JGY/r9n/PpkM7gDmYDGSbDIXupZ2wbsYJi4A9k8M7O2HwZrvLcdDV?=
 =?us-ascii?Q?1lGEBpJWRjOUc4vgjpwTpyqtKbqMG1NqUyBEHD+xU9u5ZM5b0b0SOsyLhoTZ?=
 =?us-ascii?Q?w9VvZdOPUW9Twm/ZBSRBsi1QsxrgmWZ0uRVvKsetcl1l3f86v+gj18Q29G6a?=
 =?us-ascii?Q?L7gdlm/4LXNWL6XzKjBnAec/DjnwJ2C/Tslu+ZsCxeViixVy24EpmXzAig0o?=
 =?us-ascii?Q?WQpdJLo+LXe0AreF/MS5mziHaRgP3Xw9buBxLwHHAYP1xsLvh80tienIiJOj?=
 =?us-ascii?Q?SgXzLVeyrOlc9E/qp+hYcEAr1uXwKALoA1C9MdStOzVuf7IvcjKF1dYmIErj?=
 =?us-ascii?Q?kY1ciSjKl5iEfDhYt4HkPfmNc2OFTXW3bAtg2fr33tPq9Zoplf1RbxysX9Kc?=
 =?us-ascii?Q?y6VDE8IaUBJATZ6fxaNgJVwrc9bADF77DPYVqSEghBNlh/us+jlruf4ly1ZT?=
 =?us-ascii?Q?zGMclVDCMfyznpvERmHqs3ctVma1QPueDm8j8Zh6ee5lHg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xSFeCN3Rvm1FsttH04Rwi+omeCCayKjgZpDGwW8087Tp91npBxwUfn/PRzK1?=
 =?us-ascii?Q?3UWuRNVwb6p94ggnZQny15wDLS5RyD/HW/YayzrANSKsyGr2qIapg7Aikbso?=
 =?us-ascii?Q?HzyPWcJ+9xTf82B+TJTDGAglsYQn6sw6eLvJ9k7cbJikQJDuGZHcJ7EaRCI9?=
 =?us-ascii?Q?v83bLRNiubcZvGjVSu72MsJZTwQ+pE5jQoJCziTqwEBHKTSqA/pYSIV7+YpT?=
 =?us-ascii?Q?coA5gpXHVtWUJiSBn+/hp7zQQBpM1f2npukP5zll3gCyeuYUvShaGRMhIuup?=
 =?us-ascii?Q?g7Qy1vgwoA4U2R7E/gIXrHgff10OcNKnIqQklzkqdW09Jzq0O4m8Sq1F87cd?=
 =?us-ascii?Q?AHZ2six6fWKwTjAHf1+haahPkucNnQod6aeRCVC40A50wvGH+/TpONRycz57?=
 =?us-ascii?Q?M0nFd7lvypUsjZjm0roeHgZYz9JmLreQ85xAPhGt69xiOBcSBmmF3Mdv8yDo?=
 =?us-ascii?Q?5GRiuQ3Ics/inYGmUIko+pTNMGF9SIq4p+v0P9AIBJVlxjTEfT/K53tf3efL?=
 =?us-ascii?Q?Ct4P3l5km61iuX84G3DKISq8keoVNqjS+IoOaw12agysgfS1Xr8ZKHj612Es?=
 =?us-ascii?Q?IPxxCSzVPcCdpERegu4G+wpQfb7CyDSbQyMSQe7Dpcy1vqXsUiDvJ8AQj3Gv?=
 =?us-ascii?Q?wTbdzsXcS79XhchUDccxagDZrW3xDt+k+Glap81PTD2M2s5E+W3gu+aUO2tm?=
 =?us-ascii?Q?7enIm2qGG4vdva51UI22OQLhh356D0Xitoa5dp/zeHseoT8S+3ribpmb1Hie?=
 =?us-ascii?Q?RL5dL0fbSN7vHhNTBaFSd/48sFD99R0KaPC67PR1EUcsfsWmcLZfrp0k12qY?=
 =?us-ascii?Q?+qAT3Y2+7mZiddXZIktLHKOsUQ/qtYu3I9bmAEmSyJu7OzgsMI+0LUYm/XI6?=
 =?us-ascii?Q?L7lILkUwhfbA2oLMCyHxuib5qIO/f89qkWpyjOic1IUQrz08jXbxx/hRDzuG?=
 =?us-ascii?Q?a3U98nQ3eQYEwkh9FDMZLddcSlW8S6GDgGu+/LekMaQNJ2RxzwjIPnszK6WU?=
 =?us-ascii?Q?FBXfsFs2+o0ZE7Q7wrTv5oaI64nX108diu97Bu1i7Og01403yX3piChNduTZ?=
 =?us-ascii?Q?WvCmYUsttBVipiPTffH3MjuQoq4yb2+Vlhs3aS6lf6UK9rEFIKrwZVWMOvr+?=
 =?us-ascii?Q?mrWIWQY5bTH4cvEBEeHfJXr3fp0sLoE8TBGuxYvNd2L7VjIIntcSmKoRHTSx?=
 =?us-ascii?Q?j1xC6URDou4YZ854J/Cez5oCsxg9Vdl32Fvh4uD0a3AN1ovWK5WTJzfzDKC8?=
 =?us-ascii?Q?4bO4Z9Q8twLhxfb2S9HPHh5HYTxLo/uUnEoJ97Fmnj2gw2a/ColvMIoeXmTn?=
 =?us-ascii?Q?8Pybtfovc5lBUc3DZ9Qj8dKilCKRTM970KfzbchZr4MaVnCdV0q+oREss3wY?=
 =?us-ascii?Q?hz3Tu/3S6DFIFWlsW2SxBG+U089xuXbCp+nDgZCcsN2ZHo5oq2W9qnrc+Q6I?=
 =?us-ascii?Q?Qc8jpvSHuOhKg8w/9giVMrdPgAbt5H10RGpMYq6or5H4aAQhHj+MWWIw9JRj?=
 =?us-ascii?Q?GsBpE42pRd5wyby7EgoKPGQOG03GMroRsLju/YnnH5s1iUbHKsmjFhzT7fC5?=
 =?us-ascii?Q?qhdsbRLc7r2rLl4va73OeHG2e+J8Av6hTTfANdWy?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0342c31-0a47-440c-5081-08dcd052c2a5
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 22:08:25.1899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MfpKSpfS+MYH4k0E3DcnIlQfl47siTO4MxK6yEuhgLY1meth0ifX/I2vS2eUKEox5SSwALJbWCb2ZGA+bpvDnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9493

Hi Dmitry,

On Tue, Sep 03, 2024 at 09:48:05PM -0700, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/misc/iqs269a.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index c34d847fa4af..1851848e2cd3 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -550,7 +550,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  			     const struct fwnode_handle *ch_node)
>  {
>  	struct i2c_client *client = iqs269->client;
> -	struct fwnode_handle *ev_node;
>  	struct iqs269_ch_reg *ch_reg;
>  	u16 engine_a, engine_b;
>  	unsigned int reg, val;
> @@ -727,8 +726,9 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs269_events); i++) {
> -		ev_node = fwnode_get_named_child_node(ch_node,
> -						      iqs269_events[i].name);
> +		struct fwnode_handle *ev_node __free(fwnode_handle) =
> +			fwnode_get_named_child_node(ch_node,
> +						    iqs269_events[i].name);
>  		if (!ev_node)
>  			continue;
>  
> @@ -737,7 +737,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u threshold: %u\n",
>  					reg, val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -751,7 +750,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  				dev_err(&client->dev,
>  					"Invalid channel %u hysteresis: %u\n",
>  					reg, val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -767,7 +765,6 @@ static int iqs269_parse_chan(struct iqs269_private *iqs269,
>  		}
>  
>  		error = fwnode_property_read_u32(ev_node, "linux,code", &val);
> -		fwnode_handle_put(ev_node);
>  		if (error == -EINVAL) {
>  			continue;
>  		} else if (error) {
> -- 
> 2.46.0.469.g59c65b2a67-goog
> 

Kind regards,
Jeff LaBundy

