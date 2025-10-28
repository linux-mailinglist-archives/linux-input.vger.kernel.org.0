Return-Path: <linux-input+bounces-15786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1AC16B54
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 21:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 51AED356DFD
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 20:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6639B34DCFC;
	Tue, 28 Oct 2025 20:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HU07iNA6"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376F927877D;
	Tue, 28 Oct 2025 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761681709; cv=fail; b=Qxef7hlI2Atvfnj48EDCOi2U3JwSZbolQfZNcGuMlxUhd1qp65iIWJAnRnTh4L9n1DriwCNe3f1BN3w6YJokGfcmIDF3wd/0fWUHoZTrPnN8ahSjmO5+cW1cXzcQ0TwQtbH5bksv4jBjvrQecVciQXKg0Qwil3JOXXjuqipOB9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761681709; c=relaxed/simple;
	bh=kKlFxEcGVxguJeOHooJmimkWdsP0vRhJhqP+ktZDHmM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=JsEeGMjtzpaj9+8r6OGhYTqEfusWxsK92M3J6U4eCN9p9+bUV6RNg+AlnZfxQ+Cel8kFY6r3NvMFrSU0tczBfHT+h8cL5RDUkr0inH32M2JgWoYHCpfkMXSID+5uykBUtTscL2q2enEkNmouxhTETnJ4JiaMskwJUxgMS6TFGsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HU07iNA6; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiC01bWSJWsDD9lrYdm8MDCLXXrktsnq/ROnJHITRT0ljpXsxEDrqpWltABaX399HETQP/4Uhx7yQJPVKmiYdFS/MIjXK282XjFAL/gtJR0oBzc4wzSLzWDlk9pDjc5pU0X1x5JDLArzHUpMR8jc+yNJ8RcgSyi5JX7eBgEp1jBiJyXjKi1zIAxYjDAbfdEXGBUgQKSwqKP5W2yC7i8jVc3io4rBanDZVjsNpBU6UeVLa6ID8DAfyTfYJqTOrPKDC0F2mGeoAjf7WfRt6b6CK+iL0E2Eq6pSP9Q2lH9F1sX3WzaB9z5mYs/eluR3XS/gRMF6I1md+UIWZ0V8hJHH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksR4in6av39JTkciWlUp6fv7NoL6kONVaDBeb6FO9qo=;
 b=g+/rAkH1gYNfYI5p9iHs3iC2fEEUX+sIK8hZx4UDG03kpTEnWPqNwulNjPDe8EbBbcTKGFAHKkLa09swIqvYdIF0fXsgSWs4IPUXr69EJLycSEAebHZkBQkN9Hp12/5Z6nm/F2GU08cY1aczGgW8k7KLTjI19Ho3QFS1//aFXGvPawrhKViSvjVfizhYrmTG05EhIirAwBuPgRKSCOqst2rFsko0StVVLvcoem0zy4QF1AT2EaSbIgJ8MmVkuvxVPBxo8yfFpoDN+WXeH8hb3Tj2fo2fRIp1CwL13H8ytBq8FrHob1b3zcnPjzqijTeQzlJ/j8KUw9aJLtkIL5z9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksR4in6av39JTkciWlUp6fv7NoL6kONVaDBeb6FO9qo=;
 b=HU07iNA6bcTosawalo9AW1trorm/glyp6GirS5lQo1R0oLD5NXtptd2g7u27z5aTeULP5SQ8yKvtR5G1t8zElCP0qE47hxFdKudjWqwEhV/MCNf5aUCLfUjabe7jvhvPkYFk9jCX60tDP8nLkC/AVPVjmet/SV1k2KlDXbHK1iq/FE/vLY9rp3S55y1T5dMNqz4tZptsqM5ME7GUwfchsfi+CXQxkO4t1zaAZ2rk2EcRTv7jqkq1DEB/2jfCIteckE1AGWEc6iRdDTwdsVoU/JHVnqiQqCm6AAc0KF2b3VQbRPHIuVcrHztC2azU7O2n6Bc5F++vUVGq9vCag5ywAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PAXPR04MB9219.eurprd04.prod.outlook.com (2603:10a6:102:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 20:01:43 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 20:01:43 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] input: fsl,scu-key: Add compatible string
 fsl,imx8qm-sc-key
Date: Tue, 28 Oct 2025 16:01:27 -0400
Message-Id: <20251028-b4_qm_scu_key-v1-0-9732e92a5e83@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABghAWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3SST+MLc+OLk0vjs1EpdS3PTNFPDZBNDc1MjJaCegqLUtMwKsHn
 RsbW1AGhZf0dfAAAA
