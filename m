Return-Path: <linux-input+bounces-14516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CD970B46330
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 21:07:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3FB8BA2CCE
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045EE2641E3;
	Fri,  5 Sep 2025 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WaYhE4Bg"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013044.outbound.protection.outlook.com [40.107.162.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7CD315D5E;
	Fri,  5 Sep 2025 19:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757099225; cv=fail; b=WvLni4pYnuY+DKsM58YKK1XSFjz0IWpNILpdQ4isE0ppjeu2aGUqCJFahMT1J68KxmV9R+ZvGo5Ipyt3WVAjOy1Do4mvwylv5ghxlHxH6K9aRY+fGwp8IssPOPfQ+ESGEzHjOOcF7LqRxOUtMQ6kShhNNGdkWdzXzxwpMPYhbyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757099225; c=relaxed/simple;
	bh=sMymXuCsFpmPXTu3Mf5pjZbpDuczx6SxC1Nl3ZVQiV0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=K1JZYP1LmTWuIdd4uwS7ao4hFEpocoZVn/UMG00/eQXdHonJwzSTPhOxadswhVzfmboqbuSKWhnkrHMnvqz0chxTg280IlSwcj7WMvqCaT383UFU/flnVR8tOHKReENZl/jWrS0DCBuG0YZVd2wzEp1kEw6IzBmnY6BB3LfqG3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WaYhE4Bg; arc=fail smtp.client-ip=40.107.162.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7wOAHdyb5NIlIvEicnApyNyCj8vveMhRRT4HpcrgVPwYFLsilCkAuXsf+AL7cXUVcMcFrKVGwCD9dtbMrWmAmEMfXpttHQDvk+DPxQFDAz7ngYS+owotl/ZvjfGBldfclkvltBO642crcdl0/HEQedET05wG77NnU/B+t8NNbYw1RbgsJyzXScqs5lJcgRvTsYzv0bFmamHtdr2EM6I8h4mEA0T6UC8AGdKjxuqHiMXUECjb7cE0xAI1xlKWVg43754HOQDSWn7ExlgaG01f3pAyKRNUi0JdL5sx8FgA8vNOr6eZD1yzSqZoG3/jPTTONKvMylbkNZks/f2h9OX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POCFMh7wzF84hVnqVLE0Qvb7GFQQ853N7L7K8BI2YAs=;
 b=qGgfbyFchEIkG271aQNHcVTEULt/jsbccv9vjEhksPYokwkBxS3USBECAoznFwWxMaNrTfbQ/0LFqm/tGVZN/MerM8lwSYf+dSr3UBwqqYwN413YZBTgxRhFUmBr8/+DvLk95ZKioBI4f5RD+hlFUC7cwLBOd7loZ5FioXgYd0+Zmw6RdNA1q5ZRk3SL7NdrdykXUkB3x+w7akGgl8ALNC/4/6adNICCZxF0TWw3REeaxtupRdr5cjuP2YMBeV+RqdGt5FnGFUnwVgzyLrqKMJeRihwBevjNQxv4qQXWZdeYfvyrOd+0Z5asAi2+j1pJDR2LF9XBuxGtx2+T5075Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POCFMh7wzF84hVnqVLE0Qvb7GFQQ853N7L7K8BI2YAs=;
 b=WaYhE4Bgml4UuijcFw6B8EM9MLcQ4h+C+3iz0kfr1JXISPEjsYqHK/mn4Jx3/ulQ2EZMlrFiiFD80H9Q6ZxhiWuitHAYEwnEDEcnasfH+hVHZeuC9lDWWslRX7bshUQNMPJRqP5JCvHxEJf5aLrIF4GZ5OvJnEvtn6UkC51F2bQk8AmJr6p2gpDQYNTUdDTLgOUuJWLui4UJds0qJ88yvp/rJouZu5pjgOT++5BvgM9SKnLSI1a9lYoTf9TBqzep0jBnigvrP6CaEGXED8ag5OUxY1ygRD+pGXxqWfGWQegar4OzdJ/cueo4jC0oUGfzJLOaj2NDFCL9Ptm0YK4Ubg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PAXPR04MB8958.eurprd04.prod.outlook.com (2603:10a6:102:20d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 19:07:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Fri, 5 Sep 2025
 19:07:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: convert tca8418_keypad.txt to yaml format
Date: Fri,  5 Sep 2025 15:06:44 -0400
Message-Id: <20250905190645.609762-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PAXPR04MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eec471d-3948-4c9c-7154-08ddecaf6460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hvfd2wN85bTK8Yiz+22TTy6FeuLr11Ur+YQ8WDEMCf7wXOUojPHxtJ2Js1u6?=
 =?us-ascii?Q?kw9rm+P+N9H+FZxqboODbmtFQjtlzsOrGYaYMRm7jKcBUPNBGmw21u6ylbjf?=
 =?us-ascii?Q?lPy4F1Tlfv4U/V2+GqsU/5RiCKyyuY6tWGVPfKM+wF8BBnvW2s9+1WbXHloS?=
 =?us-ascii?Q?8DyWctMIwF7fl+bFVzldhsso7Mb85RKXuc4Id7+iVZ6vFW6tlr0CdwWfgALH?=
 =?us-ascii?Q?5Q8WV8Bm6wIWFquMk6Lh1MrcjPPfbP8BljgnumZkv0Ndr4S+8+OFUiZoiGzv?=
 =?us-ascii?Q?tciPztY3/n7wker4B2mNrLuHrloA2+/NwgXCSjbU0JYAoG4pPEiHYEFyX11g?=
 =?us-ascii?Q?frCEdRYwAi4jcP80yfItNmP9xiNudbSNO5h9on9cUQj4dMxVOCraLaMCv1UW?=
 =?us-ascii?Q?wK96anFh9kSowEkLUcZG22DoUhMN7b9DpNETykSADeciEk1bmKsWsMf14HnX?=
 =?us-ascii?Q?LB4NA6NGZfWfIgZ5UZ12mR9xeWEt0YRS09J/wHeGD3Iiuwrwq7jTgruHNiV7?=
 =?us-ascii?Q?Q15vB4nrmvThNt2rCWEJPasXtVZ4rs+frpohHz++CoTfWT4lMtYiFJwgJGjG?=
 =?us-ascii?Q?Xzydl1zz4ALfx4imQ2sGqAsP9GGVETkOlOc19claLBh7aa6I1FL48bow+bjV?=
 =?us-ascii?Q?OqvSSHV1cCiKvED/qRB9hNQ6lwDQhYqEYx/+ArqSTpOUBjanl3Jxc5IQfY5v?=
 =?us-ascii?Q?F6rdl2Qv1790fY9xPQ6MHFQxKMs+m0u2+1nAu9E3Bk3ya0WFMmX7MYSzXRh2?=
 =?us-ascii?Q?00ltSHU08jGgN0pM6GucbK0e+Vce8lRbL83sLoACFpVA4gPTf11PX/GEP+p4?=
 =?us-ascii?Q?vpU72it3kw4QiM4PfEa9sFN1xNhuBS1ecbyTT2mQUNs4gevhjtpXh0qbmlKi?=
 =?us-ascii?Q?6+0PUp4rhXHADWJFz9jtLFvykohM2kqKxloggslPGw34Br0/ID6wTQFqpEFg?=
 =?us-ascii?Q?yoCrtZgqQRbLrcQYRuUPktb4maNyq6G8wW/VtFwMHsB16M/TennIn1zoyqYG?=
 =?us-ascii?Q?VzOwXY1UbG4A9fxeBBZ5nH0fys36G+wNzeb3rGGVAHOJBEiyI8ZrVAnESzZM?=
 =?us-ascii?Q?/FblfUs5PHjXCBrWIWoI5TToqmE5zq5XT2FBlHpMo/zxAOGfGb7hm7dg6Ucp?=
 =?us-ascii?Q?PYf+tzlzGcwNCTRqNCriu4pq3pT59bnKLcZP9oWRC1oVd9wGYWMqUZdLLrKr?=
 =?us-ascii?Q?+A8Zv+L+L4nTh6+AehHQDtsH2NsmOcfU3Ane7j79bsWu2yFUP4AoNMeY/5eu?=
 =?us-ascii?Q?iTxCTWnSBHTU/Ltqeb5BGjUVRStuhybDiRKlL0LaHUfwA0cgy1QFwHRnzVnA?=
 =?us-ascii?Q?UhOPqfv/1oRlVUEPjWUgIAdxXUNpu2y4WBjQKeqFEsxFEERoVK8MwPTCoe0h?=
 =?us-ascii?Q?JtjAWkVHWN8tYN55pPLU8L0zC43dnLaNapZKhS/MZaH/XrzzmMG88BDnO4V/?=
 =?us-ascii?Q?6oSN3guGH3+aJFcvt2ypSjPxKYD2Vk+v?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1qddpy08fel7dzk2JNlNS0XB/6Sw+iqIzMYncKZ87e8E8N2R/LzfBEmzVx+O?=
 =?us-ascii?Q?xAY1Db7XvmC7dJBb9GD79+7tRt8GhlBubWkzyJAegUjJo/LAP+yWtc+XsLZ4?=
 =?us-ascii?Q?nQ9+rfzRXSsTUVFVjUPT71qTxLRSfESo6UlJOhbmCfq67WlX7v1tLPjr+xjt?=
 =?us-ascii?Q?Kwm9Q7mAh5xZ1AM8Y+j9JSw5eCQV2XI8Uk5RSx0ohmdSpP15iMbINvd8MHnr?=
 =?us-ascii?Q?iYf/aRY9hW2Lnpm3vu1iLxxd7dZj1dPF3dP/X8JluESeoRVyTYtFFe+93sXO?=
 =?us-ascii?Q?Mk9obTwry9xxUkN8z41XU2fzyfSmSm3ZObxL1KCbvmsGUPCcqnU5QtDjeJv6?=
 =?us-ascii?Q?KFQD9BgN1ttWATjV4/9dKwNvQPzN+yV9y7QOOEVixdWn/zwaIRQtCV4GzEoL?=
 =?us-ascii?Q?SrhJ0dTSB7ggPHG9F9fFVMulnih2n7Qdcgqjjl9ZWSXtXBc/nCtpBXC+X9/h?=
 =?us-ascii?Q?gNlOXRsyOIkfgA3ytrhTiWvz6DmN+ssqYjMe4/kKmlaY7icmZyDXwmsfvXdk?=
 =?us-ascii?Q?kHO+8dwvke3NsZ1u+WN9JdIqT3Fpz2arDcMO5KfkJQHkOiS4SSJrGmoLFU+1?=
 =?us-ascii?Q?+mkxd6vCH6ScAOHFoyV1DheBoN9TsNChnhmcZIFrENVcCsaw/QgSxqifDfrv?=
 =?us-ascii?Q?Y9XBfa/BboxPvB1a/wWqUH3RkytH3Gi1gguiOOkkgaFkEh3SFqbSzAi+NZCf?=
 =?us-ascii?Q?S1dWN4ZGSJXMGT80nhZNJLWo/paKJZ6XVbdHm7DCt9hidKYXisjZk7h0MPoX?=
 =?us-ascii?Q?t0xNnh8B32QnmdAVGxFixPKbCKDDhf1Hlx0NwWmQkEK2Dz+4yiT6jq7fDvSf?=
 =?us-ascii?Q?aVAHKTbLwKmQHh3mRSkAIa0hX+jHONrSGIdCtKWIu/tHSeuB/RSgO2QH2IhY?=
 =?us-ascii?Q?UObdK+8+elZPGBujk3ANHf0HLaEFQAAIJ+PWhhhxiv5DKKAL9gKoYJ+46gsl?=
 =?us-ascii?Q?eSk4P+6qQ3cm+ZvlTs1wASbU2tiFMgG/AyTNb4dzLPnf3mcxPol1se2TZ7YV?=
 =?us-ascii?Q?rVk9MKMMyMimfg1b/0IrGVTocG4ZYqnU1Mn2fJWPWP4YCtwTUbPKm2Oqaakj?=
 =?us-ascii?Q?cFcAc/CdbO9iiOcoExvhfhqSIgUgVLHiSMwLPBPKUdDX4LfzeHl4V39ki32i?=
 =?us-ascii?Q?do1tGjhpoEa7soMyIIhKRKaYtYREo1tcVq6PXT96ygbhV70B6MvKMq9yspIP?=
 =?us-ascii?Q?2U6wlOKQA4jevKNZ9PFSxX5wRWcBTv9u1j1lO9TQCDGlQ5WYujF1UolTPRJP?=
 =?us-ascii?Q?Kp3QTt8B8yIbKiDlkHvLF1lmg1Ho2gejm1jJTVpLr9Vwyi2VkhbUl1fUbgEu?=
 =?us-ascii?Q?iodAhBQjwQ3cMxIThg8zbkiFhGQa74OI1ZmYBwnVptp9TH6AOhPDkTkQicw8?=
 =?us-ascii?Q?ZzE/l6jmOtD2vUhltCxTKaO7IIX1mvwDZwh1oN9SIUYOT+6Zctn26KfxYoHU?=
 =?us-ascii?Q?BKVxAk4qK4FTfqQfc22tQfBpgnov49T2slhqIgomT/gBY1buQKerz4+Lqtcs?=
 =?us-ascii?Q?R7JwOPK+i12I8l49OVxnVjTKSaCSGB30UZANflunG8MaMToIwXQpQaH/Od19?=
 =?us-ascii?Q?K0J7XqzMWkEx6bO5JHL1v5VCvxVvbGZcOKDiUwwJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eec471d-3948-4c9c-7154-08ddecaf6460
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 19:07:00.6129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh1AkR6r7PKEClfrVu7DKSOytSxXlSjkB5r4ed4m6fpKc9VNDZgYPNB3j+WFxUxxNUFEvoFkZWQRioDBdc2sVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8958

Convert tca8418_keypad.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/tca8418_keypad.txt         | 10 ---
 .../devicetree/bindings/input/ti,tca8418.yaml | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/tca8418_keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/ti,tca8418.yaml

diff --git a/Documentation/devicetree/bindings/input/tca8418_keypad.txt b/Documentation/devicetree/bindings/input/tca8418_keypad.txt
deleted file mode 100644
index 2551850091678..0000000000000
--- a/Documentation/devicetree/bindings/input/tca8418_keypad.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-keypad,num-rows and keypad,num-columns are required.
-
-Required properties:
-- compatible: "ti,tca8418"
-- reg: the I2C address
-- interrupts: IRQ line number, should trigger on falling edge
-- linux,keymap: Keys definitions, see keypad-matrix.
diff --git a/Documentation/devicetree/bindings/input/ti,tca8418.yaml b/Documentation/devicetree/bindings/input/ti,tca8418.yaml
new file mode 100644
index 0000000000000..114de435b09d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/ti,tca8418.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/ti,tca8418.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C/SMBus keypad scanner
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - ti,tca8418
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/input/input.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        keypad@34 {
+            compatible = "ti,tca8418";
+            reg = <0x34>;
+            interrupt-parent = <&gpio5>;
+            interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+            keypad,num-rows = <4>;
+            keypad,num-columns = <4>;
+            linux,keymap = < MATRIX_KEY(0x00, 0x01, BTN_0)
+                             MATRIX_KEY(0x00, 0x00, BTN_1)
+                             MATRIX_KEY(0x01, 0x01, BTN_2)
+                             MATRIX_KEY(0x01, 0x00, BTN_3)
+                             MATRIX_KEY(0x02, 0x00, BTN_4)
+                             MATRIX_KEY(0x00, 0x03, BTN_5)
+                             MATRIX_KEY(0x00, 0x02, BTN_6)
+                             MATRIX_KEY(0x01, 0x03, BTN_7)
+                             MATRIX_KEY(0x01, 0x02, BTN_8)
+                             MATRIX_KEY(0x02, 0x02, BTN_9)
+            >;
+        };
+    };
-- 
2.34.1


