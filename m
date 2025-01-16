Return-Path: <linux-input+bounces-9269-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD026A1382B
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 11:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47BAB3A5890
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 10:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997371DE3D5;
	Thu, 16 Jan 2025 10:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="euna185e"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021130.outbound.protection.outlook.com [52.101.70.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBF21DE3B1;
	Thu, 16 Jan 2025 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737024084; cv=fail; b=awMZECfQz3pWmhTn/h7m9Eg7R/WHd5J3vXAbu3BduK8kLkXJDvUjbBNaBZJu2q6yb1O3R9c97J5SydQFmtSVWhYBNDlk6ts9F2gAIELd7kJ/qD+dSyDuYCzNoYO+IaPNjVVBKixlnfHh1vUt+q/dKuTWV7lmjuJ0BwRvIaSxcEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737024084; c=relaxed/simple;
	bh=Vm4+7+EIRAejLvSaLD5uSsRZSBR884lqvH/vQVlD9bo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NiusZzvXWBPUzvjjktNloWSWX8XOTLTbh83H4HjYZzPGUTVNG/6FXLV0RppZ6YOYdykCc43LYm+nvf/ZhAkZwybeIUXGk8VYwMilZqD3xW8L74ag/yIv1q5KPuXxhTZE8QVsl1Qhr2gT5Q0+aMX6Lrnr4LmU/Uli5LyUwU18DFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=euna185e; arc=fail smtp.client-ip=52.101.70.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6D1cOxq/ye8BnR1BaJlNi+OQaViAYuvaSxynS/Gz2mAE+DFovaFInA6dJmDXGedmRyl5uanz+CS7o8iSxZFTa3vDVPunH1ts57R/MKJaGQdMuL3/8qn1QO7g7QQPZJsuTnJro7oLa8cVVpvWCok3I4ipZUgimHueR1P2dkUmgcWUNbmQTUygje28ZAg9Y8ev73+q5000V43gz17rdt0fdrWZAz7H1aIoBW6EWPTuYbuixpQrPBlSqA51ybhhtYY39L1c+z0r0MGP/AKt6JETgvEnYCmXvHDcfehTvkHpC2f3/kYktM0qwEazgdRDzVLMy1j7SI8kDOYTfoYRZ+MkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uv4unjEnW2Lwub7eNIfE3pI4BQRB6EXIP7ema+3bSlc=;
 b=Sd/CBF2rIu6MOxA7oONnuDTxaanvprvDrf/bXVVVoqsx6nwFc528/M58Bg5umx6e/US+WxChZzt4v6QePz5T8xA9IEyCxrzAfzwT1Fw+5WwXEhRKXs4vawCRbrdZlNjeZo9h0fmFOYDr61k3fPTPgVLiYwunbhd/LHXz5l6/hfqIh+qqpa7ajsvvoZHYmXxkhLtNCoqKgMTg1PCsIemgjJhZruRE2Ld2ON/YzXBqlyyrO8/pQTgoNevU4ORatIgPMOdLhVLL0j0/SkBbnbERv6gy5VoR3+EpQ973bY5DT3ej+O62O4qz07EW9+ARKMD0yR3dT6DkgF6M00yI5zcv5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uv4unjEnW2Lwub7eNIfE3pI4BQRB6EXIP7ema+3bSlc=;
 b=euna185eP/AdAm8ia9I8C1dpsPOevjvbgEKdP+j7/BVrAugndC5/+TWkZJ4G2Xj45AxSp+RsbieUbChIIKkSHnqewdHrDzfoCz/qXh2STcuV3aWVX/hEcZesb0dkF/sYSmtrhq0gfyQOjn+f7sENx8UlgZm1e2E7Tb3mqXF+YEs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com (2603:10a6:10:3fd::21)
 by AS8PR08MB8160.eurprd08.prod.outlook.com (2603:10a6:20b:561::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 10:41:16 +0000
Received: from DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4]) by DB4PR08MB9190.eurprd08.prod.outlook.com
 ([fe80::c7a:6978:9afa:19a4%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:41:15 +0000
Message-ID: <e2ed48bf-386b-4c14-bc9e-0519da415c73@wolfvision.net>
Date: Thu, 16 Jan 2025 11:41:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 0/4] Input: support overlay objects on touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bastian Hecht <hechtb@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>
References: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco@wolfvision.net>
In-Reply-To: <20241016-feature-ts_virtobj_patch-v11-0-b292a1bbb0a1@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0044.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::33) To DB4PR08MB9190.eurprd08.prod.outlook.com
 (2603:10a6:10:3fd::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB9190:EE_|AS8PR08MB8160:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d4a9bb-77d5-4685-8c19-08dd361a4da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3FDYVN5SmNUc01mZkNlTExwWmhvMVlIaDR0dXh5Q3EzU2l1Q2JnUmhzYTBi?=
 =?utf-8?B?TEhLVVhDZU5yMjNFemVSdjhFTGd3RVFxWWpMQTFDT3U1NElubjlXbWJsRVEv?=
 =?utf-8?B?YU1oTDlRbFVZcmJWZ1BDSTA1ZWpMNUl1MmNqUm5MakViYTFaZVl0RTZhYW40?=
 =?utf-8?B?KzVLZkxVOVlTb3krRHFveTdScVJnaHo3NDFpbHFqeUN2K3VBZWg3SUJaSExR?=
 =?utf-8?B?eHRTQXU1UkhoclpoVkt6MjJoekdCMmVJN1loUVllWHh1bTFzN1hOYVdtWVR3?=
 =?utf-8?B?T1BhSXkzRnNnZmU3dzFyQnhLRVZpSVZZTm5FRGpUemlydG13WTRRSFIzK09n?=
 =?utf-8?B?bDdvSit0SHIvaUl6bjhnb202bXAzMVVyeGlLWHYvU1FZaDBaRTZsTVY3RkEy?=
 =?utf-8?B?dWh0T2JHYnNrKy93bTV3dDl2NUVLT0ZrbFM3b2FXYkdWa1IrSDByNHM0dk5M?=
 =?utf-8?B?M2pDNVZ3V1JHTEtkZ0VnK1NOdzRJaGFYM01RTTdGcGxTdHNUc1kxWTY4T3hs?=
 =?utf-8?B?S09ZZW43WkFZNTNTZ2xvUXo4RStvMGFLWWJ6c2t4YlozSVB6UVozNDhPRDhQ?=
 =?utf-8?B?MDdFSFZtbE9UdXZDNmZDdExKNnVKN0pvU0N1aC8rb3ltYTdNa2JkaGJXUVZC?=
 =?utf-8?B?WEI2QzVVaGViZ3NRLytyQld2cVBFSDJwMmV1bEhSOVNvMUV3VVdlT3ZHbGpS?=
 =?utf-8?B?MmZ0RjV4b0p0YnUwU05mZDl5Yis0ajlEdEcyZ1hhck05MXVGRldrNGNtRWZO?=
 =?utf-8?B?MGJHT2thRk4xV3ZCTGlyeE9rMzNSR2pGZ1hJVndDNmZGeHU4NDgxRXN4ZTd0?=
 =?utf-8?B?bTZuc2JsaFZnU2NpNmVvNjN0Z0FJY2hLaktoNUhrd2RhYlJTRkN6QWV3MG1L?=
 =?utf-8?B?THBvUUQ4eXVaSy9mOFdsc1FtcGF5Ym04SmwraFlVZ2EyWHhHNEZtb3k0Qi9p?=
 =?utf-8?B?TTZCaUZ3SWNrRFBlc2UvcE1ZbVByZCt1VFI0L2hJTEdsSnozaThRclNiRmJC?=
 =?utf-8?B?SWM3SUE1S0pvcEpYU3Q4MU9GcXlUZytGM04xSk1RS2k2VFhZekk5TG96Qms5?=
 =?utf-8?B?S0VXY0haQjljNnJRTUNsV292bUIzT2pwd0QycERYRW1iUEN3MzkzZVl4T2dE?=
 =?utf-8?B?YWlWSUlBRmF4VktzZ20xblk5UVd1S1AwRzNnQ1JZTUJ1cHpBRjZNNTJmNEh6?=
 =?utf-8?B?cW5NaEJvcnQrdWxkYitDdUUxc0ZwQ2tkdUhxWmdVdmE2V2dZUGVKL2NqTHJt?=
 =?utf-8?B?cWplc0xyVzlGd0FXTWNEQkUrcE12OEdvWlhYRG8yY3ZTU1Ywa041OGdDbGpJ?=
 =?utf-8?B?U2N3SUxnSzA1R1JoSXJtOVl0cmorelhUTHUraXNtd09UV0ZqaWpManBMcWp5?=
 =?utf-8?B?Zy9BVmN4NGNpTVMzNjlEK2NXWk95S1lsQ25aeHNod0RsNVVFNklXOUR2dkVx?=
 =?utf-8?B?UWttUFQ2YjFZcHRNYUM2QTBrdkk0RVNyeFI5RVE3Y1ZITFk2dXBFZW44cm5y?=
 =?utf-8?B?bkU2Qy8xbUZZdkoxS1FsU2ZkSzY4VFh1UnVSclh5QW55MXo0M2dVVlJMNWxu?=
 =?utf-8?B?Wk8wQzBCb2FLbE54YUxFTzE3ZUxLcGkrRHM1RlNxU0J2ZnZJZ29OMHUxUmo4?=
 =?utf-8?B?RHhyenZtN2ZteWpkdHVYZnVPbDVjRGcwdjlHQVNGZDZJTnFURXl2b084bEtU?=
 =?utf-8?B?TnRmNmFiY2g3emQwVDBsL2h3b0VjZXEzUVVkT096enVSWnpEUnMvYWFORGdH?=
 =?utf-8?B?YUc3clFvMVJCdUZSaWQrUkR6aFZJTno1QWZRV0UxVCtoVEJRODEydEF1ZG41?=
 =?utf-8?B?WmZyVXhmY0I2S2RETzFzOWJBaEYwYWZubmE4Nk1HVUltOVhBKy9hUUtOQWdM?=
 =?utf-8?Q?bv0kZXQgtp7s2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB9190.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEhVTGxndUNKd1crSE9CcDlSamg5OE44YVd4Yjl4T0E5Z3dqaUJvTEFvdXVN?=
 =?utf-8?B?MENpd3czWHlZenNUTkFSTmtWVmY2VVE0bmhKN1JtemI0M1lxcFdsNkJ3d3ZJ?=
 =?utf-8?B?eVJkU0VqSjdEV1ZnMGJvTTdIcFZtQWdhcytOSWtYWFJUM0VKNktTcUs4M1ZL?=
 =?utf-8?B?U0tEUlpyRXhnVGdYU0cxUk9tQlNaMmhjd2xaL3dFZ2xRTm1OQjE4R2hCY0Rr?=
 =?utf-8?B?djNWcGJRQTRlVWtCYnovNDdDeUMxelhXa3d6TGZTR1VLWEpjeXZkTWtPOFBp?=
 =?utf-8?B?NC9BV0xjTnh1cXFvWXRMMnJyWGdLZ3pGSEgwTzlWYzhITGVsakRLNWYwVG9P?=
 =?utf-8?B?WXd6QzVUNWE4RFp4WW1yQm5QaHlhd05lTjFuQ0dVSWE2aFRwaVdobmRBdFJV?=
 =?utf-8?B?bTNBOEoyc0JnZ1lUcmNBbUhxcWVXS1duNUYrMXZlUTVpRVlHaER2VWJGOElH?=
 =?utf-8?B?NHMvcU1MWEV5OEg3UlNmSHJLVkVnUzczR3NaOVAzcVJTSDBISWwvTHo3b2NR?=
 =?utf-8?B?am1Qb2k0VS9hNTE4bzlxVG16M0szTHFJQUtIelJWYk5wRmI0cEExb0dlS3ND?=
 =?utf-8?B?T2tZNEJKQXN5WlRyUHV6b2hJaG13VXJpZGNHK1g2cVVDblRpWkhCMjJ0U0NR?=
 =?utf-8?B?SXlvUmx4a1I4Q00vTDZ2dzFBS0VsaDd0bUxLb3VlcUxGRTQ3RVducWZzcDFx?=
 =?utf-8?B?TEIycEh2allaempZRWhDMzM5Y3FlZU5PVWRUSDN6a3lnOFl2WFlUTmRQM01K?=
 =?utf-8?B?T3c4aVo3cEs2QStHaTB6SVJtQmQ0YVdYQzdtaGRySVdOMDJOdUdlRGhEcGlz?=
 =?utf-8?B?aHlXRU9DWkJZdEtzTVNWR3NTdmVjZTdrdGpwY0hLN2x5ckc1Nkt6U2d0VGRZ?=
 =?utf-8?B?UEpCR2p4Nm5EWi9VVFZRU29mUEVKMzFTWFZWb0dzOURCcUk2eStXUDc0eGNh?=
 =?utf-8?B?ZFVVeFlzZjhmZ3BmWFRvM2Rvemo2clMrTHp6dW5OT1ZiMUpJeGY0Q0krdGRJ?=
 =?utf-8?B?QlNmVWx0bEFoVmMxelNmV2h5QjM2WDJtcjRCbzQ2TlZ4NGhZYVUvZXRVVmFE?=
 =?utf-8?B?NWRydEljTkR2a0pFRU9ROGs2OHpDRzB3TFNtU3JabUtxV1JOYThzUHdzVkVK?=
 =?utf-8?B?ZHNTVWVrc0RwZmJweFoxbVpXcEdIRWFOQ0VwRDRZSVJrOTNmR3E4SXljMzJ6?=
 =?utf-8?B?elJqWXZHZW40SElQSGYxcmx1Nk9VSGJnVS92cTIyM0VKaUd3SkVPZVhVZVVk?=
 =?utf-8?B?OWtmK1kvelp5T0dyaWJCOWhENVlwOFdkNFVZWnRFdG54a0F2UmNlSk9wR1NS?=
 =?utf-8?B?cHh3TFlqcHlrSHBYeGdKS0UzR2hIdjNVZHJnZlJtb0RkdENKUWFodnA5OXFY?=
 =?utf-8?B?OHFPVG9DY1RNYzRKZmdyVzJWVVRIekJCbWlSL2JyOFIwYlAzV1J5Z1dTalpB?=
 =?utf-8?B?dUJ5aUswa1QrdG52alBiZTlCcnNHM0E5RTV0QU1YZklmR2p6SHJOM3FCSVFB?=
 =?utf-8?B?SzZkdmluVTV0VW1JZnE3Y2h6Q1R5c2xrWlpaanY4SHAraEhHeDFFUHUxNC9y?=
 =?utf-8?B?eStyczlsb2V1dzhlRVdyQ3JJT0w4TTVSOEJVY2NGVnUxVmZ3aUtjc1NCNCtJ?=
 =?utf-8?B?UUZUcWFUMURzQnBCU1F4cEZpL1hDeTl1V1dBbVdPN3hQdDM5TVJENER1Qldj?=
 =?utf-8?B?QWlwMCsvbkh5alhpQ3h4emZraDBJWTFsVEFJK1RnT3oxZ3VtQ0dLZXBhOE1O?=
 =?utf-8?B?bFNQRHRiVk5QYmtlbWdEb0Y0NUdTOU14cTZBOTZPVDcvL1FiTEhpQjhncHMz?=
 =?utf-8?B?VWpGWG5zRWpTUHA3TnNMM1lRSS9jS255T2diQ09ucjN4TGdTQnhPT3FjdFVm?=
 =?utf-8?B?ZWJONHo0b3piY0crcXRTbklXK0ZwaUExS2x5bjE2cENISXVPWm9kRHovdk80?=
 =?utf-8?B?a2Nxa2lIOThGWXl2RitVN0VycW8wN29JTEF5R1RwL3NwTzArVTh2bHhmQjFB?=
 =?utf-8?B?OE1HWUlIRUE1d3BUZXVYdjNUL2ZtdlVDOThvSGw2dGl4WEVlRTJPSS80TCtJ?=
 =?utf-8?B?QnA4ZXdWTWV5MmVTeWM1cTFnZ2IySGJkSG9XSk15SnU5L1NvdTU2U3pMdmds?=
 =?utf-8?B?S3BLRjI5Rml3S2toV2x0dzlEdlVBQjg1OXRvWExTU1RaM3NtbjJrQVBQZm5x?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d4a9bb-77d5-4685-8c19-08dd361a4da8
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB9190.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:41:15.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKikNejxKX6UnT9cTvR+RH8g6lL0jxmEAlEnS3UPKI5tQ8Tz+PSF+L7Rpw5ciMaKaeybbJEXZjVXph2pnjjk86K06QlwTuBmNUmFcc2ZED4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8160

On 16/10/2024 06:02, Javier Carrasco wrote:
> Some touchscreens are shipped with a physical layer on top of them where
> a number of buttons and a resized touchscreen surface might be available.
> 
> In order to generate proper key events by overlay buttons and adjust the
> touch events to a clipped surface, this series offers a documented,
> device-tree-based solution by means of helper functions.
> An implementation for a specific touchscreen driver is also included.
> 
> The functions in touch-overlay provide a simple workflow to acquire
> physical objects from the device tree, map them into a list and generate
> events according to the object descriptions.
> 
> This feature has been tested with a JT240MHQS-E3 display, which consists
> of an st1624 as the base touchscreen and an overlay with two buttons and
> a frame that clips its effective surface mounted on it.
> 
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bastian Hecht <hechtb@gmail.com>
> To: Michael Riesch <michael.riesch@wolfvision.net>
> Cc: linux-input@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> 
> Changes in v11:
> - {touch-overlay,st1232}.c: work on assigned slots instead of positions
>   retrieved by the sensor to account for those that don't track the
>   contacts themselves.
> - touch-overlay.c: do not emit sync and rely on the driver calling it.
> - touch-overlay.c: use cleanup attribute for fwnode_handle *overlay.
> - touch-overlay.c: simplify return paths in touch_overlay_map().
> - touch-overlay.c: drop validity check in touch_overlay_segment_event()
>   (internal function, not API).
> - Link to v10: https://lore.kernel.org/r/20240626-feature-ts_virtobj_patch-v10-0-873ad79bb2c9@wolfvision.net
> 
> Changes in v10:
> - touch-overlay.c: use fwnode_for_each_available_child_node() macro as
>   there is no point in adding unavailable objects.
> - touch-overlay.c: initialize error in touch_overlay_map(), which would
>   be returned uninitialized if there were no touch overlay segments.
> - touch-overlay.c: fix fwnode_handle refcount (overlay must always be
>   decremented before returning, fw_segment in error paths of the loop).
> - Patch 4/4: update description (the feature does not add a second input
>   device anymore).
> - Link to v9: https://lore.kernel.org/r/20240422-feature-ts_virtobj_patch-v9-0-acf118d12a8a@wolfvision.net
> 
> Changes in v9:
> - touch-overlay.c: trigger a button release if the finger slides out of
>   the button segment to be consistent with the button press when sliding
>   into a button segment (see touch_overlay_button_event()).
> - touch-overlay.c: (nit) remove braces in if with a single statement in
>   touch_overaly_process_event().
> - Link to v8: https://lore.kernel.org/r/20240320-feature-ts_virtobj_patch-v8-0-cab6e7dcb1f6@wolfvision.net
> 
> Changes in v8:
> - touchscreen bindings: fix description formatting.
> - Link to v7: https://lore.kernel.org/r/20240119-feature-ts_virtobj_patch-v7-0-eda70985808f@wolfvision.net
> 
> Changes in v7:
> - General: return to a single input device implementation.
> - touchscreen bindings: segment instead of button in the label
>   description.
> - touch-overlay.c: define button-specific data inside segment struct.
> - touch-overlay.c: remove fwnode_property_present() and check return
>   value of fwnode_property_read_u32() in touch_overlay_get_segment().
> - touch-overlay.c: simplify return path in touch_overlay_map().
> - Link to v6: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v6-0-d8a605975153@wolfvision.net
> 
> Changes in v6:
> - General: use a single list to manage a single type of object.
> - General: swap patches to have bindings preceding the code.
> - touch-overlay.c: minor code-sytle fixes.
> - Link to v5: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v5-0-ff6b5c4db693@wolfvision.net
> 
> Changes in v5:
> - touchscreen bindings: move overlay common properties to a $def entry (Rob Herring)
> - st1232 bindings: move overlays to the existing example instead of
>   making a new one (Rob Herring)
> - Link to v4: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v4-0-5c6c0fc1eed6@wolfvision.net
> 
> Changes in v4:
> - General: rename "touchscreen" to "touch" to include other consumers.
> - PATCH 1/4: move touch-overlay feature to input core.
> - PATCH 1/4, 3/4: set key caps and report key events without consumer's
>   intervention.
> - PATCH 2/4: add missing 'required' field with the required properties.
> - Link to v3: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v3-0-b4fb7fc4bab7@wolfvision.net
> 
> Changes in v3:
> - General: rename "virtobj" and "virtual" to "overlay"
> - PATCH 1/4: Make feature bool instead of tristate (selected by
>   supported touchscreens)
> - Link to v2: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v2-0-f68a6bfe7a0f@wolfvision.net
> 
> Changes in v2:
> - PATCH 1/4: remove preprocessor directives (the module is selected by
>   the drivers that support the feature). Typo in the commit message.
> - PATCH 2/4: more detailed documentation. Images and examples were added.
> - PATCH 3/4: select ts-virtobj automatically.
> - Link to v1: https://lore.kernel.org/r/20230510-feature-ts_virtobj_patch-v1-0-5ae5e81bc264@wolfvision.net
> 
> ---
> Javier Carrasco (4):
>       dt-bindings: touchscreen: add touch-overlay property
>       Input: touch-overlay - Add touchscreen overlay handling
>       dt-bindings: input: touchscreen: st1232: add touch-overlay example
>       Input: st1232 - add touch-overlay handling
> 
>  .../input/touchscreen/sitronix,st1232.yaml         |  29 +++
>  .../bindings/input/touchscreen/touchscreen.yaml    | 119 +++++++++
>  MAINTAINERS                                        |   7 +
>  drivers/input/Makefile                             |   2 +-
>  drivers/input/touch-overlay.c                      | 277 +++++++++++++++++++++
>  drivers/input/touchscreen/st1232.c                 |  35 ++-
>  include/linux/input/touch-overlay.h                |  25 ++
>  7 files changed, 485 insertions(+), 9 deletions(-)
> ---
> base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
> change-id: 20230510-feature-ts_virtobj_patch-e267540aae74
> 
> Best regards,


Hi,

as a couple of months have passed since the last submission, I would
like to send a short reminder that this series is still relevant. It is
of course not urgent, an Ack to confirm that is on the queue would be fine.

Some commercial products are using this feature since its last
submission without finding new issues, and it would be ready for a new
review in its current form. I just verified that it applies cleanly to
v6.13-rc7, but if for some reason a resend is desired, I will do it
promptly.

Thanks again and best regards,
Javier Carrasco

