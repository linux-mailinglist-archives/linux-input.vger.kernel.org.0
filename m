Return-Path: <linux-input+bounces-14497-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C89B446FB
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 22:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1C2C7A63E3
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 20:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6461527A935;
	Thu,  4 Sep 2025 20:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SGWXpl3X"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07EF27A123;
	Thu,  4 Sep 2025 20:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757016426; cv=fail; b=Evyh/1N0LcrqLAXIojmdv82FasyFrsrnKw19wzLatjnkU985acwRRJL33U0bGn3a3YX3tAwZdszOZy5V0McqBSa06D2EuvEIhKq9CPdOaq7nYEo9j45hT5pv+0GLwySiHBbpQrPvN0XgXj1xQzyCDsa4z+CyWdhXocZrxnPwcPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757016426; c=relaxed/simple;
	bh=oR6L9YmZOj62y4L1uO8TLLXnxz4LgsT5kIgwb/aIpuw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YcqZ3kJ5fP0t3gRs5h6KAARE2m8uRt+rIL2V5DgQJI/Kb6zikhq1BfpwCxBZ+DtELG+W3PkGEIUw87NtGvf0c197F2p4Q5NvepbII0MzzSQw5kIq1jTB48uIR5SJb55CPvACaKGeYbO/Qnc6VxfmlKJOYa9c675L5qUmN3HpgvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SGWXpl3X; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=baOdcNSMXymQ9eSiQpXXRDEnaXIkbhZvEEPEjGAdbhsB+WJfFYMJ9zkcc98tFPYy2jwG5C1JIBGSkkKkR3sbDQacHk3mGRFkJynFzhiifQyBqWyoiuH0rB23ZmlT9zUuIEhd/UzERQwcJfq4m5xOGSDsp3GvFurk9tBhByCsqHel3h3O0LXKeSk7fZhOSomJyKk9bXfNsNwDyfHDLy0Z0JATI84iedq4axC9rQcbI5TSeJJuHXUUsHlXkp/sTzzMHHcfh2nxmOIBfyejgkcIRfKIeyRm7eizDPooNddFsyu4ME5u3L000bCaY/s5K9gfApYALJiStUqVw7aICuQ6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70VnzXW8JQflG7VmaONu1zQN8AFUrTykyFFuM5x/ULw=;
 b=qVaj6qh9HXlRODrxYO4hXlxXd3kdPHOm5Mqht68gx+baHLd9lIsX+PHXHRMLNd1y4+KrMpW1K+kviw/kRRB7W9W4AMgPtoVjXzzRsDrNqs8mdDqKrVkWq6wIywimFE567b514TzZwKaJk2mBTCtyGkzjwCy4aznlpKkG3TSN8Mt48mpO0qJw/PGjBpYOvu9pZKeP0RJNo3doffGmrHaX/Kwmj3ac108pl0ae06xxdYyHy59O0Ob/mVsEImwAivPTLosiedz6vsAmS70wHdyVeGjiSzoSUmN/mCkFlhRdwcwFAffrBkpsEp50YFvDNlOwTubD8zKHJkLGfvxY8wKRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70VnzXW8JQflG7VmaONu1zQN8AFUrTykyFFuM5x/ULw=;
 b=SGWXpl3XFDi3wcZPhgtcRFyb0W9YH4qyVOwzot0S4DYRFEB4iS+bmcjaKjT5/NNONGCWYx2nc7xukSdnT9wP75d/BeSs/VdZTYLNix8GbAPLw1KvG9vnTwgLelz/KZgaj7NrNdyA41kjm6UfX7zBvGNYn56HKThSGjmwdjKFDhmFpqxjvg0P5hP1TrfGBH8q6p7s+5LUlMFFpK3nSpJ48zJU0Ew7jTB2HAFAhvmBmAJ+1aZM0hJ4eoyf/6Ah8zfs3Ej9G6U+ckiO/h9vWrHVJr+z49CtzTUvOExlHqcwu/S04g2Ki0nYv1diDSDgzRRLC73un6h2TiWdy0jvf/sqtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB7837.eurprd04.prod.outlook.com (2603:10a6:102:ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 20:06:57 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 20:06:57 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: convert max11801-ts to yaml format
Date: Thu,  4 Sep 2025 16:06:37 -0400
Message-Id: <20250904200641.531897-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0094.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::9) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB7837:EE_
X-MS-Office365-Filtering-Correlation-Id: 500f06f2-dcd5-43ce-056d-08ddebee9a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|19092799006|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O2cJ7POGOJcO6fT02xnXe7d3I+n0dTi5el/v9+H/n+gHcSOeQS8QYF0ULWCO?=
 =?us-ascii?Q?OBXZBnUjdg73AS7tzEUzf1HJfTQg4QpA3aWTuwTFPJMOZNT+uRjWMUQ3KNWa?=
 =?us-ascii?Q?Uo/nd4n7BQq6++yazxDt+o0oBd0DytOcUGmBHgdqaYI0VQ0qWJr2IU4mI9/5?=
 =?us-ascii?Q?YvYW3BKZnR8gjiKOcGywJ6/05neofZo8TatN1JVPwITQsM4guNwIfll9zH/Y?=
 =?us-ascii?Q?1rFoenbFTn4iqpPSuRbNnBUl9S2gRxyfacug4GdiEXNM+yU2YE/hFgi0di07?=
 =?us-ascii?Q?qQaPuLLabcc5a6sD+mw1AVbhcxqpnFU5p+lQZYHyIK+kY6xJPGI7Dtdi1eN8?=
 =?us-ascii?Q?u4sCJgESsgB4xgST8nJbRyNH/jGkFRpEhyaaGqZ3pv9BIWVOX3NkzpDBblnU?=
 =?us-ascii?Q?mnkYhkPhkV71exeq21I0IIPtCfgp0WqMLIMaLDtskALnT9CwuDZOszXeePwA?=
 =?us-ascii?Q?B8cpE00pn8a9VHnJCWwPHjnfm3QxVO5ndcjMHyQDESGPlg7EebnbgdTZAxiZ?=
 =?us-ascii?Q?Ih+Rj1HbFkw+NRUeHRJ3ZZnnGo+tFJfgLx5qaBIEcBF699uUUfQPWH91SPAn?=
 =?us-ascii?Q?bHvd8fbIq7G31j+0Gsai1EuJZBgdBSs7L46ZECbADoHa/WJBKy6O2sesC1Iw?=
 =?us-ascii?Q?GZzQC4DnL/xgybn/mxmZVfycWg1C2dpCSUWRj5Mx6OY3kxVzrCR8XJ5v1mO/?=
 =?us-ascii?Q?PmtMKQE4ljb23pIZ/JYEvDC7zDdVX6R9BwvVPaomj2mI0wjd2UhqIU9xMi/B?=
 =?us-ascii?Q?6b/JfRW6BI+K+txieUc95MJKkXdzlXDKPxGfdjfO2zJWvVdPZh/CLEdbgxuo?=
 =?us-ascii?Q?uukM+0t19Dvw/CL6hbtMMn9wvlFlit/xRhBQxClcTf3pzntnQThq7+EDZ+Wt?=
 =?us-ascii?Q?/Bnkvhxmy4ew3KAV9h3hW0AIOT+WaklZDsaC180ws6yUWKO4QVWRrTOxj0Me?=
 =?us-ascii?Q?9NJ5jN07UEeexl5Dgk605dncSjQ6N9OAAUZywohfbG9UgVF1WSFZpD6bQEZP?=
 =?us-ascii?Q?fpgoxIO8btw0zh5/pTEcAij4IhKkK1/mJVDhbvg2GPuD6cOln+bOdUPXZjtK?=
 =?us-ascii?Q?CU8RzSOi1vDf9UKZ/xytdwAuKN3432+yXzhSXeSe5Vlz8QZa2cd13f3z7KjP?=
 =?us-ascii?Q?8BsR0dyMFuDrLp1aBhby0cIg3MCAT5TM3jp9V5l8P4SdpJDXdPJYK2mV+lQv?=
 =?us-ascii?Q?RLWWHgwhocKySVQulD/VQG0AYwP5QCPvqGLmZIc2vbrDK+qBRc5xBuG6BXM9?=
 =?us-ascii?Q?vDi/wOEQMl7i8BJkbvZh6EXYQOliPgMDaXbTKx2+3Ak8Ss5Xf6Rn5tDjjvd2?=
 =?us-ascii?Q?tDSJM32yFTdM9m5yvjhQtCl49+gAPwZhXDsrY4g99DQNzbdHmfewFmpS1Vms?=
 =?us-ascii?Q?bPDr9wWBYwBEw2gQGPt4PikOFi6Wx5Rog3wVyGJzFQLI1PKR2UaGVzdCYsD8?=
 =?us-ascii?Q?lmvfMxoK8rTCfLCgkxP8OLfcgnA6IspK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(19092799006)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Puiy+1OpZ3AsM9qvBAeG/dqsr4pCMdjyyswbqxRe+EbCeLgK1I5jkpOr07ZW?=
 =?us-ascii?Q?AC26TviyKz0Zrby5ngfSAY5cwn2723w5w33T6O5wxq0ioX5v6R6qbxjwlbUZ?=
 =?us-ascii?Q?TqNC0y9+IYvT6lQXWeisWE5V/AXnN5vLF7Kij9sPy4bPSxq5pfigfy+dQE3F?=
 =?us-ascii?Q?9837s4pEgbPEvIoyvOn+ab3pNBXuaR4HWECjE0/N+xqU5BvZv1viiqdT1A9Q?=
 =?us-ascii?Q?arCvTZlXKEof5h477jsqmxiLwesI8md2S1E9MAFIowrWtZgs1Pa+Ey8UvMRy?=
 =?us-ascii?Q?m88bJ22V23dAlBjuUvhWSJuRboSwhcmmRz7Skux4CpyRNXk/pR48TD9L72XA?=
 =?us-ascii?Q?9ZxWpayy7xBi6jC9k8QctGMdntAOXyn16uT56z9J/FuiSTxHLdMVMF9PZLEa?=
 =?us-ascii?Q?XZgYOYmy/TRszVNIuveCbfJ/CkxKYjb3zBHav8cuW92QDO1VlSZfTl8zOS9e?=
 =?us-ascii?Q?c2hGGNVglmqSH7UZfESRHaahga86zigEGhqqq1FeoMslrLu9+gTMqo531FnX?=
 =?us-ascii?Q?F8D5RxT6lj9KUucjNMbAFtLTjfgrcjzD1tQXSAc7CUqmyNsOxzyT+VE0OvMZ?=
 =?us-ascii?Q?Hhzs6Gtp69naveOoFJRN+5nfkGm12F+FvHZLop1zWxc4NRsmF9kubxo9ZGRA?=
 =?us-ascii?Q?kmtw7OyXfdKyrsRJLnNkQ74FBYKh+0olAat5LXjtvDTCt5o3HcuA+8c9dAAw?=
 =?us-ascii?Q?OhdotSOn6YrUO6tj1pFTlybOBLgY7fgfdnHeGjFaZ2q0gXIa+NniDs1WQAx1?=
 =?us-ascii?Q?CcymNovfwPjGqd1Coa80fgWZRdREooMfuUuuobhH+bfSSg9CqcXCeHSQ+Pcl?=
 =?us-ascii?Q?VqiDDFmyjJ+J/AVXhqqaxdKpXgCqM5Lqki9QcFG4oSqqvg7FoEkzoQ6d5drY?=
 =?us-ascii?Q?9DDjb8CRCRAt53IXQ095/2aGiBq1yMOyellPRh+UeCwj7hXyCpvUf517KXEv?=
 =?us-ascii?Q?CZkupj4+ZYUdIBDCGEPXtog7UgWr1Uq4lpnMDYMOi1e13bAYr7iSUy71qGPO?=
 =?us-ascii?Q?QyNrS9Siz8/Td8W8u8RxX9lxhSr9doOtnAagAI9LKoVwDgY9gxVeiFV1VK37?=
 =?us-ascii?Q?lUBwxNncAhL4S7NRKu417IkDlHV5f7XXWjPuiZtpIT1RmMdTOEUcE/N1ZBO/?=
 =?us-ascii?Q?/KjZEPQQJCNW865dlAXrt9GiqvTwkeZfGuU/Hx8odnJ7ClGS5xilUG2qtFuT?=
 =?us-ascii?Q?GQXBNTruQgTa5nEvUrt3yn1tR8TRkwBuQQfriiLgLnPTq8avb7k9ORLMoxB3?=
 =?us-ascii?Q?vLLho3MrSyTz7+fCfSssdKfym/uBPHFOVOeWscoHMvix8tUvGhjOBdxDaPzF?=
 =?us-ascii?Q?+7roxRNYS40sKRag32oAlgsBSjXQGH8EgT9WcD13e3jy5KdVSjx5iDXDw3rj?=
 =?us-ascii?Q?IgKI/7Nb6KvmpeY/9TU7ds7jaOvlyEwA58ulydlmnvw8kk46nftxiIhH5Kku?=
 =?us-ascii?Q?D51Bu8+BGhlHQi/expZ/q4ZBzLfNUwW+KCunWt4Z9qhOkptRA1bajNTBk45q?=
 =?us-ascii?Q?3LfoSJXo47d2INZLCVY62JNrGBMARuWfvgm9LQi3HbgnxQTmQxDxNpAR0DIP?=
 =?us-ascii?Q?U5AM4L/Go9f3JWMe3EfYyY7pnhgcrLULD2SjqVsP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500f06f2-dcd5-43ce-056d-08ddebee9a01
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 20:06:57.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qv3liXZiLYkYW2rh2sUr7fzSGHUa0UIZ6jUa8cMQwiUtWqq/ejPx4tS+E8yzptbPrvwKw8mPghgBSLVpcwJpMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7837

Convert max11801-ts to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/max11801-ts.txt         | 17 -------
 .../input/touchscreen/maxim,max11801.yaml     | 46 +++++++++++++++++++
 2 files changed, 46 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
deleted file mode 100644
index 05e982c3454eb..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-* MAXI MAX11801 Resistive touch screen controller with i2c interface
-
-Required properties:
-- compatible: must be "maxim,max11801"
-- reg: i2c slave address
-- interrupts: touch controller interrupt
-
-Example:
-
-&i2c1 {
-	max11801: touchscreen@48 {
-		compatible = "maxim,max11801";
-		reg = <0x48>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
new file mode 100644
index 0000000000000..4f528d2201992
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/maxim,max11801.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MAXI MAX11801 Resistive touch screen controller with i2c interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: maxim,max11801
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+allOf:
+  - $ref: touchscreen.yaml
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "maxim,max11801";
+            reg = <0x48>;
+            interrupt-parent = <&gpio3>;
+            interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
-- 
2.34.1


