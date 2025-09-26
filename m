Return-Path: <linux-input+bounces-15129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BB8BA4EC7
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 20:47:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF3D3AD383
	for <lists+linux-input@lfdr.de>; Fri, 26 Sep 2025 18:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71F430CB50;
	Fri, 26 Sep 2025 18:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HNa4n0hA"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF00296BC0;
	Fri, 26 Sep 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758912460; cv=fail; b=R/ow0kxhFgjk0EtuzStQTMD43DmTtmzJMmRUhoEMeZc7NfoSi9AfvI5b6X0IlJ9O3vX5fKIIqxx5m8hrT1r/MQLVIMWxR0m6FxlU+s18JhbZ18f9hydonziBmmDMH3Bp4R1gFoJKEmu4V3Z9uNwUSTMDDQrIlgTs1/W8+JT1XCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758912460; c=relaxed/simple;
	bh=jw05IJ/lgqO3XB1IO18Fx1MtS92q4ydUVbH+oOGChEg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aXsaVDF7MVfrtrWCsBR/mZ+UAhEDjeXgwItQSn4TnABTXqVFklkqF9WRAyAzBEfZF0sfypi/fnFTdAcwCPtUb/Co1DixU7du2CM+FuHcWd589cJddgZfKDtSgg2ibxdEVieiH6u5cvIj25rdgc4KK96LY2UO2ee3C3GBFiuoEH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HNa4n0hA; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuC5jbkmcYkKa1jpiLe8y2A5V0+q7o0nm/cuEF0RNylb3S0xdPDbUvnEEjAlaHPN0jfejnK2uWVwKaAZAaqs/kpOFGD1XBvrJE8+77zo5DlzpPEmZRRLc0/o0LyElbVAwVHnp9kQcEng18wPXm6Q3cfCecCCJdD5FBMrR/Nmf2rNYUcTM9whaLKs3WnbPTxyusmnJJN9mdX140ejrKVDUk69C8nmE8zX22vJESrRGxnP7IOriteSicVNICTcMkAwlhkpJgrPlM0WVnq9tgyWBDUry+qtNqPu0ahbEvGmKwC8rACuQhBzzbDZFrBMWAnPckuUcFRcNNKinHxBdJsMjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zjdzYuEWZzWn9G468DeWChU2A2KBetcCABQfD/E640=;
 b=jByKVX1zSxVI9JYm8NEkknbQgxILzI+IfrLTacnWjylK96emdEXQ3eNMbgcOok1VGLSJ7sL6q373JmkG6owIT4UrBkpBqh8QNZltoas7wWQJqCdbCaevWFKOIF5R6DPZerGUlmf8FvKJMGwu5SZEdz5ra7gE9tDe686lCiAnhQtfKClw6ndv4qsW+KRde6ykndO+hnSE9490N33Ub/V5kWY8nvVNUZTa7+wb0dMXXu4VDd1oKU9oOa4wr80FPrN2qXdtmAxi32dg5/pQvGuPllaW4Mt59Nn0VOzZhH2bPv+4+0q9HLyXUIyvnvM8t4/8NIGj4RB4zrmr/quHbMANNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zjdzYuEWZzWn9G468DeWChU2A2KBetcCABQfD/E640=;
 b=HNa4n0hAagVgkodrs3dFK6YkCZGfUVjtuKnV896+m1FFbqnrdeU5HOgUfR5oXQbfz4PMqa4Hfy/HU1kzxRn8LzD0JMpdAP8WLkjucaUenEUGNyRxOO1lJP234e/AjpJeTQp2j+pPUQoJHhz3xMG8PkbJXuA9T25kEiLN7LUgdGFRgWBpCTW2Td8jiadwMWYXN80zuyUrBc/ilsZHmPWAiNZBrSIL9mxKWCnAYCb6pg367fwbShkwcsqY1hSY+NPnV1JszBO88r1K/cXa+1koNknz63N/EgLu7nInNErqYF1r9g1XMG6Wdo16vUa8wxt0FD1VA1tEzniPh9UGtqNmgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 18:47:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 18:47:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/2] dt-bindings: touchscreen: rename maxim,max11801.yaml to trivial-touch.yaml
