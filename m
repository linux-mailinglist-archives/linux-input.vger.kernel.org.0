Return-Path: <linux-input+bounces-12918-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F091ADBB71
	for <lists+linux-input@lfdr.de>; Mon, 16 Jun 2025 22:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F1417A927C
	for <lists+linux-input@lfdr.de>; Mon, 16 Jun 2025 20:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2498F1448D5;
	Mon, 16 Jun 2025 20:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zsipFKrB"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE91E89C
	for <linux-input@vger.kernel.org>; Mon, 16 Jun 2025 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750106815; cv=fail; b=LXsFRk5m4LQ/cc/b6JKTKuuLoSAT6MZmZh5DPPhOoIwEWvMyNCunmZ1dOnaqwNgKM2OiLey6jYnd1zI/P71+2mG0HEf6CH6EzOhN5actfKcx1gENYAPNj0CcCSM8k/4I1alMFLx1EKoLpHp82xwSjMkrj6D3nytRAOS7J14UNGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750106815; c=relaxed/simple;
	bh=jLGQFGy5etYN+ecb5Fa9/BrA93iNYartzS2MCNNDR9Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=i90Tf3bOKesuvmm70T/zrIRi/Sh5bR/Zd1WxvALNvIdGXCLe8GpMWk7e3xnQdc+ZB+F4fUOhAEV+vYNT/BL/AJxWKsIR420lDaRGZFhbNglNxUUrRpVvFFXTw5jaA1kcSriqnDNJemJuopy/CpctMdwSenKJ2tTCMjUbSHax6BI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zsipFKrB; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzVc5TJKpapAoJZDOVuj/onX35D6fUV01GvByULHVzxjE7v6yIBqpenlTOfahwuLDk/a0/dT8rhxyQCoLDpg6ay+k2I2A+SFGp/CBhKOQ/QWW6/FNDcZH9aWAkBAqDmH/3Iqq1YGYmg+MJ3dm1mMo4pHmxyEkMLvGhKdwpbdm55TB+/695DC/RS/gtwoBFW7Wen/p7KuPT2gKZW1kXqkBiLJlrcTOmVs6kXp4ChB2Wz4pajAqmJNOqEJJpNlyiml4cTXDk6tHjR1a/q5DHp/zExk8dduDhNXOswJ9i97FzjtP2Ep/6fCjI5iYz1GRtuVksu2XKatAgW3KQ5rRaCH9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLGQFGy5etYN+ecb5Fa9/BrA93iNYartzS2MCNNDR9Q=;
 b=xagaSaNr0TsBcnsGSloIVw5aH5kd3K4oTsfloOoMnw/9596CL8JALNoF9SkzSIQB0269uvTXQu+byLMqihOStaOFlAIUmqztkKumijPGH7DGKoqgvXxd2lFWMBVoKU5P3O/W+SLOd/HB9WJQDP8G0jEkXlKQqnfoVTeUeaaIUpD2OMQ2zV0ezvsx5F7vAMFW7ayybBzS/1y2P7tqFo5ydJzmvNpTQKGOpx5WdxbQyt0PbJM1Xh8SYbx1YsfcTXZ6up/Rv40h93slFc2Eon3VnoM9h25NVjCLXryHXDAHNIYYZgWOMqSfh9/Gfol7BhHr+yuzGwPV1qtr9pWpaoHCvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLGQFGy5etYN+ecb5Fa9/BrA93iNYartzS2MCNNDR9Q=;
 b=zsipFKrBXUnhlvn3YcNw67yoeLD7i1hhiSbNluJJ361QCRcBJrWP+e2vzBO2G76b0Zooa8Gtvlt4GQ8TCXMUYZOfKT4wTL3LFksxGNCIv3SUhrW4JRZ/MqvynYiKICbIBghE52RoqZL91NbyRuGOtTxF2xxPAqRbx/+xJplVFI4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 20:46:49 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 20:46:49 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Eric Naim <dnaim@cachyos.org>, "Natikar, Basavaraj"
	<Basavaraj.Natikar@amd.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, Denis Benato
	<benato.denis96@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"MukundShetty, Akshata" <Akshata.MukundShetty@amd.com>, "Pananchikkal,
 Renjith" <Renjith.Pananchikkal@amd.com>
