Return-Path: <linux-input+bounces-12647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98257AC82CB
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 21:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56AFA1BA4543
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 19:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5F9222FDEC;
	Thu, 29 May 2025 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nEYbR4Kp"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012032.outbound.protection.outlook.com [52.101.71.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8E4647;
	Thu, 29 May 2025 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748547183; cv=fail; b=o1uHlyOrFnTr27cusGUJ5VHJ/HQkU3qfX/yvoY9MR2uH2YoRd/WRT9MPTuXvQpz87Y4vkYQDUGsNMWKcXEKdtB1GjR6TENAS84wDXSaA5A7jrScSy5dgs5i9M82pn5eVjrxZ7y4+pwYQ1Ljhp/9+w2FtNl42aNDQ9fmi0922egM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748547183; c=relaxed/simple;
	bh=sZT3tfQFQJRSCb2VBQu75fNhHP3bEakDYBKhsdLvpFU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=upDJ+s6rolhU2heMu7nFcFMIJzjYn6T1P0v/MZJX4GMVsioiFb1GbZa6N24bCDXggjJWLl7q3hXpdvbP9PHilJIH+Qw7xIAtkJ9LQ+Z8gtlE3vNueT/9rUVY7/jhFDRn22UsjtFIQ42b/kEZqCR1HA4n85e9z9A4ADcNkVHV8nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nEYbR4Kp; arc=fail smtp.client-ip=52.101.71.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9cGgaHIOb4lympvWLZg2e3SO3VO1fs3IP1KTYH6hXH3ZOvGKBnoBXP0TMrKm3YiXaYtta3HnAEIoWROJ9nPXio3g2R7EQlVw1xkOI45mTl/WtSQ7HGxtnS+Sm79192rEhs/3EAH5Nvbbg6hSpghvA97D1C3WBpvcWP5NF2w1RhUmlity/YkoDSZaoxmnbnxCvwUx4FoC+AbUrb4DFr7rIA4HBtWNWBTJbLqS8NNVxbIrPVgmcTzSs5YjTKKYQcyEbBelx+uWPsWTNIlx9dKAwLa/AawHBy6qYg7B6RrJm9jq7YEPzH5cuI1Jc0Mu9DLe794bfs1pvrDW9AyAK53PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQrx9eoDwmuucYfZAWvoe8HxyXfF6yafNX3IkC9oIHM=;
 b=n2GU3IxPjbnuEFO5Af2b+g1fPvqO6HuMfyOivAWiu5oZACybQNoTdi8S4AJ2X+yeBDO24/8dGoZyOS85A7PQUHbYfl1e/Zyr5p9mcS/j8QlDOdYwzSGJZF18JLUWQV0L7PI4ZHoR54shm/6Jq7n+w6vrnHr1EMoQa10N/mYMwBm2G3DI4xFivIl8Dw0taFM/IF2BZdIlAI/PTYTjCPENYOosJVeJLylkvgAY0ljiyFZ6ZeDmV5EUbiIoo4pLoLh23lIpLwWfzeMEQdmNEzC/554foXztHvwIyYNCwCdFU0QLJn869QCiRCbtSBGri7RmCZVTzwuE6nJrD5IBCIb6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQrx9eoDwmuucYfZAWvoe8HxyXfF6yafNX3IkC9oIHM=;
 b=nEYbR4KpkAOFR/PENld7gd2E6DkFldBoHxVW5YixTlMN9lZNsIH0L6a5QhS6j+UHpGuwdC3O9a9smIcp+aYx3MzX4PW7IxnvRBKTR7vUluwpb5ThUvP6+aW7QRc6xRrc0UcvAuUxAmuYhcSDMy0CvDV0613YUfhaTQZ8O4QZ38zIkmX9JAGMVEMqNEloZquejFC9ldHSw6znYq+AO8Xi+In2umqkmpE8xxjKUzIeh1fwlueD3O0o5J8lxbVVxqzNtUn7EW1LNHkMq9GX/3OhdqOKEzvWG0cCovGcAhGg+dLORRnjUmsgQgV9R28tDZMZos0Uf8U01iEeumRBgX6Gyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 19:32:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 19:32:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert tsc2007.txt to yaml format
