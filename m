Return-Path: <linux-input+bounces-11374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23947A760AC
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 09:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37AF118867F1
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BEF1C1F22;
	Mon, 31 Mar 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Yex423K+"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011030.outbound.protection.outlook.com [52.103.67.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD321E492;
	Mon, 31 Mar 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743407810; cv=fail; b=h66G2iiMgw/vwfkcEoqrsn6g7Pxn9KLfLh2RujECYHbLah15ChIBUqYEB0BuapYQJHqr7pfNpTfQBcsouR+57BhxZroH5kZGMfP4SgpASumJpubrZVNIok+q1UnA4HJS6KbyYFSA2MTuVH+09SALBsiThjoldDyDiqzYtAmzrms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743407810; c=relaxed/simple;
	bh=746apK782TEIPrr2yhn4YbH40o3PfXBPGpE2HV3s3G0=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cs63l0RDjzgjnZbd143G4+YOMLdzY3JEVew5XIPYoe0m8sH1q1gPDtJ8s8bLg252aO9mcM72eCyzRD7dWAe3Es9Y5STP+EPyOGyxxGMcevPTS0YVcuQfx9vZHod9pEaTbWg4QzMRU8f9o6G5pQC/lPwpDywpVhXRtBA9AEE1IjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Yex423K+; arc=fail smtp.client-ip=52.103.67.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd7PXrbV9nM7RUC2akILrIDZ8tIa0Y6RZflTIpx5TW8fp3i0kLSTyA9wFhnn1GlmyQaaFI/PbO23ISrqhrYAkIbD44OllLJ7B+4DQVXKw8mEqR2mucEd2i9N9tqblZdIgyEQktJAVm/qmZzmTp/qi8yDNUa924JI3PWDyHwe/zfGxXu19k8dD0Eam5nzeNBkKTKiSOp3zylX305KL0rTB2FI+li9faefK7cg5eWhXPFAzky3nlz+EKexieVoHAtdAdeeoYGNUjN6nHvMFME8BbDueXsHt2u0QGxCKu6g0eQGanmF+RxBVZSILdE8PycJIQeeeykhtBlxzSpWDR5JxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kbmo5WXv9b8sBYXXsPFZ0D0JXS2qwh+j7efRfXSzqs=;
 b=gt7HBVppV0FBll4t7Xw25vLXgh4huwMziE4KMY6Vunc65Ov26lBE7JAcFjGJDIh2S/apkI2VJ6R+KwKLqdqv2mcedY411IAQrc253gqTE6hjhaGc1tmAcpXitXaAw/0+QK2mEYhd9l7UWrbMDIZShKF/yH6X1XtV/JKrg7AgEMCjNjdU9zBr8nNwNQTYApZz7jc3/bdCBTAxwvsP71YG06unJV/4vkTktK92eHHhqucc/hEt8aWo8760WBKIPi6TXWR1iqpJlTDeDRbrbRryDCn47g9uVViQHrU2+81nSjJMqEd40+1YeiSulmMdUlTdTipPggnH8/MGj3Qssjf4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kbmo5WXv9b8sBYXXsPFZ0D0JXS2qwh+j7efRfXSzqs=;
 b=Yex423K+L7ff86iZJkXacteyXloTLOCYgDvulqzuIHteRiU1lNe7gmw8WBmBd9Iyr4MUEU6BO+FaHEBXU+t+SGGfTjwpRGpKEe+KoUjWp+A1yuww7TUg16sMi0GCFEixmv69q4kkcI7Pq/d2rmFgdX24eyKSSd1hjDzVhn9bT0HGdpD+MoKFSQmVmBmWy4vwGBGgQ+L12e+HitdHG3pXeRo/mVLYuw/K16qmY9e8ZJl+39EWD7NX5GxVLngOpiioLIU9afMgdnj2sfkwwtDL/+Fh8r6A98KWnBbPFeEyQhg51MmebSlsznlLoT0FWxakcg4Q8Ov/lyI47WDEaJkqjw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8860.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:ce::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.38; Mon, 31 Mar
 2025 07:56:44 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8583.033; Mon, 31 Mar 2025
 07:56:43 +0000
Message-ID:
 <PN3PR01MB9597C4CE02EC5DE00DAAD43EB8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 31 Mar 2025 13:26:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: magicmouse: Apple Magic Mouse 2 USB-C support
