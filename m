Return-Path: <linux-input+bounces-9781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7EFA2804C
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 01:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E723A71A3
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CAB2288FB;
	Wed,  5 Feb 2025 00:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nNqVRm8M"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577E82288E0;
	Wed,  5 Feb 2025 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716375; cv=fail; b=I794mPEKdV/IGk70i+t1KK7O3EGkWr1ZVU1mkPdY5RNslkSc9kF8I382KVKZGcMru98QI9Kbl+5ckLVI1FnljVUw71EVJ/jnf3FdlyjsKc2aPfBcBJdgBH4s3fN+HAMKunNMXElY+vS9wwvhwPHAxIho5kY7cNzCpD6SAqvn5V8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716375; c=relaxed/simple;
	bh=yGvaO4CE8KR0YjpwnelDEdIH1YkR2FTo1uOdpptvhd8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mKGco8nVoBaoNvwPXqP2yCpU85sDhS6EwpmdVhAXucFenYFEolkxyACcYhfCaRkR2E/cQII+v8NpKtNPfxnZ2HOvO52wurHkg7DqDsuJCVVBBV74eo8aSnEIPRkXA6eBubkt3FMCN2dbp9pdTF/z9MSkxVqRJiHc/lv4y5jpSes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nNqVRm8M; arc=fail smtp.client-ip=40.107.249.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8IS78PrAn1chKKm/8pa8WXCgJeJSynvFnpDRrOJUTaSh0MW8SmYvtKSe2hZ8lIdlcv4v/QmtzHaPUUgQ7mfe3e2BQ+RpYtKRxrbae0Tm30b7Zk9q1XmdH3U77nQ7agmw+IM0GsqolPvUuJouKNZQm6gaxhF11S/PUsGVAu0dyQSziHXBqouSPpo90UhrPBe0GDWpZiihzZf5YthdptfwVuupMyQ05fZNGpEEZ48JVcrTad/tO4Rvm7sTFhGxfdviLc154esIMV8Q0NksUDr5T+8oo+9Fl6hL0ILyNCovUDymo+Y0LSoihNGpW9m+OZFJZSf2n3xpAWug8OLBD+Kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhC1ngrU87eDqzUYVlj3esO6y93gVDOOhc8DDXGyy0w=;
 b=H99EvhV+zhswqkMBOAlx3mEFapU/CIAC9RScVt4wQ7mqIwi4P37o3E8lKsYKobjiD7rZUAQzisMwqwj3MMB44eIB+z6jBexG4GhxcN826U36J8J/nnv4TTxjKHuIUV7EHeysar6i4RCJxr4RmVDBIV78a+BnWchSHFrKNig4QjCEb8p2gCtE6NqFxULrdyB4Ur4e4IMHtq8rDtUUiQUgAC9kBxOY6jFOIOpRxc6iMgqPsnHH7QtskNKNdj+BeouPtc/m9+nXI0KS15xFIU6tFbG8UwvjAwE95Ue2K+UVPgmbAIpmGVjWH9r5LTUsrqDpnQ/dxWM6SGmGNw/js1m88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhC1ngrU87eDqzUYVlj3esO6y93gVDOOhc8DDXGyy0w=;
 b=nNqVRm8MiFmcLLehNIEGjmyEVThQKuPAN1vhKjPhVbfbZ67NRLQALqfCVrLYcaccdwIMhLVS8N5b+mdChiG/JDNnMvlRsUYrPg4ir00pItlwaMjEBe0/0s7GDa1zLXZClEzRRT0JtVWb+NH2JZXxWqvPgvIK29VB+3n5Xa/vcNXcqOSlsJqeDJ/oBPrpalTSjU5hERAsBZzgmtSkx5j7sVIpIpcFxvX95Th6xgoCoSs70YzlUbHDfVhgqxjRHTeS1wqdZBKrubDwXpL1NW4/LKioqE8WqTIIlYn9/69D0ZhVSsLbVReMGrU7Yt2kUi2oN9KgZn7qHz2Usd4hdXa28A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:46:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:46:05 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:45:17 +0800