Subject: Re: [PATCH] HID: amd_sfh: Enable operating mode
Thread-Topic: [PATCH] HID: amd_sfh: Enable operating mode
Thread-Index: AQHb2YzRZ/ngE2gqXEeSALDblWZ0MLQBMLyAgAENxQCABA30AA==
Date: Mon, 16 Jun 2025 20:46:48 +0000
Message-ID: <57eb65bc-f710-4c86-ad0e-7473cc6db135@amd.com>
References: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
 <d63d94db-e257-4419-afeb-a661e833aa81@amd.com>
 <75105471-8f60-41ef-bd51-c7c4ea255664@amd.com>
 <5da550c2-b0d6-4114-baa2-c66070092b28@cachyos.org>
In-Reply-To: <5da550c2-b0d6-4114-baa2-c66070092b28@cachyos.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB6835:EE_
x-ms-office365-filtering-correlation-id: a7ceaf03-dfc9-4305-b80c-08ddad16ea6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cUhTY3hEb25JQkMyZGpzMXpxMjdJUThQd09OZnRyZDV6cFVIc1ViN0FOTVNy?=
 =?utf-8?B?ZE1USGt0Z1Z4L2tNSGJjenJWMG9nU3JqbVNmOWh1eTNVQ1hwVGIyMzZ2b3pV?=
 =?utf-8?B?YWt3aHdIQ0wwWGllZnozOEljN1h1bnVjSGUyMSttaC9FWG1oN3NmUW5oL28x?=
 =?utf-8?B?V0JsdHZseCtZUFk5V1JRNlB0VGxyeVNFRStTZkJ6WmVUcEUyTzZVK0tWL3ZF?=
 =?utf-8?B?QWZhOUdiQmZMZUt5SVpjaGM0MkdYRTd0Yk9CNkNlb1ZXRjZHb2UzYzR5U2hU?=
 =?utf-8?B?LytPR0VWM250Q2JxaW5HUHp6MyttK0NsemY0SUVYd2c1RGFNNVJCTzMrUkhJ?=
 =?utf-8?B?VFBoalhpNVFpaWI3Z3ExV09Mc014YjdyMmpwSWFXd05yT2lQQk9NMy9SOUox?=
 =?utf-8?B?VGJOdmk4Yk0rZngvM2ZFN0J0QjdRZnBHTnJDSkI4M2x0WE43c29mSTl3aHBR?=
 =?utf-8?B?RlpWNkMxSmZLckw5OE9hOStUcXlkVGRsRXZuQ0VpWVQ5bFBHc20rQ2d5eCtw?=
 =?utf-8?B?VmpwUU4xeUpYdVlTcUNlcXpodXVPcUQzZXhCUThyVnl1SkhDZEpXaldMeldt?=
 =?utf-8?B?aEVsUHFQL3J4OGlrVTdUY3BBQTNjd3B4NG5TdG1DSGtHWW5RNjdyV1VRSlox?=
 =?utf-8?B?b3dwUll4QTd4cllJYWlRUWhRd3g1VTBMS2pwb3V0d0VmUk9Fd2N1YnVYZWx4?=
 =?utf-8?B?SkZiSGMwOUlYeExobEhiamlzUCt6aG9XTkNBZkxvZjF1cVdyTTRDbXBHZVpW?=
 =?utf-8?B?cnhoZERxcU1OQ3owSU1sZ2ZsUit2QU41RXc1R1ZyVUluZWhuSWZycGFBQ0h5?=
 =?utf-8?B?cnNoUkhqdEI5MXdSK0w4Z1dxZ1plNDJUdXdUeHFrVmsvUG5LYnV2K2lxaVUz?=
 =?utf-8?B?LzhjZE91emQ5angzSWl3OURwRmlkYVh1UjhndXBZK1hTOUh4cVB1RzZoRVZp?=
 =?utf-8?B?a3lOY0IrNDI2TEtKS1BjdWhJK0pCaldOTmpuWGJkZ0hscXR6OXVBR3ErTGpn?=
 =?utf-8?B?b1VnYTc4VW9MZ1AzaXV0T0pJVlNXVGtPU3V4ZzZ6Q2o2UkJ6MW5XU3NWSHRC?=
 =?utf-8?B?RVdKUzZXV1B0VmdlY3lDc0piallxaHgvZHBhUExabHVlSjV4S05mdFhzcGVX?=
 =?utf-8?B?cktDakRtVmM1YVcxcHdxaXpmb2N3WFR1UGQxRXpHQ0tCcWdwQXdqdGdNMHc5?=
 =?utf-8?B?VTlxN2NJVTdRVzNtY0drdk0yS0swMFVhZ2JTeFZQLytWcFZYSndRdjYyT21a?=
 =?utf-8?B?ZFJRWEtFYjdPQlFKZnFuSTg5cnRyeDNqcnorMy9UN3FqMEpvVWg2SG1xRU1F?=
 =?utf-8?B?SC9EWEo2YmxEVkMyQm9keDFzM3pFK2IrRkptL0Fza2JaWEVveXpNUkx6S1pS?=
 =?utf-8?B?WVB0MThxRmp0SUsxY2thcWdPaUdCeG5nUWxBS0pTYVkxQ2cyRm03bmY4K3BM?=
 =?utf-8?B?TEN1dW5KKzQycWJnSHY1emZpUXY2eU94WitVS1A0REQvTEdSV1ljSUUxRVJG?=
 =?utf-8?B?QWh4VXptMUtOU0EwbTJyKzFXTlJPL1VFVm5zTExad0F5MHN0UlVhVUd4NW9j?=
 =?utf-8?B?bGlTUDRTaUYzb3NSMEUzY0wvV1ZrNVNmYkFsYUxWcDM4ZDMyOUUvd3JIOStE?=
 =?utf-8?B?WXNnbnFWZmNPSXBlZFVONzhyYW83UCtpeWlldWFrR3VNaXk1MVRhK3FCS3J0?=
 =?utf-8?B?eGxzZzJEVjl6K1A0ZktoOXZDKzRuS3BsaHFieXlrQ3dQQUJVS21kMDgrNVVU?=
 =?utf-8?B?UEdFRkVRQVh5emZSd2ZvUWJma1A2d0VDR2Ztd1NiZ0lmbGRIaGxxdFliSGZS?=
 =?utf-8?B?K3I1a2dCTE9MZ2trNVdzdGg2TjZOenhGd3JGd2FUa3RNMXZZd3hWbzdIY2Fi?=
 =?utf-8?B?cG9rbG5pQjgwbktQdU9jaUZqNXllRjhaMWFNSCtHakR6U0ZXMUxlbDlHV1JE?=
 =?utf-8?B?RERSdnltZlBLM0V3cXJwTGttSDNGa2NZVEV0ME9RWThQcnpKbXd3di96OFZW?=
 =?utf-8?Q?J62d0mUt//9qBMpyzaVXlDneJvoJvU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bUhhUktEZHkyVTVWTEFZZDRBUlV0TCs2djhmUm1kZVNGRmx3c3UrOU5vTlRp?=
 =?utf-8?B?cjdpN2JQeDZyVktHT0VOV1V2SWtvdThjZW9ibU5jYkxjMkFnY3N3b1NRYmhT?=
 =?utf-8?B?eFJxVmRvTW9vTHdsbkFRNzlkTzVFUDRKNWVyWkhCdU0ralUrbUpYS0NHYURL?=
 =?utf-8?B?bGFMWmFhM1ZMOS9tbUYyb1Q4eWxiYml1aC9qRmRHMEM1SXFkMzFYakl1aXhk?=
 =?utf-8?B?S0VjcU9ycUtacmhzemNnRUJLTlNDK0xadGFLRXpCU0FBZUtBdjhMK3FHL2Q4?=
 =?utf-8?B?WWNWTDlRUWNwcGdoY1czV28veHJZNk5qSTkyRnFWZWoycHYwLzJwOWpqTHNR?=
 =?utf-8?B?TlFNOU50bjVRaWZZZmpjWjhlUUhTWXpiNXp4S2xFRWpicmlhU0g5OGQ3Slpi?=
 =?utf-8?B?aFZjSWtMVXZIeFZqZzkwSVpnOUxwdEt4L2g3d2tVY080LzRKMDArWjBFMUNK?=
 =?utf-8?B?N0pxcDlXT29CeFo4c0tOZzFrd2hKOExoMHFKdWhMMTR3RGpvYTlZdEN1VlJW?=
 =?utf-8?B?ZmM0WWh4NnN0VmhxWWlSUlVqSU1MTytpY3JIUmhYekRDUTVnNXN4SytPTTdK?=
 =?utf-8?B?WVQ4MFBCM21WZURINTE4cTN5SE5ZZjd0MDJPaFpTV2x4czFObVFlQ3oxQ2w1?=
 =?utf-8?B?S0pZd0c2ZEJWS3YxZXl5SERoZmN0ejJ0dkxxMDJMWU85NmcyZ3VHNVA0T0Ni?=
 =?utf-8?B?TC9zZFZZVG03VXVlTTBoNUEwU1N4am9OdlJlZTRhdUNQY3U1eUk4djdMODE5?=
 =?utf-8?B?WDVqTEpBTlNFOERvUmFuQUh0dGs4c3MvMzh6VmxhOW1NVy96T3lIb254QXAr?=
 =?utf-8?B?VXNTOFpMS09QZzB1WVZaVUdkTko4Z2ZtMFhDSG9KMVdHeWtNRmwzR3ZwWUtR?=
 =?utf-8?B?aWZ1aGZ1enI2S3Y3TUYwU0ozY0x1d0F3VWVkM29ITjlkRUxLRVVEY2pOQ3di?=
 =?utf-8?B?S3pQVTdqbnphTlRpcUpZNERwSmZUSXR1TnFkclFlTkpEUTFpakxDY3NienNO?=
 =?utf-8?B?ek9uNmUySGI5QnNCelVUYkZhc2RreDhPdEg3YWYwdWVTVE8reGJpRXhzRmxo?=
 =?utf-8?B?VjVqQms1ZTRBZFJnTzhrczVCOWpOTlE1dXhaN1U2Sy9sNEk4WjdyWGxzVUtO?=
 =?utf-8?B?L0ZsTU80ZDJqRmErRVdCbFhqTmhIYndUc3J2eG5QQU5qUXZvY3RoeFNydTE5?=
 =?utf-8?B?STZsS0FDajEwbUYzUFlpa1liaEc3YmpvcVJ3VGtQL0VaL2tIMFZ0V1V2VVVH?=
 =?utf-8?B?WEFxYjFMOUFqdi82cCtaNE5QWktvQXJkMTc2V0VnK2VWUDBuR0tLdE00U0J4?=
 =?utf-8?B?NWtWVzc5OTdlaXk0VDRFZFBlcHgyWE9RVHlZeHBwSmVwTncySi9hWWZNdG5N?=
 =?utf-8?B?ZEUrczNmbjNtQmFVRXgxMmRzZ3dFNWlVYXdnODFwSUpVTzJLTGhJTGFDUFNh?=
 =?utf-8?B?OXVnS1RkbTVvYTlDaVVOcXBoZ01ja25LaHJYMGlkK2tVSmppaEd3MEluaGs1?=
 =?utf-8?B?eGptbyttN1BlRUFSQlZHRG4xSDNISXJ6bFR6bWRTelFWaE9LbGhHRnRRaW5t?=
 =?utf-8?B?TXZxWmRPeXBPcmlvcG5UQkVQajY0NnVTM2lGQ1R6WG45QkNiUnI1UDJFVG1C?=
 =?utf-8?B?ZnI0ZG1rc3hTbFBzVlBFYlhOVjZIbWtpcmJWMDlVOEZ5elIrU0JEcDRLTmFp?=
 =?utf-8?B?TElXOXQ2TnBjU2hXMEY0VFJmUUc1MjMzSGhTNllrS1RuVEFhVEdKcmZvNlBM?=
 =?utf-8?B?TXlCYlV4YmkxdnJtOE5EMGhWb0wwY0pFNG5mUlBhMFVSc0p6a0Z4VW8ySWR4?=
 =?utf-8?B?eDV0NExMQW5vMWtQY2twZUZpUFBFdTBEVElpT2JsRWoyME9qLzM0ZVJzdWF1?=
 =?utf-8?B?YmpQdG1YelVjc3gyamcrRmJZR2h5S1kxV2M3QkFOUE4rWnhQTFpqeVp4VDk5?=
 =?utf-8?B?d2pxOEtZNXEzMTdQMDhXZ1hBSEcvWE4rOVQ4bzJRQjl3ZloxeXhJcm5yb2hv?=
 =?utf-8?B?T21iSTBoQmRBVzFqRXN2UVc4QXJCWkRFdDJsOEVNSENXWXBVR1MwUVc0b2dX?=
 =?utf-8?B?Y0hRbDZZTGVRQ2xVaTE4WGh3bVM3cFZpUlh2UDZKNElsaDY5dzJZNXhjR3R0?=
 =?utf-8?Q?IUsI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4961818D6EFB0E49966EEEFBFD197782@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ceaf03-dfc9-4305-b80c-08ddad16ea6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 20:46:48.9617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iCBnOVg+mMqzdyyn0KsBwfsIrhptCxbXfZ8n1Bcj+o6jHtYVF7HA/1LUrcXmucMeFOeLhJuLX6AKMgD22JHogQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835

