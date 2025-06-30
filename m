Return-Path: <linux-input+bounces-13236-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E31AAEE4B9
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 18:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 305FE1884BC7
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08A29292B3E;
	Mon, 30 Jun 2025 16:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BUj6UU7W"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF6C290083;
	Mon, 30 Jun 2025 16:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301169; cv=fail; b=q5ElCxq/mlPK+iMTEBJ00JmpiEFYuliykSzQoJXnxUy6J/72KzHUarF/1PmdVF4YBrMf1496iK90xYotNaBxXIXSJ4UOjuCdQmyEaa2lyVSMjQFcbt2M75LjRHUDOdnoDJGZw8dJ9kMksADDMspdJuxYzkk6WvMMb2H7+VnF6bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301169; c=relaxed/simple;
	bh=gPx9f8uWYpwLO6wauDUgNnXldfSCAUBd/q6k7/IQ1As=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tZqtrsh5OqSl44CrXGreJZkHDe8x5j1sdqTfUXW3BTgIwoG2P7EXn0SJ70zemFzWen9S/NmkrkvwMDDvlWJ64QHzPO4sdn4nMv3yuJIGBsbcHYyh6cPNFyJpIHJRoGHG0SWSbS8Vi+lD5fw1G2yl3rYfp8siI/GJGOM8rPel4Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BUj6UU7W; arc=fail smtp.client-ip=52.101.65.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u93jStN2FxQVJiRNLMNo3dEMwDFDPIvFZFhoVsJBIQe/aDw6U0XI8pc2Oh3eMa2zeogsSrBJe8Pe49GYOradMwWn65Wu787fNgs5TN2F6IMIM5VNkZQlnqmixCFfYCfgwDFMm6BgJiuT3yPicbZ5Pp/jIIWNxY64ScWoXDEVVKxwZ6Br5xqy1gDDGkpx17VYOZzGzK+Ufq9DFR/bFiZs5C1xEOk2ogMzQP/ZUcMVRMgyiBbegCHP53roo7wIOjgHJD8GI5fsc98UeJAldZ0jJWXQb0ow68iuVYPKTVvvJfUpAz2O13vEWZdRJCznk3wlbeu91NahA8hoh83BtusSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCmZbYCJfOr6WH0O5tAMZaWPDcWJgjhkvWzPM07viQs=;
 b=Vred924M/yj/xQLI0vhePs54M0iU7AjxgjkMB5QHDiXIaugW09ZjS++eNHG8dcJfK9LqQI8v9B2aTu5bzyf9fdOLbzgYL+qTjfidMTlyaxQAXxcdTISRE1kAE3z3r0Psf76q0qs+aKjZDtiMxmJ/+/gOFXdQ6/PcOIgEJ8sHgmbJcz8+cy/Ei+BSayZDfSekhwuuFjWHgm2q9VcJCLNFJc8H6e1iTpnQdNA9I93zZD65wKriaSgpksCdNaONh1QlRFfq6F4G7+zxU3OwKqDtYJB4i1bOVjW4LiSO52zwEWiTsKCmf6dKu6NGRi0jGjHxJl9ngfioq7lGO+ncq2F55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCmZbYCJfOr6WH0O5tAMZaWPDcWJgjhkvWzPM07viQs=;
 b=BUj6UU7Wbos2UQ0vfoBITZIvXp73DgdKcUSLO/7BMm2NzY69ElU9+x5HliF2aqsOde5KShE8gHB1Nu/kMzj0gmUQD6yaTwtaFOHQESE+aa4IC8gGX1o+w0FzkhG/0OuaPEho8cNlnGdtRzkOTPXfZw+0NA1WlkbBCuXJcWMNDH5hK/DgnhUIYYtlYryGxyjNQDuZtLbuP/XbgcW9Lqa5esjsSDxXPizvTLR/uqlcT24s6Kn8cMKsqwOnso5iAJrzu0qpZb5nuBEv8iCVe5hJjnJkrW5UUL+DK8UbFrSpaHohUnD+Xp6swPaz5seIu8mfTA/2FAxMhYABxM6IpOHu1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 16:32:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 16:32:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml format
