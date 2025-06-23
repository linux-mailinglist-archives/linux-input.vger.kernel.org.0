Return-Path: <linux-input+bounces-13000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02208AE47CB
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 17:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 873CB3AB8E5
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 14:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA36C77111;
	Mon, 23 Jun 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ByRiO+Sa"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB9D143748
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690764; cv=fail; b=Q+2XekYDkF2bYkr0P/6F/ro/iKfvlWinMLDTWBlgDb/gcdV3JgymZ25X6AGqeoo2xVx7rL+32ioQs9n+wN3JYrSGNf9pJjH8rqP3HykUq5hpoJY/HbvQDEtb+4dK6ifof9kHFZf1vwPNCGDd13wRL1Pta5T2hoR3ZuZ22MkfSAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690764; c=relaxed/simple;
	bh=zqjPJ+Nn9Umqyva1WNm6gu3R+cnkFlKrKV0KBk2ASIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SfKiA5fn7OdXkcNFQfydSpyLjw1UrOUM7jssXdeE4+6P8/UM5Lj43FRMHIagaENFrIJv6CE6sBWs3MCLK8W4rUn9raoxnaRve8E0N5YdCPUVrVmXsHaxpPgn+4w347HP45K4gN78GOwebBMkFvMfvirLaQIp+HSMesWIJz1HWe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ByRiO+Sa; arc=fail smtp.client-ip=40.107.212.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdHMV/ajOjWbz+YuA1ltXV1yZEdD5dOWaHbLTd23MbR0ZdsH+j271ZUHmZAb0ysIYbcqsEMNwM4q01wIpSe0bvSFFmdNQQkfIg8ghkPukNsmJgjFF8q2Tgf5c1DqfWdIaZd4Meo+mnXh7MfCJB4Mun/7B1EkXKUjVSqA00onJoILxdQXAbPRhjv3iNDp+EuwboQ5Eq+1SalaLFQsReHDuTEck1VVyO5suQ9nD+UncYPvofcubhHBvq8dY6LCrriwN/yIBg6Kd9PxojxRJ7gRUUXxUGyrrWYSBVVbHY6Cbz0QWmHj4FEjqB5X3ovnFPgEzVKtxkLGAFaUKrPGJSIW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqjPJ+Nn9Umqyva1WNm6gu3R+cnkFlKrKV0KBk2ASIM=;
 b=nOMidKo7ktnzQW90o1poyP3wFWA+mVBxpUvUh4R9qkX8O3j9aaf08uwxFEE05G+o1SSRcHoOQE1FlBtqvF/MnsR0wXMBy5jBvZ/Grey0pIhQjog3uOzclEz9wPKQwREz1t6MyzCy3Oi2Qv1J3uW40OFu1DDRtIX86b1kpA3PjzYg3gx9XQXS8fp2izpH9yNCyUdTHtNLEQWPVH/tYXrEZLalPvILmr1qLSvD9504EstD8LTwh57MqdSVQcmohrKWy5RlZvP6pfdfQ5S72JJ+Q5Q1o2DpJ1JU3YUxQE+gJVB5hAGJwYWpx+cuM2b9vRx4DBix5ehJE04Yb8C5zMG7eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqjPJ+Nn9Umqyva1WNm6gu3R+cnkFlKrKV0KBk2ASIM=;
 b=ByRiO+SaPGegiE4rv4bAbzN8BpATvc+OVgwJQzvoggZa+JyxIcms7NWzlJ07wMCst7dejmPZhUc4Oe8dKE4GkWgoOtVi8BMyFWQotx22W6cpehCxsomzw434ca/TfyD/x5sPdDg66f6Ixcqn745XtRA4uYovngROEiipjXFsGx4=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH8PR12MB9766.namprd12.prod.outlook.com (2603:10b6:610:2b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 23 Jun
 2025 14:59:20 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:59:20 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Eric Naim
	<dnaim@cachyos.org>, "MukundShetty, Akshata" <Akshata.MukundShetty@amd.com>
Subject: Re: [PATCH v2] HID: amd_sfh: Enable operating mode
Thread-Topic: [PATCH v2] HID: amd_sfh: Enable operating mode
Thread-Index: AQHb5ByQAFLAhMOLzkC4yI+rp6nUXLQQ1pIA
Date: Mon, 23 Jun 2025 14:59:20 +0000
Message-ID: <329541ea-d047-4f8f-8e65-286f35603381@amd.com>
References: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH8PR12MB9766:EE_
x-ms-office365-filtering-correlation-id: 03a38bb2-decd-48e3-d336-08ddb266889e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVp3Um1RWW13bmdQR1V4N1lvc29TUWJEN2lKRkhxU2pUOUEzMEljMUR5eXVH?=
 =?utf-8?B?OTNUNGV0blF5STZBZkVKN0NiMjBob2JZRGRGWXFtTjhvZWZvUGxwMExhTGNL?=
 =?utf-8?B?SHU1Tm9zVTV3Z21lM0pXNVpoWEV5cnI5WVZ0Zm1TaHZiVHJHdnFCbmxtUWJ3?=
 =?utf-8?B?U3JDRkwxVDlmMTNyQ09EYnFQR2hEVlBpT0wyT0RhVjloazRraW1IWE9rWXNW?=
 =?utf-8?B?OFQwVGZEWE9sUDVKQlJjbDAycVJ4MlJEZkhUb3ZYR2xSbUM0eVJUVysrRlFv?=
 =?utf-8?B?aW8vK0ltSTRydTZzY0xCcDRlQWpycmQ0WXZYak5vdVhWVFVLUFJDc1BndFha?=
 =?utf-8?B?T2xIU2QrVHlPU1pzUzRMcjFYRGFjdzNrWk1FTVhPNXhidHJpZGlGUXhiT1lx?=
 =?utf-8?B?aVVoVytkdVp1bWRXLzIvSEZqUi9wMnV3STVEQVNWby9MVkhpVWNOd3pyaDJC?=
 =?utf-8?B?NWowYy9VaGJQOTRjdHNoU1QyaVIwRUltVjBzVm1ndFpybjZnNStHSWJRSlRC?=
 =?utf-8?B?bkgxNW5HL2UrdVB0WGgva1NJTDVCWW9sSGFMR3cxOExPeGF2TW1NSTllU045?=
 =?utf-8?B?WWM1Snl3WFhBeExFQnZzem1DMGZIVlltSGVzaWhOVnNVM2dkOE8rYTAxMGdX?=
 =?utf-8?B?Y3VQMGxDRzNhc2poeUFCWldrOGU3Y2Q0YnFuY1ZjUWQxWGl5WmVIYjNsME5O?=
 =?utf-8?B?a01wblBIRmE5c2NyME9MRUcxTHhUaHFmSG1BcW5SVEVZWEUvN24vc2liZFkr?=
 =?utf-8?B?bWQ0cnB5My9SWEo0ZUtEaG8rbnJhUDZRZHdqS1lpaWxsNWw4Qi9QT21CaDEv?=
 =?utf-8?B?NVJ0d0pPdVBFdFRJVDlDdWFHcE5UdG16azFkeFFoYTlKNGtQMkltUXpUeTc0?=
 =?utf-8?B?MVYrU0tHcDlNaGZ1ek5ENEtHbTFVcVVHZnFpN2tHZTVQekdhcVVvM1I3SThI?=
 =?utf-8?B?cWJuYm1hem9KSDJhcUlsdWU4T0xPOGI2VVY2aVBlYU53eXUzQWwyOERHV3lV?=
 =?utf-8?B?ajRlU2d0dDhYaHNueDVwc3U1K21zUGNSQVUxZEtBZS8xOFFiR2s1MjdDUjhI?=
 =?utf-8?B?Y25Zd21LVTA1eGlLMGVYYkFSVjBEOWVtMEJTMVpBRklLVjcydjg2aERlQi9S?=
 =?utf-8?B?aTBhMkl6b0ZjYXVYc0FQVWlrTzF0RnF2UG5nbUl6dFJWTWxKN1NQeXRlL1dB?=
 =?utf-8?B?akR0dDFDTFpaNnRVa010TDBudkZueEM0alVkdDZPNUhHUkdHUENoaWJBR2w4?=
 =?utf-8?B?SXB0K3NncnYwRUFmbWpJaXdpRTJ4QXhjS1o5NDY4SXhTK3BsL05oWk93RDk1?=
 =?utf-8?B?Q2xGTVc5TTI5eThPTEM5OEczR3lVamtZV3hhR0RaVUJ1MUVWRjlwZ2FtSWNl?=
 =?utf-8?B?Mk9Oc1VHOHk4dDlrcHNxeVNESXZlNXQrUzdqQmNGUmt1QzN3akJuM3VOcWNv?=
 =?utf-8?B?c0x1RUs0aWRKRlV0ME1SVHNrbExLaEhuMEdjSnpZeW9FWG5aMTRIa1RqTlBt?=
 =?utf-8?B?bTZzVGhQQk85a0dFWHpXZUdrbS9wWUF6TFhRK044S2lFOXhraVNva0xZZWIv?=
 =?utf-8?B?d1l1T2M0QmZ3TnB0cmhoUTMwdW1EVEFmaWFuVy8xc2s2MUtOdGFNcDBRR0cx?=
 =?utf-8?B?K3lyT1Bhd2NaMUFNR1plb3RHSWMyVHVkRGVvT0ZKYjdodGdaWmVLTTl2MlM0?=
 =?utf-8?B?eGg5dFR6RUwrNTh2WElIcEhxd0IyZVUzc0lFOGZhTmRyWHpDVFBjWVFIR20v?=
 =?utf-8?B?Wk9LTnBhT3JPODFlOEw5bEJyVlVqK3llUGdSc2dxQVRyUTBURk92L2hJbmlU?=
 =?utf-8?B?OEJua21WRG4xL3ZHeVNWZlM4dlA4Y05sOTRrZ0diM1BCTHl2dFhIYVVZUUpw?=
 =?utf-8?B?VXBkU0pMczgvSndHVnZkOUx0OHV0VVlkWEFTVjl3dVd1Ylh6Y3Awd3VvMlRJ?=
 =?utf-8?B?YURFaXl6dVVtYkUwZ2xQTzVZUDhVN1BNUzBCSEhEendlcU80elRrU1VFNTV6?=
 =?utf-8?Q?xN25AUKRRFB4hFCzNLBs7DQLIjPgDs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q2ppNGp0M0cxdk1YZlA4WFdvNmgwbFRyc2FwRG5zQ2FyczJqdFhWek1JbHNH?=
 =?utf-8?B?V0Q0MUtZQllwT1pocGlHdHFaaVZLQmhUSjRzN1IzWDBiblNONXVBZThuQTZy?=
 =?utf-8?B?ZnZERCttamt0QisweXpaV0l5Skh2L2RYUnhxNXVNZVhSYSszdmRuTUZVSzJq?=
 =?utf-8?B?OGpXWjVNWDFTZ1RhMkUwN1pIVmp0OVpaWExZSE01cE8xOWc0L3ozOEYwQ0RP?=
 =?utf-8?B?UDl0b2tucGZBZklIVjVoVkoybVQxVEFvYkQ1OWFNT1pxK0lLS0xhdmVWRTBH?=
 =?utf-8?B?MENJdit6QlpzQ1ArMEJpZUlXdTVSKzM0MFVzVjEwRmhQUWFvbzIzT0poV3RM?=
 =?utf-8?B?TktZMkN5L0x5YVhmZk5jV1lIQ3RIcmxnMTloR253UDROUUNZV05JeHBOc2Jq?=
 =?utf-8?B?eStTYTkrN2V5cHpTS0pKZ04zdDE1SFdvZVFEV2hOVzcrWlg1Z1orTCtQeEtO?=
 =?utf-8?B?Qy9TTjRHemZDTzZSTUJ5RXpDMFBFQWRwV250SFZsQitCbXJGSzFNSTdjUjJw?=
 =?utf-8?B?eGg1bDBHbWs2bExWekl0N21LM2t5aTltaGRrY1ZzaEpFeGtRRU1iZzY3YnhV?=
 =?utf-8?B?UUFGYklpVWJLMXErL1B0eC9CT3lkTmgvV0Q4Y1BURXE0R1ROQ2VXZkZiRDI3?=
 =?utf-8?B?MlprZkpzWXN1eDBKK2JnS0VRV1VVK2kzV1NhYmhKcTNoYm43a2lmZTY2RFYr?=
 =?utf-8?B?aWRkMVl0TDIxYXh5MWRocDhZdnJ2VDFmNEo4WFpoSTBMYTUxZUdrZzBDWTRm?=
 =?utf-8?B?VC9QRXZKc1NtWENRTVY1T0ViMyt4UUZzNk5kUi8vbDBCR1F6V3h3aE9aNzFJ?=
 =?utf-8?B?bURVNThiR213aDZldmI1WVZkTk9nMFIzMFE0R2cwMXBZbC9TSWhNa0tlK0V4?=
 =?utf-8?B?SkV4cVloWG9MNkxzQi9KY2ZaNmFDUWNLck5NSllZUkNXWXdUNHliS1M3MUtV?=
 =?utf-8?B?TjBEaXdDekpZMkcvTmFGbjdFaVAwdUNoRGIyVmpadzQ5MjVxakQ3dXRCcVJY?=
 =?utf-8?B?VFRWYzA4cSs2Yzk5bGhMVlhVZS92Wm1hTnB6d0x6RXpIYStxOENVV3U3TjMy?=
 =?utf-8?B?a1NRYWdrTXJsUk02RC9KNVFwWnhyTTFsQVJGanRKaG1HSG95enVZR0xVVjNS?=
 =?utf-8?B?UEFheDdHSzc4eTI1SC9COEllWFNNMTVpRWNBZXN3b2wwdDN3b1pIWHZScHVB?=
 =?utf-8?B?cDBHeVdib3VLUVZ4K2FDR2gvQ21ybVVIWGxJTndzU01iRms1UlhHNXJ4UW1n?=
 =?utf-8?B?WlNENFk0aDM1RjF1VEZRNGYwT2RBa2hBenE4enJ0Z3pzVDltQWQ4SjFxMER5?=
 =?utf-8?B?VHhIZjF3WUlENTE3ODJkZmN1OE5xM3hFNmJ1ZjVOTlhmYnJuN2NKZTBGVnAx?=
 =?utf-8?B?MmV4UzJIbTNpdmY3VU11aDR2TnBteHhuQUdhZmF2SGFJdEpoTEo0WCt3OGZ0?=
 =?utf-8?B?cm1jUXlqSkp4ZmpTNFd6amdZZ3VuN3NXdFdXeW5jMFRjMWlvdVpTQVFQWEJt?=
 =?utf-8?B?Unk0ZmJMQkR3dGNhTjU2NWI2eUZ0Z3pNUjBhbHdQN1VWK1dWUWNjRjhVY0xV?=
 =?utf-8?B?TFZteHI3OHNaVlRCaXBDZngxUjZMSHJ2ZjVMV1NzN0pKTE9VVnYyMk1aVFdB?=
 =?utf-8?B?YkUwMGdxWk12RXRwTVJHRjl4RWY5MXBRcGxIY3FCRndrOENXdVpqVXRIRnhq?=
 =?utf-8?B?c1FIRVBBeWxQMUlMZFVFb21SbTY2Z21IbXh2UXhRTWZoR1RzbjFvOEF2a1RS?=
 =?utf-8?B?d1ZEaCttelcybkFrb2xJY0l3RHB5a1NFKy9yVXB4VEl0TEZSbFNIRFhpcEZy?=
 =?utf-8?B?YUJmd1o4bkM0UEJxRW9LTG5HR3kyMVpJTkxpcU50Z0s0VlRiVW10K1hCZHBF?=
 =?utf-8?B?SFFUTkVaWG9ETnBBUUVqZkRSY2cxaWdKM1g0cGMrbG52Vm5JY0JiMUk5OXd6?=
 =?utf-8?B?L1g1NDdLVE4wMXA4L1NPY1MxMVNTbzBhMDVxdzlKc1FZdXN0RUpPaXljRDBx?=
 =?utf-8?B?a2xQbXQ5bjVYanlQY083YUozdmc1Q1FCRVh5eEdyUUpOUnlUNHlJWVhiNUFO?=
 =?utf-8?B?WHE0RkxGODUwYmVETVdaMmg1M1FBa3gvZ2d6UFI4cU9PdDJ0R1ZycER4ekdX?=
 =?utf-8?Q?GKeY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D2E73B735110E143BAB9F078E152E8C0@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a38bb2-decd-48e3-d336-08ddb266889e
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 14:59:20.4693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vHTRPNfo1ttF+jVsrDrmB5Zve5wrqeNSd8DD+CMMp7COwOwwsjQ54aCzBmvYGeQbw0ro3umMVAHOMsFok8NX2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9766

T24gNi8yMy8yNSAzOjU0IEFNLCBOYXRpa2FyLCBCYXNhdmFyYWogd3JvdGU6DQo+IEFkZCBjaGFu
Z2VzIHRvIGVuYWJsZSBvcGVyYXRpbmcgbW9kZXMgaW4gdGhlIGRyaXZlciB0byBhbGxvdyB0aGUg
RlcgdG8NCj4gYWN0aXZhdGUgYW5kIHJldHJpZXZlIGRhdGEgZnJvbSByZWxldmFudCBzZW5zb3Jz
LiBUaGlzIGVuYWJsZXMgdGhlIEZXIHRvDQo+IHRha2UgbmVjZXNzYXJ5IGFjdGlvbnMgYmFzZWQg
b24gdGhlIG9wZXJhdGluZyBtb2Rlcy4NCj4gDQo+IFRlc3RlZC1ieTogRXJpYyBOYWltIDxkbmFp
bUBjYWNoeW9zLm9yZz4NCj4gQ28tZGV2ZWxvcGVkLWJ5OiBBa3NoYXRhIE11a3VuZFNoZXR0eSA8
YWtzaGF0YS5tdWt1bmRzaGV0dHlAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWtzaGF0YSBN
dWt1bmRTaGV0dHkgPGFrc2hhdGEubXVrdW5kc2hldHR5QGFtZC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEJhc2F2YXJhaiBOYXRpa2FyIDxCYXNhdmFyYWouTmF0aWthckBhbWQuY29tPg0KUmV2aWV3
ZWQtYnk6IE1hcmlvIExpbW9uY2llbGxvIDxtYXJpby5saW1vbmNpZWxsb0BhbWQuY29tPg0KDQo+
IC0tLQ0KPiB2MjoNCj4gKiBJbmNyZWFzZWQgbWlzc2luZyBkZXZpY2UgY291bnQuDQo+IC0tLQ0K
PiAgIGRyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfY2xpZW50LmMgfCAyMyArKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfaGlk
LmggICAgfCAgMiArLQ0KPiAgIGRyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfcGNpZS5j
ICAgfCAgNCArKysrDQo+ICAgZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9wY2llLmgg
ICB8ICAxICsNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9hbWQtc2ZoLWhpZC9hbWRfc2Zo
X2NsaWVudC5jIGIvZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9jbGllbnQuYw0KPiBp
bmRleCAzNDM4ZDM5MjkyMGYuLjBmMmNiYWUzOWIyYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9o
aWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9jbGllbnQuYw0KPiArKysgYi9kcml2ZXJzL2hpZC9hbWQt
c2ZoLWhpZC9hbWRfc2ZoX2NsaWVudC5jDQo+IEBAIC0xNDYsNiArMTQ2LDggQEAgc3RhdGljIGNv
bnN0IGNoYXIgKmdldF9zZW5zb3JfbmFtZShpbnQgaWR4KQ0KPiAgIAkJcmV0dXJuICJneXJvc2Nv
cGUiOw0KPiAgIAljYXNlIG1hZ19pZHg6DQo+ICAgCQlyZXR1cm4gIm1hZ25ldG9tZXRlciI7DQo+
ICsJY2FzZSBvcF9pZHg6DQo+ICsJCXJldHVybiAib3BlcmF0aW5nLW1vZGUiOw0KPiAgIAljYXNl
IGFsc19pZHg6DQo+ICAgCWNhc2UgQUNTX0lEWDogLyogYW1iaWVudCBjb2xvciBzZW5zb3IgKi8N
Cj4gICAJCXJldHVybiAiQUxTIjsNCj4gQEAgLTI0Myw2ICsyNDUsMjAgQEAgaW50IGFtZF9zZmhf
aGlkX2NsaWVudF9pbml0KHN0cnVjdCBhbWRfbXAyX2RldiAqcHJpdmRhdGEpDQo+ICAgCQkJcmMg
PSAtRU5PTUVNOw0KPiAgIAkJCWdvdG8gY2xlYW51cDsNCj4gICAJCX0NCj4gKw0KPiArCQlpZiAo
Y2xfZGF0YS0+c2Vuc29yX2lkeFtpXSA9PSBvcF9pZHgpIHsNCj4gKwkJCWluZm8ucGVyaW9kID0g
QU1EX1NGSF9JRExFX0xPT1A7DQo+ICsJCQlpbmZvLnNlbnNvcl9pZHggPSBjbF9kYXRhLT5zZW5z
b3JfaWR4W2ldOw0KPiArCQkJaW5mby5kbWFfYWRkcmVzcyA9IGNsX2RhdGEtPnNlbnNvcl9kbWFf
YWRkcltpXTsNCj4gKwkJCW1wMl9vcHMtPnN0YXJ0KHByaXZkYXRhLCBpbmZvKTsNCj4gKwkJCWNs
X2RhdGEtPnNlbnNvcl9zdHNbaV0gPSBhbWRfc2ZoX3dhaXRfZm9yX3Jlc3BvbnNlKHByaXZkYXRh
LA0KPiArCQkJCQkJCQkJICAgY2xfZGF0YS0+c2Vuc29yX2lkeFtpXSwNCj4gKwkJCQkJCQkJCSAg
IFNFTlNPUl9FTkFCTEVEKTsNCj4gKwkJCWlmIChjbF9kYXRhLT5zZW5zb3Jfc3RzW2ldID09IFNF
TlNPUl9FTkFCTEVEKQ0KPiArCQkJCWNsX2RhdGEtPmlzX2FueV9zZW5zb3JfZW5hYmxlZCA9IHRy
dWU7DQo+ICsJCQljb250aW51ZTsNCj4gKwkJfQ0KPiArDQo+ICAgCQljbF9kYXRhLT5zZW5zb3Jf
c3RzW2ldID0gU0VOU09SX0RJU0FCTEVEOw0KPiAgIAkJY2xfZGF0YS0+c2Vuc29yX3JlcXVlc3Rl
ZF9jbnRbaV0gPSAwOw0KPiAgIAkJY2xfZGF0YS0+Y3VyX2hpZF9kZXYgPSBpOw0KPiBAQCAtMzAz
LDYgKzMxOSwxMyBAQCBpbnQgYW1kX3NmaF9oaWRfY2xpZW50X2luaXQoc3RydWN0IGFtZF9tcDJf
ZGV2ICpwcml2ZGF0YSkNCj4gICANCj4gICAJZm9yIChpID0gMDsgaSA8IGNsX2RhdGEtPm51bV9o
aWRfZGV2aWNlczsgaSsrKSB7DQo+ICAgCQljbF9kYXRhLT5jdXJfaGlkX2RldiA9IGk7DQo+ICsJ
CWlmIChjbF9kYXRhLT5zZW5zb3JfaWR4W2ldID09IG9wX2lkeCkgew0KPiArCQkJZGV2X2RiZyhk
ZXYsICJzaWQgMHgleCAoJXMpIHN0YXR1cyAweCV4XG4iLA0KPiArCQkJCWNsX2RhdGEtPnNlbnNv
cl9pZHhbaV0sIGdldF9zZW5zb3JfbmFtZShjbF9kYXRhLT5zZW5zb3JfaWR4W2ldKSwNCj4gKwkJ
CQljbF9kYXRhLT5zZW5zb3Jfc3RzW2ldKTsNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+ICsN
Cj4gICAJCWlmIChjbF9kYXRhLT5zZW5zb3Jfc3RzW2ldID09IFNFTlNPUl9FTkFCTEVEKSB7DQo+
ICAgCQkJcmMgPSBhbWR0cF9oaWRfcHJvYmUoaSwgY2xfZGF0YSk7DQo+ICAgCQkJaWYgKHJjKQ0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9oaWQuaCBiL2Ry
aXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfaGlkLmgNCj4gaW5kZXggMWM5MWJlOGRhZWRk
Li43NDUyYjAzMDI5NTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2Ft
ZF9zZmhfaGlkLmgNCj4gKysrIGIvZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9oaWQu
aA0KPiBAQCAtMTEsNyArMTEsNyBAQA0KPiAgICNpZm5kZWYgQU1EU0ZIX0hJRF9IDQo+ICAgI2Rl
ZmluZSBBTURTRkhfSElEX0gNCj4gICANCj4gLSNkZWZpbmUgTUFYX0hJRF9ERVZJQ0VTCQk2DQo+
ICsjZGVmaW5lIE1BWF9ISURfREVWSUNFUwkJNw0KPiAgICNkZWZpbmUgQU1EX1NGSF9ISURfVkVO
RE9SCTB4MTAyMg0KPiAgICNkZWZpbmUgQU1EX1NGSF9ISURfUFJPRFVDVAkweDAwMDENCj4gICAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfcGNpZS5jIGIv
ZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9wY2llLmMNCj4gaW5kZXggMWMxZmQ2MzMz
MGM5Li4yOTgzYWY5Njk1NzkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlk
L2FtZF9zZmhfcGNpZS5jDQo+ICsrKyBiL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhf
cGNpZS5jDQo+IEBAIC0yOSw2ICsyOSw3IEBADQo+ICAgI2RlZmluZSBBQ0VMX0VOCQlCSVQoMCkN
Cj4gICAjZGVmaW5lIEdZUk9fRU4JCUJJVCgxKQ0KPiAgICNkZWZpbmUgTUFHTk9fRU4JQklUKDIp
DQo+ICsjZGVmaW5lIE9QX0VOCQlCSVQoMTUpDQo+ICAgI2RlZmluZSBIUERfRU4JCUJJVCgxNikN
Cj4gICAjZGVmaW5lIEFMU19FTgkJQklUKDE5KQ0KPiAgICNkZWZpbmUgQUNTX0VOCQlCSVQoMjIp
DQo+IEBAIC0yMzIsNiArMjMzLDkgQEAgaW50IGFtZF9tcDJfZ2V0X3NlbnNvcl9udW0oc3RydWN0
IGFtZF9tcDJfZGV2ICpwcml2ZGF0YSwgdTggKnNlbnNvcl9pZCkNCj4gICAJaWYgKE1BR05PX0VO
ICYgYWN0aXZlc3RhdHVzKQ0KPiAgIAkJc2Vuc29yX2lkW251bV9vZl9zZW5zb3JzKytdID0gbWFn
X2lkeDsNCj4gICANCj4gKwlpZiAoT1BfRU4gJiBhY3RpdmVzdGF0dXMpDQo+ICsJCXNlbnNvcl9p
ZFtudW1fb2Zfc2Vuc29ycysrXSA9IG9wX2lkeDsNCj4gKw0KPiAgIAlpZiAoQUxTX0VOICYgYWN0
aXZlc3RhdHVzKQ0KPiAgIAkJc2Vuc29yX2lkW251bV9vZl9zZW5zb3JzKytdID0gYWxzX2lkeDsN
Cj4gICANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2FtZF9zZmhfcGNp
ZS5oIGIvZHJpdmVycy9oaWQvYW1kLXNmaC1oaWQvYW1kX3NmaF9wY2llLmgNCj4gaW5kZXggMDVl
NDAwYTRhODNlLi4yZWI2MWY0ZTg0MzQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2FtZC1z
ZmgtaGlkL2FtZF9zZmhfcGNpZS5oDQo+ICsrKyBiL2RyaXZlcnMvaGlkL2FtZC1zZmgtaGlkL2Ft
ZF9zZmhfcGNpZS5oDQo+IEBAIC03OSw2ICs3OSw3IEBAIGVudW0gc2Vuc29yX2lkeCB7DQo+ICAg
CWFjY2VsX2lkeCA9IDAsDQo+ICAgCWd5cm9faWR4ID0gMSwNCj4gICAJbWFnX2lkeCA9IDIsDQo+
ICsJb3BfaWR4ID0gMTUsDQo+ICAgCWFsc19pZHggPSAxOQ0KPiAgIH07DQo+ICAgDQoNCg==