Date: Thu, 29 May 2025 15:32:35 -0400
Message-Id: <20250529193241.793678-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:a03:331::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB7135:EE_
X-MS-Office365-Filtering-Correlation-Id: c04767cb-5676-48c9-982d-08dd9ee79d07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IGLgufpgmHKD9SiCCd8t++oXFWWTn4XgsfQ1h1o7dec52lwi9/c90jN8HQZG?=
 =?us-ascii?Q?55hPTqnU4Ami5DitpPuDjtzx+t8Aefx2BAhgOEoXzjJZt3MNF1Ilp93te0IT?=
 =?us-ascii?Q?TNUjocXNyw+c+SX3a6v36pa1jhYokQc+wmJ6fQvehDxT2c62IqLPEzGIpmuY?=
 =?us-ascii?Q?GGE8kS9eZxQMNffqxW4vKmXudhJZeJbp1gzUmJIm+Nz4jRdG50B6ipgZ7lDd?=
 =?us-ascii?Q?4hTsQqgu5Ze0b5QrQgk1NEi8vyBc2njpCHJ/iQiO02RTwAap17otBSMHYKFH?=
 =?us-ascii?Q?2//PV1JhjOnfw6Vq8kqiKglWwXLo4LyRx6oXvNRDrCwOeZDtcM/BXQEi+joZ?=
 =?us-ascii?Q?X+THHvz/ChJoUSj8XsOAU2lqIR/9qHjoBZb+f8ZZwcXR52ZK66cOmKMJerz/?=
 =?us-ascii?Q?v7rhSk4IaWQX0a2xKy08sN6UDz+MmC7v6sbmg9qWgz7FE2Zb3rH6uwBNTaE1?=
 =?us-ascii?Q?rdkcPYORa48xzRx4SPyFmahZF4OUZO6v+8zdeG4B71+A3rrJU+ueLnA+KqZ5?=
 =?us-ascii?Q?1T/nwzA4Ia0vno2nE3KYcLdEL/nYFcbrfMtQtYoinjcabGBa9pgk+J0hp2Jf?=
 =?us-ascii?Q?MJuAjUTrFxQupxCQM9ZsBCyqZs552fACgx0QPMZpVrl5TeCfzceFPnYourtZ?=
 =?us-ascii?Q?TRHCOiNJ5MBYuLX7wcw43sYlG1XtA8SCqZE6xjwTANKiY8TEXYIRcIM8xK1B?=
 =?us-ascii?Q?opKyzHMahV1UOVumkVflgBmxUcUK0nN+zLwSvyUfjoquGIVu/Q2oQa31o5/S?=
 =?us-ascii?Q?AzguMA2SdB7qwN1kBLysl5F/Lp99Xo+EqT6Cc4B7NwGylYKiKtM+XYc1pT3x?=
 =?us-ascii?Q?CMPcx0hgQSxzR6YCsNuR09MaG6J8lNY6T7QFt95ZLKCHB8VBHuc98pezhlLs?=
 =?us-ascii?Q?v21rQN65YOiKNgugLjv7ktBGrcESaIUZCHRm1mNaN2FOIoTHEvR6qq5WN6iC?=
 =?us-ascii?Q?R1RvC0Oe1fn71r/YVIo1KB4MBZnu15dMX+IADo/CJ2RBhGvj3q5peEZKUoSx?=
 =?us-ascii?Q?hWcJZhsMVZDA1yvnhS5uXc6eVgXb4/EiziR2PdLv7RCwPkam6kwbKVYV8IgG?=
 =?us-ascii?Q?HPdxNjcm2xDxRB0gZbUUqndwIDxC7voCqegpY/ZZOSAdYUJ3lAjk3qO+tkMM?=
 =?us-ascii?Q?dRxJh52Dn5MBPMVzD82GeIFJf73pyB27cXc+ytzijCDgpaDoPJY6u9OgTGMt?=
 =?us-ascii?Q?S7go55d2oM6w5uRjl1DtUTZuQI9ug0UJI2DKQ+DhUxAn2uANfV0PqI5nltGl?=
 =?us-ascii?Q?rqom177dcmaWA9RmZ3oSZqf7DJ9GeS5YdKUWFXJHNwBVJ9rzN+fIU/dvAuoY?=
 =?us-ascii?Q?JHd3Ino96UBXhLTbCBf7bT9ZcObHSJWJyarGKHzV2pXJoznOicb6tAaHjBrN?=
 =?us-ascii?Q?FQgHuLPidED6T+TYg1CMLz1JNSXOpQWU9nMEoC0rnroSlDrN6VLKZd+2/Xlz?=
 =?us-ascii?Q?MoY5v2XvikByuAtezzEZoubny7l1Me7O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAKLPz7MlJScjc8OwshSKjEVa9JSGIEdksRFW1rgA8rJdJqz4doS+jXrFqc0?=
 =?us-ascii?Q?LBiPvlzLMoiq/XGWbBAloEudaGV3ueQ8muF8FXHR69ATBpA4524h7cBwcOZ1?=
 =?us-ascii?Q?UEvdeBEK1SyOeBpA1Hx4VeSA+eGJYltb7NwzAulBkJunZ3yp8xN3YQOFcTIJ?=
 =?us-ascii?Q?E1EhJYZXKYUUXIo+Z+ip27SOAFtn2cwkmhjP6DjgorsdPrIJlUYpyCDR8wnU?=
 =?us-ascii?Q?6ud7qXPrxwS6VlrRKcONKj5Ep92KBcBEmKvBZ2kFIzjTiBN0HQn7DDEGZbns?=
 =?us-ascii?Q?/eFkTkkcWeeP98HHsSnN7HN9Wywmo2/oY8cMYuZP2BqcnjR8YOQdDZYLRmfz?=
 =?us-ascii?Q?HNCwFY46kCjwjtE+gPOb2TnzPeFC6q+Km4Cx8ep1WGj/f+tdtQ+LdCrv1kqC?=
 =?us-ascii?Q?cdafSq5DN2LiovxuU8qxZjdledfxqzmsEYZaEs+j52xk1YHN4dv5vm1K3NBv?=
 =?us-ascii?Q?te0JyqwuLeswkCVde+ZZQtbcIyvtqxq0RT43wdiTcHIIzRRBHUmINpYrSZlo?=
 =?us-ascii?Q?Eb6jjM0vtO9Mjuy2gL2vTfM2qLk5smcpzx1Kr5SAGDd7im1sU3mm14sxniDV?=
 =?us-ascii?Q?x1lf264IB+wLBseiHTDn0wU1nb22n09m8mKS0TaEgggrHSWgTQPKmhRd6KeD?=
 =?us-ascii?Q?+vlqhtyC/OGGB9O/7ZOjwRvFxChHb54WmWRTe0pPqg4YTVKbMDtYPejYb27+?=
 =?us-ascii?Q?Td0UPGIwGj2/TWpKZYlIgyRq3Qb180N/6kXL9mSYm13JnVWbpWeu2dl31dVg?=
 =?us-ascii?Q?izsKbbZmw6DLztqH3lz1dFKnRQS1UF9DBzdLDcACDZtQx3vamqExddIskh9r?=
 =?us-ascii?Q?80P1dsK3x7LZfVjo94IMwDwdhiBVCAad2B9nG0dQDYjhypMhOxVpoGM+JUON?=
 =?us-ascii?Q?i+PwjwZYWE2WaMQfRC3Jpoyf9IwVgdqaO9GQobKKjqduUQoD5t4yUbG8u13F?=
 =?us-ascii?Q?c1z0WPnRog49gcaQtKnWCaMnXgwdxK9D73YJEJhLRNl9nr07dY3ifBmI8uyM?=
 =?us-ascii?Q?9DXoo0FsbpgknElp7vTIUe+f9h+Ht1NXRqdlJxf/aFRparaCjR4iFeNdVOmW?=
 =?us-ascii?Q?B4mwpQ+YVN8Y/Za8uuy2AFjFhC70M/Zpp+QACU45JLENtRo89kpKad/vI9ob?=
 =?us-ascii?Q?ASocOe/YLaP0ljYRwVDDb3ACD4saTIFoc+4CNxEx/zwPwVMYnr5g3iMhXz6i?=
 =?us-ascii?Q?bKUNUPpjnYKpoq6HX+3cqsDz+eWTVKVGJ7ftJARtoe5BLj4fPEM6lqy51T3a?=
 =?us-ascii?Q?lTX3o2GNF93oxl0veDat8Xs39199pl7T5oYMY7fdYqXWvrVSEoFKuz5DfY4B?=
 =?us-ascii?Q?D0M6ZctrepWQdFtZVgV9YLr2XRwAZfclaGlPzzntwVXi7qMhvI4FMClq1Q9N?=
 =?us-ascii?Q?HYVgjpGV/ynlW0WaLBN4P8+wAOxjmOadxYFuFdxQWAQfrCcwwle014oUS2sZ?=
 =?us-ascii?Q?3Ui9hjPns6Fhsq9yamW4u5Viymq1PJJkyVEQy9P9G/CuUzBUqCiVJcLn4Uc2?=
 =?us-ascii?Q?3ueWIBLhLaYrWRwM0OtuGfb6Tl9+eYLXwuJAfDKWYzmsuGavjg+DBhdk/lGb?=
 =?us-ascii?Q?gSqoGJlQep2Ok8wQQ7eOeHk2SqsX93Hvr1REoG5a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c04767cb-5676-48c9-982d-08dd9ee79d07
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 19:32:56.7734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gp0WkkH8HdtjBOlJfqGFwsIUiWYxjndvdblukIBHK9F4sc3OY9KwBbxp/cvXRTzFzDWa8vJUUqJ+P1jEshvySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7135

