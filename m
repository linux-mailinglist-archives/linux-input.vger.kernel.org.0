Return-Path: <linux-input+bounces-14465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B916B42700
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 18:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B20191A86C46
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D032F6560;
	Wed,  3 Sep 2025 16:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DiivGk22"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5901F0995;
	Wed,  3 Sep 2025 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756917291; cv=fail; b=OO7HK5t1nkatraYhk6JjgzBxIuBbmX1MzEagisplAyyyT05pDD8R31yd3ZWEqlQFzUA6w39+bDXpPJlQ9aiINS+147SdTv6f1Ft0DbCHgT+vzZdfVJAwjxcXmJbb4Vz+MmdSUCabjmR4kYzuw0IQkGoJ+Xn5W3RuxkEFVlC7ooc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756917291; c=relaxed/simple;
	bh=uT/etyJqWZ7+dWbiNTEP/VTqNz/YqmkjQQSZfbgKzQE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iVybnTiRKfrFEgS9PL6MwWumE71z9tULSQ+LROwpQ04CLZ+JDMnrIJ3fWlD65XyllU922O2e2+iULVxTlnD1tq+bq+bW/bqBLq4sMUhGkuEjbQX9hGCbWJPh4c8Fq08p2eInq3czeYQ+tr7hRYqfgTLxE4sJwh/IWxXx1CGiRAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DiivGk22; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGPUR5nRTteaq00+MdDWFzdFHpgnpR8lfO53klO5hywxsaFAMnJCIbWn3NJSpODRKZmovPbSBsPL3l9B0VNXbK2xWV17ZoKYprVr1zb/NwVMsa1HyOPPcaZhxma2wMmjGHQvpXOtj4xxCmzRmoKRzbuYSb18Ony8FWg16usqrm9uBxiH7ctwKf3nbztrScUia74+RFubDy+GQRRdSGmStpSBBKmrNRA2z+dS4Dso0YHV7vmbYgw+r2P9KLKjpIMC6c6b2Ho8/BmjSoqN4NGbqi6NkqLwS6tawiiNb/Q7GXfKc3/By63pEbAHF+22nd1HRqxWPnNNMnSRzEGorz3bYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GYvn+9lTIyCkVqWG2YmcrfVQ4BAaqsLhmFmmUJPcXWI=;
 b=YmbCcwWpvy0uEf6q4Z5EtYRdJgr/GqjEnQX3GVXgWkO9T+zwS49pbTPKcJCLQzXk0kIWvcDoFwLKLoTD7Aod21Tdxpm1UjumOUoSHYJ6LLvBzDBmmZNkZWdZ8A81ZBHA2D20VHl5B0wl+KLV9YoeNPAa3Ckix7E7QWA0IvO8UVsjayU6D3KN8/mxkUTZKn6Xr30OR4ugk8k5f9LmbrmvlyNlWyAsYAZDuF1DS1l+zxFQOEIdnLPNpOqt9n8QYOgZUXCN5SJ6wiV6Y3LKM1BjWIfHrQZc5g9SRAGQjMq9ZWvaxg5GD7UrYD9MliIy+/CmuS1gSMPd2e4PWpqzh877og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GYvn+9lTIyCkVqWG2YmcrfVQ4BAaqsLhmFmmUJPcXWI=;
 b=DiivGk22i7cm3DVi+Oc6ikCi0Sf7rk3UumAueXhdVxE/cuqk8s6dCGVz1XKtA3YQuNlnt3K40K9AarCkWA3/gHakHneQYTpgS9kwGj6jwSjh2kUbp9ZU9AjbqGuSWaf2baMT0fm6nGjKVnc+fE5FsbjB/oAhBzcr2zGkv+FY2ndoUBxt9aoMTbnq4VLJ/oFU9T3LccbIEsOkEgv28dw41DYxSBs9XAmxiR1RkTIGcQ0ij31xHndAKXds3b78b8C7bpj4GThjQBF8aOza76mrb7i60aALqTgyOKeCMByeqJEz7Xa+TNErjFjKW0baXkTXzPTJj+MmOZw6lSY9qbptRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DB9PR04MB9962.eurprd04.prod.outlook.com (2603:10a6:10:4c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 16:34:46 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%7]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 16:34:46 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: exc3000: move eeti,egalax_ts from egalax-ts.txt to eeti,exc3000.yaml