From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org, jkosina@suse.com, bentiss@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <PN3PR01MB9597EF3E56A1EE2191490E92B8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PN3PR01MB9597EF3E56A1EE2191490E92B8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0148.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::18) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <a29eee9c-64fe-47d7-8a11-71aa9fb0433e@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: ce71b1ad-357f-468a-2cb9-08dd7029941b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|8060799006|7092599003|6090799003|19110799003|5072599009|461199028|10035399004|440099028|4302099013|3412199025|41001999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cldCTnN3MUo4aDBZbm5oQlYrdWprUmJLMDdWaVNmYXFObGViSFZtL0N1V1pn?=
 =?utf-8?B?aDJ0RlJnL1JPSkRsVlczSGRnOHVZd0NDbWdHSENITXFzQ3YxVk1oeGhrOUJB?=
 =?utf-8?B?UUhkUTdIWmIvUHJ2N1dKYjBYMVVZV1o2MUQxUnJXTHJnMERuT1ZoWnh4ZHRz?=
 =?utf-8?B?WSswRHZKQkJWWTY3dk50eHhCNXNVdGRMK3lPOEhrRTV0ZDJTRFc4YnRhZktV?=
 =?utf-8?B?WDdVTEd6NiszVjZpVWkyTGtUQW8xY0NaQm4xZjJ5TVh0SkpMQUdqNzhTdjdS?=
 =?utf-8?B?VGg3c3VkYVF6Z1pLSjdIUkV1dXR0T3NLZklNaGcxbHFzem5MNGtnNldsa0RL?=
 =?utf-8?B?ajh0WUtneVhZK3N3aGNVU3ROcytCbzlCaWxjcElnVlNmNTBrV0xGZ0JaNE8v?=
 =?utf-8?B?Zk9ZT0RlU2pGdGRZRmhYRk5zRjkxSjZsc1IzZDJiUXljSy9ZTWVIZE5TZExa?=
 =?utf-8?B?SU5ERUhJSTZMUStZRkF6YW5ZTXZhVlNRZSsxVFdWRFNSd053QVg0UXFiT1lC?=
 =?utf-8?B?V3A1bUcreEFaN3pnTkp2ZWx4UWxwVkEyYnBWYTV2RTJ3VzBRUFNET1ZIOS9u?=
 =?utf-8?B?Y3N6MTZkWXF1V1pxQWtFeTlWd2dtbUdrb1dSc2s4WUxpaE1uNXJOakF5ajhr?=
 =?utf-8?B?SlVnTVZsSlJ3aENUNTBRSWNQTUF1UXdaRmhKRWw1Y1ppSjlQTHlRMDRzL2Fq?=
 =?utf-8?B?T3psMlZvRjk3TklQTGZjUE9xWktuajZvT3dwZHFNYk03YStTL05TcDV3b3oz?=
 =?utf-8?B?MGNuY3BZb3RGSzc4WWx5cUhKcXhVWjNWK0pVMFZ3bmpsRE1vdko0UEgvL21I?=
 =?utf-8?B?VGltVXpJMTN4d1lCbXpNeE5sK0N5ME5oRXltYXA3QkhVVkxOYzM0dS9tZVRj?=
 =?utf-8?B?NmhkbURjY3pYYUlsNmhNRmpUSFpwaGQxQXJjVjRaNXpTTmRIclpYSGpMdHM0?=
 =?utf-8?B?MG4rcTV4WVBxZHZLeUdNNWN3ZmdLamdtUnNRTHVrQ202amJJdnJmaHhMbTBn?=
 =?utf-8?B?SW8rRWt2TlNvZ1BWMTdFK08vV0NzdWNVWGhpMWRJQ200N0k0YzJDbW1INTBS?=
 =?utf-8?B?RjdwNUczSHZmbzJRK1dmNFRwYzlnKytHUGhNNWx6MVJodUxMajlUMS8vUVQ2?=
 =?utf-8?B?VzNFaVJ1c3JCb3NURk1ZbEdOSnBCNlJJOXo4b1doRmJGajEveFNyS010Z1hj?=
 =?utf-8?B?R0ZKWGF5NXNhNDJTQ09IRTJqaERWS21KRkJxeWVjOFdOWUcxV0RHd2w3aFRU?=
 =?utf-8?B?aTBvU1FZTTNLQmhKZXVqcjVSNFd5aDN5SG40Wmk5VWFKdHZHWVJGRW9nUGxY?=
 =?utf-8?B?ODJqSm1XeVExeVErS2dVcEpObjV4Rm5xdkJwVXZDU0JLZHBBTjJlRGFnQzZ1?=
 =?utf-8?B?ZXlRcVREelUrdVhVVzFKeWltU1JZeFJSMWZ5TWlrZktyUXZBdWM3cStvcGtD?=
 =?utf-8?B?YTNQU0xyL05wMTdObFlWNGFqM0RpaVhnd090bTlMcHc4cjdsWmFyNVh5V1lz?=
 =?utf-8?B?ZGN4RHZmei91M041SEZKVEV2ajVXWTd1SXZMZ3FpQWN2Z0gwalNOWDRMTzMv?=
 =?utf-8?B?NUovUHlpQm1LMlg3R2lLc3RoK0JOc0Iwck9sWUdsMkhKVjJpZkJRODhlcGJo?=
 =?utf-8?B?N01iT2xWUXRWcGZQYW93b2VJTG9wZFMzcXJRQ1FUUlUzZXhUSkVrYXJ6V1d6?=
 =?utf-8?B?TnUvZXVzSlY2clRmM3dham5VbDBORUNjZDJHRWtqMEdnOGVxZmZQSk1BPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkFyeTVzK01nWUhzRXl6ekRPTjJNYWhBTk9obFlxWUl1cVlaMjA1cDFCUHNq?=
 =?utf-8?B?eHkvSzFSWWlDeXZZaStDbFM0ZG13Um5BQy9yK0NuSmF1ajNTYlpQSUdMOUxi?=
 =?utf-8?B?SzhWcDBUQjFZVmk3b05pd1FMUTh1eWtUVWhGWDRQKy9Gc0tpcUVGbU52Ukoy?=
 =?utf-8?B?eXE4ckllS3JvZWZpbWEzaHpIU1U2OUFDVG9hS3ZnRXdKbVhWZjQvTVRUL1Ey?=
 =?utf-8?B?ZExpbkV0bTZzU1lVNkJ6amhITzJ4VTg5VWJ5ci83NnMrL1FTR3AxUUNLTmEr?=
 =?utf-8?B?dWxNMlNuYm1xa2hsMHdBQVlKemM4MldMOHNyaytnbEJjS2xpVzdNM1RncnRY?=
 =?utf-8?B?aFp3Y01XaUh2aUREZWI0QXV1R25XbFpZWmhyN1RxQ1kzZGVUT1RsTkpLNTkz?=
 =?utf-8?B?NnN5a0Q5NHkyb0dpbUdnM0JHazBOTEpuN3k3Y20rUW9uMDJacjBFbTc4K0lS?=
 =?utf-8?B?NmFncWJwMHp4dWxpZ1lxb3kwMFQxVHNaWTQ4NHJkdEE2bXYreWxYZ2tGNVJS?=
 =?utf-8?B?MStLeHYzYm5pdzZwU3pyM3NBS2xvRGo4TzdDODlYYW95Mmx2N0VoTDFVSXdO?=
 =?utf-8?B?SGswOVpxV2hPODh4S1JTSk9WWVFMYytyalNLL0xnZmlNcjgxUm4ybEUwY0hx?=
 =?utf-8?B?YUV3c211WnVTWm5ZOXJHUStISGZvbExRZnZ1dUtaWGFxYm56Vlk3L3VXenBl?=
 =?utf-8?B?L08zd3J6MGlvNE4rZDVHTk4zUXRSMXE4Z0FyRUVLeUdJUDFPYXRmMTEwQ1Fk?=
 =?utf-8?B?emYzUkJIZjZYdEVmZWhITmJSdDVOdnBxTjJlWlhTcmI3WjRGWDFNZGtYNjBC?=
 =?utf-8?B?azgxUjRGRERBNE43TFZ0cjhMWnpmMjBoZUEzbnNOT21ZSUI3eVE5RDBxV3VI?=
 =?utf-8?B?SDBkczkwV3puNkk1Y01uMFFlNThwckpPQzAyY2h2SmxRZ09vMlBEWVlJaW1N?=
 =?utf-8?B?MHdiakFyZ1ZIODFwQW4xdzdUb2tEdkJEUFJESWlvVDl5dnp3TGN4ekFURW9I?=
 =?utf-8?B?NzREMmhyUThvenRxbXZ3NThQdTJoYkVKWFVzclpsR0RqWGJmZ1BKZ25BNnow?=
 =?utf-8?B?OUlIOWVnZWhla0I2RHQ5cnlVYUl0anR0R01FTm41RjYxUG0yYmR1QTF0R2hk?=
 =?utf-8?B?US9IMFpsMjdVUkFqMkR3b0MxTzhHSDhqWlJUaVVmY2Evb1JrK29TKzdPQkF3?=
 =?utf-8?B?eUdpOGhjWlNwQWJDMGYzZU5YK2pZdm5ZYTVQZy9JeXAwMnN1L3B0cFFvbmd3?=
 =?utf-8?B?bDFaQWF4QytRK2g1S21vU2UvNVFiZXdYc1BzL0h0UmtFSUpHY2JEeWNPSERi?=
 =?utf-8?B?R3dsNTN0UHFQNzV2S1FzWGltRkFmUmtIbFJ3ZlQ0VHA2NlBpcVcwQ1FnOVQr?=
 =?utf-8?B?WVdpSExXOVJ4YmttbE1RcFhaWU5CZFFaWTdFaWVUcldoUlg2dlFhK1RDRUtD?=
 =?utf-8?B?bWswV2tWRW5GSzhHMTNTSWJYS0tIb2xJSmVjV0NmWGNISHFEV0g1WDRaMHV6?=
 =?utf-8?B?d0YyWGFEL2JHZWJMWHpHc0d1cFFaK2M0RzNuMDhIdUNNSHRBVUhOWVVpWDlS?=
 =?utf-8?B?ckxmOFVqaFhlb25SK1BhcjhWOEdqNWttN2xQZHVoNmJra1J1Q3FKbjJiMFdR?=
 =?utf-8?B?b2NXc0VnNkFuTm13aThGNTM5UnlncXk2NElYT1ZJV3dTakNsUkdrSi9GNE54?=
 =?utf-8?B?UkFPNzdGWXo3YTREY0tjZm1WTUExZi9ZV0pMVUlUb3VhMytXbnRDai9vcm5Z?=
 =?utf-8?Q?wJVLzQb9FuXGm3TN2VFJjt7ZnJnMcizdBpAxos3?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: ce71b1ad-357f-468a-2cb9-08dd7029941b
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 07:56:43.9369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8860



