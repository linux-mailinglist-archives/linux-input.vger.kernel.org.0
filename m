Return-Path: <linux-input+bounces-9779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55DA28048
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 01:46:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DEF8F188822F
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 00:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C779C2288C6;
	Wed,  5 Feb 2025 00:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KLPD0tet"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2043.outbound.protection.outlook.com [40.107.249.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA50228375;
	Wed,  5 Feb 2025 00:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716370; cv=fail; b=i34yTaCM2dxuNyHCCPalT1PnVTUGdqseEG6Sb+pK39x7oYDwGB3iBjFpu+vhz+IvdVHKBX6VlPMa8ZLIwNWApPOcTMlfIDo2VWdCdIYimewZvNF9y69T3g5a4EqNBZH8iUyiNZOpoyJJcACWxWF4cJ7og/OP0Rz4HoyhRedcOnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716370; c=relaxed/simple;
	bh=DNmSM/zlaiHe7y+SpoUtP9k7yyKM9LouOCBuhZSkcWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WIVfNp75u+L2jQiDhml2tqmJPmTJTHZbrWSo8e7fEsRF7El+UmelFIEm0G6qPTdsR3ow+5DBsoSjjzSiUlj9rA3CWR29QfEB+aAPcmMRlu7ZzIg4M84R5kdVEY96d2t0TBX4Ejq1RkfQBS++5S6Bme5CyrWcsg62Ku6/vn2703I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KLPD0tet; arc=fail smtp.client-ip=40.107.249.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVTEEGNvXF3weDr/u+3fSYMi9f/zMXGF/kjwJs0bnev7HG7nHnDVWbIuRggWj3Mc0aIWPZuDGrF/Te3JPuS8dlCVg4qy7rCxhHZshsIxQcPnAQJwJ1tq6XMxLEOkMdOKwk1/7+3axbT1Vjl7ZER8STZeJvXYQrEdert3Dhija6wsD+rsAMJllv0fwI2rqrIXXxWQy3OClPi48tvC1fE0L5JN9eI6FJ93NCNFnSRVdr7PqKylIMgiWErwgpPUA6LFAMLoIe+TpsLDXb0ZC2c+A1/wx1BQNZ+/12vDjIbeJmJ6vs/1MGaEX8SXxlMlGi+nI8XaeeWIuon/AMQQTrTRWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS+DM8g/1DZ++lGRTiLrP/ykpiHku6xeI0up7+EwB9k=;
 b=uEg9El4vtReCGxZ2C/l8vlw5wUtnyLJJllGLQMxjfO9+MLaebusvm7O45D3sQfsZuzFZytjIKjHBXlTKJHzORed6gM+/MHz0f2hcqYeJQn4hElW9+7IdqAaTV3l+zFSYwonKO3rca3ShMIGVvL94EX4KkikFNqzgg8bCeVWWPRxNzw2wC+YCo2ddbp4TUOe6LH8TekO4pnawbAIuf6xWTy2Pv/fKO02c3NPgOtZsUuQoPCSWe2dkcPAHrKznmGCaoOixOTNWHiHbvXBLfBukISAK/SwKiqKXQ0JQI6nzCSthAjx8UitXSuwgylRCD3c9M9Zr3L0x6ADw6Y6/Mm2PWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS+DM8g/1DZ++lGRTiLrP/ykpiHku6xeI0up7+EwB9k=;
 b=KLPD0tetSmCYuHWkpXKWL/XiL7E2aKZYDsywG1RR0R5gEjm7jMmnrnSXQEFPDzb6TJmgozE7Tkz0uiAOOaZ8Q3d2seTJbU3h14V+FdW0hyademstOxu0oBEu4J3H9PIAup72lL87Q175SvlsCfuk8aL1e1vOUNPiAMIjoJGtBx8j5839V/+WqZovsWbOlGS8nQGDZJBJDa1ohJtk369HGDIkjnZsWv4fIovmlbPfkbHklH7d9uXT6oWrgWqqxmKOR9hnsJW8+f9ygTK9AYyGLW/ifV4OdG1Fa2Cplv0pNx+Srs1IfOz8hvsDExyzYoR6FJesnvnAA24YKCAKGCswFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8250.eurprd04.prod.outlook.com (2603:10a6:10:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Wed, 5 Feb
 2025 00:46:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:46:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:45:15 +0800
Subject: [PATCH 2/4] input: keyboard: omap4_keypad: Use
 devm_pm_set_wake_irq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-input-cleanup-v1-2-9758898ff8cb@nxp.com>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738716321; l=1365;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=IYFb5BcVnaCb3uUN830r92UAprUHpPfeHJSpQKDJq+A=;
 b=FfkYBrhoOBQaCtvD5SyQDwaRuLemJLrepWna3F/0nCmeMU9mbPq96bTN33pKCeGNsqqeEMzDF
 fyuOAEcGZDCCyq69PqXu4/di7aztPtnrUpRibv+9witGdOSQmQBRn33
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
X-MS-Office365-Filtering-Correlation-Id: 1fc5f90e-cb6e-44a7-ebc9-08dd457e76b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Sis3Vi9mN1NxYk5CS01PRjNuRVpyREtqbEU4VHYzaVdjc25VZmNQWHJLZFJo?=
 =?utf-8?B?dGZDb3QrZk1LYXlxYitQSjlCZDU5WUZCdjBzeVBTSFJOcVZ4OTJBYSt3dU4w?=
 =?utf-8?B?Qk5tQ3NMRCtMb1d6clFZR1ZpbWFSdDJXMzVZVXlrSXQzbFNWRWVQYnJWREVG?=
 =?utf-8?B?TEc2RU9EL25TR3RsWlNoZHBkVEJ5dEpoTzFiMFo1QUpXbURqNmdxaXpVeXlk?=
 =?utf-8?B?SmQ3ZURidnpjelFzL3RSOHAxdFg4Q2xnN2UrazBoVjBiWjU3aXpXaWVyZ0xI?=
 =?utf-8?B?d1ZxM0hvYnk4TzcwR1JQOG04NU92VUFYTHJBUkFkSXFYKzcxNnlFUk1kdXdU?=
 =?utf-8?B?KzNoWmpGVnRtZCtHNlVuMUlOVjlWWnFBWWc0R0JGMnJybU8ya2xEVmtQMEJq?=
 =?utf-8?B?NFVVbzZPRm52REwzQzd5cTJGbTEvSXBKTUlJUk1pclQwQlk1cEIvMDlPU2d1?=
 =?utf-8?B?MFc1STFSN0IySG8vdW9PVWtvRm1rRGwrZSs5ek8yREVxNDNxeTh5VVNRS1NF?=
 =?utf-8?B?bC9hQmhIYS9pMGx2aEVHZEJ0T3Z2RmFLenpOQlFZR3hRZkZ6MW1vU2V1MlNB?=
 =?utf-8?B?Z0tjV3JXWTU4VW9WL0FydG4wYW1TTFpRTmVuQ0VuNDVxM3pSclRPa3Q1QXpS?=
 =?utf-8?B?aDhHd3lmUkpCOU1RdVQwTmpiaXorS2RZL28yWktIM01teENRZnFjWnA5VFFB?=
 =?utf-8?B?SjNsc3A1NlFZQnN2OU9LU21COUFHZ2N5STQramxxbWtLZWZLMFVvWTNaalRC?=
 =?utf-8?B?V2kwNDJFNk5FdHdJMTRsbVlpd1lPeTJxaDQ4YmIzcTA2Z3U1RHRPTU4vSzAw?=
 =?utf-8?B?eXZDR2hmTTFPdTNjWTUvSk1tYTBFNzhaeGdZNVhzbStBMDg3bjMzWm53d0xO?=
 =?utf-8?B?WlZXcGUveFJQbDBPL0xTdmxieElKb1dlcFUrNkdIWTdYS1VrS045ZlBacTV5?=
 =?utf-8?B?bGNZUDhmeUpkV3paOHBTQUpZWU0xK0x5WW5FL0htcDZDeVc0Y2V4ODNwSUIz?=
 =?utf-8?B?SExva25KZUNDVDVZQ1AyL2F6ZmlLcWkrQkpnZWFUeWwzSlBpT0hJMFFLT1BD?=
 =?utf-8?B?TmRBWTQ2VW1HNENIR1hhTTFBUE9FV0tMemljeER1b0luRmpmVDJGNlBjRFBK?=
 =?utf-8?B?L1NKNExCeDZzOFJIVzlIWjg2LzIrbHk4bzAxLzdWZ29qMmc0bGFCOHZzejRK?=
 =?utf-8?B?a0JCRWtVdnVwZWozRVBnelNjNmR3SHdNei9HU2FmSHYwdnc3UUxVdTlCeExD?=
 =?utf-8?B?aVU5UmVIRUFPc0MyT2wwMnVuM2Myb0NBZkR5U0FSRXZBVXRQYjhYcEhRbXdy?=
 =?utf-8?B?NWtLdUVWOFdHYjJOLzF3aUx6US83QVNPejl4MDVnbGRyaWVCV3NBZGRKWVNx?=
 =?utf-8?B?aUt0eVJCR29qM3pMdjdSeHFQTHRvb0xhVXBCTGJXRm9CNldLdVpyVnVaMVht?=
 =?utf-8?B?WVh4Qk9RV1RRSW5mSG1GSXlPaThCTDc1eFZ4Tkk5RzA2QmFOQlpiZ3dYbDZ0?=
 =?utf-8?B?MGRnWDNPc1NQYjF1TXFyT2t4WXRlUnVnZ0RXV2dpdWM2UlQ0TVl4MXBzRURl?=
 =?utf-8?B?dk5WZ0I3VEhhemFDTnJ6MnRXa2pvSjF5TTFYdm1PakFiZTFYKy9JdmVxc1NW?=
 =?utf-8?B?VmNNeWQzckFqMkZjTTRsdE0wNXRPUVBVaDRzUUdoYmlZNzBrMUIzQjEvVUpH?=
 =?utf-8?B?MXk2VzdBTkJLMlVQRGY3QkRwYXBtMHgwQXU0dW54TmlmekFhREh1WEp1aUFW?=
 =?utf-8?B?Z3FDRzZyODJlenVhN0o0SzMrNytOS0M4c2NXNmtFTDl4NzBqNWhCUUVMY010?=
 =?utf-8?B?OStUcEczNFRscUdqZFN4bWRFYlNxRUYvTWdLY1kvcExqdlFLTnVabDRVNkI5?=
 =?utf-8?B?aUxVckZvbHI1K01sb3dURU5lU2RzME5CQnpnWkU4M1g5ZTBsUStPOUxqN2px?=
 =?utf-8?Q?/3RSVTs9Y0E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2NnUUVLSkhVNk9TTURTL3FTK3J6K3R4UHV5Z1U4NTNlOXdGVVVTWkFGUnk2?=
 =?utf-8?B?bjQ3RDdzK1BaSEhjaU9OUXcyakJaZ29rLzhaMVg0NjZ5UHA5T2lKYUJsWHRq?=
 =?utf-8?B?TG9uVEhaRXlhQ0s0aTVzcjF2UHdlNWl5YmlIaEVnYkdjeEhVKys4Rld0c20r?=
 =?utf-8?B?Qmxpdnd5dDhzaWpQRFhYcFdoZnpDRlVYdWp1V0F0bGU1VkIxWllGWUVRdFZJ?=
 =?utf-8?B?bE9XVkJONDI2eVIyMVB5Nzh0ajU5bkhydEtMYXlMQ3dPY0Jwc2IySGl1bW5R?=
 =?utf-8?B?b1BEMjJNZmV2YjlUL1FuYkowcnVsR1lpb3VndHJnc2lMU25ZdGViSmcvVjRq?=
 =?utf-8?B?d2gwZjdSTTFjUGNrb01CZG9tU3ErZzNKQ3dpRDhtSFF2aXVnL3hoVkxSTkhM?=
 =?utf-8?B?bnZuZWZNZ2crZ1dWTHJEeWd4QzFHV1M2cTBIazlXOTIzV0VYNXA3dDRDTThD?=
 =?utf-8?B?NVNsbVlVdWlZb2VLR1RUYlc1Z2x3TFRUeE9mMjNKWXZiYjBxVEx4TjBENS9k?=
 =?utf-8?B?R0p4RUtoOE96L1hKUjM2RktNelBMWmRORFl3aUc5VldYK3IwT3NwZDJBQTBD?=
 =?utf-8?B?MW5ncWo0a0JieUFibldvVFozNnErY0l2NmhSRmJoeFhBMDlIZmx4SDhBM0Vo?=
 =?utf-8?B?QmRHV1grRWhrM1FwL3BaZmFNY0ViWU1lcXVLbTVCUTBaekFHNk5YSzBFOGVk?=
 =?utf-8?B?bjNEQW1rU1dCV2xYNjFvdWs2YUkwREttSFN2SDJtV2JnRTBNV0w2enhUNlp5?=
 =?utf-8?B?QlZwaXVhMS9sR2J2NXNmS2liYmZBL2VtbFNJTXRrcEpjYWFiaGd4QWhXQ0h2?=
 =?utf-8?B?RXdWbHRxT1d2Q1ljVEs2akhNMzQ4NnJaL243dE41U0JTQ1Q4NVdZYWp2L21j?=
 =?utf-8?B?ZWxoUU5xSWh3djgrMFQ3WkFsRXlRTkNlcy82cDFTWmttYjk1cWo2U2FMcm9X?=
 =?utf-8?B?bjVPaVlFeUFkWGxxMjVYV1lnOW5CazhyM2VuemFqM0NkMFNRYWs5M1BMUFpQ?=
 =?utf-8?B?U1J3SjJEaUx5ZEtxa0pwdlNpR0lwZFZmdWpxNmJNMXJqY3ZwZjN1UHV6TWZo?=
 =?utf-8?B?eGw3M2JOeWM2ZDZueHBnMmFKY1VKSURraTVESzE3YnN3V2g0aUlqdHY3TVAx?=
 =?utf-8?B?azNETGZLSFBRUDcrR1NwemJ2ZGhUMFEvK1hwMnRza0FoK0tEOWRocGplZ0ll?=
 =?utf-8?B?VlB0dzRXOWJZU21tNXQxNFN6aUdoUC9lS2RFeDNnWXoxLzBqM1Y4dEJNZzFP?=
 =?utf-8?B?ZXErUGpZN1cxcFQ5ZTYwK1lwZDduU1lRNHBXY0paRHR5S2huWlltby9GWUUr?=
 =?utf-8?B?VUtxQWF5ZGZVWkVrZDBmdlEzMFptMTRpTE8yMExFcXBMV2J2cERtekFpRXQr?=
 =?utf-8?B?dmQ4MEdBeEovSFBlT0gzTzJEK0VKRVZVSWpoOXJIZnY4U3EyTXpCNUMwZHIx?=
 =?utf-8?B?a2c1SDkySVg5ajNibnJia0dWbWYxQ3VLcnAxeXJlcFpGZ2NBNjRPWjFITXNw?=
 =?utf-8?B?d01HRlNXWDUxaTEzbys4eThFZlh6OUMzWTkyV2ZjWlhFTURVa1duNGNIUnhW?=
 =?utf-8?B?UWVCM2JQRW5yN2FjQjRMcmQvQTFEUnVBYnRqSFB0aUFyZkxMcStZUCtvOTB4?=
 =?utf-8?B?RFZsZjVGNGlRdG43UWlLZEh5RnUvWU1Bckt6OVgvU21MY1VCelVVb3dxVnFi?=
 =?utf-8?B?d0NyMnU3M0VmTm1sY09OR3B4MjZDOE52WDJTSytIU2VxanNYb1JCNXQwbFZK?=
 =?utf-8?B?QWtsY2M3b3k2VUkwZDl0ODVNM3ViNm8wTFpQWjJDZ1U4VTBMMm55MXRQTTFT?=
 =?utf-8?B?dlY5Y2JIRUc1T1FSajg4SDVnWlluYlBEaU83TEdoZ3R3SHVZSGNGMUp2dEdo?=
 =?utf-8?B?NWZEdmYwbFlsQWxPcTZkMzI2amI4UTdUbzB4T2M5N1NuZXdvNW83Q1JGQ0tR?=
 =?utf-8?B?VHlCaUs5cFlDTmVOZUNRTm9tU3JUdlRMY3hsS2VHSU1zcW5Jb1ZqV2tiK2xM?=
 =?utf-8?B?ck1GS3BVVzh3WkNCNk9XVWFTUFcvTlR3ZGxqaCs1eklkdG9yOHE3R0NOTjhy?=
 =?utf-8?B?L3hyUjVTcnhpWVdRdW03WUE4RmdGWU9GT0tNYWt6RzFOcGF3KzlZRXlzS2xQ?=
 =?utf-8?Q?J4KXlMihulMcdCaaNX3NkyycK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc5f90e-cb6e-44a7-ebc9-08dd457e76b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:46:01.8567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQ6HVuj0Tl1Dq8CWznKXPz2yBYYCKcUzAa2dLggL9PApg8DxlrLY8NMIsCFYiyX9Sk2c6VEpDMEvQm9qFBbAKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8250

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq, then the 'driver.remove()' could be cleaned up.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/input/keyboard/omap4-keypad.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index bffe89c0717adf9ebe5b33892efa4dc30b158f83..b7bd649d1628a6bf10db4135f73778f62db92647 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -465,18 +465,13 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	device_init_wakeup(dev, true);
-	error = dev_pm_set_wake_irq(dev, keypad_data->irq);
+	error = devm_pm_set_wake_irq(dev, keypad_data->irq);
 	if (error)
 		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
 
 	return 0;
 }
 
-static void omap4_keypad_remove(struct platform_device *pdev)
-{
-	dev_pm_clear_wake_irq(&pdev->dev);
-}
-
 static const struct of_device_id omap_keypad_dt_match[] = {
 	{ .compatible = "ti,omap4-keypad" },
 	{},
@@ -485,7 +480,6 @@ MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 
 static struct platform_driver omap4_keypad_driver = {
 	.probe		= omap4_keypad_probe,
-	.remove		= omap4_keypad_remove,
 	.driver		= {
 		.name	= "omap4-keypad",
 		.of_match_table = omap_keypad_dt_match,

-- 
2.37.1