Date: Wed,  3 Sep 2025 12:34:26 -0400
Message-Id: <20250903163428.429924-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:217::23) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DB9PR04MB9962:EE_
X-MS-Office365-Filtering-Correlation-Id: 654d713b-1b15-4bdf-38f9-08ddeb07cb0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|19092799006|10070799003|1800799024|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7aSynSUSbJotRAF+VffYM5ExPw80ekFXi97vamdeo88eOc8m5MzyJPEQCZOk?=
 =?us-ascii?Q?nmbOkTWNHBryWdpKoq5fRbOV7SEKCQ8pF5F3zy/1iEbaytCAhmQBSjqO8r7E?=
 =?us-ascii?Q?2ZLepGH4wWjyuVvFalPDCrtFhOI6494RZvo71DWCwnQ0l71HbnaxYAHqwX/r?=
 =?us-ascii?Q?2+bNe+CqkyqVwvrJCJGbrxK/QaUVH6NrwlSWj1RsvcIJv2LJf9im3GRxbg50?=
 =?us-ascii?Q?KJd8mKUeMVqkpvLxzylBT1hUFU36SiDceFGZgKY4qGUH7A5tm8eigdRQ8eRG?=
 =?us-ascii?Q?T9yr7ULS8AVahiX0vrxhuRaE9vNTmUiHtcW86poZBfitmpwJxC+o07lYQwAa?=
 =?us-ascii?Q?zNJAFEpJklU3I/J69VzQNGBZVrFQs4PSa+E9lV5J1gYSV4GEJhXsHLzjYMpm?=
 =?us-ascii?Q?3TUFbURtPnf+Z7ETe3WyYlp0TJCxyl7/iNVslmNMQcwM3d1YX65QLXnysB9r?=
 =?us-ascii?Q?j0eK/ofwRCVRo73ZPxVIyeTyK6SZspc5X9/oIAUB75UFuAJ+7N+hrsBQ7DiZ?=
 =?us-ascii?Q?k3wgSl0NEDU8xeKQVM8S1LdcoD0f0Yw2ooLIfKJvdlpyVMu55qzQ5T9nSgLH?=
 =?us-ascii?Q?uIlWGTLmYXpzifYSYajIfQmsHORyiCtRq8SuwOmqI9AZhDyRuCNxHjgUBgDH?=
 =?us-ascii?Q?LMry+B+HlX2CJpt7R5kh4/QRchnVIjOBo8KjG8UagX+JlyBIGaRNhJAcdvVw?=
 =?us-ascii?Q?YcJnxpHR70FCn7RjeOCraAPbihiO/KUOAJYs4QW6me+0CSPHHlSg/gv2Nrm4?=
 =?us-ascii?Q?yFNXnlaRgZN/q1kQSOleDM3/MJoZUJhqkNhKHCe6rvsrnBpVa2IkWG1r1fi8?=
 =?us-ascii?Q?iMcX2fXOZncFDsdrsds3v7CqQJGKWCMs5G8y3MP0HaQDMMLIFeBH9X4Evzaw?=
 =?us-ascii?Q?RpEznWWx7n7Q+X8fXv8wkTyl0YL9DTImecTmejOzO+QnmvPhNeyB/NHabU2r?=
 =?us-ascii?Q?8DJr6d0kihz42GjPZ4WI66ldqz5sAvmoh3Y6qzYh+NX+xq2OfoZHnw+8OLne?=
 =?us-ascii?Q?2YaVMeILIsFTKVFP+CrHZiKHME0uCiN5A+PSwJC+dswyooxuLFqwiPr2Lu2l?=
 =?us-ascii?Q?viGWHthsdFwEEUjcZrhFmwkWFqN7+N6FeCbeBtvm+PqGH15WDqHRSqkvjWAP?=
 =?us-ascii?Q?bnMj+yT6R9W8Lg/xLtLxTwnGDm5lnhByRV1kLwOUZxLcSKE/LrEZ3FTQ/RT5?=
 =?us-ascii?Q?YJ4xYNQj+2wSVAjsNrjTb2RHQ3hK/NcMSZmqWLT1zWTQtgE0HdT/pSDrwQZi?=
 =?us-ascii?Q?P/HnZDEfWgrkbeKGkUUGEoHNj9uWfege9APW1iYdwnlB/zGJaI58WPk2A56m?=
 =?us-ascii?Q?y9Q+4q3IVy3eigJ7Gs4grmNdBI4QQfufShiKs4WADk86O71dKGGjl4ISJWrN?=
 =?us-ascii?Q?VU+NjxXV764Fpo9v6FyitpqbxnJnV1eDx8XKNYJBN2uy9ynUaL/Rgp2xLFoJ?=
 =?us-ascii?Q?9JsWtSBCieBZhZR9elrDa84rl+cTA5FNYxf92ZPAEXGCcl8TO4o2RA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(19092799006)(10070799003)(1800799024)(7053199007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o1uwLvXTpmoli807ti1QnyIBZXLyuaeMcVBF9mq6L4ptbNFs2GLLqdLUBGHk?=
 =?us-ascii?Q?B9vK4FvzqcGD76Zq2Y60/7u0JB87z7IXvybW9KZrFEWBm2WPVc8culET9Foj?=
 =?us-ascii?Q?1yCUEDvPZpiKLVUnz3VFFNp/a3GyiEWvO2tuK6Db0fffbWQFENW/8vjdhArX?=
 =?us-ascii?Q?FmRNWinkbfqEhRj0Kn/hmDck8qxRWFyyWFYqyYRjulBNIpqZClM2KmhGZwla?=
 =?us-ascii?Q?I8BKsca5AKJGwjrBvunRd6E86AUv6OlnIl5/a+uxEAQUL4c/Eevs/wY7k4Bb?=
 =?us-ascii?Q?I16dioISgdTae1wHsLJKDpOhRmHboATxI1YDbrKrweaxuY4kEynyIUPNnupB?=
 =?us-ascii?Q?KxASO833KBOHCtbcbeYyTpH6bU3UkOPQ9DhxFPBmIV8KJ8BinB9rFj6zJXhD?=
 =?us-ascii?Q?O+Wwt783pX80evJQOubIGLN/kCDEIIRkGiW4o/3GAZdOpylNNohD6dDS5do0?=
 =?us-ascii?Q?xRh7rOhNGA5WCPVK8lQ9uy1K5uLIJ6Y8lGb9mnwm+VQMeCcQVk3Or8rD/BT/?=
 =?us-ascii?Q?1QjrgoeHVFJrJ0KYiNsYHNsCzw2DeCVb8Jz7Y9oX7JdjCVvfYZS6tRKmcj9s?=
 =?us-ascii?Q?eeUcM8+FSDXvhbGsZrQsNEqnlr/DVvWtp7Ry/M/Sk8x7a8jU1m2ZocUEFaF3?=
 =?us-ascii?Q?IuPPLNRxWmoaKjJu2017Lkp7Aihp75VrkCzn9gThz52ewSxUQrfhIN5tXtYL?=
 =?us-ascii?Q?aUV9L1YBKnsPNae4NCyBpEbn/tdj07lcvc8p7pOxdtwqfdXnvF0FD8HyrsCl?=
 =?us-ascii?Q?IGXf7t8fUsw33bXfopjq4cUXnzVPeWag2bW+/V5695DAFibhqF8OGsjPFORb?=
 =?us-ascii?Q?uQ4mXVLGLjdMOV68eQmSXo+0d0r3SdpWNpZi+bMhotxe3M/7nLThePsyO1zt?=
 =?us-ascii?Q?ojsL9jm1ktmm/8cjp8JUS5DxF6VBGVJj0EN5NSJOiviChRHWYNp1qYi8A0YT?=
 =?us-ascii?Q?Mc0UfZiXqBTupNuczwoh3Pcw3YPUFxsiWybWPchkYsD0JgD0P6jyoBxbe83P?=
 =?us-ascii?Q?TCtTscWTfWHlHian4WncudIXLmBTtZkFtAi5NhZ6JXcqSLvlM78th2FJTO78?=
 =?us-ascii?Q?eAfFFQDygNsiAaPzXq51nLwSl8XhWcW6cGYuwRVOpSz46W4X9tAqimt/Qyvo?=
 =?us-ascii?Q?+WGbATSxF8ctCvxWWqM27eq0eovTZgU5yIxWRU5JUolarAtMO4NgpNAK+331?=
 =?us-ascii?Q?ZfQe4U2zrcBPe5maex+ZqIco6C3CkV6d2g5L8vZ8VqTmWY4TmJYBQA7VGkSG?=
 =?us-ascii?Q?gI2cPB2xDkP4k5TTzvC1LO3FYb9R3bJhcBscum1pSIyoIgMkrMCJTWp3ZKo2?=
 =?us-ascii?Q?+LwC8Ts6blH/NhJYcqDY2IAm8i9jhgsiojOarGD+Gx/DaKF9GygH/7lwI2XP?=
 =?us-ascii?Q?rijsQHzhrEREsXbDJDytwC31XPwChSJL6lnLxT/6KB5NUbSzhMdPbr991jr7?=
 =?us-ascii?Q?8fhm0RxOGk/R/P6AWMymr5kvGAEGx0HiZFAOAxyEfRHoAvnE3l7QK2kNfc1D?=
 =?us-ascii?Q?wQ/QfO+VVR4iTr0ogm47RtT7KmKb8mgQd3YVulBN7ms1knjg+WCBsVm4Ru3h?=
 =?us-ascii?Q?jxWVtyGGAT5xslrNnheaKVfqIc8d4Qqp/Rd20lUXPp+9/DsgonMECV9FPNYQ?=
 =?us-ascii?Q?J0eBUKZCMQcC0nCzbnLRmkea5DghInJdi6SuP6Ki9o8S?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654d713b-1b15-4bdf-38f9-08ddeb07cb0e
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 16:34:46.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maNWCbCushHbjIN1RA1ZCkLwYhp78J3gKedyp+TW2Uyaq1RDrMwyftA2Si+FCv3WjrA8slgF8dJ3TS9Cnmdk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9962

Remove legacy binding egalax-ts.txt file. And add compatible string
eeti,egalax_ts and wakeup-gpios to eeti,exc3000.yaml. "eeti,egalax_ts" is
general compatible string, which is not preferred. But it is compatible
with old devices (older than 10 years) and existing driver in
drivers/input/touchscreen/egalax_ts.c.

Fix below DTB_CHECKS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/eeti,exc3000.yaml        | 18 +++++++++++++++---
 .../bindings/input/touchscreen/egalax-ts.txt   | 18 ------------------
 2 files changed, 15 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
index 1c7ae05a8c15e..40449ed168284 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/eeti,exc3000.yaml
@@ -9,15 +9,13 @@ title: EETI EXC3000 series touchscreen controller
 maintainers:
   - Dmitry Torokhov <dmitry.torokhov@gmail.com>
 
-allOf:
-  - $ref: touchscreen.yaml#
-
 properties:
   compatible:
     oneOf:
       - const: eeti,exc3000
       - const: eeti,exc80h60
       - const: eeti,exc80h84
+      - const: eeti,egalax_ts # Do NOT use for new binding
       - items:
           - enum:
               - eeti,exc81w32
@@ -28,6 +26,8 @@ properties:
     maxItems: 1
   reset-gpios:
     maxItems: 1
+  wakeup-gpios:
+    maxItems: 1
   vdd-supply:
     description: Power supply regulator for the chip
   touchscreen-size-x: true
@@ -45,6 +45,18 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: touchscreen.yaml#
+
+  - if:
+      properties:
+        compatible:
+          not:
+            const: eeti,egalax_ts
+    then:
+      properties:
+        wakeup-gpios: false
+
 examples:
   - |
     #include "dt-bindings/interrupt-controller/irq.h"
diff --git a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
deleted file mode 100644
index ebbe938105745..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-* EETI eGalax Multiple Touch Controller
-
-Required properties:
-- compatible: must be "eeti,egalax_ts"
-- reg: i2c slave address
-- interrupts: touch controller interrupt
-- wakeup-gpios: the gpio pin to be used for waking up the controller
-  and also used as irq pin
-
-Example:
-
-	touchscreen@4 {
-		compatible = "eeti,egalax_ts";
-		reg = <0x04>;
-		interrupt-parent = <&gpio1>;
-		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
-		wakeup-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
-	};
-- 
2.34.1


