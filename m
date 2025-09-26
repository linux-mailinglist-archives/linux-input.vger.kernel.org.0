Return-Path: <linux-input+bounces-15130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D3BA4ED3
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 20:47:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47A073AF029
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 18:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27EE30CDAB;
	Fri, 26 Sep 2025 18:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aAB84x5g"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011021.outbound.protection.outlook.com [52.101.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59327B342;
	Fri, 26 Sep 2025 18:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758912468; cv=fail; b=JPrz65LRxV/HpsL3m3/JwSpkq8zMof0xCq1WXMmdmJVSfRPTqAAuY66pBWIgUVC0MOD4YLXEEy/89tcEVXCAtA8vvqGxrdF0xZGcQA5aRDijyQFGkwxvaFcFkanMViRcYXicgaqABFNsSo8Xr1kjVd0nQ3SHP+mhxrJHZBHmPWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758912468; c=relaxed/simple;
	bh=+su33VC9c5UlhKiJPRqBflz0b+Zx83bFvjFb0V27X9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l8SaNB+V6dpaXLxaUH4nIRgPyNZNkl7HVMwb543WwOb/B41QjZrHpOrjq9O9Y9CM/e9gH5NmTMf6HV14VcEuNffK36nGXLPPLJcScTCz6GMuxXfAVbYEVA7BQONfgg6KmfByowkwFklRoIFFbrD4QGzsTK8DrEPqz7m2nXOeEGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aAB84x5g; arc=fail smtp.client-ip=52.101.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXQz3nDcOsdv8I005i6w+E331hrO9T0ELvb/NJjjAd7cwxQcOLso3s5z6Co6eleEnZvmyo8w3q/edoCniYlOgGet7GeL2JsFnRjDlqysiVvaDDMjsEplC4qsno8lbaX8r4f4F5XkTIuikbGvHkT2ZdUYWMPRWK68Q4UO3wH2hjIiER22ZV9GE09HoD+qUxdippjzcXDmeVemnUInub9izXzdcMTSzSoaaIjMMPxgO7uUB7D+KvF5Jk+W7ixmfCRJJM9zSyip85gzaRrBO9mMDmlbXyz9bS2tRNdyhXDfz3Sg+BXxNV06VbZWm82iTV/IwZgh8MLB5q1tmnzZL+ZR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K71vqHP3Bu6UL8ytWH1b2+ogxcfHpagaDtRtLkit58M=;
 b=c4Cje6BBSLjq91wJdY/NOPbQXYTyMJHcEF5nhRhmg45eJj0L3D1SVCweROOEUYjv3JcclETK3wzZJvGF1cqOgYafK+KmWMCql5eSm1/kSVdlL93XNvGdu5YESy01h2xPDUKC26CVjH+917kVemG2zyvcjf7VrME3FhHb1hZsUl5tqv8CByK56hs9MT9sB1NEMNfX0htm3RnvGJ1ZoOqaRd0mcF9WzHJ5U2vZbe9awuQJFhmJsLx38CFTej+D7CMWmppA4AGVtoaQWVZuTOiN+At5AK6k8Oken0mks4y4uZtzttaPtkc7lZxRiN63wQoHUGb3H4LLjJ2RrAloNmtmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K71vqHP3Bu6UL8ytWH1b2+ogxcfHpagaDtRtLkit58M=;
 b=aAB84x5gBabMpdCOq2+ayZyUAP+/HhZhoe82r9n2j+Jmm5tkxhagKPQJQdWlP6ejSFWaXSNrxmydDdZODGQXTnL03WwNLmfxz43Xa30fXrU2HbVT98XT+lzTnjV3V7P0Ymn3bvWBYObkQiBawV6zcNRz8gOvBG8Pz7pHnMIvb7LCnX4IRzM+Cm/Nmjp8YAXcCbCnLp7jZlneiMIeyBwsnNEYVFfXDbXv86Pl7cvaOzly8IWe+++78uRDqy21pA8EvKUMJkQDT7BURIm81NQYYAzkXGKgxL1K3WkvUxY22vhmhzRsY7aTXJZiurj6ykH4KbXevNrzVkKSEDUbDAN9dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 18:47:43 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 18:47:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to trivial-touch.yaml