On 31-03-2025 01:06 pm, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> This patch adds support for USB-C model of Apple Magic Mouse 2.
> 
> Except for the hardware ID, it should resemble the existing configuration
> for the older Magic Mouse 2.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/hid-ids.h        |  1 +
>  drivers/hid/hid-magicmouse.c | 74 ++++++++++++++++++++++++------------
>  2 files changed, 51 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 288a2b864..2d3f96af6 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -92,6 +92,7 @@
>  #define USB_DEVICE_ID_APPLE_MIGHTYMOUSE	0x0304
>  #define USB_DEVICE_ID_APPLE_MAGICMOUSE	0x030d
>  #define USB_DEVICE_ID_APPLE_MAGICMOUSE2	0x0269
> +#define USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC	0x0323
>  #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD	0x030e
>  #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2	0x0265
>  #define USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC	0x0324
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index a76f17158..423d50702 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -218,7 +218,8 @@ static void magicmouse_emit_touch(struct
> magicmouse_sc *msc, int raw_id, u8 *tda
>  	int pressure = 0;
> 
>  	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
> -	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
>  		id = (tdata[6] << 2 | tdata[5] >> 6) & 0xf;
>  		x = (tdata[1] << 28 | tdata[0] << 20) >> 20;
>  		y = -((tdata[2] << 24 | tdata[1] << 16) >> 20);
> @@ -370,7 +371,8 @@ static void magicmouse_emit_touch(struct
> magicmouse_sc *msc, int raw_id, u8 *tda
> 
>  		if (report_undeciphered) {
>  			if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
> -			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
> +			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +			    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC)
>  				input_event(input, EV_MSC, MSC_RAW, tdata[7]);
>  			else if (input->id.product !=
>  					 USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
> @@ -497,7 +499,8 @@ static int magicmouse_raw_event(struct hid_device *hdev,
>  	}
> 
>  	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
> -	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
>  		magicmouse_emit_buttons(msc, clicks & 3);
>  		input_report_rel(input, REL_X, x);
>  		input_report_rel(input, REL_Y, y);
> @@ -519,7 +522,8 @@ static int magicmouse_event(struct hid_device *hdev,
> struct hid_field *field,
>  		struct hid_usage *usage, __s32 value)
>  {
>  	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
> -	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
> +	if ((msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	     msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) &&
>  	    field->report->id == MOUSE2_REPORT_ID) {
>  		/*
>  		 * magic_mouse_raw_event has done all the work. Skip hidinput.
> @@ -540,7 +544,8 @@ static int magicmouse_setup_input(struct input_dev
> *input, struct hid_device *hd
>  	__set_bit(EV_KEY, input->evbit);
> 
>  	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
> -	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
>  		__set_bit(BTN_LEFT, input->keybit);
>  		__set_bit(BTN_RIGHT, input->keybit);
>  		if (emulate_3button)
> @@ -625,7 +630,8 @@ static int magicmouse_setup_input(struct input_dev
> *input, struct hid_device *hd
>  	 * inverse of the reported Y.
>  	 */
>  	if (input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE ||
> -	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	    input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC) {
>  		input_set_abs_params(input, ABS_MT_ORIENTATION, -31, 32, 1, 0);
>  		input_set_abs_params(input, ABS_MT_POSITION_X,
>  				     MOUSE_MIN_X, MOUSE_MAX_X, 4, 0);
> @@ -741,19 +747,25 @@ static int magicmouse_enable_multitouch(struct
> hid_device *hdev)
>  	int ret;
>  	int feature_size;
> 
> -	if (hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> -	    hdev->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
> -		if (hdev->vendor == BT_VENDOR_ID_APPLE) {
> +	switch (hdev->product) {
> +	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2:
> +	case USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC:
> +		switch (hdev->vendor) {
> +		case BT_VENDOR_ID_APPLE:
>  			feature_size = sizeof(feature_mt_trackpad2_bt);
>  			feature = feature_mt_trackpad2_bt;
> -		} else { /* USB_VENDOR_ID_APPLE */
> +			break;
> +		default: /* USB_VENDOR_ID_APPLE */
>  			feature_size = sizeof(feature_mt_trackpad2_usb);
>  			feature = feature_mt_trackpad2_usb;
>  		}
> -	} else if (hdev->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
> +		break;
> +	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
> +	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
>  		feature_size = sizeof(feature_mt_mouse2);
>  		feature = feature_mt_mouse2;
> -	} else {
> +		break;
> +	default:
>  		feature_size = sizeof(feature_mt);
>  		feature = feature_mt;
>  	}
> @@ -787,6 +799,7 @@ static int magicmouse_fetch_battery(struct
> hid_device *hdev)
> 
>  	if (!hdev->battery || hdev->vendor != USB_VENDOR_ID_APPLE ||
>  	    (hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
> +	     hdev->product != USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC &&
>  	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 &&
>  	     hdev->product != USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC))
>  		return -1;
> @@ -857,6 +870,7 @@ static int magicmouse_probe(struct hid_device *hdev,
> 
>  	if (id->vendor == USB_VENDOR_ID_APPLE &&
>  	    (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 ||
> +	     id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC ||
>  	     ((id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
>  	       id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) &&
>  	      hdev->type != HID_TYPE_USBMOUSE)))
> @@ -868,21 +882,27 @@ static int magicmouse_probe(struct hid_device *hdev,
>  		goto err_stop_hw;
>  	}
> 
> -	if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE)
> -		report = hid_register_report(hdev, HID_INPUT_REPORT,
> -			MOUSE_REPORT_ID, 0);
> -	else if (id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
> -		report = hid_register_report(hdev, HID_INPUT_REPORT,
> -			MOUSE2_REPORT_ID, 0);
> -	else if (id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2 ||
> -		 id->product == USB_DEVICE_ID_APPLE_MAGICTRACKPAD2_USBC) {
> -		if (id->vendor == BT_VENDOR_ID_APPLE)
> +	switch (id->product) {
> +	case USB_DEVICE_ID_APPLE_MAGICMOUSE:
> +		report = hid_register_report(hdev, HID_INPUT_REPORT, MOUSE_REPORT_ID, 0);
> +		break;
> +	case USB_DEVICE_ID_APPLE_MAGICMOUSE2:
> +	case USB_DEVICE_ID_APPLE_MAGICMOUSE2_USBC:
> +		report = hid_register_report(hdev, HID_INPUT_REPORT,
> MOUSE2_REPORT_ID, 0);

The patch is broken here. Fix sent here: https://lore.kernel.org/linux-input/PN3PR01MB95973E14FB234C6BCB6417A7B8AD2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM/T/#u

