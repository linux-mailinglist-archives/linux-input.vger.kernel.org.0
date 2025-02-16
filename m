Return-Path: <linux-input+bounces-10083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D0A377FB
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 23:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 321EA16EE9A
	for <lists+linux-input@lfdr.de>; Sun, 16 Feb 2025 22:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4F118C907;
	Sun, 16 Feb 2025 22:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="QY03CKaQ"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2117.outbound.protection.outlook.com [40.107.223.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFDF1531E8;
	Sun, 16 Feb 2025 22:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739743871; cv=fail; b=m5eM3elTWxjoW4DRtNGcN/NeXl0ikLAr7OG5e0Jp+N82LZWJ4WQiIDfYXiQ9xJdF6LNtnMbjw+t5XNL1IxdN31HxxUNF5WwX3Siw8v95URKTx3uwkee7EkcG5hxLPIJxPFrSWo8jdkVMJXpgYZkLjz6me1Matd7+lQy3o8yX42c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739743871; c=relaxed/simple;
	bh=Ir4YhiB38mRskhQEd7NgVKcckHdY3whFR69LkIhgY0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X+86ZUmCZkHjQUXUaJ/xoU71BWtlrdOBQI1gQ8ALne+lBS6ZVlM7Cf70eWllcbqU3jho9trrefUAtxoCaHdbx8LJXjAf6AP8yrcBxRe/048M81lB5CqGf3YEU+9zFyOSrk5wpHhWyrzjlPKYJcN2+zUTZsL89RfZ8ZlELf2FPUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=QY03CKaQ; arc=fail smtp.client-ip=40.107.223.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAS88KAhnQnzDLIk4bZnkg0tYXer828amLggtTwob20fcdnAs+G7TAF2asn5MbosEVzaAz/J+51WIWLI+hsWPuE8MYnTqh2xRDWAtNA4a7xZiQou9ySzmFzYFTa/qWM4D2fbyWWnfiozIPNqq66yiX2B1oOBY10dvBhs6az9M5PhzR1bjtoz8tElqh+J21HQTvJxBvMo2+K2erjQyJhnPMyOODmCk82ZOD5ID192S3etr11xo+Ce4bQ21MLfh4l4OGfuTzYICbryQPFxIgr6fdCdhwG0IwDEThmMYg/tBqCVeRcr/f5X95xOI0A5i8y5VzHDTzW2OHRKe/6iQ6xljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/esh1rM4MsXpgXCbiKLidmtJnvKliyRGlXJ5may8tM=;
 b=FAqSBGZ22RmNkM8OA81Z7VDyFcxQYfOIHDbEadQ0fasPP2Km07nRLmmj8b71uE2ZTKfJTYjKvQJ2UVEJIr8Vwofu9XWD0w/jIRvUNUaKSirv0BSq3ZW5R2z+htpSz2m6IgXS29M5FR3Ry34UxPF5TulHfK+iArMivfOilWtslgVpYd1wcOF8AZr4i6+R/GPniCZbSEY3nPBGY0D+j3FC01uVvzRcXxdQcM15uroj2wN5E5A8toLgN3Dd2G+3I5jzkKhMucsNryAUbQZ34vXdayF8amgdMQp0E/YHnJoq2e7gaQVp1ug7TLAfTOQZlvWPO6HHcrKtLP288+6hHrJc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/esh1rM4MsXpgXCbiKLidmtJnvKliyRGlXJ5may8tM=;
 b=QY03CKaQCfgsoZm8wZkzIVIXDDMdOVBSSZw/SHFV0CURYYQgK6sHz6JsLJy0p3rGnc6+ffEVZ1B+Er8K+yjAdAO1Bzx41JamM7Y8PWyqG0DFy+p9sW/xhCtSAcXT+0FIzEx3nM+movBaSWGOOOE2rSkX3rDugyzLyeeMPD54GKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by SJ2PR08MB8857.namprd08.prod.outlook.com (2603:10b6:a03:562::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Sun, 16 Feb
 2025 22:11:04 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%3]) with mapi id 15.20.8445.017; Sun, 16 Feb 2025
 22:11:04 +0000
Date: Sun, 16 Feb 2025 16:10:55 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: Lee Jones <lee@kernel.org>
Cc: Fred Treven <ftreven@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Heiko Stuebner <heiko@sntech.de>, Karel Balej <balejk@matfyz.cz>,
	Igor Prusov <ivprusov@salutedevices.com>,
	Jack Yu <jack.yu@realtek.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Paul Handrigan <paulha@opensource.cirrus.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nuno Sa <nuno.sa@analog.com>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
