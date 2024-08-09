Return-Path: <linux-input+bounces-5472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED5094D7D4
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 22:06:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1135B282E92
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2024 20:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181E91607B0;
	Fri,  9 Aug 2024 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GU3hZb+k"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010044.outbound.protection.outlook.com [52.101.69.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A6F1D551;
	Fri,  9 Aug 2024 20:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723233963; cv=fail; b=aZYD70muPAiZvvGuUhntPC8x/f0NW5x1cxQmIXuCo/lZnWtZdtKWq9wY12dRKaVi908/BWQQJTrpOEq8CHboQ/dMl7kxy6AhWavutSjoUhfeBjmlpfsb9dIKUb11H33KIR4LraHdl2c753oYsIPQJiyzqszM+7B81sqPOmbsOxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723233963; c=relaxed/simple;
	bh=LN6bA1GRqxFxdm2yfKujDBt4LK7Gw7suH0KjWSPCU4g=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fctCa+ATxHnoFw9c8uoPlcCj0zm0DAU55AENDN5mDAeAR4jBi6Hpfn+oGPUySuDWXWBeSfFsb6kpkBRArDiWV5AbndVtamoVyBcBnL3/5igs59qHStbYi91kE/eS5nITPjfMYsCawm4APPbGBXtWlUpFBodjMXPN59+VjDMYxGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GU3hZb+k; arc=fail smtp.client-ip=52.101.69.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MP0aZisMZmbaHUPxtTRD+VSlI0HebMEO+Rlw4tt2lKxvzFJjecoPd1Z6Mb8WBhC6t2mSTV6+EgmLiP5CA2KudyaDCgDwbltw3sklD0GugNvU7+SAdlhkdQZWgNBYkSHskqsLf2vqbudd+55x+0LQIWu3znIi07eE5pO9tlgOGBmUg2m9QjOVgdQVZpB6re3ar38Aiq6LTRgRMikh2jOHN8gNSIbOScAYwFURDTzsAtJQbCJsDJMWzaU89feWysx664KCTYBtLLwk/o0FCNwiK7G3t5R6znbEGN8Wu+D7cp0igvkQRlmlHdwbnpptKuIh8l3V1nK9u8B2Pi9hYzdPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmd/PBarA40TNIlBuw25Ugbe58YAGnHl/TAyJoBlEn4=;
 b=rg3kJBUWG+T0YWh3Cu02m/u8JdIA//jp5H5F10I897B+KHDeML9qShj04xSGZzO7GZAEYn0BfA9rbnyvZMhyJrL/6Ai6B6VoFA6hGt9clexeHRAoGXHtyDAdOGWsYlITYP+TrvzzjYI0JLnX4YQ112vwhEQjj5mBxFxqdj/0NSPLtMlm2rwvGec0u+foCd0XQsnfmtrkUF1qkW7mY+0+6D76nWsA25Bo9lpChFFl5hFHbGKY3tqygKtuC8RuGRXcGYaVfYUVjzv5zDVBoZyoS5zWYEVVi4FVVajaMhNdB1bWHqpB1kDD7AJVRWfjwfY0/GHR1mm1Re1CDkgh1QjTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmd/PBarA40TNIlBuw25Ugbe58YAGnHl/TAyJoBlEn4=;
 b=GU3hZb+k3RKtUW8zYV2z2uJixitxAAHUlF59eAGo4GYv6m+DX16KdrAe7OQWp82mYuSPHPHKM6ctxeKQ8GKHCdNoyxogOV9Xn5wO96jFEZzHBrkWNv72t/eOISNuXz/k2kETP+QymgpunWPVNd20ye5XFSHQkYkIblGAMkMNeB5EdC6JABeXwqLqWEaHCmkeeyS5fb6v3Ua6VJY9TYR5JkhNDhy+fh9GShbQxs8vsqf4nkdg78UQFcY6U3t0GyCFQT/hslmzmKcrX6BqxW8W99SPqW6SKRTumwIV3bsuW71mHmDoIYOoXzZ4C0azEf8XGzjMymxr+JStXd5pQLlBGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB9955.eurprd04.prod.outlook.com (2603:10a6:800:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.17; Fri, 9 Aug
 2024 20:05:56 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.7849.014; Fri, 9 Aug 2024
 20:05:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert ad7879 to yaml format
Date: Fri,  9 Aug 2024 16:05:30 -0400
Message-Id: <20240809200534.3503223-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:180::28) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f52045-bc33-49a6-3f40-08dcb8aeadcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7pKu1y3+nnlslPIiHZtw6Qh2VPRU6om43KMJ4aMA0ij4XMNyOpmRudNm6zGZ?=
 =?us-ascii?Q?1i6ZZPKuvAmBQ/nw7r45BX3H/W/9mVl1bFlCXILlK2B3K4BU5BHAssFU8OGE?=
 =?us-ascii?Q?q1t82x0amUs+Vbogerf301XXjgSNwPR6FeQOOpM/EfotRnvr1+QACa14O3XF?=
 =?us-ascii?Q?ej6KqT8H129oMdUi7tPN3zIY86WLiLlrzyl2jRd+n27Pa3+HgIA1A+/gibX3?=
 =?us-ascii?Q?vsyXG//O8atG+OBNji8TuQFR1pNq9bGRoqZiqS8VoSiiJ5+Gz+qYzN3wiTGk?=
 =?us-ascii?Q?t0R+XTtqk6yNuHPnQyABtxXJiPyDeJjvq+TC9NQByMgXLe7lzXS3Xxi10o/r?=
 =?us-ascii?Q?mDIOoU4cDxRL9RVWS6sTX3BgQoez2aydVhroO9OLwWpJ3xajZ4eXSzJMiRyC?=
 =?us-ascii?Q?wjQClLFoVDWtgej5nKBHFCma/JIXft3zOyq1qc+D72vAeCG+HtmB7/tvnHzF?=
 =?us-ascii?Q?NTqg4H19Go3IntBFQgIyngz7NqIulC8aXQtk507CLE0cgDti4QbaI74liswh?=
 =?us-ascii?Q?/q5Wsc4pyr6IsvY7t0430LL+GGtvoMk9SzUeYyaWiMULLFQ5s0T6NUwaLrHG?=
 =?us-ascii?Q?WfT+5XUF3ia74ZM0rNJBm4+o+c/WVCczHB7EtTJSdH7MEz4rh8khD5kwuUm/?=
 =?us-ascii?Q?t5WF9bkpLjYY/1j5tRS0Zn8dbORRmai3g6fCHEG7zwSSh4tpKOL/W3bAGjFy?=
 =?us-ascii?Q?P3u+2DU2BBD+ywYCtOolhPkcmDUdbEJyqpCBrhT73lkM+ttikWY6e73SPPT/?=
 =?us-ascii?Q?eb4SiQFyuoydBmL0AvrDDYunb36i1lYO+ffZX3MumaG2mdU2xNIBub1/+drs?=
 =?us-ascii?Q?FLEawOPV0KeE4UozhB2l24aYV/THrtQJCpBSn48GicUfPTFxB3AOgbDXc5DD?=
 =?us-ascii?Q?tUsE1CSw0jFhrOmErxAVMZK/Z6OHeonzwA6LocYnkbU25+sdW8XeUKEWMxJY?=
 =?us-ascii?Q?IsTzDeNhR10nYpV0V/pXgj7f2LADoNOuoj5P8fnB5FF5MFV1MLMEv5ap7r5N?=
 =?us-ascii?Q?YykmXmtn1sO42KhoH1DsiimDC1KyIDl49XyXrk32WKOvQuNAwY7T4cHsKPUt?=
 =?us-ascii?Q?sAg2RTGXo5zO0u4lFlw8V7fGlCrC1cUugG6uHoMJvvVXJkaW2JY2P1oIFQZO?=
 =?us-ascii?Q?/48i4EYUdsXToSVNIthahkw9A6bdaxZTc6zjI46BGsX62il/EPuhMS7CADm0?=
 =?us-ascii?Q?6HRVHBMINjOBOOFEAXRgAw6BDfFBunYOBhomC4184yaG4N5oLW3vTgJZ0q96?=
 =?us-ascii?Q?MEkDEokRoWWbetVUW7RTcIN28tbTKoAs8LJzqWcLV/DIJbA9RIqAI9Ko+3z8?=
 =?us-ascii?Q?/RBZmD4hI52eXsseLWQg1W7qn22gMkjITKWO1wx5O/gnzqR9ZDh4yxc7V8EN?=
 =?us-ascii?Q?nkUr3XM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fXbdIewLYVf2P3byM8i60UdaV9GpTPtissQ2J+yWDo4bxJnmFulAz2CUsvnm?=
 =?us-ascii?Q?c9XmkpAlEVB6Zic/iEtlDnuakm0CfSaOxkp3qOTUJOTSVGnHln7G3jwcIkHI?=
 =?us-ascii?Q?sxUQ9zkYMluMPk0YlnuNTsOP0TA9kVIgvPQmSNB44m+1pZaao8DpHnsNkdSV?=
 =?us-ascii?Q?KJsQFcC7CMcAirDHG6+V5QAMKJIPZD/topcXbPmEgkefPTgMGJYaMdah/Cb3?=
 =?us-ascii?Q?BcnYnU8LlAD4OMi1ks+MOrvWGcZOGoU+XQ/yzdR48ebp7GtYkup0Wc7xgRR0?=
 =?us-ascii?Q?Unp1Mj+4/S3WzrMo4t2UmoKFXCZn47q9Tk2Vb1aeSEvUmVsHCfcRNAu+Q94A?=
 =?us-ascii?Q?IqyWbCIfqjTcKHe9I999wUDl6cyE6kvWnXzpMUEMoegeKRb9h47WemeQ0leQ?=
 =?us-ascii?Q?h+tRG0peg+S+cGF5jIJQvk/zhF+mF6zRSBkSuqw93o+L2kg82og1bDEeDvPm?=
 =?us-ascii?Q?k1aF3zqHMcrflT0LIx/JDLRugrWeMra9Zq6sgRWB6cJvaTX7SGZJ3CRuT/AE?=
 =?us-ascii?Q?rpWzexHdH5hJFUlo2xeG3NhfyZgiTVFQYGXlYg0roC1bf/2As2KtH65fOs6K?=
 =?us-ascii?Q?T3NA4/S2XOmvFLWQThaX/HRDIYHQLfNL8d30nkte6Qp5pDzemdKL63g9c3Oe?=
 =?us-ascii?Q?K3/vRE2cyeTYzNiLdUovaLn940I3djezw69jaZAvH4B7QO9j9ij3lmxnf5v6?=
 =?us-ascii?Q?MPwzIZUy9HQHYs4Km7Vdg9SoeQTDUpZLgeRuBnKXYJRthpN4sjhp7FBC8eDQ?=
 =?us-ascii?Q?9zI6+oYbaoA5ecg0ZKBWwxXm/LANc/mjvITnH5AlQXSzJb7QCEQRE/AyIE65?=
 =?us-ascii?Q?IOe58/ok0+IcXAuFS+lRYnbWAQKL6IrHFJ7fpYr17G0g2E0Kb9I9rP5ygfu6?=
 =?us-ascii?Q?Zd55tfnarSLT8hKtw6PrQNolUYjVnILVuquQTL0c/mUbF/x/VRxHQBea1r0O?=
 =?us-ascii?Q?5RdQhzE6Esc6RnoksStwzyt6pK26vM+2vb6ZSX9+0wZwX8FQFVYen4CDmkOH?=
 =?us-ascii?Q?4Elw9WBeBGTan0OHu8Fb7DazY2w/t+TUgqSaS6rTRnTrGGiKvqwV8tPdpoE5?=
 =?us-ascii?Q?bLy7QfaEIKlYeIpsydLKm4UROLPRq8jAVydoHeYfVVQ59bu4A0lQ6Q3tcTKR?=
 =?us-ascii?Q?u6ouUYnWgqadtn1zJBAInxKNyxLh8oBZ/eQFqtRdq1L/JaDwk81WOty//sll?=
 =?us-ascii?Q?O96Wu2T8Ccgks14HiXlh+r/JFCeexFSxgyXvLHMASIphvu7psNfNjIeg514c?=
 =?us-ascii?Q?lwxjtMDoFi8QDY1juc3CmMK7PtwfYsS/eH4758Xjrw/H+EPH+6adLmKG3GZ7?=
 =?us-ascii?Q?mjFdJrpIxF8WUzfeyJm6ElDGStlS4OcSq/GGNC4iWcXh+YoYMzNo0xQ3iTs6?=
 =?us-ascii?Q?5fwpldPvWchtmlyZCE1vW4TjJFxjl96xSMfApGhE6B5dsZ1WoWsLtSJjm85C?=
 =?us-ascii?Q?tw8FFAYmCfLm6rRRQcRZKD18MRVV3BqE+YVSkriqBibRHczWwY7i5dChzihC?=
 =?us-ascii?Q?64AYFCjLiY/YfgS6Ts+FxzDjVSGHNnEFi/+emAoEYrMUsmSJ764oaK3Ty8Ri?=
 =?us-ascii?Q?r/QS8RobzE0c2hNJEVg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f52045-bc33-49a6-3f40-08dcb8aeadcd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 20:05:56.6941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx1Hhn2FO/qHwtchc7sSDw6vYdOsszNm2rskbvrVn6Xa9kj2XB8uAkXdvaWyMzTDCKTkuAbhmic2vbJwzhsuqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9955