Subject: [PATCH 4/4] input: touchscreen: ti_am335x_tsc: Use resource
 managed API to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-input-cleanup-v1-4-9758898ff8cb@nxp.com>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738716321; l=3411;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1lZmp/EoQtZDgK9cRNpEHi0IbcGjqZ+/tYP3nl5MGB4=;
 b=DgvMfxudnP8VmAR/dqhrCBmy8vN9qi34oTNOmcn54WRJFI9MBo2hO2FeA2MYMam2VkZenkwyT
 ZVqSCnZ4D0IA1QHZoEyl0kTFw12bjlwPBCWwiGjxZy8uNXD9E0mrguM
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: d267fe25-30a6-4da5-8362-08dd457e78f7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFE5WlVjRWtxbHNBV2Z3RkxkU3duc1lyUWtNSVBRSDlBTkxGSlVNK00zYndj?=
 =?utf-8?B?SWlkanRYOSt4aTNLbUp2YzI5UUJmRGh3S2FEVFZEdnEvYlhQcGNTYmRnN29v?=
 =?utf-8?B?bzZ6S1U4TGRWc2JaQmcySVRrSzloU3J6Ym82UVI4ZU5rNVVHRHFWWno3TUpm?=
 =?utf-8?B?MHR6Q3lNYk5YNlMrVU9jRXBEKy9kQXAzaWk4bVVJdWZyUnZtbUtNQ1ZzOGwz?=
 =?utf-8?B?bFFFcVRrUmUwOUJuVk1qZXMxc1Q1d3FYRGU3aGZZUXFyRy9PaGtHMEpPaEpq?=
 =?utf-8?B?Ukc1ZjlkaUMzK1VhV21GWEFTa1VQaDNFcjM2K29hTm1OL0RYUFZnUWhnd0VN?=
 =?utf-8?B?NXhxMGZGSnh3NDJPcC9DQmZoRHhORXhjRHdPandGZzlzb3BOczk3cXpiWnV0?=
 =?utf-8?B?VnVQQXRoc1V3b29uRzUzL1BtcTl4SUtQQ1I5MzJQZVBiM0U1bWNzV1pDNGtC?=
 =?utf-8?B?VGd1UnpBcStQd05jR2VHYmVuMDAyVUJadk1XYmZIQ2xPZXZ0UkZBaFU3a2V4?=
 =?utf-8?B?K3dUSG5mdVhGTUY4dTIwUmlmR1IwNW1oWVVPZEJxaSszOXZmYWY5anJaZFcw?=
 =?utf-8?B?dDdSN2kvVG40MklvdXlhNFlxaFBYSVVWYmVHSzVBcmFkY0U1TTV6TDBxbFhR?=
 =?utf-8?B?dlppanUrd3dabHlhdGhIaE9mS0pUWFZ6cjZmSDEwSW40WFVJQ2J6M3U0VEto?=
 =?utf-8?B?Y2VTZ2EvdER3SXppalZSUDFKaDdld0tuMEJOZzFpcSszbUh6NUFncy9qZ0Ix?=
 =?utf-8?B?NXMvRm9hWkZKUXZ4dEZvK1YrY2tjaEsvNW5tZTMxUDlVd2kyZ1MyaXJ1TkdT?=
 =?utf-8?B?di9ENHNGemNGV09URjBNUm11R0h1T1NPNUZkNnlrbWdnN0ZGL0Rjc3FiNmZW?=
 =?utf-8?B?T1lXK2YvZDZYN0RFdG80SVhIbTJ1eXgxaktTcGVhMjYyRkt6ang1eWw1L3NI?=
 =?utf-8?B?R0VUYm5Uc1J4VEd0MXUrZllKVkVwUEZBZGlvNUVGLzg1dzlxTklHZHhCNjIx?=
 =?utf-8?B?NnhWbU9kbTZrNXFNV0l5ZS9NNGNUa1pvRmF2ZDZBdkpIdWt5WHVKekh6UjUz?=
 =?utf-8?B?b0d6Q0c0VnlXTjhIT2pGZlRjdTg2S3I3N0ZpVkk5N25QNFNpKzlKb3g1V3NB?=
 =?utf-8?B?VEJ5aUEyM1hlR1p6TVNPbnk2YmhUMGZMTTZad1QyYURJelNmSGVFK1ZYQW5J?=
 =?utf-8?B?Z2xwS2pXaXQ1YUNncURiaHpqUW56VHhWSHBzbUQwdjEreDNzOVdtclI2b2hu?=
 =?utf-8?B?VGpvQkpQTXlwZ0Z2Z1AzZ0hzakhvTWU1WEh4andidlJ1UDY0ZkU3R0Mxelp3?=
 =?utf-8?B?RURCeGhyZUhxYzR3L2t6U0tLUlpSY09UVm04MXN4bk53V2MvMGx0enJPbHVS?=
 =?utf-8?B?UndvMkozNVBra241TkxxSkZCQUJiZkdZNmw3K1V1WmQ1VjJ4YVdNa0JzYkM0?=
 =?utf-8?B?d1ZYaFRIUjkzTkovR01yWlpiZEdncXZ2SmMwcnQxUzhUTnIrZzFmQUVuTWpq?=
 =?utf-8?B?ZDlzZERYTzRXWEtsUkttSlZmS3Bkemcyb3NxZ1U5NGJUVkFOMEQwcDN1SWhT?=
 =?utf-8?B?MWNacE1IY2NnSkZZQU5RYkVITy9EZ1cvNjBXamtiTjhLeGw1dE1yejFpMVJo?=
 =?utf-8?B?a05ma2xybG9teTNtQkNKK29KVEZsQ3kwZ1lER1hLeDBGTjZldWJRcVJuZ0hT?=
 =?utf-8?B?UTZOaVFBMzZvaWVUdGkxWVUxUXFHNFh1SThLUGxQaFhGM2x4TWZybDZHTHQ4?=
 =?utf-8?B?U1hkYkZFclZpMVYyblVWb2tFdGw2a2xQbzRwMG4xazlPdU0zM09Zcndhc2hF?=
 =?utf-8?B?ZUd3SWNyYjZvTG9YYkc2VlQzTGlQTnN1SUpWd1lyZHFuZkRUaDUwVW5FZXJI?=
 =?utf-8?B?N1Z2RENRQ1dEUFBOQVhEb1Zpc092MjFtbUtocUx4bHgwN0lVbmpuUkRwRlFY?=
 =?utf-8?Q?Oe2k3YJhfeI2eU7lDgYtqrTbL6k4W9vV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUV5MEMrL2ZqZmYvejdhalk5Tyttei9Vdkw4TXBDRmU1UHE1Rk16M0F6RWM5?=
 =?utf-8?B?UWFpazFwOGt3YW5FRUFJcW9VdnBBUExsMW1GeWtwTXROWlQrRWUrSWRXT29y?=
 =?utf-8?B?Q1dUaU5EZDRSbENueG15MCtETlk0SlhyVnhaaVhqbHhrZnU0Q2ZmaVdIL1NX?=
 =?utf-8?B?RGdTMmFhQmdvMDRqejZxd1J2TmtyNmxDZXNhRDdzVzZQR0pwejAyaEN4Q3Mz?=
 =?utf-8?B?d2hlbjM3M09pN2djU0NRM09hRmMreGl5S0Job0x0Z2N3Y1Fwc3FjWW45bGdX?=
 =?utf-8?B?bzJQT0dleGpsdnhHM0Y1cUg2S3FIOHpaSnZ5TlBEbk5MYm1CVysyNWNwNnhs?=
 =?utf-8?B?QkpsMTF3TElPNWtTYmlaUng4bkZZWWM3M3JycEUxUloyVkVHSENvdDVBSVFt?=
 =?utf-8?B?N3FvSVdkeG5ZN1o4Ym1jRGZaMHB1OHE2RU5OSTNyNFEvcVdwR3dXVDdhcnpH?=
 =?utf-8?B?OVRLemgvY3E3YmthS3VtRjhFOThhQTBCZURib3JsbFZpOWZjcHJ5eEhIbU9F?=
 =?utf-8?B?V1hidWMvN0llMWwrOHMxdTduLzVqYzB0enhERVBZRDlqOTk4dnFoaHJCK05q?=
 =?utf-8?B?azVWd1FVZ1dzSlgvU3dXak1aYUtwV3BaUk9FZndwcFRwc3ZaZkhyWC9qbmhm?=
 =?utf-8?B?clV5elVkaHRCV0NjOHUvb2ZSUE9MQ212VC9HUFZybExzVFdRdkE5OTlyTVJi?=
 =?utf-8?B?aWoyS3JKdk95WFdJZWtTWEwzSkt0dWdadFJHVjdZREdsWVhPM0dOUDY3UWUr?=
 =?utf-8?B?SEVyd2NobWxQanRTdit2ZTB6SVZ3ZEM5K3Uxa25kMHpuV2ZPS1hGS1JmZFJ6?=
 =?utf-8?B?T2U3VTdVa3FINGxEQXhYM3ZUTUQ3VHRNK0lCMVlhL1hmSnkzV2R6RDJxYTBX?=
 =?utf-8?B?Q2FXVjBoMWxidFhIbDNScklNY0h3dTF2STIwUHh6eXdzdTNwVC8rd0o1WmpI?=
 =?utf-8?B?MCtOMTJVVE8zdnRPTGFuZ3kzaEZzWS8rdHZoSHZLcUV0QkFvdUpQQUdCUTky?=
 =?utf-8?B?T0FSejB1SzBjVEtMbHNGZ0dlTzdkbWVZNlUrYWtBeXhsY1A2M0pMY3JxMDhk?=
 =?utf-8?B?Um15UXF0eFlPQ3A5TFVvVXJma1k2TUJXVmtSS2F1a1BLMWJBT1FURVdHNmVD?=
 =?utf-8?B?RmZZY1NNNUk5b2tSRVc2eWpUdXZGek9pSmVwdzJMNEU0YlI4SlZacjYvTDk3?=
 =?utf-8?B?SU54WW5uV2ovdmNIZjRZN3Jta3pKS3BlNDh5WXEvQ05sUXRWeVRJZ1M2KzVI?=
 =?utf-8?B?bEZUTk1yeHlMNGNka3dOSkEvK3JVaUlONHlYVmhpdVhrdVRCMmFseVI3TUNZ?=
 =?utf-8?B?Z3JNT09SMjdsTHhmb252alk1NXFadlA2QmZYaDBldDBmQVcybzZQTmdNcEhS?=
 =?utf-8?B?QXkzQzVsVEhIVTMvRmI4S3FmZytuYWQzOXVyajlzU0dXNWlXbVlQVTQ4T0dL?=
 =?utf-8?B?UUpoTXFyOEhQdWVoMHZINlgzZ1QrTUw5U250cmZKL3RIU0pRYy83SG03TS9K?=
 =?utf-8?B?elZSWmhhNDJYNllXRW03dUM3SGJLRXJNcEpUa2xVZ29ZS3NzcVQ1RUVzNlh1?=
 =?utf-8?B?Sy9hN1JFZFdQUHdkZHJpbmtEa1d3MW5ieTJVb3hxaXVoSUxsQ1FoS0M4NXlJ?=
 =?utf-8?B?Zk1YVWJ5dldvVWQ2VHl2Z2VEbVFRNzFuVFZlVi9kNTBzdEVMNUFLT2d4WjZ0?=
 =?utf-8?B?QjVxNnBMRlFtR2x3U0dGRTE1RURhSUpWc1pqdWFwV0o3MWg2UFBXNzhhMDh2?=
 =?utf-8?B?NXAxT2puNHdPSkErcmVjeExnek9MSW5FR3ZvSnZudHdzSyszbDFEYWRJcURE?=
 =?utf-8?B?Q0dIZEZTeFFjSmtpbE1zWVZvb3NKcTZ0akFtQXlBdzRXOFg3ZDdGMTJ4Rmxv?=
 =?utf-8?B?Njc3aGdScXBRTEpxaUJnMDNiKzdtZ210enpicXF4aTUzWCtqRVVIbzdVYlNp?=
 =?utf-8?B?MGlZRmcrYmVaNEo2UTVlUnF3bXA2K0xqQlh1Sk9rRFU1Wk9hK2c4WWRQbzZP?=
 =?utf-8?B?bUt4VnhIT2UvMktlall4QjAxalBBd055YWlyanV5WEZhRGlHYXdNaEtIR2FK?=
 =?utf-8?B?a0gwQUloRURlejgwM01pYXk4OW0xQzJETjd0Ym1TKzYzODhoYWt0Z2M0R2ha?=
 =?utf-8?Q?imFqi547GLqGchUBDC1EqfYfj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d267fe25-30a6-4da5-8362-08dd457e78f7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:46:05.5394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSV1+6dVHybSwQjniLqegs1LKiSrgk61RRfNdaUhyIFTRFxv4a3O1autGDDp9pN0Cw19TwjbWwws+0yGuGi+8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

