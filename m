Return-Path: <linux-input+bounces-11027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56354A6ABB0
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 18:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EBA0178B71
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 17:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBE222155C;
	Thu, 20 Mar 2025 17:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="e+2wLauo"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013084.outbound.protection.outlook.com [52.103.46.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD5521CA00
	for <linux-input@vger.kernel.org>; Thu, 20 Mar 2025 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.46.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742490627; cv=fail; b=XJKTsHafACe4lhhWjcuqjO8wGifU/qP3FT2o547c/UFysWGzxsn5o84SfecvyqnYHWw1fV0ZGqbIau5lshCaXjtlFcXvWcU1Bsp6MxZGhn5gnEgCUHbGUxUbwLSuBR2vXtk44q4Ra+YM/2d6S0y0FznxCOYkQb+WBeZYdbbA8Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742490627; c=relaxed/simple;
	bh=6Hh+MjcD8d7vzaetIRMJyL3fafjBSKdEOteztrm5s6Y=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=ZYWqdONQ8NAyvkFli2WuYqDgb8pPltMQzviwTU9kvZCTWRyvmlLv/nXqwn0OeTd8UEmvWLHI6U3RGbMivSLYwa02/ExFnbcFtKFKlS1LNFfNBu0qarssAjbkOiF+oGETEw0E3wl4hSlLKnJ3G6pploX8qurrFRXyLhkb8mkEMOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=e+2wLauo; arc=fail smtp.client-ip=52.103.46.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9u3X2BxHQrvxXNvSGg63vdsZHKLIqRm2g9NCzlYB+I68HmDvz+TddZSpN2c8p507hO4dqyFn8HbKG6Sb7b/9vHELfzoRAiw59XYjD5tth3r85pEvbfRG7D93Axwo5hes1KOuoGIgUhRfc1Z/aoVsI/ncG7LZcdNYHW7hZEt2ETnIULmDw870OvudmvpRD8kzhydh6Rjvi1haqHlYKdJAw+44CMUUQ6bBlcVsvY7Tq3rSMjMLN96KXi4VBtExqIG132+nBzsEIabakpdjbnrSgAwvPQr9tUGXiPfGlknK7Pvix1BltM0ZGSgTMhPN6Mux0bYbqa7HCVlsXiA16kJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKqIDTvzt/ZYISykij/7QS8c4+RW/Yw80lx6ZmzzbU4=;
 b=ufyfvNtsdNCgyvv8uMJv1/u8JQ4ijodMI5an8vsKVSFF846fmIQEJB0R3mYr8woF8dZk2zwIoKkG0XJvfIp58xj8+mRliaSLH0qzds8G+BxPu01T29cCDB3ZZeicEpD8srCnm6yNXHA5XltrH2Ldzv6fLyz0XC+99vG5s1WRzkfY7FlrJ90vcr5rXi00rnLXUHqoPlauAOVZm41I0W4uLz2mQhczqHUs5fFrFH1XgGOlOuOp5mAUzg2knoyQW5EF16CcDTPn/Nsnwtuz+flobJd1GpPZvBJdUCgKTq0IcG3/ir50vs8kGTIph8i4KEVVFgbsBej083Z/clSrtewqsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yKqIDTvzt/ZYISykij/7QS8c4+RW/Yw80lx6ZmzzbU4=;
 b=e+2wLauoDAlfQ/W5GrXkslvQlrelZuGXJzf/WkWOi/hv1i4K/UzCz5AY+yiKkyP0BpjtoBkCbSdjRDw3jMjV6uuEYv3bV33yTGDy519XFD4UNqxvdjtl2HaZpfei4JXnJa3wgzwJcSCbrA+U8sT9CvL+/pdOGMKcRBGRww0K5YyH/s+K5Ces/6f4FVKyi1BO8LIY0j5BiL5yrRi2Ae7SBsfveC0E/mDPWmmxcrLyUb446a0wvYByyjdiTH+U+gPX8nV9ep6aVaIuBr+vYZ+4jaIExwPuYKzc3VD9mQGlB6Q/mWJEBJpIWU0ZPS3P/c0JoUEDbtUWczfLSF5/Y/XD6g==
Received: from AM9PR03MB7712.eurprd03.prod.outlook.com (2603:10a6:20b:3dd::22)
 by DBBPR03MB6748.eurprd03.prod.outlook.com (2603:10a6:10:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 17:10:19 +0000
Received: from AM9PR03MB7712.eurprd03.prod.outlook.com
 ([fe80::6d9e:5b89:dc2d:f84e]) by AM9PR03MB7712.eurprd03.prod.outlook.com
 ([fe80::6d9e:5b89:dc2d:f84e%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 17:10:19 +0000
Content-Type: multipart/mixed; boundary="------------Qd8JM0YebGnsBi3ni2TI3o0H"
Message-ID:
 <AM9PR03MB7712692A4A417F8E43AE0645EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
Date: Thu, 20 Mar 2025 17:10:17 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB771256AE6BFD89860F547D69EDD82@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <4d07fb2b-eef8-434a-8308-9b1cb95ea482@redhat.com>
Content-Language: en-GB
From: Henry Isaac <henry_isaac@live.com>
In-Reply-To: <4d07fb2b-eef8-434a-8308-9b1cb95ea482@redhat.com>
X-ClientProxiedBy: LO4P265CA0111.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::11) To AM9PR03MB7712.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dd::22)
X-Microsoft-Original-Message-ID:
 <f767a340-2239-4c71-8962-b3c0951c941e@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7712:EE_|DBBPR03MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 911cb410-5e63-4a3e-12d2-08dd67d21707
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|6092099012|12121999004|19110799003|8060799006|5072599009|15080799006|7092599003|440099028|20055399003|4302099013|3412199025|41001999003|30101999003|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVZwQzhRTGRYRUJmZlVFVkVnalVLN0FlNXRQSVhVMmdsczlLSUFxeHhWUGNa?=
 =?utf-8?B?L0ZZaWNNdEhFRHI2Y1FzZlFZMTR2S0RQQkdudS9WUzhvSWYxQ25rOUU5SVhp?=
 =?utf-8?B?SEhrQUVYUzQ5RVFDakpONmM4cGRFeWppWStRYys3K09YTzNPa3pvY0wzTjk1?=
 =?utf-8?B?ZUlhYndSdFFONjgzZ2xDZktBRUNodnpTQ3lqVXA1dkZYb0QrQVFXUmVqU3Fa?=
 =?utf-8?B?SENRNlhudGI4MXorbDRqQ2dVeno1TjNXa1RkWWZtcEwyRUJZc1VFY3JJUEtq?=
 =?utf-8?B?Qi9QTmxrSnc2dW5GN09oNVN2cklUOTIyK0N5T3c2Vm13QXJ5cGFLVWk0WGtY?=
 =?utf-8?B?SGkyeTR6MDZyVmhvaHRrcEl6ZnorbnUvZUFZaUQ4ZUhONmxDczVERFlpRjZt?=
 =?utf-8?B?VkV5VEpvSzZjQ05BdkptajJWRHJIdHg2ZGZMOXRFUE9JVkdUdEJucml4MC9Y?=
 =?utf-8?B?cEs5UlhlNGdoMHpqVElINFhTb1lOWU8yRWpWYnRuMVNMMjJxTEhySDNBS0Qr?=
 =?utf-8?B?d1hxc3JGWi9lR1RlUjR0WnJneXh5UnVlbm9XNzQxYk5OZnB4NjhyWUU2SDBY?=
 =?utf-8?B?aTRBaGhvMzdVN3R2VFBpQWF3ZStoOEt4b1NFZ2Z1SWxiNHBKUVkwZDNMTGVK?=
 =?utf-8?B?M2RJNklPakFERUhjMmVoSjloY0M4aU1MSVNYcHBvMTFnM0NFY1ZPOXM5U2pX?=
 =?utf-8?B?NVlWc0JCbDVDVTN4eXhLTUcwTWdqQm1ZeVdYUll4cC9nMnhBcmRGQjc5MnY3?=
 =?utf-8?B?N2NrUUFWaXVIdUdWY1h2YzBNaHUvaCtKZFZkU3FQaTBXSVRMVkh4ZWtSMEkz?=
 =?utf-8?B?ZTZINjNSUTl6RHRTVStpZlUvQXBscFRRaWlZa0VOUTFQTTMwZ3Z2cDlOVEx5?=
 =?utf-8?B?VGpqY2NIU1FaWkxMS1dZSnhzaHhpNUwzb1c1NTJvNDAwWFJac0lyS3AwZi9Q?=
 =?utf-8?B?TlR5alBBa1ZEaHM2LzFSdHk3Zk1KbnJKakhDcGF2SVJsMGViUHdOZmNvODFw?=
 =?utf-8?B?QnY1aVhKZDVYaFJ4dXFhZHZUVk5wcFJXNlc4NlBTWWpXdVZaN2lLVGl4Y1p5?=
 =?utf-8?B?Z243b21WbkNkRTlSWW1STjhJUVRaYnJ3STlJTTJlOE1pU1BocmpIY1FGK3Y4?=
 =?utf-8?B?OTJ0NkJxZStzdVpoblliT09DclQ1RnJVdk5CVklmckRBUlUzaEg0dVEvdEZ5?=
 =?utf-8?B?ViszejRnRGlOaHBXVzYzellkR3ZHSUdEMmFrY2VhUWFaMEhkZVZ3SFRIdXQw?=
 =?utf-8?B?OWFmZG1RSHlIcSs0akc3QUlvM3hHQ00vMVR5UVpxY0I5VGhqZEo0aE84VGlx?=
 =?utf-8?B?WC9IbVAxRmpnOTZ0STY0SGlFVG5pMFV3MzlXaFhoNSs3bndsTUxBMXhXTlo1?=
 =?utf-8?B?bm1VU2R2a3lLWVRPV0VWdkRBVjVEK1hVQjB3Y1pMSmtvd3crWXFPMjM5aEJS?=
 =?utf-8?B?bmZSczJoWC9mWjhteEc1TjQ1OUVYV21PcFc4RnYwOHhmWDdneXRPc3FpbTJJ?=
 =?utf-8?B?VWZJMnloK2dPK2VYY0ZJS0dseGN4MnpTaUt4TTExV3I3NWQwT2t0SjA3S00v?=
 =?utf-8?B?RytRZjFGU2Q1QlV3akR4Vjhmbmh4TkFMRmszUko3V0JMTjc2dnYwMjZKcnlB?=
 =?utf-8?B?Tno3ZkxhZStDY01FOTdIR0RzQ3c1UlZ5SlhKcVZMZW9FbzY3NFdQYUZuR0lB?=
 =?utf-8?B?WUZyUGRXZzViKzFyUWJ0cGNQQ3RqZE9BZ0hWTVhuY0lQRWdzNTFPUzA3ZC84?=
 =?utf-8?B?RE1YUnYzL1FNQ3VIVmh1Unc3YjVRWGlmVzA4UXdTMW9LeVo4OTdCNE14TXVE?=
 =?utf-8?Q?Wh4RBliQ00hkz5zGBbTiUo7fMTifbG3hbRk/0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVhqUFdFaEI4dll5Ni91UUgwVXEyNWZCSGRZQWZiam5kdmhBamJMUCtkb201?=
 =?utf-8?B?UitWQkh6SHQ4K2xIN3ByeWcyUkI5b090ZEk5V2wwMG1KNlNrTWJMTzRmM2R2?=
 =?utf-8?B?RVg3N0VrY3BLcnBrZkRadmtWTVNpaDgrWVJXT2J3TXVDMGFoTzEwRUdHdmlL?=
 =?utf-8?B?L3BFQ1RRSDBNVHF3Tk8zazI1eWY5a1hsaFAva0IrQ0t4SUc3ZzBoR0RTYWFo?=
 =?utf-8?B?dGt2NjU4V0QrUCtNaEl4Y0hrY2pkZW1hM0tvQmtMNGVCYWJselgycUlza0Zz?=
 =?utf-8?B?R1Y0NG43VkNTRFIyMkZUakhDalkxSURHZmZ0R1BPUk1IeHBXb28rU2k1Vk1B?=
 =?utf-8?B?Vnp4VVVPZWRDanhxanRyYkl4WXJzcHpXdU9mWVZZTkFXdUJQZzVpajk2NGVt?=
 =?utf-8?B?bnBqTWNwTnVaWEsramd3OVNDUG5TTTk4eGE1RmlxM3haNytmVWhhQThZUjIy?=
 =?utf-8?B?dk9uK0pHc0VNdFdBaU51cWhUNEY1eE9FYkltOTgzNThsdFFVNVFvS2hEYUhY?=
 =?utf-8?B?cGJkUnBlMUZPejdYeVFVMWZVR0c1TFUycHd0VDZ5bkdFemplSDlQTFFWZEJE?=
 =?utf-8?B?TGQ3NFFPY0xETVZZTTJia0VHZzhEOEhKSTQ3c3Njb0c5ZlpCNFpHb3g2b3BR?=
 =?utf-8?B?a2ZwbUdObk4yRk4yd3h5OGVyRlVYTHVKZ2xvVEV2cG9wTUdCQ3ZPUEo3S1BO?=
 =?utf-8?B?YVVUZVVaeHhVM1I3REk4L1hnY3BOcWpyWXJ4ZDZhRzVnYUU3NUxoSjU0Tkl2?=
 =?utf-8?B?T3A0cHhqSk5SRmtsQU9DWkZoMFVDMFNkZGpxQy9qTVRoM1luazJ0ZEhkUTRu?=
 =?utf-8?B?MWp0aWYycXV4UGJJZS9lNjNScjgvZ3lOUFZmVXY1b0xRZGVPb0hPV0pnbVd0?=
 =?utf-8?B?SFNsNUFYUzNkZEhFN2VmeDNOVnMyaTZTZTQ2WjIvRWs4a3lJZkIveUlRUWJx?=
 =?utf-8?B?eHB6UjBqampkd3lVNUJFRUlWdzFydjhMRThlWU9pdmtURCtLK2gycnhHQmlH?=
 =?utf-8?B?TEdpaTg3Z2dzSTNSL1pZYk82dlRvbW1jaldZTlFURVlkUzhzQ3BlRnVQemlP?=
 =?utf-8?B?QXczY1Z6RE5wUTd5Y2hiQ3JUOVdrU1RFeFdWMGFPN0ZCZDFaRTJRSlY1YXVn?=
 =?utf-8?B?RWlpRU1hR2R2THhzWnBYNmRyOG1lSXozd3ZEcitHMW5rcGtkR0YvS2lKdHlS?=
 =?utf-8?B?SnJjTE1qVEZsRFhVZUl0czhFZ2FLTktYa1k3dXhheWNHY0p1cjhIWGV5U1RF?=
 =?utf-8?B?UGpSVEEvdXFPc1VFTVNDQjZlb1NaNmJobVVwdnFZRGxBR0ZYeWpFb2dVcjV2?=
 =?utf-8?B?WDIxak1RVittTjZmTUVtYVFSV0pwMWhObU1VL1pBL08ydzVKOWFIeUJTNVZh?=
 =?utf-8?B?SFhvUHNnbDcwUmpjM0I1VlZKeDZNQnNSKzVKUFdXdEUwVTRTUHNQN0t0ZHNm?=
 =?utf-8?B?elM0c0Uzek9OZlVhVzhobDVLSEJLK3VDSUwvZzU5TDV1USsrbVMrR1hUWW95?=
 =?utf-8?B?RFJTTnpkRXFxbFFjTTFPMk9URmdQV2syWlhLZVhnRkVrMVJVOER1SkFoalFt?=
 =?utf-8?B?dlhjb0EvRzZVcE1taGRpUE9jNjZTSDNlU3FKMy9wK1M1dm9iUHFGdnZlQldz?=
 =?utf-8?Q?l5blRhPgc16HrY7XDUZXuzqnv13daFBhS5f+Hrhgy/4k=3D?=
X-OriginatorOrg: sct-15-20-7762-17-msonline-outlook-fa1c0.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 911cb410-5e63-4a3e-12d2-08dd67d21707
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7712.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 17:10:19.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6748

--------------Qd8JM0YebGnsBi3ni2TI3o0H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans

Yes, both the front and back cameras work but with very noticeable lag, 
the back camera is unusable because of it, the front camera shows as 
Front Camera (V4L2) in Kamoso and for some reason the back camera is USB 
2.0 Camera (V4L2) in Kamoso (I don't really care for the cameras but I 
thought it was worth adding)

The i2cdetect is basically instant, the first ever run did go through 
the list one digit at a time in cmd if you know what I mean by that, 
like a loading bar. But now its instantaneous.

I have attached the dmesg.txt again after running i2cdetect, I think 
there are more options in the list now, I think prior was only 3? I am 
very new to this depth of linux so excuse my lack of knowlege, its a 
good learning ground for me!

I would also like to add, please do not feel you need to rush to do 
this, I don't want to step in the way of your other projects!

Thanks

Henry

On 20/03/2025 15:53, Hans de Goede wrote:
> Hi Henry.
>
> On 20-Mar-25 4:10 PM, Henry Isaac wrote:
>> Hello Hans
>>
>> Yes the LCD was on during the entire process. Everything litterally works on the tablet except for the touchscreen function. The display is fine, no refresh rate issues or resolution issues.
>>
>> I am unsure the exact driver for windows, I can boot into a copy of windows 11 and find out. Also Geos website has a zip folder of all the drivers if this helps!
>>
>> https://geocomputers.freshdesk.com/en/support/solutions/articles/103000268395-where-can-i-download-the-drivers-for-my-geo-device-
> Ok I downloaded this and there are no special touchscreen
> drivers there, so I guess things just work with the default
> i2c-hid support in Windows.
>
> Question, do the cameras on this tablet work ? I wonder
> if this is using an IPU4 based camera with a sensor which
> happens to be on the same bus and is blocking the bus.
>
> When you run the i2cdetect command does it go fast or
> slow ? It should be pretty fast.
>
> Also do any new messages show up in dmesg when you run
> i2cdetect ?
>
> Regards,
>
> Hans
>
>
>
>
>> On 20 Mar 2025 2:54 pm, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>      Hi Henry,
>>
>>      On 19-Mar-25 4:49 PM, Henry Isaac wrote:
>>      > Hello,
>>      >
>>      > Sorry about that, I'll be sure to select reply all next time.
>>      >
>>      > For some reason I am still getting nothing on the sudo i2cdetect unless I am doing something wrong, I have attached the command line results as a .txt
>>      >
>>      > I will add, I am unsure if this makes a difference but the touchscreen supports, and the tablet comes with a battery powered stylus, I am unsure if this feature of the touchscreen could cause any issues?
>>
>>      Well that is weird. I'm not quite sure what is going on here...
>>
>>      Do you know which driver the touchscreen uses under
>>      Windows ? Maybe the manufacturer provides a separate
>>      driver packages for the touchscreen for Windows ?
>>
>>      Also I presume that the LCD panel of the tablet was
>>      on during all these tests ?
>>
>>      Sometimes the touchscreen gets turned on/off together
>>      with the LCD panel ...
>>
>>      Regards,
>>
>>      Hans
>>
>>
>>
>>      > On 19/03/2025 13:25, Hans de Goede wrote:
>>      >> Hi Henry,
>>      >>
>>      >> Note I've added linux-input@vger.kernel.org back to the Cc,
>>      >> please use reply-to-all to keep it in the Cc.
>>      >>
>>      >> On 18-Mar-25 11:26 PM, Henry Isaac wrote:
>>      >>> Hello Hans
>>      >>>
>>      >>> Sorry for the delay, had an issue with Endevour so I reinstalled but this time just used the normal Arch ISO (Sorry if his complicates things) I followed all the steps again and the new ones to be safe.
>>      >>>
>>      >>> At the i2c_hid part of the file it just says address unavailable, I hope this helps!
>>      >> Since the new dmesg was not send to the list, here are the 2 relevant
>>      >> new messages after enabling i2c_hid.dyndbg:
>>      >>
>>      >> [    5.553115] drivers/hid/i2c-hid/i2c-hid-core.c: HID probe called for i2c 0x5d
>>      >> [    5.553819] i2c_hid_acpi i2c-GXTP7386:00: nothing at this address: -121
>>      >>
>>      >> Henry, this means that either the touchscreen is not at that address,
>>      >> or it is but it is not powered on.
>>      >>
>>      >> The ACPI tables describe 5 possible touchscreens, there is
>>      >> a possibility that somehow the wrong one is selected by the BIOS.
>>      >>
>>      >> First lets try to see if there is a touchscreen at a different
>>      >> i2c-address.
>>      >>
>>      >> All ACPI touchscreen descriptions use the same i2c controller,
>>      >> so first of all lets find out which i2c-bus Linux has assigned
>>      >> to that controller, please run:
>>      >>
>>      >> ls -l /sys/bus/i2c/devices/i2c-GXTP7386:00
>>      >>
>>      >> Here is the output of that run on the touchscreen of a laptop:
>>      >>
>>      >> lrwxrwxrwx. 1 root root 0 Mar 19 11:24 /sys/bus/i2c/devices/i2c-ELAN901C:00 -> ../../../devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN901C:00
>>      >>
>>      >> notice the "/i2c-1/" in the output, this indicates that the touchscreen
>>      >> on that laptop is on bus 1. Now install i2c-tools (not sure what
>>      >> the Arch pkg name is) and run e.g.:
>>      >>
>>      >> sudo modprobe i2c_dev
>>      >> sudo i2cdetect -y -r 1
>>      >>
>>      >> replacing "1" with the bus-number you found.
>>      >>
>>      >> Here is example output from the same laptop:
>>      >>
>>      >>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
>>      >> 00:                         -- -- -- -- -- -- -- --
>>      >> 10: 10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
>>      >> 70: -- -- -- -- -- -- -- --
>>      >>
>>      >> This shows a single device on this bus at address 0x10.
>>      >>
>>      >> Maybe you will see a device here at address 0x10, 0x14,
>>      >> 0x38, 0x40 or 0x5d .
>>      >>
>>      >> If you see a device at one of these addresses please
>>      >> copy and paste the output in your next email and
>>      >> then we will see from there.
>>      >>
>>      >> OTOH if you don't see a device at any of these addresses
>>      >> lets try to see if we can power the touchscreen up by setting
>>      >> its GPIO. According to the ACPI info GPIO-controller
>>      >> GPO0 pin 0x3a (pin 58) is used for the touchscreen enable.
>>      >>
>>      >> First lets make sure that gpiochip0 matches GPO0,
>>      >> install libgpiod-utils (Fedora pkg name) and run:
>>      >>
>>      >> sudo gpiodetect
>>      >>
>>      >> On your geminilake tablet I expect that to output
>>      >> something like this:
>>      >>
>>      >> gpiochip0 [INT3453:00] (80 lines)
>>      >> gpiochip1 [INT3453:01] (80 lines)
>>      >> gpiochip2 [INT3453:02] (20 lines)
>>      >> gpiochip3 [INT3453:03] (35 lines)
>>      >>
>>      >> The important thing here is that gpiochip0 is INT3453:00,
>>      >> that may be different if there is some other GPIO chip
>>      >> which got registered earlier.
>>      >>
>>      >> Assuming that gpiochip0 is INT3453:00 lets try to turn
>>      >> the touchpad on:
>>      >>
>>      >> sudo gpioset -c gpiochip0 58=1
>>      >>
>>      >> (and then press Ctrl+C because gpioset keeps running
>>      >> to hold ownership over the GPIO)
>>      >>
>>      >> and then re-run the i2cdetect:
>>      >>
>>      >> sudo i2cdetect -y -r 1
>>      >>
>>      >> again replacing "1" with the bus-number you found.
>>      >>
>>      >> Hopefully a device will show up now, if it does
>>      >> please copy and paste the output in your next email.
>>      >>
>>      >> If there still is no device, then maybe the enable signal
>>      >> is inverted, try running:
>>      >>
>>      >> sudo gpioset -c gpiochip0 58=0
>>      >> (and then press Ctrl+C again)
>>      >>
>>      >> and re-run the i2cdetect:
>>      >>
>>      >> sudo i2cdetect -y -r 1
>>      >>
>>      >> Note if you do get a device found after running gpioset,
>>      >> please also let me know if you got the device to show
>>      >> up with 58=1 or with 58=0
>>      >>
>>      >> Regards,
>>      >>
>>      >> Hans
>>      >>
>>      >>
>>
>>
--------------Qd8JM0YebGnsBi3ni2TI3o0H
Content-Type: text/plain; charset=UTF-8; name="dmesg.txt"
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: base64

WyAgICAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA2LjEzLjctYXJjaDEtMSAobGludXhAYXJjaGxp
bnV4KSAoZ2NjIChHQ0MpIDE0LjIuMSAyMDI1MDIwNywgR05VIGxkIChHTlUgQmludXRpbHMpIDIu
NDQpICMxIFNNUCBQUkVFTVBUX0RZTkFNSUMgVGh1LCAxMyBNYXIgMjAyNSAxODoxMjowMCArMDAw
MApbICAgIDAuMDAwMDAwXSBDb21tYW5kIGxpbmU6IEJPT1RfSU1BR0U9L3ZtbGludXotbGludXgg
cm9vdD1VVUlEPWRiMzlkMWZlLTA0MjMtNDUwMi04MWIyLTU2MDViOWY5NjlhMCBydyByb290Zmxh
Z3M9c3Vidm9sPUAgenN3YXAuZW5hYmxlZD0wIHJvb3Rmc3R5cGU9YnRyZnMgbG9nbGV2ZWw9MyBx
dWlldCBpMmNfaGlkLmR5bmRiZwpbICAgIDAuMDAwMDAwXSBCSU9TLXByb3ZpZGVkIHBoeXNpY2Fs
IFJBTSBtYXA6ClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwMDAw
MDAtMHgwMDAwMDAwMDAwMDNkZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBb
bWVtIDB4MDAwMDAwMDAwMDAzZTAwMC0weDAwMDAwMDAwMDAwM2ZmZmZdIHJlc2VydmVkClsgICAg
MC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwMDAwNDAwMDAtMHgwMDAwMDAwMDAw
MDlkZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAw
MDA5ZTAwMC0weDAwMDAwMDAwMDAwZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1Mt
ZTgyMDogW21lbSAweDAwMDAwMDAwMDAxMDAwMDAtMHgwMDAwMDAwMDBmZmZmZmZmXSB1c2FibGUK
WyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDAxMDAwMDAwMC0weDAwMDAw
MDAwMTIxNTBmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAw
MDAwMDAwMTIxNTEwMDAtMHgwMDAwMDAwMDc2MWU5ZmZmXSB1c2FibGUKWyAgICAwLjAwMDAwMF0g
QklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDA3NjFlYTAwMC0weDAwMDAwMDAwNzlhM2VmZmZdIHJl
c2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwNzlhM2YwMDAt
MHgwMDAwMDAwMDc5YTYxZmZmXSBBQ1BJIGRhdGEKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBb
bWVtIDB4MDAwMDAwMDA3OWE2MjAwMC0weDAwMDAwMDAwNzlhY2FmZmZdIEFDUEkgTlZTClsgICAg
MC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwNzlhY2IwMDAtMHgwMDAwMDAwMDc5
ZWQ4ZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAw
MDc5ZWQ5MDAwLTB4MDAwMDAwMDA3YTc3NWZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEJJT1Mt
ZTgyMDogW21lbSAweDAwMDAwMDAwN2E3NzYwMDAtMHgwMDAwMDAwMDdhODIxZmZmXSByZXNlcnZl
ZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMDdhODIyMDAwLTB4MDAw
MDAwMDA3YWJmZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAw
MDAwMDAwN2FjMDAwMDAtMHgwMDAwMDAwMDdmZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAw
XSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGQwMDAwMDAwLTB4MDAwMDAwMDBkMGZmZmZmZl0g
cmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAwMDBkMzcwOTAw
MC0weDAwMDAwMDAwZDM3MDlmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJT1MtZTgyMDog
W21lbSAweDAwMDAwMDAwZTAwMDAwMDAtMHgwMDAwMDAwMGVmZmZmZmZmXSByZXNlcnZlZApbICAg
IDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZlMDQyMDAwLTB4MDAwMDAwMDBm
ZTA0NGZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVtIDB4MDAwMDAw
MDBmZTkwMDAwMC0weDAwMDAwMDAwZmU5MDJmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIEJJ
T1MtZTgyMDogW21lbSAweDAwMDAwMDAwZmVjMDAwMDAtMHgwMDAwMDAwMGZlYzAwZmZmXSByZXNl
cnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMGZlZDAxMDAwLTB4
MDAwMDAwMDBmZWQwMWZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gQklPUy1lODIwOiBbbWVt
IDB4MDAwMDAwMDBmZWUwMDAwMC0weDAwMDAwMDAwZmVlMDBmZmZdIHJlc2VydmVkClsgICAgMC4w
MDAwMDBdIEJJT1MtZTgyMDogW21lbSAweDAwMDAwMDAwZmY4MDAwMDAtMHgwMDAwMDAwMGZmZmZm
ZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSBCSU9TLWU4MjA6IFttZW0gMHgwMDAwMDAwMTAw
MDAwMDAwLTB4MDAwMDAwMDI3ZmZmZmZmZl0gdXNhYmxlClsgICAgMC4wMDAwMDBdIE5YIChFeGVj
dXRlIERpc2FibGUpIHByb3RlY3Rpb246IGFjdGl2ZQpbICAgIDAuMDAwMDAwXSBBUElDOiBTdGF0
aWMgY2FsbHMgaW5pdGlhbGl6ZWQKWyAgICAwLjAwMDAwMF0gZTgyMDogdXBkYXRlIFttZW0gMHg2
YzA5ZjAxOC0weDZjMGFmMDU3XSB1c2FibGUgPT0+IHVzYWJsZQpbICAgIDAuMDAwMDAwXSBleHRl
bmRlZCBwaHlzaWNhbCBSQU0gbWFwOgpbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6
IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDAwMDAzZGZmZl0gdXNhYmxlClsgICAg
MC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMDAwM2UwMDAtMHgw
MDAwMDAwMDAwMDNmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2Rh
dGE6IFttZW0gMHgwMDAwMDAwMDAwMDQwMDAwLTB4MDAwMDAwMDAwMDA5ZGZmZl0gdXNhYmxlClsg
ICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMDAwOWUwMDAt
MHgwMDAwMDAwMDAwMGZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVw
X2RhdGE6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDAwZmZmZmZmZl0gdXNhYmxl
ClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwMTAwMDAw
MDAtMHgwMDAwMDAwMDEyMTUwZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNl
dHVwX2RhdGE6IFttZW0gMHgwMDAwMDAwMDEyMTUxMDAwLTB4MDAwMDAwMDA2YzA5ZjAxN10gdXNh
YmxlClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwNmMw
OWYwMTgtMHgwMDAwMDAwMDZjMGFmMDU3XSB1c2FibGUKWyAgICAwLjAwMDAwMF0gcmVzZXJ2ZSBz
ZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDA2YzBhZjA1OC0weDAwMDAwMDAwNzYxZTlmZmZdIHVz
YWJsZQpbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAwMDAwMDc2
MWVhMDAwLTB4MDAwMDAwMDA3OWEzZWZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gcmVzZXJ2
ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDA3OWEzZjAwMC0weDAwMDAwMDAwNzlhNjFmZmZd
IEFDUEkgZGF0YQpbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAw
MDAwMDc5YTYyMDAwLTB4MDAwMDAwMDA3OWFjYWZmZl0gQUNQSSBOVlMKWyAgICAwLjAwMDAwMF0g
cmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDA3OWFjYjAwMC0weDAwMDAwMDAwNzll
ZDhmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAw
eDAwMDAwMDAwNzllZDkwMDAtMHgwMDAwMDAwMDdhNzc1ZmZmXSB1c2FibGUKWyAgICAwLjAwMDAw
MF0gcmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDA3YTc3NjAwMC0weDAwMDAwMDAw
N2E4MjFmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21l
bSAweDAwMDAwMDAwN2E4MjIwMDAtMHgwMDAwMDAwMDdhYmZmZmZmXSB1c2FibGUKWyAgICAwLjAw
MDAwMF0gcmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDA3YWMwMDAwMC0weDAwMDAw
MDAwN2ZmZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTog
W21lbSAweDAwMDAwMDAwZDAwMDAwMDAtMHgwMDAwMDAwMGQwZmZmZmZmXSByZXNlcnZlZApbICAg
IDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAwMDAwMGQzNzA5MDAwLTB4
MDAwMDAwMDBkMzcwOWZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0gcmVzZXJ2ZSBzZXR1cF9k
YXRhOiBbbWVtIDB4MDAwMDAwMDBlMDAwMDAwMC0weDAwMDAwMDAwZWZmZmZmZmZdIHJlc2VydmVk
ClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwZmUwNDIw
MDAtMHgwMDAwMDAwMGZlMDQ0ZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNl
dHVwX2RhdGE6IFttZW0gMHgwMDAwMDAwMGZlOTAwMDAwLTB4MDAwMDAwMDBmZTkwMmZmZl0gcmVz
ZXJ2ZWQKWyAgICAwLjAwMDAwMF0gcmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDBm
ZWMwMDAwMC0weDAwMDAwMDAwZmVjMDBmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIHJlc2Vy
dmUgc2V0dXBfZGF0YTogW21lbSAweDAwMDAwMDAwZmVkMDEwMDAtMHgwMDAwMDAwMGZlZDAxZmZm
XSByZXNlcnZlZApbICAgIDAuMDAwMDAwXSByZXNlcnZlIHNldHVwX2RhdGE6IFttZW0gMHgwMDAw
MDAwMGZlZTAwMDAwLTB4MDAwMDAwMDBmZWUwMGZmZl0gcmVzZXJ2ZWQKWyAgICAwLjAwMDAwMF0g
cmVzZXJ2ZSBzZXR1cF9kYXRhOiBbbWVtIDB4MDAwMDAwMDBmZjgwMDAwMC0weDAwMDAwMDAwZmZm
ZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIHJlc2VydmUgc2V0dXBfZGF0YTogW21lbSAw
eDAwMDAwMDAxMDAwMDAwMDAtMHgwMDAwMDAwMjdmZmZmZmZmXSB1c2FibGUKWyAgICAwLjAwMDAw
MF0gZWZpOiBFRkkgdjIuNyBieSBBbWVyaWNhbiBNZWdhdHJlbmRzClsgICAgMC4wMDAwMDBdIGVm
aTogQUNQSSAyLjA9MHg3OWE0NjAwMCBBQ1BJPTB4NzlhNDYwMDAgU01CSU9TPTB4NzljZWIwMDAg
U01CSU9TIDMuMD0weDc5Y2VhMDAwIE1FTUFUVFI9MHg3Mjg1ZTAxOCBFU1JUPTB4NzI4N2Q2MTgg
SU5JVFJEPTB4NmY1NzdkOTggUk5HPTB4NzlhNDUwMTggClsgICAgMC4wMDAwMDBdIHJhbmRvbTog
Y3JuZyBpbml0IGRvbmUKWyAgICAwLjAwMDAwMF0gZWZpOiBSZW1vdmUgbWVtNDc6IE1NSU8gcmFu
Z2U9WzB4ZDAwMDAwMDAtMHhkMGZmZmZmZl0gKDE2TUIpIGZyb20gZTgyMCBtYXAKWyAgICAwLjAw
MDAwMF0gZTgyMDogcmVtb3ZlIFttZW0gMHhkMDAwMDAwMC0weGQwZmZmZmZmXSByZXNlcnZlZApb
ICAgIDAuMDAwMDAwXSBlZmk6IE5vdCByZW1vdmluZyBtZW00ODogTU1JTyByYW5nZT1bMHhkMzcw
OTAwMC0weGQzNzA5ZmZmXSAoNEtCKSBmcm9tIGU4MjAgbWFwClsgICAgMC4wMDAwMDBdIGVmaTog
UmVtb3ZlIG1lbTQ5OiBNTUlPIHJhbmdlPVsweGUwMDAwMDAwLTB4ZWZmZmZmZmZdICgyNTZNQikg
ZnJvbSBlODIwIG1hcApbICAgIDAuMDAwMDAwXSBlODIwOiByZW1vdmUgW21lbSAweGUwMDAwMDAw
LTB4ZWZmZmZmZmZdIHJlc2VydmVkClsgICAgMC4wMDAwMDBdIGVmaTogTm90IHJlbW92aW5nIG1l
bTUwOiBNTUlPIHJhbmdlPVsweGZlMDQyMDAwLTB4ZmUwNDJmZmZdICg0S0IpIGZyb20gZTgyMCBt
YXAKWyAgICAwLjAwMDAwMF0gZWZpOiBOb3QgcmVtb3ZpbmcgbWVtNTE6IE1NSU8gcmFuZ2U9WzB4
ZmUwNDMwMDAtMHhmZTA0M2ZmZl0gKDRLQikgZnJvbSBlODIwIG1hcApbICAgIDAuMDAwMDAwXSBl
Zmk6IE5vdCByZW1vdmluZyBtZW01MjogTU1JTyByYW5nZT1bMHhmZTA0NDAwMC0weGZlMDQ0ZmZm
XSAoNEtCKSBmcm9tIGU4MjAgbWFwClsgICAgMC4wMDAwMDBdIGVmaTogTm90IHJlbW92aW5nIG1l
bTUzOiBNTUlPIHJhbmdlPVsweGZlOTAwMDAwLTB4ZmU5MDJmZmZdICgxMktCKSBmcm9tIGU4MjAg
bWFwClsgICAgMC4wMDAwMDBdIGVmaTogTm90IHJlbW92aW5nIG1lbTU0OiBNTUlPIHJhbmdlPVsw
eGZlYzAwMDAwLTB4ZmVjMDBmZmZdICg0S0IpIGZyb20gZTgyMCBtYXAKWyAgICAwLjAwMDAwMF0g
ZWZpOiBOb3QgcmVtb3ZpbmcgbWVtNTU6IE1NSU8gcmFuZ2U9WzB4ZmVkMDEwMDAtMHhmZWQwMWZm
Zl0gKDRLQikgZnJvbSBlODIwIG1hcApbICAgIDAuMDAwMDAwXSBlZmk6IE5vdCByZW1vdmluZyBt
ZW01NjogTU1JTyByYW5nZT1bMHhmZWUwMDAwMC0weGZlZTAwZmZmXSAoNEtCKSBmcm9tIGU4MjAg
bWFwClsgICAgMC4wMDAwMDBdIGVmaTogUmVtb3ZlIG1lbTU3OiBNTUlPIHJhbmdlPVsweGZmODAw
MDAwLTB4ZmZmZmZmZmZdICg4TUIpIGZyb20gZTgyMCBtYXAKWyAgICAwLjAwMDAwMF0gZTgyMDog
cmVtb3ZlIFttZW0gMHhmZjgwMDAwMC0weGZmZmZmZmZmXSByZXNlcnZlZApbICAgIDAuMDAwMDAw
XSBTTUJJT1MgMy4yLjAgcHJlc2VudC4KWyAgICAwLjAwMDAwMF0gRE1JOiBUYWN0dXMgR2VvUGFk
IDIyMC9TRjEzM0dSNTMwLCBCSU9TIExDLUJJLTEyLVNGMTMzR1I1MzAtNjY5LUEgMDMvMTAvMjAy
MgpbICAgIDAuMDAwMDAwXSBETUk6IE1lbW9yeSBzbG90cyBwb3B1bGF0ZWQ6IDQvNApbICAgIDAu
MDAwMDAwXSB0c2M6IEZhc3QgVFNDIGNhbGlicmF0aW9uIHVzaW5nIFBJVApbICAgIDAuMDAwMDAw
XSB0c2M6IERldGVjdGVkIDEwOTQuNDAwIE1IeiBwcm9jZXNzb3IKWyAgICAwLjAwMDAzOF0gZTgy
MDogdXBkYXRlIFttZW0gMHgwMDAwMDAwMC0weDAwMDAwZmZmXSB1c2FibGUgPT0+IHJlc2VydmVk
ClsgICAgMC4wMDAwNDddIGU4MjA6IHJlbW92ZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBmZmZmZl0g
dXNhYmxlClsgICAgMC4wMDAwODJdIGxhc3RfcGZuID0gMHgyODAwMDAgbWF4X2FyY2hfcGZuID0g
MHg0MDAwMDAwMDAKWyAgICAwLjAwMDEwMV0gTVRSUiBtYXA6IDcgZW50cmllcyAoMyBmaXhlZCAr
IDQgdmFyaWFibGU7IG1heCAyMyksIGJ1aWx0IGZyb20gMTAgdmFyaWFibGUgTVRSUnMKWyAgICAw
LjAwMDEwOF0geDg2L1BBVDogQ29uZmlndXJhdGlvbiBbMC03XTogV0IgIFdDICBVQy0gVUMgIFdC
ICBXUCAgVUMtIFdUICAKWyAgICAwLjAwMDIzNl0gbGFzdF9wZm4gPSAweDdhYzAwIG1heF9hcmNo
X3BmbiA9IDB4NDAwMDAwMDAwClsgICAgMC4wMTI5NjNdIGVzcnQ6IFJlc2VydmluZyBFU1JUIHNw
YWNlIGZyb20gMHgwMDAwMDAwMDcyODdkNjE4IHRvIDB4MDAwMDAwMDA3Mjg3ZDY1MC4KWyAgICAw
LjAxMjk4MV0gZTgyMDogdXBkYXRlIFttZW0gMHg3Mjg3ZDAwMC0weDcyODdkZmZmXSB1c2FibGUg
PT0+IHJlc2VydmVkClsgICAgMC4wMTMwNDFdIFVzaW5nIEdCIHBhZ2VzIGZvciBkaXJlY3QgbWFw
cGluZwpbICAgIDAuMDE1ODcyXSBTZWN1cmUgYm9vdCBkaXNhYmxlZApbICAgIDAuMDE1ODc0XSBS
QU1ESVNLOiBbbWVtIDB4NmMwYjAwMDAtMHg2ZGEzZmZmZl0KWyAgICAwLjAxNjEwMF0gQUNQSTog
RWFybHkgdGFibGUgY2hlY2tzdW0gdmVyaWZpY2F0aW9uIGRpc2FibGVkClsgICAgMC4wMTYxMDld
IEFDUEk6IFJTRFAgMHgwMDAwMDAwMDc5QTQ2MDAwIDAwMDAyNCAodjAyIEFMQVNLQSkKWyAgICAw
LjAxNjEyMF0gQUNQSTogWFNEVCAweDAwMDAwMDAwNzlBNDYwQzAgMDAwMEY0ICh2MDEgQUxBU0tB
IEEgTSBJICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAwMTMpClsgICAgMC4wMTYxMzddIEFDUEk6IEZB
Q1AgMHgwMDAwMDAwMDc5QTUzNkMwIDAwMDExNCAodjA2IEFMQVNLQSBBIE0gSSAgICAwMTA3MjAw
OSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE2MTU0XSBBQ1BJOiBEU0RUIDB4MDAwMDAwMDA3OUE0
NjI2MCAwMEQ0NTYgKHYwMiBBTEFTS0EgQSBNIEkgICAgMDEwNzIwMDkgSU5UTCAyMDE2MDkzMCkK
WyAgICAwLjAxNjE2Nl0gQUNQSTogRkFDUyAweDAwMDAwMDAwNzlBQ0EwODAgMDAwMDQwClsgICAg
MC4wMTYxNzRdIEFDUEk6IEZQRFQgMHgwMDAwMDAwMDc5QTUzN0UwIDAwMDA0NCAodjAxIEFMQVNL
QSBBIE0gSSAgICAwMTA3MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE2MTg0XSBBQ1BJOiBG
SURUIDB4MDAwMDAwMDA3OUE1MzgzMCAwMDAwOUMgKHYwMSBBTEFTS0EgQSBNIEkgICAgMDEwNzIw
MDkgQU1JICAwMDAxMDAxMykKWyAgICAwLjAxNjE5M10gQUNQSTogTVNETSAweDAwMDAwMDAwNzlB
NTM4RDAgMDAwMDU1ICh2MDMgQUxBU0tBIEEgTSBJICAgIDAxMDcyMDA5IEFNSSAgMDAwMTAwMTMp
ClsgICAgMC4wMTYyMDNdIEFDUEk6IE1DRkcgMHgwMDAwMDAwMDc5QTUzOTMwIDAwMDAzQyAodjAx
IEFMQVNLQSBBIE0gSSAgICAwMTA3MjAwOSBNU0ZUIDAwMDAwMDk3KQpbICAgIDAuMDE2MjEzXSBB
Q1BJOiBEQkcyIDB4MDAwMDAwMDA3OUE1Mzk3MCAwMDAwNzIgKHYwMCBJTlRFTCAgR0xLLVNPQyAg
MDAwMDAwMDMgQlJYVCAwMTAwMDAwRCkKWyAgICAwLjAxNjIyMl0gQUNQSTogREJHUCAweDAwMDAw
MDAwNzlBNTM5RjAgMDAwMDM0ICh2MDEgSU5URUwgIEdMSy1TT0MgIDAwMDAwMDAzIEJSWFQgMDEw
MDAwMEQpClsgICAgMC4wMTYyMzJdIEFDUEk6IEhQRVQgMHgwMDAwMDAwMDc5QTUzQTMwIDAwMDAz
OCAodjAxIElOVEVMICBHTEstU09DICAwMDAwMDAwMyBCUlhUIDAxMDAwMDBEKQpbICAgIDAuMDE2
MjQxXSBBQ1BJOiBMUElUIDB4MDAwMDAwMDA3OUE1M0E3MCAwMDAwNUMgKHYwMSBJTlRFTCAgR0xL
LVNPQyAgMDAwMDAwMDMgQlJYVCAwMTAwMDAwRCkKWyAgICAwLjAxNjI1MF0gQUNQSTogQVBJQyAw
eDAwMDAwMDAwNzlBNTNBRDAgMDAwMDg0ICh2MDQgSU5URUwgIEdMSy1TT0MgIDAwMDAwMDAzIEJS
WFQgMDEwMDAwMEQpClsgICAgMC4wMTYyNjBdIEFDUEk6IE5QS1QgMHgwMDAwMDAwMDc5QTUzQjYw
IDAwMDA2NSAodjAxIElOVEVMICBHTEstU09DICAwMDAwMDAwMyBCUlhUIDAxMDAwMDBEKQpbICAg
IDAuMDE2MjY5XSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA3OUE1M0JEMCAwMDQyODYgKHYwMiBJTlRF
TCAgRHB0ZlRhYiAgMDAwMDAwMDMgQlJYVCAwMTAwMDAwRCkKWyAgICAwLjAxNjI4MF0gQUNQSTog
U1NEVCAweDAwMDAwMDAwNzlBNTdFNjAgMDA0QzJBICh2MDIgSU5URUwgIFJWUFJ0ZDMgIDAwMDAw
MDAzIEJSWFQgMDEwMDAwMEQpClsgICAgMC4wMTYyOTBdIEFDUEk6IFNTRFQgMHgwMDAwMDAwMDc5
QTVDQTkwIDAwMEM4RiAodjAyIElOVEVMICBVc2JDVGFibCAwMDAwMDAwMyBCUlhUIDAxMDAwMDBE
KQpbICAgIDAuMDE2MzAwXSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA3OUE1RDcyMCAwMDA2NjkgKHYw
MSBJbnRlbF8gUGxhdGZvcm0gMDAwMDEwMDAgSU5UTCAyMDE2MDkzMCkKWyAgICAwLjAxNjMxMF0g
QUNQSTogU1NEVCAweDAwMDAwMDAwNzlBNUREOTAgMDAwMEIxICh2MDEgSW50ZWxfIEFEZWJUYWJs
IDAwMDAxMDAwIElOVEwgMjAxNjA5MzApClsgICAgMC4wMTYzMTldIEFDUEk6IFNTRFQgMHgwMDAw
MDAwMDc5QTVERTUwIDAwMDUxNyAodjAyIFBtUmVmICBDcHUwSXN0ICAwMDAwMzAwMCBJTlRMIDIw
MTYwOTMwKQpbICAgIDAuMDE2MzI5XSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA3OUE1RTM3MCAwMDA3
NzUgKHYwMiBDcHVSZWYgQ3B1U3NkdCAgMDAwMDMwMDAgSU5UTCAyMDE2MDkzMCkKWyAgICAwLjAx
NjMzOV0gQUNQSTogU1NEVCAweDAwMDAwMDAwNzlBNUVBRjAgMDAwMzVGICh2MDIgUG1SZWYgIENw
dTBUc3QgIDAwMDAzMDAwIElOVEwgMjAxNjA5MzApClsgICAgMC4wMTYzNDldIEFDUEk6IFNTRFQg
MHgwMDAwMDAwMDc5QTVFRTUwIDAwMDFFNiAodjAyIFBtUmVmICBBcFRzdCAgICAwMDAwMzAwMCBJ
TlRMIDIwMTYwOTMwKQpbICAgIDAuMDE2MzU5XSBBQ1BJOiBTU0RUIDB4MDAwMDAwMDA3OUE1RjA0
MCAwMDI4OTIgKHYwMiBTYVNzZHQgU2FTc2R0ICAgMDAwMDMwMDAgSU5UTCAyMDE2MDkzMCkKWyAg
ICAwLjAxNjM2OV0gQUNQSTogVUVGSSAweDAwMDAwMDAwNzlBNjE4RTAgMDAwMDQ4ICh2MDEgQUxB
U0tBIEEgTSBJICAgIDAwMDAwMDAyICAgICAgMDEwMDAwMTMpClsgICAgMC4wMTYzNzhdIEFDUEk6
IEJHUlQgMHgwMDAwMDAwMDc5QTYxOTMwIDAwMDAzOCAodjAxIEFMQVNLQSBBIE0gSSAgICAwMTA3
MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE2Mzg4XSBBQ1BJOiBETUFSIDB4MDAwMDAwMDA3
OUE2MTk3MCAwMDAwQTggKHYwMSBJTlRFTCAgR0xLLVNPQyAgMDAwMDAwMDMgQlJYVCAwMTAwMDAw
RCkKWyAgICAwLjAxNjM5N10gQUNQSTogV0RBVCAweDAwMDAwMDAwNzlBNjFBMjAgMDAwMTA0ICh2
MDEgICAgICAgICAgICAgICAgIDAwMDAwMDAwICAgICAgMDAwMDAwMDApClsgICAgMC4wMTY0MDdd
IEFDUEk6IFdTTVQgMHgwMDAwMDAwMDc5QTYxQjMwIDAwMDAyOCAodjAxIEFMQVNLQSBBIE0gSSAg
ICAwMTA3MjAwOSBBTUkgIDAwMDEwMDEzKQpbICAgIDAuMDE2NDE1XSBBQ1BJOiBSZXNlcnZpbmcg
RkFDUCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTUzNmMwLTB4NzlhNTM3ZDNdClsgICAgMC4w
MTY0MjBdIEFDUEk6IFJlc2VydmluZyBEU0RUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NzlhNDYy
NjAtMHg3OWE1MzZiNV0KWyAgICAwLjAxNjQyM10gQUNQSTogUmVzZXJ2aW5nIEZBQ1MgdGFibGUg
bWVtb3J5IGF0IFttZW0gMHg3OWFjYTA4MC0weDc5YWNhMGJmXQpbICAgIDAuMDE2NDI2XSBBQ1BJ
OiBSZXNlcnZpbmcgRlBEVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTUzN2UwLTB4NzlhNTM4
MjNdClsgICAgMC4wMTY0MjldIEFDUEk6IFJlc2VydmluZyBGSURUIHRhYmxlIG1lbW9yeSBhdCBb
bWVtIDB4NzlhNTM4MzAtMHg3OWE1MzhjYl0KWyAgICAwLjAxNjQzMl0gQUNQSTogUmVzZXJ2aW5n
IE1TRE0gdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3OWE1MzhkMC0weDc5YTUzOTI0XQpbICAgIDAu
MDE2NDM1XSBBQ1BJOiBSZXNlcnZpbmcgTUNGRyB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTUz
OTMwLTB4NzlhNTM5NmJdClsgICAgMC4wMTY0MzhdIEFDUEk6IFJlc2VydmluZyBEQkcyIHRhYmxl
IG1lbW9yeSBhdCBbbWVtIDB4NzlhNTM5NzAtMHg3OWE1MzllMV0KWyAgICAwLjAxNjQ0MV0gQUNQ
STogUmVzZXJ2aW5nIERCR1AgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3OWE1MzlmMC0weDc5YTUz
YTIzXQpbICAgIDAuMDE2NDQ0XSBBQ1BJOiBSZXNlcnZpbmcgSFBFVCB0YWJsZSBtZW1vcnkgYXQg
W21lbSAweDc5YTUzYTMwLTB4NzlhNTNhNjddClsgICAgMC4wMTY0NDddIEFDUEk6IFJlc2Vydmlu
ZyBMUElUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NzlhNTNhNzAtMHg3OWE1M2FjYl0KWyAgICAw
LjAxNjQ1MF0gQUNQSTogUmVzZXJ2aW5nIEFQSUMgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3OWE1
M2FkMC0weDc5YTUzYjUzXQpbICAgIDAuMDE2NDUzXSBBQ1BJOiBSZXNlcnZpbmcgTlBLVCB0YWJs
ZSBtZW1vcnkgYXQgW21lbSAweDc5YTUzYjYwLTB4NzlhNTNiYzRdClsgICAgMC4wMTY0NTZdIEFD
UEk6IFJlc2VydmluZyBTU0RUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NzlhNTNiZDAtMHg3OWE1
N2U1NV0KWyAgICAwLjAxNjQ1OV0gQUNQSTogUmVzZXJ2aW5nIFNTRFQgdGFibGUgbWVtb3J5IGF0
IFttZW0gMHg3OWE1N2U2MC0weDc5YTVjYTg5XQpbICAgIDAuMDE2NDYyXSBBQ1BJOiBSZXNlcnZp
bmcgU1NEVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTVjYTkwLTB4NzlhNWQ3MWVdClsgICAg
MC4wMTY0NjVdIEFDUEk6IFJlc2VydmluZyBTU0RUIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4Nzlh
NWQ3MjAtMHg3OWE1ZGQ4OF0KWyAgICAwLjAxNjQ2OF0gQUNQSTogUmVzZXJ2aW5nIFNTRFQgdGFi
bGUgbWVtb3J5IGF0IFttZW0gMHg3OWE1ZGQ5MC0weDc5YTVkZTQwXQpbICAgIDAuMDE2NDcxXSBB
Q1BJOiBSZXNlcnZpbmcgU1NEVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTVkZTUwLTB4Nzlh
NWUzNjZdClsgICAgMC4wMTY0NzRdIEFDUEk6IFJlc2VydmluZyBTU0RUIHRhYmxlIG1lbW9yeSBh
dCBbbWVtIDB4NzlhNWUzNzAtMHg3OWE1ZWFlNF0KWyAgICAwLjAxNjQ3N10gQUNQSTogUmVzZXJ2
aW5nIFNTRFQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3OWE1ZWFmMC0weDc5YTVlZTRlXQpbICAg
IDAuMDE2NDgwXSBBQ1BJOiBSZXNlcnZpbmcgU1NEVCB0YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5
YTVlZTUwLTB4NzlhNWYwMzVdClsgICAgMC4wMTY0ODNdIEFDUEk6IFJlc2VydmluZyBTU0RUIHRh
YmxlIG1lbW9yeSBhdCBbbWVtIDB4NzlhNWYwNDAtMHg3OWE2MThkMV0KWyAgICAwLjAxNjQ4Nl0g
QUNQSTogUmVzZXJ2aW5nIFVFRkkgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3OWE2MThlMC0weDc5
YTYxOTI3XQpbICAgIDAuMDE2NDg5XSBBQ1BJOiBSZXNlcnZpbmcgQkdSVCB0YWJsZSBtZW1vcnkg
YXQgW21lbSAweDc5YTYxOTMwLTB4NzlhNjE5NjddClsgICAgMC4wMTY0OTJdIEFDUEk6IFJlc2Vy
dmluZyBETUFSIHRhYmxlIG1lbW9yeSBhdCBbbWVtIDB4NzlhNjE5NzAtMHg3OWE2MWExN10KWyAg
ICAwLjAxNjQ5NV0gQUNQSTogUmVzZXJ2aW5nIFdEQVQgdGFibGUgbWVtb3J5IGF0IFttZW0gMHg3
OWE2MWEyMC0weDc5YTYxYjIzXQpbICAgIDAuMDE2NDk4XSBBQ1BJOiBSZXNlcnZpbmcgV1NNVCB0
YWJsZSBtZW1vcnkgYXQgW21lbSAweDc5YTYxYjMwLTB4NzlhNjFiNTddClsgICAgMC4wMTY2OTFd
IE5vIE5VTUEgY29uZmlndXJhdGlvbiBmb3VuZApbICAgIDAuMDE2Njk0XSBGYWtpbmcgYSBub2Rl
IGF0IFttZW0gMHgwMDAwMDAwMDAwMDAwMDAwLTB4MDAwMDAwMDI3ZmZmZmZmZl0KWyAgICAwLjAx
NjcyNl0gTk9ERV9EQVRBKDApIGFsbG9jYXRlZCBbbWVtIDB4MjdmZmQ1MmMwLTB4MjdmZmZmZmZm
XQpbICAgIDAuMDE3NzcyXSBab25lIHJhbmdlczoKWyAgICAwLjAxNzc3NV0gICBETUEgICAgICBb
bWVtIDB4MDAwMDAwMDAwMDAwMTAwMC0weDAwMDAwMDAwMDBmZmZmZmZdClsgICAgMC4wMTc3ODBd
ICAgRE1BMzIgICAgW21lbSAweDAwMDAwMDAwMDEwMDAwMDAtMHgwMDAwMDAwMGZmZmZmZmZmXQpb
ICAgIDAuMDE3Nzg2XSAgIE5vcm1hbCAgIFttZW0gMHgwMDAwMDAwMTAwMDAwMDAwLTB4MDAwMDAw
MDI3ZmZmZmZmZl0KWyAgICAwLjAxNzc5MV0gICBEZXZpY2UgICBlbXB0eQpbICAgIDAuMDE3Nzk0
XSBNb3ZhYmxlIHpvbmUgc3RhcnQgZm9yIGVhY2ggbm9kZQpbICAgIDAuMDE3ODAyXSBFYXJseSBt
ZW1vcnkgbm9kZSByYW5nZXMKWyAgICAwLjAxNzgwNF0gICBub2RlICAgMDogW21lbSAweDAwMDAw
MDAwMDAwMDEwMDAtMHgwMDAwMDAwMDAwMDNkZmZmXQpbICAgIDAuMDE3ODA4XSAgIG5vZGUgICAw
OiBbbWVtIDB4MDAwMDAwMDAwMDA0MDAwMC0weDAwMDAwMDAwMDAwOWRmZmZdClsgICAgMC4wMTc4
MTJdICAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDAwMTAwMDAwLTB4MDAwMDAwMDAwZmZmZmZm
Zl0KWyAgICAwLjAxNzgxNV0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwMTIxNTEwMDAtMHgw
MDAwMDAwMDc2MWU5ZmZmXQpbICAgIDAuMDE3ODE5XSAgIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAw
MDA3OWVkOTAwMC0weDAwMDAwMDAwN2E3NzVmZmZdClsgICAgMC4wMTc4MjNdICAgbm9kZSAgIDA6
IFttZW0gMHgwMDAwMDAwMDdhODIyMDAwLTB4MDAwMDAwMDA3YWJmZmZmZl0KWyAgICAwLjAxNzgy
Nl0gICBub2RlICAgMDogW21lbSAweDAwMDAwMDAxMDAwMDAwMDAtMHgwMDAwMDAwMjdmZmZmZmZm
XQpbICAgIDAuMDE3ODM1XSBJbml0bWVtIHNldHVwIG5vZGUgMCBbbWVtIDB4MDAwMDAwMDAwMDAw
MTAwMC0weDAwMDAwMDAyN2ZmZmZmZmZdClsgICAgMC4wMTc4NTBdIE9uIG5vZGUgMCwgem9uZSBE
TUE6IDEgcGFnZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMTc4NTddIE9uIG5vZGUg
MCwgem9uZSBETUE6IDIgcGFnZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMTc5Mjld
IE9uIG5vZGUgMCwgem9uZSBETUE6IDk4IHBhZ2VzIGluIHVuYXZhaWxhYmxlIHJhbmdlcwpbICAg
IDAuMDI2NTk3XSBPbiBub2RlIDAsIHpvbmUgRE1BMzI6IDg1MjkgcGFnZXMgaW4gdW5hdmFpbGFi
bGUgcmFuZ2VzClsgICAgMC4wMjczMTRdIE9uIG5vZGUgMCwgem9uZSBETUEzMjogMTU1OTkgcGFn
ZXMgaW4gdW5hdmFpbGFibGUgcmFuZ2VzClsgICAgMC4wMjczNDJdIE9uIG5vZGUgMCwgem9uZSBE
TUEzMjogMTcyIHBhZ2VzIGluIHVuYXZhaWxhYmxlIHJhbmdlcwpbICAgIDAuMDU2ODc1XSBPbiBu
b2RlIDAsIHpvbmUgTm9ybWFsOiAyMTUwNCBwYWdlcyBpbiB1bmF2YWlsYWJsZSByYW5nZXMKWyAg
ICAwLjA1NjkwOV0gUmVzZXJ2aW5nIEludGVsIGdyYXBoaWNzIG1lbW9yeSBhdCBbbWVtIDB4N2Mw
MDAwMDAtMHg3ZmZmZmZmZl0KWyAgICAwLjA1NzI4Ml0gQUNQSTogUE0tVGltZXIgSU8gUG9ydDog
MHg0MDgKWyAgICAwLjA1NzMxMl0gQUNQSTogTEFQSUNfTk1JIChhY3BpX2lkWzB4MDFdIGhpZ2gg
bGV2ZWwgbGludFsweDFdKQpbICAgIDAuMDU3MzE3XSBBQ1BJOiBMQVBJQ19OTUkgKGFjcGlfaWRb
MHgwMl0gaGlnaCBsZXZlbCBsaW50WzB4MV0pClsgICAgMC4wNTczMjFdIEFDUEk6IExBUElDX05N
SSAoYWNwaV9pZFsweDAzXSBoaWdoIGxldmVsIGxpbnRbMHgxXSkKWyAgICAwLjA1NzMyNF0gQUNQ
STogTEFQSUNfTk1JIChhY3BpX2lkWzB4MDRdIGhpZ2ggbGV2ZWwgbGludFsweDFdKQpbICAgIDAu
MDU3MzY1XSBJT0FQSUNbMF06IGFwaWNfaWQgMSwgdmVyc2lvbiAzMiwgYWRkcmVzcyAweGZlYzAw
MDAwLCBHU0kgMC0xMTkKWyAgICAwLjA1NzM3NV0gQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1
c19pcnEgMCBnbG9iYWxfaXJxIDIgZGZsIGRmbCkKWyAgICAwLjA1NzM4MV0gQUNQSTogSU5UX1NS
Q19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgbG93IGxldmVsKQpbICAgIDAuMDU3
Mzk0XSBBQ1BJOiBVc2luZyBBQ1BJIChNQURUKSBmb3IgU01QIGNvbmZpZ3VyYXRpb24gaW5mb3Jt
YXRpb24KWyAgICAwLjA1NzM5OF0gQUNQSTogSFBFVCBpZDogMHg4MDg2YTcwMSBiYXNlOiAweGZl
ZDAwMDAwClsgICAgMC4wNTc0MjddIGU4MjA6IHVwZGF0ZSBbbWVtIDB4NzFiM2EwMDAtMHg3MjQy
MGZmZl0gdXNhYmxlID09PiByZXNlcnZlZApbICAgIDAuMDU3NDc5XSBUU0MgZGVhZGxpbmUgdGlt
ZXIgYXZhaWxhYmxlClsgICAgMC4wNTc0OThdIENQVSB0b3BvOiBNYXguIGxvZ2ljYWwgcGFja2Fn
ZXM6ICAgMQpbICAgIDAuMDU3NTAxXSBDUFUgdG9wbzogTWF4LiBsb2dpY2FsIGRpZXM6ICAgICAg
IDEKWyAgICAwLjA1NzUwM10gQ1BVIHRvcG86IE1heC4gZGllcyBwZXIgcGFja2FnZTogICAxClsg
ICAgMC4wNTc1MjFdIENQVSB0b3BvOiBNYXguIHRocmVhZHMgcGVyIGNvcmU6ICAgMQpbICAgIDAu
MDU3NTI0XSBDUFUgdG9wbzogTnVtLiBjb3JlcyBwZXIgcGFja2FnZTogICAgIDQKWyAgICAwLjA1
NzUyNl0gQ1BVIHRvcG86IE51bS4gdGhyZWFkcyBwZXIgcGFja2FnZTogICA0ClsgICAgMC4wNTc1
MjhdIENQVSB0b3BvOiBBbGxvd2luZyA0IHByZXNlbnQgQ1BVcyBwbHVzIDAgaG90cGx1ZyBDUFVz
ClsgICAgMC4wNTc2MTNdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5
OiBbbWVtIDB4MDAwMDAwMDAtMHgwMDAwMGZmZl0KWyAgICAwLjA1NzYyMF0gUE06IGhpYmVybmF0
aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHgwMDAzZTAwMC0weDAwMDNmZmZm
XQpbICAgIDAuMDU3NjI3XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9y
eTogW21lbSAweDAwMDllMDAwLTB4MDAwZmZmZmZdClsgICAgMC4wNTc2MzNdIFBNOiBoaWJlcm5h
dGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4MTAwMDAwMDAtMHgxMjE1MGZm
Zl0KWyAgICAwLjA1NzY0MF0gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1v
cnk6IFttZW0gMHg2YzA5ZjAwMC0weDZjMDlmZmZmXQpbICAgIDAuMDU3NjQ3XSBQTTogaGliZXJu
YXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDZjMGFmMDAwLTB4NmMwYWZm
ZmZdClsgICAgMC4wNTc2NTNdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVt
b3J5OiBbbWVtIDB4NzFiM2EwMDAtMHg3MjQyMGZmZl0KWyAgICAwLjA1NzY2MF0gUE06IGhpYmVy
bmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHg3Mjg3ZDAwMC0weDcyODdk
ZmZmXQpbICAgIDAuMDU3NjY2XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1l
bW9yeTogW21lbSAweDc2MWVhMDAwLTB4NzlhM2VmZmZdClsgICAgMC4wNTc2NjldIFBNOiBoaWJl
cm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4NzlhM2YwMDAtMHg3OWE2
MWZmZl0KWyAgICAwLjA1NzY3Ml0gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBt
ZW1vcnk6IFttZW0gMHg3OWE2MjAwMC0weDc5YWNhZmZmXQpbICAgIDAuMDU3Njc1XSBQTTogaGli
ZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweDc5YWNiMDAwLTB4Nzll
ZDhmZmZdClsgICAgMC4wNTc2ODFdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUg
bWVtb3J5OiBbbWVtIDB4N2E3NzYwMDAtMHg3YTgyMWZmZl0KWyAgICAwLjA1NzY4OF0gUE06IGhp
YmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHg3YWMwMDAwMC0weDdm
ZmZmZmZmXQpbICAgIDAuMDU3NjkxXSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZl
IG1lbW9yeTogW21lbSAweDgwMDAwMDAwLTB4ZDM3MDhmZmZdClsgICAgMC4wNTc2OTNdIFBNOiBo
aWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4ZDM3MDkwMDAtMHhk
MzcwOWZmZl0KWyAgICAwLjA1NzY5Nl0gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2
ZSBtZW1vcnk6IFttZW0gMHhkMzcwYTAwMC0weGZlMDQxZmZmXQpbICAgIDAuMDU3Njk5XSBQTTog
aGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZlMDQyMDAwLTB4
ZmUwNDRmZmZdClsgICAgMC4wNTc3MDJdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3Nh
dmUgbWVtb3J5OiBbbWVtIDB4ZmUwNDUwMDAtMHhmZThmZmZmZl0KWyAgICAwLjA1NzcwNV0gUE06
IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHhmZTkwMDAwMC0w
eGZlOTAyZmZmXQpbICAgIDAuMDU3NzA3XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9z
YXZlIG1lbW9yeTogW21lbSAweGZlOTAzMDAwLTB4ZmViZmZmZmZdClsgICAgMC4wNTc3MTBdIFBN
OiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBub3NhdmUgbWVtb3J5OiBbbWVtIDB4ZmVjMDAwMDAt
MHhmZWMwMGZmZl0KWyAgICAwLjA1NzcxM10gUE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5v
c2F2ZSBtZW1vcnk6IFttZW0gMHhmZWMwMTAwMC0weGZlZDAwZmZmXQpbICAgIDAuMDU3NzE1XSBQ
TTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQgbm9zYXZlIG1lbW9yeTogW21lbSAweGZlZDAxMDAw
LTB4ZmVkMDFmZmZdClsgICAgMC4wNTc3MThdIFBNOiBoaWJlcm5hdGlvbjogUmVnaXN0ZXJlZCBu
b3NhdmUgbWVtb3J5OiBbbWVtIDB4ZmVkMDIwMDAtMHhmZWRmZmZmZl0KWyAgICAwLjA1NzcyMV0g
UE06IGhpYmVybmF0aW9uOiBSZWdpc3RlcmVkIG5vc2F2ZSBtZW1vcnk6IFttZW0gMHhmZWUwMDAw
MC0weGZlZTAwZmZmXQpbICAgIDAuMDU3NzI0XSBQTTogaGliZXJuYXRpb246IFJlZ2lzdGVyZWQg
bm9zYXZlIG1lbW9yeTogW21lbSAweGZlZTAxMDAwLTB4ZmZmZmZmZmZdClsgICAgMC4wNTc3Mjld
IFttZW0gMHg4MDAwMDAwMC0weGQzNzA4ZmZmXSBhdmFpbGFibGUgZm9yIFBDSSBkZXZpY2VzClsg
ICAgMC4wNTc3MzNdIEJvb3RpbmcgcGFyYXZpcnR1YWxpemVkIGtlcm5lbCBvbiBiYXJlIGhhcmR3
YXJlClsgICAgMC4wNTc3NDBdIGNsb2Nrc291cmNlOiByZWZpbmVkLWppZmZpZXM6IG1hc2s6IDB4
ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDE5MTA5Njk5NDAz
OTE0MTkgbnMKWyAgICAwLjA3NjQ3N10gc2V0dXBfcGVyY3B1OiBOUl9DUFVTOjgxOTIgbnJfY3B1
bWFza19iaXRzOjQgbnJfY3B1X2lkczo0IG5yX25vZGVfaWRzOjEKWyAgICAwLjA3NzI1N10gcGVy
Y3B1OiBFbWJlZGRlZCA2NyBwYWdlcy9jcHUgczIzNzU2OCByODE5MiBkMjg2NzIgdTUyNDI4OApb
ICAgIDAuMDc3Mjg1XSBwY3B1LWFsbG9jOiBzMjM3NTY4IHI4MTkyIGQyODY3MiB1NTI0Mjg4IGFs
bG9jPTEqMjA5NzE1MgpbICAgIDAuMDc3Mjk0XSBwY3B1LWFsbG9jOiBbMF0gMCAxIDIgMyAKWyAg
ICAwLjA3NzM2OF0gS2VybmVsIGNvbW1hbmQgbGluZTogQk9PVF9JTUFHRT0vdm1saW51ei1saW51
eCByb290PVVVSUQ9ZGIzOWQxZmUtMDQyMy00NTAyLTgxYjItNTYwNWI5Zjk2OWEwIHJ3IHJvb3Rm
bGFncz1zdWJ2b2w9QCB6c3dhcC5lbmFibGVkPTAgcm9vdGZzdHlwZT1idHJmcyBsb2dsZXZlbD0z
IHF1aWV0IGkyY19oaWQuZHluZGJnClsgICAgMC4wNzc3NThdIFVua25vd24ga2VybmVsIGNvbW1h
bmQgbGluZSBwYXJhbWV0ZXJzICJCT09UX0lNQUdFPS92bWxpbnV6LWxpbnV4Iiwgd2lsbCBiZSBw
YXNzZWQgdG8gdXNlciBzcGFjZS4KWyAgICAwLjA3Nzc5NV0gcHJpbnRrOiBsb2cgYnVmZmVyIGRh
dGEgKyBtZXRhIGRhdGE6IDEzMTA3MiArIDQ1ODc1MiA9IDU4OTgyNCBieXRlcwpbICAgIDAuMDc5
OTk0XSBEZW50cnkgY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDQ4NTc2IChvcmRlcjogMTEs
IDgzODg2MDggYnl0ZXMsIGxpbmVhcikKWyAgICAwLjA4MTEyMl0gSW5vZGUtY2FjaGUgaGFzaCB0
YWJsZSBlbnRyaWVzOiA1MjQyODggKG9yZGVyOiAxMCwgNDE5NDMwNCBieXRlcywgbGluZWFyKQpb
ICAgIDAuMDgxMjk4XSBGYWxsYmFjayBvcmRlciBmb3IgTm9kZSAwOiAwIApbICAgIDAuMDgxMzE1
XSBCdWlsdCAxIHpvbmVsaXN0cywgbW9iaWxpdHkgZ3JvdXBpbmcgb24uICBUb3RhbCBwYWdlczog
MjA1MTI0NwpbICAgIDAuMDgxMzIwXSBQb2xpY3kgem9uZTogTm9ybWFsClsgICAgMC4wODE5OTNd
IG1lbSBhdXRvLWluaXQ6IHN0YWNrOmFsbCh6ZXJvKSwgaGVhcCBhbGxvYzpvbiwgaGVhcCBmcmVl
Om9mZgpbICAgIDAuMDgyMDIxXSBzb2Z0d2FyZSBJTyBUTEI6IGFyZWEgbnVtIDQuClsgICAgMC4x
ODc0NTVdIFNMVUI6IEhXYWxpZ249NjQsIE9yZGVyPTAtMywgTWluT2JqZWN0cz0wLCBDUFVzPTQs
IE5vZGVzPTEKWyAgICAwLjE4NzU4NV0gZnRyYWNlOiBhbGxvY2F0aW5nIDUxNzA2IGVudHJpZXMg
aW4gMjAyIHBhZ2VzClsgICAgMC4yNTE4MzFdIGZ0cmFjZTogYWxsb2NhdGVkIDIwMiBwYWdlcyB3
aXRoIDQgZ3JvdXBzClsgICAgMC4yNTIxMTZdIER5bmFtaWMgUHJlZW1wdDogZnVsbApbICAgIDAu
MjUyMjUwXSByY3U6IFByZWVtcHRpYmxlIGhpZXJhcmNoaWNhbCBSQ1UgaW1wbGVtZW50YXRpb24u
ClsgICAgMC4yNTIyNTNdIHJjdTogCVJDVSByZXN0cmljdGluZyBDUFVzIGZyb20gTlJfQ1BVUz04
MTkyIHRvIG5yX2NwdV9pZHM9NC4KWyAgICAwLjI1MjI1N10gcmN1OiAJUkNVIHByaW9yaXR5IGJv
b3N0aW5nOiBwcmlvcml0eSAxIGRlbGF5IDUwMCBtcy4KWyAgICAwLjI1MjI2MF0gCVRyYW1wb2xp
bmUgdmFyaWFudCBvZiBUYXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAwLjI1MjI2Ml0gCVJ1ZGUgdmFy
aWFudCBvZiBUYXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAwLjI1MjI2NF0gCVRyYWNpbmcgdmFyaWFu
dCBvZiBUYXNrcyBSQ1UgZW5hYmxlZC4KWyAgICAwLjI1MjI2Nl0gcmN1OiBSQ1UgY2FsY3VsYXRl
ZCB2YWx1ZSBvZiBzY2hlZHVsZXItZW5saXN0bWVudCBkZWxheSBpcyAxMDAgamlmZmllcy4KWyAg
ICAwLjI1MjI2OF0gcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVhZj0x
NiwgbnJfY3B1X2lkcz00ClsgICAgMC4yNTIyODhdIFJDVSBUYXNrczogU2V0dGluZyBzaGlmdCB0
byAyIGFuZCBsaW0gdG8gMSByY3VfdGFza19jYl9hZGp1c3Q9MSByY3VfdGFza19jcHVfaWRzPTQu
ClsgICAgMC4yNTIyOTRdIFJDVSBUYXNrcyBSdWRlOiBTZXR0aW5nIHNoaWZ0IHRvIDIgYW5kIGxp
bSB0byAxIHJjdV90YXNrX2NiX2FkanVzdD0xIHJjdV90YXNrX2NwdV9pZHM9NC4KWyAgICAwLjI1
MjMwMF0gUkNVIFRhc2tzIFRyYWNlOiBTZXR0aW5nIHNoaWZ0IHRvIDIgYW5kIGxpbSB0byAxIHJj
dV90YXNrX2NiX2FkanVzdD0xIHJjdV90YXNrX2NwdV9pZHM9NC4KWyAgICAwLjI3MzQ5MF0gTlJf
SVJRUzogNTI0NTQ0LCBucl9pcnFzOiAxMDI0LCBwcmVhbGxvY2F0ZWQgaXJxczogMTYKWyAgICAw
LjI3MzkwM10gcmN1OiBzcmN1X2luaXQ6IFNldHRpbmcgc3JjdV9zdHJ1Y3Qgc2l6ZXMgYmFzZWQg
b24gY29udGVudGlvbi4KWyAgICAwLjI3NDMzMl0ga2ZlbmNlOiBpbml0aWFsaXplZCAtIHVzaW5n
IDIwOTcxNTIgYnl0ZXMgZm9yIDI1NSBvYmplY3RzIGF0IDB4KF9fX19wdHJ2YWxfX19fKS0weChf
X19fcHRydmFsX19fXykKWyAgICAwLjI3NDQ0MV0gQ29uc29sZTogY29sb3VyIGR1bW15IGRldmlj
ZSA4MHgyNQpbICAgIDAuMjc0NDUwXSBwcmludGs6IGxlZ2FjeSBjb25zb2xlIFt0dHkwXSBlbmFi
bGVkClsgICAgMC4yNzQ2MzddIEFDUEk6IENvcmUgcmV2aXNpb24gMjAyNDA4MjcKWyAgICAwLjI3
NTI0OF0gY2xvY2tzb3VyY2U6IGhwZXQ6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhm
ZmZmZmZmZiwgbWF4X2lkbGVfbnM6IDk5NTQ0ODE0OTIwIG5zClsgICAgMC4yNzUzNzBdIEFQSUM6
IFN3aXRjaCB0byBzeW1tZXRyaWMgSS9PIG1vZGUgc2V0dXAKWyAgICAwLjI3NTM3N10gRE1BUjog
SG9zdCBhZGRyZXNzIHdpZHRoIDM5ClsgICAgMC4yNzUzODJdIERNQVI6IERSSEQgYmFzZTogMHgw
MDAwMDBmZWQ2NDAwMCBmbGFnczogMHgwClsgICAgMC4yNzU0MDJdIERNQVI6IGRtYXIwOiByZWdf
YmFzZV9hZGRyIGZlZDY0MDAwIHZlciAxOjAgY2FwIDFjMDAwMGM0MDY2MDQ2MiBlY2FwIDllMmZm
MDUwNWUKWyAgICAwLjI3NTQxMV0gRE1BUjogRFJIRCBiYXNlOiAweDAwMDAwMGZlZDY1MDAwIGZs
YWdzOiAweDEKWyAgICAwLjI3NTQyNV0gRE1BUjogZG1hcjE6IHJlZ19iYXNlX2FkZHIgZmVkNjUw
MDAgdmVyIDE6MCBjYXAgZDIwMDhjNDA2NjA0NjIgZWNhcCBmMDUwZGEKWyAgICAwLjI3NTQzNF0g
RE1BUjogUk1SUiBiYXNlOiAweDAwMDAwMDc5OWRkMDAwIGVuZDogMHgwMDAwMDA3OTlmY2ZmZgpb
ICAgIDAuMjc1NDQwXSBETUFSOiBSTVJSIGJhc2U6IDB4MDAwMDAwN2I4MDAwMDAgZW5kOiAweDAw
MDAwMDdmZmZmZmZmClsgICAgMC4yNzU0NDddIERNQVItSVI6IElPQVBJQyBpZCAxIHVuZGVyIERS
SEQgYmFzZSAgMHhmZWQ2NTAwMCBJT01NVSAxClsgICAgMC4yNzU0NTJdIERNQVItSVI6IEhQRVQg
aWQgMCB1bmRlciBEUkhEIGJhc2UgMHhmZWQ2NTAwMApbICAgIDAuMjc1NDU2XSBETUFSLUlSOiBR
dWV1ZWQgaW52YWxpZGF0aW9uIHdpbGwgYmUgZW5hYmxlZCB0byBzdXBwb3J0IHgyYXBpYyBhbmQg
SW50ci1yZW1hcHBpbmcuClsgICAgMC4yNzgxMDddIERNQVItSVI6IEVuYWJsZWQgSVJRIHJlbWFw
cGluZyBpbiB4MmFwaWMgbW9kZQpbICAgIDAuMjc4MTE3XSB4MmFwaWMgZW5hYmxlZApbICAgIDAu
Mjc4MjkzXSBBUElDOiBTd2l0Y2hlZCBBUElDIHJvdXRpbmcgdG86IGNsdXN0ZXIgeDJhcGljClsg
ICAgMC4yODI5ODRdIC4uVElNRVI6IHZlY3Rvcj0weDMwIGFwaWMxPTAgcGluMT0yIGFwaWMyPS0x
IHBpbjI9LTEKWyAgICAwLjI4NzMxNF0gY2xvY2tzb3VyY2U6IHRzYy1lYXJseTogbWFzazogMHhm
ZmZmZmZmZmZmZmZmZmZmIG1heF9jeWNsZXM6IDB4ZmM2NmY0ZmM3YywgbWF4X2lkbGVfbnM6IDQ0
MDc5NTIyNDI0NiBucwpbICAgIDAuMjg3MzM2XSBDYWxpYnJhdGluZyBkZWxheSBsb29wIChza2lw
cGVkKSwgdmFsdWUgY2FsY3VsYXRlZCB1c2luZyB0aW1lciBmcmVxdWVuY3kuLiAyMTg4LjgwIEJv
Z29NSVBTIChscGo9MTA5NDQwMCkKWyAgICAwLjI4NzQxNl0geDg2L2NwdTogU0dYIGRpc2FibGVk
IG9yIHVuc3VwcG9ydGVkIGJ5IEJJT1MuClsgICAgMC4yODc0MzddIENQVTA6IFRoZXJtYWwgbW9u
aXRvcmluZyBlbmFibGVkIChUTTEpClsgICAgMC4yODc0NDRdIHg4Ni9jcHU6IFVzZXIgTW9kZSBJ
bnN0cnVjdGlvbiBQcmV2ZW50aW9uIChVTUlQKSBhY3RpdmF0ZWQKWyAgICAwLjI4NzU3MV0gTGFz
dCBsZXZlbCBpVExCIGVudHJpZXM6IDRLQiAwLCAyTUIgMCwgNE1CIDAKWyAgICAwLjI4NzU3Nl0g
TGFzdCBsZXZlbCBkVExCIGVudHJpZXM6IDRLQiAwLCAyTUIgMCwgNE1CIDAsIDFHQiAwClsgICAg
MC4yODc1ODZdIHByb2Nlc3M6IHVzaW5nIG13YWl0IGluIGlkbGUgdGhyZWFkcwpbICAgIDAuMjg3
NTkzXSBTcGVjdHJlIFYxIDogTWl0aWdhdGlvbjogdXNlcmNvcHkvc3dhcGdzIGJhcnJpZXJzIGFu
ZCBfX3VzZXIgcG9pbnRlciBzYW5pdGl6YXRpb24KWyAgICAwLjI4NzYwMl0gU3BlY3RyZSBWMiA6
IFNwZWN0cmUgQkhJIG1pdGlnYXRpb246IFNXIEJIQiBjbGVhcmluZyBvbiBzeXNjYWxsIGFuZCBW
TSBleGl0ClsgICAgMC4yODc2MDddIFNwZWN0cmUgVjIgOiBNaXRpZ2F0aW9uOiBFbmhhbmNlZCAv
IEF1dG9tYXRpYyBJQlJTClsgICAgMC4yODc2MTFdIFNwZWN0cmUgVjIgOiBTcGVjdHJlIHYyIC8g
U3BlY3RyZVJTQiBtaXRpZ2F0aW9uOiBGaWxsaW5nIFJTQiBvbiBjb250ZXh0IHN3aXRjaApbICAg
IDAuMjg3NjE5XSBTcGVjdHJlIFYyIDogbWl0aWdhdGlvbjogRW5hYmxpbmcgY29uZGl0aW9uYWwg
SW5kaXJlY3QgQnJhbmNoIFByZWRpY3Rpb24gQmFycmllcgpbICAgIDAuMjg3NjI1XSBTcGVjdWxh
dGl2ZSBTdG9yZSBCeXBhc3M6IE1pdGlnYXRpb246IFNwZWN1bGF0aXZlIFN0b3JlIEJ5cGFzcyBk
aXNhYmxlZCB2aWEgcHJjdGwKWyAgICAwLjI4NzYyOV0gUmVnaXN0ZXIgRmlsZSBEYXRhIFNhbXBs
aW5nOiBNaXRpZ2F0aW9uOiBDbGVhciBSZWdpc3RlciBGaWxlClsgICAgMC4yODc2NDJdIHg4Ni9m
cHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwMTogJ3g4NyBmbG9hdGluZyBwb2ludCBy
ZWdpc3RlcnMnClsgICAgMC4yODc2NDddIHg4Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVy
ZSAweDAwMjogJ1NTRSByZWdpc3RlcnMnClsgICAgMC4yODc2NTFdIHg4Ni9mcHU6IFN1cHBvcnRp
bmcgWFNBVkUgZmVhdHVyZSAweDAwODogJ01QWCBib3VuZHMgcmVnaXN0ZXJzJwpbICAgIDAuMjg3
NjU0XSB4ODYvZnB1OiBTdXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMTA6ICdNUFggQ1NSJwpb
ICAgIDAuMjg3NjU5XSB4ODYvZnB1OiB4c3RhdGVfb2Zmc2V0WzNdOiAgNTc2LCB4c3RhdGVfc2l6
ZXNbM106ICAgNjQKWyAgICAwLjI4NzY2NF0geDg2L2ZwdTogeHN0YXRlX29mZnNldFs0XTogIDY0
MCwgeHN0YXRlX3NpemVzWzRdOiAgIDY0ClsgICAgMC4yODc2NjldIHg4Ni9mcHU6IEVuYWJsZWQg
eHN0YXRlIGZlYXR1cmVzIDB4MWIsIGNvbnRleHQgc2l6ZSBpcyA3MDQgYnl0ZXMsIHVzaW5nICdj
b21wYWN0ZWQnIGZvcm1hdC4KWyAgICAwLjM3MzY1OV0gRnJlZWluZyBTTVAgYWx0ZXJuYXRpdmVz
IG1lbW9yeTogNDBLClsgICAgMC4zNzM2NzVdIHBpZF9tYXg6IGRlZmF1bHQ6IDMyNzY4IG1pbmlt
dW06IDMwMQpbICAgIDAuMzgwMjQyXSBMU006IGluaXRpYWxpemluZyBsc209Y2FwYWJpbGl0eSxs
YW5kbG9jayxsb2NrZG93bix5YW1hLGJwZgpbICAgIDAuMzgwNDg0XSBsYW5kbG9jazogVXAgYW5k
IHJ1bm5pbmcuClsgICAgMC4zODA0OTRdIFlhbWE6IGJlY29taW5nIG1pbmRmdWwuClsgICAgMC4z
ODEwMzFdIExTTSBzdXBwb3J0IGZvciBlQlBGIGFjdGl2ZQpbICAgIDAuMzgxMTM0XSBNb3VudC1j
YWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDE2Mzg0IChvcmRlcjogNSwgMTMxMDcyIGJ5dGVzLCBs
aW5lYXIpClsgICAgMC4zODExNzRdIE1vdW50cG9pbnQtY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVz
OiAxNjM4NCAob3JkZXI6IDUsIDEzMTA3MiBieXRlcywgbGluZWFyKQpbICAgIDAuMzgxOTY4XSBz
bXBib290OiBDUFUwOiBJbnRlbChSKSBQZW50aXVtKFIpIFNpbHZlciBONTAzMCBDUFUgQCAxLjEw
R0h6IChmYW1pbHk6IDB4NiwgbW9kZWw6IDB4N2EsIHN0ZXBwaW5nOiAweDgpClsgICAgMC4zODM2
NDVdIFBlcmZvcm1hbmNlIEV2ZW50czogUEVCUyBmbXQzKywgR29sZG1vbnQgcGx1cyBldmVudHMs
IDMyLWRlZXAgTEJSLCBmdWxsLXdpZHRoIGNvdW50ZXJzLCBJbnRlbCBQTVUgZHJpdmVyLgpbICAg
IDAuMzgzNzEwXSAuLi4gdmVyc2lvbjogICAgICAgICAgICAgICAgNApbICAgIDAuMzgzNzEzXSAu
Li4gYml0IHdpZHRoOiAgICAgICAgICAgICAgNDgKWyAgICAwLjM4MzcxNl0gLi4uIGdlbmVyaWMg
cmVnaXN0ZXJzOiAgICAgIDQKWyAgICAwLjM4MzcxOF0gLi4uIHZhbHVlIG1hc2s6ICAgICAgICAg
ICAgIDAwMDBmZmZmZmZmZmZmZmYKWyAgICAwLjM4MzcyMl0gLi4uIG1heCBwZXJpb2Q6ICAgICAg
ICAgICAgIDAwMDA3ZmZmZmZmZmZmZmYKWyAgICAwLjM4MzcyNV0gLi4uIGZpeGVkLXB1cnBvc2Ug
ZXZlbnRzOiAgIDMKWyAgICAwLjM4MzcyN10gLi4uIGV2ZW50IG1hc2s6ICAgICAgICAgICAgIDAw
MDAwMDA3MDAwMDAwMGYKWyAgICAwLjM4Mzk4NF0gc2lnbmFsOiBtYXggc2lnZnJhbWUgc2l6ZTog
MjAzMgpbICAgIDAuMzg0MDI0XSBFc3RpbWF0ZWQgcmF0aW8gb2YgYXZlcmFnZSBtYXggZnJlcXVl
bmN5IGJ5IGJhc2UgZnJlcXVlbmN5ICh0aW1lcyAxMDI0KTogMjg4NQpbICAgIDAuMzkxOTkzXSBy
Y3U6IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9uLgpbICAgIDAuMzkyMDAzXSByY3U6
IAlNYXggcGhhc2Ugbm8tZGVsYXkgaW5zdGFuY2VzIGlzIDQwMC4KWyAgICAwLjM5MjI0OV0gVGlt
ZXIgbWlncmF0aW9uOiAxIGhpZXJhcmNoeSBsZXZlbHM7IDggY2hpbGRyZW4gcGVyIGdyb3VwOyAx
IGNyb3Nzbm9kZSBsZXZlbApbICAgIDAuMzkzNTQ1XSBOTUkgd2F0Y2hkb2c6IEVuYWJsZWQuIFBl
cm1hbmVudGx5IGNvbnN1bWVzIG9uZSBody1QTVUgY291bnRlci4KWyAgICAwLjM5MzcyOV0gc21w
OiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAgICAwLjM5NDYwMF0gc21wYm9vdDog
eDg2OiBCb290aW5nIFNNUCBjb25maWd1cmF0aW9uOgpbICAgIDAuMzk0NjA1XSAuLi4uIG5vZGUg
ICMwLCBDUFVzOiAgICAgICMxICMyICMzClsgICAgMC4zOTgzNTJdIHNtcDogQnJvdWdodCB1cCAx
IG5vZGUsIDQgQ1BVcwpbICAgIDAuMzk4MzY4XSBzbXBib290OiBUb3RhbCBvZiA0IHByb2Nlc3Nv
cnMgYWN0aXZhdGVkICg4NzU1LjIwIEJvZ29NSVBTKQpbICAgIDAuMzk4NzAyXSBNZW1vcnk6IDc4
OTE5NTJLLzgyMDQ5ODhLIGF2YWlsYWJsZSAoMTg0MzJLIGtlcm5lbCBjb2RlLCAyNjkzSyByd2Rh
dGEsIDE1MTY0SyByb2RhdGEsIDQzMTZLIGluaXQsIDM4NzZLIGJzcywgMzAwNTQ4SyByZXNlcnZl
ZCwgMEsgY21hLXJlc2VydmVkKQpbICAgIDAuNDAwMDQxXSBkZXZ0bXBmczogaW5pdGlhbGl6ZWQK
WyAgICAwLjQwMDA0MV0geDg2L21tOiBNZW1vcnkgYmxvY2sgc2l6ZTogMTI4TUIKWyAgICAwLjQw
Mjc4Nl0gQUNQSTogUE06IFJlZ2lzdGVyaW5nIEFDUEkgTlZTIHJlZ2lvbiBbbWVtIDB4NzlhNjIw
MDAtMHg3OWFjYWZmZl0gKDQzMDA4MCBieXRlcykKWyAgICAwLjQwMjc4Nl0gY2xvY2tzb3VyY2U6
IGppZmZpZXM6IG1hc2s6IDB4ZmZmZmZmZmYgbWF4X2N5Y2xlczogMHhmZmZmZmZmZiwgbWF4X2lk
bGVfbnM6IDE5MTEyNjA0NDYyNzUwMDAgbnMKWyAgICAwLjQwMjc4Nl0gZnV0ZXggaGFzaCB0YWJs
ZSBlbnRyaWVzOiAxMDI0IChvcmRlcjogNCwgNjU1MzYgYnl0ZXMsIGxpbmVhcikKWyAgICAwLjQw
MzQ0N10gcGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQpbICAgIDAu
NDAzNzMwXSBQTTogUlRDIHRpbWU6IDE2OjUyOjAxLCBkYXRlOiAyMDI1LTAzLTIwClsgICAgMC40
MDUzOTRdIE5FVDogUmVnaXN0ZXJlZCBQRl9ORVRMSU5LL1BGX1JPVVRFIHByb3RvY29sIGZhbWls
eQpbICAgIDAuNDA2MTEwXSBETUE6IHByZWFsbG9jYXRlZCAxMDI0IEtpQiBHRlBfS0VSTkVMIHBv
b2wgZm9yIGF0b21pYyBhbGxvY2F0aW9ucwpbICAgIDAuNDA2MzkwXSBETUE6IHByZWFsbG9jYXRl
ZCAxMDI0IEtpQiBHRlBfS0VSTkVMfEdGUF9ETUEgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRpb25z
ClsgICAgMC40MDY2NjFdIERNQTogcHJlYWxsb2NhdGVkIDEwMjQgS2lCIEdGUF9LRVJORUx8R0ZQ
X0RNQTMyIHBvb2wgZm9yIGF0b21pYyBhbGxvY2F0aW9ucwpbICAgIDAuNDA2Njk0XSBhdWRpdDog
aW5pdGlhbGl6aW5nIG5ldGxpbmsgc3Vic3lzIChkaXNhYmxlZCkKWyAgICAwLjQwNjczNV0gYXVk
aXQ6IHR5cGU9MjAwMCBhdWRpdCgxNzQyNDg5NTIxLjEyNzoxKTogc3RhdGU9aW5pdGlhbGl6ZWQg
YXVkaXRfZW5hYmxlZD0wIHJlcz0xClsgICAgMC40MDY3MzVdIHRoZXJtYWxfc3lzOiBSZWdpc3Rl
cmVkIHRoZXJtYWwgZ292ZXJub3IgJ2ZhaXJfc2hhcmUnClsgICAgMC40MDY3MzVdIHRoZXJtYWxf
c3lzOiBSZWdpc3RlcmVkIHRoZXJtYWwgZ292ZXJub3IgJ2JhbmdfYmFuZycKWyAgICAwLjQwNjcz
NV0gdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93aXNlJwpb
ICAgIDAuNDA2NzM1XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICd1
c2VyX3NwYWNlJwpbICAgIDAuNDA2NzM1XSB0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFs
IGdvdmVybm9yICdwb3dlcl9hbGxvY2F0b3InClsgICAgMC40MDY3MzVdIGNwdWlkbGU6IHVzaW5n
IGdvdmVybm9yIGxhZGRlcgpbICAgIDAuNDA2NzM1XSBjcHVpZGxlOiB1c2luZyBnb3Zlcm5vciBt
ZW51ClsgICAgMC40MDc1MzFdIGFjcGlwaHA6IEFDUEkgSG90IFBsdWcgUENJIENvbnRyb2xsZXIg
RHJpdmVyIHZlcnNpb246IDAuNQpbICAgIDAuNDA3NjUyXSBQQ0k6IEVDQU0gW21lbSAweGUwMDAw
MDAwLTB4ZWZmZmZmZmZdIChiYXNlIDB4ZTAwMDAwMDApIGZvciBkb21haW4gMDAwMCBbYnVzIDAw
LWZmXQpbICAgIDAuNDA3NjkzXSBQQ0k6IFVzaW5nIGNvbmZpZ3VyYXRpb24gdHlwZSAxIGZvciBi
YXNlIGFjY2VzcwpbICAgIDAuNDA4Mzk0XSBrcHJvYmVzOiBrcHJvYmUganVtcC1vcHRpbWl6YXRp
b24gaXMgZW5hYmxlZC4gQWxsIGtwcm9iZXMgYXJlIG9wdGltaXplZCBpZiBwb3NzaWJsZS4KWyAg
ICAwLjQwODU0N10gSHVnZVRMQjogcmVnaXN0ZXJlZCAxLjAwIEdpQiBwYWdlIHNpemUsIHByZS1h
bGxvY2F0ZWQgMCBwYWdlcwpbICAgIDAuNDA4NTQ3XSBIdWdlVExCOiAxNjM4MCBLaUIgdm1lbW1h
cCBjYW4gYmUgZnJlZWQgZm9yIGEgMS4wMCBHaUIgcGFnZQpbICAgIDAuNDA4NTQ3XSBIdWdlVExC
OiByZWdpc3RlcmVkIDIuMDAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzClsg
ICAgMC40MDg1NDddIEh1Z2VUTEI6IDI4IEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSAy
LjAwIE1pQiBwYWdlClsgICAgMC40MTA1NTNdIEFDUEk6IEFkZGVkIF9PU0koTW9kdWxlIERldmlj
ZSkKWyAgICAwLjQxMDU1OV0gQUNQSTogQWRkZWQgX09TSShQcm9jZXNzb3IgRGV2aWNlKQpbICAg
IDAuNDEwNTYyXSBBQ1BJOiBBZGRlZCBfT1NJKDMuMCBfU0NQIEV4dGVuc2lvbnMpClsgICAgMC40
MTA1NjZdIEFDUEk6IEFkZGVkIF9PU0koUHJvY2Vzc29yIEFnZ3JlZ2F0b3IgRGV2aWNlKQpbICAg
IDAuNDQ4Njc0XSBBQ1BJOiAxMSBBQ1BJIEFNTCB0YWJsZXMgc3VjY2Vzc2Z1bGx5IGFjcXVpcmVk
IGFuZCBsb2FkZWQKWyAgICAwLjQ2MDI1MV0gQUNQSTogRHluYW1pYyBPRU0gVGFibGUgTG9hZDoK
WyAgICAwLjQ2MDI3NF0gQUNQSTogU1NEVCAweEZGRkY5QjI0MDAyNzlDMDAgMDAwMTkwICh2MDIg
UG1SZWYgIENwdTBDc3QgIDAwMDAzMDAxIElOVEwgMjAxNjA5MzApClsgICAgMC40NjMwNTFdIEFD
UEk6IER5bmFtaWMgT0VNIFRhYmxlIExvYWQ6ClsgICAgMC40NjMwNjhdIEFDUEk6IFNTRFQgMHhG
RkZGOUIyNDAwMjc5ODAwIDAwMDFFNiAodjAyIFBtUmVmICBBcElzdCAgICAwMDAwMzAwMCBJTlRM
IDIwMTYwOTMwKQpbICAgIDAuNDY1MzI3XSBBQ1BJOiBEeW5hbWljIE9FTSBUYWJsZSBMb2FkOgpb
ICAgIDAuNDY1MzQ1XSBBQ1BJOiBTU0RUIDB4RkZGRjlCMjQwMEQ4OTkwMCAwMDAwQzkgKHYwMiBQ
bVJlZiAgQXBDc3QgICAgMDAwMDMwMDAgSU5UTCAyMDE2MDkzMCkKWyAgICAwLjQ2OTcwNF0gQUNQ
STogRUM6IEVDIHN0YXJ0ZWQKWyAgICAwLjQ2OTcwOV0gQUNQSTogRUM6IGludGVycnVwdCBibG9j
a2VkClsgICAgMC41NzU1NjRdIEFDUEk6IEVDOiBFQ19DTUQvRUNfU0M9MHg2NiwgRUNfREFUQT0w
eDYyClsgICAgMC41NzU1NzRdIEFDUEk6IFxfU0JfLlBDSTAuU0JSRy5IX0VDOiBCb290IERTRFQg
RUMgdXNlZCB0byBoYW5kbGUgdHJhbnNhY3Rpb25zClsgICAgMC41NzU1ODBdIEFDUEk6IEludGVy
cHJldGVyIGVuYWJsZWQKWyAgICAwLjU3NTY1NF0gQUNQSTogUE06IChzdXBwb3J0cyBTMCBTMyBT
NCBTNSkKWyAgICAwLjU3NTY1OV0gQUNQSTogVXNpbmcgSU9BUElDIGZvciBpbnRlcnJ1cHQgcm91
dGluZwpbICAgIDAuNTc4NDE3XSBQQ0k6IFVzaW5nIGhvc3QgYnJpZGdlIHdpbmRvd3MgZnJvbSBB
Q1BJOyBpZiBuZWNlc3NhcnksIHVzZSAicGNpPW5vY3JzIiBhbmQgcmVwb3J0IGEgYnVnClsgICAg
MC41Nzg0MjNdIFBDSTogVXNpbmcgRTgyMCByZXNlcnZhdGlvbnMgZm9yIGhvc3QgYnJpZGdlIHdp
bmRvd3MKWyAgICAwLjU3OTQ5Nl0gQUNQSTogRW5hYmxlZCAxMSBHUEVzIGluIGJsb2NrIDAwIHRv
IDdGClsgICAgMC41ODU0NzddIEFDUEk6IFxfU0JfLlBDSTAuU0FUQS5QUlQwLlNQUFI6IE5ldyBw
b3dlciByZXNvdXJjZQpbICAgIDAuNTg1OTMxXSBBQ1BJOiBcX1NCXy5QQ0kwLlNBVEEuUFJUMS5T
UFBSOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjU4Njk1MF0gQUNQSTogXF9TQl8uUENJMC5Y
SENfLlJIVUIuSFMwMi5VUFBSOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjU4NzUyNl0gQUNQ
STogXF9TQl8uUENJMC5YSENfLlJIVUIuSFMwMy5CVFBSOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAg
ICAwLjU4ODE3N10gQUNQSTogXF9TQl8uUENJMC5YSENfLlJIVUIuSFMwNC5VUFBSOiBOZXcgcG93
ZXIgcmVzb3VyY2UKWyAgICAwLjU4ODcwOV0gQUNQSTogXF9TQl8uUENJMC5YSENfLlJIVUIuSFMw
NS5VUFBSOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjU4OTg4NF0gQUNQSTogXF9TQl8uUENJ
MC5YSENfLlJIVUIuSFMwNy5QWDA3OiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjU5MTE4Ml0g
QUNQSTogXF9TQl8uUENJMC5YSENfLlJIVUIuSFMwOS5JQlRVLkJUUFI6IE5ldyBwb3dlciByZXNv
dXJjZQpbICAgIDAuNTkyMDUwXSBBQ1BJOiBcX1NCXy5QQ0kwLlhIQ18uUkhVQi5TUzAyLlVQUFI6
IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAuNTkyOTk5XSBBQ1BJOiBcX1NCXy5QQ0kwLlhIQ18u
UkhVQi5TUzA0LlVQUFI6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAuNTkzNjgyXSBBQ1BJOiBc
X1NCXy5QQ0kwLlhIQ18uUkhVQi5TUzA1LlVQUFI6IE5ldyBwb3dlciByZXNvdXJjZQpbICAgIDAu
NTk0OTc5XSBBQ1BJOiBcX1NCXy5VU0JDOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjU5NTQ1
OV0gQUNQSTogXF9TQl8uUENJMC5MU1BSOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjYwMTYy
MF0gQUNQSTogXF9TQl8uU0RQUjogTmV3IHBvd2VyIHJlc291cmNlClsgICAgMC42MDc4NjhdIEFD
UEk6IFxfU0JfLlBDSTAuUlAwMS5QWFBfOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjcxMTI3
N10gQUNQSTogXF9TQl8uUENJMC5SUDAxLlBYU1guRFJTVDogTmV3IHBvd2VyIHJlc291cmNlClsg
ICAgMC43MTE4NDNdIEFDUEk6IFxfU0JfLlBDSTAuUlAwMi5QWFBfOiBOZXcgcG93ZXIgcmVzb3Vy
Y2UKWyAgICAwLjgxNTI2Nl0gQUNQSTogXF9TQl8uUENJMC5SUDAyLlBYU1guRFJTVDogTmV3IHBv
d2VyIHJlc291cmNlClsgICAgMC44MTU4MDJdIEFDUEk6IFxfU0JfLlBDSTAuUlAwMy5QWFBfOiBO
ZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjkxOTI1OF0gQUNQSTogXF9TQl8uUENJMC5SUDAzLlBY
U1guRFJTVDogTmV3IHBvd2VyIHJlc291cmNlClsgICAgMC45MTk2NjJdIEFDUEk6IFxfU0JfLlBD
STAuUlAwNC5QWFBfOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjkyMDU2M10gQUNQSTogXF9T
Ql8uUENJMC5SUDA0LlBYU1guRFJTVDogTmV3IHBvd2VyIHJlc291cmNlClsgICAgMC45MjEwOTRd
IEFDUEk6IFxfU0JfLlBDSTAuUlAwNS5QWFBfOiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAwLjky
MTk5M10gQUNQSTogXF9TQl8uUENJMC5SUDA1LlBYU1guRFJTVDogTmV3IHBvd2VyIHJlc291cmNl
ClsgICAgMC45MjI1NTVdIEFDUEk6IFxfU0JfLlBDSTAuUlAwNi5QWFBfOiBOZXcgcG93ZXIgcmVz
b3VyY2UKWyAgICAxLjAyNjI1OV0gQUNQSTogXF9TQl8uUENJMC5SUDA2LlBYU1guRFJTVDogTmV3
IHBvd2VyIHJlc291cmNlClsgICAgMS4wMjc1MTFdIEFDUEk6IFxfU0JfLlBDSTAuQ05WVy5XUlNU
OiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAxLjAyODE1NV0gQUNQSTogXF9TQl8uUENJMC5QQVVE
OiBOZXcgcG93ZXIgcmVzb3VyY2UKWyAgICAxLjA0MDEzOV0gQUNQSTogXF9UWl8uRk4wMDogTmV3
IHBvd2VyIHJlc291cmNlClsgICAgMS4wNDIzOTVdIEFDUEk6IFBDSSBSb290IEJyaWRnZSBbUENJ
MF0gKGRvbWFpbiAwMDAwIFtidXMgMDAtZmZdKQpbICAgIDEuMDQyNDE3XSBhY3BpIFBOUDBBMDg6
MDA6IF9PU0M6IE9TIHN1cHBvcnRzIFtFeHRlbmRlZENvbmZpZyBBU1BNIENsb2NrUE0gU2VnbWVu
dHMgTVNJIEVEUiBIUFgtVHlwZTNdClsgICAgMS4wNDQ2OThdIGFjcGkgUE5QMEEwODowMDogX09T
QzogT1Mgbm93IGNvbnRyb2xzIFtQQ0llSG90cGx1ZyBTSFBDSG90cGx1ZyBQTUUgQUVSIFBDSWVD
YXBhYmlsaXR5IExUUiBEUENdClsgICAgMS4wNDUwNzFdIGFjcGkgUE5QMEEwODowMDogaG9zdCBi
cmlkZ2Ugd2luZG93IFttZW0gMHgxMDAwMDAwMDEwMDAwIHdpbmRvd10gKGlnbm9yZWQsIG5vdCBD
UFUgYWRkcmVzc2FibGUpClsgICAgMS4wNDcyNTRdIFBDSSBob3N0IGJyaWRnZSB0byBidXMgMDAw
MDowMApbICAgIDEuMDQ3MjY4XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtp
byAgMHgwMDcwLTB4MDA3N10KWyAgICAxLjA0NzI3Nl0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1
cyByZXNvdXJjZSBbaW8gIDB4MDAwMC0weDAwNmYgd2luZG93XQpbICAgIDEuMDQ3MjgyXSBwY2lf
YnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFtpbyAgMHgwMDc4LTB4MGNmNyB3aW5kb3dd
ClsgICAgMS4wNDcyODddIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW2lvICAw
eDBkMDAtMHhmZmZmIHdpbmRvd10KWyAgICAxLjA0NzI5NF0gcGNpX2J1cyAwMDAwOjAwOiByb290
IGJ1cyByZXNvdXJjZSBbbWVtIDB4MDAwYTAwMDAtMHgwMDBmZmZmZiB3aW5kb3ddClsgICAgMS4w
NDczMDBdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweDdjMDAwMDAx
LTB4YmZmZmZmZmYgd2luZG93XQpbICAgIDEuMDQ3MzA1XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3Qg
YnVzIHJlc291cmNlIFttZW0gMHhlMDAwMDAwMC0weGVmZmZmZmZmIHdpbmRvd10KWyAgICAxLjA0
NzMxMF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4ZmVhMDAwMDAt
MHhmZWFmZmZmZiB3aW5kb3ddClsgICAgMS4wNDczMTVdIHBjaV9idXMgMDAwMDowMDogcm9vdCBi
dXMgcmVzb3VyY2UgW21lbSAweGZlZDAwMDAwLTB4ZmVkMDAzZmYgd2luZG93XQpbICAgIDEuMDQ3
MzE5XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHhmZWQwMTAwMC0w
eGZlZDAxZmZmIHdpbmRvd10KWyAgICAxLjA0NzMyNF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1
cyByZXNvdXJjZSBbbWVtIDB4ZmVkMDMwMDAtMHhmZWQwM2ZmZiB3aW5kb3ddClsgICAgMS4wNDcz
MjhdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW21lbSAweGZlZDA2MDAwLTB4
ZmVkMDZmZmYgd2luZG93XQpbICAgIDEuMDQ3MzM0XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVz
IHJlc291cmNlIFttZW0gMHhmZWQwODAwMC0weGZlZDA5ZmZmIHdpbmRvd10KWyAgICAxLjA0NzM0
MF0gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyByZXNvdXJjZSBbbWVtIDB4ZmVkODAwMDAtMHhm
ZWRiZmZmZiB3aW5kb3ddClsgICAgMS4wNDczNDRdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMg
cmVzb3VyY2UgW21lbSAweGZlZDFjMDAwLTB4ZmVkMWNmZmYgd2luZG93XQpbICAgIDEuMDQ3MzQ5
XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHhmZWUwMDAwMC0weGZl
ZWZmZmZmIHdpbmRvd10KWyAgICAxLjA0NzM1N10gcGNpX2J1cyAwMDAwOjAwOiByb290IGJ1cyBy
ZXNvdXJjZSBbYnVzIDAwLWZmXQpbICAgIDEuMjcyNDMyXSBwY2kgMDAwMDowMDowMC4wOiBbODA4
NjozMWYwXSB0eXBlIDAwIGNsYXNzIDB4MDYwMDAwIGNvbnZlbnRpb25hbCBQQ0kgZW5kcG9pbnQK
WyAgICAxLjI3Mjc1Ml0gcGNpIDAwMDA6MDA6MDAuMTogWzgwODY6MzE4Y10gdHlwZSAwMCBjbGFz
cyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yNzI3OTFdIHBjaSAw
MDAwOjAwOjAwLjE6IEJBUiAwIFttZW0gMHg4MDAwMDAwMC0weDgwMDA3ZmZmIDY0Yml0XQpbICAg
IDEuMjczMTIzXSBwY2kgMDAwMDowMDowMi4wOiBbODA4NjozMTg0XSB0eXBlIDAwIGNsYXNzIDB4
MDMwMDAwIFBDSWUgUm9vdCBDb21wbGV4IEludGVncmF0ZWQgRW5kcG9pbnQKWyAgICAxLjI3MzE0
NV0gcGNpIDAwMDA6MDA6MDIuMDogQkFSIDAgW21lbSAweGEwMDAwMDAwLTB4YTBmZmZmZmYgNjRi
aXRdClsgICAgMS4yNzMxNzVdIHBjaSAwMDAwOjAwOjAyLjA6IEJBUiAyIFttZW0gMHg5MDAwMDAw
MC0weDlmZmZmZmZmIDY0Yml0IHByZWZdClsgICAgMS4yNzMxODZdIHBjaSAwMDAwOjAwOjAyLjA6
IEJBUiA0IFtpbyAgMHhmMDAwLTB4ZjAzZl0KWyAgICAxLjI3MzIyOF0gcGNpIDAwMDA6MDA6MDIu
MDogVmlkZW8gZGV2aWNlIHdpdGggc2hhZG93ZWQgUk9NIGF0IFttZW0gMHgwMDBjMDAwMC0weDAw
MGRmZmZmXQpbICAgIDEuMjc0MDQ5XSBwY2kgMDAwMDowMDowYy4wOiBbODA4NjozMWRjXSB0eXBl
IDAwIGNsYXNzIDB4MDI4MDAwIFBDSWUgUm9vdCBDb21wbGV4IEludGVncmF0ZWQgRW5kcG9pbnQK
WyAgICAxLjI3NDEyN10gcGNpIDAwMDA6MDA6MGMuMDogQkFSIDAgW21lbSAweGExMjE0MDAwLTB4
YTEyMTdmZmYgNjRiaXRdClsgICAgMS4yNzQ0MjhdIHBjaSAwMDAwOjAwOjBjLjA6IFBNRSMgc3Vw
cG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xkClsgICAgMS4yNzQ4MTZdIHBjaSAwMDAwOjAwOjBl
LjA6IFs4MDg2OjMxOThdIHR5cGUgMDAgY2xhc3MgMHgwNDAzMDAgUENJZSBSb290IENvbXBsZXgg
SW50ZWdyYXRlZCBFbmRwb2ludApbICAgIDEuMjc0ODQ3XSBwY2kgMDAwMDowMDowZS4wOiBCQVIg
MCBbbWVtIDB4YTEyMTAwMDAtMHhhMTIxM2ZmZiA2NGJpdF0KWyAgICAxLjI3NDg4NF0gcGNpIDAw
MDA6MDA6MGUuMDogQkFSIDQgW21lbSAweGExMDAwMDAwLTB4YTEwZmZmZmYgNjRiaXRdClsgICAg
MS4yNzQ5NzRdIHBjaSAwMDAwOjAwOjBlLjA6IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3Qg
RDNjb2xkClsgICAgMS4yNzk3MzNdIHBjaSAwMDAwOjAwOjBmLjA6IFs4MDg2OjMxOWFdIHR5cGUg
MDAgY2xhc3MgMHgwNzgwMDAgY29udmVudGlvbmFsIFBDSSBlbmRwb2ludApbICAgIDEuMjc5Nzc5
XSBwY2kgMDAwMDowMDowZi4wOiBCQVIgMCBbbWVtIDB4YTEyM2QwMDAtMHhhMTIzZGZmZiA2NGJp
dF0KWyAgICAxLjI3OTk1Ml0gcGNpIDAwMDA6MDA6MGYuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBE
M2hvdApbICAgIDEuMjgwMjE2XSBwY2kgMDAwMDowMDoxMi4wOiBbODA4NjozMWUzXSB0eXBlIDAw
IGNsYXNzIDB4MDEwNjAxIGNvbnZlbnRpb25hbCBQQ0kgZW5kcG9pbnQKWyAgICAxLjI4MDI0MF0g
cGNpIDAwMDA6MDA6MTIuMDogQkFSIDAgW21lbSAweGExMjE4MDAwLTB4YTEyMTlmZmZdClsgICAg
MS4yODAyNTNdIHBjaSAwMDAwOjAwOjEyLjA6IEJBUiAxIFttZW0gMHhhMTIzYzAwMC0weGExMjNj
MGZmXQpbICAgIDEuMjgwMjY2XSBwY2kgMDAwMDowMDoxMi4wOiBCQVIgMiBbaW8gIDB4ZjA5MC0w
eGYwOTddClsgICAgMS4yODAyNzldIHBjaSAwMDAwOjAwOjEyLjA6IEJBUiAzIFtpbyAgMHhmMDgw
LTB4ZjA4M10KWyAgICAxLjI4MDI5Ml0gcGNpIDAwMDA6MDA6MTIuMDogQkFSIDQgW2lvICAweGYw
NjAtMHhmMDdmXQpbICAgIDEuMjgwMzA1XSBwY2kgMDAwMDowMDoxMi4wOiBCQVIgNSBbbWVtIDB4
YTEyM2IwMDAtMHhhMTIzYjdmZl0KWyAgICAxLjI4MDM3Ml0gcGNpIDAwMDA6MDA6MTIuMDogUE1F
IyBzdXBwb3J0ZWQgZnJvbSBEM2hvdApbICAgIDEuMjgwOTUyXSBwY2kgMDAwMDowMDoxMy4wOiBb
ODA4NjozMWQ4XSB0eXBlIDAxIGNsYXNzIDB4MDYwNDAwIFBDSWUgUm9vdCBQb3J0ClsgICAgMS4y
ODA5OTBdIHBjaSAwMDAwOjAwOjEzLjA6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMV0KWyAgICAxLjI4
MTA5OF0gcGNpIDAwMDA6MDA6MTMuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMCBEM2hvdCBEM2Nv
bGQKWyAgICAxLjI4MTQ0NV0gcGNpIDAwMDA6MDA6MTMuMTogWzgwODY6MzFkOV0gdHlwZSAwMSBj
bGFzcyAweDA2MDQwMCBQQ0llIFJvb3QgUG9ydApbICAgIDEuMjgxNTAxXSBwY2kgMDAwMDowMDox
My4xOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDJdClsgICAgMS4yODE2MDVdIHBjaSAwMDAwOjAwOjEz
LjE6IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xkClsgICAgMS4yODE4OTZdIHBj
aSAwMDAwOjAwOjEzLjI6IFs4MDg2OjMxZGFdIHR5cGUgMDEgY2xhc3MgMHgwNjA0MDAgUENJZSBS
b290IFBvcnQKWyAgICAxLjI4MTkzM10gcGNpIDAwMDA6MDA6MTMuMjogUENJIGJyaWRnZSB0byBb
YnVzIDAzXQpbICAgIDEuMjgxOTQ0XSBwY2kgMDAwMDowMDoxMy4yOiAgIGJyaWRnZSB3aW5kb3cg
W21lbSAweGExMTAwMDAwLTB4YTExZmZmZmZdClsgICAgMS4yODIwNDJdIHBjaSAwMDAwOjAwOjEz
LjI6IFBNRSMgc3VwcG9ydGVkIGZyb20gRDAgRDNob3QgRDNjb2xkClsgICAgMS4yODIzNDZdIHBj
aSAwMDAwOjAwOjE1LjA6IFs4MDg2OjMxYThdIHR5cGUgMDAgY2xhc3MgMHgwYzAzMzAgY29udmVu
dGlvbmFsIFBDSSBlbmRwb2ludApbICAgIDEuMjgyMzc2XSBwY2kgMDAwMDowMDoxNS4wOiBCQVIg
MCBbbWVtIDB4YTEyMDAwMDAtMHhhMTIwZmZmZiA2NGJpdF0KWyAgICAxLjI4MjQ4OV0gcGNpIDAw
MDA6MDA6MTUuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEM2hvdCBEM2NvbGQKWyAgICAxLjI4Mjgy
MF0gcGNpIDAwMDA6MDA6MTYuMDogWzgwODY6MzFhY10gdHlwZSAwMCBjbGFzcyAweDExODAwMCBj
b252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODI4NDldIHBjaSAwMDAwOjAwOjE2LjA6
IEJBUiAwIFttZW0gMHhhMTIzYTAwMC0weGExMjNhZmZmIDY0Yml0XQpbICAgIDEuMjgyODcxXSBw
Y2kgMDAwMDowMDoxNi4wOiBCQVIgMiBbbWVtIDB4YTEyMzkwMDAtMHhhMTIzOWZmZiA2NGJpdF0K
WyAgICAxLjI4MzE1Ml0gcGNpIDAwMDA6MDA6MTYuMTogWzgwODY6MzFhZV0gdHlwZSAwMCBjbGFz
cyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODMxODJdIHBjaSAw
MDAwOjAwOjE2LjE6IEJBUiAwIFttZW0gMHhhMTIzODAwMC0weGExMjM4ZmZmIDY0Yml0XQpbICAg
IDEuMjgzMjAzXSBwY2kgMDAwMDowMDoxNi4xOiBCQVIgMiBbbWVtIDB4YTEyMzcwMDAtMHhhMTIz
N2ZmZiA2NGJpdF0KWyAgICAxLjI4MzQ3N10gcGNpIDAwMDA6MDA6MTYuMjogWzgwODY6MzFiMF0g
dHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4y
ODM1MDddIHBjaSAwMDAwOjAwOjE2LjI6IEJBUiAwIFttZW0gMHhhMTIzNjAwMC0weGExMjM2ZmZm
IDY0Yml0XQpbICAgIDEuMjgzNTI5XSBwY2kgMDAwMDowMDoxNi4yOiBCQVIgMiBbbWVtIDB4YTEy
MzUwMDAtMHhhMTIzNWZmZiA2NGJpdF0KWyAgICAxLjI4MzgwOF0gcGNpIDAwMDA6MDA6MTYuMzog
WzgwODY6MzFiMl0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBv
aW50ClsgICAgMS4yODM4MzhdIHBjaSAwMDAwOjAwOjE2LjM6IEJBUiAwIFttZW0gMHhhMTIzNDAw
MC0weGExMjM0ZmZmIDY0Yml0XQpbICAgIDEuMjgzODU3XSBwY2kgMDAwMDowMDoxNi4zOiBCQVIg
MiBbbWVtIDB4YTEyMzMwMDAtMHhhMTIzM2ZmZiA2NGJpdF0KWyAgICAxLjI4NDE1N10gcGNpIDAw
MDA6MDA6MTcuMDogWzgwODY6MzFiNF0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9u
YWwgUENJIGVuZHBvaW50ClsgICAgMS4yODQxOTBdIHBjaSAwMDAwOjAwOjE3LjA6IEJBUiAwIFtt
ZW0gMHhhMTIzMjAwMC0weGExMjMyZmZmIDY0Yml0XQpbICAgIDEuMjg0MjEwXSBwY2kgMDAwMDow
MDoxNy4wOiBCQVIgMiBbbWVtIDB4YTEyMzEwMDAtMHhhMTIzMWZmZiA2NGJpdF0KWyAgICAxLjI4
NDQ4OF0gcGNpIDAwMDA6MDA6MTcuMTogWzgwODY6MzFiNl0gdHlwZSAwMCBjbGFzcyAweDExODAw
MCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODQ1MjBdIHBjaSAwMDAwOjAwOjE3
LjE6IEJBUiAwIFttZW0gMHhhMTIzMDAwMC0weGExMjMwZmZmIDY0Yml0XQpbICAgIDEuMjg0NTM5
XSBwY2kgMDAwMDowMDoxNy4xOiBCQVIgMiBbbWVtIDB4YTEyMmYwMDAtMHhhMTIyZmZmZiA2NGJp
dF0KWyAgICAxLjI4NDgwNF0gcGNpIDAwMDA6MDA6MTcuMjogWzgwODY6MzFiOF0gdHlwZSAwMCBj
bGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODQ4MzddIHBj
aSAwMDAwOjAwOjE3LjI6IEJBUiAwIFttZW0gMHhhMTIyZTAwMC0weGExMjJlZmZmIDY0Yml0XQpb
ICAgIDEuMjg0ODU3XSBwY2kgMDAwMDowMDoxNy4yOiBCQVIgMiBbbWVtIDB4YTEyMmQwMDAtMHhh
MTIyZGZmZiA2NGJpdF0KWyAgICAxLjI4NTEyNV0gcGNpIDAwMDA6MDA6MTcuMzogWzgwODY6MzFi
YV0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAg
MS4yODUxNTVdIHBjaSAwMDAwOjAwOjE3LjM6IEJBUiAwIFttZW0gMHhhMTIyYzAwMC0weGExMjJj
ZmZmIDY0Yml0XQpbICAgIDEuMjg1MTc2XSBwY2kgMDAwMDowMDoxNy4zOiBCQVIgMiBbbWVtIDB4
YTEyMmIwMDAtMHhhMTIyYmZmZiA2NGJpdF0KWyAgICAxLjI4NTQ4MV0gcGNpIDAwMDA6MDA6MTgu
MDogWzgwODY6MzFiY10gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVu
ZHBvaW50ClsgICAgMS4yODU1MTFdIHBjaSAwMDAwOjAwOjE4LjA6IEJBUiAwIFttZW0gMHhhMTIy
YTAwMC0weGExMjJhZmZmIDY0Yml0XQpbICAgIDEuMjg1NTMzXSBwY2kgMDAwMDowMDoxOC4wOiBC
QVIgMiBbbWVtIDB4YTEyMjkwMDAtMHhhMTIyOWZmZiA2NGJpdF0KWyAgICAxLjI4NTc5N10gcGNp
IDAwMDA6MDA6MTguMTogWzgwODY6MzFiZV0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50
aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODU4MjZdIHBjaSAwMDAwOjAwOjE4LjE6IEJBUiAw
IFttZW0gMHhhMTIyODAwMC0weGExMjI4ZmZmIDY0Yml0XQpbICAgIDEuMjg1ODQ5XSBwY2kgMDAw
MDowMDoxOC4xOiBCQVIgMiBbbWVtIDB4YTEyMjcwMDAtMHhhMTIyN2ZmZiA2NGJpdF0KWyAgICAx
LjI4NjExNV0gcGNpIDAwMDA6MDA6MTguMjogWzgwODY6MzFjMF0gdHlwZSAwMCBjbGFzcyAweDEx
ODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODYxNDVdIHBjaSAwMDAwOjAw
OjE4LjI6IEJBUiAwIFttZW0gMHhmZWExMDAwMC0weGZlYTEwZmZmIDY0Yml0XQpbICAgIDEuMjg2
MTY3XSBwY2kgMDAwMDowMDoxOC4yOiBCQVIgMiBbbWVtIDB4MDAwMDAwMDAtMHgwMDAwMGZmZiA2
NGJpdF0KWyAgICAxLjI4NjQ0NF0gcGNpIDAwMDA6MDA6MTguMzogWzgwODY6MzFlZV0gdHlwZSAw
MCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODY0NzRd
IHBjaSAwMDAwOjAwOjE4LjM6IEJBUiAwIFttZW0gMHhhMTIyNjAwMC0weGExMjI2ZmZmIDY0Yml0
XQpbICAgIDEuMjg2NDkzXSBwY2kgMDAwMDowMDoxOC4zOiBCQVIgMiBbbWVtIDB4YTEyMjUwMDAt
MHhhMTIyNWZmZiA2NGJpdF0KWyAgICAxLjI4Njc5NV0gcGNpIDAwMDA6MDA6MTkuMDogWzgwODY6
MzFjMl0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50Clsg
ICAgMS4yODY4MjVdIHBjaSAwMDAwOjAwOjE5LjA6IEJBUiAwIFttZW0gMHhhMTIyNDAwMC0weGEx
MjI0ZmZmIDY0Yml0XQpbICAgIDEuMjg2ODQ2XSBwY2kgMDAwMDowMDoxOS4wOiBCQVIgMiBbbWVt
IDB4YTEyMjMwMDAtMHhhMTIyM2ZmZiA2NGJpdF0KWyAgICAxLjI4NzExOV0gcGNpIDAwMDA6MDA6
MTkuMTogWzgwODY6MzFjNF0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252ZW50aW9uYWwgUENJ
IGVuZHBvaW50ClsgICAgMS4yODcxNTBdIHBjaSAwMDAwOjAwOjE5LjE6IEJBUiAwIFttZW0gMHhh
MTIyMjAwMC0weGExMjIyZmZmIDY0Yml0XQpbICAgIDEuMjg3MTY5XSBwY2kgMDAwMDowMDoxOS4x
OiBCQVIgMiBbbWVtIDB4YTEyMjEwMDAtMHhhMTIyMWZmZiA2NGJpdF0KWyAgICAxLjI4NzQzMF0g
cGNpIDAwMDA6MDA6MTkuMjogWzgwODY6MzFjNl0gdHlwZSAwMCBjbGFzcyAweDExODAwMCBjb252
ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODc0NjFdIHBjaSAwMDAwOjAwOjE5LjI6IEJB
UiAwIFttZW0gMHhhMTIyMDAwMC0weGExMjIwZmZmIDY0Yml0XQpbICAgIDEuMjg3NDgxXSBwY2kg
MDAwMDowMDoxOS4yOiBCQVIgMiBbbWVtIDB4YTEyMWYwMDAtMHhhMTIxZmZmZiA2NGJpdF0KWyAg
ICAxLjI4Nzc5NV0gcGNpIDAwMDA6MDA6MWMuMDogWzgwODY6MzFjY10gdHlwZSAwMCBjbGFzcyAw
eDA4MDUwMSBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODc4MjNdIHBjaSAwMDAw
OjAwOjFjLjA6IEJBUiAwIFttZW0gMHhhMTIxZTAwMC0weGExMjFlZmZmIDY0Yml0XQpbICAgIDEu
Mjg3ODQyXSBwY2kgMDAwMDowMDoxYy4wOiBCQVIgMiBbbWVtIDB4YTEyMWQwMDAtMHhhMTIxZGZm
ZiA2NGJpdF0KWyAgICAxLjI4ODQ0Ml0gcGNpIDAwMDA6MDA6MWUuMDogWzgwODY6MzFkMF0gdHlw
ZSAwMCBjbGFzcyAweDA4MDUwMSBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50ClsgICAgMS4yODg0
NzFdIHBjaSAwMDAwOjAwOjFlLjA6IEJBUiAwIFttZW0gMHhhMTIxYzAwMC0weGExMjFjZmZmIDY0
Yml0XQpbICAgIDEuMjg4NDkwXSBwY2kgMDAwMDowMDoxZS4wOiBCQVIgMiBbbWVtIDB4YTEyMWIw
MDAtMHhhMTIxYmZmZiA2NGJpdF0KWyAgICAxLjI4ODc4MV0gcGNpIDAwMDA6MDA6MWYuMDogWzgw
ODY6MzFlOF0gdHlwZSAwMCBjbGFzcyAweDA2MDEwMCBjb252ZW50aW9uYWwgUENJIGVuZHBvaW50
ClsgICAgMS4yODkxODJdIHBjaSAwMDAwOjAwOjFmLjE6IFs4MDg2OjMxZDRdIHR5cGUgMDAgY2xh
c3MgMHgwYzA1MDAgY29udmVudGlvbmFsIFBDSSBlbmRwb2ludApbICAgIDEuMjg5MjUzXSBwY2kg
MDAwMDowMDoxZi4xOiBCQVIgMCBbbWVtIDB4YTEyMWEwMDAtMHhhMTIxYTBmZiA2NGJpdF0KWyAg
ICAxLjI4OTM2N10gcGNpIDAwMDA6MDA6MWYuMTogQkFSIDQgW2lvICAweGYwNDAtMHhmMDVmXQpb
ICAgIDEuMjg5NjY3XSBwY2kgMDAwMDowMDoxMy4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDFdClsg
ICAgMS4yODk3ODddIHBjaSAwMDAwOjAwOjEzLjE6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMl0KWyAg
ICAxLjI4OTkyMl0gcGNpIDAwMDA6MDM6MDAuMDogWzEwZWM6NTIyYV0gdHlwZSAwMCBjbGFzcyAw
eGZmMDAwMCBQQ0llIEVuZHBvaW50ClsgICAgMS4yODk5NTBdIHBjaSAwMDAwOjAzOjAwLjA6IEJB
UiAwIFttZW0gMHhhMTEwMDAwMC0weGExMTAwZmZmXQpbICAgIDEuMjkwMDI5XSBwY2kgMDAwMDow
MzowMC4wOiBVcHN0cmVhbSBicmlkZ2UncyBNYXggUGF5bG9hZCBTaXplIHNldCB0byAxMjggKHdh
cyAyNTYsIG1heCAyNTYpClsgICAgMS4yOTAwNDBdIHBjaSAwMDAwOjAzOjAwLjA6IE1heCBQYXls
b2FkIFNpemUgc2V0IHRvIDEyOCAod2FzIDEyOCwgbWF4IDEyOCkKWyAgICAxLjI5MDE0OV0gcGNp
IDAwMDA6MDM6MDAuMDogc3VwcG9ydHMgRDEgRDIKWyAgICAxLjI5MDE1NF0gcGNpIDAwMDA6MDM6
MDAuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBEMSBEMiBEM2hvdCBEM2NvbGQKWyAgICAxLjI5MDUw
MV0gcGNpIDAwMDA6MDA6MTMuMjogUENJIGJyaWRnZSB0byBbYnVzIDAzXQpbICAgIDEuMzAwNDk0
XSBBQ1BJOiBQQ0k6IEludGVycnVwdCBsaW5rIExOS0EgY29uZmlndXJlZCBmb3IgSVJRIDMKWyAg
ICAxLjMwMDcxMF0gQUNQSTogUENJOiBJbnRlcnJ1cHQgbGluayBMTktCIGNvbmZpZ3VyZWQgZm9y
IElSUSA0ClsgICAgMS4zMDA5MTddIEFDUEk6IFBDSTogSW50ZXJydXB0IGxpbmsgTE5LQyBjb25m
aWd1cmVkIGZvciBJUlEgNQpbICAgIDEuMzAxMTMxXSBBQ1BJOiBQQ0k6IEludGVycnVwdCBsaW5r
IExOS0QgY29uZmlndXJlZCBmb3IgSVJRIDYKWyAgICAxLjMwMTMzOV0gQUNQSTogUENJOiBJbnRl
cnJ1cHQgbGluayBMTktFIGNvbmZpZ3VyZWQgZm9yIElSUSA3ClsgICAgMS4zMDE1NDldIEFDUEk6
IFBDSTogSW50ZXJydXB0IGxpbmsgTE5LRiBjb25maWd1cmVkIGZvciBJUlEgOQpbICAgIDEuMzAx
NzU3XSBBQ1BJOiBQQ0k6IEludGVycnVwdCBsaW5rIExOS0cgY29uZmlndXJlZCBmb3IgSVJRIDEw
ClsgICAgMS4zMDE5NjZdIEFDUEk6IFBDSTogSW50ZXJydXB0IGxpbmsgTE5LSCBjb25maWd1cmVk
IGZvciBJUlEgMTEKWyAgICAxLjMxNjQ3NF0gQUNQSSBXYXJuaW5nOiBHUEUgdHlwZSBtaXNtYXRj
aCAobGV2ZWwvZWRnZSkgKDIwMjQwODI3L2V2eGZhY2UtNzkxKQpbICAgIDEuMzE2NTE2XSBBQ1BJ
OiBFQzogaW50ZXJydXB0IHVuYmxvY2tlZApbICAgIDEuMzE2NTIwXSBBQ1BJOiBFQzogZXZlbnQg
dW5ibG9ja2VkClsgICAgMS4zMTY1MzFdIEFDUEk6IEVDOiBFQ19DTUQvRUNfU0M9MHg2NiwgRUNf
REFUQT0weDYyClsgICAgMS4zMTY1MzVdIEFDUEk6IEVDOiBHUEU9MHgyNgpbICAgIDEuMzE2NTQw
XSBBQ1BJOiBcX1NCXy5QQ0kwLlNCUkcuSF9FQzogQm9vdCBEU0RUIEVDIGluaXRpYWxpemF0aW9u
IGNvbXBsZXRlClsgICAgMS4zMTY1NDZdIEFDUEk6IFxfU0JfLlBDSTAuU0JSRy5IX0VDOiBFQzog
VXNlZCB0byBoYW5kbGUgdHJhbnNhY3Rpb25zIGFuZCBldmVudHMKWyAgICAxLjMxNzM3OV0gaW9t
bXU6IERlZmF1bHQgZG9tYWluIHR5cGU6IFRyYW5zbGF0ZWQKWyAgICAxLjMxNzM3OV0gaW9tbXU6
IERNQSBkb21haW4gVExCIGludmFsaWRhdGlvbiBwb2xpY3k6IGxhenkgbW9kZQpbICAgIDEuMzE3
NzQxXSBTQ1NJIHN1YnN5c3RlbSBpbml0aWFsaXplZApbICAgIDEuMzE3NzQxXSBsaWJhdGEgdmVy
c2lvbiAzLjAwIGxvYWRlZC4KWyAgICAxLjMxNzc0MV0gQUNQSTogYnVzIHR5cGUgVVNCIHJlZ2lz
dGVyZWQKWyAgICAxLjMxNzc0MV0gdXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRy
aXZlciB1c2JmcwpbICAgIDEuMzE3NzQxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBpbnRlcmZh
Y2UgZHJpdmVyIGh1YgpbICAgIDEuMzE3NzQxXSB1c2Jjb3JlOiByZWdpc3RlcmVkIG5ldyBkZXZp
Y2UgZHJpdmVyIHVzYgpbICAgIDEuMzE3NzQxXSBFREFDIE1DOiBWZXI6IDMuMC4wClsgICAgMS4z
MTg1MzVdIGVmaXZhcnM6IFJlZ2lzdGVyZWQgZWZpdmFycyBvcGVyYXRpb25zClsgICAgMS4zMTkw
MjddIE5ldExhYmVsOiBJbml0aWFsaXppbmcKWyAgICAxLjMxOTAzMl0gTmV0TGFiZWw6ICBkb21h
aW4gaGFzaCBzaXplID0gMTI4ClsgICAgMS4zMTkwMzZdIE5ldExhYmVsOiAgcHJvdG9jb2xzID0g
VU5MQUJFTEVEIENJUFNPdjQgQ0FMSVBTTwpbICAgIDEuMzE5MDg4XSBOZXRMYWJlbDogIHVubGFi
ZWxlZCB0cmFmZmljIGFsbG93ZWQgYnkgZGVmYXVsdApbICAgIDEuMzE5MTAzXSBtY3RwOiBtYW5h
Z2VtZW50IGNvbXBvbmVudCB0cmFuc3BvcnQgcHJvdG9jb2wgY29yZQpbICAgIDEuMzE5MTA3XSBO
RVQ6IFJlZ2lzdGVyZWQgUEZfTUNUUCBwcm90b2NvbCBmYW1pbHkKWyAgICAxLjMxOTM4Ml0gUENJ
OiBVc2luZyBBQ1BJIGZvciBJUlEgcm91dGluZwpbICAgIDEuMzQ5NjM0XSBQQ0k6IHBjaV9jYWNo
ZV9saW5lX3NpemUgc2V0IHRvIDY0IGJ5dGVzClsgICAgMS4zNDk4MjhdIHJlc291cmNlOiBFeHBh
bmRlZCByZXNvdXJjZSBSZXNlcnZlZCBkdWUgdG8gY29uZmxpY3Qgd2l0aCBQQ0kgQnVzIDAwMDA6
MDAKWyAgICAxLjM0OTgzNF0gZTgyMDogcmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHgwMDAzZTAw
MC0weDAwMDNmZmZmXQpbICAgIDEuMzQ5ODQwXSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21l
bSAweDAwMDllMDAwLTB4MDAwOWZmZmZdClsgICAgMS4zNDk4NDRdIGU4MjA6IHJlc2VydmUgUkFN
IGJ1ZmZlciBbbWVtIDB4NmMwOWYwMTgtMHg2ZmZmZmZmZl0KWyAgICAxLjM0OTg0OF0gZTgyMDog
cmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0gMHg3MWIzYTAwMC0weDczZmZmZmZmXQpbICAgIDEuMzQ5
ODUyXSBlODIwOiByZXNlcnZlIFJBTSBidWZmZXIgW21lbSAweDcyODdkMDAwLTB4NzNmZmZmZmZd
ClsgICAgMS4zNDk4NTVdIGU4MjA6IHJlc2VydmUgUkFNIGJ1ZmZlciBbbWVtIDB4NzYxZWEwMDAt
MHg3N2ZmZmZmZl0KWyAgICAxLjM0OTg1OV0gZTgyMDogcmVzZXJ2ZSBSQU0gYnVmZmVyIFttZW0g
MHg3YTc3NjAwMC0weDdiZmZmZmZmXQpbICAgIDEuMzQ5ODYzXSBlODIwOiByZXNlcnZlIFJBTSBi
dWZmZXIgW21lbSAweDdhYzAwMDAwLTB4N2JmZmZmZmZdClsgICAgMS4zNTAzOTNdIHBjaSAwMDAw
OjAwOjAyLjA6IHZnYWFyYjogc2V0dGluZyBhcyBib290IFZHQSBkZXZpY2UKWyAgICAxLjM1MDM5
M10gcGNpIDAwMDA6MDA6MDIuMDogdmdhYXJiOiBicmlkZ2UgY29udHJvbCBwb3NzaWJsZQpbICAg
IDEuMzUwMzkzXSBwY2kgMDAwMDowMDowMi4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRl
Y29kZXM9aW8rbWVtLG93bnM9aW8rbWVtLGxvY2tzPW5vbmUKWyAgICAxLjM1MDM5M10gdmdhYXJi
OiBsb2FkZWQKWyAgICAxLjM1MDQ2NF0gaHBldDA6IGF0IE1NSU8gMHhmZWQwMDAwMCwgSVJRcyAy
LCA4LCAwLCAwLCAwLCAwLCAwLCAwClsgICAgMS4zNTA0NjRdIGhwZXQwOiA4IGNvbXBhcmF0b3Jz
LCA2NC1iaXQgMTkuMjAwMDAwIE1IeiBjb3VudGVyClsgICAgMS4zNTI0NTFdIGNsb2Nrc291cmNl
OiBTd2l0Y2hlZCB0byBjbG9ja3NvdXJjZSB0c2MtZWFybHkKWyAgICAxLjM1NDIwNV0gVkZTOiBE
aXNrIHF1b3RhcyBkcXVvdF82LjYuMApbICAgIDEuMzU0MjIxXSBWRlM6IERxdW90LWNhY2hlIGhh
c2ggdGFibGUgZW50cmllczogNTEyIChvcmRlciAwLCA0MDk2IGJ5dGVzKQpbICAgIDEuMzU0NDU2
XSBwbnA6IFBuUCBBQ1BJIGluaXQKWyAgICAxLjM1NDc1M10gc3lzdGVtIDAwOjAwOiBbaW8gIDB4
MDY4MC0weDA2OWZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMS4zNTQ3NjRdIHN5c3RlbSAwMDow
MDogW2lvICAweDA0MDAtMHgwNDdmXSBjb3VsZCBub3QgYmUgcmVzZXJ2ZWQKWyAgICAxLjM1NDc3
MF0gc3lzdGVtIDAwOjAwOiBbaW8gIDB4MDUwMC0weDA1ZmVdIGhhcyBiZWVuIHJlc2VydmVkClsg
ICAgMS4zNTQ3NzVdIHN5c3RlbSAwMDowMDogW2lvICAweDA2MDAtMHgwNjFmXSBoYXMgYmVlbiBy
ZXNlcnZlZApbICAgIDEuMzU0NzgxXSBzeXN0ZW0gMDA6MDA6IFtpbyAgMHgxNjRlLTB4MTY0Zl0g
aGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAxLjM1NzAyMF0gc3lzdGVtIDAwOjAxOiBbbWVtIDB4ZTAw
MDAwMDAtMHhlZmZmZmZmZl0gaGFzIGJlZW4gcmVzZXJ2ZWQKWyAgICAxLjM1NzAzMV0gc3lzdGVt
IDAwOjAxOiBbbWVtIDB4ZmVhMDAwMDAtMHhmZWFmZmZmZl0gY291bGQgbm90IGJlIHJlc2VydmVk
ClsgICAgMS4zNTcwMzhdIHN5c3RlbSAwMDowMTogW21lbSAweGZlZDAxMDAwLTB4ZmVkMDFmZmZd
IGhhcyBiZWVuIHJlc2VydmVkClsgICAgMS4zNTcwNDRdIHN5c3RlbSAwMDowMTogW21lbSAweGZl
ZDAzMDAwLTB4ZmVkMDNmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMS4zNTcwNTFdIHN5c3Rl
bSAwMDowMTogW21lbSAweGZlZDA2MDAwLTB4ZmVkMDZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsg
ICAgMS4zNTcwNTZdIHN5c3RlbSAwMDowMTogW21lbSAweGZlZDA4MDAwLTB4ZmVkMDlmZmZdIGhh
cyBiZWVuIHJlc2VydmVkClsgICAgMS4zNTcwNjJdIHN5c3RlbSAwMDowMTogW21lbSAweGZlZDgw
MDAwLTB4ZmVkYmZmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAgMS4zNTcwNjhdIHN5c3RlbSAw
MDowMTogW21lbSAweGZlZDFjMDAwLTB4ZmVkMWNmZmZdIGhhcyBiZWVuIHJlc2VydmVkClsgICAg
MS4zNTcwNzRdIHN5c3RlbSAwMDowMTogW21lbSAweGZlZTAwMDAwLTB4ZmVlZmZmZmZdIGNvdWxk
IG5vdCBiZSByZXNlcnZlZApbICAgIDEuMzU4NjUwXSBwbnA6IFBuUCBBQ1BJOiBmb3VuZCA0IGRl
dmljZXMKWyAgICAxLjM2NzczNV0gY2xvY2tzb3VyY2U6IGFjcGlfcG06IG1hc2s6IDB4ZmZmZmZm
IG1heF9jeWNsZXM6IDB4ZmZmZmZmLCBtYXhfaWRsZV9uczogMjA4NTcwMTAyNCBucwpbICAgIDEu
MzY3OTE0XSBORVQ6IFJlZ2lzdGVyZWQgUEZfSU5FVCBwcm90b2NvbCBmYW1pbHkKWyAgICAxLjM2
ODIzNF0gSVAgaWRlbnRzIGhhc2ggdGFibGUgZW50cmllczogMTMxMDcyIChvcmRlcjogOCwgMTA0
ODU3NiBieXRlcywgbGluZWFyKQpbICAgIDEuNDE0Mjg1XSB0Y3BfbGlzdGVuX3BvcnRhZGRyX2hh
c2ggaGFzaCB0YWJsZSBlbnRyaWVzOiA0MDk2IChvcmRlcjogNCwgNjU1MzYgYnl0ZXMsIGxpbmVh
cikKWyAgICAxLjQxNDM4NF0gVGFibGUtcGVydHVyYiBoYXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2
IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzLCBsaW5lYXIpClsgICAgMS40MTQ1MTldIFRDUCBlc3Rh
Ymxpc2hlZCBoYXNoIHRhYmxlIGVudHJpZXM6IDY1NTM2IChvcmRlcjogNywgNTI0Mjg4IGJ5dGVz
LCBsaW5lYXIpClsgICAgMS40MTUyNzldIFRDUCBiaW5kIGhhc2ggdGFibGUgZW50cmllczogNjU1
MzYgKG9yZGVyOiA5LCAyMDk3MTUyIGJ5dGVzLCBsaW5lYXIpClsgICAgMS40MTU3NzVdIFRDUDog
SGFzaCB0YWJsZXMgY29uZmlndXJlZCAoZXN0YWJsaXNoZWQgNjU1MzYgYmluZCA2NTUzNikKWyAg
ICAxLjQxNjAwMF0gTVBUQ1AgdG9rZW4gaGFzaCB0YWJsZSBlbnRyaWVzOiA4MTkyIChvcmRlcjog
NSwgMTk2NjA4IGJ5dGVzLCBsaW5lYXIpClsgICAgMS40MTYxNDRdIFVEUCBoYXNoIHRhYmxlIGVu
dHJpZXM6IDQwOTYgKG9yZGVyOiA2LCAyNjIxNDQgYnl0ZXMsIGxpbmVhcikKWyAgICAxLjQxNjMy
MF0gVURQLUxpdGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA0MDk2IChvcmRlcjogNiwgMjYyMTQ0IGJ5
dGVzLCBsaW5lYXIpClsgICAgMS40MTY1MDRdIE5FVDogUmVnaXN0ZXJlZCBQRl9VTklYL1BGX0xP
Q0FMIHByb3RvY29sIGZhbWlseQpbICAgIDEuNDE2NTI1XSBORVQ6IFJlZ2lzdGVyZWQgUEZfWERQ
IHByb3RvY29sIGZhbWlseQpbICAgIDEuNDE2NTc0XSByZXNvdXJjZTogYXZvaWRpbmcgYWxsb2Nh
dGlvbiBmcm9tIGU4MjAgZW50cnkgW21lbSAweDAwMDllMDAwLTB4MDAwZmZmZmZdClsgICAgMS40
MTY1ODJdIHJlc291cmNlOiBhdm9pZGluZyBhbGxvY2F0aW9uIGZyb20gZTgyMCBlbnRyeSBbbWVt
IDB4N2FjMDAwMDAtMHg3ZmZmZmZmZl0KWyAgICAxLjQxNjU5MV0gcGNpIDAwMDA6MDA6MTguMjog
QkFSIDIgW21lbSAweDgwMDA4MDAwLTB4ODAwMDhmZmYgNjRiaXRdOiBhc3NpZ25lZApbICAgIDEu
NDE2NjE5XSBwY2kgMDAwMDowMDoxMy4wOiBQQ0kgYnJpZGdlIHRvIFtidXMgMDFdClsgICAgMS40
MTY2MzhdIHBjaSAwMDAwOjAwOjEzLjE6IFBDSSBicmlkZ2UgdG8gW2J1cyAwMl0KWyAgICAxLjQx
NjY1NF0gcGNpIDAwMDA6MDA6MTMuMjogUENJIGJyaWRnZSB0byBbYnVzIDAzXQpbICAgIDEuNDE2
NjYyXSBwY2kgMDAwMDowMDoxMy4yOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweGExMTAwMDAwLTB4
YTExZmZmZmZdClsgICAgMS40MTY2NzhdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgNCBbaW8g
IDB4MDA3MC0weDAwNzddClsgICAgMS40MTY2ODVdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2Ug
NSBbaW8gIDB4MDAwMC0weDAwNmYgd2luZG93XQpbICAgIDEuNDE2NjkxXSBwY2lfYnVzIDAwMDA6
MDA6IHJlc291cmNlIDYgW2lvICAweDAwNzgtMHgwY2Y3IHdpbmRvd10KWyAgICAxLjQxNjY5Nl0g
cGNpX2J1cyAwMDAwOjAwOiByZXNvdXJjZSA3IFtpbyAgMHgwZDAwLTB4ZmZmZiB3aW5kb3ddClsg
ICAgMS40MTY3MDFdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgOCBbbWVtIDB4MDAwYTAwMDAt
MHgwMDBmZmZmZiB3aW5kb3ddClsgICAgMS40MTY3MDZdIHBjaV9idXMgMDAwMDowMDogcmVzb3Vy
Y2UgOSBbbWVtIDB4N2MwMDAwMDEtMHhiZmZmZmZmZiB3aW5kb3ddClsgICAgMS40MTY3MTFdIHBj
aV9idXMgMDAwMDowMDogcmVzb3VyY2UgMTAgW21lbSAweGUwMDAwMDAwLTB4ZWZmZmZmZmYgd2lu
ZG93XQpbICAgIDEuNDE2NzE2XSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDExIFttZW0gMHhm
ZWEwMDAwMC0weGZlYWZmZmZmIHdpbmRvd10KWyAgICAxLjQxNjcyMV0gcGNpX2J1cyAwMDAwOjAw
OiByZXNvdXJjZSAxMiBbbWVtIDB4ZmVkMDAwMDAtMHhmZWQwMDNmZiB3aW5kb3ddClsgICAgMS40
MTY3MjZdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgMTMgW21lbSAweGZlZDAxMDAwLTB4ZmVk
MDFmZmYgd2luZG93XQpbICAgIDEuNDE2NzMxXSBwY2lfYnVzIDAwMDA6MDA6IHJlc291cmNlIDE0
IFttZW0gMHhmZWQwMzAwMC0weGZlZDAzZmZmIHdpbmRvd10KWyAgICAxLjQxNjczNV0gcGNpX2J1
cyAwMDAwOjAwOiByZXNvdXJjZSAxNSBbbWVtIDB4ZmVkMDYwMDAtMHhmZWQwNmZmZiB3aW5kb3dd
ClsgICAgMS40MTY3NDBdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgMTYgW21lbSAweGZlZDA4
MDAwLTB4ZmVkMDlmZmYgd2luZG93XQpbICAgIDEuNDE2NzQ1XSBwY2lfYnVzIDAwMDA6MDA6IHJl
c291cmNlIDE3IFttZW0gMHhmZWQ4MDAwMC0weGZlZGJmZmZmIHdpbmRvd10KWyAgICAxLjQxNjc1
MF0gcGNpX2J1cyAwMDAwOjAwOiByZXNvdXJjZSAxOCBbbWVtIDB4ZmVkMWMwMDAtMHhmZWQxY2Zm
ZiB3aW5kb3ddClsgICAgMS40MTY3NTRdIHBjaV9idXMgMDAwMDowMDogcmVzb3VyY2UgMTkgW21l
bSAweGZlZTAwMDAwLTB4ZmVlZmZmZmYgd2luZG93XQpbICAgIDEuNDE2NzYwXSBwY2lfYnVzIDAw
MDA6MDM6IHJlc291cmNlIDEgW21lbSAweGExMTAwMDAwLTB4YTExZmZmZmZdClsgICAgMS40MTc5
MTBdIFBDSTogQ0xTIDY0IGJ5dGVzLCBkZWZhdWx0IDY0ClsgICAgMS40MTgwMDldIHBjaSAwMDAw
OjAwOjBkLjA6IFs4MDg2OjMxOTJdIHR5cGUgMDAgY2xhc3MgMHgwNTgwMDAgY29udmVudGlvbmFs
IFBDSSBlbmRwb2ludApbICAgIDEuNDE4MTAwXSBwY2kgMDAwMDowMDowZC4wOiBCQVIgMCBbbWVt
IDB4ZDAwMDAwMDAtMHhkMGZmZmZmZiA2NGJpdF0KWyAgICAxLjQxOTQzNl0gcGNpIDAwMDA6MDA6
MGQuMjogWzgwODY6MzE5Nl0gdHlwZSAwMCBjbGFzcyAweDBjODAwMCBjb252ZW50aW9uYWwgUENJ
IGVuZHBvaW50ClsgICAgMS40MTk0NzVdIHBjaSAwMDAwOjAwOjBkLjI6IEJBUiAwIFttZW0gMHhm
ZWQwMTAwMC0weGZlZDAxZmZmXQpbICAgIDEuNDE5ODA2XSBQQ0ktRE1BOiBVc2luZyBzb2Z0d2Fy
ZSBib3VuY2UgYnVmZmVyaW5nIGZvciBJTyAoU1dJT1RMQikKWyAgICAxLjQxOTgxMV0gc29mdHdh
cmUgSU8gVExCOiBtYXBwZWQgW21lbSAweDAwMDAwMDAwNmRiM2EwMDAtMHgwMDAwMDAwMDcxYjNh
MDAwXSAoNjRNQikKWyAgICAxLjQxOTkwNF0gVHJ5aW5nIHRvIHVucGFjayByb290ZnMgaW1hZ2Ug
YXMgaW5pdHJhbWZzLi4uClsgICAgMS40MjAwMTFdIGNsb2Nrc291cmNlOiB0c2M6IG1hc2s6IDB4
ZmZmZmZmZmZmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZjNjZmNGZjN2MsIG1heF9pZGxlX25zOiA0
NDA3OTUyMjQyNDYgbnMKWyAgICAxLjQyMDA1NV0gY2xvY2tzb3VyY2U6IFN3aXRjaGVkIHRvIGNs
b2Nrc291cmNlIHRzYwpbICAgIDEuNDk2ODIwXSBJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtl
eXJpbmdzClsgICAgMS40OTY4NDldIEtleSB0eXBlIGJsYWNrbGlzdCByZWdpc3RlcmVkClsgICAg
MS40OTY5OTVdIHdvcmtpbmdzZXQ6IHRpbWVzdGFtcF9iaXRzPTM2IG1heF9vcmRlcj0yMSBidWNr
ZXRfb3JkZXI9MApbICAgIDEuNDk3MzU1XSBmdXNlOiBpbml0IChBUEkgdmVyc2lvbiA3LjQxKQpb
ICAgIDEuNDk3NjA2XSBpbnRlZ3JpdHk6IFBsYXRmb3JtIEtleXJpbmcgaW5pdGlhbGl6ZWQKWyAg
ICAxLjQ5NzYxNV0gaW50ZWdyaXR5OiBNYWNoaW5lIGtleXJpbmcgaW5pdGlhbGl6ZWQKWyAgICAx
LjUzNjIzN10gS2V5IHR5cGUgYXN5bW1ldHJpYyByZWdpc3RlcmVkClsgICAgMS41MzYyNDddIEFz
eW1tZXRyaWMga2V5IHBhcnNlciAneDUwOScgcmVnaXN0ZXJlZApbICAgIDEuNTM2MzUwXSBCbG9j
ayBsYXllciBTQ1NJIGdlbmVyaWMgKGJzZykgZHJpdmVyIHZlcnNpb24gMC40IGxvYWRlZCAobWFq
b3IgMjQ2KQpbICAgIDEuNTM2NTMzXSBpbyBzY2hlZHVsZXIgbXEtZGVhZGxpbmUgcmVnaXN0ZXJl
ZApbICAgIDEuNTM2NTM5XSBpbyBzY2hlZHVsZXIga3liZXIgcmVnaXN0ZXJlZApbICAgIDEuNTM2
NTczXSBpbyBzY2hlZHVsZXIgYmZxIHJlZ2lzdGVyZWQKWyAgICAxLjUzNjk5NF0gbGVkdHJpZy1j
cHU6IHJlZ2lzdGVyZWQgdG8gaW5kaWNhdGUgYWN0aXZpdHkgb24gQ1BVcwpbICAgIDEuNTM3NTkw
XSBwY2llcG9ydCAwMDAwOjAwOjEzLjA6IFBNRTogU2lnbmFsaW5nIHdpdGggSVJRIDEyMApbICAg
IDEuNTM4MTI3XSBwY2llcG9ydCAwMDAwOjAwOjEzLjE6IFBNRTogU2lnbmFsaW5nIHdpdGggSVJR
IDEyMQpbICAgIDEuNTM4NjE4XSBwY2llcG9ydCAwMDAwOjAwOjEzLjI6IFBNRTogU2lnbmFsaW5n
IHdpdGggSVJRIDEyMgpbICAgIDEuNTM4ODY2XSBzaHBjaHA6IFN0YW5kYXJkIEhvdCBQbHVnIFBD
SSBDb250cm9sbGVyIERyaXZlciB2ZXJzaW9uOiAwLjQKWyAgICAxLjU0MTA0NF0gQUNQSTogQUM6
IEFDIEFkYXB0ZXIgW0FEUDFdIChvZmYtbGluZSkKWyAgICAxLjU0MTE4M10gaW5wdXQ6IExpZCBT
d2l0Y2ggYXMgL2RldmljZXMvTE5YU1lTVE06MDAvTE5YU1lCVVM6MDAvUE5QMEEwODowMC9kZXZp
Y2U6MDMvUE5QMEMwOTowMC9QTlAwQzBEOjAwL2lucHV0L2lucHV0MApbICAgIDEuNTQ0NDAxXSBB
Q1BJOiBidXR0b246IExpZCBTd2l0Y2ggW0xJRDBdClsgICAgMS41NDQ1MzJdIGlucHV0OiBQb3dl
ciBCdXR0b24gYXMgL2RldmljZXMvTE5YU1lTVE06MDAvTE5YU1lCVVM6MDAvUE5QMEMwQzowMC9p
bnB1dC9pbnB1dDEKWyAgICAxLjU0NDU5OV0gQUNQSTogYnV0dG9uOiBQb3dlciBCdXR0b24gW1BX
UkJdClsgICAgMS41NTU3NDddIHRoZXJtYWwgTE5YVEhFUk06MDA6IHJlZ2lzdGVyZWQgYXMgdGhl
cm1hbF96b25lMApbICAgIDEuNTU1NzYyXSBBQ1BJOiB0aGVybWFsOiBUaGVybWFsIFpvbmUgW1Ra
MDFdICgyNyBDKQpbICAgIDEuNTU3MTUxXSBTZXJpYWw6IDgyNTAvMTY1NTAgZHJpdmVyLCAzMiBw
b3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApbICAgIDEuNTc0NzYxXSBOb24tdm9sYXRpbGUgbWVt
b3J5IGRyaXZlciB2MS4zClsgICAgMS41NzQ3NzNdIExpbnV4IGFncGdhcnQgaW50ZXJmYWNlIHYw
LjEwMwpbICAgIDEuNTc0OTEyXSBBQ1BJOiBidXMgdHlwZSBkcm1fY29ubmVjdG9yIHJlZ2lzdGVy
ZWQKWyAgICAxLjU3NTM5OV0gQUNQSTogYmF0dGVyeTogU2xvdCBbQkFUMF0gKGJhdHRlcnkgcHJl
c2VudCkKWyAgICAxLjU3NjIwNF0gYWhjaSAwMDAwOjAwOjEyLjA6IHZlcnNpb24gMy4wClsgICAg
MS41ODY3ODddIGFoY2kgMDAwMDowMDoxMi4wOiBBSENJIHZlcnMgMDAwMS4wMzAxLCAzMiBjb21t
YW5kIHNsb3RzLCA2IEdicHMsIFNBVEEgbW9kZQpbICAgIDEuNTg2ODA1XSBhaGNpIDAwMDA6MDA6
MTIuMDogMi8yIHBvcnRzIGltcGxlbWVudGVkIChwb3J0IG1hc2sgMHgzKQpbICAgIDEuNTg2ODEx
XSBhaGNpIDAwMDA6MDA6MTIuMDogZmxhZ3M6IDY0Yml0IG5jcSBzbnRmIHBtIGNsbyBvbmx5IHBt
cCBwaW8gc2x1bSBwYXJ0IGRlc28gc2FkbSBzZHMgYXBzdCAKWyAgICAxLjU4ODEyNV0gc2NzaSBo
b3N0MDogYWhjaQpbICAgIDEuNTg4NDkwXSBzY3NpIGhvc3QxOiBhaGNpClsgICAgMS41ODg1OTVd
IGF0YTE6IFNBVEEgbWF4IFVETUEvMTMzIGFiYXIgbTIwNDhAMHhhMTIzYjAwMCBwb3J0IDB4YTEy
M2IxMDAgaXJxIDEyMyBscG0tcG9sIDMKWyAgICAxLjU4ODYwNF0gYXRhMjogU0FUQSBtYXggVURN
QS8xMzMgYWJhciBtMjA0OEAweGExMjNiMDAwIHBvcnQgMHhhMTIzYjE4MCBpcnEgMTIzIGxwbS1w
b2wgMwpbICAgIDEuNTg5NTM5XSB4aGNpX2hjZCAwMDAwOjAwOjE1LjA6IHhIQ0kgSG9zdCBDb250
cm9sbGVyClsgICAgMS41ODk1NTldIHhoY2lfaGNkIDAwMDA6MDA6MTUuMDogbmV3IFVTQiBidXMg
cmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAxClsgICAgMS41OTE1MTldIHhoY2lfaGNk
IDAwMDA6MDA6MTUuMDogaGNjIHBhcmFtcyAweDIwMDA3N2MxIGhjaSB2ZXJzaW9uIDB4MTAwIHF1
aXJrcyAweDAwMDAwMDAwMDAwMDk4MTAKWyAgICAxLjU5MjEwOF0geGhjaV9oY2QgMDAwMDowMDox
NS4wOiB4SENJIEhvc3QgQ29udHJvbGxlcgpbICAgIDEuNTkyMTIxXSB4aGNpX2hjZCAwMDAwOjAw
OjE1LjA6IG5ldyBVU0IgYnVzIHJlZ2lzdGVyZWQsIGFzc2lnbmVkIGJ1cyBudW1iZXIgMgpbICAg
IDEuNTkyMTMwXSB4aGNpX2hjZCAwMDAwOjAwOjE1LjA6IEhvc3Qgc3VwcG9ydHMgVVNCIDMuMCBT
dXBlclNwZWVkClsgICAgMS41OTIyNTVdIHVzYiB1c2IxOiBOZXcgVVNCIGRldmljZSBmb3VuZCwg
aWRWZW5kb3I9MWQ2YiwgaWRQcm9kdWN0PTAwMDIsIGJjZERldmljZT0gNi4xMwpbICAgIDEuNTky
Mjc2XSB1c2IgdXNiMTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTMsIFByb2R1Y3Q9Miwg
U2VyaWFsTnVtYmVyPTEKWyAgICAxLjU5MjI4M10gdXNiIHVzYjE6IFByb2R1Y3Q6IHhIQ0kgSG9z
dCBDb250cm9sbGVyClsgICAgMS41OTIyODddIHVzYiB1c2IxOiBNYW51ZmFjdHVyZXI6IExpbnV4
IDYuMTMuNy1hcmNoMS0xIHhoY2ktaGNkClsgICAgMS41OTIyOTJdIHVzYiB1c2IxOiBTZXJpYWxO
dW1iZXI6IDAwMDA6MDA6MTUuMApbICAgIDEuNTkyNzI0XSBodWIgMS0wOjEuMDogVVNCIGh1YiBm
b3VuZApbICAgIDEuNTkyNzU2XSBodWIgMS0wOjEuMDogOSBwb3J0cyBkZXRlY3RlZApbICAgIDEu
NTk4ODYyXSB1c2IgdXNiMjogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTFkNmIsIGlk
UHJvZHVjdD0wMDAzLCBiY2REZXZpY2U9IDYuMTMKWyAgICAxLjU5ODg3NF0gdXNiIHVzYjI6IE5l
dyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0zLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0xClsg
ICAgMS41OTg4ODBdIHVzYiB1c2IyOiBQcm9kdWN0OiB4SENJIEhvc3QgQ29udHJvbGxlcgpbICAg
IDEuNTk4ODg1XSB1c2IgdXNiMjogTWFudWZhY3R1cmVyOiBMaW51eCA2LjEzLjctYXJjaDEtMSB4
aGNpLWhjZApbICAgIDEuNTk4ODg5XSB1c2IgdXNiMjogU2VyaWFsTnVtYmVyOiAwMDAwOjAwOjE1
LjAKWyAgICAxLjU5OTIwNV0gaHViIDItMDoxLjA6IFVTQiBodWIgZm91bmQKWyAgICAxLjU5OTIz
Nl0gaHViIDItMDoxLjA6IDcgcG9ydHMgZGV0ZWN0ZWQKWyAgICAxLjYwMTQwN10gdXNiOiBwb3J0
IHBvd2VyIG1hbmFnZW1lbnQgbWF5IGJlIHVucmVsaWFibGUKWyAgICAxLjYwNDcwM10gdXNiY29y
ZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JzZXJpYWxfZ2VuZXJpYwpbICAg
IDEuNjA0NzIxXSB1c2JzZXJpYWw6IFVTQiBTZXJpYWwgc3VwcG9ydCByZWdpc3RlcmVkIGZvciBn
ZW5lcmljClsgICAgMS42MDUwMTVdIHJ0Y19jbW9zIDAwOjAzOiBSVEMgY2FuIHdha2UgZnJvbSBT
NApbICAgIDEuNjA2MDExXSBydGNfY21vcyAwMDowMzogcmVnaXN0ZXJlZCBhcyBydGMwClsgICAg
MS42MDYxNjNdIHJ0Y19jbW9zIDAwOjAzOiBzZXR0aW5nIHN5c3RlbSBjbG9jayB0byAyMDI1LTAz
LTIwVDE2OjUyOjAyIFVUQyAoMTc0MjQ4OTUyMikKWyAgICAxLjYwNjIzNF0gcnRjX2Ntb3MgMDA6
MDM6IGFsYXJtcyB1cCB0byBvbmUgbW9udGgsIHkzaywgMjQyIGJ5dGVzIG52cmFtClsgICAgMS42
MDY3MDFdIGludGVsX3BzdGF0ZTogSW50ZWwgUC1zdGF0ZSBkcml2ZXIgaW5pdGlhbGl6aW5nClsg
ICAgMS42MDc5MDJdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDogW2Ry
bV0gUmVnaXN0ZXJlZCAxIHBsYW5lcyB3aXRoIGRybSBwYW5pYwpbICAgIDEuNjA3OTA3XSBbZHJt
XSBJbml0aWFsaXplZCBzaW1wbGVkcm0gMS4wLjAgZm9yIHNpbXBsZS1mcmFtZWJ1ZmZlci4wIG9u
IG1pbm9yIDAKWyAgICAxLjYxMjgzNl0gZmJjb246IERlZmVycmluZyBjb25zb2xlIHRha2Utb3Zl
cgpbICAgIDEuNjEyODQ2XSBzaW1wbGUtZnJhbWVidWZmZXIgc2ltcGxlLWZyYW1lYnVmZmVyLjA6
IFtkcm1dIGZiMDogc2ltcGxlZHJtZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQpbICAgIDEuNjEy
OTc3XSBoaWQ6IHJhdyBISUQgZXZlbnRzIGRyaXZlciAoQykgSmlyaSBLb3NpbmEKWyAgICAxLjYx
MzEwNF0gZHJvcF9tb25pdG9yOiBJbml0aWFsaXppbmcgbmV0d29yayBkcm9wIG1vbml0b3Igc2Vy
dmljZQpbICAgIDEuNjEzMjU0XSBORVQ6IFJlZ2lzdGVyZWQgUEZfSU5FVDYgcHJvdG9jb2wgZmFt
aWx5ClsgICAgMS42MjQzMDZdIEZyZWVpbmcgaW5pdHJkIG1lbW9yeTogMjYxNzZLClsgICAgMS42
MzQxMDddIFNlZ21lbnQgUm91dGluZyB3aXRoIElQdjYKWyAgICAxLjYzNDExNV0gUlBMIFNlZ21l
bnQgUm91dGluZyB3aXRoIElQdjYKWyAgICAxLjYzNDE0Ml0gSW4tc2l0dSBPQU0gKElPQU0pIHdp
dGggSVB2NgpbICAgIDEuNjM0MTkxXSBORVQ6IFJlZ2lzdGVyZWQgUEZfUEFDS0VUIHByb3RvY29s
IGZhbWlseQpbICAgIDEuNjM0NzYwXSBtaWNyb2NvZGU6IEN1cnJlbnQgcmV2aXNpb246IDB4MDAw
MDAwMjQKWyAgICAxLjYzNDc2Ml0gbWljcm9jb2RlOiBVcGRhdGVkIGVhcmx5IGZyb206IDB4MDAw
MDAwMGMKWyAgICAxLjYzNTA4OF0gcmVzY3RybDogTDIgYWxsb2NhdGlvbiBkZXRlY3RlZApbICAg
IDEuNjM1MTI2XSBJUEkgc2hvcnRoYW5kIGJyb2FkY2FzdDogZW5hYmxlZApbICAgIDEuNjM3NDEx
XSBzY2hlZF9jbG9jazogTWFya2luZyBzdGFibGUgKDE2MzIwMDEwMDYsIDUyNjMzMTUpLT4oMTY0
Mjk1NTg2NCwgLTU2OTE1NDMpClsgICAgMS42Mzc2NTVdIHJlZ2lzdGVyZWQgdGFza3N0YXRzIHZl
cnNpb24gMQpbICAgIDEuNjM4MDU2XSBMb2FkaW5nIGNvbXBpbGVkLWluIFguNTA5IGNlcnRpZmlj
YXRlcwpbICAgIDEuNjQ4ODM3XSBMb2FkZWQgWC41MDkgY2VydCAnQnVpbGQgdGltZSBhdXRvZ2Vu
ZXJhdGVkIGtlcm5lbCBrZXk6IDM1MjE4MzNjMWZlOTFkZDc3OGY4NjNhY2RmMDg0ODkzZjg4NjFk
OGUnClsgICAgMS42NTA5ODhdIERlbW90aW9uIHRhcmdldHMgZm9yIE5vZGUgMDogbnVsbApbICAg
IDEuNjUxMjk0XSBLZXkgdHlwZSAuZnNjcnlwdCByZWdpc3RlcmVkClsgICAgMS42NTEyOTddIEtl
eSB0eXBlIGZzY3J5cHQtcHJvdmlzaW9uaW5nIHJlZ2lzdGVyZWQKWyAgICAxLjY1MjIyMF0gaW50
ZWdyaXR5OiBMb2FkaW5nIFguNTA5IGNlcnRpZmljYXRlOiBVRUZJOmRiClsgICAgMS42NTIyODRd
IGludGVncml0eTogTG9hZGVkIFguNTA5IGNlcnQgJ01pY3Jvc29mdCBDb3Jwb3JhdGlvbiBVRUZJ
IENBIDIwMTE6IDEzYWRiZjQzMDliZDgyNzA5YzhjZDU0ZjMxNmVkNTIyOTg4YTFiZDQnClsgICAg
MS42NTIyODhdIGludGVncml0eTogTG9hZGluZyBYLjUwOSBjZXJ0aWZpY2F0ZTogVUVGSTpkYgpb
ICAgIDEuNjUyMzE5XSBpbnRlZ3JpdHk6IExvYWRlZCBYLjUwOSBjZXJ0ICdNaWNyb3NvZnQgV2lu
ZG93cyBQcm9kdWN0aW9uIFBDQSAyMDExOiBhOTI5MDIzOThlMTZjNDk3NzhjZDkwZjk5ZTRmOWFl
MTdjNTVhZjUzJwpbICAgIDEuNjUzNjEwXSBQTTogICBNYWdpYyBudW1iZXI6IDE6NTIxOjg5NApb
ICAgIDEuNjU5OTI3XSBSQVM6IENvcnJlY3RhYmxlIEVycm9ycyBjb2xsZWN0b3IgaW5pdGlhbGl6
ZWQuClsgICAgMS42ODIxNTRdIGNsazogRGlzYWJsaW5nIHVudXNlZCBjbG9ja3MKWyAgICAxLjY4
MjE2Ml0gUE06IGdlbnBkOiBEaXNhYmxpbmcgdW51c2VkIHBvd2VyIGRvbWFpbnMKWyAgICAxLjgz
MjU3NV0gdXNiIDEtMzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMiB1c2luZyB4
aGNpX2hjZApbICAgIDEuODk2MjM5XSBhdGEyOiBTQVRBIGxpbmsgZG93biAoU1N0YXR1cyA0IFND
b250cm9sIDMwMCkKWyAgICAxLjk1NzE0Nl0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2UgZm91bmQs
IGlkVmVuZG9yPTI4MDgsIGlkUHJvZHVjdD02NjUyLCBiY2REZXZpY2U9IDEuMDAKWyAgICAxLjk1
NzE2M10gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9Miwg
U2VyaWFsTnVtYmVyPTAKWyAgICAxLjk1NzE2OF0gdXNiIDEtMzogUHJvZHVjdDogRm9jYWxUZWNo
IEZpbmdlcnByaW50IERldmljZQpbICAgIDEuOTU3MTczXSB1c2IgMS0zOiBNYW51ZmFjdHVyZXI6
IEhPTFRFSwpbICAgIDIuMDU2NTQxXSBhdGExOiBTQVRBIGxpbmsgdXAgNi4wIEdicHMgKFNTdGF0
dXMgMTMzIFNDb250cm9sIDMwMCkKWyAgICAyLjA1NzQ5MV0gYXRhMS4wMDogQVRBLTEwOiBUUzI1
NkdNVFM0MzBTLCAyMlg0WEFJQSwgbWF4IFVETUEvMTMzClsgICAgMi4wNTc1NjJdIGF0YTEuMDA6
IDUwMDExODE5MiBzZWN0b3JzLCBtdWx0aSAxNjogTEJBNDggTkNRIChkZXB0aCAzMiksIEFBClsg
ICAgMi4wNTg0MDddIGF0YTEuMDA6IEZlYXR1cmVzOiBEZXYtU2xlZXAKWyAgICAyLjA1OTM2NF0g
YXRhMS4wMDogY29uZmlndXJlZCBmb3IgVURNQS8xMzMKWyAgICAyLjA2OTUwOF0gYWhjaSAwMDAw
OjAwOjEyLjA6IHBvcnQgZG9lcyBub3Qgc3VwcG9ydCBkZXZpY2Ugc2xlZXAKWyAgICAyLjA2OTk0
OF0gc2NzaSAwOjA6MDowOiBEaXJlY3QtQWNjZXNzICAgICBBVEEgICAgICBUUzI1NkdNVFM0MzBT
ICAgIFhBSUEgUFE6IDAgQU5TSTogNQpbICAgIDIuMDcwNDI2XSB1c2IgMS01OiBuZXcgaGlnaC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciAzIHVzaW5nIHhoY2lfaGNkClsgICAgMi4wNzA1NDVdIHNk
IDA6MDowOjA6IFtzZGFdIDUwMDExODE5MiA1MTItYnl0ZSBsb2dpY2FsIGJsb2NrczogKDI1NiBH
Qi8yMzggR2lCKQpbICAgIDIuMDcwNTU5XSBzZCAwOjA6MDowOiBbc2RhXSBXcml0ZSBQcm90ZWN0
IGlzIG9mZgpbICAgIDIuMDcwNTYzXSBzZCAwOjA6MDowOiBbc2RhXSBNb2RlIFNlbnNlOiAwMCAz
YSAwMCAwMApbICAgIDIuMDcwNTc4XSBzZCAwOjA6MDowOiBbc2RhXSBXcml0ZSBjYWNoZTogZW5h
YmxlZCwgcmVhZCBjYWNoZTogZW5hYmxlZCwgZG9lc24ndCBzdXBwb3J0IERQTyBvciBGVUEKWyAg
ICAyLjA3MDYwOV0gc2QgMDowOjA6MDogW3NkYV0gUHJlZmVycmVkIG1pbmltdW0gSS9PIHNpemUg
NTEyIGJ5dGVzClsgICAgMi4wODQwMDZdICBzZGE6IHNkYTEgc2RhMgpbICAgIDIuMDg0NDg2XSBz
ZCAwOjA6MDowOiBbc2RhXSBBdHRhY2hlZCBTQ1NJIGRpc2sKWyAgICAyLjA4NjE4Ml0gRnJlZWlu
ZyB1bnVzZWQgZGVjcnlwdGVkIG1lbW9yeTogMjAyOEsKWyAgICAyLjA4NzQ0Ml0gRnJlZWluZyB1
bnVzZWQga2VybmVsIGltYWdlIChpbml0bWVtKSBtZW1vcnk6IDQzMTZLClsgICAgMi4wODc0OTVd
IFdyaXRlIHByb3RlY3RpbmcgdGhlIGtlcm5lbCByZWFkLW9ubHkgZGF0YTogMzQ4MTZrClsgICAg
Mi4wODgyMzVdIEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAocm9kYXRhL2RhdGEgZ2FwKSBt
ZW1vcnk6IDEyMjBLClsgICAgMi4xMDY1NjhdIHg4Ni9tbTogQ2hlY2tlZCBXK1ggbWFwcGluZ3M6
IHBhc3NlZCwgbm8gVytYIHBhZ2VzIGZvdW5kLgpbICAgIDIuMTA2NTc2XSByb2RhdGFfdGVzdDog
YWxsIHRlc3RzIHdlcmUgc3VjY2Vzc2Z1bApbICAgIDIuMTA2NTg1XSBSdW4gL2luaXQgYXMgaW5p
dCBwcm9jZXNzClsgICAgMi4xMDY1ODddICAgd2l0aCBhcmd1bWVudHM6ClsgICAgMi4xMDY1ODld
ICAgICAvaW5pdApbICAgIDIuMTA2NTkxXSAgIHdpdGggZW52aXJvbm1lbnQ6ClsgICAgMi4xMDY1
OTJdICAgICBIT01FPS8KWyAgICAyLjEwNjU5M10gICAgIFRFUk09bGludXgKWyAgICAyLjEwNjU5
NF0gICAgIEJPT1RfSU1BR0U9L3ZtbGludXotbGludXgKWyAgICAyLjE3NjA1N10gcmFpZDY6IHNr
aXBwZWQgcHEgYmVuY2htYXJrIGFuZCBzZWxlY3RlZCBzc2UyeDQKWyAgICAyLjE3NjA2Nl0gcmFp
ZDY6IHVzaW5nIHNzc2UzeDIgcmVjb3ZlcnkgYWxnb3JpdGhtClsgICAgMi4xODIzMjJdIHhvcjog
bWVhc3VyaW5nIHNvZnR3YXJlIGNoZWNrc3VtIHNwZWVkClsgICAgMi4xODI1MzldICAgIHByZWZl
dGNoNjQtc3NlICA6IDE1NjE0IE1CL3NlYwpbICAgIDIuMTgyNzkyXSAgICBnZW5lcmljX3NzZSAg
ICAgOiAxMzI1OCBNQi9zZWMKWyAgICAyLjE4Mjc5NV0geG9yOiB1c2luZyBmdW5jdGlvbjogcHJl
ZmV0Y2g2NC1zc2UgKDE1NjE0IE1CL3NlYykKWyAgICAyLjI0NTY4OV0gdXNiIDEtNTogTmV3IFVT
QiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTBiZGEsIGlkUHJvZHVjdD01ODQyLCBiY2REZXZpY2U9
IDAuMDEKWyAgICAyLjI0NTcwMV0gdXNiIDEtNTogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZy
PTMsIFByb2R1Y3Q9MSwgU2VyaWFsTnVtYmVyPTIKWyAgICAyLjI0NTcwM10gdXNiIDEtNTogUHJv
ZHVjdDogRnJvbnQgQ2FtZXJhClsgICAgMi4yNDU3MDZdIHVzYiAxLTU6IE1hbnVmYWN0dXJlcjog
RnJvbnQgQ2FtZXJhClsgICAgMi4yNDU3MDddIHVzYiAxLTU6IFNlcmlhbE51bWJlcjogMjAwOTAx
MDEwMDAxClsgICAgMi4zNjIzMTRdIHVzYiAxLTY6IG5ldyBoaWdoLXNwZWVkIFVTQiBkZXZpY2Ug
bnVtYmVyIDQgdXNpbmcgeGhjaV9oY2QKWyAgICAyLjM5MTM4NF0gQnRyZnMgbG9hZGVkLCB6b25l
ZD15ZXMsIGZzdmVyaXR5PXllcwpbICAgIDIuNDk0Mjc2XSB1c2IgMS02OiBOZXcgVVNCIGRldmlj
ZSBmb3VuZCwgaWRWZW5kb3I9MGM0NSwgaWRQcm9kdWN0PTYzNmQsIGJjZERldmljZT0gMS4wMApb
ICAgIDIuNDk0Mjg4XSB1c2IgMS02OiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MiwgUHJv
ZHVjdD0xLCBTZXJpYWxOdW1iZXI9MwpbICAgIDIuNDk0MjkxXSB1c2IgMS02OiBQcm9kdWN0OiBV
U0IgMi4wIENhbWVyYQpbICAgIDIuNDk0MjkzXSB1c2IgMS02OiBNYW51ZmFjdHVyZXI6IFNvbml4
IFRlY2hub2xvZ3kgQ28uLCBMdGQuClsgICAgMi40OTQyOTVdIHVzYiAxLTY6IFNlcmlhbE51bWJl
cjogU04wMDAxClsgICAgMi42MDgyODldIHVzYiAxLTg6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZp
Y2UgbnVtYmVyIDUgdXNpbmcgeGhjaV9oY2QKWyAgICAyLjYxNjExNV0gaTgwNDI6IFBOUDogUFMv
MiBDb250cm9sbGVyIFtQTlAwMzAzOlBTMktdIGF0IDB4NjAsMHg2NCBpcnEgMQpbICAgIDIuNjE2
MTIzXSBpODA0MjogUE5QOiBQUy8yIGFwcGVhcnMgdG8gaGF2ZSBBVVggcG9ydCBkaXNhYmxlZCwg
aWYgdGhpcyBpcyBpbmNvcnJlY3QgcGxlYXNlIGJvb3Qgd2l0aCBpODA0Mi5ub3BucApbICAgIDIu
NjE3Nzg0XSBzZXJpbzogaTgwNDIgS0JEIHBvcnQgYXQgMHg2MCwweDY0IGlycSAxClsgICAgMi42
Mzc0NjhdIHJ0c3hfcGNpIDAwMDA6MDM6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAw
MDIpClsgICAgMi42ODExMzVdIHNkaGNpOiBTZWN1cmUgRGlnaXRhbCBIb3N0IENvbnRyb2xsZXIg
SW50ZXJmYWNlIGRyaXZlcgpbICAgIDIuNjgxMTQzXSBzZGhjaTogQ29weXJpZ2h0KGMpIFBpZXJy
ZSBPc3NtYW4KWyAgICAyLjcwNDQwNl0gc2RoY2ktcGNpIDAwMDA6MDA6MWMuMDogU0RIQ0kgY29u
dHJvbGxlciBmb3VuZCBbODA4NjozMWNjXSAocmV2IDYpClsgICAgMi43MDQ4NzNdIG1tYzE6IENR
SENJIHZlcnNpb24gNS4xMApbICAgIDIuNzA0OTUxXSBzZGhjaS1wY2kgMDAwMDowMDoxZS4wOiBT
REhDSSBjb250cm9sbGVyIGZvdW5kIFs4MDg2OjMxZDBdIChyZXYgNikKWyAgICAyLjcwNDk2NV0g
c2RoY2ktcGNpIDAwMDA6MDA6MWUuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDIpClsg
ICAgMi43MDU0NDhdIG1tYzI6IFNESENJIGNvbnRyb2xsZXIgb24gUENJIFswMDAwOjAwOjFlLjBd
IHVzaW5nIEFETUEgNjQtYml0ClsgICAgMi43MDU0NTFdIG1tYzE6IFNESENJIGNvbnRyb2xsZXIg
b24gUENJIFswMDAwOjAwOjFjLjBdIHVzaW5nIEFETUEgNjQtYml0ClsgICAgMi43MTM4NjNdIGlu
cHV0OiBBVCBUcmFuc2xhdGVkIFNldCAyIGtleWJvYXJkIGFzIC9kZXZpY2VzL3BsYXRmb3JtL2k4
MDQyL3NlcmlvMC9pbnB1dC9pbnB1dDIKWyAgICAyLjczMzUyNl0gdXNiIDEtODogTmV3IFVTQiBk
ZXZpY2UgZm91bmQsIGlkVmVuZG9yPTEwMTgsIGlkUHJvZHVjdD0xMDA2LCBiY2REZXZpY2U9IDEu
MDkKWyAgICAyLjczMzUzNl0gdXNiIDEtODogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAs
IFByb2R1Y3Q9MCwgU2VyaWFsTnVtYmVyPTAKWyAgICAyLjg0NjMyMF0gdXNiIDEtOTogbmV3IGZ1
bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgNiB1c2luZyB4aGNpX2hjZApbICAgIDIuODc2OTE2
XSBtbWMyOiBGYWlsZWQgdG8gaW5pdGlhbGl6ZSBhIG5vbi1yZW1vdmFibGUgY2FyZApbICAgIDIu
ODg2Mzc4XSBtbWMxOiBDb21tYW5kIFF1ZXVlIEVuZ2luZSBlbmFibGVkClsgICAgMi44ODYzODRd
IG1tYzE6IG5ldyBIUzQwMCBNTUMgY2FyZCBhdCBhZGRyZXNzIDAwMDEKWyAgICAyLjk3MDgyNV0g
dXNiIDEtOTogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTgwODcsIGlkUHJvZHVjdD0w
YWFhLCBiY2REZXZpY2U9IDAuMDIKWyAgICAyLjk3MDgzMl0gdXNiIDEtOTogTmV3IFVTQiBkZXZp
Y2Ugc3RyaW5nczogTWZyPTAsIFByb2R1Y3Q9MCwgU2VyaWFsTnVtYmVyPTAKWyAgICAzLjQ3OTcx
NF0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm1dIFVua25vd24gcmV2aXNpb24gMHgwNgpbICAgIDMu
NDc5NzI1XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gRm91bmQgZ2VtaW5pbGFrZSAoZGV2aWNl
IElEIDMxODQpIGRpc3BsYXkgdmVyc2lvbiAxMC4wMCBzdGVwcGluZyAqKgpbICAgIDMuNDc5NzMx
XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gVW5rbm93biByZXZpZCAweDA2ClsgICAgMy40ODYx
NjVdIG1tY2JsazE6IG1tYzE6MDAwMSBBUlYxMVggNTguMyBHaUIKWyAgICAzLjQ5NzYwOV0gdXNi
Y29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1c2JoaWQKWyAgICAzLjQ5NzYx
N10gdXNiaGlkOiBVU0IgSElEIGNvcmUgZHJpdmVyClsgICAgMy40OTg5NzddIGk5MTUgMDAwMDow
MDowMi4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUKWyAgICAzLjQ5OTEzNl0gaTkx
NSAwMDAwOjAwOjAyLjA6IFtkcm1dIGNvdWxkbid0IGdldCBtZW1vcnkgaW5mb3JtYXRpb24KWyAg
ICAzLjQ5OTQ3N10gaTkxNSAwMDAwOjAwOjAyLjA6IHZnYWFyYjogVkdBIGRlY29kZXMgY2hhbmdl
ZDogb2xkZGVjb2Rlcz1pbyttZW0sZGVjb2Rlcz1pbyttZW06b3ducz1pbyttZW0KWyAgICAzLjUw
MDkxMF0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm1dIEZpbmlzaGVkIGxvYWRpbmcgRE1DIGZpcm13
YXJlIGk5MTUvZ2xrX2RtY192ZXIxXzA0LmJpbiAodjEuNCkKWyAgICAzLjUwMzUyNF0gIG1tY2Js
azE6IHAxIHAyClsgICAgMy41MDM3ODBdIG1tY2JsazFib290MDogbW1jMTowMDAxIEFSVjExWCA0
LjAwIE1pQgpbICAgIDMuNTA0MTgzXSBtbWNibGsxYm9vdDE6IG1tYzE6MDAwMSBBUlYxMVggNC4w
MCBNaUIKWyAgICAzLjUwNDY5NV0gbW1jYmxrMXJwbWI6IG1tYzE6MDAwMSBBUlYxMVggNC4wMCBN
aUIsIGNoYXJkZXYgKDI0MDowKQpbICAgIDMuNTA1NTk3XSBpbnB1dDogSElEIDEwMTg6MTAwNiBh
cyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2IxLzEtOC8xLTg6MS4wLzAwMDM6
MTAxODoxMDA2LjAwMDEvaW5wdXQvaW5wdXQzClsgICAgMy41NjA5MjBdIFtkcm1dIEluaXRpYWxp
emVkIGk5MTUgMS42LjAgZm9yIDAwMDA6MDA6MDIuMCBvbiBtaW5vciAxClsgICAgMy41NjI2ODdd
IEFDUEk6IHZpZGVvOiBWaWRlbyBEZXZpY2UgW0dGWDBdIChtdWx0aS1oZWFkOiB5ZXMgIHJvbTog
bm8gIHBvc3Q6IG5vKQpbICAgIDMuNTYyODU4XSBpbnB1dDogVmlkZW8gQnVzIGFzIC9kZXZpY2Vz
L0xOWFNZU1RNOjAwL0xOWFNZQlVTOjAwL1BOUDBBMDg6MDAvTE5YVklERU86MDAvaW5wdXQvaW5w
dXQ0ClsgICAgMy41ODI5ODRdIGhpZC1nZW5lcmljIDAwMDM6MTAxODoxMDA2LjAwMDE6IGlucHV0
LGhpZHJhdzA6IFVTQiBISUQgdjEuMTEgS2V5Ym9hcmQgW0hJRCAxMDE4OjEwMDZdIG9uIHVzYi0w
MDAwOjAwOjE1LjAtOC9pbnB1dDAKWyAgICAzLjU4NDY0NV0gaW5wdXQ6IEhJRCAxMDE4OjEwMDYg
TW91c2UgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvdXNiMS8xLTgvMS04OjEu
MS8wMDAzOjEwMTg6MTAwNi4wMDAyL2lucHV0L2lucHV0NQpbICAgIDMuNTg0ODMyXSBpbnB1dDog
SElEIDEwMTg6MTAwNiBUb3VjaHBhZCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUu
MC91c2IxLzEtOC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDIvaW5wdXQvaW5wdXQ2ClsgICAg
My41ODUwMDVdIGlucHV0OiBISUQgMTAxODoxMDA2IFN5c3RlbSBDb250cm9sIGFzIC9kZXZpY2Vz
L3BjaTAwMDA6MDAvMDAwMDowMDoxNS4wL3VzYjEvMS04LzEtODoxLjEvMDAwMzoxMDE4OjEwMDYu
MDAwMi9pbnB1dC9pbnB1dDcKWyAgICAzLjU5NjM2Nl0gZmJjb246IGk5MTVkcm1mYiAoZmIwKSBp
cyBwcmltYXJ5IGRldmljZQpbICAgIDMuNTk2MzY5XSBmYmNvbjogRGVmZXJyaW5nIGNvbnNvbGUg
dGFrZS1vdmVyClsgICAgMy41OTYzNzJdIGk5MTUgMDAwMDowMDowMi4wOiBbZHJtXSBmYjA6IGk5
MTVkcm1mYiBmcmFtZSBidWZmZXIgZGV2aWNlClsgICAgMy42MzU1ODJdIGlucHV0OiBISUQgMTAx
ODoxMDA2IENvbnN1bWVyIENvbnRyb2wgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1
LjAvdXNiMS8xLTgvMS04OjEuMS8wMDAzOjEwMTg6MTAwNi4wMDAyL2lucHV0L2lucHV0OApbICAg
IDMuNjM1OTAyXSBoaWQtZ2VuZXJpYyAwMDAzOjEwMTg6MTAwNi4wMDAyOiBpbnB1dCxoaWRkZXY5
NixoaWRyYXcxOiBVU0IgSElEIHYxLjExIE1vdXNlIFtISUQgMTAxODoxMDA2XSBvbiB1c2ItMDAw
MDowMDoxNS4wLTgvaW5wdXQxClsgICAgMy43MjIzOTNdIGlucHV0OiBISUQgMTAxODoxMDA2IE1v
dXNlIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxNS4wL3VzYjEvMS04LzEtODoxLjEv
MDAwMzoxMDE4OjEwMDYuMDAwMi9pbnB1dC9pbnB1dDkKWyAgICAzLjcyMjU0N10gaW5wdXQ6IEhJ
RCAxMDE4OjEwMDYgVG91Y2hwYWQgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAv
dXNiMS8xLTgvMS04OjEuMS8wMDAzOjEwMTg6MTAwNi4wMDAyL2lucHV0L2lucHV0MTAKWyAgICAz
LjcyMjY1Ml0gaW5wdXQ6IEhJRCAxMDE4OjEwMDYgU3lzdGVtIENvbnRyb2wgYXMgL2RldmljZXMv
cGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvdXNiMS8xLTgvMS04OjEuMS8wMDAzOjEwMTg6MTAwNi4w
MDAyL2lucHV0L2lucHV0MTEKWyAgICAzLjc3NDAxMl0gaW5wdXQ6IEhJRCAxMDE4OjEwMDYgQ29u
c3VtZXIgQ29udHJvbCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2IxLzEt
OC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDIvaW5wdXQvaW5wdXQxMgpbICAgIDMuNzc0MjM2
XSBoaWQtbXVsdGl0b3VjaCAwMDAzOjEwMTg6MTAwNi4wMDAyOiBpbnB1dCxoaWRkZXY5NixoaWRy
YXcxOiBVU0IgSElEIHYxLjExIE1vdXNlIFtISUQgMTAxODoxMDA2XSBvbiB1c2ItMDAwMDowMDox
NS4wLTgvaW5wdXQxClsgICAgMy44MjMxNDhdIEJUUkZTOiBkZXZpY2UgZnNpZCBkYjM5ZDFmZS0w
NDIzLTQ1MDItODFiMi01NjA1YjlmOTY5YTAgZGV2aWQgMSB0cmFuc2lkIDM4MyAvZGV2L3NkYTIg
KDg6Mikgc2Nhbm5lZCBieSBtb3VudCAoMjE3KQpbICAgIDMuODIzNjMzXSBCVFJGUyBpbmZvIChk
ZXZpY2Ugc2RhMik6IGZpcnN0IG1vdW50IG9mIGZpbGVzeXN0ZW0gZGIzOWQxZmUtMDQyMy00NTAy
LTgxYjItNTYwNWI5Zjk2OWEwClsgICAgMy44MjM2NTNdIEJUUkZTIGluZm8gKGRldmljZSBzZGEy
KTogdXNpbmcgY3JjMzJjIChjcmMzMmMtaW50ZWwpIGNoZWNrc3VtIGFsZ29yaXRobQpbICAgIDMu
ODIzNjYxXSBCVFJGUyBpbmZvIChkZXZpY2Ugc2RhMik6IHVzaW5nIGZyZWUtc3BhY2UtdHJlZQpb
ICAgIDMuODg3MTIyXSB1c2IgMS0zOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAyClsg
ICAgNC4wMjQxMTddIHN5c3RlbWRbMV06IHN5c3RlbWQgMjU3LjQtMS1hcmNoIHJ1bm5pbmcgaW4g
c3lzdGVtIG1vZGUgKCtQQU0gK0FVRElUIC1TRUxJTlVYIC1BUFBBUk1PUiAtSU1BICtJUEUgK1NN
QUNLICtTRUNDT01QICtHQ1JZUFQgK0dOVVRMUyArT1BFTlNTTCArQUNMICtCTEtJRCArQ1VSTCAr
RUxGVVRJTFMgK0ZJRE8yICtJRE4yIC1JRE4gK0lQVEMgK0tNT0QgK0xJQkNSWVBUU0VUVVAgK0xJ
QkNSWVBUU0VUVVBfUExVR0lOUyArTElCRkRJU0sgK1BDUkUyICtQV1FVQUxJVFkgK1AxMUtJVCAr
UVJFTkNPREUgK1RQTTIgK0JaSVAyICtMWjQgK1haICtaTElCICtaU1REICtCUEZfRlJBTUVXT1JL
ICtCVEYgK1hLQkNPTU1PTiArVVRNUCAtU1lTVklOSVQgK0xJQkFSQ0hJVkUpClsgICAgNC4wMjQx
MzNdIHN5c3RlbWRbMV06IERldGVjdGVkIGFyY2hpdGVjdHVyZSB4ODYtNjQuClsgICAgNC4xNzU2
MTBdIHN5c3RlbWRbMV06IGJwZi1yZXN0cmljdC1mczogTFNNIEJQRiBwcm9ncmFtIGF0dGFjaGVk
ClsgICAgNC4zNTA0MDNdIHVzYiAxLTM6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVy
IDcgdXNpbmcgeGhjaV9oY2QKWyAgICA0LjQ3NDg4NV0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTI4MDgsIGlkUHJvZHVjdD02NjUyLCBiY2REZXZpY2U9IDEuMDAKWyAg
ICA0LjQ3NDg5Nl0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1
Y3Q9MiwgU2VyaWFsTnVtYmVyPTAKWyAgICA0LjQ3NDg5OF0gdXNiIDEtMzogUHJvZHVjdDogRm9j
YWxUZWNoIEZpbmdlcnByaW50IERldmljZQpbICAgIDQuNDc0OTAwXSB1c2IgMS0zOiBNYW51ZmFj
dHVyZXI6IEhPTFRFSwpbICAgIDQuNTQ0NjUzXSB6cmFtOiBBZGRlZCBkZXZpY2U6IHpyYW0wClsg
ICAgNC43MDI4MDVdIHN5c3RlbWRbMV06IFF1ZXVlZCBzdGFydCBqb2IgZm9yIGRlZmF1bHQgdGFy
Z2V0IEdyYXBoaWNhbCBJbnRlcmZhY2UuClsgICAgNC43MjU5NThdIHN5c3RlbWRbMV06IENyZWF0
ZWQgc2xpY2UgU2xpY2UgL3N5c3RlbS9kaXJtbmdyLgpbICAgIDQuNzI2NTYxXSBzeXN0ZW1kWzFd
OiBDcmVhdGVkIHNsaWNlIFNsaWNlIC9zeXN0ZW0vZ2V0dHkuClsgICAgNC43MjcwNzldIHN5c3Rl
bWRbMV06IENyZWF0ZWQgc2xpY2UgU2xpY2UgL3N5c3RlbS9ncGctYWdlbnQuClsgICAgNC43Mjc2
MTldIHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2UgU2xpY2UgL3N5c3RlbS9ncGctYWdlbnQtYnJv
d3Nlci4KWyAgICA0LjcyODEyMl0gc3lzdGVtZFsxXTogQ3JlYXRlZCBzbGljZSBTbGljZSAvc3lz
dGVtL2dwZy1hZ2VudC1leHRyYS4KWyAgICA0LjcyODY0N10gc3lzdGVtZFsxXTogQ3JlYXRlZCBz
bGljZSBTbGljZSAvc3lzdGVtL2dwZy1hZ2VudC1zc2guClsgICAgNC43MjkxNTldIHN5c3RlbWRb
MV06IENyZWF0ZWQgc2xpY2UgU2xpY2UgL3N5c3RlbS9rZXlib3hkLgpbICAgIDQuNzI5Njg0XSBz
eXN0ZW1kWzFdOiBDcmVhdGVkIHNsaWNlIFNsaWNlIC9zeXN0ZW0vbW9kcHJvYmUuClsgICAgNC43
MzAxODZdIHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2UgU2xpY2UgL3N5c3RlbS9zeXN0ZW1kLXpy
YW0tc2V0dXAuClsgICAgNC43MzA2MTZdIHN5c3RlbWRbMV06IENyZWF0ZWQgc2xpY2UgVXNlciBh
bmQgU2Vzc2lvbiBTbGljZS4KWyAgICA0LjczMDcxNF0gc3lzdGVtZFsxXTogU3RhcnRlZCBEaXNw
YXRjaCBQYXNzd29yZCBSZXF1ZXN0cyB0byBDb25zb2xlIERpcmVjdG9yeSBXYXRjaC4KWyAgICA0
LjczMDc5NF0gc3lzdGVtZFsxXTogU3RhcnRlZCBGb3J3YXJkIFBhc3N3b3JkIFJlcXVlc3RzIHRv
IFdhbGwgRGlyZWN0b3J5IFdhdGNoLgpbICAgIDQuNzMxMDc0XSBzeXN0ZW1kWzFdOiBTZXQgdXAg
YXV0b21vdW50IEFyYml0cmFyeSBFeGVjdXRhYmxlIEZpbGUgRm9ybWF0cyBGaWxlIFN5c3RlbSBB
dXRvbW91bnQgUG9pbnQuClsgICAgNC43MzExMDhdIHN5c3RlbWRbMV06IEV4cGVjdGluZyBkZXZp
Y2UgL2Rldi9kaXNrL2J5LXV1aWQvMThDRC1BNEI4Li4uClsgICAgNC43MzExMjJdIHN5c3RlbWRb
MV06IEV4cGVjdGluZyBkZXZpY2UgL2Rldi9kaXNrL2J5LXV1aWQvZGIzOWQxZmUtMDQyMy00NTAy
LTgxYjItNTYwNWI5Zjk2OWEwLi4uClsgICAgNC43MzExMzVdIHN5c3RlbWRbMV06IEV4cGVjdGlu
ZyBkZXZpY2UgL2Rldi96cmFtMC4uLgpbICAgIDQuNzMxMTU4XSBzeXN0ZW1kWzFdOiBSZWFjaGVk
IHRhcmdldCBMb2NhbCBFbmNyeXB0ZWQgVm9sdW1lcy4KWyAgICA0LjczMTE4NV0gc3lzdGVtZFsx
XTogUmVhY2hlZCB0YXJnZXQgTG9naW4gUHJvbXB0cy4KWyAgICA0LjczMTIwNV0gc3lzdGVtZFsx
XTogUmVhY2hlZCB0YXJnZXQgTG9jYWwgSW50ZWdyaXR5IFByb3RlY3RlZCBWb2x1bWVzLgpbICAg
IDQuNzMxMjM5XSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBQYXRoIFVuaXRzLgpbICAgIDQu
NzMxMjYzXSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBSZW1vdGUgRmlsZSBTeXN0ZW1zLgpb
ICAgIDQuNzMxMjg5XSBzeXN0ZW1kWzFdOiBSZWFjaGVkIHRhcmdldCBTbGljZSBVbml0cy4KWyAg
ICA0LjczMTMzM10gc3lzdGVtZFsxXTogUmVhY2hlZCB0YXJnZXQgTG9jYWwgVmVyaXR5IFByb3Rl
Y3RlZCBWb2x1bWVzLgpbICAgIDQuNzMxNDU1XSBzeXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gRGV2
aWNlLW1hcHBlciBldmVudCBkYWVtb24gRklGT3MuClsgICAgNC43MzU3NTFdIHN5c3RlbWRbMV06
IExpc3RlbmluZyBvbiBQcm9jZXNzIENvcmUgRHVtcCBTb2NrZXQuClsgICAgNC43MzY4NzRdIHN5
c3RlbWRbMV06IExpc3RlbmluZyBvbiBDcmVkZW50aWFsIEVuY3J5cHRpb24vRGVjcnlwdGlvbi4K
WyAgICA0LjczNzAyOF0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIEpvdXJuYWwgU29ja2V0ICgv
ZGV2L2xvZykuClsgICAgNC43MzcxNzJdIHN5c3RlbWRbMV06IExpc3RlbmluZyBvbiBKb3VybmFs
IFNvY2tldHMuClsgICAgNC43MzcyMjddIHN5c3RlbWRbMV06IFRQTSBQQ1IgTWVhc3VyZW1lbnRz
IHdhcyBza2lwcGVkIGJlY2F1c2Ugb2YgYW4gdW5tZXQgY29uZGl0aW9uIGNoZWNrIChDb25kaXRp
b25TZWN1cml0eT1tZWFzdXJlZC11a2kpLgpbICAgIDQuNzM3MjUxXSBzeXN0ZW1kWzFdOiBNYWtl
IFRQTSBQQ1IgUG9saWN5IHdhcyBza2lwcGVkIGJlY2F1c2Ugb2YgYW4gdW5tZXQgY29uZGl0aW9u
IGNoZWNrIChDb25kaXRpb25TZWN1cml0eT1tZWFzdXJlZC11a2kpLgpbICAgIDQuNzM3MzY4XSBz
eXN0ZW1kWzFdOiBMaXN0ZW5pbmcgb24gdWRldiBDb250cm9sIFNvY2tldC4KWyAgICA0LjczNzQ0
OV0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIHVkZXYgS2VybmVsIFNvY2tldC4KWyAgICA0Ljcz
NzU3MF0gc3lzdGVtZFsxXTogTGlzdGVuaW5nIG9uIFVzZXIgRGF0YWJhc2UgTWFuYWdlciBTb2Nr
ZXQuClsgICAgNC43NDA0MzBdIHN5c3RlbWRbMV06IE1vdW50aW5nIEh1Z2UgUGFnZXMgRmlsZSBT
eXN0ZW0uLi4KWyAgICA0Ljc0MTc5NV0gc3lzdGVtZFsxXTogTW91bnRpbmcgUE9TSVggTWVzc2Fn
ZSBRdWV1ZSBGaWxlIFN5c3RlbS4uLgpbICAgIDQuNzQzMTM3XSBzeXN0ZW1kWzFdOiBNb3VudGlu
ZyBLZXJuZWwgRGVidWcgRmlsZSBTeXN0ZW0uLi4KWyAgICA0Ljc0NDU2M10gc3lzdGVtZFsxXTog
TW91bnRpbmcgS2VybmVsIFRyYWNlIEZpbGUgU3lzdGVtLi4uClsgICAgNC43NDc1MDNdIHN5c3Rl
bWRbMV06IFN0YXJ0aW5nIENyZWF0ZSBMaXN0IG9mIFN0YXRpYyBEZXZpY2UgTm9kZXMuLi4KWyAg
ICA0Ljc1ODE1MF0gc3lzdGVtZFsxXTogU3RhcnRpbmcgTG9hZCBLZXJuZWwgTW9kdWxlIGNvbmZp
Z2ZzLi4uClsgICAgNC43NjE2MDldIHN5c3RlbWRbMV06IFN0YXJ0aW5nIExvYWQgS2VybmVsIE1v
ZHVsZSBkbV9tb2QuLi4KWyAgICA0Ljc2MzI3M10gc3lzdGVtZFsxXTogU3RhcnRpbmcgTG9hZCBL
ZXJuZWwgTW9kdWxlIGRybS4uLgpbICAgIDQuNzY0OTQwXSBzeXN0ZW1kWzFdOiBTdGFydGluZyBM
b2FkIEtlcm5lbCBNb2R1bGUgZnVzZS4uLgpbICAgIDQuNzY5NTU3XSBzeXN0ZW1kWzFdOiBTdGFy
dGluZyBMb2FkIEtlcm5lbCBNb2R1bGUgbG9vcC4uLgpbICAgIDQuNzY5NjYyXSBzeXN0ZW1kWzFd
OiBDbGVhciBTdGFsZSBIaWJlcm5hdGUgU3RvcmFnZSBJbmZvIHdhcyBza2lwcGVkIGJlY2F1c2Ug
b2YgYW4gdW5tZXQgY29uZGl0aW9uIGNoZWNrIChDb25kaXRpb25QYXRoRXhpc3RzPS9zeXMvZmly
bXdhcmUvZWZpL2VmaXZhcnMvSGliZXJuYXRlTG9jYXRpb24tOGNmMjY0NGItNGIwYi00MjhmLTkz
ODctNmQ4NzYwNTBkYzY3KS4KWyAgICA0Ljc3MjM0M10gc3lzdGVtZFsxXTogU3RhcnRpbmcgSm91
cm5hbCBTZXJ2aWNlLi4uClsgICAgNC43NzU0MDJdIHN5c3RlbWRbMV06IFN0YXJ0aW5nIExvYWQg
S2VybmVsIE1vZHVsZXMuLi4KWyAgICA0Ljc3NTQ0N10gc3lzdGVtZFsxXTogVFBNIFBDUiBNYWNo
aW5lIElEIE1lYXN1cmVtZW50IHdhcyBza2lwcGVkIGJlY2F1c2Ugb2YgYW4gdW5tZXQgY29uZGl0
aW9uIGNoZWNrIChDb25kaXRpb25TZWN1cml0eT1tZWFzdXJlZC11a2kpLgpbICAgIDQuNzc4NzQy
XSBzeXN0ZW1kWzFdOiBTdGFydGluZyBSZW1vdW50IFJvb3QgYW5kIEtlcm5lbCBGaWxlIFN5c3Rl
bXMuLi4KWyAgICA0Ljc3ODgzN10gc3lzdGVtZFsxXTogRWFybHkgVFBNIFNSSyBTZXR1cCB3YXMg
c2tpcHBlZCBiZWNhdXNlIG9mIGFuIHVubWV0IGNvbmRpdGlvbiBjaGVjayAoQ29uZGl0aW9uU2Vj
dXJpdHk9bWVhc3VyZWQtdWtpKS4KWyAgICA0Ljc4MjY2M10gc3lzdGVtZFsxXTogU3RhcnRpbmcg
TG9hZCB1ZGV2IFJ1bGVzIGZyb20gQ3JlZGVudGlhbHMuLi4KWyAgICA0Ljc4NTcxN10gc3lzdGVt
ZFsxXTogU3RhcnRpbmcgQ29sZHBsdWcgQWxsIHVkZXYgRGV2aWNlcy4uLgpbICAgIDQuNzkwNzMz
XSBkZXZpY2UtbWFwcGVyOiB1ZXZlbnQ6IHZlcnNpb24gMS4wLjMKWyAgICA0Ljc5MDg3OF0gZGV2
aWNlLW1hcHBlcjogaW9jdGw6IDQuNDguMC1pb2N0bCAoMjAyMy0wMy0wMSkgaW5pdGlhbGlzZWQ6
IGRtLWRldmVsQGxpc3RzLmxpbnV4LmRldgpbICAgIDQuNzkzODg4XSBzeXN0ZW1kWzFdOiBNb3Vu
dGVkIEh1Z2UgUGFnZXMgRmlsZSBTeXN0ZW0uClsgICAgNC43OTQwODldIHN5c3RlbWRbMV06IE1v
dW50ZWQgUE9TSVggTWVzc2FnZSBRdWV1ZSBGaWxlIFN5c3RlbS4KWyAgICA0Ljc5NDIzNV0gc3lz
dGVtZFsxXTogTW91bnRlZCBLZXJuZWwgRGVidWcgRmlsZSBTeXN0ZW0uClsgICAgNC43OTQzODVd
IHN5c3RlbWRbMV06IE1vdW50ZWQgS2VybmVsIFRyYWNlIEZpbGUgU3lzdGVtLgpbICAgIDQuNzk0
ODE4XSBzeXN0ZW1kWzFdOiBGaW5pc2hlZCBDcmVhdGUgTGlzdCBvZiBTdGF0aWMgRGV2aWNlIE5v
ZGVzLgpbICAgIDQuNzk1NTU0XSBzeXN0ZW1kWzFdOiBtb2Rwcm9iZUBjb25maWdmcy5zZXJ2aWNl
OiBEZWFjdGl2YXRlZCBzdWNjZXNzZnVsbHkuClsgICAgNC44MDA5ODhdIHN5c3RlbWRbMV06IEZp
bmlzaGVkIExvYWQgS2VybmVsIE1vZHVsZSBjb25maWdmcy4KWyAgICA0LjgwMjU0M10gc3lzdGVt
ZFsxXTogbW9kcHJvYmVAZG1fbW9kLnNlcnZpY2U6IERlYWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4K
WyAgICA0LjgwMjgzOF0gc3lzdGVtZFsxXTogRmluaXNoZWQgTG9hZCBLZXJuZWwgTW9kdWxlIGRt
X21vZC4KWyAgICA0LjgwMzQzMl0gc3lzdGVtZFsxXTogbW9kcHJvYmVAZHJtLnNlcnZpY2U6IERl
YWN0aXZhdGVkIHN1Y2Nlc3NmdWxseS4KWyAgICA0LjgwMzc0N10gc3lzdGVtZFsxXTogRmluaXNo
ZWQgTG9hZCBLZXJuZWwgTW9kdWxlIGRybS4KWyAgICA0LjgwNDIyNV0gc3lzdGVtZFsxXTogbW9k
cHJvYmVAZnVzZS5zZXJ2aWNlOiBEZWFjdGl2YXRlZCBzdWNjZXNzZnVsbHkuClsgICAgNC44MDQ3
MTddIHN5c3RlbWRbMV06IEZpbmlzaGVkIExvYWQgS2VybmVsIE1vZHVsZSBmdXNlLgpbICAgIDQu
ODA1OTk4XSBsb29wOiBtb2R1bGUgbG9hZGVkClsgICAgNC44MDcxMzddIHN5c3RlbWRbMV06IE1v
dW50aW5nIEZVU0UgQ29udHJvbCBGaWxlIFN5c3RlbS4uLgpbICAgIDQuODA5MTE2XSBzeXN0ZW1k
WzFdOiBNb3VudGluZyBLZXJuZWwgQ29uZmlndXJhdGlvbiBGaWxlIFN5c3RlbS4uLgpbICAgIDQu
ODEzNTMzXSBzeXN0ZW1kWzFdOiBTdGFydGluZyBDcmVhdGUgU3RhdGljIERldmljZSBOb2RlcyBp
biAvZGV2IGdyYWNlZnVsbHkuLi4KWyAgICA0LjgxNDIxMl0gc3lzdGVtZFsxXTogbW9kcHJvYmVA
bG9vcC5zZXJ2aWNlOiBEZWFjdGl2YXRlZCBzdWNjZXNzZnVsbHkuClsgICAgNC44MTQ2MzddIHN5
c3RlbWQtam91cm5hbGRbMjc4XTogQ29sbGVjdGluZyBhdWRpdCBtZXNzYWdlcyBpcyBkaXNhYmxl
ZC4KWyAgICA0LjgyMTczNF0gc3lzdGVtZFsxXTogRmluaXNoZWQgTG9hZCBLZXJuZWwgTW9kdWxl
IGxvb3AuClsgICAgNC44MjU0NDZdIGkyY19kZXY6IGkyYyAvZGV2IGVudHJpZXMgZHJpdmVyClsg
ICAgNC44Mjg3MjBdIHN5c3RlbWRbMV06IEZpbmlzaGVkIExvYWQgS2VybmVsIE1vZHVsZXMuClsg
ICAgNC44Mjk0MjFdIHN5c3RlbWRbMV06IEZpbmlzaGVkIExvYWQgdWRldiBSdWxlcyBmcm9tIENy
ZWRlbnRpYWxzLgpbICAgIDQuODMwMzA5XSBzeXN0ZW1kWzFdOiBNb3VudGVkIEZVU0UgQ29udHJv
bCBGaWxlIFN5c3RlbS4KWyAgICA0LjgzMDQ5Nl0gc3lzdGVtZFsxXTogTW91bnRlZCBLZXJuZWwg
Q29uZmlndXJhdGlvbiBGaWxlIFN5c3RlbS4KWyAgICA0LjgzMDgxMF0gc3lzdGVtZFsxXTogUmVw
YXJ0aXRpb24gUm9vdCBEaXNrIHdhcyBza2lwcGVkIGJlY2F1c2Ugbm8gdHJpZ2dlciBjb25kaXRp
b24gY2hlY2tzIHdlcmUgbWV0LgpbICAgIDQuODMyMjQxXSBzeXN0ZW1kWzFdOiBTdGFydGluZyBB
cHBseSBLZXJuZWwgVmFyaWFibGVzLi4uClsgICAgNC44NTIyNDZdIHN5c3RlbWRbMV06IFN0YXJ0
aW5nIFVzZXIgRGF0YWJhc2UgTWFuYWdlci4uLgpbICAgIDQuODg1OTI4XSBzeXN0ZW1kWzFdOiBG
aW5pc2hlZCBBcHBseSBLZXJuZWwgVmFyaWFibGVzLgpbICAgIDQuODk3NzE4XSBCVFJGUyBpbmZv
IChkZXZpY2Ugc2RhMiBzdGF0ZSBNKTogdXNlIHpzdGQgY29tcHJlc3Npb24sIGxldmVsIDMKWyAg
ICA0Ljg5OTE2NV0gc3lzdGVtZFsxXTogRmluaXNoZWQgUmVtb3VudCBSb290IGFuZCBLZXJuZWwg
RmlsZSBTeXN0ZW1zLgpbICAgIDQuOTAxNjgzXSBzeXN0ZW1kWzFdOiBSZWJ1aWxkIEhhcmR3YXJl
IERhdGFiYXNlIHdhcyBza2lwcGVkIGJlY2F1c2Ugbm8gdHJpZ2dlciBjb25kaXRpb24gY2hlY2tz
IHdlcmUgbWV0LgpbICAgIDQuOTAzMTgxXSBzeXN0ZW1kWzFdOiBTdGFydGluZyBMb2FkL1NhdmUg
T1MgUmFuZG9tIFNlZWQuLi4KWyAgICA0LjkwMzIyMl0gc3lzdGVtZFsxXTogVFBNIFNSSyBTZXR1
cCB3YXMgc2tpcHBlZCBiZWNhdXNlIG9mIGFuIHVubWV0IGNvbmRpdGlvbiBjaGVjayAoQ29uZGl0
aW9uU2VjdXJpdHk9bWVhc3VyZWQtdWtpKS4KWyAgICA0LjkxNzYyNF0gc3lzdGVtZFsxXTogU3Rh
cnRlZCBKb3VybmFsIFNlcnZpY2UuClsgICAgNS4yMjI4NTRdIHpyYW0wOiBkZXRlY3RlZCBjYXBh
Y2l0eSBjaGFuZ2UgZnJvbSAwIHRvIDc5MzgwNDgKWyAgICA1LjI4NTk4OV0gQWRkaW5nIDM5Njkw
MjBrIHN3YXAgb24gL2Rldi96cmFtMC4gIFByaW9yaXR5OjEwMCBleHRlbnRzOjEgYWNyb3NzOjM5
NjkwMjBrIFNTRHNjClsgICAgNS4zMzc4OTRdIG1vdXNlZGV2OiBQUy8yIG1vdXNlIGRldmljZSBj
b21tb24gZm9yIGFsbCBtaWNlClsgICAgNS4zODE1MDldIGlucHV0OiBJbnRlbCBISUQgZXZlbnRz
IGFzIC9kZXZpY2VzL3BsYXRmb3JtL0lOVDMzRDU6MDAvaW5wdXQvaW5wdXQxMwpbICAgIDUuMzk1
NzM4XSBpbnRlbC1oaWQgSU5UMzNENTowMDogcGxhdGZvcm0gc3VwcG9ydHMgNSBidXR0b24gYXJy
YXkKWyAgICA1LjM5NTgyOF0gaW5wdXQ6IEludGVsIEhJRCA1IGJ1dHRvbiBhcnJheSBhcyAvZGV2
aWNlcy9wbGF0Zm9ybS9JTlQzM0Q1OjAwL2lucHV0L2lucHV0MTQKWyAgICA1LjQwNzQ4Nl0gQ29u
c2lkZXIgdXNpbmcgdGhlcm1hbCBuZXRsaW5rIGV2ZW50cyBpbnRlcmZhY2UKWyAgICA1LjU2MzU5
Nl0gbWM6IExpbnV4IG1lZGlhIGludGVyZmFjZTogdjAuMTAKWyAgICA1LjU2NjIwNF0gaWRtYTY0
IGlkbWE2NC4wOiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjYxOTg3
NV0gaWRtYTY0IGlkbWE2NC4xOiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAg
ICA1LjYzMjYxNF0gaWRtYTY0IGlkbWE2NC4yOiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2
NC1iaXQKWyAgICA1LjYzNjUwMV0gY2ZnODAyMTE6IExvYWRpbmcgY29tcGlsZWQtaW4gWC41MDkg
Y2VydGlmaWNhdGVzIGZvciByZWd1bGF0b3J5IGRhdGFiYXNlClsgICAgNS42MzY3MDNdIHZpZGVv
ZGV2OiBMaW51eCB2aWRlbyBjYXB0dXJlIGludGVyZmFjZTogdjIuMDAKWyAgICA1LjY0MTU5OV0g
aWRtYTY0IGlkbWE2NC4zOiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1
LjY0ODY4N10gTG9hZGVkIFguNTA5IGNlcnQgJ3Nmb3JzaGVlOiAwMGIyOGRkZjQ3YWVmOWNlYTcn
ClsgICAgNS42NDg5NjVdIExvYWRlZCBYLjUwOSBjZXJ0ICd3ZW5zOiA2MWMwMzg2NTFhYWJkY2Y5
NGJkMGFjN2ZmMDZjNzI0OGRiMThjNjAwJwpbICAgIDUuNjUwMTc3XSBwbGF0Zm9ybSByZWd1bGF0
b3J5LjA6IERpcmVjdCBmaXJtd2FyZSBsb2FkIGZvciByZWd1bGF0b3J5LmRiIGZhaWxlZCB3aXRo
IGVycm9yIC0yClsgICAgNS42NTAxODVdIGNmZzgwMjExOiBmYWlsZWQgdG8gbG9hZCByZWd1bGF0
b3J5LmRiClsgICAgNS42NzQ3OTFdIGk4MDFfc21idXMgMDAwMDowMDoxZi4xOiBTUEQgV3JpdGUg
RGlzYWJsZSBpcyBzZXQKWyAgICA1LjY3NDg1MF0gaTgwMV9zbWJ1cyAwMDAwOjAwOjFmLjE6IFNN
QnVzIHVzaW5nIFBDSSBpbnRlcnJ1cHQKWyAgICA1LjY3ODE1MV0gaWRtYTY0IGlkbWE2NC40OiBG
b3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjY4MzgxOF0gZHJpdmVycy9o
aWQvaTJjLWhpZC9pMmMtaGlkLWNvcmUuYzogSElEIHByb2JlIGNhbGxlZCBmb3IgaTJjIDB4NWQK
WyAgICA1LjY4NDUxMV0gaTJjX2hpZF9hY3BpIGkyYy1HWFRQNzM4NjowMDogbm90aGluZyBhdCB0
aGlzIGFkZHJlc3M6IC0xMjEKWyAgICA1LjY4NDU2OV0gaWRtYTY0IGlkbWE2NC41OiBGb3VuZCBJ
bnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjY4OTkzNF0gaWRtYTY0IGlkbWE2NC42
OiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjY5NDczM10gaWRtYTY0
IGlkbWE2NC43OiBGb3VuZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjcwMTg4
M10gSW50ZWwoUikgV2lyZWxlc3MgV2lGaSBkcml2ZXIgZm9yIExpbnV4ClsgICAgNS43MDE5NDNd
IGl3bHdpZmkgMDAwMDowMDowYy4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKWyAg
ICA1LjcwMjg4NV0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IERldGVjdGVkIGNyZi1pZCAweDI4MTYs
IGNudi1pZCAweDEwMDAxMDAgd2ZwbSBpZCAweDgwMDAwMDAwClsgICAgNS43MDI4OThdIGl3bHdp
ZmkgMDAwMDowMDowYy4wOiBQQ0kgZGV2IDMxZGMvMDAzNCwgcmV2PTB4MzEyLCByZmlkPTB4MTA1
MTEwClsgICAgNS43MDI5MDNdIGl3bHdpZmkgMDAwMDowMDowYy4wOiBEZXRlY3RlZCBJbnRlbChS
KSBXaXJlbGVzcy1BQyA5NTYwIDE2ME1IegpbICAgIDUuNzEyMDM0XSBpd2x3aWZpIDAwMDA6MDA6
MGMuMDogV1JUOiBPdmVycmlkaW5nIHJlZ2lvbiBpZCAwClsgICAgNS43MTIwNDZdIGl3bHdpZmkg
MDAwMDowMDowYy4wOiBXUlQ6IE92ZXJyaWRpbmcgcmVnaW9uIGlkIDEKWyAgICA1LjcxMjA0OV0g
aXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMgpbICAgIDUu
NzEyMDUxXSBpd2x3aWZpIDAwMDA6MDA6MGMuMDogV1JUOiBPdmVycmlkaW5nIHJlZ2lvbiBpZCAz
ClsgICAgNS43MTIwNTNdIGl3bHdpZmkgMDAwMDowMDowYy4wOiBXUlQ6IE92ZXJyaWRpbmcgcmVn
aW9uIGlkIDQKWyAgICA1LjcxMjA1NF0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJp
ZGluZyByZWdpb24gaWQgNgpbICAgIDUuNzEyMDU2XSBpd2x3aWZpIDAwMDA6MDA6MGMuMDogV1JU
OiBPdmVycmlkaW5nIHJlZ2lvbiBpZCA4ClsgICAgNS43MTIwNThdIGl3bHdpZmkgMDAwMDowMDow
Yy4wOiBXUlQ6IE92ZXJyaWRpbmcgcmVnaW9uIGlkIDkKWyAgICA1LjcxMjA2MF0gaXdsd2lmaSAw
MDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMTAKWyAgICA1LjcxMjA2MV0g
aXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMTEKWyAgICA1
LjcxMjA2M10gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQg
MTUKWyAgICA1LjcxMjA2NV0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyBy
ZWdpb24gaWQgMTYKWyAgICA1LjcxMjA2Nl0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3Zl
cnJpZGluZyByZWdpb24gaWQgMTgKWyAgICA1LjcxMjA2OF0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6
IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMTkKWyAgICA1LjcxMjA3MF0gaXdsd2lmaSAwMDAw
OjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMjAKWyAgICA1LjcxMjA3MV0gaXds
d2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMjEKWyAgICA1Ljcx
MjA3M10gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFdSVDogT3ZlcnJpZGluZyByZWdpb24gaWQgMjgK
WyAgICA1LjcxMjcyNF0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IGxvYWRlZCBmaXJtd2FyZSB2ZXJz
aW9uIDQ2LjdlM2U0YjY5LjAgOTAwMC1wdS1iMC1qZi1iMC00Ni51Y29kZSBvcF9tb2RlIGl3bG12
bQpbICAgIDUuNzE3NjIxXSBpZG1hNjQgaWRtYTY0Ljg6IEZvdW5kIEludGVsIGludGVncmF0ZWQg
RE1BIDY0LWJpdApbICAgIDUuNzE3OTc0XSBpZG1hNjQgaWRtYTY0Ljk6IEZvdW5kIEludGVsIGlu
dGVncmF0ZWQgRE1BIDY0LWJpdApbICAgIDUuNzE5MjkwXSBpZG1hNjQgaWRtYTY0LjEyOiBGb3Vu
ZCBJbnRlbCBpbnRlZ3JhdGVkIERNQSA2NC1iaXQKWyAgICA1LjcxOTc2MF0gaWRtYTY0IGlkbWE2
NC4xMzogRm91bmQgSW50ZWwgaW50ZWdyYXRlZCBETUEgNjQtYml0ClsgICAgNS43MjAxNDJdIGlk
bWE2NCBpZG1hNjQuMTQ6IEZvdW5kIEludGVsIGludGVncmF0ZWQgRE1BIDY0LWJpdApbICAgIDUu
NzQyMzg4XSBwcHNfY29yZTogTGludXhQUFMgQVBJIHZlci4gMSByZWdpc3RlcmVkClsgICAgNS43
NDIzOTNdIHBwc19jb3JlOiBTb2Z0d2FyZSB2ZXIuIDUuMy42IC0gQ29weXJpZ2h0IDIwMDUtMjAw
NyBSb2RvbGZvIEdpb21ldHRpIDxnaW9tZXR0aUBsaW51eC5pdD4KWyAgICA1Ljc0MjkxMF0gQmx1
ZXRvb3RoOiBDb3JlIHZlciAyLjIyClsgICAgNS43NDI5MzddIE5FVDogUmVnaXN0ZXJlZCBQRl9C
TFVFVE9PVEggcHJvdG9jb2wgZmFtaWx5ClsgICAgNS43NDI5NDBdIEJsdWV0b290aDogSENJIGRl
dmljZSBhbmQgY29ubmVjdGlvbiBtYW5hZ2VyIGluaXRpYWxpemVkClsgICAgNS43NDI5NDZdIEJs
dWV0b290aDogSENJIHNvY2tldCBsYXllciBpbml0aWFsaXplZApbICAgIDUuNzQyOTQ5XSBCbHVl
dG9vdGg6IEwyQ0FQIHNvY2tldCBsYXllciBpbml0aWFsaXplZApbICAgIDUuNzQyOTU1XSBCbHVl
dG9vdGg6IFNDTyBzb2NrZXQgbGF5ZXIgaW5pdGlhbGl6ZWQKWyAgICA1Ljc3NjgzNF0gaW5wdXQ6
IFBDIFNwZWFrZXIgYXMgL2RldmljZXMvcGxhdGZvcm0vcGNzcGtyL2lucHV0L2lucHV0MTUKWyAg
ICA1Ljg1MTYwOF0gc3lzdGVtZC1qb3VybmFsZFsyNzhdOiBSZWNlaXZlZCBjbGllbnQgcmVxdWVz
dCB0byBmbHVzaCBydW50aW1lIGpvdXJuYWwuClsgICAgNS44NTc3OTNdIFBUUCBjbG9jayBzdXBw
b3J0IHJlZ2lzdGVyZWQKWyAgICA1LjkwOTkzNl0gUkFQTCBQTVU6IEFQSSB1bml0IGlzIDJeLTMy
IEpvdWxlcywgNCBmaXhlZCBjb3VudGVycywgNjU1MzYwIG1zIG92ZmwgdGltZXIKWyAgICA1Ljkw
OTk0NV0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIHBwMC1jb3JlIDJeLTE0IEpvdWxlcwpb
ICAgIDUuOTA5OTQ2XSBSQVBMIFBNVTogaHcgdW5pdCBvZiBkb21haW4gcGFja2FnZSAyXi0xNCBK
b3VsZXMKWyAgICA1LjkwOTk0OF0gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIGRyYW0gMl4t
MTQgSm91bGVzClsgICAgNS45MDk5NDldIFJBUEwgUE1VOiBodyB1bml0IG9mIGRvbWFpbiBwcDEt
Z3B1IDJeLTE0IEpvdWxlcwpbICAgIDYuMDcyOTAxXSBtZWlfaGRjcCAwMDAwOjAwOjBmLjAtYjYz
OGFiN2UtOTRlMi00ZWEyLWE1NTItZDFjNTRiNjI3ZjA0OiBib3VuZCAwMDAwOjAwOjAyLjAgKG9w
cyBpOTE1X2hkY3Bfb3BzIFtpOTE1XSkKWyAgICA2LjA3NzMyOV0gdXNiIDEtNTogRm91bmQgVVZD
IDEuMDAgZGV2aWNlIEZyb250IENhbWVyYSAoMGJkYTo1ODQyKQpbICAgIDYuMDk2NTg5XSBjcnlw
dGQ6IG1heF9jcHVfcWxlbiBzZXQgdG8gMTAwMApbICAgIDYuMTA5NTUwXSB1c2IgMS02OiBGb3Vu
ZCBVVkMgMS4wMCBkZXZpY2UgVVNCIDIuMCBDYW1lcmEgKDBjNDU6NjM2ZCkKWyAgICA2LjExMjg2
MF0gdXNiIDEtNjogRmFpbGVkIHRvIHF1ZXJ5IChHRVRfSU5GTykgVVZDIGNvbnRyb2wgNyBvbiB1
bml0IDE6IDAgKGV4cC4gMSkuClsgICAgNi4xMTMxMDFdIHNuZF9oZGFfaW50ZWwgMDAwMDowMDow
ZS4wOiBib3VuZCAwMDAwOjAwOjAyLjAgKG9wcyBpOTE1X2F1ZGlvX2NvbXBvbmVudF9iaW5kX29w
cyBbaTkxNV0pClsgICAgNi4xMTc4NzNdIHVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVyZmFj
ZSBkcml2ZXIgdXZjdmlkZW8KWyAgICA2LjE3MDgxNV0gaW50ZWxfcmFwbF9jb21tb246IEZvdW5k
IFJBUEwgZG9tYWluIHBhY2thZ2UKWyAgICA2LjE3MDgyOF0gaW50ZWxfcmFwbF9jb21tb246IEZv
dW5kIFJBUEwgZG9tYWluIGNvcmUKWyAgICA2LjE3MDgzMV0gaW50ZWxfcmFwbF9jb21tb246IEZv
dW5kIFJBUEwgZG9tYWluIHVuY29yZQpbICAgIDYuMTcwODM1XSBpbnRlbF9yYXBsX2NvbW1vbjog
Rm91bmQgUkFQTCBkb21haW4gZHJhbQpbICAgIDYuMjQzNTQ4XSBpd2x3aWZpIDAwMDA6MDA6MGMu
MDogYmFzZSBIVyBhZGRyZXNzOiAyYzo4ZDpiMToyZjo2ZDo5ZiwgT1RQIG1pbm9yIHZlcnNpb246
IDB4NApbICAgIDYuMjY2NTg2XSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgaGRhdWRpb0MwRDA6IGF1
dG9jb25maWcgZm9yIEFMQzI2OVZCOiBsaW5lX291dHM9MSAoMHgxNC8weDAvMHgwLzB4MC8weDAp
IHR5cGU6c3BlYWtlcgpbICAgIDYuMjY2NjAyXSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgaGRhdWRp
b0MwRDA6ICAgIHNwZWFrZXJfb3V0cz0wICgweDAvMHgwLzB4MC8weDAvMHgwKQpbICAgIDYuMjY2
NjA3XSBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgaGRhdWRpb0MwRDA6ICAgIGhwX291dHM9MSAoMHgy
MS8weDAvMHgwLzB4MC8weDApClsgICAgNi4yNjY2MTFdIHNuZF9oZGFfY29kZWNfcmVhbHRlayBo
ZGF1ZGlvQzBEMDogICAgbW9ubzogbW9ub19vdXQ9MHgwClsgICAgNi4yNjY2MTRdIHNuZF9oZGFf
Y29kZWNfcmVhbHRlayBoZGF1ZGlvQzBEMDogICAgaW5wdXRzOgpbICAgIDYuMjY2NjE3XSBzbmRf
aGRhX2NvZGVjX3JlYWx0ZWsgaGRhdWRpb0MwRDA6ICAgICAgSW50ZXJuYWwgTWljPTB4MTIKWyAg
ICA2LjI2NjYyMV0gc25kX2hkYV9jb2RlY19yZWFsdGVrIGhkYXVkaW9DMEQwOiAgICAgIE1pYz0w
eDE4ClsgICAgNi4zMjY0NzhdIGllZWU4MDIxMSBwaHkwOiBTZWxlY3RlZCByYXRlIGNvbnRyb2wg
YWxnb3JpdGhtICdpd2wtbXZtLXJzJwpbICAgIDYuMzM5NzA5XSBkdy1hcGItdWFydC44OiB0dHlT
NCBhdCBNTUlPIDB4YTEyMmEwMDAgKGlycSA9IDQsIGJhc2VfYmF1ZCA9IDExNTIwMCkgaXMgYSAx
NjU1MEEKWyAgICA2LjM1NDEwMF0gQmx1ZXRvb3RoOiBoY2kwOiBCb290bG9hZGVyIHJldmlzaW9u
IDAuMSBidWlsZCA0MiB3ZWVrIDUyIDIwMTUKWyAgICA2LjM1NTEwM10gQmx1ZXRvb3RoOiBoY2kw
OiBEZXZpY2UgcmV2aXNpb24gaXMgMgpbICAgIDYuMzU1MTEyXSBCbHVldG9vdGg6IGhjaTA6IFNl
Y3VyZSBib290IGlzIGVuYWJsZWQKWyAgICA2LjM1NTExNF0gQmx1ZXRvb3RoOiBoY2kwOiBPVFAg
bG9jayBpcyBlbmFibGVkClsgICAgNi4zNTUxMTZdIEJsdWV0b290aDogaGNpMDogQVBJIGxvY2sg
aXMgZW5hYmxlZApbICAgIDYuMzU1MTE4XSBCbHVldG9vdGg6IGhjaTA6IERlYnVnIGxvY2sgaXMg
ZGlzYWJsZWQKWyAgICA2LjM1NTEyMV0gQmx1ZXRvb3RoOiBoY2kwOiBNaW5pbXVtIGZpcm13YXJl
IGJ1aWxkIDEgd2VlayAxMCAyMDE0ClsgICAgNi4zNjcwNDFdIEJsdWV0b290aDogaGNpMDogRm91
bmQgZGV2aWNlIGZpcm13YXJlOiBpbnRlbC9pYnQtMTctMTYtMS5zZmkKWyAgICA2LjM2NzEwOV0g
Qmx1ZXRvb3RoOiBoY2kwOiBCb290IEFkZHJlc3M6IDB4NDA4MDAKWyAgICA2LjM2NzExM10gQmx1
ZXRvb3RoOiBoY2kwOiBGaXJtd2FyZSBWZXJzaW9uOiAyMDEtMTIuMjQKWyAgICA2LjM2ODM1OV0g
dXNiY29yZTogcmVnaXN0ZXJlZCBuZXcgaW50ZXJmYWNlIGRyaXZlciBidHVzYgpbICAgIDYuMzc1
NjgzXSBpbnB1dDogSERBIEludGVsIFBDSCBNaWMgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAw
OjAwOjBlLjAvc291bmQvY2FyZDAvaW5wdXQxNgpbICAgIDYuMzc1ODg0XSBpbnB1dDogSERBIElu
dGVsIFBDSCBIZWFkcGhvbmUgYXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjBlLjAvc291
bmQvY2FyZDAvaW5wdXQxNwpbICAgIDYuMzc2MDQ1XSBpbnB1dDogSERBIEludGVsIFBDSCBIRE1J
L0RQLHBjbT0zIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowZS4wL3NvdW5kL2NhcmQw
L2lucHV0MTgKWyAgICA2LjM3NjE5N10gaW5wdXQ6IEhEQSBJbnRlbCBQQ0ggSERNSS9EUCxwY209
NyBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MGUuMC9zb3VuZC9jYXJkMC9pbnB1dDE5
ClsgICAgNi4zNzYzNjFdIGlucHV0OiBIREEgSW50ZWwgUENIIEhETUkvRFAscGNtPTggYXMgL2Rl
dmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjBlLjAvc291bmQvY2FyZDAvaW5wdXQyMApbICAgIDYu
NDA2NTY4XSBkdy1hcGItdWFydC45OiB0dHlTNSBhdCBNTUlPIDB4YTEyMjgwMDAgKGlycSA9IDUs
IGJhc2VfYmF1ZCA9IDExNTIwMCkgaXMgYSAxNjU1MEEKWyAgICA2LjQ2NjgyNl0gaXdsd2lmaSAw
MDAwOjAwOjBjLjAgd2xvMjogcmVuYW1lZCBmcm9tIHdsYW4wClsgICAgNi40Njk4MDVdIGR3LWFw
Yi11YXJ0LjEwOiB0dHlTNiBhdCBNTUlPIDB4ZmVhMTAwMDAgKGlycSA9IDYsIGJhc2VfYmF1ZCA9
IDExNTIwMCkgaXMgYSAxNjU1MEEKWyAgICA2LjQ5NTczOV0gZHctYXBiLXVhcnQuMTE6IHR0eVM3
IGF0IE1NSU8gMHhhMTIyNjAwMCAoaXJxID0gNywgYmFzZV9iYXVkID0gMTE1MjAwKSBpcyBhIDE2
NTUwQQpbICAgIDYuNTk5MDM1XSBDcmVhdGluZyAxIE1URCBwYXJ0aXRpb25zIG9uICJpbnRlbC1z
cGkiOgpbICAgIDYuNTk5MDUyXSAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDgwMDAwMCA6ICJCSU9T
IgpbICAgIDYuOTIyMzU3XSBpbnRlbF90ZWxlbWV0cnlfY29yZSBJbml0ClsgICAgNi45NzQxNTBd
IEludmFsaWQgcGx0Y29uZmlnLCBlbnN1cmUgSVBDMSBkZXZpY2UgaXMgZW5hYmxlZCBpbiBCSU9T
ClsgICAgNy4zMjI2MjRdIEJsdWV0b290aDogQk5FUCAoRXRoZXJuZXQgRW11bGF0aW9uKSB2ZXIg
MS4zClsgICAgNy4zMjI2MzVdIEJsdWV0b290aDogQk5FUCBmaWx0ZXJzOiBwcm90b2NvbCBtdWx0
aWNhc3QKWyAgICA3LjMyMjY0M10gQmx1ZXRvb3RoOiBCTkVQIHNvY2tldCBsYXllciBpbml0aWFs
aXplZApbICAgIDcuOTY0ODc5XSBCbHVldG9vdGg6IGhjaTA6IFdhaXRpbmcgZm9yIGZpcm13YXJl
IGRvd25sb2FkIHRvIGNvbXBsZXRlClsgICAgNy45NjUwNzddIEJsdWV0b290aDogaGNpMDogRmly
bXdhcmUgbG9hZGVkIGluIDE1NjA1NjcgdXNlY3MKWyAgICA3Ljk2NTE3MV0gQmx1ZXRvb3RoOiBo
Y2kwOiBXYWl0aW5nIGZvciBkZXZpY2UgdG8gYm9vdApbICAgIDcuOTc5MTAzXSBCbHVldG9vdGg6
IGhjaTA6IERldmljZSBib290ZWQgaW4gMTM2NTYgdXNlY3MKWyAgICA3Ljk3OTc0OV0gQmx1ZXRv
b3RoOiBoY2kwOiBGb3VuZCBJbnRlbCBEREMgcGFyYW1ldGVyczogaW50ZWwvaWJ0LTE3LTE2LTEu
ZGRjClsgICAgNy45ODEwOTRdIEJsdWV0b290aDogaGNpMDogQXBwbHlpbmcgSW50ZWwgRERDIHBh
cmFtZXRlcnMgY29tcGxldGVkClsgICAgNy45ODIwOTldIEJsdWV0b290aDogaGNpMDogRmlybXdh
cmUgcmV2aXNpb24gMC4xIGJ1aWxkIDIwMSB3ZWVrIDEyIDIwMjQKWyAgICA3Ljk4NDA4NF0gQmx1
ZXRvb3RoOiBoY2kwOiBIQ0kgTEUgQ29kZWQgUEhZIGZlYXR1cmUgYml0IGlzIHNldCwgYnV0IGl0
cyB1c2FnZSBpcyBub3Qgc3VwcG9ydGVkLgpbICAgIDguMDU2NzQ0XSBCbHVldG9vdGg6IE1HTVQg
dmVyIDEuMjMKWyAgICA4LjA3MjQ0OF0gTkVUOiBSZWdpc3RlcmVkIFBGX0FMRyBwcm90b2NvbCBm
YW1pbHkKWyAgICA4LjM4MzM4OF0gaXdsd2lmaSAwMDAwOjAwOjBjLjA6IFJlZ2lzdGVyZWQgUEhD
IGNsb2NrOiBpd2x3aWZpLVBUUCwgd2l0aCBpbmRleDogMApbICAgMTUuNjQzODMwXSB1Y3NpX2Fj
cGkgVVNCQzAwMDowMDogZmFpbGVkIHRvIHJlc2V0IFBQTSEKWyAgIDE1LjY0Mzg0Ml0gdWNzaV9h
Y3BpIFVTQkMwMDA6MDA6IGVycm9yIC1FVElNRURPVVQ6IFBQTSBpbml0IGZhaWxlZApbICAgMjAu
MjI3NzM4XSBCbHVldG9vdGg6IFJGQ09NTSBUVFkgbGF5ZXIgaW5pdGlhbGl6ZWQKWyAgIDIwLjIy
Nzc1OF0gQmx1ZXRvb3RoOiBSRkNPTU0gc29ja2V0IGxheWVyIGluaXRpYWxpemVkClsgICAyMC4y
Mjc3NzFdIEJsdWV0b290aDogUkZDT01NIHZlciAxLjExClsgICAyMy43OTA4MzRdIHdsbzI6IGF1
dGhlbnRpY2F0ZSB3aXRoIDYwOjhkOjI2OjE3OmI5OmViIChsb2NhbCBhZGRyZXNzPTJjOjhkOmIx
OjJmOjZkOjlmKQpbICAgMjMuNzkxODc2XSB3bG8yOiBzZW5kIGF1dGggdG8gNjA6OGQ6MjY6MTc6
Yjk6ZWIgKHRyeSAxLzMpClsgICAyMy44MzI1MzRdIHdsbzI6IGF1dGhlbnRpY2F0ZWQKWyAgIDIz
LjgzNTY2Ml0gd2xvMjogYXNzb2NpYXRlIHdpdGggNjA6OGQ6MjY6MTc6Yjk6ZWIgKHRyeSAxLzMp
ClsgICAyMy44MzY5MjddIHdsbzI6IFJYIEFzc29jUmVzcCBmcm9tIDYwOjhkOjI2OjE3OmI5OmVi
IChjYXBhYj0weDEwMTEgc3RhdHVzPTAgYWlkPTEwKQpbICAgMjMuODM5NDk4XSB3bG8yOiBhc3Nv
Y2lhdGVkClsgICAyMy45Nzc2OTJdIHdsbzI6IExpbWl0aW5nIFRYIHBvd2VyIHRvIDE5ICgyMCAt
IDEpIGRCbSBhcyBhZHZlcnRpc2VkIGJ5IDYwOjhkOjI2OjE3OmI5OmViClsgICAyNi4xMzI4ODZd
IHVzYiAxLTM6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDcKWyAgIDI2LjYwMDM2Nl0g
dXNiIDEtMzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgOCB1c2luZyB4aGNpX2hj
ZApbICAgMjYuNzI1NjAwXSB1c2IgMS0zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9
MjgwOCwgaWRQcm9kdWN0PTY2NTIsIGJjZERldmljZT0gMS4wMApbICAgMjYuNzI1NjE2XSB1c2Ig
MS0zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1i
ZXI9MApbICAgMjYuNzI1NjIxXSB1c2IgMS0zOiBQcm9kdWN0OiBGb2NhbFRlY2ggRmluZ2VycHJp
bnQgRGV2aWNlClsgICAyNi43MjU2MjRdIHVzYiAxLTM6IE1hbnVmYWN0dXJlcjogSE9MVEVLClsg
ICAzNi40MjUzNzNdIHN5c3RlbWQtam91cm5hbGRbMjc4XTogVGltZSBqdW1wZWQgYmFja3dhcmRz
LCByb3RhdGluZy4KWyAgIDQ4LjM4NDA0NF0gdXNiIDEtMzogVVNCIGRpc2Nvbm5lY3QsIGRldmlj
ZSBudW1iZXIgOApbICAgNDguODUyNTkzXSB1c2IgMS0zOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2
aWNlIG51bWJlciA5IHVzaW5nIHhoY2lfaGNkClsgICA0OC45ODA0NjNdIHVzYiAxLTM6IE5ldyBV
U0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0yODA4LCBpZFByb2R1Y3Q9NjY1MiwgYmNkRGV2aWNl
PSAxLjAwClsgICA0OC45ODA0NzRdIHVzYiAxLTM6IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1m
cj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgICA0OC45ODA0NzddIHVzYiAxLTM6IFBy
b2R1Y3Q6IEZvY2FsVGVjaCBGaW5nZXJwcmludCBEZXZpY2UKWyAgIDQ4Ljk4MDQ3OV0gdXNiIDEt
MzogTWFudWZhY3R1cmVyOiBIT0xURUsKWyAgIDcwLjYzNTk1N10gdXNiIDEtMzogVVNCIGRpc2Nv
bm5lY3QsIGRldmljZSBudW1iZXIgOQpbICAgNzEuMTAzMTcyXSB1c2IgMS0zOiBuZXcgZnVsbC1z
cGVlZCBVU0IgZGV2aWNlIG51bWJlciAxMCB1c2luZyB4aGNpX2hjZApbICAgNzEuMjI3NTYyXSB1
c2IgMS0zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjgwOCwgaWRQcm9kdWN0PTY2
NTIsIGJjZERldmljZT0gMS4wMApbICAgNzEuMjI3NTcyXSB1c2IgMS0zOiBOZXcgVVNCIGRldmlj
ZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MApbICAgNzEuMjI3NTc1
XSB1c2IgMS0zOiBQcm9kdWN0OiBGb2NhbFRlY2ggRmluZ2VycHJpbnQgRGV2aWNlClsgICA3MS4y
Mjc1NzddIHVzYiAxLTM6IE1hbnVmYWN0dXJlcjogSE9MVEVLClsgICA5Mi44ODc0NzhdIHVzYiAx
LTM6IFVTQiBkaXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDEwClsgICA5My4zNTM4OTZdIHVzYiAx
LTM6IG5ldyBmdWxsLXNwZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDExIHVzaW5nIHhoY2lfaGNkClsg
ICA5My40Nzg4NThdIHVzYiAxLTM6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0yODA4
LCBpZFByb2R1Y3Q9NjY1MiwgYmNkRGV2aWNlPSAxLjAwClsgICA5My40Nzg4NzBdIHVzYiAxLTM6
IE5ldyBVU0IgZGV2aWNlIHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0w
ClsgICA5My40Nzg4NzJdIHVzYiAxLTM6IFByb2R1Y3Q6IEZvY2FsVGVjaCBGaW5nZXJwcmludCBE
ZXZpY2UKWyAgIDkzLjQ3ODg3NF0gdXNiIDEtMzogTWFudWZhY3R1cmVyOiBIT0xURUsKWyAgMTE1
LjEzODM2Ml0gdXNiIDEtMzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMTEKWyAgMTE1
LjYwNDczOF0gdXNiIDEtMzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTIgdXNp
bmcgeGhjaV9oY2QKWyAgMTE1LjcyOTc3NF0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2UgZm91bmQs
IGlkVmVuZG9yPTI4MDgsIGlkUHJvZHVjdD02NjUyLCBiY2REZXZpY2U9IDEuMDAKWyAgMTE1Ljcy
OTc4Nl0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9Miwg
U2VyaWFsTnVtYmVyPTAKWyAgMTE1LjcyOTc4OF0gdXNiIDEtMzogUHJvZHVjdDogRm9jYWxUZWNo
IEZpbmdlcnByaW50IERldmljZQpbICAxMTUuNzI5NzkwXSB1c2IgMS0zOiBNYW51ZmFjdHVyZXI6
IEhPTFRFSwpbICAxMzcuMzg3OTE0XSB1c2IgMS0zOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51
bWJlciAxMgpbICAxMzcuODU1NzY4XSB1c2IgMS0zOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2aWNl
IG51bWJlciAxMyB1c2luZyB4aGNpX2hjZApbICAxMzcuOTgwMjUyXSB1c2IgMS0zOiBOZXcgVVNC
IGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjgwOCwgaWRQcm9kdWN0PTY2NTIsIGJjZERldmljZT0g
MS4wMApbICAxMzcuOTgwMjY0XSB1c2IgMS0zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9
MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MApbICAxMzcuOTgwMjY2XSB1c2IgMS0zOiBQcm9k
dWN0OiBGb2NhbFRlY2ggRmluZ2VycHJpbnQgRGV2aWNlClsgIDEzNy45ODAyNjhdIHVzYiAxLTM6
IE1hbnVmYWN0dXJlcjogSE9MVEVLClsgIDE1OS42MzU1NDRdIHVzYiAxLTM6IFVTQiBkaXNjb25u
ZWN0LCBkZXZpY2UgbnVtYmVyIDEzClsgIDE2MC4xMDU2NjddIHVzYiAxLTM6IG5ldyBmdWxsLXNw
ZWVkIFVTQiBkZXZpY2UgbnVtYmVyIDE0IHVzaW5nIHhoY2lfaGNkClsgIDE2MC4yMzY5OTJdIHVz
YiAxLTM6IE5ldyBVU0IgZGV2aWNlIGZvdW5kLCBpZFZlbmRvcj0yODA4LCBpZFByb2R1Y3Q9NjY1
MiwgYmNkRGV2aWNlPSAxLjAwClsgIDE2MC4yMzcwMDhdIHVzYiAxLTM6IE5ldyBVU0IgZGV2aWNl
IHN0cmluZ3M6IE1mcj0xLCBQcm9kdWN0PTIsIFNlcmlhbE51bWJlcj0wClsgIDE2MC4yMzcwMTNd
IHVzYiAxLTM6IFByb2R1Y3Q6IEZvY2FsVGVjaCBGaW5nZXJwcmludCBEZXZpY2UKWyAgMTYwLjIz
NzAxNl0gdXNiIDEtMzogTWFudWZhY3R1cmVyOiBIT0xURUsKWyAgMTgxLjg4MTQ2OF0gdXNiIDEt
MzogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMTQKWyAgMTgyLjM0OTg2NV0gdXNiIDEt
MzogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTUgdXNpbmcgeGhjaV9oY2QKWyAg
MTgyLjQ3NDI5MF0gdXNiIDEtMzogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9yPTI4MDgs
IGlkUHJvZHVjdD02NjUyLCBiY2REZXZpY2U9IDEuMDAKWyAgMTgyLjQ3NDMwMV0gdXNiIDEtMzog
TmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTEsIFByb2R1Y3Q9MiwgU2VyaWFsTnVtYmVyPTAK
WyAgMTgyLjQ3NDMwM10gdXNiIDEtMzogUHJvZHVjdDogRm9jYWxUZWNoIEZpbmdlcnByaW50IERl
dmljZQpbICAxODIuNDc0MzA1XSB1c2IgMS0zOiBNYW51ZmFjdHVyZXI6IEhPTFRFSwpbICAyMDQu
MTI3Mjg2XSB1c2IgMS0zOiBVU0IgZGlzY29ubmVjdCwgZGV2aWNlIG51bWJlciAxNQpbICAyMDQu
NTk0MDQ4XSB1c2IgMS0zOiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAxNiB1c2lu
ZyB4aGNpX2hjZApbICAyMDQuNzE4Njg2XSB1c2IgMS0zOiBOZXcgVVNCIGRldmljZSBmb3VuZCwg
aWRWZW5kb3I9MjgwOCwgaWRQcm9kdWN0PTY2NTIsIGJjZERldmljZT0gMS4wMApbICAyMDQuNzE4
NzEyXSB1c2IgMS0zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdzOiBNZnI9MSwgUHJvZHVjdD0yLCBT
ZXJpYWxOdW1iZXI9MApbICAyMDQuNzE4NzIxXSB1c2IgMS0zOiBQcm9kdWN0OiBGb2NhbFRlY2gg
RmluZ2VycHJpbnQgRGV2aWNlClsgIDIwNC43MTg3MjddIHVzYiAxLTM6IE1hbnVmYWN0dXJlcjog
SE9MVEVLClsgIDIxNS44ODMyMDFdIHdhcm5pbmc6IGBwbGFzbWFzaGVsbCcgdXNlcyB3aXJlbGVz
cyBleHRlbnNpb25zIHdoaWNoIHdpbGwgc3RvcCB3b3JraW5nIGZvciBXaS1GaSA3IGhhcmR3YXJl
OyB1c2Ugbmw4MDIxMQpbICAyMjYuMzczMzY2XSB1c2IgMS0zOiBVU0IgZGlzY29ubmVjdCwgZGV2
aWNlIG51bWJlciAxNgpbICAyMjYuODQwMTg3XSB1c2IgMS0zOiBuZXcgZnVsbC1zcGVlZCBVU0Ig
ZGV2aWNlIG51bWJlciAxNyB1c2luZyB4aGNpX2hjZApbICAyMjYuOTY0MzQyXSB1c2IgMS0zOiBO
ZXcgVVNCIGRldmljZSBmb3VuZCwgaWRWZW5kb3I9MjgwOCwgaWRQcm9kdWN0PTY2NTIsIGJjZERl
dmljZT0gMS4wMApbICAyMjYuOTY0MzUzXSB1c2IgMS0zOiBOZXcgVVNCIGRldmljZSBzdHJpbmdz
OiBNZnI9MSwgUHJvZHVjdD0yLCBTZXJpYWxOdW1iZXI9MApbICAyMjYuOTY0MzU2XSB1c2IgMS0z
OiBQcm9kdWN0OiBGb2NhbFRlY2ggRmluZ2VycHJpbnQgRGV2aWNlClsgIDIyNi45NjQzNThdIHVz
YiAxLTM6IE1hbnVmYWN0dXJlcjogSE9MVEVLClsgIDM5OS45NjM0NzldIHVzYiAxLTg6IFVTQiBk
aXNjb25uZWN0LCBkZXZpY2UgbnVtYmVyIDUKWyAgNDAwLjMwODkzMV0gdXNiIDEtODogbmV3IGZ1
bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMTggdXNpbmcgeGhjaV9oY2QKWyAgNDAwLjY4Nzg4
Ml0gdXNiIDEtODogZGV2aWNlIGRlc2NyaXB0b3IgcmVhZC82NCwgZXJyb3IgLTcxClsgIDQwMC45
MDA5MThdIHVzYiAxLTg6IGRldmljZSBkZXNjcmlwdG9yIHJlYWQvNjQsIGVycm9yIC03MQpbICA0
MDEuMzIwNTgyXSB1c2IgMS04OiBuZXcgZnVsbC1zcGVlZCBVU0IgZGV2aWNlIG51bWJlciAxOSB1
c2luZyB4aGNpX2hjZApbICA0MDEuNjM5OTA3XSB1c2IgMS04OiBkZXZpY2UgZGVzY3JpcHRvciBy
ZWFkLzY0LCBlcnJvciAtNzEKWyAgNDAxLjg2OTI0OV0gdXNiIDEtODogTmV3IFVTQiBkZXZpY2Ug
Zm91bmQsIGlkVmVuZG9yPTEwMTgsIGlkUHJvZHVjdD0xMDA2LCBiY2REZXZpY2U9IDEuMDkKWyAg
NDAxLjg2OTI3MV0gdXNiIDEtODogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAsIFByb2R1
Y3Q9MCwgU2VyaWFsTnVtYmVyPTAKWyAgNDAxLjg3NDQ3OF0gaW5wdXQ6IEhJRCAxMDE4OjEwMDYg
YXMgL2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjE1LjAvdXNiMS8xLTgvMS04OjEuMC8wMDAz
OjEwMTg6MTAwNi4wMDAzL2lucHV0L2lucHV0MjEKWyAgNDAxLjk0ODIzM10gaGlkLWdlbmVyaWMg
MDAwMzoxMDE4OjEwMDYuMDAwMzogaW5wdXQsaGlkcmF3MDogVVNCIEhJRCB2MS4xMSBLZXlib2Fy
ZCBbSElEIDEwMTg6MTAwNl0gb24gdXNiLTAwMDA6MDA6MTUuMC04L2lucHV0MApbICA0MDEuOTgy
OTEyXSBpbnB1dDogSElEIDEwMTg6MTAwNiBNb3VzZSBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAw
MDA6MDA6MTUuMC91c2IxLzEtOC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDQvaW5wdXQvaW5w
dXQyMgpbICA0MDEuOTgzMjg4XSBpbnB1dDogSElEIDEwMTg6MTAwNiBUb3VjaHBhZCBhcyAvZGV2
aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2IxLzEtOC8xLTg6MS4xLzAwMDM6MTAxODox
MDA2LjAwMDQvaW5wdXQvaW5wdXQyMwpbICA0MDEuOTgzNjAzXSBpbnB1dDogSElEIDEwMTg6MTAw
NiBTeXN0ZW0gQ29udHJvbCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2Ix
LzEtOC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDQvaW5wdXQvaW5wdXQyNApbICA0MDIuMDM1
MzE1XSBpbnB1dDogSElEIDEwMTg6MTAwNiBDb25zdW1lciBDb250cm9sIGFzIC9kZXZpY2VzL3Bj
aTAwMDA6MDAvMDAwMDowMDoxNS4wL3VzYjEvMS04LzEtODoxLjEvMDAwMzoxMDE4OjEwMDYuMDAw
NC9pbnB1dC9pbnB1dDI1ClsgIDQwMi4wMzU3NjhdIGhpZC1tdWx0aXRvdWNoIDAwMDM6MTAxODox
MDA2LjAwMDQ6IGlucHV0LGhpZGRldjk2LGhpZHJhdzE6IFVTQiBISUQgdjEuMTEgTW91c2UgW0hJ
RCAxMDE4OjEwMDZdIG9uIHVzYi0wMDAwOjAwOjE1LjAtOC9pbnB1dDEKWyAgNDEwLjE5ODU2MV0g
dXNiIDEtODogVVNCIGRpc2Nvbm5lY3QsIGRldmljZSBudW1iZXIgMTkKWyAgNDEwLjYxNzc5Ml0g
dXNiIDEtODogbmV3IGZ1bGwtc3BlZWQgVVNCIGRldmljZSBudW1iZXIgMjAgdXNpbmcgeGhjaV9o
Y2QKWyAgNDEwLjc0Mzg1NF0gdXNiIDEtODogTmV3IFVTQiBkZXZpY2UgZm91bmQsIGlkVmVuZG9y
PTEwMTgsIGlkUHJvZHVjdD0xMDA2LCBiY2REZXZpY2U9IDEuMDkKWyAgNDEwLjc0Mzg3OV0gdXNi
IDEtODogTmV3IFVTQiBkZXZpY2Ugc3RyaW5nczogTWZyPTAsIFByb2R1Y3Q9MCwgU2VyaWFsTnVt
YmVyPTAKWyAgNDEwLjc0ODk2Ml0gaW5wdXQ6IEhJRCAxMDE4OjEwMDYgYXMgL2RldmljZXMvcGNp
MDAwMDowMC8wMDAwOjAwOjE1LjAvdXNiMS8xLTgvMS04OjEuMC8wMDAzOjEwMTg6MTAwNi4wMDA1
L2lucHV0L2lucHV0MjYKWyAgNDEwLjgzMDA4MV0gaGlkLWdlbmVyaWMgMDAwMzoxMDE4OjEwMDYu
MDAwNTogaW5wdXQsaGlkcmF3MDogVVNCIEhJRCB2MS4xMSBLZXlib2FyZCBbSElEIDEwMTg6MTAw
Nl0gb24gdXNiLTAwMDA6MDA6MTUuMC04L2lucHV0MApbICA0MTAuODYzNDU0XSBpbnB1dDogSElE
IDEwMTg6MTAwNiBNb3VzZSBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2Ix
LzEtOC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDYvaW5wdXQvaW5wdXQyNwpbICA0MTAuODY0
MDAwXSBpbnB1dDogSElEIDEwMTg6MTAwNiBUb3VjaHBhZCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAw
LzAwMDA6MDA6MTUuMC91c2IxLzEtOC8xLTg6MS4xLzAwMDM6MTAxODoxMDA2LjAwMDYvaW5wdXQv
aW5wdXQyOApbICA0MTAuODY0NDg5XSBpbnB1dDogSElEIDEwMTg6MTAwNiBTeXN0ZW0gQ29udHJv
bCBhcyAvZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MTUuMC91c2IxLzEtOC8xLTg6MS4xLzAw
MDM6MTAxODoxMDA2LjAwMDYvaW5wdXQvaW5wdXQyOQpbICA0MTAuOTE2MzUwXSBpbnB1dDogSElE
IDEwMTg6MTAwNiBDb25zdW1lciBDb250cm9sIGFzIC9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDow
MDoxNS4wL3VzYjEvMS04LzEtODoxLjEvMDAwMzoxMDE4OjEwMDYuMDAwNi9pbnB1dC9pbnB1dDMw
ClsgIDQxMC45MTcxNTFdIGhpZC1tdWx0aXRvdWNoIDAwMDM6MTAxODoxMDA2LjAwMDY6IGlucHV0
LGhpZGRldjk2LGhpZHJhdzE6IFVTQiBISUQgdjEuMTEgTW91c2UgW0hJRCAxMDE4OjEwMDZdIG9u
IHVzYi0wMDAwOjAwOjE1LjAtOC9pbnB1dDEK

--------------Qd8JM0YebGnsBi3ni2TI3o0H--

