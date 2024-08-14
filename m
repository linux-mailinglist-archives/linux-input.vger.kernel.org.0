Return-Path: <linux-input+bounces-5570-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A59951FFE
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 18:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE591C21B27
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 16:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7A41B86E0;
	Wed, 14 Aug 2024 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EyqHZOa0"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FDD1B3F3E;
	Wed, 14 Aug 2024 16:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723653000; cv=fail; b=Mo3aFMiI/xi/9w1Z/tz+W0YkO66NJeebXB1xs0jgANjA7sXN8RHHakaMScda+u5YXkRZc4RiSZ9PdoFVQoQP87VuKCeag6fK2+3iL6s8Xs5gY8xN4b4eW8G1VXQWc6pP2nw0ZMr2/8BnzsQhWAaqWQZesUJYBnLkmwEBSqRvUYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723653000; c=relaxed/simple;
	bh=D77HdHorRMGtr2lOZACJqO0Fg7eU3Zbg5ZLZtrwapTk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=rozalzktUxPGcLZ9rKt/RuWnd7+cUnv6Uu8ffLW4kWWp8MnkxjLUZu7WX3OnAf9JsGVNMtWHe9s/kkoZqMhIfv4iR5kFjBeKdGYu9l57eApoax0OYtRchmvyKi648blQq088lBYGw/sMSPyeR9HQtdpYd3R4fNlxYS/PbVmSPfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EyqHZOa0; arc=fail smtp.client-ip=40.107.21.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GetAFQOfkaQGdDyLlvbo0Igy6BzVBLblvt0+55z0/a5uwmYZKA6Ue0V/G+OQFPXKe1aif6WcckV46R1jBmISWZYFL+hBm0uuoOga+iCOORDZGdSlSszf1l9YB+HSLTnUMvXHIIQn0Syx+A+yHCDZyj7VdhkxS8bldnIti7Elinr1VgiO9CCSrwL/pfne76x02Zr80FKDkH6Mrw16L4eIeTupfBoDhrNgGnsPFxjhpRLW9gGo5LNIxkgLVDtVZkoLT8P+nwqQpoDHyzijFbEkzISV6jcb7g9F6sdYlxq5eQvVqkBELr/g+iLOmhL005cKCVfnmeZq3/v7wGZnh6vurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+svNqFpRLn6j7VyTLsyb2YgFQ5TN8rzUoiSzv7vKyM=;
 b=R8HCksYolbw9/1TsRUGxH/BdzXE4mpwds1XhO2l4BIyeyIbLcVRnxZHGMLziEaAmHnfseE0Fa1DjIVP9QnC1imYjpWs2dUiTj0UM0lPMbgF6rFZEvcyNU0Gt0oZ6tJQZ7KsKLMxDSiYdIxbUev1I5pKuox6pxjfTTLY/A7gnbz7InWt8IWsjifx0UmyyQGCW+QDqYMMUyZxpoXkcuVcHVbDGhghEsLEUlc5xizMWmhDEHKZfio7ktdM3b3WeRXyc4n11AL/ixUJiGnTdcvjaE4sQnJK318GYM5IPUbfx5HKq788KMgkAMgXntLazjuzMQVAFHd4CSkDZyKny49a2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+svNqFpRLn6j7VyTLsyb2YgFQ5TN8rzUoiSzv7vKyM=;
 b=EyqHZOa05eKqc0DbANE6HMiJ+6dWB7RRjfKDoxugnhvfUkTr6m5KY+b4JocHDZ3WelxyVyzjTRBXWjyK1FRShOjC1NBIx7P+KMuy3jjuWEe+1gbnQsy4xcAaCbk22gM9kPf9stzNwwqmJAnOdrU1RvEpIbNyelZ45j1QlS90mCYgHaF4BWBjh1FiNkHIJlu9DWvLSeKFyFJzaX2IInXaWQJZVE6Sw1X6uvyJoEYfyFAYjTD0MD+A+9NHvx13VGhbVkf2OqmlLuRsNAQC+nh7wiPcVArmtPs3JwBQSYXSgyIjvw0+ppGyOWYu8d5UbX9DKIgssLM3UrFE3VWIWuqPxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 16:29:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 16:29:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sanchayan Maity <maitysanchayan@gmail.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert colibri-vf50-ts.txt to yaml
