Return-Path: <linux-input+bounces-16422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D61A5C9783A
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD1043A1EBF
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35BA312800;
	Mon,  1 Dec 2025 13:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Hr1p818j";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Hr1p818j"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023136.outbound.protection.outlook.com [40.107.162.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF31311C07;
	Mon,  1 Dec 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.136
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594476; cv=fail; b=s7M3BtwZyeIJmb3pD966QaGX7Te7q3h66vdimGMx/tJTTZN4aqkvb6X5zR18V/MaRnWTFEIprNZWuEAasV5z0XSa1U6fvIefueMFeKsxKDw7RPiZHkkp1GcIEaigOZS1lBJKQqjfSTaWrRmtUjRsPWniI/UpQ306dOr+XWPr1ko=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594476; c=relaxed/simple;
	bh=mB1przRBkDOGbA3TxHcHIlKm52G/uzJI2q2X+Bp7H0c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Kzv9pCTL6R5taQZcNtMSAHzAjB8TLWjDTWzV0orTouN+oZOn9SNxtft10ub9AyLrMFj6uIXXuwlVl8DcvuRsBP4bHglj4PWP52w6L9wtBG+NC28mX6oapE07tvXo/Eu8Qm/IfX7ACs8Yhuh0Qdkrjv9dsAgyYeg54JtlBrlXkfY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Hr1p818j; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Hr1p818j; arc=fail smtp.client-ip=40.107.162.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ScevCkTNhyeBY9enniPGLk8ymfAueGSuavwxX7qxC3o7jQG5J6bA8Z8m9oG/rVY3TUr1DeIJPrCWtbHpKQpRn8/R1OgqBK/QkdA+LjBIsWheHbmgJakCgdMaGp8U3Rnul2Gg/xsZU936yosbHbOTW+/ov6pUTxgktgCKS1od4VMbsfJwH0cTbaBg5h6HFT6J5RPRa+7ZkLMSKsgh1vb7fAI0tLQAJdIIW7phxrQY6W6UqFqKfsbAvxWAFSWd7nbm2LT6zz9CIiCqMZArHqMJ13FwwdlFAK1ZWHfoh0aboY/241V6I0j3i5k1NDCK1KSfIUjtA97Mnv1Ue5dnoGKH9g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=l/n2uhDmbeKXTqsiujOmsijC/uavnVGHUMG0Emi8YHYRUpNT5kKWAzag5ORwAdlwFuFJ0bKLJAaWYvWNpv0ywXnEsuw6T3KU4Rw0MGMT/28cR2Hzo2M1ZGGrIgYK0wp7liHpap065TH3prvEkTUoebM9e4oAoE9zAXc+r3lUXJOKGFG0KmnB+M+AvEW13SejrnVAvM21YaqctpkMGWE5nwCPIjWxqC/HBobIJvT0PmlcEvw8LgV8chzqGYLNQSOkLJu/tJF9rlRBR1aF8b1o3BRd2wK6zFou4ALuYK6MyrQXJBzdWak0xhmSNHdtRflh6XfJs7kw2Oq6wLbTq0iQag==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=Hr1p818jQYy0gdidunivWEvlnlQEDFUeA0NXqj5E+wOhliJVePZu4G7NrgPAOspzybodgP+//NspL8/iHFEv9DhCHgWnnKKBU/eYqsytp4brbt9/3YO/1BVmfvIQ32PvANSEHaP2lCrYus+WKsA1BkxYLYRlTckBVWDf7YD3f44=
Received: from AM9P193CA0019.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::24)
 by AM8PR04MB7729.eurprd04.prod.outlook.com (2603:10a6:20b:24c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:49 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::19) by AM9P193CA0019.outlook.office365.com
 (2603:10a6:20b:21e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:49 +0000
Received: from emails-6754105-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 369EF8015D;
	Mon,  1 Dec 2025 13:07:49 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594469; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=URXSACeql56OHHXeRvjGhD6VCLtYFavcP3n27I2BFl9dgy8p+rdZV5uficZk9aj6xDkq5
 cIGddFG540/R69nRbCvuVCDhYuf877Oi1Y3x8sGZGVU43+3Wcdy5hAJuxGtdEB4qmkPHuzt
 G2q9aLwUfoiomfvjtpJ+d8GCcKWaVWQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594469;
 b=j6yzWb/h2fLO+XbnUMvz8J/R8T4TKrxgSNtCcqnDjmGNY4dE7//sPl4YC1hlTBEqqS6c6
 GKSLpsQ2B9vZTNMtPtmHBJCvY06nXw7gmMrDopGJg28CKGGDtpwURS7Nz2z68n+NQZD2KzP
 OuvQPnvORTvZaTGh1Z824SDcL21ZmUA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sG5fQAZIuPfoHljZ1ngyBUQ9QMpoA9tT101g6TIUkLaUioZK/fUx4197TcugvYgWZXX+Zhg2lDz9jAzb1aeAh6qXDzNvHnxk59quNqzi68ctpdGWGYZ0ytb0Jt+JkCClYWhL7XZrDyM+jUO738CA1Exa3LXxHKyBwW8hJ7Ijot3DWveab69hD21O2ChDeQxKpia3aR/w2TztGw7s3R0n4oMY1YxOJp7yvX+9a39Mk/d2uJhg8Ogx0OLlE1sW4ss4ZuDX2y6GRftQ7KM9zsk7AMGGkWLmVdlr15pUu57IP+5QAbghLuv43vqctqQ5uXvlnF7ptqLh1rpepZ3oqMPv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=Do/WbcJv3jfAJykGAVqzHw0bVpO4Ewd1ydSRdFzoV2Xb9JVwVeXU88h9PDSdIckjiJBZNgFVI3aIIQ7KK9DM/VdD8agCT6wsSgIj4DaqGBpWcibcM4oNg/9vhE7sfXHoE332wg4MqaKMdOkRHSawZ5hWa5Df87Vcv9MOlgvocr9RgYLG5SxxucdFUMSomxdtFioNWA0CxcANahUHa22plvi03Sw7pwX/eBbm5bILnN9XkZeiRKlTSpl5x/XVhgNiOW5UsWMqgj28MWN299NJM/zyXcNk28u54rxCAwNgYlmgjWncIyfJqkkgNWkNmCvjjUN5In1FfzSNnEOLSmzEHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWyL2VQlf2sqGUDJNav0ukW8b6dKw3K6ze74HDXMmRE=;
 b=Hr1p818jQYy0gdidunivWEvlnlQEDFUeA0NXqj5E+wOhliJVePZu4G7NrgPAOspzybodgP+//NspL8/iHFEv9DhCHgWnnKKBU/eYqsytp4brbt9/3YO/1BVmfvIQ32PvANSEHaP2lCrYus+WKsA1BkxYLYRlTckBVWDf7YD3f44=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:37 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:37 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 14:07:24 +0100
Subject: [PATCH v4 5/8] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-imx8mp-hb-iiot-v4-5-53a4cd6c21bf@solid-run.com>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|AMS1EPF00000044:EE_|AM8PR04MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dfe03b6-5f21-4877-456c-08de30daa120
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZVdmT0I0ZHZrUWZIdzA0a0xzWUU1L2tBT0l4VUJtNlpQUEJvRnRqWEhuaUxi?=
 =?utf-8?B?cE5KZVBoSFc3Ty85TGdwOHBKTW8xNEdudU1DV1Zia3M1S25aVkp5VWE4M1dL?=
 =?utf-8?B?K1VFY0RpNnRhMERqa2hHaGdLam84dUYzOFRhaVFwbjlWRkNuRWhlU3hpekxm?=
 =?utf-8?B?aVNQeHFCaG9lSWNaRFdDcHh4cXJRN2ZmejJ4bkhUZnU0Wm8rWElENlJlQnFj?=
 =?utf-8?B?UkZhelMrdjBHejdTTXZqWnIwck5ZS2JBUmZiUmpoRVRLcUhpZTNUYTQ5TWtJ?=
 =?utf-8?B?WmdxUDJOcUxlbkE5YkV5MEtmb1hzZFhiZjg5VERuUTdxMDNsNWQvY2pYTHd0?=
 =?utf-8?B?SElFK1NCWWgyL0FmRkdqNldzZ0h3ZmMwRXdkSHJhaGh3VWpybW5QcEtIK2E0?=
 =?utf-8?B?M0hsQzF5QmRxZFY5YkNiQU9HNUZQRVFDZ3ZWM1dBSE41SWdUNVprYmhncXFy?=
 =?utf-8?B?NDd5TnlwOE56OFMvZXFXMHBIaVVvbFg3N3AwaGljU2FGREdvSGVMM1BCSlNy?=
 =?utf-8?B?UDRwQ3hFK3ZFRlJKVnFwWEhZK3l2aFFRMTFnT1Q5RDZITWozNlpTSDJZdnBV?=
 =?utf-8?B?UERRL2lFd0FmZGJjdURDUkhESW9QMUhpSXVlMFRWMGlmZit2emhBSktORHlW?=
 =?utf-8?B?ellIRU9jcFJDRlhTVGQ1dlhhU0tVOHRxV3pJZjIwSlczZ1BuRWh0WjQxRUxu?=
 =?utf-8?B?RWRTajc2WnVJbDI3ZEhmSlk0eFNKcUZucmtlMHBjNkhlT0FUcnBEd3JBRytq?=
 =?utf-8?B?dkM1d1JxdmZRbW9VOUhIUWxNOXpzcC96cmp3a3F2Snp2bURlWUo4aUEzQW9x?=
 =?utf-8?B?YzFLQ0NFZHFGNHBLNFE4bkFZSXdoWStMTGswU3dzaWhXbzJYTmRGVjIrd2Fs?=
 =?utf-8?B?UiszeXlrSnQxa0kwL0hxU0hSQ0VzZmc1Qm5ITHZ3ZWJCOG1VaU5qQ1lwK1FX?=
 =?utf-8?B?T0RBMWgrd1FHQ1dNWjh0bi9BU1dsSWkxNCtXNklwSjlnVldtZ0VXRTVhNnFG?=
 =?utf-8?B?R00yblNGY2dsckp1SnN4OVFMcGNKajludFQ5dE9LNVhyejNpTkZFMlhOeSt1?=
 =?utf-8?B?akFVKzlCTVFOOTUrUzdOejQ4TnV1ZFUzNk5oeG9TTHhiWUJKZ3pFTmNxYkZO?=
 =?utf-8?B?K3MzREF4ekVGR2xEeE9aSE1tMVp3UFV4K1ZKM1pTUkdZOThUdUl5NG11N2lL?=
 =?utf-8?B?MnhiRHNSQ3RLK2psd1hQN2FSaTRQd0drNTdtVHZoU0k1dlhPV2tOa1VzT3JQ?=
 =?utf-8?B?RFlVS2tKM2JMaFZhRllyZk9nT3VKRVdybXVLVngxSWVnSlhMNjNCL1VaaGRk?=
 =?utf-8?B?T2w5YlBScWlMeW5YZjdZYXZjYVN5L3NURkRtUGdEd1V4VE8xR2I2dVdyWHZH?=
 =?utf-8?B?T251MGRWT3pud2h3UjAzdHZ6eTlIeWpKdjNLUHZiRjdkUzcvUU0xV3c2Vm84?=
 =?utf-8?B?WlljRWNMeGZrcEZFdEZET1NTS3J6a2RIenQ4YXBvK0M3bWFMdXFIazI1Vm96?=
 =?utf-8?B?RnJwTmtoc1RZbkNPMXJON2hLUWZjT0JtTUx3ZUhDTUlkNHN1eUdnU0dVQjYw?=
 =?utf-8?B?WkFOamNSa0pwYmtHanJ2YUYrdlJZTHRXZ1hURUtXd3RLTW05RlZKRmdBcUNZ?=
 =?utf-8?B?N1hLbjlVeHIwcDFlRzdpSkFQYmszTTJENCtkTjI0d0dmaUVFYnRnZzNRYWFr?=
 =?utf-8?B?WDVHMXY3OFNvcGs4SG5EU1JsYUhUc2VjRjNyWm9RdGpUci94aW0vanRVQU85?=
 =?utf-8?B?VlhGNm55UURhcldmbWdPekZRZjhPcjJ3ZmtiUk1XMTFRN0dTNUZXSVdmYm1Y?=
 =?utf-8?B?ME05WWl5UmVMV2txYnUybitqU1h0UkJZZEp1MDNLcTcrY0JuTDVIVW5FbS8z?=
 =?utf-8?B?QnlJT09SdmZCL0pMQ3IxUUpxUTFkaFozUEkvUlo5OEpHTm0rL0I4cldKSUpl?=
 =?utf-8?B?eFFoY29IZEJyWkwwTHJSYlhHem1KTlZQd1hod291bHIzcnVIeC9HUHlQU2x5?=
 =?utf-8?B?c0dNRDMxVVRFYXRBZDhHUEVLTUJvU2hjVDlxZEw5TUFVL1dWbHgrcUVpK3RT?=
 =?utf-8?Q?owWRbY?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0c13df20cb4f47739527585b6bc5c8ea:solidrun,office365_emails,sent,inline:af0d6bc8e97772f40903536e75100953
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ce926def-1fa5-4900-60af-08de30da9976
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|7416014|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3JJMGtVNFRMSElOYTVyYVJIYzRVeTRLRkdBZ1k2cGpMZjUzMFdTRnRIU3Nx?=
 =?utf-8?B?djlKQi9Od2U5dVpFaTJmdFJpRnNBVFlwTUtEWG9lYXl3aDBZaEJnSDNlOVBr?=
 =?utf-8?B?N25tektONUlsL05uWENtTVRUZ3hvbmNjcnhkbTFaaldENCtxbnE5M1pEMUtF?=
 =?utf-8?B?YkI3dVRxSFpSVmtUYlhrcTRTYzBsUzlPZzQzSmVCN0NIeGZOcXk2UTd6YWtC?=
 =?utf-8?B?bnZSVG1ubVVZMjhNZEJZc21BYW45ZTNRSXZWaTMzWXlOZDJQNlc1elJ1Sk1u?=
 =?utf-8?B?RlhJMnR2MXB6T0pLd2QxOWdyQjFVbE9Ydkc0dm1NZGZBYkVqVTg1Y3QveU1u?=
 =?utf-8?B?RTFnTmNCR0s2Q3hFWlp3MnkwOFV0Tnp2N3RndkJjRUxYQnlORERvRGNsYkI2?=
 =?utf-8?B?VmRXMXcwL21HVThFQk5sUXZERlo3RG1LQ2FPT2tSYW9KMVRzeDhsM3ZCRnVy?=
 =?utf-8?B?SXIraG9UYXVyVWR4eGRzNFp4RG94WFlKNThyYmRUWWY1RUViMmY4REtibG1G?=
 =?utf-8?B?bVF6bXFFdXFDUlQySE01S3V0NGVqdVNFN3c1b2VydzFCdGZZWDg2MzlpanhL?=
 =?utf-8?B?SCt0d2QveTlMUnRseDJLNko5b3NDQnBkTnFhZWlGSk5aWE5BK1BoK1l3WG13?=
 =?utf-8?B?MklCZHRaeHA1eS9FY1JMUWg2YUZELzd3NTBOL1RMMHQ5aWhIcThPb0dLbUJ1?=
 =?utf-8?B?MnRQNnliY2IwWVlnN2IvRGNXME54NUVXTm1EWVRjQ2NIVzNmeDE2TVVwME9G?=
 =?utf-8?B?c0NydEFmcHFDVElraVNkTkhSRCt2MCtoOTU5K0dtSlc2akI1LytsT0ZJY3hh?=
 =?utf-8?B?VWdlMVMyRzZpb1Q2b2hrSlBYM29OaTJ3Nkk0RWpzVEZ0b2hQNExNS0VjcjAv?=
 =?utf-8?B?V0l1cG1wa0RNZ2ErakVmay93N21SVnk2T3gzcDVVZWt1NjJQdjBCd0pBeXNB?=
 =?utf-8?B?ZVF0aDgrMGdHM1BPeG9pMVBNaVNTYVRtbWNsSStjc00xdlczWCswZWZOQ2du?=
 =?utf-8?B?RUlzYUhtNjNheExSajZBTi8rbDg4SlFTTDZyRStuVzJUdk9zY0JQbWlrcTZv?=
 =?utf-8?B?Y0ZyRDRkMnNXc0s2dlVjaGlhc3lzV2xLZ0VQTldLU3dGOFpQd0E1Yk5ETzRW?=
 =?utf-8?B?dHc2RTVnclFZTGZjU0tReHVSQnZ2eFhKU3NHL3RGTjc2a0NxbldhYWtMeGRw?=
 =?utf-8?B?UExMaUh2NlBYNm1EaVpGb210ZXFlUldBamRGZFhHUjIxTHZHbWxEbVl2WitD?=
 =?utf-8?B?N1dnTWVwa0hJN0RCc2ZhcWVRS0g0cEJLTk84OFZlQUI2cFdNOUNmQXNMRDR0?=
 =?utf-8?B?SEhPY2hqbW56MEJqUlJ5bGRJZG5jbVkxMDVFdld2b1JRODY0VW9CSHI0c0VN?=
 =?utf-8?B?VlBqd1NDOU9HRVpnVHBLMDdDMnRUclA1bW1lTFNpWVY2Wi9sVGNDMXhpVjZQ?=
 =?utf-8?B?Vnd5bmRyUEJJZWp2NDZjbU5rT3NXb3lDa1l6dzRrUmtNWm5XalNzMXdnbkk0?=
 =?utf-8?B?SENpU3NvejVQd2MrUEltbW1iZjY5SC94SXo3bEw5bFNlcG5SakllS0h3Q3Vp?=
 =?utf-8?B?MmRJUCtmS2Z0dHJySCtSME5RY3Z2RHpMMVJkejRYNlpyd0R1TU5HbERTQzVr?=
 =?utf-8?B?eXNvREczeVV1ejZEdzlhc1hZZ1VUMGUrMWQxZXNtYkkxK0tEQ1M3K3hnbjkr?=
 =?utf-8?B?czRSOUVkY01lNCtNMzRoOVdiNFlQM3pBYXFuSlYyamhrQ2o5cGhWVkdYczBP?=
 =?utf-8?B?WkpKYjRlVWlXaFlPVm5MWDN0R0ZkNkovaDlrelgvcU9vYTFUaExLM0NwQjF4?=
 =?utf-8?B?NFBDRm9kNExIc1RpUkFtOFhpZFRRZHFIME1ocUl0ajhZcUkvQ0x2OVBDMmFV?=
 =?utf-8?B?Nm9DUlA2cklJMSt5WmtJYVA1MHhWSlVyV1JFRnV6VWsyNTJiMENXbFB4Sm92?=
 =?utf-8?B?VHZzRmhaZVRiTG1VYmtzeXIwM3pBMnVmRWVqOWRSTGQwYmsvakdGb3hBWXlh?=
 =?utf-8?B?MGMzZnQwVHRidWx6Z2UyYS9pVUh1US9EdTduZ1ZjMmtNbGZXTW4vb2dCNGU1?=
 =?utf-8?B?QnZjMHYwVUY3VFNqYnVzSHVrSGtqTmpWRldhUU9wVGVBVWJxRGpRNUhVNTNy?=
 =?utf-8?Q?z+EQ=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(7416014)(376014)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:49.4266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dfe03b6-5f21-4877-456c-08de30daa120
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7729

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 525ef180481d3..8bda6fb0ff9c1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -207,9 +208,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.51.0



