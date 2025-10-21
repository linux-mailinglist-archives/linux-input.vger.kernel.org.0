Return-Path: <linux-input+bounces-15639-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0607ABF8B2B
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 22:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3CBC3ADB1B
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 20:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E85A26B75B;
	Tue, 21 Oct 2025 20:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Efa9oVra"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011019.outbound.protection.outlook.com [52.101.70.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63281BFE00;
	Tue, 21 Oct 2025 20:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077986; cv=fail; b=U7rOdMqr9PQf6UOOqUZ7KT8Mld33FGvVFbBYuQVcCeCmttXqOzMqaykLkCkMcQsZtXy9/5eW0Td3PTtJTe3LpFJPKhd05/RaRqzXKgs8CcxUFrW/QgHQZIb/eMpwww9ScmBhG+vh6yBzgPHu68VWOPZhgibBcU/S6BuKCuh/p7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077986; c=relaxed/simple;
	bh=mVzvHDUy0iundIOD+Izp0ey76KFRQFgZjuCZccLVVCE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aJr40s5W7Qsm2syw9gpr3tpZypYRx0lvnhpwrljdNQpenKju0j1cdWCvMIUFClOYDD95jsfBBrUF1tAiXOVzpei7uX4lUgCBTsPP9hEG1/6yMAKP1b3UmAA9HwhZxjbqgdG/3ZgQfD1fiZ9ylvqwTLHix7V7YWoWAniBhVZ2zCM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Efa9oVra; arc=fail smtp.client-ip=52.101.70.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIBvCGPzoKI6ufrOvNtaD1nSD9MbfWUZLoG/u2QGk2nDjjmcw64hlCBN4Ywhk/ZPiwsB9IqMtSLoLhsf67s604pLR7g/RP0pvArluCmhM54AEb7LTm/SYZiszEXO5kAzKVLbLAMXkXiVUz/lPgF40MX3ApAbD0+pdjQnRrKuo6DHZE3nq4dt3EL9mgQaZ1O7ujRVdTfmc4BOLffdaoialYq5BhNRAQ5z33Z44qskC1/aXDjtZ6JhY+6n4O8nHZtCB9Xg86grl8tb7GolMpdh/S+Hm30Yw+3g1/mfzPBf4Rj4u2r241S/MyB20QA8NimAvE3+XUfsJomJZ4WA+POaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMyMkscfhr5ZMmlk+PVDDAYeJZ9wGqFsifdw3UMe9gc=;
 b=x0o7RZKrRxaPy35+6Et6EJNoIO7sqbytY9bBfLxEybhEmOztUcRUeK407fLo4gGY9oxmjO45mfbBY+rgOmXkKC4o426vA6OZDYJfdQoUp24hhxCMgn52ReVs+CEt9zMc7r/8b17yPDFQskwRnbFLnX9C9JsLLOp5QLLhZzXxRs9hhaOkiATZrmOncU5ogvxJMxBKisxWXIfWfHK1U7woK9rW6Ly4F2EWoyGm4l9ZsHhp4DFgucgl2C2e0ZFTRkqOceosE93Cnhs+hptFPVcKO0dHo4w4kArphRr5BlFDfERoA+IEj3i3efo6poHkCEwQZl6294LO//5p8r+RNnnafQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMyMkscfhr5ZMmlk+PVDDAYeJZ9wGqFsifdw3UMe9gc=;
 b=Efa9oVra6XfHO30w9x8BrcrWPPMx4EppBi3KcO+h3SGiASZgltPdxNLHNgQmqyi/bH139hSIYF49Ha/rU/TdF6pu4IhvtwZ5oEoT21y1B0DVB9AGuVDyPxgZeYj+rrs4TeMa5XqouGyLFZwNMNyLXwP/1iGYQDdmAhuKryFg5rPpg9DvN4ZJYV0YEFQq9h994E15GvCvhWj22JX4f4bTls2I6abwFq8XsGmzRmwW3HQidAmbVSNedvITwaiEtFNsX/KZBqtMqjrR+XWUOxdoRY7FH9Cb3TnhWeAG13ubX84WbHDpt8tF8F9xfQRPQF1+NrdLQPXfTnBIiwTBqO8dWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Tue, 21 Oct
 2025 20:19:40 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 20:19:40 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v4 1/2] dt-bindings: touchscreen: trivial-touch: add reset-gpios and wakeup-source