T24gNi8xNC8yNSAxOjUxIEFNLCBFcmljIE5haW0gd3JvdGU6DQo+IE9uIDYvMTMvMjUgMjE6NDYs
IE1hcmlvIExpbW9uY2llbGxvIHdyb3RlOg0KPj4gT24gNi85LzIwMjUgMzoyMSBQTSwgTWFyaW8g
TGltb25jaWVsbG8gd3JvdGU6DQo+Pj4gK0RlbmlzDQo+Pj4NCj4+PiBPbiA1LzI3LzIwMjUgNDox
MCBBTSwgQmFzYXZhcmFqIE5hdGlrYXIgd3JvdGU6DQo+Pj4+IEFkZCBjaGFuZ2VzIHRvIGVuYWJs
ZSBvcGVyYXRpbmcgbW9kZXMgaW4gdGhlIGRyaXZlciB0byBhbGxvdyB0aGUgRlcgdG8NCj4+Pj4g
YWN0aXZhdGUgYW5kIHJldHJpZXZlIGRhdGEgZnJvbSByZWxldmFudCBzZW5zb3JzLiBUaGlzIGVu
YWJsZXMgdGhlIEZXIHRvDQo+Pj4+IHRha2UgbmVjZXNzYXJ5IGFjdGlvbnMgYmFzZWQgb24gdGhl
IG9wZXJhdGluZyBtb2Rlcy4NCj4+Pj4NCj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBa3NoYXRhIE11
a3VuZFNoZXR0eSA8YWtzaGF0YS5tdWt1bmRzaGV0dHlAYW1kLmNvbT4NCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogQWtzaGF0YSBNdWt1bmRTaGV0dHkgPGFrc2hhdGEubXVrdW5kc2hldHR5QGFtZC5jb20+
DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJhc2F2YXJhaiBOYXRpa2FyIDxCYXNhdmFyYWouTmF0aWth
ckBhbWQuY29tPg0KPj4+DQo+Pj4gQ29tcGFyaW5nIHRoaXMgdG8gdGhlIHNlcmllcyB0aGF0IHdh
cyBzdWJtaXR0ZWQgYnkgRGVuaXMgWzFdIEkgbm90aWNlIHRoYXQgdGhlIG1haW4gdGFuZ2libGUg
ZGlmZmVyZW5jZSBpcyB0aGF0IHRoaXMgaXNuJ3QgZXhwb3J0ZWQgaW50byB0aGUgSElEIGRlc2Ny
aXB0b3IuwqAgU28gaG93IGRvZXMgdXNlcnNwYWNlIGtub3cgdGhlIGN1cnJlbnQgb3BlcmF0aW5n
IG1vZGUgd2l0aCB0aGlzIHBhdGNoPw0KPj4+DQo+Pj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtaW5wdXQvMjAyNTAzMDkxOTQ5MzQuMTc1OTk1My0yLSBiZW5hdG8uZGVuaXM5
NkBnbWFpbC5jb20vIFsxXQ0KPj4NCj4+IFJlY2VudGx5IGEgYnVnIHJlcG9ydCBjYW1lIGluOiBo
dHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIyMDIyNA0KPj4NCj4+
IEl0IHdhcyB2ZXJ5IHdlaXJkIGJlY2F1c2UgaXQgYWR2ZXJ0aXNlZCBhIHRhYmxldCBtb2RlIHN3
aXRjaCB3aGljaCBJIGJlbGlldmUgY29tZXMgZnJvbSB0aGUgcGF0Y2ggdGhhdCBJIGxpbmtlZCBi
ZWluZyBhZGRlZCB0byBhIGRvd25zdHJlYW0ga2VybmVsLsKgIFNvIHRoZXJlIGFwcGVhcnMgdG8g
YmUgcHJvYmxlbXMgd2l0aCB0aGUgZGVzY3JpcHRvciBmcm9tIHRoYXQgcGF0Y2guDQo+Pg0KPj4g
Q29uc2lkZXJpbmcgdGhpcywgSSB0aGluayB3aGF0IHlvdSdyZSBkb2luZyBpcyBmaW5lIGZvciBu
b3c7IGFwcGVhcnMgZmlybXdhcmUgaXMgbm90aWZpZWQgb24gdGFibGV0IG1vZGUuDQo+IA0KPiBV
bmZvcnR1bmF0ZWx5IHRoaXMgdmVyc2lvbiBvZiB0aGUgcGF0Y2ggaXMgYWxzbyBjYXVzaW5nIHBy
b2JsZW1zIGZvciB0aGUgdXNlciBhYm92ZS4gQXR0YWNoZWQgaXMgdGhlaXIgam91cm5hbCBsb2cg
d2l0aCB0aGUga2VybmVsIHRyYWNlcy4gU2VlIFsxXSBmb3IgdGhlIEdpdEh1YiBpc3N1ZS4NCj4g
DQoNCkkgbG9va2VkIHRocm91Z2ggdGhlIHBhdGNoIGFuZCBJIGhhdmUgYSB0aGVvcnkgb24gdGhl
IHByb2JsZW0uICBJcyB0aGUgDQppc3N1ZSB0aGF0IE1BWF9ISURfREVWSUNFUyB3YXNuJ3QgaW5j
cmVtZW50ZWQ/DQoNCkJlY2F1c2UgcHJldmlvdXNseSB0aGVyZSB3YXMgb25seSAiNiIga2luZGEg
YmVmb3JlIGFuZCBub3cgdGhpcyBpcyBhIDd0aC4NCg0KVGhpcyBpbmNyZW1lbnRhbCBkaWZmIHdv
dWxkIGZpeCBpdCBpZiBzby4NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlk
L2FtZF9zZmhfaGlkLmggDQpiL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfaGlkLmgN
CmluZGV4IDFjOTFiZThkYWVkZGYuLjc0NTJiMDMwMjk1MzggMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L2hpZC9hbWQtc2ZoLWhpZC9hbWRfc2ZoX2hpZC5oDQorKysgYi9kcml2ZXJzL2hpZC9hbWQtc2Zo
LWhpZC9hbWRfc2ZoX2hpZC5oDQpAQCAtMTEsNyArMTEsNyBAQA0KICAjaWZuZGVmIEFNRFNGSF9I
SURfSA0KICAjZGVmaW5lIEFNRFNGSF9ISURfSA0KDQotI2RlZmluZSBNQVhfSElEX0RFVklDRVMg
ICAgICAgICAgICAgICAgNg0KKyNkZWZpbmUgTUFYX0hJRF9ERVZJQ0VTICAgICAgICAgICAgICAg
IDcNCiAgI2RlZmluZSBBTURfU0ZIX0hJRF9WRU5ET1IgICAgIDB4MTAyMg0KICAjZGVmaW5lIEFN
RF9TRkhfSElEX1BST0RVQ1QgICAgMHgwMDAxDQoNCg==

