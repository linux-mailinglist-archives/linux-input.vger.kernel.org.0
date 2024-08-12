Return-Path: <linux-input+bounces-5528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1AD94FA25
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 01:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA722828A1
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 23:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140A818C920;
	Mon, 12 Aug 2024 23:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kERYL9r7"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2073.outbound.protection.outlook.com [40.107.105.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3741E1487F9;
	Mon, 12 Aug 2024 23:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723504304; cv=fail; b=kE4z+wIr9ndNDRj4UA872cJWlcrJKIdn/uvQcNCfklT+0dVInxmxQmVSRfdto1F6acDFMD8n0cDwroaKGsJ33RVVIDWr7VrEps0FcZ9O0CIgov/2J2D9KQ/Dvx9Ah1gjbG0z4/dc9Cl1n19l8pZ4PEPlplJy9TPr9JZqLHMVHrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723504304; c=relaxed/simple;
	bh=KqDKxnqd/2X4PXEedaMv6gkGp3Fs35mKX9UGZShDhdA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Ld3UEjPDSW80gO0llEGVoAqxFsuXykeu6m3pxRINRuDk19PrADp0jF9hGlLQuwhVaySQDqGvKCgcDKL0TEmHi8p8Wn7pfSsIeWmU9OsouPvpThjq3VpV92KUSkkypfIgHtqNSySbCJExRBbJf5kyXI4fghu4EHCoomz+o+q/Tec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kERYL9r7; arc=fail smtp.client-ip=40.107.105.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ull44/Nk+Unhh3yla2pJvaJUK47MiAkFJr/INq56ZW5iClksr8DsX3jtWeq+ZUQKUocV/L5FGD/FYLm/ReNGL8huX+pfRKSLHrDNx4Gg6yJlpnCbEiqHXx9igRXLjP0qiBjtbS5jmzF42l/xruS9cf0lbV7/3oijD7nj+FkIM3uS/rKVhjBC35Ufs0Rl56KjGlnYU3AXqwiAT2EBZkP1OiM2/JV9anVTbvd31xQsq12Yba85K41/H3DxT1vfDL907auLt1E5jKCM25cMnk0mAxuV15/19NefJkPK3eoXMgEUZYWt1cEbUVwnkd+np94CnJ/T88bk5xPEaXIJneGDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTPlkEuFQW1uFIvbSPmuip3Z7+MB/9szTpdUDNbS38M=;
 b=ME9kYM4nr5AZDzfsrw7OcbQQSxiLMqLMaRxhHD2fC+rOctU8meKzQhL74FyWmgLLXs1cyQP/L1hLbmeE8LWwWHraPC5HIDbVq51qmE36CGjEvwLbOtE+5CU0OK8cu/tsgElpBKfZJCi59eLR8FzYNV+MGZ6GtCARJDWYr/K72GQUFKawCUbi1j/uYsN7j5l+2ZS7L3WJqhZYma81HvN+2UBZscljmrxG4m8lHG4lTPNBjNRwmjbiAOoGlOPc2FysGrdUdnsRVBIhgZ1bFLlVVu3dmOvQGSxBYazMW5f+hibRgoYX+k/uFdZF6t48pOENVN/4mn3mtBUrcM9ukyWvZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTPlkEuFQW1uFIvbSPmuip3Z7+MB/9szTpdUDNbS38M=;
 b=kERYL9r7Vn69EbKst8jH0kpiGUwBo7zyNb26WFaBv8dFiKPtOvdEBN49jMLssBdBHAHE3hqAP0MNpG4wjpEdCpej/sozXOBV6Lz7AhGg9wMWWjOzzUVgHt07/i/P9CDblI9oZKwZsHReZ8sHg/7vH+UFh35hpQkfka8xbA7ZrDaZ1E9BCrT50OS+TVjTEtPyOVGtLBHW3VuQuLgSYcjyJvucFgsmpw7+Y6HrzQugQbZiPPN2/84G9UT1n1cJM6LPrWwn8nZ6OjsHD5KL+2Ktxtfz5pjA0/JQxg6pR65IxfsZbV7w3RbH4v1R4x+M3NJWI9zRcviX+f/OmB7y0aeSRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB11017.eurprd04.prod.outlook.com (2603:10a6:150:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 23:11:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 23:11:38 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert colibri-vf50-ts.txt to yaml
Date: Mon, 12 Aug 2024 19:11:19 -0400
Message-Id: <20240812231123.3838058-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB11017:EE_
X-MS-Office365-Filtering-Correlation-Id: dc46e603-cfd2-44a4-c901-08dcbb241e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9YOXU0kNHqtKkO1/jasWpHhKTr8ddc1+UbRCork+NwKmBq6SsHKbag9x3yey?=
 =?us-ascii?Q?Z92e20bQQdnMSgn706Qz7Sieyi5I/ySgloxotbwfEv+KdWKdU9AXob3Khdi2?=
 =?us-ascii?Q?ioSfuCi+w/x1cqHmmmbnWHkP1JiKxWaBWyj61qmk+wjlePY9EpTbDyLeBrev?=
 =?us-ascii?Q?Lc7vNPWFp3QzCX8xslJ7tsKAr55+oNJDUSStIMvchIA48moNPAOHNf2F/q7P?=
 =?us-ascii?Q?3/gdFduTYMvU2fem1EZBk4bl80Kh8eRGUK8ZnIGkZK3rtD37xW3zoe1b8JcG?=
 =?us-ascii?Q?45dx+uoKex8Q8ozcg/HHwFNAM7aN44wN4fFspZopV6yo2gudgRBWyauMiavZ?=
 =?us-ascii?Q?TESZsHgJBc3mL+wIeX/1QGYEV1iue0PEKfaL2VqN6ZtFnBhhNLIHXljKHyJ6?=
 =?us-ascii?Q?35ojbHQXna965yO3XunFqmWYR7k3qLtgxNy0oMA6AKxGfgDgTtjt5DwlphOI?=
 =?us-ascii?Q?jiOGUGuOBZXkcw6WhfNGXe8UvkU5n8937W/MZNhvYxI2RxX94qTdI9DQfToj?=
 =?us-ascii?Q?iwWN6MrPbwfVbkSEslo0K7aIj8eu+IEaF1pRCpG6w/Z5nh2uDDuZVlw6N2lf?=
 =?us-ascii?Q?RobIzC85dX3mB3sq+mPs5fzBE4O6C8aOdAXIz4hcS6hhewgvA2WwFt23BRSE?=
 =?us-ascii?Q?oUL09RmpPC6+N5NeYmTIk3UAmFm5CW0BslaOFWgazzxsGeXX7fifppK1qso8?=
 =?us-ascii?Q?DJGkX7yFZBwX12QwCtrRSIqQnIQYSLPRo/5RXKd5urBc/QvNJrxD7AMxF0iZ?=
 =?us-ascii?Q?lE49uI93opcj1A5gS7qb7WH2W7nVWGxQuO2g+WzsUu4cIy3mys0UqbUrIbp/?=
 =?us-ascii?Q?pqGPSONSHaUpgvUnWbMCcb8ZWNd8jD5R2wa8m0otUkrpHRsLt7J6MUWWcGG+?=
 =?us-ascii?Q?GdZo/CPDgjU9GEcyv2+WCrtWVa/zWBObN9Xr/A03V+n3nUbuYw+xay7QrRGA?=
 =?us-ascii?Q?JjA45yMLdvWtsUBjl7j5xv8JbZ/WWXWuyPDi3wZbaEduPOb/+p7dAZiY2WQX?=
 =?us-ascii?Q?CBFQQXkAujjUR6KxmZLnvnQpAkWXplOx1wAYpX/JAJxXdTOYwZuSSwhJLaGR?=
 =?us-ascii?Q?GS3ELzu0FJpYqAZUgItNuVlfYJxAR2uxen2jzzyicjDlvp/rWY3dHsTRKCM/?=
 =?us-ascii?Q?oUK1C/dy5bFGPgKHolfvURRyyIOeks1zEbMJv0RPMJfSVgd0XZJohnBvQwXf?=
 =?us-ascii?Q?+mo89uetpiC6UfxTzqodS3vjueJxBls4Kc7r5RIhKIFT1kTBD+x7RoTE0aQj?=
 =?us-ascii?Q?fVkEDp3xUjWrqdonxEi9G8GUss4u44IE5sqcLaVVUCotvOYZGdL9l+pwiIHc?=
 =?us-ascii?Q?+Cn9vtttgrB9SLZgYFBkS4j5Yft/ZCwTJYwiNBcc5Q0pvNQc5+ubACR/auLG?=
 =?us-ascii?Q?aoewguk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SD+d9aAVkQYBeHVr6nW7mX7ezBfzkhuHQ5H+isceXFsMbmceDPOsu9aj7Sca?=
 =?us-ascii?Q?dqyORXwCnyFlpyACfXPJwDqBqsYX0Ypgn1Pk/O2xeIsbbpxZuxVTkBTN1vdE?=
 =?us-ascii?Q?gTxLgeAv51niYJ2lnCD6qm7zRJERTgHbVBliwsmxaO8VZW4sWUUTAX3S5Teh?=
 =?us-ascii?Q?B613d9IhwmakggW43opeiZB+1M5EtI6B1y5vKduLZ+LrAYU8JONYmYymBClD?=
 =?us-ascii?Q?hyHV6wS+EOJ3XVOKXK4aQ34itaOc8OZgZZ3xbhIeUBYwui/qDZO0QLp88qqS?=
 =?us-ascii?Q?tn1g60jaxnT7jJWMyHkJsLh4vVy7jt0shL1cLlgO7YG6lVGfxyQ/OCXDbvGE?=
 =?us-ascii?Q?CyRn/Aiiwwgd/DBWrs10V7LcGjf7TzdJ62aI1NiVJkHT6SMDxAPG3SgjmY7c?=
 =?us-ascii?Q?AVzDefgTXhFFYhNKTHH2hhl9JuDYE+HblKfyg/w+XHvRBypQGQi0drKg+dFP?=
 =?us-ascii?Q?ge9OuE75Zhymvn7kGLkEgp+kAZFYtmU18ww+s7ZNn2ZBj9O3pnVowxeJBf5j?=
 =?us-ascii?Q?6RqDH7+NFvNvTXHo4pXlQcDEWca0o+JFQPbqLvmhL7nRDOfijNpMHr35L0Nl?=
 =?us-ascii?Q?qj+VUOWdlEiT/dMWfFWh0/S9vrjxSzjuxOn1uSzYOnbHAb3haz2owTS6JGn9?=
 =?us-ascii?Q?bAwO+Yz3j0gJbHo3Yt4pq43CQ39bR2jvdcSXjoJAnMD+BmYFEXUvMKPjEvHL?=
 =?us-ascii?Q?cKEj46FeBETxF1cNK4Et789sQLt6ToOulyF0w8iHeQySaaQZ5JM5w2tuR8Iu?=
 =?us-ascii?Q?leBTz2jog7BSRP9owT8EuxokCWd7b2Z45qd2fa0kkLJaJ0FHNp/4Hqk4gW8L?=
 =?us-ascii?Q?I6SXdOPNC0D4eOJmSnXuNuj6ZdlwkzBPb9LQJTKEK3xI36WLUFug8PPGBkpA?=
 =?us-ascii?Q?Jpl5U+vl+0W9qwqWR7beUpLC+8irVulmveXj6oVIyYYnfr0LDPvKVa/JXiwR?=
 =?us-ascii?Q?3cJfhMsksb7B7y9QRXarwIvkYTlzTyfJYczXmWjm+MzMyhGhwa6W4jPDTxbu?=
 =?us-ascii?Q?2yxut3ysTlIOL/9F71wrQmOSaqO5nOuevLzB1eGnybPrgGCIcZAMnUF18RCJ?=
 =?us-ascii?Q?QLdU3bJm7+Wd/CV4ou+ADQ10RheOo0g5/8x8e1iKHOqSZYwnjEU4hQnEb759?=
 =?us-ascii?Q?6ZMu3iBx1UAzFzby/uYogDNhngb3FcQvCn7YwvJnhx+PJtcNkiH1Od7Jf0c4?=
 =?us-ascii?Q?rdW45jrmMLUsVgUReFhSExCD/GFysTjp1Bq5gB0C91WazAx+7wcMFGD7PeEO?=
 =?us-ascii?Q?8MSVTlXS0g/v97KbutvNoSmTbnpjjanTwp6YqiqtJvbU1PSsTFsPKgUsAx50?=
 =?us-ascii?Q?fYbUHmWo/iXbXddgCvkuSes7nozei6suMAXWxfTEV0JWJD++pwR/hz98CO30?=
 =?us-ascii?Q?K/mCKms5gYgbpH2L74AS7cLOq8EX/SJZIEsB2dN9UbegbGCyrWaXI69vWG1Z?=
 =?us-ascii?Q?Dgg0ryVy2mNaoVsJvguRfhmPu4cVHdNrVK5519k13H4YKA+pVM98fzDzQjJT?=
 =?us-ascii?Q?zKs8kH4ikB6zq2MW4aDzgggBuE7hdki0QwNo7qOGO93o///6GM0PISmKNhO9?=
 =?us-ascii?Q?/H9XZneqa9WptJ7sbM42pbi9Aj+ouTSso9Ma3i+X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc46e603-cfd2-44a4-c901-08dcbb241e9d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 23:11:38.8303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5sBEhOEZgKTPc9y+5NqXWHvPpvKhw4pHAZ2L8SN64aOPm/Zdw4R58HGP6bQkIEHE8Mktw6WqrCkkP89zKqrnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11017

Convert binding doc colibri-vf50-ts.txt to yaml.
Additional change:
- add ref touchscreen.yaml.
- remove standard pinctrl properties.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
  failed to match any schema with compatible: ['toradex,vf50-touchscreen']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/colibri-vf50-ts.txt     | 34 ----------
 .../input/touchscreen/toradex,vf50.yaml       | 68 +++++++++++++++++++
 2 files changed, 68 insertions(+), 34 deletions(-)
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
index 0000000000000..6ff3ad1f9edfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/toradex,vf50.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toradex Colibri VF50 Touchscreen
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
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
+    description: pressure level at which to stop measuring X/Y values
+
+required:
+  - compatible
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
+        io-channels = <&adc1 0>,<&adc0 0>, <&adc0 1>,<&adc1 2>;
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