From: Peng Fan <peng.fan@nxp.com>

Use devm_input_allocate_device/devm_kzalloc/devm_request_irq to simplify
code

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
 1 file changed, 14 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 93d659ff90aa94ecbd7000fe05e0eef8ab3546ba..aef38b2e4e464e3b76395de5991a0f41b4f852f4 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -418,12 +418,11 @@ static int titsc_probe(struct platform_device *pdev)
 	int err;
 
 	/* Allocate memory for device */
-	ts_dev = kzalloc(sizeof(*ts_dev), GFP_KERNEL);
-	input_dev = input_allocate_device();
+	ts_dev = devm_kzalloc(&pdev->dev, sizeof(*ts_dev), GFP_KERNEL);
+	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!ts_dev || !input_dev) {
 		dev_err(&pdev->dev, "failed to allocate memory.\n");
-		err = -ENOMEM;
-		goto err_free_mem;
+		return -ENOMEM;
 	}
 
 	tscadc_dev->tsc = ts_dev;
@@ -435,18 +434,21 @@ static int titsc_probe(struct platform_device *pdev)
 	err = titsc_parse_dt(pdev, ts_dev);
 	if (err) {
 		dev_err(&pdev->dev, "Could not find valid DT data.\n");
-		goto err_free_mem;
+		return err;
 	}
 