Date: Wed, 14 Aug 2024 12:29:35 -0400
Message-Id: <20240814162940.4020520-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: e7505c40-be1f-4694-29d3-08dcbc7e54af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	wUVOuLFY+s1Lqu/vd5N7PgO8in4/PUZ+qMB7UFlbjzbKxzTOvSD9nRqU2GUAlfXTq5aqux+mvmHSZ5fH+5fQWx27gzlYMCt2jE65S/Bv8jTeEp3u8SqTDwtrt8H47fRnR0QLaz4pV7iXCfOg+18yTHY5wTKPECIfeidu7bz0L7IxeP25lQFO0c4odulRW3wqoVaDiwI7QMU/GcYbHuGfQBjPZUwVe0K8R7Wm3DodGe85fCY5p1JnSADqIBA2pq03pNodcl11hNFG9X2/5BQTbTSxD6QE2//OpkFUxwOgdSbtx833oMnVk9sa2po7Y5zLMDEW/SHm8oo002dk5aPHwMDkUllEiPsX/zveGW7vlTcrlN4S4HH5HPH7I1mJR/ao+CshJbXqC2dypSrMm2jmrRODi5knciWEIfVT4Dr8bdjbCLneKiTnfdUXjTnnkpXIXTNE0lYksEFe5i10wn8xdYWt//MsB6kNkWlxYSvC4lUHyTv1i+IPUY/sAMAoUUT+noSfizRzEZAd+cI7LLCUH3Jewl80sqAgflY6rFGp1B54sAc45AFlUqmuaVN5o2vcDziNJc3hJDGt+/kZimaQRQGJ/5faWpxYN/ow7i11Bo+Yw+qREFpclTQaHWkdU9qZoyoG7JSsjYDIPhSTkK2PcjoBBrtiidCG4Zt8P8bRlNZyyj4K7aYx+tEpeUk/RG2p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3hl03hluUJSP7ebO2w5AQLTFrnZljic1n7LrzbvVCW1tl7CQLC97BZOQF9UP?=
 =?us-ascii?Q?ordqzP7gjv4OH8BD9G1jp7191D3w5IXsfy3XgiRxFaxyWmwWJL9XCvSbv58Y?=
 =?us-ascii?Q?JxxXVpKy/t9yC4s6wFeVZdZGnefxaB8A3Umx6eJ1oJayPHcaZLGGBr74sl7q?=
 =?us-ascii?Q?mTbyRbHt2eamvMw5fa82r7XwOIpLrI5FvIkmGg6/n+VXhseDVLFQUXsyxHwZ?=
 =?us-ascii?Q?O8csllyfpgTuCZ4ZYxp3Ipkw0NCeqAPE5iazF1YNJUIbv5t/NkqxgfsPVDkx?=
 =?us-ascii?Q?wy5bWwPPTI2VYhfaas8dt/wFBfrWuLtY4MW9n3+rSLDfKPMZXihqNcyu3PTa?=
 =?us-ascii?Q?Js8Qn3Uz3le8sRrd7KT419A/qg8f5Ip1LAbGuwGmSODkL69iqpHGy+ep90Z9?=
 =?us-ascii?Q?Y1OrRWqc/FeKXDsrsE1LYNjQgR9HdDiXwTVPsOfRFwJI+W+fkuIbP0v1vuHp?=
 =?us-ascii?Q?5TrJ7vNFfF5G9li2sAZghamgYIdo6YqhLx4cjP8xwRJJ1lbbpd2w71jc6Crc?=
 =?us-ascii?Q?N8O5A7XvBdIb3F5w2S0baBIV3llXCIi9c/khsDfkv84Hg43PToIkKF9XC4AE?=
 =?us-ascii?Q?3ONostvFZ0coa96kLuudq+3hRi2nAsJt4BP60uirWR+nV2+EaVoqE94CqbOS?=
 =?us-ascii?Q?cQXV7P17t3H4wdta/REsf22vnYQMeB/C4Hn8ycLunc0a28Qxf1OzYoLH6Oi8?=
 =?us-ascii?Q?8AAr2h3IvHqzm4BgaAs0mTAgmsada666ScZJEzfXLpUizcRaYfhfBeuq1d4S?=
 =?us-ascii?Q?b1MhKXF/iv0D1Zf5QzAdE+PnT5VzZUJTunYsnogGACXiHF3K1XWRpjD+HoxL?=
 =?us-ascii?Q?zgBogs36PyoBb0jXY+iMMZamuYADZONo171AOsOXNj7SM8IkxugEEkbgoC5K?=
 =?us-ascii?Q?vusKHf5/tMVnb/KWRV/rbxVPo3mfYdiD3CQTamRJqjYO6bmbYCaRDLM+juPJ?=
 =?us-ascii?Q?hY+EBEepjrZAkWh6nd53nhIjMW8NYKekzeVWMdtuu9hTeC0QW+tx+k9il3Js?=
 =?us-ascii?Q?Ijz0/LcGygSqBaVJ8T/TDNmYjkGCUmY5soiWGHI1BLthFi0eFBJazemDWB7Z?=
 =?us-ascii?Q?KPvRKchNmsQlnH8oVTmSv+l/mADY5+SxskGjnkESKJ10r4sY3+tvYXF0HKQc?=
 =?us-ascii?Q?+r6B815e1S95bOe1jeyaZKVSEFx4FeHpjHCqvcsDCzf4/uh+nixJxRZyz6Xr?=
 =?us-ascii?Q?ID/dCfnRsIYZItEgMKDB6hLyDPHc7lEgERb3w0OPU9JQ+iKXw+NmUkipGW3O?=
 =?us-ascii?Q?TDUskx64NBa5jqhjbUbhMnMEM/No3VETu7d/5csV5my9H2vVnHpKz41nVjov?=
 =?us-ascii?Q?u0zDg9GdWUxk5DN0bhAv9yLRgDvvLwfcoQbhIV9cUe4P6JvH5vAjfrhx/etN?=
 =?us-ascii?Q?Lp7PSHcbRDtGExAS3NEs0Hc58I73FkB7J2m+E6Iro4gLRpYsuYnYTSPa5nF6?=
 =?us-ascii?Q?JdDpmacQFT3u4DBwoZLE0Xnm8Nlp+t6aCWJtYImkS1tOJ80Cvl1VPKlO274S?=
 =?us-ascii?Q?BGSaQqT3ZCT2W/SwyN0yecG61Sv8gYzinaRaajlRvW11FIx8dkFeW6biGpfH?=
 =?us-ascii?Q?AIPG9LBDGc/VChqZMCUnMQcgxR93N5R/JXOYUkmn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7505c40-be1f-4694-29d3-08dcbc7e54af
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 16:29:55.3520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PStltvvzIdjoPF9xmuQDyxrBk4/iiyXO5TLtpLOWAZQW+NluuOZ4Y6FfiGzfwpSd+cCGTIICTesqm/cvwH7QOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