X-Change-ID: 20251028-b4_qm_scu_key-975f51c41752
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761681699; l=620;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=kKlFxEcGVxguJeOHooJmimkWdsP0vRhJhqP+ktZDHmM=;
 b=K+wGaXgVlXn9eL1HoYXWncubnqQrwtFZSHFLiE/GZ3QtVhsIb1udneMdDj3QgS2HLwCQmIUh+
 rOqjkWEJ3tLC7gsC7qDZRlEnYYeBEF3s456pJsDgVt5IjVOgzmODL56
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0221.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::16) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PAXPR04MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc32dc9-156b-4172-7c7b-08de165cd0eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjZSTGhjSUNZdzBKRU9KYlJnaWdaa0J3K0dMZnJ3UE5CTyt1TWpYYzZxbVAv?=
 =?utf-8?B?aVdlUW44L0JMalRVV0lBcjY4QlI1eWdaayt6QjNZVWR5aGxSZGkxOHRnbVMx?=
 =?utf-8?B?QmFUMG9INEhLQkJtUVl4MnpIdkpqaWgyNFo1Q2I2VUVONU5Ca3N1dXE0YU1N?=
 =?utf-8?B?VTJPRHdVSDczUW1GZDFBK2VLMDBpNGVNajNRLzFORmhnVDh5cEdQaFB5SUk3?=
 =?utf-8?B?cUsvQktVbzRGanlwRSs2QW1FMnJQQjdBdGJreW4zcGI5b2xaNXRCYjlYS3ho?=
 =?utf-8?B?SnNrK0JwenREd01vdDM3MXFxZFRyZUN5b3NjMkhyQ2pPemJhb2FLWEZXTGFX?=
 =?utf-8?B?N2ZJdWQ5WEhrU1lVai84eURIcmpUOG9aQWVkU21jNi9CajVyRDNtY09TRTdV?=
 =?utf-8?B?cytqUVVRUTZwdDBGaWs3YS9oenpXanN6Z0YwaG54S3RTUVN3a1pBVStRdjhQ?=
 =?utf-8?B?NmdQVUF6MGxsMFVkNjd1UitUS0ppaUtuNTFRMFVPM1p3Q25BTk9Ed0xPc1pw?=
 =?utf-8?B?clBCRkxaQit2OFJwWWJIenIxNHpaa2d0WWRGWlZ3cU9KT2xuWXdpNGlhTGpI?=
 =?utf-8?B?d3A1NFhpb1ZTT2EzdnBQRG9LbEt1NWN3N0ZRRnhXWnF1c2tpVTk3WWhKVCtJ?=
 =?utf-8?B?WUh4Zm1DTUdoTGQ0UGVscU1tbE51RjU2dkFIckN4a2NHT3lZcDM1azBMNGQr?=
 =?utf-8?B?TUJOSm9neDUvZzdLbDZDSzI0czRrbkdRc0FlTjloZzhFUnV3RWhrSzZMQW1Z?=
 =?utf-8?B?WlJ1TkdsMk9sZHBIMG9hZGR1Z2NGOW1GL3RGblJSenpCaVFQVzU1WVArOHZn?=
 =?utf-8?B?dXkrZkxyNkZKRzhzUm1aZEszV0NYRzdTaUUxelhTNVZWOHpCOGNJL2E2aHUw?=
 =?utf-8?B?K2hxeHpuK0VXRndyKzFGRlExM1k1UHVDYWNSYkxUbEg0OEppVjYwVFBBR2dM?=
 =?utf-8?B?dkZZUW5zeXExbmJkYnNYRTdBby9LQ3NNcEJLRW9WY2xzYjM0ZGd1akloMDh6?=
 =?utf-8?B?VmwrR05OQ3BKTERCZHMzNWZFOStOWmRjSHFyZzREWDRPdFIrdGZ3cy9DNEY2?=
 =?utf-8?B?bGJtSEx6YVMzdnFvN0N3REdWV3FyV1Jmdm5VK2RUNnBOK1o3d2w1WDBrQTZm?=
 =?utf-8?B?Rk9EQ0ZTTzNyT1VHUlV4dm54Sk1LOFVuNnh3NFBOcXJtdWFnMVJ5N1JMUk42?=
 =?utf-8?B?YW5TaUFyL0RWbUI2dDY4SFF6eTZha2Nac29rYWFURVEza2JSdjc1cUtKT2J1?=
 =?utf-8?B?cG12WkJVY1pCeCtMZmJVQWVpVHkvVGRzaFBVdU5YallaOGFOQzg2aEpDUjlE?=
 =?utf-8?B?ZytPb1hZYzdSWVRmTDZUMzFCeGxlWEZIY2Q5NEN2WG54MmRaSHg4ellMUDdR?=
 =?utf-8?B?L0xpRnhnUVBhSFlNZU9hUHpIQVhLZ3UrR2pYcGFBMkdvYXRRN1E1UFJXdHd4?=
 =?utf-8?B?OWVENDdQMTFlT1hDZWR1djc5dkVFRGxsSWdDdElwTnpCVVpqNS83T0swSEJu?=
 =?utf-8?B?VS8yOWYrekFGOUQvd2pXUnJDNko1NVpGMHN3aHNsSEdBRUkxeFdsQU82Slh1?=
 =?utf-8?B?RVZEa01oS0NSZ2xVMHBQNG1OZFZJODB3ZUYzQmxValowdTNHYitQMGI2ZDB3?=
 =?utf-8?B?c1FkRjVnejRpUzNVQ1p3MzIvTHZibHJ5VTJLR1ZrUVVmVlBnMGdmZ3h3Wjl1?=
 =?utf-8?B?emQ1WGhMVlVIakRJQkxJQ1pVdENRRGUwSUhwZTU3Z2pNMUQyR2s4NUI4QTNC?=
 =?utf-8?B?Wm1uZU00cHFhNCtZaWJKMW0wSGJVVTh1U1Vtem42eitJR1NDcWN4amI5YlRy?=
 =?utf-8?B?RkFzaitGZEM3RHJBdS81VUF0UkgrVzc5azdMQWJvMHJUUGJYK3cwWG5RTzJM?=
 =?utf-8?B?Q3lnYitRR3lURUF1ZUVtSlNWZjhleWpDNklaNnprMnQ2ak5uOGdqUHc5ZytY?=
 =?utf-8?B?b1RxYzZ2bGlURlRqb2Rpc1A5SVpleWN2SXRxQm5DV0s1TnpYR2U1SWNwTmdH?=
 =?utf-8?B?K2pRSU5nSXBESU05TkZOanU5MW9PUXpPOGZIREpIMFBOamFuQTdVQlE1KzZK?=
 =?utf-8?Q?xAyuK5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a05sT2k1d1lNNm1xY3R1OUs1UC81MUJJamZUalNUZkQvVkxFNThFT0lyQWVO?=
 =?utf-8?B?UUN4Q1h6RWVzb0FCZzN3SU1YY2p1bmxjaDNUUXgyeS9iQ1JMU0Q3UERReGpN?=
 =?utf-8?B?cit5dmNQR0FiWDJMSEh2VndvYzJDU0RQUjlqOFBXeWRkV2Z2MTUwaFZFcktt?=
 =?utf-8?B?V2tEek1TVkZEbzc1L29FTjY1Ny9rWEZ0NmpjaVA3ZEdabUhvdHV1STE5VnN3?=
 =?utf-8?B?cFNaU1IwdTFkeWtWQVBtOGozSWYxc3Vra2FiWEtPZlMvZHFjQjhxc05FSW9X?=
 =?utf-8?B?a0U5TmxIWUY4ZmZDSEt5QmoxbkVVdHhTMmdydFpaZ29DUm55US9XNUlxNHBY?=
 =?utf-8?B?cDlUc2lSS0lEZ3lQdEsvY1o5d0c0dG4vMUlUbVp0N25IbWgyVWRvMDVGZ2FN?=
 =?utf-8?B?UEtSY1RHRXJZLzFiN0tqcU1QMnNyYkgzN1dMbmRTeVVyaVJ3WExYak1KZm9U?=
 =?utf-8?B?d0djQlZBU01UNDJxUXhzbmEreDZwOTBTQ0ticUN2YTFqdFZyY3FITDNtdnV1?=
 =?utf-8?B?Ni82bkFUQTBPclBrZ1FESlZzUStjd3duSWNFV25HbEluL3Y0MFJvejhCak82?=
 =?utf-8?B?UjF1a3RLdkVCQmk3U0JFL3loZHhxZHlNTUJpMndXVmdBeVd1MUZqekd5T0RV?=
 =?utf-8?B?SXNGa1oxQmlQZlc1OUNtdzJqazhiYXNZNlpmaUVySGVNTHM3YlFUTmFiQTYr?=
 =?utf-8?B?OXYrL1NzUWVHNlZ5eGI0MGNmSTJqMDRTNXR4cll6YU5TbVAvVDlPOHlyaG4r?=
 =?utf-8?B?djFhQlRDeVhBai9CMzkzK2lURGxYN3k1UU55K3ZWRnJVZklqS3VsNnhzT0lP?=
 =?utf-8?B?ZnluWWhxREZHSUtxa21xMmErazEvWG1Da3VPemhobVp6RzFDKzFMZUVZZWJW?=
 =?utf-8?B?QWpOSnBCTVg2bGpPRkN0SzB2QkJTZHFYRVlZbU5wYjk0Rk5taDRJb1dtbVhZ?=
 =?utf-8?B?TmNLZnZZQ2toK25kd0l1WmdCdVBkY2srVzhRS0RVNjN5STdIUnE0bEZUbE53?=
 =?utf-8?B?TGY1b2Mwbjk1OVhTTFNaRW9HNzg2dDNyU0lkTHlETXlGSG9VUzg3cVdGdWhn?=
 =?utf-8?B?aEhBU1F4bTk5VnVLRjJsS1FDOW1nWENoZ3R6anBZamFROHY1VjlBN2Jicjhp?=
 =?utf-8?B?ME9LdlFXemRISjZPdnBmcjlwRDZ5eW5JQlZCT0ZGcUJwaVlsdVZTZlJPcXRv?=
 =?utf-8?B?SUtLbW5FUjVQT281VzJ6dG9QUDViaXlpTXBWL2ZNbnVvdFBheGVWOWh2VG9t?=
 =?utf-8?B?YlBBQnhYd1B0OFZxY0wzVmlMWTIrZkxGZ24wS3dBUnFYZ2hsQkc4UURuZHpG?=
 =?utf-8?B?SjZQZC95T3J6Q0F4bWRoY1p0NjRWTVdkTjlpdEVneFF6TGkxTlRvMlZGVHBz?=
 =?utf-8?B?YUtBcWpwQ0R2QklTMndPTjBvdms0S2hHbUhTOG9XU2ErVkRoYkxpL3JIdWd1?=
 =?utf-8?B?SW1EaS9ROXpTa25zSzBrMzlTUWhkaTBnRkQ0RFdMcG1KTGZYcitPRHRRenZQ?=
 =?utf-8?B?blBTRTdZSFVpNTBkTG84NDZMN0xhbDlQYlF5N3Q2aUFlSm00WlNMV1lXdlJD?=
 =?utf-8?B?Sm5GZW9PMGE1VS9LMnNoMTVkS1hjb1ZNWThmSWJtZHMxTHFuS0pZZDNZRC9j?=
 =?utf-8?B?RHFMQ0tUM2hnTy9zVW80M0dLcHU3QmtVRTJBUmJUT3RCaTJ1UXFncnF0VzNU?=
 =?utf-8?B?dGZhdXZsK0VWQXpVZW5MRFhTbVZNODQvK2ZqT1JSQW91RGRPT0c4V0NVd2RP?=
 =?utf-8?B?THcyR1F3SHNYY1NCK1Y2aWcyTExYMjZLRC81Nk9pWTJ5ckRWckcvbEhaZ0Nx?=
 =?utf-8?B?cUsyeGVWVE82WUh1RjZtUmNVRzFFSDBJUDhtQ3UrL2o1dDd5OE9RbjNLeXVa?=
 =?utf-8?B?WEs2VUt3WTZnM3cyZnl3VVhEU0tDZWFMdEpaV3k1Tkp0M3Fya21Sa3R5RzFF?=
 =?utf-8?B?bjBDVVlYUVRBRXJId3BjdHF5NnhIMWR0Q2szWkdsbmZieWRzWC8rbWcwWmNX?=
 =?utf-8?B?YnRMR1o5QVNHS3M1bE02N2tSUTZtRjVqK215WG9wdzBtMWUxd0Zjdk4ydFJv?=
 =?utf-8?B?RFBTZ0FYVWRaYWpkdndVNXh1UHNwbG56SUtjSWtrT0VJM2d1OWxrR09tZGc2?=
 =?utf-8?Q?3DtlG3xVH929RUFv6jeRrvsH9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc32dc9-156b-4172-7c7b-08de165cd0eb
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:01:43.2714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZKHXEFTqXX5DpOCHxiLtSGRYWGiW+m/dIAJy2VUDLdpFFErH4CG2sa106lXVicqi2CuKYbksaZoKipix29Fzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9219

bindings: add fsl,imx8qm-sc-key.
dts: add fsl,imx8qm-sc-key support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      dt-bindings: input: fsl,scu-key: Add compatible string fsl,imx8qm-sc-key
      arm64: dts: imx8qm: add scu power key support

 Documentation/devicetree/bindings/input/fsl,scu-key.yaml | 4 +++-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi                | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)
---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-b4_qm_scu_key-975f51c41752

Best regards,
--
Frank Li <Frank.Li@nxp.com>


