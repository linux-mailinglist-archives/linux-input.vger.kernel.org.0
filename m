Return-Path: <linux-input+bounces-6314-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9387F970AB1
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 02:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A82B91C2132E
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 00:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B87719A;
	Mon,  9 Sep 2024 00:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="YGtverik"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2131.outbound.protection.outlook.com [40.107.94.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BEEC5;
	Mon,  9 Sep 2024 00:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725840181; cv=fail; b=ACUiLUJAd3rXCVNRVGVTZSXZ3ilt1fHgsU+sePZ6xrJhQyHS4fyqu3lM/NyVNkVtpYH4CWNiDVdyRxI5wYqc7kjHHOy3qglrNEl58QEJz+LgjUT6jwmq6jzBWyMPoQalB02PiUKTNl6LnLuo05HZdn2DyrAduBgO+9c3fb4t71Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725840181; c=relaxed/simple;
	bh=BTAB2smLBClBddQKGmYsS31/NQEmqhXlH7zB6iVgcl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gu72CRxaH8bY71mILwliaSTiuR5sIf+1VKsK/QDydNfjswsB8BQ+oUYH0czelTrjL2X7c7BSD0Kh3crwAililTwSvrGffARkEobylQB2JHU3feOhJ00s6E5muYQrf/rp0rz60X+T85mygSjChMGEtwSjuFjXJu2Wam6DHvSGMDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=YGtverik; arc=fail smtp.client-ip=40.107.94.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXfCjQ/4n5TxFp2DvR6Enkb9wRaCaQ6Wo2+ZEPsx2KlQU1u36ujEEYB5JAgFphv2dN4+pFQgh37XdVOesKQ0HIaQ5IKIyWiLVddXaSiTqAwvhh3Wu+Oa5s0tZtEc9KDjFz6Fup6wDSBBFvEoWVqf5XRhOuVMZe3OyfZXexhnpuYSIahkQKOUH78MUKk4kxpbqdjE4PJP12AdAhIxHN6IolHAaczc91OBoI8tXheY4hetdZQRkeV9M1vexhrIZpapiYJOOy9sOYUuMrlYOlQrg78Z0z6H/HSZILplcuFtJVOI2cr15jKQ5WBImcxTxtwijEkpvNQL5C4iGE2ezGLovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PmJfS/nCAqLH5sIUVC0f3K0g7haTuo8VsILAT5Por2U=;
 b=SGt5tkfISdi2iKyYAnz09CcUwS2rivMj5KrjTX4uDpHOX+nvzpeZDcLWWDMnHJwa1rvojAWIvSPAAjpeVbAUdD+0jaVAbyCh/mHXFws+L7D7FgDeFZf0lQFT7r/4HCLlIzJopj0p0Vpr46qikTgoicpf8vrqcN2vnslA/qlX+0ujI+KMvrFBX6Y6u5WMCM+yhVjg2+TYMzaPM0BaT35o7m2zr8gTKWOQbEpxjTjMzo+onI2nHHnbP3rGDx8NIe97r4MqRcZWnTiz0vv0BpmVA0MOciEffNwOaEanE29MIRMwtGbuDvqy4eS8W+cIzC5abKPg0qK/9br/VH64nzWICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmJfS/nCAqLH5sIUVC0f3K0g7haTuo8VsILAT5Por2U=;
 b=YGtverikHTcZbOz9WHdET7WzZv48iESe/om6lQo8XTBRNwxA2p1afGloKKV7s7rcpAuDHLac7/Em0UvzyQcKdSQg4eb38r5ePTLyt8ospyxNDzcuT04i6+yVH/D+fiXe1bqN15cQieu4kbXTREYjdyXsDs6SaJKOPg9qtzPmgkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by PH7PR08MB8505.namprd08.prod.outlook.com (2603:10b6:510:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 9 Sep
 2024 00:02:55 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7918.024; Mon, 9 Sep 2024
 00:02:49 +0000
Date: Sun, 8 Sep 2024 19:02:41 -0500
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
Subject: Re: [PATCH 14/22] Input: iqs626a - use cleanup facility for fwnodes
Message-ID: <Zt47Ic059YbOSbGy@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SA1PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::14) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|PH7PR08MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 138060ca-1950-4b40-92d5-08dcd062bda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o1N8XnE+nYI2kMbdZJbFVhIHSLfuLFus6NusobD0/cYuDEGmxBarwyjoLUut?=
 =?us-ascii?Q?vnwuyatwsZaefSv2SraRJtqwHsZNmjTE2PxSGgVs/j2aOTk8QihLpiQahM0r?=
 =?us-ascii?Q?SbUxnMYRp/POWX43oPWZoRpLrUJiJvALnzuIVX8uor8fdh7mF54Zuil+J/KU?=
 =?us-ascii?Q?Ql5XBF9WcdMeHTmFdC2/cZjQq8528hGGVqCRdqry5l/fVI3dCB6Tv+QS/gGJ?=
 =?us-ascii?Q?wcfeAqXcnkZ1aSHGcZdHYsxCF8UI7gXVhbgtxFQEytiHcrdKQEcOBKKOE8hn?=
 =?us-ascii?Q?LfD7tClfWKIzKyAeKQKZeqQ1lSeaexBw63P3505tBEK1aZAoBKa3yANYp5+f?=
 =?us-ascii?Q?tYRkd/GhS3LRDAgzQ/iWIW4v7WYriE1ExY00TUeGGpSW7Q0T92S8O5jBnQcs?=
 =?us-ascii?Q?kTO7t9W/X6bDs7owJ8CwzSjES8/0FMEfnl+bw8IchZBps4SwEZQSqtIhW2SX?=
 =?us-ascii?Q?an7on2uMSE/vCAFytVw+c3wUEu3N+Dg5M8o8agPKtCJkcFdzlTOgWWxTNQDD?=
 =?us-ascii?Q?tuQ7SzH256bzXUolGys1XD5gnZRhfTACwVdhswqyhbo9iF/QoP2uHJ0E7Sgg?=
 =?us-ascii?Q?1Fli5jWZIofqslwERq2mD6VJXk+BoQsinWZ333WggNxVB0SBzMlrH7N8GrRS?=
 =?us-ascii?Q?LnPz3bx53xl0F00oBcGJp5HyeIy6Bn9+2AjXr8UBNIvC5qdFzKLf7DegfaTP?=
 =?us-ascii?Q?fx5qlCvw/p+Ba+HCzGn1lD2L4vpwzv5YB+yNRAAGsJBhcScMMtmyXHdEy2ki?=
 =?us-ascii?Q?28mA7fU4z/uwiZMI89hpKcnZ9ultp10TUHzmHmegmK44zasmcfNYLVnIWfUK?=
 =?us-ascii?Q?+gzOQP/5Ltyc8YoP/WuogFmKdOsCOGZC0sXRlmQ6lskwjNJJXvbb4ZgQKoAJ?=
 =?us-ascii?Q?2sTdbFMREzjyFcD1OqxlzN4wdOfFjqaYXBtw3ctl6py4ffQelCrSZYqMjrYt?=
 =?us-ascii?Q?hWWVDgf5tsyYCBRbcmQStYgbjlcsHDJ4kEWNi24Bfmz5Sjt8iHeYrwpp+3wC?=
 =?us-ascii?Q?yJi1yNnW48oa6zeNyZeqa4ZJ+dwsmp4x0Jgl2MXvE+CLd7nvJIU4+EzAjTnN?=
 =?us-ascii?Q?zHEe5x3K5h5xT16NpdmnC1vLlMnrr/mK5mQRWnFYD++TZOwvrWv6mlwY4ctr?=
 =?us-ascii?Q?yxoHFpBtdfO+YJu8SCxMEdakaa3gi5hQfP/zg5tzm9mbgzGwDRFAt5DyvKvl?=
 =?us-ascii?Q?isf6xvZx1fPMs0Z4Aahp8gNlCNMjfX/+OTMa1gxdF6uge/Ije0moIYbHnJmx?=
 =?us-ascii?Q?C19Wyv/8isEGWIij4jowLh1eC8KP53Gs052Mmanc6Bod6jlU8x2Cg2O0XBYL?=
 =?us-ascii?Q?2FmX7L3sfTFdsYo1eSoQFPP0RBGXO8V3mxZ3yBWBrmSsJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3AQ/wpYYAQYnVUwoDVe7Xa5AEcS5wN4po1Y5wfr1wsdp6rY7wflJ9pzYPq//?=
 =?us-ascii?Q?sugkm4LHZ34ZXhN1Juw4lmjR+toe2p+hXcwFOda9+jgbbakXdlULoIekU3sD?=
 =?us-ascii?Q?iT94U1bKJHsmLqKszNG9o5TfrYlEt5dfI46BTf6dzXB/QVogdRTVs9lDjBrg?=
 =?us-ascii?Q?suutbqFLnmermKsmc8ZocFy4v/jq8YJzNUidf3CAFXl92u6kdfD+CffRfodg?=
 =?us-ascii?Q?ClyukqdcG7Xy0vuo0LemNBETxTLg4S3b5OM87IFZtBGOkuhwzzsvjVbih1Q4?=
 =?us-ascii?Q?RnDZSC/6SOyvwFxo1KkSunO+kpSOBXgJjyx1uma/aJ43JvBBPT+P2eGBPNJq?=
 =?us-ascii?Q?Uk+hpx2lau56ocDTmhftsFGxSoz+hnHARcswjn8ZFn2PXAtqaGzkOFtqO4M4?=
 =?us-ascii?Q?CJXtwhha69o22BOLbe4NThjK6SkXF5ndrbkCqUIPOBUfXjPR8To5aZudeDC8?=
 =?us-ascii?Q?qPXtqH557IcYMFninyuYGGHvypoKAsFhCsikuwWgUdCFuwvnyAiDGDkT+gRj?=
 =?us-ascii?Q?1H8qEcLA3PEj44NDB/uWyA6AOqYI0KoctAppag0g0rfJV+cZ9o8RYex8ugb3?=
 =?us-ascii?Q?fIopkXe6XOBTOIHYQVLTHrFxqzH3MNLUG+Xp6xurdEsipeSe/nI4IDsjb2TN?=
 =?us-ascii?Q?8n8CH/j32XAhOvsMIyeTYHDsPCP7raykcCDFNNcQtcrd1IqlWTo0fNZLW/CY?=
 =?us-ascii?Q?ONS8zJkmaDO99Hi38U/TzqG9OMdla90MvQ+0eHQRDPY2QfB6JAQOZt8KHKXE?=
 =?us-ascii?Q?beq6wz2rL6MqG+tzgJ1OiyeyhXW0/wyWqNjBnDvkwYk5L3f+JJBRLWHZdGrJ?=
 =?us-ascii?Q?nSJsWK9xtLYz73urcm2qt+q5RpmNslthwJUIsfkfJ5Sh2bFfQW0NMgG4nm8E?=
 =?us-ascii?Q?sK+qkaWUiuga0D9bIN0ZfDCZHIFliC3g7kMxZmcXfX+eAw2tIvgb/huxBnY/?=
 =?us-ascii?Q?yQKxpclR2bRHsLKZim+Kk1fWRAv7FatjIPY0tw5l7Bdx/PUarUAHL2GE0BO7?=
 =?us-ascii?Q?THRyEHTr7lPwG9CNTX5WeQaE7jiyfoz+K60Sm20no5uYgojaY3oB7M8Lxjw4?=
 =?us-ascii?Q?aHm8hMuVBxLdSTdxj5uj1jnhk51H1uLAmS4arjSRBxvOVG5r/F8Ff+ZM1HeE?=
 =?us-ascii?Q?M6rsLFXbXY9xNuo4Oj+Mz2Kr99CwSkR57Q5YKC3pTJ6EP20Yzsr993FlY6lu?=
 =?us-ascii?Q?0m5EDHLpFBL4jzHF7HDyal0sn/MQoqJAwL4GPVq8kVVrx9TK2/Y/fzt2ncxA?=
 =?us-ascii?Q?STZQyHyIbrG4uCoGTknZfdkDTdoDeKy33xaCS6nfTVYLioZ7FndEhnS5do/m?=
 =?us-ascii?Q?o0d7tRwwK57AK3IcyW6QCla51LPups5aMosg30Ltil99rOs92Cj0CUmzE4sj?=
 =?us-ascii?Q?VnsaLD+t/eLDOUA60lM5wKjfiGcmHRVNygNENERs/7Fz00NItaxacR97QXI3?=
 =?us-ascii?Q?NwPou/1MjVssZJyorBXgGY+gKiKlugBVUoJrcuTQPtopoEMEjDzqAouIRyWj?=
 =?us-ascii?Q?4GzNknmZvArw4HS93JTpYWgbTAyPB+d6RzfLFo3Ak1y4I7Dmfs/LpPW6K3YL?=
 =?us-ascii?Q?ksEzvBS9PxzB4m4KFjvQqWN9lOivzdwzqWvOFa//?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138060ca-1950-4b40-92d5-08dcd062bda8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2024 00:02:48.9227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vx0xqqx/vrCwz0x7s2ViyRb+vsiqolOky34giv2Co77wv2gWl5nek2o8KmilWs9Kq5yD79VrzqgRJ5HWRq6Dgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR08MB8505

Hi Dmitry,

On Tue, Sep 03, 2024 at 09:48:13PM -0700, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs626a.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> index 0dab54d3a060..7a6e6927f331 100644
> --- a/drivers/input/misc/iqs626a.c
> +++ b/drivers/input/misc/iqs626a.c
> @@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> -	struct fwnode_handle *ev_node;
>  	const char *ev_name;
>  	u8 *thresh, *hyst;
>  	unsigned int val;
> @@ -501,6 +500,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  		if (!iqs626_channels[ch_id].events[i])
>  			continue;
>  
> +		struct fwnode_handle *ev_node __free(fwnode_handle) = NULL;

This seems to deviate from what I understand to be a more conventional
style of declaring variables at the top of the scope, and separate from
actual code, like below:


	for (i = 0; i < ARRAY_SIZE(iqs626_events); i++) {
		struct fwnode_handle *ev_node __free(fwnode_handle);

		if (!iqs626_channels[ch_id].events[i])
			continue;

I also did not see any reason to explicitly declare the variable as NULL;
let me know in case I have misunderstood.

>  		if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3) {
>  			/*
>  			 * Trackpad touch events are simply described under the
> @@ -530,7 +530,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  					dev_err(&client->dev,
>  						"Invalid input type: %u\n",
>  						val);
> -					fwnode_handle_put(ev_node);
>  					return -EINVAL;
>  				}
>  
> @@ -545,7 +544,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s channel hysteresis: %u\n",
>  					fwnode_get_name(ch_node), val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -566,7 +564,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s channel threshold: %u\n",
>  					fwnode_get_name(ch_node), val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -575,8 +572,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  			else
>  				*(thresh + iqs626_events[i].th_offs) = val;
>  		}
> -
> -		fwnode_handle_put(ev_node);
>  	}
>  
>  	return 0;
> @@ -774,12 +769,12 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
>  		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
>  		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
> -		struct fwnode_handle *tc_node;
>  		char tc_name[10];
>  
>  		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
>  
> -		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
> +		struct fwnode_handle *tc_node __free(fwnode_handle) =
> +				fwnode_get_named_child_node(ch_node, tc_name);

Same here.

>  		if (!tc_node)
>  			continue;
>  
> @@ -790,7 +785,6 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s %s ATI base: %u\n",
>  					fwnode_get_name(ch_node), tc_name, val);
> -				fwnode_handle_put(tc_node);
>  				return -EINVAL;
>  			}
>  
> @@ -803,14 +797,11 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s %s threshold: %u\n",
>  					fwnode_get_name(ch_node), tc_name, val);
> -				fwnode_handle_put(tc_node);
>  				return -EINVAL;
>  			}
>  
>  			*thresh = val;
>  		}
> -
> -		fwnode_handle_put(tc_node);
>  	}
>  
>  	if (!fwnode_property_present(ch_node, "linux,keycodes"))
> @@ -1233,7 +1224,6 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> -	struct fwnode_handle *ch_node;
>  	unsigned int val;
>  	int error, i;
>  	u16 general;
> @@ -1375,13 +1365,13 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
>  	sys_reg->active = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs626_channels); i++) {
> -		ch_node = device_get_named_child_node(&client->dev,
> -						      iqs626_channels[i].name);
> +		struct fwnode_handle *ch_node __free(fwnode_handle) =
> +			device_get_named_child_node(&client->dev,
> +						    iqs626_channels[i].name);
>  		if (!ch_node)
>  			continue;
>  
>  		error = iqs626_parse_channel(iqs626, ch_node, i);
> -		fwnode_handle_put(ch_node);
>  		if (error)
>  			return error;
>  
> -- 
> 2.46.0.469.g59c65b2a67-goog
> 

Kind regards,
Jeff LaBundy