Date: Tue, 21 Oct 2025 16:19:17 -0400
Message-Id: <20251021201924.2881098-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM0PR04MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: bd49fca5-8410-4f6b-25b9-08de10df29c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0fI73uWa3Hc4apMAVLyJoYcqLaQGRzAWbCXFqn2HchAQ7+WXT+ai1OipBSXI?=
 =?us-ascii?Q?m2bC2wzkqoqITzVG49wOTExqJ8WXewFV0KEtsIs8GzVoeOlkCow3Kk1++FG0?=
 =?us-ascii?Q?UwW333EJzTUF9GjTdUbqBLyHtpWreVIy10xTGt+VHc6RiSPjiYajMlkFp0A6?=
 =?us-ascii?Q?a31yxCOghHKTYRO2RQFQKvP6qSUWrwRhaSpucoKbGKAmMq4gqKV8glbg452V?=
 =?us-ascii?Q?kd2jNdFK+7mJT8ivWAqlAqFnnyUEKpKZyONqQlvnhIkMnbNXvCRJfxD+dzj1?=
 =?us-ascii?Q?Z06HoxWvZziICmYMN0Y7h0X8X27CtRkMI2HxkKegKfftpBR+wX5oqVxBiv9Y?=
 =?us-ascii?Q?+RhMDMtUOqt17ezysIHfogBFsLTofUfRJW1MS25xHFtowe/SLgm5GyCgGaFD?=
 =?us-ascii?Q?vq55qG99HFQuxguTihM2M9Zw+qUN1nXI8RuMF6ceUGgMjsGfIF4IK4CXZJLz?=
 =?us-ascii?Q?RHDrpUIIQg/USwCnbMJ1A4/luCLmi7faKANyTXuuN0naNmrB9CJwsSIwtmWd?=
 =?us-ascii?Q?O0Ncokx7KFYxqfRCjdZ6GM5qz+I4NrromnNFIa3sIqGTJaG6paoOsy9Oaezj?=
 =?us-ascii?Q?ISggatI5AymOc3HqJs0XgeMlA8iMS6I2iROLeIqCFes6elIiVVvwS8lFSFfV?=
 =?us-ascii?Q?0uq6rnqvZr/oZ9cnqFx6879Jo1V74GLFm6ifO/iPTZ2W8BI0surQkuqwo5wP?=
 =?us-ascii?Q?1B/dAZ3VOKKARTtETmsyvMkMhLhVZTWhjR+Ilu/BL7dzwV/KVns/ot0WPLTg?=
 =?us-ascii?Q?nQAnuRzmM0XoqBj/hr9JbhZL4JW5yQpmug4npgz+X9R0dYgjSuRQNJatsOUq?=
 =?us-ascii?Q?4nDuFeYXZ1RGqOifl0rtmZY0CAPTMyu38vFB0yWHwvA635u7/9NBvxMDj8Op?=
 =?us-ascii?Q?zq5zV81NTPVR0a8iblc+rT1quQuxOoEyVh3ilyIEtZt0mSn0BTkid6Zh1Zz4?=
 =?us-ascii?Q?9n2gSAhhUCoJGEU5HEuJ7DxFpP4Sdv1mCP4LnRqn3RnCyoGCJoqN4Up9xVBH?=
 =?us-ascii?Q?jIRLNLa0PmAA5bw3OsME+wob9ve2ot5v2mYrlaSvQy5Dn7X5e3wvBuPChycB?=
 =?us-ascii?Q?/H4uu2PVTQaKM8gnzodE3qntF1jqVs5lGh4hEFL/X8v5A5pngjguYyrssp+T?=
 =?us-ascii?Q?1JjGhSsXolC44F9JMIEBIb9ScW3ZYHstV5Kejvu6G7F7flKw1j/z6Qd8mSN2?=
 =?us-ascii?Q?nTUKOughjzov5t4QXVUSKu/Uwrop0KX+BTF/xRK93PRQPiF/f8P8ghqAufu2?=
 =?us-ascii?Q?F/cHCs8DgSf1I2dzkcOP+2of9G1JK/C+47jOiZfHaSQjbnfWB2EfEbNmPga4?=
 =?us-ascii?Q?/algbaOB2k5eTuTLEaLkpq8unJzUaVtSfoYok8aEgcjGrvbHOQM6SB0eUbQZ?=
 =?us-ascii?Q?K5lX2tS8NuLNfNBOsA00fUEDRSdoh9gxEmatZ1EyoND51fDZ3huYU9u9Phea?=
 =?us-ascii?Q?4JiOJd/54GCA7A5297YciJ64LtN8Ct9Ybg3G+5Fy79UYo9kIz3guoZUMnnr6?=
 =?us-ascii?Q?qxurxPkNddAgnz8Sl5hhkkWi+TcBlwAsjoZJARltxkNw8pZhfG02hgcfXQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OIQf5um+vnSA8SqPIFf+nH71Vbd8bbetoP6UA6csZpZc4X7gDtnSWsCz9jXq?=
 =?us-ascii?Q?VN80raQkqx/M1lVXfq4IU/MekTkb+XNB6zIjaTny2prqdZqAOocmTSCXAqaD?=
 =?us-ascii?Q?SlMCyc5Cd9ikFnlu3995Z6moVE1H9qtffAezCG1Vtq6ZR6XvDH9I1ztoLWM9?=
 =?us-ascii?Q?xQWWYdvFgI6E5qaRoTbLi3h2QraDpOSLsB3y3c6zbNKX0Q5NWr4hrME7163s?=
 =?us-ascii?Q?cTNifYWiQeDJUyNYSsRvN25G1lV4BWshOtvyKG+3NYgqngQ/2/J3zo940LL+?=
 =?us-ascii?Q?s55fPTnSKESir/OhlBmqbNR4IXa7XuUOK5v1pr/PWoHNczBV/+z5EESZushV?=
 =?us-ascii?Q?YmcdosTnnQvttKq7su+e5+NikgFtDFBXPY7/4fNW6LueBrNQqGHAuZTTRFRz?=
 =?us-ascii?Q?9UJKQqBFLvy4H/BxivpcIwxnFARvU6fA4eXhFZDamWNMagP4y1sOpJpr4Sob?=
 =?us-ascii?Q?UH34CneDYwzo92CYY8ehtgL72ddZ97g4tvEKd/fBqw1w/aPOXyomqaHR3Cy9?=
 =?us-ascii?Q?29YReBK/VeYld5nEIO+SEaKJmxJJfr+5GdLs0UYyoyngmMYQbhMybfCu7XDB?=
 =?us-ascii?Q?ndLjzFEs85ehjGvEW2U+kZgPpUrHPfOr6WGnHjEQrFSz9IS3EctStAZBI3BO?=
 =?us-ascii?Q?v7ZXrCpGqallfPRNeZ8Unn01NEWyws2Qq03tUQYMc6NcbRTu8v4GDCNq5GtS?=
 =?us-ascii?Q?2B9bPxo3NYBMU/GznzReREXeDvGX8LitYd/l2XvrVvGy4WM4dkUO9pdfLygK?=
 =?us-ascii?Q?xozH7wbl0oNef4Sx+xEXexritPBjowWX5o1AxWGNOHzFdstS9yJyzwd4fbFK?=
 =?us-ascii?Q?GRuR0zTtYkSgcwleq22DRm5zVUsiyo7fFkX+C0m48K4FMmStnvxiiqUGQhQY?=
 =?us-ascii?Q?hi+FcUr5K0dP3LoQTzqE+Qlk5+KMR5Ao+qfu2OFwbcqIvzXwJPp0NDq0TUcM?=
 =?us-ascii?Q?SnBKvAuS2kwI7JVteSaqOPac+LqSwdms2tfLXezSKUp0vj52hIczcSmvYI7T?=
 =?us-ascii?Q?xP7vUTow9CHosuq19wYiEJFj319fA1bQIxpQZ4AWZjXxO9AmccHJSAPuTPVm?=
 =?us-ascii?Q?RqldXae0Hm/f35jwPQ85hWG54E0VZjMKekNlN0uy27DXw4Y7z1bddnkck69T?=
 =?us-ascii?Q?3AFTbKa57gDS688m6fzN3Gnboxub02/Wn0zpgzkXBJ8Vf5IPVqkCITVN32nb?=
 =?us-ascii?Q?NOv1I5vWk3lC4zATa5Y9erOb8i8hyIyJoX/85cRmxdU8N0h9fS7oR1sFgKAL?=
 =?us-ascii?Q?KFtuzfrJKzWzogZf1XRYU0RyDJ/k3aOQTZA+YOoF0PZTSCbx4KAZFNdGd1tJ?=
 =?us-ascii?Q?t9Nbs1a3l0zHlpnbMmcp+/JoiuXL2nOOneD7kcVlFc/YZj4cPAr/0yCYBePJ?=
 =?us-ascii?Q?KwEZw5wmj2Nc9RQRi8JcZPK3gUvX4/09nOK2XsQALv59yg3fEICBhgn4Rv2q?=
 =?us-ascii?Q?mblBCrc+y7JqDbjy/r1cuaRWU0JFyg8sMyuy8hZhIxeX7lHv21zO82PkqS/H?=
 =?us-ascii?Q?GdlLIsYZoRKJz/kL0gscUDoj8+FbQ2OvgOgMl1sSV4+DbwbVIx3yGyYU6BRa?=
 =?us-ascii?Q?MXydN5IC5/Um26f0r1Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd49fca5-8410-4f6b-25b9-08de10df29c7
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:19:40.1676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKvp+D9Xtd2GMtTScxSceqYlME77d0FC/i/sia8+klOp9b7ICrVUMzw1I9OV/MULrKRus3eM+F+FtdOIErGExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995

Add optional reset-gpios and wakeup-source properties.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
- rebase to next since v2 already pick up
- pick rob review tags

change in v3
- add wakeup-source and reset-gpios optional properties

change in v2
new patch

previous discussion
https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
---
 .../devicetree/bindings/input/touchscreen/trivial-touch.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index d6aed3afd4acb..46cf833344b11 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -23,6 +23,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
 allOf:
   - $ref: touchscreen.yaml
 
-- 
2.34.1


