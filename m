Return-Path: <linux-input+bounces-5711-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E68A958C68
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 18:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3209F1C21F51
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2024 16:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAAF1BDA92;
	Tue, 20 Aug 2024 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zv4TP+RN"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3FF1BC08B;
	Tue, 20 Aug 2024 16:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724171852; cv=fail; b=VUMllHCkqYcfSAGBvayQ2wQSLZByf5QVec+EjcW71+vAIVGMWOUeugx9qozL28CVWUH0rCDtnsQMcny8o4KAuH+7fmqEqOehCmEgIs2wfohynXfRR74eZ6KogU8ap8QazWg3fnLX7RpJv8Xlcdp5p27KZyFPX1BnXTRmeQqhW2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724171852; c=relaxed/simple;
	bh=c0+RnnexctNcwGD/WIweohC3HOnu0Obujlvp1QbSlK0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tk+UI/KlXR2i0rE92gZLBHS27QSnsIj29ZvIhN1eUXWoj5NO06n0oJl0ht0UJ9RLi5UJWX/BiryKYrchKcHnwe93lNsbeQa7ng5B/TCPrH4E5he8D4Kj9zzdYxpACfk+sCEB+r38KwH+UcQxaztVpDKrnSuxJAS6Uc2zzw1P+I4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zv4TP+RN; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=exRHBJhYy3/zFq90Gs5NLe6C+2tR7/qM1yIvQ9lsTEXKv6AL0hpCCOzVXc/AkQZMiqRpn97HQxncXHlKN+gEP0C33pmBjSZNFccorg/o6et2E1w/P0V3zPMyUdvyQzYgp6nYG/a25Y49ghNrdEI0vir/TEn/LhhLPwomVS2727ZwB5V/NHOugmgjhA5pSP+x5C13TwWDA8KnX2KjaFLX1pC3WHN68PKzKec0Wozmk+BBi+UVmEWoz02BHMO4AKTYB5gxAFU9mCORBY/CZJ8+SipzfOYV//4lcAf1Rwx3P271WuiUWf0s4f9WDTkZAYpP5f6F8YKrBVyVQiUTQJFY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w10/T1QD7tGNOvnPUOfBzw8MCHnFRfABQ6H9DvPFFY=;
 b=FNBnMbXk1ql95Kh1E6udhgVG030dOBUOBEGZvJyxq69JpdyqsGJWExcv28K/Wk4iOnVE8ctaNGiskutXITVSY65+RozV8+K5UadmJq9kxzPQlD0WLSRViFSoERnBeog3MXBE4GLxviXmRpNDJPCz0V3qSto5PT0tRkwW4cNeMjlXKHOZIxC2ftVmz7WoHDalOVauuUcpQsiXNbMozo959SkYZfMvdLW9ICVCsJaPTUpvKPs3atid+SyDqU+ndB6Te676g2ilK363xTtDzyXA59bkqQry80zzGDyqqwydWo3Ajt7BniHhnleIjVNc5E5xxBCVazqO+N4qgD34h9jefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w10/T1QD7tGNOvnPUOfBzw8MCHnFRfABQ6H9DvPFFY=;
 b=Zv4TP+RNwfgxHr4yq+koyqKczea1e/OSPAwO2qlhyMxRzgF0V461Iezg59xnddpMaS5BtDpf5W0sjJ2Ck7FlOAJb8Z/8jKFioLpqx/458jELK2i9vUP9RjVd9PdMReSPqvWUef9EkMhG8NmBMQyI9DlEPwssF6mnH0V9BDJMw+UOvdwLor7emXrM6gmNWnoZk6yeLqBjsAh6xki3N9PTf9zStyXkchljACGslWCxIyka4gEe/Y4gnojXcsHSJjl/pyov8PfuAT0ZfU6VP6rUEEEsQtbR7hrVa25xdqUHTTkrB/mLGWjEe1ajUSi7w0AGzMD3KgEu7582QPmk5WDITg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS4PR04MB9340.eurprd04.prod.outlook.com (2603:10a6:20b:4e8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 16:37:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 16:37:26 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v5 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Tue, 20 Aug 2024 12:37:03 -0400
Message-Id: <20240820163710.448302-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0207.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS4PR04MB9340:EE_
X-MS-Office365-Filtering-Correlation-Id: 44eb56db-ebec-4025-16bf-08dcc1366010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|7416014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F7W61wQmryfc3PaNxEXII3jlvfkzOBG9v9uEAPYV3QMF3GEb5JaRsWhzOUyP?=
 =?us-ascii?Q?fSTocuaE3iiOqIEbTF3S8L73MrSDiqCg3dlrPlsf4PjyBaxb/7zYtW5oAGNP?=
 =?us-ascii?Q?d3kfXaTTmfdsazB+KWmA329GCYm7Y66U+LJoW555RB1ehXFxQAh8zz5tf2W3?=
 =?us-ascii?Q?TuFPOcc9YI8zA6m294QzT1xQaDeFslgjnccv59DavocbBMBidwyU8l9FZ+pU?=
 =?us-ascii?Q?U/GsFPiknPC0wSf488sX+mNFaaIA365Otb07hKGo0X0KtzWjHkR26P3Ppo9N?=
 =?us-ascii?Q?oCzqeFnnssDY/2N0yJg8CfHYEkKM4Myti4DwYIdudoGVApXI2Zf7sm8iMkh5?=
 =?us-ascii?Q?fHv+zPc8w9hpRj4m26rtvWTrfOtcHp8OydjWL59Cqe/C74OFUUU9xSXXPeF1?=
 =?us-ascii?Q?D/dZAVDifeQyjYkNpvyVNqoMbppi8IVGnvnRfHYdjz8P4qlgELtHYMThjbq9?=
 =?us-ascii?Q?gMEAjG5LcLCy3o6LRTRFFEEQibTIhPy66HsKEyDRPhAjc13io8FWQAFGFmJl?=
 =?us-ascii?Q?EStqcgOdbR+gpoZNuIvaELtSBkivAjr3X90PIjsxAIh/fqGJsHvdQTWH/SOT?=
 =?us-ascii?Q?D7QOiP0TZDZdciBejaYbnMi1+InCcwKDjDw5TPPhl97nRRYO3sIdOEN1b+Jd?=
 =?us-ascii?Q?YCcm6Za8hRAlxEjunC1KvF9dF77nNPvNgI5zfu2IEb7PJ1vmLWX3vckntL13?=
 =?us-ascii?Q?mPmQkBLKHXyBEsDTGzyGUXNvzu0G1cbAZgm9sfKY80ltn2ptgS/VCd8B8fGb?=
 =?us-ascii?Q?gVtk5tAgOs5gDFKqxnBq0eoJ9XQriRYWhVviXVUUIQqO0aOe7uUHrCAnrwR8?=
 =?us-ascii?Q?fff07/R9ELc2+5rb87KBL3WcxI7yxL7g/MuRs690/fKTTYjdorZySjcuKkNP?=
 =?us-ascii?Q?gb1NCeoYSWbW4qGQat1dITXWlJyv7awXuiVld8vyXlFQg0SkEdmwuUmrRGl/?=
 =?us-ascii?Q?RZA38KVwttb7252CpjfNKCtaevSTdu7qjH9RWEAoKF2b/x3ozx8sCFY/PO1c?=
 =?us-ascii?Q?1vwFokrJ3eOPVWXWez8P5Gw4SryYfLJ1N0d525KzpsjgOB3dRqTfUCdfi6gE?=
 =?us-ascii?Q?XrzjE0ExrVS3CEgauKLOKp/hRE4iA4hlVUZxIIRhEjbGNY+RbnD8ypIZIEuA?=
 =?us-ascii?Q?jdgfKgzqPqtOGvq+nM1H5OHUXO23Y6AceT2kf/vcfWjAKIYVsKfGhAv+ck7m?=
 =?us-ascii?Q?lQP0EBNlhzid3gC+5WFODVZNn8QP3HyxiSAcRp8izLfKV9SPNaBHNUniw+lH?=
 =?us-ascii?Q?66uPBaUBFd/JXzeL6In3soOX9hyW2vrqIcXnoKONu2pfXAz1WgUUpunSvWg0?=
 =?us-ascii?Q?tdBBUm60uznje0Z1SQitphpKybtQdv5T1cDE/6tlBjAHJ6Qu6gA8UcMd3OhB?=
 =?us-ascii?Q?6Jgk8bQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(7416014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q7yx7KN8fReBZv0JNmoVMgdiQMHQnsZq+9MWnzal2c/+KCyNGcVrYA8NTLkk?=
 =?us-ascii?Q?6pBDeeRfRRJhUB3NicekiWgsI2fnnVZewEo3M8jP8e5h7vXEzNPfvUn9g+DN?=
 =?us-ascii?Q?t8sFt1nmaVKefVJyCYjQe6SUXZsHA1RWIkLlUuemhVXtO1JyY33IL2mnckNQ?=
 =?us-ascii?Q?lcfBW1RLCmf/u4v169VnT0O4oMRcIgniT+LtT70n1Br3nCrFCFzPecChP4PC?=
 =?us-ascii?Q?49969GlpTN//oDa1k/Rx0GD2msqFBk/E+2C2fs4yExgCLw+ngmpFf5YDoA15?=
 =?us-ascii?Q?EQO2etf5kp00T5ZcJoDJMnGsAPF0kREt//y9hq/uyqzobnHUXgGaeSc/hUJF?=
 =?us-ascii?Q?Ys08q5krrWCMg3b2pUyRhGcu5ScIH5gmID22q50koOe1FKvmjTDB5ug3B80+?=
 =?us-ascii?Q?OzM+geI3FsEjOkV9Ji2cWIWe9bGgtUdDtiBjHBFSwfLvYEZphzMxmTP1Oz0E?=
 =?us-ascii?Q?yOb/hKIsa1gMK0XEU12nIhztuOfhkoPx3petzqJynAqZUemD+Lrv0UENZorv?=
 =?us-ascii?Q?ixiSnUJJh7f+g2XcaxK5QTq2HBCxDJIoF+bD7lMymmRtDz/HZ5bqEyfDPQWt?=
 =?us-ascii?Q?xC/5CVo6LIZ1sm/MP5EGnkqN+aGmh8vIZ5e80/Nzq2rp+SHiCY8zBL8Oz+/E?=
 =?us-ascii?Q?Jm4pJRi/w0sCSUwluP+2WOvY4KhmKQTj5SMcOnJtDOG8zR9lqSBi5+Ogw6Xb?=
 =?us-ascii?Q?3iThPiHe7l2e1i3hT9xpf1FXrb/HRzMk/2OiBgC5UoAC7Ed1e1yI20o0/T6U?=
 =?us-ascii?Q?FPebLZ8ZQZPAdqIdYrWVQxQDDjNoeKFa7fABtTE6aFGb+xo46ckezAwkA8Lr?=
 =?us-ascii?Q?iFQpqaHs/ASQ8/DVQdmJby+WeAtzOeICci+xCe01pXc5jDYvV2NV+boR1FE8?=
 =?us-ascii?Q?FDG2Ueu/75UdoDQwkEeD2B3PY3sop8pMuHx/US7NpK1lJFCGwic0I6nFE1aS?=
 =?us-ascii?Q?Qt+K5JLvvyitYBmEaog6Ml3nqGQeCWLWBSTA1aXL2zzsmTIMHbiIVEDa6bYS?=
 =?us-ascii?Q?wOgf+jfyT5ifuVFQhGf45mzbh+pgDbw2rQzp1SB6OTWjXPv4IkBnWuk07SEH?=
 =?us-ascii?Q?DT7BXZs45RZmRKuRxypJ3OybxML2K2UOKEPvhjS/hGBKH44EuRoq/nGAjhwF?=
 =?us-ascii?Q?J/HW1J/nnbMqjICshL1a9DBABJ/XEvIEu83hZtEvZZXzwNHj6Y0kieA/f3y1?=
 =?us-ascii?Q?KLSgmnfzYxpMilUQO7gmt7Srk+QaDRolHQxuaCRMLWzeyYKxqtaPS1EL+FUi?=
 =?us-ascii?Q?C1MEwTXJwAn+gpeQx8VuZgYYXqMiDlEKZyikrCLzSk1CbsUDW9pJFE+XHKzX?=
 =?us-ascii?Q?p8b6CFvvtsRbD2sBZ8dCon7zzjAbTd7Fh3dUfRZp/aRwynvkHB8ezuUJ7CIg?=
 =?us-ascii?Q?Ooq0OogAGmekBR1IU59YPwJnWBi00kU4JwqsSsCYRyJssfjXADiB6LVTaYiK?=
 =?us-ascii?Q?MxpOUUDnVlzLEv7ImFNSQrWHdcMLIFZlqg4q06oBPXkYT/2UX8O0iGlfrL5g?=
 =?us-ascii?Q?8y6ik1e+MFt6plyokk2co2UJPLlxzg9/uKjbdrkY9pLI/JZfBNyQMDxqMlRK?=
 =?us-ascii?Q?6uPY5d/b9alB4z0dVjBGoP6BWtw0Y64QHU3Udk4T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44eb56db-ebec-4025-16bf-08dcc1366010
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 16:37:26.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy/LpZVqac7uL5p2isdOn1RLf9kiWWBZ84ER5HvJcEwSGdaEk4LLqdqZWthkg4UVYIjhXo8z2SL5ps/0X/RHeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9340

Convert binding doc ads7846.txt to yaml format.
Additional change:
- add ref to touchscreen.yaml and spi-peripheral-props.yaml.
- use common node name touchscreen.
- sort ti properties alphabetically.
- sort common properties alphabetically.
- sort compatible string alphabetically.
- remove vcc-supply from required list.
- deprecated ti,x-min, ti,y,min

Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v4 to v5
- Add Reviewed-by: Marek Vasut <marex@denx.de>
- Start sentence with uppercase letter

Change from v3 to v4
- new line for all descrptions
- add . after sentense.

Change from v2 to v3
- Remove u16(u32) in descriptions
- deprecated ti,x-min and ti, y-min

Change from v1 to v2
- sort properties, by 3 group:
  1. General (compatible, reg, interrupt)
  2. Common properties
  3. ti properties
- sort maintainers name alphabetically.
- uint16 have to be kept because default is uint32
- remove vcc-supply from required list
- remove unfinished sentence "all mandatory properties described in"
because it refer to /schemas/spi/spi-peripheral-props.yaml#
- fix make refcheckdoc error
---
 .../bindings/input/touchscreen/ads7846.txt    | 107 ----------
 .../input/touchscreen/ti,ads7843.yaml         | 182 ++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |   2 +-
 3 files changed, 183 insertions(+), 108 deletions(-)
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
index 0000000000000..92d5e7d3b1ffd
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -0,0 +1,182 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/ti,ads7843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI's SPI driven touch screen controllers.
+
+maintainers:
+  - Alexander Stein <alexander.stein@ew.tq-group.com>
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+  - Marek Vasut <marex@denx.de>
+
+description:
+  Device tree bindings for TI's ADS7843, ADS7845, ADS7846, ADS7873, TSC2046
+  SPI driven touch screen controllers.
+
+properties:
+  compatible:
+    enum:
+      - ti,ads7843
+      - ti,ads7845
+      - ti,ads7846
+      - ti,ads7873
+      - ti,tsc2046
+
+  interrupts:
+    maxItems: 1
+
+  pendown-gpio:
+    description:
+      GPIO handle describing the pin the !PENIRQ line is connected to.
+
+  vcc-supply:
+    description:
+      A regulator node for the supply voltage.
+
+  wakeup-source: true
+
+  ti,debounce-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Max number of additional readings per sample.
+
+  ti,debounce-rep:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Additional consecutive good readings required after the first two.
+
+  ti,debounce-tol:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Tolerance used for filtering.
+
+  ti,hsync-gpios:
+    description:
+      GPIO line to poll for hsync.
+
+  ti,keep-vref-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set to keep Vref on for differential measurements as well.
+
+  ti,pendown-gpio-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Platform specific debounce time for the pendown-gpio.
+
+  ti,penirq-recheck-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      If set to non-zero, after samples are taken this delay is applied and
+      penirq is rechecked, to help avoid false events.  This value is
+      affected by the material used to build the touch layer.
+
+  ti,pressure-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum reported pressure value.
+
+  ti,pressure-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum reported pressure value (threshold).
+
+  ti,settle-delay-usec:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Settling time of the analog signals; a function of Vcc and the
+      capacitance on the X/Y drivers.  If set to non-zero, two samples are
+      taken with settle_delay us apart, and the second one is used. ~150
+      uSec with 0.01uF caps.
+
+  ti,swap-xy:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Swap x and y axis.
+
+  ti,vref-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Vref supply delay in usecs, 0 for external Vref.
+
+  ti,vref-mv:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      The VREF voltage, in millivolts.
+      Set to 0 to use internal references (ADS7846).
+
+  ti,x-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Resistance of the X-plate, in Ohms.
+
+  ti,x-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum value on the X axis.
+
+  ti,x-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum value on the X axis.
+
+  ti,y-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Resistance of the Y-plate, in Ohms.
+
+  ti,y-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Maximum value on the Y axis.
+
+  ti,y-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Minimum value on the Y axis.
+
+required:
+  - compatible
+  - reg
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
+           pendown-gpio = <&gpio1 8 0>;
+           spi-max-frequency = <1000000>;
+           vcc-supply = <&reg_vcc3>;
+           wakeup-source;
+
+           ti,pressure-max = /bits/ 16 <255>;
+           ti,x-max = /bits/ 16 <8000>;
+           ti,x-min = /bits/ 16 <0>;
+           ti,x-plate-ohms = /bits/ 16 <40>;
+           ti,y-max = /bits/ 16 <4800>;
+           ti,y-min = /bits/ 16 <0>;
+       };
+    };
+
diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index a6c8978964aa1..9a4f8310eb67d 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -25,7 +25,7 @@ List of legacy properties and respective binding document
 2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
 3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
-				Documentation/devicetree/bindings/input/touchscreen/ads7846.txt
+				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
 5. "linux,input-wakeup"		Documentation/devicetree/bindings/input/samsung,s3c6410-keypad.yaml
 6. "nvidia,wakeup-source"	Documentation/devicetree/bindings/input/nvidia,tegra20-kbc.txt
-- 
2.34.1