Date: Fri, 26 Sep 2025 14:47:11 -0400
Message-Id: <20250926184720.391335-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: a2764c62-7402-4d9e-1b4c-08ddfd2d28d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qHlL+sywOwsq9Vi9MTDtCQjjbZ1Tu6nf62QxqxrtV9rztpGhdsJWAYYSYkFe?=
 =?us-ascii?Q?KVfT4J25K0JYIGNGoBDjjq8FrcFdcrog8+gcyIwCqwVtJ4ie1gxv7lDiYw0Y?=
 =?us-ascii?Q?XXIXDWQ6aqxFan4zkXJaS2VKVpAzh3xyx+U/thr5YCxbtbAazPmrYXHTdQ4e?=
 =?us-ascii?Q?2RN1U/6Exwg8sZWuEja6vjm3uzzxlkbN1IuynGQomJ5teN3pMdrsLF9PQiCP?=
 =?us-ascii?Q?6UWnTV3Ze+ynpA+VnfVSUMssVYt6wl83dLKZBjyzxqPRh8JOaAWMlCIwP3tN?=
 =?us-ascii?Q?vritpt0FrTvGsTqmPriSi+5aWMa3fEmJN/Ye5A2h6m40tWNfMoVptsXoYmHM?=
 =?us-ascii?Q?2EkPszzaRtUEevYBLyL/tZry+jbID5WB8SQWi0Q/4Npo9tT4s45ItYsxXddy?=
 =?us-ascii?Q?1j3SK6uq2FzGhuu558tvCaaUwfMnFAogx0q0phJQyT2ngjQ0dsCcAsN0EFYQ?=
 =?us-ascii?Q?zc7rMvROyGp1ZALQFPcUqgB5mDGDvAvaqRs3nQjga5o/F0RMkrxTRN4jTEy/?=
 =?us-ascii?Q?D2wGdNw+35fAGoLg1zKBDALnvN54sHdiVWtgY3ahjRMynWmlIX1CTmqiDqpn?=
 =?us-ascii?Q?wvfW2COrDsoT0J36fyYG9MqEXnWTZHZC/rtBIzEg6U/xDRnaZO4Qpc8je2kF?=
 =?us-ascii?Q?VwfY6mENejyFP84zhfXX3jfBI2h0VV8ZNNTa+7Ok2IPR/kfjTxPoxRNSHWH5?=
 =?us-ascii?Q?lMW5847hbah5LlYBsaSZPU18WLnB1eO/QS+PQZo3V4IbXkquiPHUM+cyT+BA?=
 =?us-ascii?Q?8r96R5votYJvYZ3WtW0KqjoXHqueIXUifO0ZKxxH/i4qMG3ghRTtiOrTeBEm?=
 =?us-ascii?Q?9dWO6wlHB05ItTCbfVD+blBgqFhJNrPgXewU+VUwfQZIG4zd+li0n3bM1ega?=
 =?us-ascii?Q?5TXvNgv3iBVVCl40fr0c4+seKULrBTr47iFxii+e/oGQXAVucW00q5WThknS?=
 =?us-ascii?Q?UV+/GG4XoIBJ3jpOMI63cf+z6S8JCRjETUVRRVhNvBT6SXgBgaYdjrnx1s2k?=
 =?us-ascii?Q?lNhN2+DLTn86JDdPVzocqHsVrwDgLzG/L900v5gwpxyYH2ghlAUB8/dxpGX+?=
 =?us-ascii?Q?/BCt4Dv5yy07c4mtqXYoy/Zn09shwJyGwmk3JvKAiaKhPDJ33VJi6cIY4zko?=
 =?us-ascii?Q?scADstDLvJVWH9xxUUmKThSlujf8jTwS/IyJhhFWx3Mo7CAJfmBt30obZsGt?=
 =?us-ascii?Q?HbK7w+ljf8Oq9YOIPf7s1fERFVl7CWr57n8HCDXX64fofrRXyETuTV3PD90+?=
 =?us-ascii?Q?mCKmlaIW+iaASotVPIw9xhLkuQ/mwwVgf1AqoGRWh9M29JAz1L9xOQoJnvRc?=
 =?us-ascii?Q?A/iC0TQIflPS9rF/p7qmQqAK+NsKQ9LMFILHvlokluQ3rtLLlkwvyIluYZjX?=
 =?us-ascii?Q?RqFmSN5uMXitmrFXVP76uDk/Hfm2G9ySPptOzHjXwKe3w53z34DQikL8V9Wu?=
 =?us-ascii?Q?H7a06Si/6SpKVIiVhCFLqqQvNNbmJqQ0tyHL+yXmk+pfEASIKrC37Ym/fCX2?=
 =?us-ascii?Q?s4l3DdMtFfSQctk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ef97wMwhnkbksZ0V4Ls9pZm+Y1CzLZHOC7ZaVsWOfSJEGSI4paRYOfTh4DZ9?=
 =?us-ascii?Q?zyKnmezEoLQTTWTdhYfmKWIXu7vYUnNUa7YJTOUk05xxYBN+BpXTvE/l5MAB?=
 =?us-ascii?Q?GxfwiyNGYbpftenVDgfayTRMTJKjhtl6WL2Vu/e76DB6t1UPjyP1RGkgNkC8?=
 =?us-ascii?Q?KNTCiA6Q9EgdRL9bEwhXZ/zOkZzhKA4lNzNJmwrQeDB1Ppct8sg/jHS5hqzx?=
 =?us-ascii?Q?X5Mcj4p9nUKsX4M5DrQIy8RjQ0IJdpjiEO1hmaLRl9IULPhl0yGqdlbuDf9l?=
 =?us-ascii?Q?dOx5ZcZCSwcSTJqFLCQW9izkxwMG2sDbtu9X1Hfr7f2t3hS4A1xVJqeQORYP?=
 =?us-ascii?Q?+3NTe67WnrZFoXsgzzha+io/2XHfniIEFeZiRlVZTT4A0hMbPlE5tovsV722?=
 =?us-ascii?Q?oeDP1bkHjs8UopvBSFwo8Xt5fY9pgqczf5g1rdHjJUCf40EBbil22LNFStts?=
 =?us-ascii?Q?NIRZTMiQAUiadF3w0kK8b2HhHmwhYlL1pn3aWC2L/xBRiJ6/SQdQ8c6avC8c?=
 =?us-ascii?Q?I+R8wh1k5jP7ehYjt7vovkSIY1t9dSW+ZyfAZBxZS0e2c5ZwUD/7yu0baozA?=
 =?us-ascii?Q?LuQxmseh5510jXFV5iIJ3d4F6LbyCqSDxi5csbguCYaPOjGz/EWd/wjAFDyd?=
 =?us-ascii?Q?SHhHtRpJ0sGnQxjRBprjtFan6cTfLhYquQVJHBoVXqXqaVJ247RdaHWSB7iV?=
 =?us-ascii?Q?p6EHdZB30qHDEUHKjBxkW64OwrMT+N1ZOcklR7TcOqCgdCfEotzB0gxtGESO?=
 =?us-ascii?Q?B2BA+pwFqXkvxE4rcpHjidRZcWJk4pap/cC+dr6mPfvRd2FngZlP3FC0GOX6?=
 =?us-ascii?Q?i205pmwyDXkOTa0QHKTHPQMtS8p8yEegOl1qlVSD9Zo2rhYj0GoTiWCYuQlz?=
 =?us-ascii?Q?N2AqPWAn4r078BOE5jrEp3jEUvC250ag1QrTYZm4DzGsiq+j2t2GJORiMkX7?=
 =?us-ascii?Q?0tzkZKUWSjwhbN6OLQRfb/mNCNgEQPQwEXLJzpsVgTKi4ztnCqzy6wnNM2/J?=
 =?us-ascii?Q?rryUBQ650u2TBnedu9FcE/AYB1aN6CNtE6Y33vlmN9+UHP6zYG4/wx5CJ0cU?=
 =?us-ascii?Q?Ta6vfML3YayWMKRmazjAE5xqVC/L3o2l9nfZ0vzzvXzhFHApN4GIJFemFJBP?=
 =?us-ascii?Q?g0WS0HxWonwooTvat1O4bAOwV2r7DvqPmcAXQKPhA5dISjP82qmWY07fV+6S?=
 =?us-ascii?Q?sZ4sfjBFh7PeY83VXlp/1klg2Ghs47nlg7pvfJ2bvcVuPFLlWQbx0Kr3OErq?=
 =?us-ascii?Q?pzRUzemSa1YUsyRzXBfqpm+UcvfIRGMqIDrJ4sJJUCeKZC3IX7sxnCDK5K3s?=
 =?us-ascii?Q?+oxQZo1T5hP4UIU1npYwwcjbZMV7BxW2zi+y5zWrVwhiasjkKNLceYedeJLK?=
 =?us-ascii?Q?q4RqJ0MaNw04hAhLg/VEOdGWUHdSSBgxQHQXhCa5aEE69JNxu0K10eU7TNdr?=
 =?us-ascii?Q?Ovs4mZwZdoSOxrVSl0C2sAohVjbPC9ICcuTM2W8ipC2jf1o6rIEnHgaKTP8W?=
 =?us-ascii?Q?LlRPfuEAdGmFPpjW6PI4Dt62tyDwjouGjzE/pglu8gtp+441sm8x96PCL71a?=
 =?us-ascii?Q?STSJwEqKzkSq26qt+m1hidzEsjvR0HK2y83E6HN4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2764c62-7402-4d9e-1b4c-08ddfd2d28d3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:47:35.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trBMwzSiw6ZjiRfGF8MHCfiYQpbHJem9vMRMuxxQh/ydVVwuQAijOlVeIVJXMU52Wk4FMgivpFV+0YE+DHBqAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925

Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
controller with one interrupt and common touch properties.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
new patch

previous discussion
https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
---
 .../{maxim,max11801.yaml => trivial-touch.yaml}           | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/input/touchscreen/{maxim,max11801.yaml => trivial-touch.yaml} (74%)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
similarity index 74%
rename from Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
rename to Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 4f528d2201992..c393cce273c5b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -1,17 +1,19 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/input/touchscreen/maxim,max11801.yaml#
+$id: http://devicetree.org/schemas/input/touchscreen/trivial-touch.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MAXI MAX11801 Resistive touch screen controller with i2c interface
+title: Trivial touch screen controller with i2c interface
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
 properties:
   compatible:
-    const: maxim,max11801
+    enum:
+      # MAXI MAX11801 Resistive touch screen controller with i2c interface
+      - maxim,max11801
 
   reg:
     maxItems: 1
-- 
2.34.1