Convert tsc2007.txt to yaml format.

Additional changes:
- add pendown-gpio property to match existed dts.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/ti.tsc2007.yaml         | 75 +++++++++++++++++++
 .../bindings/input/touchscreen/tsc2007.txt    | 39 ----------
 2 files changed, 75 insertions(+), 39 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
new file mode 100644
index 0000000000000..8bb4bc7df4faf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti.tsc2007.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ti.tsc2007.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments tsc2007 touchscreen controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: ti,tsc2007
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,x-plate-ohms:
+    description: X-plate resistance in ohms.
+
+  gpios: true
+
+  pendown-gpio: true
+
+  ti,max-rt:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: maximum pressure.
+
+  ti,fuzzx:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      specifies the absolute input fuzz x value.
+      If set, it will permit noise in the data up to +- the value given to the fuzz
+      parameter, that is used to filter noise from the event stream.
+
+  ti,fuzzy:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: specifies the absolute input fuzz y value.
+
+  ti,fuzzz:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: specifies the absolute input fuzz z value.
+
+  ti,poll-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      how much time to wait (in milliseconds) before reading again the
+      values from the tsc2007.
+
+required:
+  - compatible
+  - reg
+  - ti,x-plate-ohms
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touch@49 {
+           compatible = "ti,tsc2007";
+           reg = <0x49>;
+           interrupt-parent = <&gpio4>;
+           interrupts = <0x0 0x8>;
+           gpios = <&gpio4 0 0>;
+           ti,x-plate-ohms = <180>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
deleted file mode 100644
index 210486a3fb11e..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/tsc2007.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-* Texas Instruments tsc2007 touchscreen controller
-
-Required properties:
-- compatible: must be "ti,tsc2007".
-- reg: I2C address of the chip.
-- ti,x-plate-ohms: X-plate resistance in ohms.
-
-Optional properties:
-- gpios: the interrupt gpio the chip is connected to (through the penirq pin).
-  The penirq pin goes to low when the panel is touched.
-  (see GPIO binding[1] for more details).
-- interrupts: (gpio) interrupt to which the chip is connected
-  (see interrupt binding[0]).
-- ti,max-rt: maximum pressure.
-- ti,fuzzx: specifies the absolute input fuzz x value.
-  If set, it will permit noise in the data up to +- the value given to the fuzz
-  parameter, that is used to filter noise from the event stream.
-- ti,fuzzy: specifies the absolute input fuzz y value.
-- ti,fuzzz: specifies the absolute input fuzz z value.
-- ti,poll-period: how much time to wait (in milliseconds) before reading again the
-  values from the tsc2007.
-
-[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
-[1]: Documentation/devicetree/bindings/gpio/gpio.txt
-
-Example:
-	&i2c1 {
-		/* ... */
-		tsc2007@49 {
-			compatible = "ti,tsc2007";
-			reg = <0x49>;
-			interrupt-parent = <&gpio4>;
-			interrupts = <0x0 0x8>;
-			gpios = <&gpio4 0 0>;
-			ti,x-plate-ohms = <180>;
-		};
-
-		/* ... */
-	};
-- 
2.34.1