Date: Fri, 26 Sep 2025 14:47:12 -0400
Message-Id: <20250926184720.391335-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926184720.391335-1-Frank.Li@nxp.com>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdf6d6f-cc73-418e-e779-08ddfd2d2d37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?twf05J4NUJhs8EQL6uxiga+9pHrffZ/wKAGVMoZkLmD5oOomN1S8snqnQYJf?=
 =?us-ascii?Q?AbeM28kvxih85BW0XyHpgLD3vRm2cUwSVkswVU3wYpA3GeiXDPz0Syby+Lzu?=
 =?us-ascii?Q?qXpN6+VdjnQErIQ+wdnqESevNm5a/R7RGKlFfjmxrylWfDNOqgZgtdwj1KJ4?=
 =?us-ascii?Q?u5wvIToM3zxkgQ2GN142Qa7AiVjasGGKIl4gHTbEG/T9xR8ykiTUtEbRHPDA?=
 =?us-ascii?Q?zX44Yty4dOuRseVdd8rzfZHzOwd7vMLy3yezbsZs75hssQLxILijsEgX6ujf?=
 =?us-ascii?Q?V/AaRqdqMDZJjqHX6DMT8cdfFg+CIGJQRZobvWwvG3ghqoG/oPdUbU4+Q7kv?=
 =?us-ascii?Q?RzZEX/88uGl74kaCX8GcFDhB2VlQWud1Uz5VwxWTNcDy0AP2Ryt1kul5efXK?=
 =?us-ascii?Q?k5ig9TxTiIcW6dB/AJY4LHL4YGXLQbn4NMcT/lVgZaZKQWHutWtRSsEYYAFX?=
 =?us-ascii?Q?tRormabETsFtHD7MpxfF0ytvfhtqpObp/3SPJZ7dXs7yV/5S5OXKX3GV9a+2?=
 =?us-ascii?Q?UgttYyGfCiu8ayyKDXWHeBKZ8LR+dzdTYdoV/EQ6yd1UB7qMX2qSPs4Efdte?=
 =?us-ascii?Q?E5V3dl7t4mePcGfbRvh3yPJyb1W0Ow1zoRHa84pS3C3d13Q2BiX+TjQE4yNz?=
 =?us-ascii?Q?kaDoidTTlWiOYEr+CYQNv/OAA1pJ9JsNcwSR0SVz6Z0UFhkpf/ssWB60SgOq?=
 =?us-ascii?Q?5B9ZX8X/yBR59jV16JRp8HDpLRZB2r6mzG48uxsLpYp5HnWJ/WraKQPMq7Ws?=
 =?us-ascii?Q?T74euQ+h2kuxQLS3QN5bLuNEbNupSRHfuxmDFyY8QZArHPGKU7K8OaT3NCX2?=
 =?us-ascii?Q?V6NuORA0CAupIzfGuFB2HMfb1klW8H0LcyYGFnNAhDuKxRMKtBa2yyoYT/JW?=
 =?us-ascii?Q?B7WnwMv3+3iZ/gX75bmQg0ruZU2xQRBABZUlE/CAjzb3ZQT701PkXO65BJq1?=
 =?us-ascii?Q?DDkEGoAmr+zOHD6nGx0G+/8Kpqugxy2B2SnfIY1kUWw3mYwKFQRp9y36KFwl?=
 =?us-ascii?Q?s1KCWjae7tqFPqW8ufGAhR00fki4Q6AqY8wJxWE/6L65tINAJqlbaOSaBG73?=
 =?us-ascii?Q?pKQpbljh0LZrWpd37ufV+/n2bHXiNDCQHMD9DMFgaSqHBT0PeS4LmWFpnyPs?=
 =?us-ascii?Q?k8Iya+yjScfTiimCudYswqZysZiIHvWvENZgnW87SHqcjodqtyhT+Yq0iGlE?=
 =?us-ascii?Q?pfi4tu64waH+ji335tAHHFi5GCIY/sPLA+b1U4MnGtYT0jh9KJurBFndlO3L?=
 =?us-ascii?Q?kzXKRpOzFq/eOVQSUrm8D6MTZbQyb0NdkG7V+YhQMcLPq8mupzPYSimhgQ8D?=
 =?us-ascii?Q?3utVUYGYsx+s7ex1c4d0MEYHPbwGam33K44vGqjx49EObTWm94lgBOeYhtuh?=
 =?us-ascii?Q?0OQTucefGKcOtJe0sXZ9FKLGItyBxLz6dmIkSey3QhozTn7rEobvNzrVSxC2?=
 =?us-ascii?Q?y3AEyvR2B1fe0eJqr37hZyvG+FEZqJGiKppA+dpAW3absRsjIRrDxnUue9N7?=
 =?us-ascii?Q?yYNjxhPB/0IkBC8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9npnMry8Lxx4fsffSiPaBPxucOp1+6gS/OQR+lElrU9q4/rCS4yk53s5Nvji?=
 =?us-ascii?Q?ZUiHZvzzt3er8nlz0WACk6P1sL4/D3ARzshzGrqLCAc+2KWVZrQpUqglbvuH?=
 =?us-ascii?Q?Tm+DwgNcgLuynnQRQ2lnQuywkMJ080O4O9fEBzrhiZnVTxOa886uOCHB8CrD?=
 =?us-ascii?Q?xuyONeLSyfWZArfg+llV6V6yPrZMZsBsiBkVOEdIk0SEJQVL6CSWM1Cv6rDY?=
 =?us-ascii?Q?fIeXDoBEMzSSb4ucViwHTC17n5M+b3l5LT4gIDM6/RYXfomoqNT6c2w5kSAk?=
 =?us-ascii?Q?cxjrYrj1acuLFc1EvbXUr5SF8pDkqjCwGICHFV0U22ms4DgUfWsX2U4NvJXm?=
 =?us-ascii?Q?c1TXMzNDOui5QUzSmnwnnoLqkEj3AdX+QVRZSHzXLLocsmqM6ZnusY/iSUdb?=
 =?us-ascii?Q?/UMfLdiAm+irmLppYndfUx9GOc+S6ph/5+sPJaEQxPd+lwd7E2E+hiQC7+d7?=
 =?us-ascii?Q?USB/8uNzP2jKyFubjOJP3s7nxo/HgtAHVnpjfwhvBLSzhMgfI80ugUoiPfFo?=
 =?us-ascii?Q?XYNmIPFpbpUh6+/HjrEY1FtUdDsL9+1yqT7gVWHAA3c1+jLP72HT8kqxIyaz?=
 =?us-ascii?Q?EBb3ohggYHoJ60uHUHfLXO81rwR9sKSCpn5rr8MjUlr1oBALSQ2E4+IcYE4r?=
 =?us-ascii?Q?zEKvNm6mzmdKp2BoZvU/Imv3qjnEjhIAj9b/VUxiFCY5QayLS+lymYcayIAW?=
 =?us-ascii?Q?Zg98xs68p1sWOy6LagK/wHjqKRAJfKgJ5dveX5X+WvRtunhC0L/1ESZ/3e6+?=
 =?us-ascii?Q?/AD2MNnFGvsflCLNaLojlak4dE7NPrwgBgPMG5Tm/KzOCdhYFYnF119PV6Nq?=
 =?us-ascii?Q?CEv9gHjASbUSdlSDUK1gWlGDiS4z5srjjUuAxraBTNaTXNLSWlMjHu5lqu7A?=
 =?us-ascii?Q?Cq0VIALM4w+q70bpKrrlAQ2cUgAxZpTgEyW1VofaWFWP70beoeYVFFnCgayU?=
 =?us-ascii?Q?Rd/rIzSi9WW3JyiJbMO0oGx3/0jUd6NJs2f6n8n0ZWkg9sDR44q/7PWJz4F5?=
 =?us-ascii?Q?mIknmqw8Na2yLwk6ol/kmI2DUBIjWPc+/vjUgv1xcL6HbotPIE3aaBR4Grw7?=
 =?us-ascii?Q?EWL3EC5Eg016MfANwebfLHeF4SDQb8PWEdvFyJ97A9+v9GHzPiccxUZYv/8b?=
 =?us-ascii?Q?NMnZUxpqMUspAA+MHKNpvvBgAZsPHhByZR1LTbeI/k1k8Jl5FV6N70CYDs5T?=
 =?us-ascii?Q?CZz9nJMUkW5kluOlNAlpbB/U39W8jnvVp7Dn/cXIZay41yd0rfjN4kaiK+Mo?=
 =?us-ascii?Q?alQfNoslV4Nr9/hSMu9qLIknN+X6oU8Q87A5ptR6RFUiokvZG/qWR+MBR42i?=
 =?us-ascii?Q?8R3bjB11+NVqKpUZa+eUKZa9nKifGZYPDFhj6C9yonUycPJg53RnR8eAwCie?=
 =?us-ascii?Q?P8QGscgghwnQMwcRogh4z/3mlyBKj9skc68c1s3lItB0/JRd7LB5e1HjPBAd?=
 =?us-ascii?Q?0iVmnOtsz0pJIUV0i1F1R4E7PFQIutZmiPXmc10NpTr63+BEPShSEqUjx+i8?=
 =?us-ascii?Q?Befjxo3FPdyqM7vSFJA7a2UG6hcU7SsFCNA/H/HOBolkgu9YQvAK5amQ7r5E?=
 =?us-ascii?Q?NSMWcZTrWltoXyjbR4SPddr2OoZvjOlp0bazlZ6M?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdf6d6f-cc73-418e-e779-08ddfd2d2d37
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:47:43.2426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv35uoowGphqvH5nhK2aOG84jWu1x7+dTp+JbLLNB11DXQpDdhiPE01Ug0JSBL2awOHx2V8ZmfnMxu/BUTuDvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925

ar1021 have only reg and interrupts property beside touch common
properties. So move context of ar1021.txt into trivial-touch.yaml.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
 move to trivial-touch.yaml

previous discussion
    https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
---
 .../bindings/input/touchscreen/ar1021.txt         | 15 ---------------
 .../bindings/input/touchscreen/trivial-touch.yaml |  2 ++
 2 files changed, 2 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
deleted file mode 100644
index 82019bd6094ee..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Microchip AR1020 and AR1021 touchscreen interface (I2C)
-
-Required properties:
-- compatible		: "microchip,ar1021-i2c"
-- reg			: I2C slave address
-- interrupts		: touch controller interrupt
-
-Example:
-
-	touchscreen@4d {
-		compatible = "microchip,ar1021-i2c";
-		reg = <0x4d>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index c393cce273c5b..d6aed3afd4acb 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       # MAXI MAX11801 Resistive touch screen controller with i2c interface
       - maxim,max11801
+      # Microchip AR1020 and AR1021 touchscreen interface (I2C)
+      - microchip,ar1021-i2c
 
   reg:
     maxItems: 1
-- 
2.34.1