Date: Mon, 30 Jun 2025 12:32:31 -0400
Message-Id: <20250630163232.2839067-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0100.eurprd03.prod.outlook.com
 (2603:10a6:208:69::41) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 9552fa6d-cc4e-4462-f60d-08ddb7f3bcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ktJHSSv5+FXjTQK/kQOh5phvk/hR48EVWzvEag3h8PFaVNX19YcM2o2ZPwhg?=
 =?us-ascii?Q?K3onOu6dIwgES0rXVOQ7fjDI71BhWtlBM5jVrfm0EJYHeERfaySo74I4aLKf?=
 =?us-ascii?Q?U+EnpbrqB9P2dOBSrRhSHdX7X6oDHlKe4EwX9otMV1JfAzGF3kdvo30S+0Vs?=
 =?us-ascii?Q?+h68rwJOntlLYytabLP9myhbdYuZk+EJ/3CIKLzY47SsnJ/L204vW0UZsk2T?=
 =?us-ascii?Q?dzYS1JSlzWcWrae93ivR0y5MepPq2mPaDf6r328Mpevf0fWJXA9kJabKOXS9?=
 =?us-ascii?Q?IMm7vyxpDqxAJ9hmldFTPBlD8+ePfURCJSK81PPhzNVePA/61zA2miH6sYlF?=
 =?us-ascii?Q?PvA9j7etu77q4O71XNoXIT1EE3puhrpW06rXgC/THKpB8P03pdVc88uWNHvd?=
 =?us-ascii?Q?2TgVA70Rma/FCyz1QcOJdXG5MhsXUEZ9CGFRGqUzPftJooJ9opi5OjYl8xjz?=
 =?us-ascii?Q?5B5ctoWJ9F0/mJFfcupRuHkVBHFjm0vcCIBJOdSvKGGkQ/scxN6Yef+DdAlH?=
 =?us-ascii?Q?Y3LpWKqD9jkIFviBCDLvw0BFn3SjPctsrJHXlWJSc1FQ4HJt974B71TYBQkM?=
 =?us-ascii?Q?EiZJLYZBzBvIf1okKqftSNdj4DPm1aN2Nv1+L38lXUK4XxxFY/N7LDqcETqv?=
 =?us-ascii?Q?dnB1MAqyLqF0O4vYoIVcrwi/mKLbDZsgeeGFYT2rx7PsrOQo1y2Z5jPPX36r?=
 =?us-ascii?Q?HyZRf95OrCU6FiddCpWB7EF6/e5Ug7Nn6S5Es0gKAJaMUGhzpOudeAGdlxKX?=
 =?us-ascii?Q?4GeJWOmfdOOc3qVPDezZWmPxsOFxe3/bb4ERFpCdgXG031+T+BbIal1fPjN3?=
 =?us-ascii?Q?W8aib08IgUh8DPqNPJJ8h6DZ0udDBuWldSGqNwGNnJVyA6zZGNOYz25FxcTH?=
 =?us-ascii?Q?gD2E3Z+bEBVGrrjxD6AC0iFzZ84+EwtrjZFFmzcKnXx+E3I3UcdhgZKJM01N?=
 =?us-ascii?Q?1HYACdqzDp2SYgBvO/c7iiLMGfySJ3kMXdhHZOOCanYgEmBLUiP9QEYYkHtU?=
 =?us-ascii?Q?wKTyEoeXKlyRFqFCbn+72pkwmXmLMRQnsS+GA9Iv4paZpLlmFk6bzthV6qUP?=
 =?us-ascii?Q?8q2cP2CVKp9Y1GbXi511H0V2GebfpvmRDKNoeSLwLeIGRl2+MfCjDhgpu/6m?=
 =?us-ascii?Q?olLCBwMrxvbe9+cN+E7clMh8dKM965UheTeidHMofNsfRaPfjogiuDwPJlZK?=
 =?us-ascii?Q?VxEIgsMibXf9dMRKd/6T24YQ97ooCTnRcnvPPmj8c+1Izu9MB7y3EZJpnt0p?=
 =?us-ascii?Q?yda0cRhMLVL4uKV9Sh+j8VVXE1t+wPRDphKMEw9cWdbHcHTL97k8nlrb4yb5?=
 =?us-ascii?Q?UjWoX3szwrYolnylTbKlaEFxrvfXMhaRrOyixS+0ZnH5K5/Bo5FRcilmhYWY?=
 =?us-ascii?Q?mw3RCwkG+86/FAXdXmuL4C7UiT0hEGitThi00ZwzjpCSMGRNP3g0P46T+DkJ?=
 =?us-ascii?Q?qgPV9gvC8//d/MThyooB/SSv/2w8V7eJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ceRnjfrAa9SqazhF1l9kG5+T0CIeMd2aUDPXqwwph23KYiauXJg2RZsqGqtv?=
 =?us-ascii?Q?erjAOxi0G32HZZ6lBtZmIEVc4nQcweiO/OuQAoUZ5te1neOYrokzclNmA3fW?=
 =?us-ascii?Q?qzhyT3hB+F9goNBDfgMCCqUvBNJfhaHd8xmMlH3iDvyYkcF+ogFvCuIIdQY7?=
 =?us-ascii?Q?sp7J9RYjgXWCFABVVl9KvHMbxFLIms2jR8qEqQUuIQACZv+Z42pLRixZ0iDd?=
 =?us-ascii?Q?WR163Fse1A2AP+NFT3f9qRMf6QcdRQkVeUC1BP4L3F6laqRftzajZraLrt5F?=
 =?us-ascii?Q?09Dd8l9NIZNlZ0uiXG3UxR6cQXx91SizONZbYhj5caE39E5ogy+wC1LYfRRD?=
 =?us-ascii?Q?KjOg+BSCmlxxV8clSzpX/0RPGV9w7ls3asHjU5TdTr2e72VKPYE5yfBin1qV?=
 =?us-ascii?Q?fuK4d4ioAsc7UTACgpHdcoH25c1eXazaizxwCI7etN29gB93NsOT9aXtcUDz?=
 =?us-ascii?Q?x/vQYsgcyp16L7V3nEHrInwAo3Hj4Bps1gXF4LkbGMj2UemC5CIwjhLNN1Ls?=
 =?us-ascii?Q?r/cEI37rfTCR6yNyQg3rlRD67dZAnQIFwz/MfGv5VxxddCdszXTGWJDvJxJw?=
 =?us-ascii?Q?cvys/Tp4qPOCf88ap9JiRf8bskQMvfrxTMHvaIqCTOt0XDbIoEzsyyLwwPLa?=
 =?us-ascii?Q?9hbjO9ogxNreH9Xzt2ctRICkI3fhXO8OM/c5iqBKMxzV+NQpFfR/3UUjGgB0?=
 =?us-ascii?Q?HWWuwJvYYL1vXOq3vu8W8/So1TAG3HlDMQayM1ms3/2CL4fotG786oUUK2bk?=
 =?us-ascii?Q?SEph4/rfJaW6M/ajpfZHEVGkxt+Xk7jL1z+d2Km84uxupPGtfPlYTJR7MKPW?=
 =?us-ascii?Q?Ts8i34LcDUmnLO9d4UigwdHL/Ux+ckHHxgHjy2KzsxB/Rlvmf4xjcv3gdtcM?=
 =?us-ascii?Q?leYRCHaegUJiWPMQZHKJ8NjBS+EQ2KZAwuBpz8LZupssEgonrwcTucPNFuKa?=
 =?us-ascii?Q?vz4EpLtSXR3Xms2hFUrbJvYUskbfG8mV+y1G2xpXo63Z/tdcuDYy9zfwKPox?=
 =?us-ascii?Q?3yayMalrcjjEr8TriDuTumrLEr9hQWm5A6xE7c0e3tfhefq4c6429/qAJknw?=
 =?us-ascii?Q?ldcJAb0KGltG+iNLE+ZfEI/r7+Xu/+GChb4Tk5BAhZ1C3LY1M8G4n6tMxXVa?=
 =?us-ascii?Q?f4t9R32MwhS4RH8QOiLX+WPz/KohD4fqXUJeSFc6v1DYbDNs5F9THiNF3O8z?=
 =?us-ascii?Q?tJPAfd7eMSdEJKzcDp0rb3NhjD8AEZcrANjccnMZzum9VkQHH1N8xVePzYDX?=
 =?us-ascii?Q?m22wOotlN2GaBd3uriuyW8t67XZTTWvD7NX1yiOTVGTCdZiQBMcgpB6ITs7e?=
 =?us-ascii?Q?qe6APjeAo0uJZ8Kw39czZHW33Q7VKL9cQXg0LmU6S7dTdzcD3w2FW8KBg4Nh?=
 =?us-ascii?Q?O5DRUAIFJJxCW9cV5mGGNgipk7vkMovI717gizkKB7grot+ylOlNJdG464Yo?=
 =?us-ascii?Q?hbPQmo6H4bGYaEtuZfdMKiB9CxFgD/0ugfCYsGkNjc4AWcPtzdjEJIlYHxfU?=
 =?us-ascii?Q?7i+Af834SBaeEjSl0Od57PDBIaHXdpIqFS1OrAC3NzC+FOaQbixu6KcaQRRJ?=
 =?us-ascii?Q?sF3XfMf9WfsMKE8ij6Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9552fa6d-cc4e-4462-f60d-08ddb7f3bcf4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 16:32:43.8903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iGuocp1L48gGLYiY7Bect8AkcDyNQSM+rxBAhOKXtQ+VUagFTxiheUfBUr+WgkTQJhWQ+FEucE3aEVfhmlaGVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754