Message-ID: <Z7Jib+S1m1/AXnNJ@nixie71>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
 <20250212155050.GC2274105@google.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250212155050.GC2274105@google.com>
X-ClientProxiedBy: SA1PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:806:2ce::17) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|SJ2PR08MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4155f24d-dad4-4b21-cd77-08dd4ed6cdbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b2Z4ViszYkxxTXZ3dzJOaVpsUnlMaGNxNXpQSDN1VTRtOWcrNm9qNWM4Qmpx?=
 =?utf-8?B?TEJlU0U3OWYxZGxpUWp2djIyOVVpYkVGQ3dndTJtR0czaERVNUhJbllFQUd0?=
 =?utf-8?B?ckNmcGlBRjNHc1ZwMGw5eEJTRWtoRHRUWFBYWDRJeFNwbnJkZ3BYdjhpbTFU?=
 =?utf-8?B?MDlwUURMMEtkWURiYjEyOUJ1UFB4QzN4blBmWG5TMnN1Mkhyb0s2aCsyS09X?=
 =?utf-8?B?Wit2cTZITkIxRTVYZnNqNUN3WlhiTGNiS1d6T05XWEpNalN5NU02d1F0VkJu?=
 =?utf-8?B?Zzcxb2xKRlo2WktBU3hXR2lYYUwzSTNQN2pDL2tJVXFvY3gwbGxCVmdaOTNM?=
 =?utf-8?B?bnloeTBQbXJIU0NrUDNKNEtubnArdlNmUE9RUGJxVVcycXQwZFZRcFBPN3BW?=
 =?utf-8?B?RDFuNDYzVFpucWNUamcvV20yYzNzdDQ2cnVBL1J1bG8zOWRzTCtHQ3c4Tzc0?=
 =?utf-8?B?dDMwN2xDeGpnSjk5SHNRQWp4SXNHOWlCbmk3L2k2VFF3WU5kV2ludWwvc2Uy?=
 =?utf-8?B?ZEx3QlBsbmZKZURJbG0vcWx5TnZPS0RWZUdmS2tkYmdMVys3YlIrazZiVnQ3?=
 =?utf-8?B?UTJRQkJ3WVM0SFBDNFdyaU5XQytJdlJyTEJuM1ZkUEFNZlY2azBPejFxcDla?=
 =?utf-8?B?eFNEbG15cllZRU5jaXdkMjcwTnJXbXFVbEt2QXd5NWJqK0hpYnZiSyt5em8x?=
 =?utf-8?B?WkJhNkdzdWcyU2VuM252NTJ6NTNqZzJDRmgyQjVQdjJ5Z284MHVTQTF6encx?=
 =?utf-8?B?TitZd2VZRzRtYlBHSFNTdHVCb3FZNnlCbEpuMXNENW9nUzdkajYyTFpUM2VS?=
 =?utf-8?B?Y1dHSncrV0dNaWZoemszNStxVEMrMVphM0diNUFvaHhCcUpLT0kyZHJNMm51?=
 =?utf-8?B?YkRFTEJ1d0NYbHhCWFhIMm5GYzQxK3Rmd0JDV2hERVBiTnZsQkxubXR4dGY0?=
 =?utf-8?B?aGpRZ3Jqc1hUVU9kVmxCbVJXdkM5NkJ2ZnRvWno3TFNqU084c0U2SjNUU2Fh?=
 =?utf-8?B?Yno0QXZaS0FCaDltNEUxTWNZMTV5UHJ5L2o1MUZRTmRnU0tFcm42WUZxVmhI?=
 =?utf-8?B?d3h0SzVuZ2FiMXNnK1RpQnJmdXRKRFhKUDY1UklFRnI4eTBxVHAvSzFjR0lI?=
 =?utf-8?B?WCtHUzdxT1dOYmhycEs5TlZ5RVZodkJqL0cyVDNPZjRxcjBoZ0Y1eDNzenZ4?=
 =?utf-8?B?NUdhN0d3T1E5aUN6aVl4RThwSlZpQ1cxMWprYXVsM0M2ZFBWZ3o4bVp3RU1K?=
 =?utf-8?B?TWFrcVYvL3ZWdXUvLzVGUHlTMXYrVTk0dnRqUmpHdm9FN3Y4QlFOQ09VY0Rq?=
 =?utf-8?B?WElnTXBPSURaVDhCM2hERS9RYVdocG9jcFZjOHQxdy9SMUgyeGlUd1JrV2Na?=
 =?utf-8?B?OFBJdytoakZGMG0xUkttaWg4OUFFNGlVeWx6citMMFdMbS85UWJPSmEvcTk0?=
 =?utf-8?B?VThsMHNiSDlaSHJKN1NLUWxHbFRYMEJsVzRSblVKR1E3OW0zS3laMi9GaDBt?=
 =?utf-8?B?dmRTdzRnckJscFNiWDRJSTFSR05STkE1VTIxTzFYbk9saHFtNkswdXRGUk1N?=
 =?utf-8?B?WFM2SGUrOUJvU3VWU25QVzBaRllkaTV6dVo2ek1jN0NpRUFpZlBacnN1YnFz?=
 =?utf-8?B?Ui9EOUp1QlNFY242b2hoWHZsVU44NmRzeWlyNVFTekxZTnJWaUNYd0F5cFNP?=
 =?utf-8?B?dXFGK3dJRVZyVHdSYnNIN0owQ01ZaDE3SGlvVTJuSTVHbG5iR3pvTEFpMlFk?=
 =?utf-8?B?NE9WRHhlcWpLYWhCN1BsYmJtSUxVdXozWTdhdjFwcEg1d1p4SkpVdTNTb28w?=
 =?utf-8?B?R3k2S0RXdjdONkpPWVZRdkdoaXdod3Q3cjFXamlyRTF3R1VMWDZXRkdpUHpj?=
 =?utf-8?Q?QPbS8VSVB3kQ5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkE1VVRYK2U5Yk1mYzFMTDgrZ05zY0YybmpUbFZnL2poSXlQZENqWGVOQVVK?=
 =?utf-8?B?dS9CYXZlRkhMeWlpbjVsVWlMT3hqbXB3YkE3dDZEUlJFOW5MZ3EzU2FvcVFx?=
 =?utf-8?B?VitqZTU5dFVkSy81b1NQVmtySHZmbDEyN2QrUnFuMGdPbi9zckEyYyt1VGl2?=
 =?utf-8?B?MHlGdXdMcWNIL0lGRXA1cWo1WWRlSGM2MUptckNITEFqYkVaSGpkaWJjdmtM?=
 =?utf-8?B?RXluZW04N242QkxDeGd4WEhtdG11cUU2TmJsQmUzcXFrcEtUY0kvVk9jZmRy?=
 =?utf-8?B?VkJML2RFcmpjM3dySkZKM1RZbWZ5dDBiS1ZlT1NoR05md0NVL1A4aTNTeisr?=
 =?utf-8?B?dkI5SUVIMkFOdzMxRUgvbTB5YVBWd2JLQUlMcUs3MktucElIRlpHZ0c4OFl5?=
 =?utf-8?B?N3BENHU5NzFjOG43R1FyR1h5TDkwUFNGQ1FMMVJRc1kvK0lmNTRTR05ySGZT?=
 =?utf-8?B?b1F3b3QrUjlsdVYwekNMMW5uZmRrZ1pOam1LZ0FEMHZrbTZVRTMvUUlSTENC?=
 =?utf-8?B?VEYyN1lOMUNNQk0zRFNBNUtBckxiM2RMaTVCVXU3d0xLdW9QbnB4WU80YzFN?=
 =?utf-8?B?UER4TDJqZjNTelFST3ZlLzFPbXRVekRUM0VveGcrUXJKRVYwN0xsYVE5NTRT?=
 =?utf-8?B?WnZLK2MrVk96c2NxMk5nSG5SOGd4ZW5qR2h5RnhnR2hNRVBKYTM5aGNpc3p6?=
 =?utf-8?B?eldacEJ6a3VFeEVyUFFHU0ZYQzNjN2dDeEJRSW5pdWRFMnJPTGlrdHo3OVhX?=
 =?utf-8?B?KzV4eW5TbkZScVFZTUtKRzRrdWhwckZiVVJ2OGdDS3NVYVRyYXpKQ1ZuUC9O?=
 =?utf-8?B?aXduYWNJVENKU243N2pKbVFHRkxPR2IxQTVOM29jcWlWQm92RjVSbVhmNmtr?=
 =?utf-8?B?Rzc2V2lqRjZkV1RPREJLS2ZhQjh6WDBGU1NBT0tvdnV2WnpWSjcxenB5cWlt?=
 =?utf-8?B?Y1A1N3dJQ3crektYdmhLdTBLZXM4Z2lRc0FJa0k2TWpFVkJOQ0VIYTNmN1FM?=
 =?utf-8?B?MFI3YVp4UW1ZalRxTURueWo5SVNLdmU2cVkrRGUwQTNkMEh6UUR3ZFM1OHo0?=
 =?utf-8?B?RVZPMCtnalMrWis0YXZUR1dUQkYxQ2lEN1lHQ3MrOXVwY2ljSXQrSktpaXk0?=
 =?utf-8?B?WVZMTFJzMVlsVVhlcHNodTFoNnlkaHdYZ1BpMTFDcitrWTNPQU10K2pvaWl4?=
 =?utf-8?B?aTJ1d1h3ZERRZkV0V1dOeFRLZEJ0c2FIa2VFeUt6ZnQrdjJQS0FuYmw0Q3lP?=
 =?utf-8?B?V3pvSEUxSCtnSkE0ZDF3cFpNQmlnbzFQZkpUTnppbFFxRGtLTEdCVHpselhY?=
 =?utf-8?B?OTV1RFRHUWFjTExuZnVYb1NSbGlzUXduU1pUYWRsMW5CUi83bTRHQjl6S0hp?=
 =?utf-8?B?MmNOcUU2Mlhaa2t1L2tmZVplSUlvZWw2eUpVTGkzRXUrTzJhT01mK0tySU8r?=
 =?utf-8?B?Qk4xTkxERzBiU28xVlZnUmxQUFRZSms0MGdTRW5PZzZERXdKRVhkSWh2VDQ5?=
 =?utf-8?B?MFQ4RVlSVjRmTmJpTGxVNm9BdmRpN0tYdjY3em4wcXN5bGxpUy84VHdBUGc5?=
 =?utf-8?B?d0NsN3ZnNWNEalQ1ZVJ2S3hKbS9aRlE2ODl2TnRiRlh2b1RQTTFSSU5aYk51?=
 =?utf-8?B?ZEV3S1BYUXk5RmcrbGtydkl1bER1UUVyMVZBRWs2U0YxREViWkJlaG5ONS9Y?=
 =?utf-8?B?bE1jMFBFRDBwRUN6THUwdzNCTHRtMVZoVWlGZDFvMnBFbDNIOHpKTzFIQzdL?=
 =?utf-8?B?clI4YWdwWGZCQTEzZGZWd0wzZVdXRER1dGlXTmgxVXFRTkpWcWFjcnJZUWFI?=
 =?utf-8?B?aGJpTHBJT2tNaE9oMTgycEZMUUJURGdmSUxGaHlnWmtTR1pVN3V1Q1hUZDdH?=
 =?utf-8?B?bFNzcUtJNEduWW9UNEZjWlFzSkpoL2ZNSTNNY3c5cXBHYUFmZW1KcXFYS05U?=
 =?utf-8?B?UDVNSjZqdG1YbzA4eWVpM1BNNWhEMGNiY3Vzd1VNdWlKOU9ZRXgxeWhXRUQ0?=
 =?utf-8?B?dkVPVG5qaDl0d1FWc3V3NGNPVkNWc1VXcStvdEd0L2o5WUYvak5SekRNSXI3?=
 =?utf-8?B?bml1bmxRVXZ3RnRQVDBtZHlUTEJTdURzM3lGYTFwbkdvbG0xZVBweEtDbnF0?=
 =?utf-8?Q?nm77EsVrCdbM7q3aQgJYDHmdP?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4155f24d-dad4-4b21-cd77-08dd4ed6cdbe
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2025 22:11:04.0289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y63PDAZssawMEF27zYSyuTO9T5QhjmJOoRJCTdxJZl7BCGmVP56Wye3HjRdOvWfYioZNoMI33wNux3bvMtE5wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR08MB8857

