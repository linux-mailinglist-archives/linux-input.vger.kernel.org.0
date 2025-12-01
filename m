Return-Path: <linux-input+bounces-16419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B5DC97825
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420343A5CE1
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:08:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C7E31195F;
	Mon,  1 Dec 2025 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CJULxqZ1";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="CJULxqZ1"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023137.outbound.protection.outlook.com [52.101.83.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A13101D4;
	Mon,  1 Dec 2025 13:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.137
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594473; cv=fail; b=SQEaAqQRI/YJ5aVeol6u0h85DCHcbYG1VMBMfK5ykI8lIEcogzGre98AK0bLLzJyMCwwm2rEvluLM6AmAzhi3a4JEj2Zg6UwpgulHTev7VpERYYAYjLgA/xP6WluV55F7YJuYvHs0YJzZIFNtKSYTI/zKUK2oQyI/70V1G0CfB8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594473; c=relaxed/simple;
	bh=Z3njgFyddjfigBHZ2KDXr+OIfb4wm8YJdOO3TF9Y5mg=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ZFKaBI0Mdq4h6fL0ncsQyYPPpBSL4+2G6Ua6oMF2eXHyFfeDM2a6QJqpKG157pmuQy3IgxU8QeYh7LWVHuBxz64ul3AXPvZNLSbH+kC+mf3qHuV9yMHSA43WKx2U5rY33MMy2Ikd1tppPXZQ5ahnlosaIa9CwaF7iVfd/maAWks=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=CJULxqZ1; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=CJULxqZ1; arc=fail smtp.client-ip=52.101.83.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yw7MCsqDVZmvbfQShVKXyoro/MT5hWyrcSxvBWAPODSprzE0ZhhT1pnV9lCpLDVicaU14AZIaDg1W4aw3KsqCPThP1aRjOqxIHIzXAhbMKLunNZK8M9VUiSME7noZ0S1MwG7Um1BOHeP4bd5a0Ne6/DMrq9XEz1Ku2ZEFx9dHIkgul5RWatbAyo7CbNPf+0EYW5iKS/Ts9QyGkxI+9lPKA48Zh/OxwQ3aZtbYCn9A0xSAdKfXkTRvBuxayw5DrCbWb7HHJdHQSkj/IOw42bFimkeHl0yWhDp0Wm5iuNjLVPDstGjVG0HEyj+B85gB1NSo1d637J30m8GmLo3qus9mg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAZ5dJEtZSVvbMMskDbmtZ8VnTWzP8zYx1fLc3tjHHQ=;
 b=bS3xB0wP/zrOOHctqFeZNk3d7TjrdJykwYAT8wDp/4+HXtp0rcQft5UoqFC7H2giWB59Blr6Ju4ox9V+C9xj/kHsPOAt0YuO7KGnx9IpqDAO9lrQ5Y3LBgKCiJwDzQFh4EHS8OOYr4sns8mAdrgkCGlU7IfB+RP8YH6uY++D5NQ7lwsASCTYo0uYLpsNY0GTjI/QA1JyjqGALkGqIpEwO2Im2A/cQoCJpa51nUSg4i+NQ5DtLYTku3k2JZlDcc+DihcZFPHCb+EZfF+4OAPw4QNZ5eA9ZrEqiYkxw5e7pA80PGRzFZA5libHzaPsPI2RN/ppBKVtGcA0t1FbUNx5PA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAZ5dJEtZSVvbMMskDbmtZ8VnTWzP8zYx1fLc3tjHHQ=;
 b=CJULxqZ1TaBC3NOjIXdmSOgRZvY9S5QC2n3iB2VBIL95NRYu1zVMPr4TrU96UvxouzrLYmfFI4Ctm3A53Ez3p2sKdQCvyjmEMdS1pJDZuKQak/N7XgHWhZMzoeGOTEbnwbROMQ64WgnlnncArHOwr1rPE4biKJQa/A9aymQFaH8=
