Return-Path: <linux-input+bounces-13011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4874AE7055
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 22:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FB3417CBFC
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 20:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5466B2DAFC8;
	Tue, 24 Jun 2025 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CPjdurwR"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960B2550D3;
	Tue, 24 Jun 2025 20:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795635; cv=fail; b=PzzPtfp6srVBi0O8TMz8QGBn0NLRtstBdS3DUQXx9TCF1RSb+mSF/5y7M+gU42tXp9daFFtHoFOrMoM4s2xHahkFSrwzZo5CjtFQKkCTbJfQaX08QgKzpOCEvJ+COLJ++17wYETMi/fWfQB/y6+6MrrjDaP4qED36pPDsywiAVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795635; c=relaxed/simple;
	bh=vLV+S1vNasjNi59D75SkRIVSNlqSeYSo70oD2e7AYJo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Yum7i7Y7K6NDaKIjNE12brpbA4P14ljI30mkbqxbdnOXb6JX/fyZoS3yDPAkEgZOyxSx2/BYygvBQcJo44os3F+bVuv7CQ16lze8ZbQgFaxlQ66Bejf7nY1q1mYPRuknGnW6Tm460vwJHNeOT8eRjvNReFk5l1gdAdLs95luvSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CPjdurwR; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gF2X8T0eOSAImHW7Cb+6+FMR///3JG6oIIo2bf4JrqeEYmWta9hDe9XaRPYER1/HTNzV3kyWTMzzzGU2ML8eN4XsPFLTwMaGM+7/80q67LxlvbloB+sLqMk0SC+qswE9H4az41+yE5wUuE1MF6cFsPzMaiWQtpfhpK+vgG5QAP2aTcBy+A+bFlV8wrX73Tsz7MHVTS/KusHONcYSeo5mB01EV3dyIc3pHEcFEzB4EQvLeIm9wX2HehMsZGAeGGmqNnQuNhXkoaQBrMvuDi7xedQSk4PCBZjU9SaO41sHI7cbKnVqBzE2nls2bxyHiYNPo4v6Fvyk5twMYkXsQTWrBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EUVEGPvMg05b+cu9BXdG8ydBinu5qXsRcVS8wB1Ysc=;
 b=TIregPOm70thGez828DWUi3fumFz80s5oc8B2V3NZfhS9tQf/wrcsSOAt8kG/cvOEtdeSOuArWdsyNyGi52yQRFuNj1j/tDs9TZ7Ox+we11rvy3nVvTDRDWs+Yjq1SvfgRZHT84Iv2SglU05ExjfGPkIKXKdDxArll2Tu1djT6ySbx9VTFwtsTr5YjBMDFUnrQOhPnsOASkeBvOhlI1ZqmCglcEyejLqgEV2LXPow26UvMGFCs/x/EBpP7zGTRfYhfbpZ4E+ZXLkb9AdNbHH5BrOJtODHjITg2Gp8SQfuOfwQ0sYpoBom5vT0PyZG4/2WbD2iLxBIt0D51OTAGu0Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EUVEGPvMg05b+cu9BXdG8ydBinu5qXsRcVS8wB1Ysc=;
 b=CPjdurwRtW/0GHHUhB8PTnAXVVUgAjxPJzH25FcrhSL+aFtHVx0qkj/WzFlF7I1i7wXfKNnKQMsGbztaQH3EO7jhXViEV7AEEdJrxuSJLD/xfqdXwsJlz/Eb4rVFJohkP6FJHfmtisopijBN0f0bEPMFGgi1bNp9CQcRZiu9FXcLYF5uwdgtWpG08b0z7qxsuk9wfGdz84Er4hkbHaTyQQcWLchbxpQiJ4wk4pq5Cqr6fvjEHa/IwINvmifUvZ9TyY6hIPZ4iHxAutcs0/6uoA8TkUXQJ30ePRNAMPcFA566BROJfjBUqZp/hMt28Vo46WOwQjXAaRlLYQxjVZMjEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11458.eurprd04.prod.outlook.com (2603:10a6:10:5d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:07:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:07:10 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml format
Date: Tue, 24 Jun 2025 16:06:58 -0400
Message-Id: <20250624200659.2514584-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0149.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11458:EE_
X-MS-Office365-Filtering-Correlation-Id: aabaa838-ec87-499f-05b7-08ddb35ab395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VDhr2h1s/bYqJ9W0fRDPS60+e1T6XyDRzlY88cBaMD2F/+XbTUpg7MgOGGa9?=
 =?us-ascii?Q?YpoKAqfTx2P6FIvHSgn45INxRvqY38n6rXBi+9+SqpZwfuhjwj8n+UD3kvw5?=
 =?us-ascii?Q?aI9qj5QsoelR23NN8PwMEHig7jU0MBjcSqiHMA20IMaAhyjAZ+QQNW1AtzP5?=
 =?us-ascii?Q?XnIlDAMlCvD1O9k5cjmOY+aF2hhexjEpz00Q5C2eVAm8tPU63g3Kku5ldMfT?=
 =?us-ascii?Q?eU8szuRJlcMdLl8CreO58CNdyVeLRl/AIiR53T4DuhXCgzJD85OYWO8OgYYR?=
 =?us-ascii?Q?uuTC/caCcTjFOARMrzqrZDDEdtG6UJxsEXJjKw0ijq4LWvPgoUbnZDFgvR+Y?=
 =?us-ascii?Q?kaW+ExCgV146LT01uauTtG5WXZGjuAVE1u1UbRLL/aWgVssUQYpG/JVwsMvA?=
 =?us-ascii?Q?L/W+qL0+1tU/iLRRUeMBUDpiDiX+3Z6VMulJerGqDRbnazr4gMr/wRMGxRlE?=
 =?us-ascii?Q?jU2ZO7r119xZZXMp0EZ2o1TRpv7qsYrq0nqGECsf6xnmTiu1e3B1nAG95Q+s?=
 =?us-ascii?Q?PqWrex4hFlxTKSRueiCZhlk9NNkXOeEsoMhRkmXK8BYYO4se0qdlib1r9PV+?=
 =?us-ascii?Q?bR4oFLZ0bUhgj/IkIt+MUZIAIJshEkp/0WJpbZTRZF1FWlYnJ1UtCF5E6efD?=
 =?us-ascii?Q?1aCculQ1gAAMeFR3xT2fGEz5APUkEKyVCz2/8+JHKe0I7VEhigvqVD1ytjJJ?=
 =?us-ascii?Q?hQwi419xYiX2ydpNpx8PoeymsenZD/2YmFvoSk9KMLytLLybY7JXTEGAFuxM?=
 =?us-ascii?Q?FAg5wLJKBCn1wiab2U82Gj8CYr4Z+k71rqJ9XV8DOHFJnz/0wrUFB8f+7xcH?=
 =?us-ascii?Q?RgD2J6tWo4DL0jacqd8GlxbQYZh0K/ZztJgxW44TDnxVcgA5kSEnvZqIDTk4?=
 =?us-ascii?Q?TiqPWOVHQeSJsYEhwR8r4C0aeiykFH8xM6bx3zH3gDub4fRmWuuOoKhX+o2O?=
 =?us-ascii?Q?55vfFHkeb2cmujEGSVqRy9Vlgnco2z07HrwKuVGLCrGxJsQKX6xXxZv76r4m?=
 =?us-ascii?Q?oLo543Q0SapjpE8XUu8/Eur5yd8U3fso8/wbzhD0tsZMaSPMDE4JI5LLjZGt?=
 =?us-ascii?Q?45r+1I+eg3P8KSra9xmbwP/JBDKl9bqWVXrzthC1BAICXzZzsNMrEbmTXQT+?=
 =?us-ascii?Q?DLC+psSv9FrS+nFNObPXtPZ2ly2tpK03XlJQa58rFSjRTPFJwz61zQnIbRRI?=
 =?us-ascii?Q?cAvEi0M7AH6CccL1FvRrCwBGwNjcF49UDK/5Qr2y9C8Ux51L9Y6qr9fG21bZ?=
 =?us-ascii?Q?COGPh1FzBQwIyAxZ1wcyhG5u82qPLJAjQvyvrC5XPMkboPEj1rF82px6QLzS?=
 =?us-ascii?Q?yNcan01XyiuBC2V2bEaGQegoDW8lYj+KiOYlWYvMiP7HL/AY0ag8/u6bZ8yV?=
 =?us-ascii?Q?no3if8r4gNN2+M2O5JCru9TPdtisTM8ULM3rPLTlzSNp01hjaAS9oT5r72Ug?=
 =?us-ascii?Q?fyursJkxTX0P6/EKnBuau6Y2pQKSHC2p?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JP3DtO2J2br5ROihQRgUcYIyQ57ucTw5todpmS59p05ySSOb66H57dDGKPtG?=
 =?us-ascii?Q?fp7FAWJSNbDTKGvUKOSGRWIQrIqZ4ely/Jbhgaw7SruM7ee6dTOeeL8Do2yv?=
 =?us-ascii?Q?H2nmQko8nmOaJhb9H9lIb9f+ILfYYxeMmKhKAxmtsB9x0jDdUg5kH12bLduS?=
 =?us-ascii?Q?PHFlId0+qs4u8F/9mg3MoKhhYBq4TDPtq/R9StyJPqA3Y2oixVZVEXrVigwW?=
 =?us-ascii?Q?DqPuD1gtm7hFn5Z+hWXFUqMgr3Jc+RD935FW6T5xLLwPFZT1MP/xnXdNwkvK?=
 =?us-ascii?Q?Z3RwLeTd8EQ5dZRzuYgPxkKM+BNYjcQGmykbr5nhsj14SKBVfpEwjMUSA/mv?=
 =?us-ascii?Q?Qz3e+r/nJjeKG+/z31HqyiVAp9kQvLN5Sg0N/OIy8OFvSnhxVk8zTsC/1xJR?=
 =?us-ascii?Q?SF737RrffHgMR0hyNlmk9/bGnTHCP6tdp2dfX//QRSDClJOqfCikKLRXhC1r?=
 =?us-ascii?Q?Mz1MYJvQaKd//vJWIWydTDoRhqsa+Foz4HkrMhrUiPtkxDHh6pSATe67TP3w?=
 =?us-ascii?Q?+2Du2Bod/MY6Z5JUQqshe0t7VV0QeHzKt7FjR+7PyhN8ozGwP4jopCKoGowe?=
 =?us-ascii?Q?nnv2z4A/+ia7DThV7CHN0awTFgtcKFaylKAKXAJMnX2jBNUwSJ9nvZuA67vi?=
 =?us-ascii?Q?cag2daHorwgo9mmJaVhMd4TsDcdUPvyFJ5PO/2uDlF/ZHjhYXqQWbKrO+kk7?=
 =?us-ascii?Q?Etqq6bGLwRC4U2iSFwWdkNeGhY1wJ59Bv234OSD4aGBPKQT02J3jUubpFMkk?=
 =?us-ascii?Q?q++a8pQ90iZOJEJHQmLf5PMBzxYvVKE1eZMhojURXc2c5yhiF+p/RrZQrEyL?=
 =?us-ascii?Q?1dP4epNNK4X4I4aWWQVeYFC3NOPz4yjoPebLIcG2FHJrxpK8cPo84iKakwpz?=
 =?us-ascii?Q?nbQ3Z2b2WgL/CrWCQ5rh+Vt1l/gWG9GeyqpDLYxHmt8TrNUGHMxLXOLtsri6?=
 =?us-ascii?Q?mZlh6xQjJr1CPUsrh8UkX3y19UEkS0c+K7KANHZkE90of6Se+SoHMWcTbkx5?=
 =?us-ascii?Q?RUgzGwQIFneb9jHbIejqbj3IvmYelfoOcmFn5lOd/bEFxTx7AsSVgKGrQos9?=
 =?us-ascii?Q?YF0agyOjxd7pBRBgiQ6vtxsKRlUpH6AQzpSh4lC0lxCU9Ra2xpB29Q6cioj9?=
 =?us-ascii?Q?JH0WgWlXGhugyDp8Yu5pXeDwDLFyr89humIg52utgfYZIGkyZ7OOR191Gi5I?=
 =?us-ascii?Q?BuFAACvr06+oXhZs9BKKi+4jm+czoRumNkhd5H/egOOtoZr5OyTtH2gTqGsd?=
 =?us-ascii?Q?gYYzvNGrPNg37+LnX3QE+KqOhlWPJsTk2YVehsbI7QRZMtDnNB+3yYvisJWJ?=
 =?us-ascii?Q?/Mu3fuSh6olaCgj2/1nj8GJNxBgkjp53zASThFWjmOmiOTtofFKCoXNqPHvy?=
 =?us-ascii?Q?m6EQtpkeR8b5fIdy52fjjkin2pA/jqa0w1MZFgsT7MC8fiDrzenqzE0IDl0A?=
 =?us-ascii?Q?vhUAVFPL7c4CEvVs0mVPIx81v02eeuw2OBokdBjoWseofIwDrEQr9nKH8gtD?=
 =?us-ascii?Q?/oN0yHPQdLnalKktEvTxD5tbxF6AKbzxncRrmc+fX3x+uG69x6MFLvAUEpDX?=
 =?us-ascii?Q?V8JkKNLF7qy4ceQ2T0G1/bVqBpgwT7Xkpj1gBaBx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aabaa838-ec87-499f-05b7-08ddb35ab395
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:07:10.0763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J7DAhUZgjMefw50mFkI4N3k/aH4Ep083r+J2TLIjxk2ZB6xzu5l/MOpp8IuJHbebqn1+gwkvhfRweC9vlHQOhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11458

Convert lpc32xx-key.txt to yaml format.

Additional changes:
- set maximum of key-row(column) to 4.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/input/lpc32xx-key.txt | 34 ----------
 .../bindings/input/nxp,lpc3220-key.yaml       | 66 +++++++++++++++++++
 2 files changed, 66 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
 create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml

diff --git a/Documentation/devicetree/bindings/input/lpc32xx-key.txt b/Documentation/devicetree/bindings/input/lpc32xx-key.txt
deleted file mode 100644
index 2b075a080d303..0000000000000
--- a/Documentation/devicetree/bindings/input/lpc32xx-key.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-NXP LPC32xx Key Scan Interface
-
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-Required Properties:
-- compatible: Should be "nxp,lpc3220-key"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The interrupt number to the cpu.
-- clocks: phandle to clock controller plus clock-specifier pair
-- nxp,debounce-delay-ms: Debounce delay in ms
-- nxp,scan-delay-ms: Repeated scan period in ms
-- linux,keymap: the key-code to be reported when the key is pressed
-  and released, see also
-  Documentation/devicetree/bindings/input/matrix-keymap.txt
-
-Note: keypad,num-rows and keypad,num-columns are required, and must be equal
-since LPC32xx only supports square matrices
-
-Example:
-
-	key@40050000 {
-		compatible = "nxp,lpc3220-key";
-		reg = <0x40050000 0x1000>;
-		clocks = <&clk LPC32XX_CLK_KEY>;
-		interrupt-parent = <&sic1>;
-		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <1>;
-		nxp,debounce-delay-ms = <3>;
-		nxp,scan-delay-ms = <34>;
-		linux,keymap = <0x00000002>;
-	};
diff --git a/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
new file mode 100644
index 0000000000000..5ab6cefd35fa3
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nxp,lpc3220-key.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx Key Scan Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-key
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  keypad,num-rows:
+    maximum: 4
+
+  keypad,num-columns:
+    maximum: 4
+
+  nxp,debounce-delay-ms:
+    description: Debounce delay in ms
+
+  nxp,scan-delay-ms:
+    description: Repeated scan period in ms
+
+  linux,keymap: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - nxp,debounce-delay-ms
+  - nxp,scan-delay-ms
+  - linux,keymap
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    key@40050000 {
+        compatible = "nxp,lpc3220-key";
+        reg = <0x40050000 0x1000>;
+        clocks = <&clk LPC32XX_CLK_KEY>;
+        interrupt-parent = <&sic1>;
+        interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+        keypad,num-rows = <1>;
+        keypad,num-columns = <1>;
+        nxp,debounce-delay-ms = <3>;
+        nxp,scan-delay-ms = <34>;
+        linux,keymap = <0x00000002>;
+    };
-- 
2.34.1