Convert lpc32xx-key.txt to yaml format.

Additional changes:
- set maximum of key-row(column) to 4.
- add ref to matrix-keymap.yaml.

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add ref to matrix-keymap.yaml.
- remove properties, which already defined in matrix-keymap.yaml.
- Add Vladimir Zapolskiy review tag
---
 .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
 .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
 create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml

diff --git a/Documentation/devicetree/bindings/input/lpc32xx-key.txt b/Documentation/devicetree/bindings/input/lpc32xx-key.txt
deleted file mode 100644
index 2b075a080d303..0000000000000
--- a/Documentation/devicetree/bindings/input/lpc32xx-key.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-NXP LPC32xx Key Scan Interface
-
-This binding is based on the matrix-keymap binding with the following
-changes:
-
-Required Properties:
-- compatible: Should be "nxp,lpc3220-key"
-- reg: Physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The interrupt number to the cpu.
-- clocks: phandle to clock controller plus clock-specifier pair
-- nxp,debounce-delay-ms: Debounce delay in ms
-- nxp,scan-delay-ms: Repeated scan period in ms
-- linux,keymap: the key-code to be reported when the key is pressed
-  and released, see also
-  Documentation/devicetree/bindings/input/matrix-keymap.txt
-
-Note: keypad,num-rows and keypad,num-columns are required, and must be equal
-since LPC32xx only supports square matrices
-
-Example:
-
-	key@40050000 {
-		compatible = "nxp,lpc3220-key";
-		reg = <0x40050000 0x1000>;
-		clocks = <&clk LPC32XX_CLK_KEY>;
-		interrupt-parent = <&sic1>;
-		interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
-		keypad,num-rows = <1>;
-		keypad,num-columns = <1>;
-		nxp,debounce-delay-ms = <3>;
-		nxp,scan-delay-ms = <34>;
-		linux,keymap = <0x00000002>;
-	};
diff --git a/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
new file mode 100644
index 0000000000000..9e0d977bdf5cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/nxp,lpc3220-key.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx Key Scan Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-key
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  nxp,debounce-delay-ms:
+    description: Debounce delay in ms
+
+  nxp,scan-delay-ms:
+    description: Repeated scan period in ms
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - nxp,debounce-delay-ms
+  - nxp,scan-delay-ms
+  - linux,keymap
+
+allOf:
+  - $ref: matrix-keymap.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    key@40050000 {
+        compatible = "nxp,lpc3220-key";
+        reg = <0x40050000 0x1000>;
+        clocks = <&clk LPC32XX_CLK_KEY>;
+        interrupt-parent = <&sic1>;
+        interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+        keypad,num-rows = <1>;
+        keypad,num-columns = <1>;
+        nxp,debounce-delay-ms = <3>;
+        nxp,scan-delay-ms = <34>;
+        linux,keymap = <0x00000002>;
+    };
-- 
2.34.1


