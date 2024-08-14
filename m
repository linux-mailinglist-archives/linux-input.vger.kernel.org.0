Return-Path: <linux-input+bounces-5573-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A9995223F
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 20:52:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2324283285
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 18:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633CF1BD504;
	Wed, 14 Aug 2024 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OcGlARSO"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F925374FA;
	Wed, 14 Aug 2024 18:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661523; cv=fail; b=RDz9YbZbEe7PP8ZvianRUMVWZP0iywKnB+tUMhrr927abTpLNJQBV4kszmDcrOozOfYGlwb9a8Cu/rzit6eFmQfn1ygmvC2lxArQveKMpfacoQf0RdGe5Q+yYYBZbT110cnPA+YeSGH/BEMeSFL4hAMm8WAvl2GCBJnvZ4xTQqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661523; c=relaxed/simple;
	bh=LV0/KNfRVVWrhI7quGYUjeXMpFs5gLgRktiSilQxykg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZuUKkD3WcBNLlQe/BmCwBFl0MB1A8NP6YQzpi25PogP3d0dDlRfrWbqslPd1FYhUmUnbKo1WnM4F/j99jY6GlWPG98VqlAycyC+S7P0x/pK6CpGhcC5ZYpa6vocrIki3444ojURnM3hvZREtMSHZdNg1vXYa6foNihy7b2KKgUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OcGlARSO; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrPjGeYNxuNEDgPi22gJe/DLjH2KPVb49/vfDoIeJcyP3xtz7GiF/IaCIj+4AzIw7fEIQ3bk1uMWqbxpzPzqFloGtRDuGDZSkDnz01qUPzLnsL5JT/bZPbfVBPL89KdF1UKa63+G+7zECPGNPwwoBhjeTaFA1oXjeK4iavLsfsCdqFTCZZq2Z07Q9sApwdCid8ynfp0FL/TCXlMK6WIJoPQHUx8MnKvn+Zvga53VnpRYNYknJ7rhv6jIxCyH7BZwMtiCUTW069iqrSooSyk2sHpUBPzWcBIpi4ZQJSHwzs1YiDBnV2+JJjzG6yq7Bj0V+fYBMUicy2boBNT2INubfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFPIEMFgj1dMCVMWsDLzOc+kGgnakV+Bh1O8g64xAIw=;
 b=cDBDWKYlbuPAOwW1IaipHz0a222bW4458dY6VE82NP6giJtZ09wu75s4KwYco/nCjkoQDGAnnHAfdOxF3Q/mX5XNqzhEz1xzpwiAangDvpKc9bjHfUKZyVzOqBqEvDEsgAPkrMOfQ6AU9Rt3UgCJ+QDr6VOYnf99yU/QeNHlVnWJUc+JDo0U+y1WCS5lM3f6TqPA8Zxo0LbXSjw4taJeQZNa/Ge3G5K+eVQKNkOjL42mJkA2jFyJW+RjTFfXYRj5iJCOsdz0+E5AeX4hsmCEGJgROvA4XcaB08sR6akYvW0NW72BcCe0k5dxKMsPzjaQxiDWawaQ+86NYnNF9Hvjpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFPIEMFgj1dMCVMWsDLzOc+kGgnakV+Bh1O8g64xAIw=;
 b=OcGlARSOpXRji2pd+Ft8ZkyiCBhxswjq1F/Ib5BqsscOWXYtPnBJMi3Ohl5/A1YvtfOy6E+LDfHlrddZjuutswrBALD8rzymcpuml+usPBqL+TJOI/By/avyTz36MDjZwgDmtVkqNfZqfW7YYEq0de0/D+b5uNNf139FX5DsEAQ5y6rHz79Hr68JwvQ2WfHVuDfKeJT/5Mq9H37/f5OWRkg9LEyK5mKnxAru0Igc8B9kcDQEatm+n43bQUX2saDpk6j3QH0UExogbHM3z2rlm2AQPnQYmZSKFxW+HauK6SJRF3mULFV7m+1hyF1NbW8pPm04/T5W/GBli7UEbBCbDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8523.eurprd04.prod.outlook.com (2603:10a6:20b:432::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Wed, 14 Aug
 2024 18:51:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 18:51:57 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Wed, 14 Aug 2024 14:51:35 -0400
Message-Id: <20240814185140.4033029-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:180::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8523:EE_
X-MS-Office365-Filtering-Correlation-Id: d97483c9-6718-42e0-4aeb-08dcbc922c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nXqx+F6+lAcc/j6kmx067akmF2ObbKL2qucHskfQMw7gSMdIU9QQNqt2TgXS?=
 =?us-ascii?Q?SCtZ7PuZdpWr/AUvkyHxTJWujoi/dRGChAClwpdbQItkboT5H2TGJjikkVFx?=
 =?us-ascii?Q?WjqA9G5YJcJNdHFkXRkj+GoqbQqveU8rV9LH2MwhqtWGs/JqC9kWlYcNJmAM?=
 =?us-ascii?Q?es9sSzAuM8dSVvLq3Qh2hBP340E6q0MZH7ZwjVfkGXwzk245Xw107sSxZXu/?=
 =?us-ascii?Q?kIXCKhxuZpQRtoRNyauhaGwKns/pEJcGBkjdN/HktD26AwSRHx7MuvmhSPL8?=
 =?us-ascii?Q?AGeQlvusVkIKCd2f4Ys09uHyxyNA0I+08K09aHUNJUp4fbkO20aSXBn/6PwJ?=
 =?us-ascii?Q?0orwcgoCpzgu1FX91vhlleiyBq4Hld7ySqYjnFgfj5RmTaW5FYsL4R7UUmpE?=
 =?us-ascii?Q?tqYiTR++M789N5yExZvMdmE+4cIGdXKQUaATFKubNRr+X6zbiSika9Uzn49Y?=
 =?us-ascii?Q?HaIlcTG4wcGZi8NNsWQ7x7q8+bP/Z4Id7K2ma0T3OEUhbyeEE2yfUcXwwfxe?=
 =?us-ascii?Q?i8AGyNvejpvGCb/J5h7DSVZGbi00htxRKzl86Sn1MsJZNjzihPRneoYMuPzP?=
 =?us-ascii?Q?4W90kggy0AyhXxMhLEhXZ1vbRWB4diAW8B4GybUZZcIfG6OIUXllhZvsallg?=
 =?us-ascii?Q?8NYPrzw2ubda/wvn/XmxlMFPo/ARUoivWTCSjWuKmX5yYQ5mdZnqhgznUeV1?=
 =?us-ascii?Q?f0FIVmJ1N21qh9fuR922suJQ9wtfo75ZcCe1tX70kvTxfX3uWnYkpsVFU3Lu?=
 =?us-ascii?Q?jCzPRUtr5EezQTttHl4D2dIU1WEQbRRDWoVIe1PXi+PrgSWXOrOe3vio3YvX?=
 =?us-ascii?Q?whbzOJGs2QOr+V4spxU9Lx3w0MvEjQQWnvhYjepHHl0MyCLZKVZrMqwm/usH?=
 =?us-ascii?Q?mS29YrcopTCQZ1JiuA1uy0eX6/r1LUswD0PsA8jwQNzKo3Glh1iTMtCLyMr/?=
 =?us-ascii?Q?1m8wXtSkkmB2Iq0Lg23TOTuwL3hNIHfnd7fBnRUCmkDwlAe6x0eFCzEBWM6P?=
 =?us-ascii?Q?KxjaZMeDrDV+98pwYhlUz/6T3/0cu8dl2ZQoP1tN6J+8qLl1ICOKDAp3DVjX?=
 =?us-ascii?Q?ihP1T87LJ/pPD9hkH+y15xDeX1m2fobZXpXlmYWbJhWNoOra4Jq2Q3PwYR88?=
 =?us-ascii?Q?erRNrFcbEXwgboAfH4V6Q14fy3TPH/36jpLPzmnGIuiTZHCPFu3uVzusotkF?=
 =?us-ascii?Q?unrOnI32YWkb4ROnmlsYrJsTuV0+01ZDesFqB6sLQz3E62XYs37dIWrOxWxe?=
 =?us-ascii?Q?kUT/xPOhNQQPK5dySnFZZpJ9x2KlgphFOFbuSDcOOfK/cC/2HLsPG3Vt7qLd?=
 =?us-ascii?Q?pQkyLoCRbMyAuyFYqXwDxY1J3FUlRggz9Bhxp6IpXR8p4Rrz4r3bgx4pZOCl?=
 =?us-ascii?Q?WhEiam1bWN1BD6izvC8QypB6ZE03?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K5WZS7p/7YDffKXZ8heqzO1g2rhretRyLMED/DNu+Zxx+vmiC3NWCyAEhJzt?=
 =?us-ascii?Q?DEVtF+46QDBAfln3KGfp1p5dIrikRZbJuoqQ0J7ap3I2i7izjfvJ5++UtHmv?=
 =?us-ascii?Q?/3DrhLK8ESrzFKKSQ5xguW0i2uQsCfp0ps7bvqgBylLLhDYMBV7aT2VFpYMn?=
 =?us-ascii?Q?kzpSuTxjxQ2/TiGBqm0RGuueyaOqa+kyz3CmUrbUceH++xx/98u1RMZ5Ykd9?=
 =?us-ascii?Q?90rJDFKR1imygQN0DuQGLo3YMI0wIlOztcia6C4GCJdxo3ZF638KAPGBzyIt?=
 =?us-ascii?Q?1FDuk2NhVmeFAVq7YP4MhS5ytNjB/6hqAduIo0qfrkn6gcuL/cFbXPQGHmO7?=
 =?us-ascii?Q?O/mhuFUFDpQdokrlAtBveVrvXcxnmmjFVGrfuaYWKCE2H7yyDNph/ZmuVe9m?=
 =?us-ascii?Q?m2mHk9P65d9iOUUCV1OJbEpGhjcR8XuRFdn+fKu6XsPfGlP4vHhqPoZt2D3T?=
 =?us-ascii?Q?gSe1ARPYrgG4wG0rsYtzQITRX5lghF+EL3dsJeGJr3kIGWXBUt7O2OB4Lpht?=
 =?us-ascii?Q?XrHPtpUJBauSpM4LzhhBUCp5BXLK54GuSJlq2wBhKFczLJbHg+Rtp9dV1qiZ?=
 =?us-ascii?Q?NXC5WVddvwMJEAdX+kYFxyR/dM+8D74FQ8rqW4a1OfdnCkt+vXJMON3kUuM/?=
 =?us-ascii?Q?28GQqhyYw1+zNnsJMtss3eU1nq7JaWgbZYub5YsPZxFpKgKJv1MJoi/fMPI+?=
 =?us-ascii?Q?jTmQQG6nHrp8YHO/c8YrVOCe42J9cswiInpetGS1M4p6WOMYiCL+URTSFODk?=
 =?us-ascii?Q?/KLSihZJMN2HHu+Yd208RKbCyCyJjY0BUUuDZH/IinP7+1bSuiSd2O31ZWzf?=
 =?us-ascii?Q?J/Qy+XVgzSd0E2CEtqQchujYKn8Gh00YGq34nLASFwkl2FAzUE7Ns1vnPFNB?=
 =?us-ascii?Q?oYWtZPD3Gy1TSHHGVRMf2Rq/oeP27DNObXufaSRe19mspaGtnUCFUuqZjbF0?=
 =?us-ascii?Q?Wb8pLstXdnfqT6nGEHKBlkO0ZN5UXX+SiBLeWjz0+495+80rZ70joJJTH5H/?=
 =?us-ascii?Q?420geBg6jnlWLvWPYRwW4sHHNPWjKjF06NufJYqRE+vZwUV/6XWmukMzb1eC?=
 =?us-ascii?Q?nsuyRknNZlJO/mzWf8CeRidmQsVXfAaZvnajpAckiQ9DP/PKY7C8X2/sgYgX?=
 =?us-ascii?Q?ySPhaad/2FXWFhaFLziJdQD9xmiSOWiRnWl7h9/0Wpwe/kmh5vbWnaME6o9e?=
 =?us-ascii?Q?ksh7etbMucxiRourX+k8L6ZPAup55RMazZ2UWz+DIL3B9mhVC8GfcRlvsdnc?=
 =?us-ascii?Q?UlNUxkD064xIFtxs+u/X6sle/O7ZQ+FH3ZgbyKABRsPt10uOH5IjyeAk31mT?=
 =?us-ascii?Q?5U6Rjzbju2BCWSglDXBz5Xuq5a0icpxNAvlCmp8/ibEl1ZdNmlMLTKPxUypm?=
 =?us-ascii?Q?z5ewUFSIadcd1q5eQfQQihV7walpz9iTHjVxmk2UIpib01fwKzZTKhI9n0dq?=
 =?us-ascii?Q?qRx3l9gBjbY67r/LEVefDQcI319iynmFlQJJicraVZGuAw1wosGtT8tKaSoR?=
 =?us-ascii?Q?iY4DkR68dGrWwkAYf+mbKdDVWJb0nkAJ3tc2rQd93TAAxpOZhRmhNT4HxJ9E?=
 =?us-ascii?Q?hJY6NKvpgBYxU39a0VY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d97483c9-6718-42e0-4aeb-08dcbc922c54
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 18:51:57.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT1Xd9/KEFqY0f1mZO1bSFgkwcGII0hLp0Li85oD+vjKUVq8BbSxVC0TgEbJtMs+XktDH8T9bCwd/XTAtShNgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8523

Convert binding doc ads7846.txt to yaml format.
Additional change:
- add ref to touchscreen.yaml and spi-peripheral-props.yaml.
- use common node name touchscreen.

Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
There are warning:
Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref

I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
uint32
---
 .../bindings/input/touchscreen/ads7846.txt    | 107 -----------
 .../input/touchscreen/ti,ads7843.yaml         | 170 ++++++++++++++++++
 2 files changed, 170 insertions(+), 107 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt b/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
deleted file mode 100644
index 399c87782935c..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+++ /dev/null
@@ -1,107 +0,0 @@
-Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046
-SPI driven touch screen controllers.
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in
-
-	Documentation/devicetree/bindings/spi/spi-bus.txt
-
-must be specified.
-
-Additional required properties:
-
-	compatible		Must be one of the following, depending on the
-				model:
-					"ti,tsc2046"
-					"ti,ads7843"
-					"ti,ads7845"
-					"ti,ads7846"
-					"ti,ads7873"
-
-	interrupts		An interrupt node describing the IRQ line the chip's
-				!PENIRQ pin is connected to.
-	vcc-supply		A regulator node for the supply voltage.
-
-
-Optional properties:
-
-	ti,vref-delay-usecs		vref supply delay in usecs, 0 for
-					external vref (u16).
-	ti,vref-mv			The VREF voltage, in millivolts (u16).
-					Set to 0 to use internal references
-					(ADS7846).
-	ti,keep-vref-on			set to keep vref on for differential
-					measurements as well
-	ti,settle-delay-usec		Settling time of the analog signals;
-					a function of Vcc and the capacitance
-					on the X/Y drivers.  If set to non-zero,
-					two samples are taken with settle_delay
-					us apart, and the second one is used.
-					~150 uSec with 0.01uF caps (u16).
-	ti,penirq-recheck-delay-usecs	If set to non-zero, after samples are
-					taken this delay is applied and penirq
-					is rechecked, to help avoid false
-					events.  This value is affected by the
-					material used to build the touch layer
-					(u16).
-	ti,x-plate-ohms			Resistance of the X-plate,
-					in Ohms (u16).
-	ti,y-plate-ohms			Resistance of the Y-plate,
-					in Ohms (u16).
-	ti,x-min			Minimum value on the X axis (u16).
-	ti,y-min			Minimum value on the Y axis (u16).
-	ti,debounce-tol			Tolerance used for filtering (u16).
-	ti,debounce-rep			Additional consecutive good readings
-					required after the first two (u16).
-	ti,pendown-gpio-debounce	Platform specific debounce time for the
-					pendown-gpio (u32).
-	pendown-gpio			GPIO handle describing the pin the !PENIRQ
-					line is connected to.
-	ti,hsync-gpios			GPIO line to poll for hsync
-	wakeup-source			use any event on touchscreen as wakeup event.
-					(Legacy property support: "linux,wakeup")
-	touchscreen-size-x		General touchscreen binding, see [1].
-	touchscreen-size-y		General touchscreen binding, see [1].
-	touchscreen-max-pressure	General touchscreen binding, see [1].
-	touchscreen-min-pressure	General touchscreen binding, see [1].
-	touchscreen-average-samples	General touchscreen binding, see [1].
-	touchscreen-inverted-x		General touchscreen binding, see [1].
-	touchscreen-inverted-y		General touchscreen binding, see [1].
-	touchscreen-swapped-x-y		General touchscreen binding, see [1].
-
-[1] All general touchscreen properties are described in
-    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
-
-Deprecated properties:
-
-	ti,swap-xy			swap x and y axis
-	ti,x-max			Maximum value on the X axis (u16).
-	ti,y-max			Maximum value on the Y axis (u16).
-	ti,pressure-min			Minimum reported pressure value
-					(threshold) - u16.
-	ti,pressure-max			Maximum reported pressure value (u16).
-	ti,debounce-max			Max number of additional readings per
-					sample (u16).
-
-Example for a TSC2046 chip connected to an McSPI controller of an OMAP SoC::
-
-	spi_controller {
-		tsc2046@0 {
-			reg = <0>;	/* CS0 */
-			compatible = "ti,tsc2046";
-			interrupt-parent = <&gpio1>;
-			interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
-			spi-max-frequency = <1000000>;
-			pendown-gpio = <&gpio1 8 0>;
-			vcc-supply = <&reg_vcc3>;
-
-			ti,x-min = /bits/ 16 <0>;
-			ti,x-max = /bits/ 16 <8000>;
-			ti,y-min = /bits/ 16 <0>;
-			ti,y-max = /bits/ 16 <4800>;
-			ti,x-plate-ohms = /bits/ 16 <40>;
-			ti,pressure-max = /bits/ 16 <255>;
-
-			wakeup-source;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
new file mode 100644
index 0000000000000..b8239491c747a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI's SPI driven touch screen controllers.
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+  - Marek Vasut <marex@denx.de>
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+
+description:
+  Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046
+  SPI driven touch screen controllers.
+
+  The node for this driver must be a child node of a SPI controller, hence
+  all mandatory properties described in
+
+properties:
+  compatible:
+    enum:
+      - ti,tsc2046
+      - ti,ads7843
+      - ti,ads7845
+      - ti,ads7846
+      - ti,ads7873
+
+  interrupts:
+    maxItems: 1
+
+  vcc-supply:
+    description: A regulator node for the supply voltage.
+
+  ti,vref-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: vref supply delay in usecs, 0 for external vref (u16).
+
+  ti,vref-mv:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      The VREF voltage, in millivolts (u16).
+      Set to 0 to use internal references (ADS7846).
+
+  ti,keep-vref-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: set to keep vref on for differential measurements as well.
+
+  ti,settle-delay-usec:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Settling time of the analog signals; a function of Vcc and the
+      capacitance on the X/Y drivers.  If set to non-zero, two samples are
+      taken with settle_delay us apart, and the second one is used. ~150
+      uSec with 0.01uF caps (u16).
+
+  ti,penirq-recheck-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      If set to non-zero, after samples are taken this delay is applied and
+      penirq is rechecked, to help avoid false events.  This value is
+      affected by the material used to build the touch layer (u16).
+
+  ti,x-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the X-plate, in Ohms (u16).
+
+  ti,y-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the Y-plate, in Ohms (u16).
+
+  ti,x-min:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the X axis (u16).
+
+  ti,y-min:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the Y axis (u16).
+
+  ti,debounce-tol:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Tolerance used for filtering (u16).
+
+  ti,debounce-rep:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Additional consecutive good readings required after the first two (u16).
+
+  ti,pendown-gpio-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Platform specific debounce time for the pendown-gpio (u32).
+
+  pendown-gpio:
+    description:
+      GPIO handle describing the pin the !PENIRQ line is connected to.
+
+  ti,hsync-gpios:
+    description:
+      GPIO line to poll for hsync
+
+  wakeup-source: true
+
+  ti,swap-xy:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: swap x and y axis
+
+  ti,x-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the X axis (u16).
+
+  ti,y-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the Y axis (u16).
+
+  ti,pressure-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum reported pressure value (threshold) - u16.
+
+  ti,pressure-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum reported pressure value (u16).
+
+  ti,debounce-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Max number of additional readings per sample (u16).
+
+required:
+  - compatible
+  - reg
+  - vcc-supply
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    spi{
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@0 {
+           compatible = "ti,tsc2046";
+           reg = <0>;	/* CS0 */
+           interrupt-parent = <&gpio1>;
+           interrupts = <8 0>;	/* BOOT6 / GPIO 8 */
+           spi-max-frequency = <1000000>;
+           pendown-gpio = <&gpio1 8 0>;
+           vcc-supply = <&reg_vcc3>;
+
+           ti,x-min = /bits/ 16 <0>;
+           ti,x-max = /bits/ 16 <8000>;
+           ti,y-min = /bits/ 16 <0>;
+           ti,y-max = /bits/ 16 <4800>;
+           ti,x-plate-ohms = /bits/ 16 <40>;
+           ti,pressure-max = /bits/ 16 <255>;
+
+           wakeup-source;
+       };
+    };
+
-- 
2.34.1