Convert binding doc ad7879.txt to yaml format.
Additional change:
- Add ref to /schemas/spi/spi-peripheral-props.yaml
- Add #gpio-cell
- Remove  spi-cpol and spi-cpha in example, the place hold 'spi' can't
correct detect spi-controler.yaml. So these two properties can't
be recongnized.

Fix warning:
arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dtb:
/bus@5a000000/i2c@5a800000/touchscreen@2c: failed to match any schema with compatible: ['adi,ad7879-1']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/touchscreen/ad7879.txt     |  71 ---------
 .../input/touchscreen/adi,ad7879.yaml         | 145 ++++++++++++++++++
 2 files changed, 145 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt b/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
deleted file mode 100644
index afa38dc069f01..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ad7879.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-* Analog Devices AD7879(-1)/AD7889(-1) touchscreen interface (SPI/I2C)
-
-Required properties:
-- compatible			: for SPI slave, use "adi,ad7879"
-				  for I2C slave, use "adi,ad7879-1"
-- reg				: SPI chipselect/I2C slave address
-				  See spi-bus.txt for more SPI slave properties
-- interrupts			: touch controller interrupt
-- touchscreen-max-pressure	: maximum reported pressure
-- adi,resistance-plate-x	: total resistance of X-plate (for pressure
-				  calculation)
-Optional properties:
-- touchscreen-swapped-x-y	: X and Y axis are swapped (boolean)
-- adi,first-conversion-delay	: 0-12: In 128us steps (starting with 128us)
-				  13  : 2.560ms
-				  14  : 3.584ms
-				  15  : 4.096ms
-				  This property has to be a '/bits/ 8' value
-- adi,acquisition-time		: 0: 2us
-				  1: 4us
-				  2: 8us
-				  3: 16us
-				  This property has to be a '/bits/ 8' value
-- adi,median-filter-size	: 0: disabled
-				  1: 4 measurements
-				  2: 8 measurements
-				  3: 16 measurements
-				  This property has to be a '/bits/ 8' value
-- adi,averaging			: 0: 2 middle values (1 if median disabled)
-				  1: 4 middle values
-				  2: 8 middle values
-				  3: 16 values
-				  This property has to be a '/bits/ 8' value
-- adi,conversion-interval:	: 0    : convert one time only
-				  1-255: 515us + val * 35us (up to 9.440ms)
-				  This property has to be a '/bits/ 8' value
-- gpio-controller		: Switch AUX/VBAT/GPIO pin to GPIO mode
-
-Example:
-
-	touchscreen0@2c {
-		compatible = "adi,ad7879-1";
-		reg = <0x2c>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-		touchscreen-max-pressure = <4096>;
-		adi,resistance-plate-x = <120>;
-		adi,first-conversion-delay = /bits/ 8 <3>;
-		adi,acquisition-time = /bits/ 8 <1>;
-		adi,median-filter-size = /bits/ 8 <2>;
-		adi,averaging = /bits/ 8 <1>;
-		adi,conversion-interval = /bits/ 8 <255>;
-	};
-
-	touchscreen1@1 {
-		compatible = "adi,ad7879";
-		spi-max-frequency = <5000000>;
-		reg = <1>;
-		spi-cpol;
-		spi-cpha;
-		gpio-controller;
-		interrupt-parent = <&gpio1>;
-		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
-		touchscreen-max-pressure = <4096>;
-		adi,resistance-plate-x = <120>;
-		adi,first-conversion-delay = /bits/ 8 <3>;
-		adi,acquisition-time = /bits/ 8 <1>;
-		adi,median-filter-size = /bits/ 8 <2>;
-		adi,averaging = /bits/ 8 <1>;
-		adi,conversion-interval = /bits/ 8 <255>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml
new file mode 100644
index 0000000000000..57cd68a573d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml
@@ -0,0 +1,145 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7879.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD7879(-1)/AD7889(-1) touchscreen interface (SPI/I2C)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    description: |
+      for SPI slave, use "adi,ad7879"
+      for I2C slave, use "adi,ad7879-1"
+    enum:
+      - adi,ad7879
+      - adi,ad7879-1
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  touchscreen-max-pressure:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: maximum reported pressure
+
+  adi,resistance-plate-x:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: total resistance of X-plate (for pressure calculation)
+
+  touchscreen-swapped-x-y:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: X and Y axis are swapped (boolean)
+
+  adi,first-conversion-delay:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    minimum: 0
+    maximum: 15
+    description: |
+      0-12: In 128us steps (starting with 128us)
+      13  : 2.560ms
+      14  : 3.584ms
+      15  : 4.096ms
+      This property has to be a '/bits/ 8' value
+
+  adi,acquisition-time:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      0: 2us
+      1: 4us
+      2: 8us
+      3: 16us
+      This property has to be a '/bits/ 8' value
+
+  adi,median-filter-size:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      0: disabled
+      1: 4 measurements
+      2: 8 measurements
+      3: 16 measurements
+      This property has to be a '/bits/ 8' value
+
+  adi,averaging:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    enum: [0, 1, 2, 3]
+    description: |
+      0: 2 middle values (1 if median disabled)
+      1: 4 middle values
+      2: 8 middle values
+      3: 16 values
+      This property has to be a '/bits/ 8' value
+
+  adi,conversion-interval:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description: |
+      0    : convert one time only
+      1-255: 515us + val * 35us (up to 9.440ms)
+      This property has to be a '/bits/ 8' value
+
+  gpio-controller: true
+
+  "#gpio-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen0@2c {
+            compatible = "adi,ad7879-1";
+            reg = <0x2c>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+            touchscreen-max-pressure = <4096>;
+            adi,resistance-plate-x = <120>;
+            adi,first-conversion-delay = /bits/ 8 <3>;
+            adi,acquisition-time = /bits/ 8 <1>;
+            adi,median-filter-size = /bits/ 8 <2>;
+            adi,averaging = /bits/ 8 <1>;
+            adi,conversion-interval = /bits/ 8 <255>;
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen1@1 {
+            compatible = "adi,ad7879";
+            reg = <1>;
+            spi-max-frequency = <5000000>;
+            gpio-controller;
+            #gpio-cells = <1>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+            touchscreen-max-pressure = <4096>;
+            adi,resistance-plate-x = <120>;
+            adi,first-conversion-delay = /bits/ 8 <3>;
+            adi,acquisition-time = /bits/ 8 <1>;
+            adi,median-filter-size = /bits/ 8 <2>;
+            adi,averaging = /bits/ 8 <1>;
+            adi,conversion-interval = /bits/ 8 <255>;
+        };
+    };
-- 
2.34.1