Hi Lee, Krzysztof and Fred,

On Wed, Feb 12, 2025 at 03:50:50PM +0000, Lee Jones wrote:
> On Tue, 11 Feb 2025, Fred Treven wrote:
> 
> > On 2/5/25 04:34, Krzysztof Kozlowski wrote:
> > > On 05/02/2025 00:18, Fred Treven wrote:
> > > > Introduce support for Cirrus Logic Device CS40L26:
> > > > A boosted haptic driver with integrated DSP and
> > > > waveform memory with advanced closed loop algorithms
> > > > and LRA protection.

[...]

> > > > +int cs40l26_set_pll_loop(struct cs40l26 *cs40l26, const u32 pll_loop)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	/* Retry in case DSP is hibernating */
> > > > +	for (i = 0; i < CS40L26_PLL_NUM_SET_ATTEMPTS; i++) {
> > > > +		if (!regmap_update_bits(cs40l26->regmap, CS40L26_REFCLK_INPUT,
> > > > +					CS40L26_PLL_REFCLK_LOOP_MASK,
> > > > +					pll_loop << CS40L26_PLL_REFCLK_LOOP_SHIFT))
> > > > +			break;
> > > > +	}
> > > > +
> > > > +	if (i == CS40L26_PLL_NUM_SET_ATTEMPTS) {
> > > > +		dev_err(cs40l26->dev, "Failed to configure PLL\n");
> > > > +		return -ETIMEDOUT;
> > > > +	}
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(cs40l26_set_pll_loop);
> > > > +
> > > 
> > > This looks way past simple MFD driver. Not only this - entire file. You
> > > configure there quite a lot and for example setting PLLs is not job for
> > > MFD. This should be placed in appropriate subsystem.
> > > 
> > I disagree here because the configuration being done in this file
> > is essential to the core operation of the part. For instance,
> > setting the PLL to open-loop here is required to prevent any
> > external interference (e.g. GPIO events) from interrupting
> > the part while loading firmware.
> > 
> > The other hardware configuration being done here is required for
> > both the Input and ASoC operations of the part.
> > 
> > Lastly, these need to be done in order and independently of which
> > child driver (ASoC or input) the user adds. If this is moved
> > to cs40l26-vibra.c (the input driver), for instance,
> > and that module is then not added, it will disturb the
> > required setup for use by the ASoC driver.
> > 
> > I would really like to get Lee's opinion here because it does not
> > make sense to me why this is inappropriate when the configuration
> > done in the core MFD driver is required for use by all of its
> > children.
> 
> FWIW, I agree with Krzysztof.
> 
> There's a bunch of functionality in here that should be exported out to
> leaf drivers which should reside in their associated subsystems.  From
> just a quick glance that looks to include, but not necessary limited
> to; IRQs, GPIOs and PLLs (Clocks).
> 
> MFD has been used for a dumping ground under the premise of "core
> functionality" before.  Tolerance for those arguments are now fairly
> low.