-	err = request_irq(ts_dev->irq, titsc_irq,
-			  IRQF_SHARED, pdev->dev.driver->name, ts_dev);
+	err = devm_request_irq(&pdev->dev, ts_dev->irq, titsc_irq, IRQF_SHARED,
+			       pdev->dev.driver->name, ts_dev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to allocate irq.\n");
-		goto err_free_mem;
+		return err;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	err = dev_pm_set_wake_irq(&pdev->dev, ts_dev->irq);
+	err = devm_device_init_wakeup(&pdev->dev);
+	if (err)
+		dev_err(&pdev->dev, "device init wakeup failed.\n");
+
+	err = devm_pm_set_wake_irq(&pdev->dev, ts_dev->irq);
 	if (err)
 		dev_err(&pdev->dev, "irq wake enable failed.\n");
 
@@ -456,7 +458,7 @@ static int titsc_probe(struct platform_device *pdev)
 	err = titsc_config_wires(ts_dev);
 	if (err) {
 		dev_err(&pdev->dev, "wrong i/p wire configuration\n");
-		goto err_free_irq;
+		return err;
 	}
 	titsc_step_config(ts_dev);
 	titsc_writel(ts_dev, REG_FIFO0THR,
@@ -475,19 +477,10 @@ static int titsc_probe(struct platform_device *pdev)
 	/* register to the input system */
 	err = input_register_device(input_dev);
 	if (err)
-		goto err_free_irq;
+		return err;
 
 	platform_set_drvdata(pdev, ts_dev);
 	return 0;
-
-err_free_irq:
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-	free_irq(ts_dev->irq, ts_dev);
-err_free_mem:
-	input_free_device(input_dev);
-	kfree(ts_dev);
-	return err;
 }
 
 static void titsc_remove(struct platform_device *pdev)
@@ -495,18 +488,10 @@ static void titsc_remove(struct platform_device *pdev)
 	struct titsc *ts_dev = platform_get_drvdata(pdev);
 	u32 steps;
 
-	dev_pm_clear_wake_irq(&pdev->dev);
-	device_init_wakeup(&pdev->dev, false);
-	free_irq(ts_dev->irq, ts_dev);
-
 	/* total steps followed by the enable mask */
 	steps = 2 * ts_dev->coordinate_readouts + 2;
 	steps = (1 << steps) - 1;
 	am335x_tsc_se_clr(ts_dev->mfd_tscadc, steps);
-
-	input_unregister_device(ts_dev->input);
-
-	kfree(ts_dev);
 }
 
 static int titsc_suspend(struct device *dev)

-- 
2.37.1


