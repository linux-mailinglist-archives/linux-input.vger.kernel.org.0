Return-Path: <linux-input+bounces-5491-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D628C94DD4B
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 16:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8163C281A95
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2024 14:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC58F158552;
	Sat, 10 Aug 2024 14:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JYk4CJEr"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2043.outbound.protection.outlook.com [40.107.105.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0933B22083;
	Sat, 10 Aug 2024 14:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723300748; cv=fail; b=qb39QsTfVcWYyMd59h57k1EjftQTnw1MppLpGPWExw7ge059FePxp8sLokfKhveClh+wgy3T8IXYJ8WeMqDlH1YmoOhAtK8jFYzAx4El1L55E4p2O0TdnsF8EXd+VyMzEyZGofqfd6Hbcnz/Z1+9iHvhRfPYf3re2a4wuntTJMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723300748; c=relaxed/simple;
	bh=tH2lBC3gm5VKQl+h/kSex8QXQJxSgQj18ATsX+HGZlg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mU31Hfv+A20eucZjBFVgLRXSS9YUOQZSujJ66mfCg/QaS3gGXPYMpgViS9Il9q1oZMVi9RxNc/1sY3vQJpYsfh3GV9N9h/e7HK95Szfq9E8QzyY4NKV/A2cVG1qf6sM9RQ1rI5jdA59b1jkWUa5++PMYPPLoD0rhiY8nnx7aImo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JYk4CJEr; arc=fail smtp.client-ip=40.107.105.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AX5QyC8FeIE+cpx6Wm6ZLXdCw1+gc05MUMYOTDUJ8fi4FnExWsCl1poo3UWFcr/opHg+eqDWp4NO1UfWr3iMipReQBszkgR4ZjiCSbqBL9XAcSrIGGCyyQ6E4zjMIUUYwAQ7oWFI5qbdQ4iAjCKw9LOrIyYVauVD+LaPChH7xXp2daDGVkeOyDF0cS2TZftc1z7WAIexhcqE9xU0BpIrgU2dQR0itTP35jWLsoW0KDkjFwUxkhHazCCXYBWCourlCQSJ77s4lip36blNfaDdnW/95900uoDT6h2axY8mMP2cujc24sQWQlEhqFtL/cWSuKBL1I6lxE6LGUQykqqaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyOrCR4DFfYPnCPZlDGzdjz9EcE7Qez4EKk/SaSXi3w=;
 b=gowHMTcCdtLOnH27r3aEPTcYfGjCeyctgx4rdZNrcGCtKULI11u7B5sG5Sn0+Pj6o++qOq6CwS/BTaqD9uNN23zUeZR7R6RzdVhVNOIZ5qodE/bdwVAneF2goXwVHOQnFMTttDJdZX+rnOQtxlCs10HY7Z8FKH+bBfN3ThZjPRIxkECh9xiKFgm3VgzpdObGJrG6z1ZuCcNxSXg7r50b7QD++HtmQJJgLvl5UgZoNKhBLZEVlji1YnRD3yPbSXpltD9Z9S/WLlj6zkSgLQs0fy0bmhgT1u3XiU/7jzKZwggj7fcLsZcffeiUU2AlWx5zuYPAjPulKsTZcoB0Ya0+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyOrCR4DFfYPnCPZlDGzdjz9EcE7Qez4EKk/SaSXi3w=;
 b=JYk4CJEruLH4xzEENT6utGSXQvGHaDWXoh1nYdKWMLxZQC1hEaF2CwC9cTECceyAQpx+2yDQn2BhYfXupzdnyg3FAvSusexoPsT5+TQsZRE3CpkPTuI1QPHBEHJmXW1cHfio1+pNJsilBnK8MzABWOzABUiLywiCl3yjI85ZvpgIv8aljigCJlCtLId0eqTznSTAWDpJ2nB6SV9DjEQZvrBN9Jv7TtCI+X63g9zD84o/M/FV3vHi7H9WqkslaCbHzEcz0KFMd69sob975kVgK165mOJreEhW2ggEqqgirhiwqDnCIKpXk5/YnY+n3P3h1SYC1cJP1Fwwye1+41RpeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7515.eurprd04.prod.outlook.com (2603:10a6:10:202::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Sat, 10 Aug
 2024 14:39:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7849.015; Sat, 10 Aug 2024
 14:39:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert ad7879 to yaml format
Date: Sat, 10 Aug 2024 10:38:34 -0400
Message-Id: <20240810143840.3615450-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c3f7651-515b-4654-af36-08dcb94a2d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MHjKwc2AIy9SNrDDHE/3CaVMx38p6bVMz0MEratB5Xuq5DAi17FUiVjYsXD4?=
 =?us-ascii?Q?rdDwqpQaxXapwtwMQ05r4ErGsU+RaMwQUnS9yEGQJja2MnPAvI+iyej/UxQ4?=
 =?us-ascii?Q?4B2t7CRnTTOWBQjMbDHCKMqAJEWZj2x96YH3cqmMs9Ctn7Ye32vlBhaSaOcy?=
 =?us-ascii?Q?SVF2BwY03My6Z3fMPZIBz2hzT4ZWYbHpy+1Fi+lgncDE7ggQk2EWlzF1RjqG?=
 =?us-ascii?Q?VHT64E6ZlgTB+pbP+5ILYBmmLNm92LN58Bkm9iqAZZzk/KATyy2ri1UERW1o?=
 =?us-ascii?Q?Nh8udoromfgSnNVa9/nn3tv+nG1bIdndksnTEM88WYcgf0kjpp/A7DrvGUr0?=
 =?us-ascii?Q?X1lKZPIcDYn6OEOHddiMXipnVifXw369JjSZKiKxDZ2NDu5f6XJIYJWmhthY?=
 =?us-ascii?Q?n6pus/EHypMDFeevzaqLPDyN7SjdQFafQNWdRAsD7TRk3KOZXm9ZwCG7bQwJ?=
 =?us-ascii?Q?UTycHgP36r+esg8FeeXqSLqJXojsT6A4mCySGzvn6/sgeNaEnFWrdxnBAfcK?=
 =?us-ascii?Q?mEQhbm9BUAMw5q4qLiFq2FtAdWhFPrbTQMvpPkFdbZK9panOIIbATlPbRc7g?=
 =?us-ascii?Q?HiAjg+8sIpMvCRB0SLB5SARKKN4tZL6Gfr7LIwh9px7uOs/V8UvYTqPZAqgh?=
 =?us-ascii?Q?SsYw1P75pOq9L97wEyei7WAxOuZkvz53g65Dt03yT7S7zoHtCAqhRg9Ee+aw?=
 =?us-ascii?Q?AcPD4e0l4dsye9al2JK7lPt5vsLSQaokz3Jb5uoyXIcqfQw3StJMz4XtsFYK?=
 =?us-ascii?Q?+Iq+ORrRrxTkUYO5AHOjWmditx52QmgKA4DhYQyIHFEbxkNTKXMDq6YyBZH4?=
 =?us-ascii?Q?FGLQlb04OfxxxkMrqYoccbhGV5iYfqwXZNqWjPek5xTrejnVSAD4oLScQxjX?=
 =?us-ascii?Q?KwbcmbXbzDzXKV5ENeCV3FrYzdUpPCklrQ+7H6wAlZ7fxIxlJAgMCFbcdETn?=
 =?us-ascii?Q?KaetYQ3L27muyzgfXysr26uv30/L4y1e77Dk762UoJ8omAXm5hSeQbEn7kId?=
 =?us-ascii?Q?zpPzoynOM9WrkbSyxasw2q5GEiz8VgCt+C2DAv3ixXDnid5VLKFiRDUggHgI?=
 =?us-ascii?Q?p9GDYwn85ssnFvzXJPoHfwCO9vWQRVsMoLTxdyI6BU6HV4R/S1bZoR6hgrkI?=
 =?us-ascii?Q?6Ma8xaj7ey/97nnR8+VMKwPCe+dE+mNQDCN52JLbDk4O5AoXce2GPJeeBBPV?=
 =?us-ascii?Q?StzmyTnMk/kRhHFK0lbcHAJw77YggDqIHIm4Us3cX2V7ZllCwyD0Q+zlkpe6?=
 =?us-ascii?Q?zA/vMETEgSERXlGeV6f+M1cDdDv4/SnhYVvZkXXLqHwG1wnzHLVIUbiZqLtA?=
 =?us-ascii?Q?vOrDiMDYtxQiYspqZWnx8CBBUH1Q93IwZWYSWJVvoyjvDGBe7uT5V8Cj8rsK?=
 =?us-ascii?Q?YKAtuSM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ApWoySKn4tg/UTQb4x6XS55Kk74WLve+ZF2iLUxLTPntlOSPcu12xWBJpQtW?=
 =?us-ascii?Q?486x8JITBu5vCrBhApsR++RsB+pMvs3Gm7onLbYMrdJNKpi9uUI4hCPd7a4x?=
 =?us-ascii?Q?GqwcZ+DMmi73MOI65wOEqMyGjNIAAAQZYb7Id5MI45bAD9RCLj6bEQrdha8D?=
 =?us-ascii?Q?4ufN4eFdDzr3/sh8AbA70mwrORUgc5J5vpsVyQr66f/pbrBjjlPQkzatJ5S5?=
 =?us-ascii?Q?HQ/8Qyav56Kfgp7XGuQrBiYPbnrTz3L+PdhM6ufjUaeYamUjs9sxtwvBlKQl?=
 =?us-ascii?Q?WxA9G8RDeFphes3f3fgYnqft/QhgEzsJI8tOT1iZ2M2JHeh/RJZh5zSu8Wm+?=
 =?us-ascii?Q?c94kI7+gGRNoeXPzcEwh9zNzMgss/Jc+vsQA07NBFYYL6CX+Cl/8f4xccMkO?=
 =?us-ascii?Q?KWD959n7M38VBrtXsHCx3ZYV9Ll+3lN7/OzCkc6p2NV5uHiN7FU80JAeMqwB?=
 =?us-ascii?Q?BGoFJCePTcH6W/gioXFfAhfikiQS3GikLBl8pxiNTZxXnBto6PNNfN6zU+a4?=
 =?us-ascii?Q?7goRYIBJWcxZ2LwpZ7jvFuD50SK9D0tWqRYgtZ5Z4wt3yRa2hQrg1inAWPSL?=
 =?us-ascii?Q?3mejiNEIKzDSKseDUtPDyceh7Ai6lvBkjylU1olx3PK92kjQBdEqLVsEgaF+?=
 =?us-ascii?Q?aKRQsCXCXBvtb8CHc0Z4AzeOl1O0Fbcs5EGaeQbfuskOKDrmpGa0tJZTD43s?=
 =?us-ascii?Q?KHPgPPnVPnSmPA9V/MRzEuGGwyqLp/73wYfUJAW1jOEzVc9XcbmQuk77DPT9?=
 =?us-ascii?Q?SkL+AJpJN643n2PDmf2N09UGHHSIIrvp7yHpOPKZsFVJu7g01KXspPwM7ZDO?=
 =?us-ascii?Q?qiOan9t5562ExOn88eWyxo+IGRrcMDig2Bhu8scQuMBPjOH50RLNk0K2qFCX?=
 =?us-ascii?Q?5qT3Nct0IR0mn++mf9jU4ah06sPw2HO8IjG5do9oP0Th3ueUbgrfJa/K6YwZ?=
 =?us-ascii?Q?Wj8ib8NR/fVFyv0DTg4yTrck7wNWHcl8etMSuWX/XuYFHnPkdsgfKhv12whq?=
 =?us-ascii?Q?6JSvOfWshJp+6ok4Gur96EtK3zJmKlp8PUrlJy1ehTUaJmuI2GptFrN2i22e?=
 =?us-ascii?Q?4KT7eGNxBHOoE2YLiaeOJKrA7aPC6OO+TGFGg2ihhx231O0t4OTNiTgsGYuR?=
 =?us-ascii?Q?qLq0F1ZSTvRKxuPhNMKUVZmz19qxNdOgQ+y7f6JLlbFibjDytydTqG5spbOW?=
 =?us-ascii?Q?JZL/Au1BfDdQ7b1PpxFjUIQRHJMJuGVGbi85TfhTo5K5g6ptN6Vf2CybS1uD?=
 =?us-ascii?Q?qMs0VlOzsOcRYA8HbRTnBjpOouquR3WOwezw9BBe0ysywssI4LWbupagSFEl?=
 =?us-ascii?Q?RCRCCqpaXac+MeirKQHyezT/p1xzKvxzYnHDNNtF8OW4dVmrDqS6AfhgbEPT?=
 =?us-ascii?Q?Ev/SJm797brrVu5UYu6Z3gnjYnVeEr7k8S4GaRXWpq2Xl5BZpDr/N/h0Yfis?=
 =?us-ascii?Q?ufNRPbZJwj7miGPzxhNQ46nmPwAUyErUEJFb9Qh/mcaYoHESkWPxx1jbW3Nz?=
 =?us-ascii?Q?uYzU6iD9SBS58dN+sCDkrB7MwKRE5gLuT3KzaSSDtHyhVTBvg33RXlsPMj4i?=
 =?us-ascii?Q?nOmTemcVHFfMOheaF2c=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3f7651-515b-4654-af36-08dcb94a2d6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2024 14:39:02.2297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwULFDuENMeNiNXXcX9c4y2YuTqfFxQDeZPEhuF2kK/Ayvc7L39OtuIjrX8eYDx6NMBhjRHDjVsZB1P86N5FYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7515

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
Change from v1 to v2:
- add default 0
---
 .../bindings/input/touchscreen/ad7879.txt     |  71 ---------
 .../input/touchscreen/adi,ad7879.yaml         | 150 ++++++++++++++++++
 2 files changed, 150 insertions(+), 71 deletions(-)
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
index 0000000000000..caa5fa3cc3f1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7879.yaml
@@ -0,0 +1,150 @@
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
+    default: 0
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
+    default: 0
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
+    default: 0
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
+    default: 0
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
+    default: 0
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