I think all three of you are right here. MFD should not be a "kitchen
sink", but I'm also cautious to call this particular series one such
offender. Let's consider how this hardware is logically organized,
keeping in mind what I personally consider a core tenet of MFD, which
is that each child should serve a purpose in the absence of all others.

This device is fundamentally a haptic chip; like many others in input,
it has a low-latency GPIO trigger. As far as I can tell, the chip itself
is the only consumer of this GPIO; there is no practical scenario where
another chip would access it.

What makes this chip is unique is that it has an I2S port; from that
perspective, it's also a DAC with a motor instead of a speaker. Any
stimulus that drives the motor (e.g. external GPIO trigger, FF ioctl,
audio-like stream, etc.) is therefore capable of asserting an interrupt
(e.g. hardware short), which is why the parent (i.e. MFD) seems like
the most logical place to handle this work. This chip would never be an
interrupt-parent to anything else on the board, so an irqchip driver
does not seem useful here.

I do see a lot of GPIO-related ISRs, but it looks like we can simply drop
these; all they seem to do is print a debug message, and perform some
housekeeping to track the edge polarity so as to print the correct debug
message. If I'm mistaken and the driver really does need to perform some
critical tasks in response to GPIO edges, then I do agree a gpiochip
driver seems useful here, albeit an extremely limited one.

I agree there is a case here for a lightweight clock driver representing
the device's internal PLL output, but it looks like all the children need
to do here is one regmap call. I'm guessing the reason this regmap call
got put in a wrapper in the MFD is to avoid duplicating a small retry
loop in every child driver. Simply replicating this in only two children
seems like less code then a whole clock driver solely for that purpose;
alternatively, maybe there is some way for any child setting the PLL via
regmap to better understand whether the device is asleep and may NAK.

Maybe v2 can start small and do the following:

1. Remove what can be considered "customer bring-up" code (e.g. liberal
use of dev_dbg); this may get rid of all GPIO-related noise.

2. Consider whether regmap alone can handle anything related to IRQs and
the PLL.

3. Consider whether anything in cs40l26_dsp_*() is better suited for the
cs_dsp driver in firmware. A lot of this work seems suitable for any HALO
DSP based device, even if CS40L26 is the only user for now. Maybe some of
it can be consolidated with CS40L50?

With the series pared down in this way, it will hopefully become clearer
how much remaining functionality, if any, should live as a separate stub
or leaf driver.

> 
> -- 
> Lee Jones [李琼斯]

Kind regards,
Jeff LaBundy