Convert binding doc colibri-vf50-ts.txt to yaml.
Additional change:
- add ref touchscreen.yaml.
- remove standard pinctrl properties.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
  failed to match any schema with compatible: ['toradex,vf50-touchscreen']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- fix missed required properties
- use original submitter and input maintainer
- add value limitted vf50-ts-min-pressure, just provide rough range, which
not mention in original doc
- fix style problem in example
---
 .../input/touchscreen/colibri-vf50-ts.txt     | 34 --------
 .../input/touchscreen/toradex,vf50.yaml       | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
deleted file mode 100644
index ca304357c374a..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* Toradex Colibri VF50 Touchscreen driver
-
-Required Properties:
-- compatible must be toradex,vf50-touchscreen
-- io-channels: adc channels being used by the Colibri VF50 module
-    IIO ADC for Y-, X-, Y+, X+ connections
-- xp-gpios: FET gate driver for input of X+
-- xm-gpios: FET gate driver for input of X-
-- yp-gpios: FET gate driver for input of Y+
-- ym-gpios: FET gate driver for input of Y-
-- interrupts: pen irq interrupt for touch detection, signal from X plate
-- pinctrl-names: "idle", "default"
-- pinctrl-0: pinctrl node for pen/touch detection, pinctrl must provide
-    pull-up resistor on X+, X-.
-- pinctrl-1: pinctrl node for X/Y and pressure measurement (ADC) state pinmux
-- vf50-ts-min-pressure: pressure level at which to stop measuring X/Y values
-
-Example:
-
-	touchctrl: vf50_touchctrl {
-		compatible = "toradex,vf50-touchscreen";
-		io-channels = <&adc1 0>,<&adc0 0>,
-				<&adc0 1>,<&adc1 2>;
-		xp-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-		xm-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-		yp-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
-		ym-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "idle","default";
-		pinctrl-0 = <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpios>;
-		pinctrl-1 = <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_gpios>;
-		vf50-ts-min-pressure = <200>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml
new file mode 100644
index 0000000000000..cdf6c073dcb8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/toradex,vf50.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toradex Colibri VF50 Touchscreen
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+  - Sanchayan Maity <maitysanchayan@gmail.com>
+
+properties:
+  compatible:
+    const: toradex,vf50-touchscreen
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    maxItems: 4
+    description:
+      adc channels being used by the Colibri VF50 module
+      IIO ADC for Y-, X-, Y+, X+ connections
+
+  xp-gpios:
+    description: FET gate driver for input of X+
+
+  xm-gpios:
+    description: FET gate driver for input of X-
+
+  yp-gpios:
+    description: FET gate driver for input of Y+
+
+  ym-gpios:
+    description: FET gate driver for input of Y-
+
+  vf50-ts-min-pressure:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 50
+    maximum: 2000
+    description: pressure level at which to stop measuring X/Y values
+
+required:
+  - compatible
+  - io-channels
+  - xp-gpios
+  - xm-gpios
+  - yp-gpios
+  - ym-gpios
+  - interrupts
+  - vf50-ts-min-pressure
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    touchscreen {
+        compatible = "toradex,vf50-touchscreen";
+        interrupt-parent = <&gpio0>;
+        interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+        io-channels = <&adc1 0>, <&adc0 0>, <&adc0 1>, <&adc1 2>;
+        xp-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+        xm-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+        yp-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+        ym-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "idle", "default";
+        pinctrl-0 = <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpios>;
+        pinctrl-1 = <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_gpios>;
+        vf50-ts-min-pressure = <200>;
+    };
+
-- 
2.34.1