Received: from AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::15)
 by GVXPR04MB9994.eurprd04.prod.outlook.com (2603:10a6:150:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:46 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::1b) by AS4PR10CA0023.outlook.office365.com
 (2603:10a6:20b:5d8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 13:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 13:07:46 +0000
Received: from emails-8290778-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id ED81B8011E;
	Mon,  1 Dec 2025 13:07:45 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764594465; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=hAZ5dJEtZSVvbMMskDbmtZ8VnTWzP8zYx1fLc3tjHHQ=;
 b=NlaCGGtpngw30JCjEdT+wjiJKznRAFW1OF7nAfkhp6W9GXsVva59CjIUClvE0Sw5Nin0v
 HJis5g59TG934sM6jyo6W4k1kIkcjNqiGqI4N1rGVHLWLRcFcZ9qZp+AGtlelxCzRF3d2wd
 L39GhBaQLjpq3a77Dze8hEIlzLBlbRM=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764594465;
 b=foYMQpi2U4qL1umvlpQcsZ7EXGqUc+TpMjR+HO4dIxuL7GBd8g4Cpm/rm1oNxIqmsONJX
 Uis+Bkj7ghNELqP03XHn+Lmx2mWBTXE5ROKlhdsLiqQINUhHGm6sQTEB0GUYr6omTJ6E7oT
 avLvGIt1HqUZXGVBmAz0VEHSTv9AHsU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YU5QoOGN9iJL0OteaHp/hezAb7ML1BjPmRtww7Gg2JAvQAuX6vLbYemxJbWdBaAP7islwrkvMNKW0fGrSm5uzAGl4F3jhjgfDAg+wCeJArq3HDGPRe/XfZkdEmWUPjEAGTzmPH3G+D8a2aAwzGSUmIh/ZHzaXlAeJ/OhIpQ9oxBQrzIAALJcLNpW6Vt0cEGCaUdCPZatOTETdv+FMG2adgsG0pf3eB68BSuVpUaNOMNr9mDk+sPkdyAFufi6xivWseOqAozmfLzPECZ5x2whdSrgq4HeS9Gfo0l0rwhkj8xvdSmjUJuqUeqp6pHon4hbXTUWXGA65Hv7QFamjcajjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAZ5dJEtZSVvbMMskDbmtZ8VnTWzP8zYx1fLc3tjHHQ=;
 b=PaBJsRXg3SW8FKFZfH2ASybD+t7jvWKY6Xb0D8C0eqm3NeU227zL/VwrPgD/iEbmbfT47h2g0/61dxQzdGjO2zsJgkD0ZsS/X4fgtonhDJ/IvPsw3cpY8cRQSFvnubmG94CfuCgzGPkrGxAr3SV6WZ9jvc+h57JcEIEVF0h3XiLCi8AL6zpwCq4Ap8rj8sSv6MclNy23vYyYfyFU9P48OMTagV7c6BVAqsEcT4u7cmd1jbfm93/i4ID8zTDSW7PVJgT0zEFXImFDGkPPce1+fN6O3CaZIMXLuQN/JK4PeE/nJa9fq+sAvLQETo+gmtGXMZInh9iYs9Q/01AcgnAS+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAZ5dJEtZSVvbMMskDbmtZ8VnTWzP8zYx1fLc3tjHHQ=;
 b=CJULxqZ1TaBC3NOjIXdmSOgRZvY9S5QC2n3iB2VBIL95NRYu1zVMPr4TrU96UvxouzrLYmfFI4Ctm3A53Ez3p2sKdQCvyjmEMdS1pJDZuKQak/N7XgHWhZMzoeGOTEbnwbROMQ64WgnlnncArHOwr1rPE4biKJQa/A9aymQFaH8=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB8844.eurprd04.prod.outlook.com (2603:10a6:20b:40b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:07:33 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:07:33 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v4 0/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Mon, 01 Dec 2025 14:07:19 +0100
Message-Id: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAeTLWkC/23M3QqCMBjG8VuRHbfYh9PZUfcRHah7ly+kk83EE
 O+9KUSRHf4feH4zCeARAjklM/EwYkDXxUgPCambsrsBRRObCCYUZyKj2E667WlTUUQ3UCVUxWQ
 FUGaCxFPvweK0gZdr7AbD4Pxz80e+rm8q/6VGThnNtLQ6kyrXXJ+Du6Oh/tEda9eSlRvFh+BsT
 4hIGC2kNGCKooB/hPwi+J6QkagsL9PaKlvqHbEsywvOLxVLNgEAAA==
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
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
 Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	PAXPR04MB8749:EE_|AM9PR04MB8844:EE_|AM3PEPF0000A792:EE_|GVXPR04MB9994:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c218b6-3b69-45c6-88f8-08de30da9f13
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y3ZRZGx2S0tMN3hwNlV5MEhZWU5xQ3pZVmF5Y0NlR1VUY1lBZmJodEhRbTlO?=
 =?utf-8?B?TGtjcVpMa043bitCNkYzT3dsZHVRdHB0Qi9sVlk4RG03VmlkRDl5R3ZWd3B3?=
 =?utf-8?B?WENpRFFtS0xiVGxzaDBZQ0crQTVVMzVGbjVOU3dXRjV0aUx1SWtodGxxVW9T?=
 =?utf-8?B?RzRPdUd0NlVpNGVBUHV4eWs4STBydnA1dVlwclNlVU9EcmQxWE00RzhDdWNw?=
 =?utf-8?B?Tnc3RGRGUHd6b0Q3bFpwN3gra21aTnVsNlRsZjVGNU5hQ0hqRGkzcS9HbHNs?=
 =?utf-8?B?NEhqSjJ5VVNTSjh4eFdWU0dvU0xKaEZEUk5VeUlWWnJVSC9rdm1MZHpnSllw?=
 =?utf-8?B?V0dnK1FDZllvNjdPdU5sb1hOS01XaGVsN205S2JTeVBYdmpFUlFRdi8xMHNM?=
 =?utf-8?B?Tk41SXhLWEVSQytTWlVnN0V3K04zNXl6SDIwYlpyZlVjUkpDK2owL2JRK2Vy?=
 =?utf-8?B?MmtlRnh4c2pmcllMWXpZeTVEc2dLUURmWlNqa3o1VElHQWdtbmEwRHE1L2wv?=
 =?utf-8?B?QkR3THdyb3IyNXpzK1BLamNJa2RIMEdyQnFraE9Eb29ocGdiUTY1M1l5SVhj?=
 =?utf-8?B?djRqSFNkNUY4QVV4aytEQmMvVlBaNEorWm9QaFlBanNVUTdoR1VEL0tCdFYv?=
 =?utf-8?B?TWtjUUdNSzNCQlFtVEthYWpOYzVkaEpsclhaMjZZYWhycmRzNXFPYURER2VN?=
 =?utf-8?B?SWxmNUFFR2JqMHBlR2JTSldpaGxkUW8rQmp5eGZZRGNqL3VmYzdLT0pjOWpO?=
 =?utf-8?B?amwrRGRFSEZxQUJTMmtXdnhSbmh6TWxxSVZIcXRwcEZsM25Ob29TUGdkUHE3?=
 =?utf-8?B?UFVGQWU4QlZlRGRxV1FLTjNwaDBJbVFZdzR4cjBBaHNUVGljNnArTU1ldW1Z?=
 =?utf-8?B?Yk5EdXQzUlNOQzdTNXdITHhLcC9ZaHBKT09UUTZKYU5HbExVQTdMWStjTzlD?=
 =?utf-8?B?RFAyVGoyZHhOdEYwWVZJU3lPaGZwM3BWSzd5d3poRGV1QzBiQjZGdEQvVWZG?=
 =?utf-8?B?dXlOZFRKbUsxRzVIc1A4UjNvWjBReUh1T1dOc1ZjQVNwK0xYU3BSbzBsYkJm?=
 =?utf-8?B?Q2tQcnQ2SXN6Wk03emF5RnI0bEtVS29EaWZJclB0Z1g1V2ZoS00yRTRmcUZI?=
 =?utf-8?B?U0JZRHAyUmEzTFNRYUtBbmgrZnp1dXlXQ2crUDk2cCtPQ3JTRXZ4NmdhTWpR?=
 =?utf-8?B?SzBPdGZLYTVHYWFITTA4TkN4V3NFM3RJNU9INU5rWG41eVF3WnpSV0FBZEJU?=
 =?utf-8?B?S2UvVHJpbnBRTVRDZDIyRzROcjZmL0dRU0Vka1NKUzBNejhhTlczSGlpakdo?=
 =?utf-8?B?eTRndDQ5cDNxTVlNM3FqbElvN1ZIWDJ2NGtMditrb0FjNzRxcDViOGFhaGZK?=
 =?utf-8?B?S1RFbEEwSG9DWVpYamVXUGhuWlRTZ1dibGl0MWg5ODdvaW5jaUl2ZHNYdFZT?=
 =?utf-8?B?ZFVHWHJsbWRmV1A1Y3kxT2NrUEVPVCtLaHNOcmNKRVBwWE9rVTRObG8xSjdB?=
 =?utf-8?B?RnhMVk1GUFlXdkx1U3NLSkZqeXE5M2V2cGdNQUk4SjFsdnlWWFBJRTg5VkZo?=
 =?utf-8?B?SytJWlhENnpCRTU4R2R3V0JCQTlQNHNZYzJVNmViSUZ4VHI0amlnM0Q5ZTFt?=
 =?utf-8?B?U3ZZaExkMk1lMWJSUisvWlRLSHZ0blV6NkRkanJaU0Njc1U3eEgvQ1BydE9R?=
 =?utf-8?B?RHhsSzJRVjhyUE11bTVqTU4rKzQ3QUx4U2NXeGYwaHRBMUZCYkdRdGtZYXIx?=
 =?utf-8?B?aWl0UzJ1c0pocUJhOW83TkozNFFxNmhhem5tS3M1V1hmRTlRc0lIWWZHNFQy?=
 =?utf-8?B?bENSdzRra3pUN2lkb1ZjWlVEbFk2SFVvbjZ4WElGNjRLMVVRYVAzdG4wRTFT?=
 =?utf-8?B?MFBqMFREa1hQRHdIRWgxRkh3VTdrV25lbnYrcVRtOHVpY1lsUVhRNEJ4K01n?=
 =?utf-8?B?Q2NIVUJhbm90eEUwbmNxRThBZlNuVWdzVHprbGMwSDlGYVNsai9aV08wMHIy?=
 =?utf-8?B?WEV1eHNWdkUycGp0ckhCUStaZUE4V1JFcVZtUDduYjNhVlR2alJiY0t0aXJH?=
 =?utf-8?Q?wSGKei?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8844
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: dcab7fa4afea4fc88020e73865f2ab7e:solidrun,office365_emails,sent,inline:3dddf60ed263c9f7447a0163c84f5031
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17cbe087-556f-4d4c-83b3-08de30da9788
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|14060799003|35042699022|1800799024|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TzF6T2g5RUxYUWpTWi9ZWWUrUWpiL1QrMFVFNm5WVXhSRU5vK2xnMnpVckRU?=
 =?utf-8?B?Q3dadjVwZnpFRTVHdjVGNkV0QzN5VXl3SEV3SlNkNldsTHdKZkp6STl4UWty?=
 =?utf-8?B?bzVtSUhsYXRTWi9YazJ6MVdlTHJEUFFVUWNSV1p0bEpNN0lIUjBLTmp0eTZR?=
 =?utf-8?B?VS8xQzc0OUF6RWpid1pwdHVCOHZvZm1NNEV2NjZ0U3V0b3hZNnVLUlBVYWs3?=
 =?utf-8?B?a1ZmbG5NUlA5L0t5SC9RTnV2ZVIzOVRtWTJyYmpnMEx3NlYxU0RxT21nQ2M2?=
 =?utf-8?B?azdGRGdoOG14L2tYMGw5K21MdzJMUGcvNVl2NFdOcmpFUXFDNXFjeEliN2VG?=
 =?utf-8?B?dkZSTmNmdjV5Z2pNcWFuRzc0eFhmNWwzMVF6ZzQrTVVRWndROEZVYm53dmZ2?=
 =?utf-8?B?eGVpNHF0U3ZkVTlJS3J4R3VvYzFic25leHY1Ui9lQTBZalMyWStnNFQ2MzVN?=
 =?utf-8?B?REx5blFWT3BhakJwekZ1Z0VMRjRpQ21GcGVPMGRIbXN6Z3E5eTJZWmE3eWcx?=
 =?utf-8?B?c2dlL2NWN2ZSMXhIeHM2V0dHMUtYcEU2SS9yREhDMWYvRVRicUFtdjRGMGJz?=
 =?utf-8?B?eDh2RkFYc0JOV0FQM0Y2c0hPRmdqOHBiZGxVQWhZdHF4YXB2OFBGVFpybE4r?=
 =?utf-8?B?WFVHWlRvK1hSNnNRWlNldFVNQnQ4aS91VlVkay84T1ZBS1dVRU1YMngrMUc3?=
 =?utf-8?B?ODU0cUx1Y0pNajJvQTNSbTBsUjBhOEdLWGF4V0g2WlJvc2xuOTR5Zm1JOEx4?=
 =?utf-8?B?UGlrbmZFcjl4NEhIbzcyZDZhZXJpM2NZZkkzbEJYN0pCazdUNUpsY2VwK2hm?=
 =?utf-8?B?RzRQM25oZ01FeW9nMExHaWdvVWJMT2tWOXN2eXFjRnZZeVJZVWx5eS9IUk9H?=
 =?utf-8?B?VEhJWm1nVDlxbmZ2UmpENVNwOGVoRElLYWtnR1RrMnlMcG1ncC8vMUJLQ0pT?=
 =?utf-8?B?azhPQzBnNVJwVDNMQkphclJUSXlha3JiVkJwTkd1UVpMRW1SYlpZTE1WNjd4?=
 =?utf-8?B?QWhrdDVrVVVCbG41Zko3MHpoYldoWTIxR3ZWQjAxaUZ1YVBWaUtoNWN1OXI4?=
 =?utf-8?B?ZE9vc3NMdkZzTTVVNy9abXpHSHEwbTRNV2g4RnBXZ2M1UXR3R296VnlJRDFo?=
 =?utf-8?B?ZFd3MmpCRStrSmdVRHhITHdBRjNBUUJpZmJ0Mmx6dVc5Z1UwcVVpemhrS3NS?=
 =?utf-8?B?V0lqc3BrbVlDdXhPeVVhWUZ3MXluZ3BnWFNZdW11QWpjbGxiUzUwU01hNlVu?=
 =?utf-8?B?aU1nQmRFQXA1NHN0bkxvdVFLLzcrd0tpZzJydkZjQzdEQVJBWUxRWTdiNkoy?=
 =?utf-8?B?czNic2lPTVFqWTk0U1drd1krTzlZR0dLeHNnUlMxdmVzcGo2WkIvek5BU0V2?=
 =?utf-8?B?YjExSE42YVJUbmxQeFc0RFNOczZuNFdBTmU3dVZNNXF1ZmtzVlFHWG41Rjhz?=
 =?utf-8?B?cHBoeUZBRDdDUGZPT3FuMGNORzFMQ2RuaEtyRlhiY0dyRUYzUUkrWHVKZ3px?=
 =?utf-8?B?VXUreHhXSU5hWDU1RTNJK2hhUWxhQW14M3kreXJWekt1Nlg1aGxsdEgwZlNl?=
 =?utf-8?B?M01xVHF5TVdadm9FanJZK1QzaW1EL01SaVlKd3VEeUdwejdRSzYyUjhzWGt2?=
 =?utf-8?B?OGFIOUlWNWpkNzA4K0p4dmV6WVBGZWZSbElEOHZTOUlrbFg0UXowTnAxU1JO?=
 =?utf-8?B?MWZ2U0lqWTJrTTFRTS94OE1QeW52Z0lyM3EzV2hTdnpEMERlcnFhcGJNdkd3?=
 =?utf-8?B?T3JXNm04OXpzTHZlVHNwTE9QZjJJQjhvVm0rVkY4eEtPdkQ5U09GNEhvOFNq?=
 =?utf-8?B?aGI0NVFFblZHUm5DQzVBeVpaZVdNNWc0UWQ1RHBHanZtUlNkRzJEcG5XQXhT?=
 =?utf-8?B?NFRoajV6bjhyblpyWnlZVkZaWWNqSTZ1dk1peEZUWUhnWG5POGcreTd3UTNy?=
 =?utf-8?B?VG4zeGhyb1F0M3JYd2pFc3ExcHVzdHA1cGZla3A1UDZtU1BoU0lmN1FjNUUz?=
 =?utf-8?B?ZXVTeGdmcUhJODRlQXFNUGRIMjVJK1F1aEt6cXhDNXVaZHJ0dys3R3hNTnFX?=
 =?utf-8?B?Mjg2dnV0bUNUdWg2c3dZZ2NzOXhKR2poL0liTnc3Z09ORlBzalN6YThHZkFV?=
 =?utf-8?Q?vkwQ=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(14060799003)(35042699022)(1800799024)(82310400026)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 13:07:46.2038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c218b6-3b69-45c6-88f8-08de30da9f13
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9994

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v4:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (8):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      Input: ilitek_ts_i2c: fix warning with gpio controllers that sleep
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 395 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 853 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 713 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 drivers/input/touchscreen/ilitek_ts_i2c.c          |   8 +-
 14 files changed, 2540 insertions(+), 13 deletions(-)
---
base-commit: 45a477d545205afbb4753a4a3371a16136ded2d1
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>



