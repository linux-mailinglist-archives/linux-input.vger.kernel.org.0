Return-Path: <linux-input+bounces-5605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52C954E89
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 18:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28F3E1F214D3
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 16:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7221BE235;
	Fri, 16 Aug 2024 16:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S+p16les"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2043.outbound.protection.outlook.com [40.107.20.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412F2BB0D;
	Fri, 16 Aug 2024 16:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723824803; cv=fail; b=Ph60UAUVJC5WzwvpwELBRcDlji7VYGaTgNrqTswif5c20ju27pdSW4vJlu0nmugE8neJUXG5CrspZpHTI8aRcXH4p3yUpqMdN/Qpv3P8yKLCvMBOqE9E8NZCDyBh9xZaY+UqrfncK/y6kwcDu/379rZPMX6lhN0tAEbsQRImToY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723824803; c=relaxed/simple;
	bh=dbEN24bSTatQy1P1zSneRi2IqWQhUZ4X4/budP1nPiA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=uQklWYgyws4EntIUJXB5tJLFs76qa5DnUY2DMU10FqHNgQC0I08TMkhCJmDvrZm+qUX/jguTleZbQwjbKmL/eUfyeODAyNe1eJaSJs1jTS2RD57sIG4jBE6PSsqXQBCibYDz+QP1jjhlPnGC6r1D8stcghzEvCAybFaLp+xphnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S+p16les; arc=fail smtp.client-ip=40.107.20.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeqfEyITpdVsEHrc4tmFRM4zhyxF8NLmtm8+PPlWzBm1L22GoqFvdjTgszvnspVr6Em1YiOINfhlvyEQvMi6TbsIGk73qUSZluu9n8PkqyYc3XGo6GfFK2TRW1Dn5b+Hudb7mWTC+7TsNyz6/FFRgvf7Y7VU8JLZ3z9j6AOsjJBeYXE1AbRolak1F2FSP5GmfVL+8PgIcWu8g0LOrHPdePfi9WsHrQGQtArSZrTmy69YGhwDxD5hSKPQUUnzPHKgZP1Yo0OSqO/wc3xILiVCsps4V5ZSvgNnpw5+mVfiahdBURLJD2s762ziVf3U2JP6YU0A0C0u8Pund5GS04tmtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBONen/NQ0MYu/dgYB8Dgaouqy5RoO2416KvJu3/6xA=;
 b=mFjzNDJILsnMun0wcUDpFXlyYI7e1Xt4COAX7oz7UW6VHWfx2eGjzfgUnOWM3OqszvPFBISTsTaWtWhPL3v4npFuilmdvf9IyMLHCaodUPwuF2rTE4teQF9XNhcVJc4LGQxuUaKVWqSWS1tCsLdZNOYyKASQSBdN51XNI9OSrLQ3addLBtuAYckP6fh1fOHqcyZLsfu3DXb4t/3Av14+xWVW4Q1/PbyXbyO6mzTaCf+acZEbvBLvJjlICkr5+/0KSih2lj8idrpLcGaOXszl+GQ9z17xKxgvQuFsxWWnlF22UuqMO1afFiNAwZYeXmtVqJ5ub3qVeYgR8JxAPpOOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBONen/NQ0MYu/dgYB8Dgaouqy5RoO2416KvJu3/6xA=;
 b=S+p16les4mT8NSKxdBIDM5dzTgz2d1WZVbkF2JAktwtIMG9rFL31LTq+/YMv1j2jFlooMpb/5MgXpWRKBQDF3F/tz1jANhXD0NqDb9lqhsKMSZluU+hp0inscoSznqIPxNNXl5DbdLp1Ti8Uo0/cN0y3Few/oYd0N0ibkw2RckzD/uEFWuTdtRYSzuOazViZF3Veehz9ia65eWCN1NNEKdy8DWDD4YCElMJ7jiQjceR+4v8mO4mzqOHvplqU9T2Fng7iA8tSGQXOg/zhiJWaQH+7dKqYnxDpTJg/PpcDMoBn386O/3XFjA1wxMlLWC4P+vbAFnYxABpo+ccvspp74Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10563.eurprd04.prod.outlook.com (2603:10a6:150:221::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 16:13:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 16:13:17 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Marek Vasut <marex@denx.de>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Fri, 16 Aug 2024 12:12:54 -0400
Message-Id: <20240816161300.128269-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0115.namprd05.prod.outlook.com
 (2603:10b6:a03:334::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10563:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b7b9012-faf5-4053-1b0e-08dcbe0e56cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YITfjWziixAhDcXvYpWQxI/rNIKe7mkOkD9eHLf/SRDTokHq+xwrRCQ8BbWA?=
 =?us-ascii?Q?LiRBhgh4QXyNuWOJM0TySVf34pvisajyNLTJyvWrg+/wzo2N/eGFPVtn2sgu?=
 =?us-ascii?Q?Cw8INqPG3RALzj5MXfnphRQjUGoDyALrfjpNzb3juHZ2mWlrqfDLBsMWdj82?=
 =?us-ascii?Q?v9R4Rj0YG7eNmvaGPbyB5RPwVQQ+rXwSqQyxBTOcVqkUThA/qrsjsOt+YSHv?=
 =?us-ascii?Q?UnRcCIW0PODmrixZLC8+qecG1TAWlPAUZ0Y3ZnwNZxFvbTkEeXN3ZPf86Jzx?=
 =?us-ascii?Q?tentOLvY0TT6DVVKhtOdZwWh9jfgOC7jGFYO4KRlSh4m7nICOYgEz6aEkqmb?=
 =?us-ascii?Q?xV9S1f4KM+9/eg4kLk4ffmUd7yKPxX+BZoMg71C6JcjpE2v7kFppWcs2ah7C?=
 =?us-ascii?Q?EN+IkxdqgU1C7wj9QDRbcQOT9MVhGhNlaX0PIDbbH8wlRJo7EgA7TINqqUVR?=
 =?us-ascii?Q?h6ua++r+MKjpJx32XKU+cz6t1UYqwAvsKMAwHcYLIdx3WZavPtEbEAyN++SA?=
 =?us-ascii?Q?douP0/R3cw8pQI5tYyKoVt+d9j9160WIG9OyrezQ5ekNYED1KSqIZfXE1RwH?=
 =?us-ascii?Q?H1qsQEwRlDy9FG/7X7rWDRPLSS4fkoxSfwzNt0uvZRQZVYYYv5QbzKi0TCJq?=
 =?us-ascii?Q?yzNqNVzN8mwss9tFY6OEcqk3rDqKdv7O4W1pAaU0T9t0zEe1zwvfIkEEwO9v?=
 =?us-ascii?Q?KPa8SWIVgql0WoCW/RcTsZ9FAPigUMgD57sMQBTtvsTrzNS0elCALLc+CUQe?=
 =?us-ascii?Q?Y0CRcixmpHYRGMeusyV2ekSBzUpSULaFtyyXbu2u40fs/5HurSJR2XZdzqHt?=
 =?us-ascii?Q?lzabufnzaFIw9IfEBFRKNilfFDAh+9HC/1mMgoHOHPSGKeHIJ3cFflYtMBeZ?=
 =?us-ascii?Q?kT8HzbEQ5EkOtpS/6L/SpicJo1ukoszCuDuIjNx6b0nKoep7cwT7D6yfDwDh?=
 =?us-ascii?Q?R+24nsikR2X/Q00eni8JSkcLGLbvlCcnlBD4EZMSiFiSpuKwmk4W6/Z3rZl/?=
 =?us-ascii?Q?MDto56bEVKHOJZRO5UBLUDsfj4vu8m+KmHxEib3iFABx+mGKcf5vdc4MELbs?=
 =?us-ascii?Q?bAvVacKbMBYIo60JGQ81x5KzY4bHEekOJHH2DYWVi7HO2BFtnVU/yImc2PCV?=
 =?us-ascii?Q?26zm9mlJ1Z5bC4U10m0BdVwTxdIKreQxcn294+Ol3ubiSB6gO1js0R6Ygm7w?=
 =?us-ascii?Q?qEokdiTHeRWZ6TmIPejO8WGudPmfItFCCNqLEK1Jy6eiv0791aettwZnptNY?=
 =?us-ascii?Q?5coagcwH/vUve3Xoef0+gagiavQaEDrHppUCuNtGPvtnq2LxFzUUxI82hyGS?=
 =?us-ascii?Q?eXTAqRhROOpqY6qrqZiuNWwwf7zt8NGSt1e5onFN7Foad/V2YVpTVSFGFJiW?=
 =?us-ascii?Q?EvWRDdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VQBd5CqND3jZTysoTnYyZ4zhDxaOUgc3fwalUHMAtoeGrCdE+/8IJaE499W9?=
 =?us-ascii?Q?SHTFsa1rptcF5SefBvpouKXxBkQomUxAVjFm0guEV3kyo7Nf9jKe86Si4sb6?=
 =?us-ascii?Q?AUjd64MfyeaBXDH4E39eXgZ7pUvmR2UP44o6hB1VZfAvo9NWlppdfcMlR2na?=
 =?us-ascii?Q?pxXdGMwqDCzqwTQNzyMWSpJwqh/Qwt6YejhoeV/v4sl/TidrJhtpdLbawddq?=
 =?us-ascii?Q?7W2faeVxC85LteYVZDKc4GphlxnNxr96nf10FMSPbv3/8aTJlZ+2rJ2zD7YP?=
 =?us-ascii?Q?Ps4aNmNlB7UuG2wyLX4EnTHoMGKSradCKhRtJEM9j7A1GivbrJ6sASUgFNhg?=
 =?us-ascii?Q?P6/iTp0O11DPl2WFjZMitiiP0fzCXQ90w3Qq63rvh92AdTe3GkuVDMBtR7wO?=
 =?us-ascii?Q?acOZ6Oq6qgiMQHQGaFhBjPMmzCLY3xWX0lmzoHrPgfjB5FjmRak5XbQAv0VS?=
 =?us-ascii?Q?Mkju3NAJH9/HmWzVI8fqoTkz+UWFNjFPO2M0Gl3LW7izdVOVWe3e4YujurTb?=
 =?us-ascii?Q?pa5It+6vJZh6mdanC60t4Jq94/YVmocx9uwGYYpSI6s15RIiYyt8OyKxtsqZ?=
 =?us-ascii?Q?0BMWJpZq1JDXDb+RWeEQzdyDUvLG2mptdbPVyMRBObPnY0ZmVe0R+Y+4BwmK?=
 =?us-ascii?Q?TxelkdzX0SBiXZy0PcO2yqPVg7BTtUmoApYdz0H+IyCPMMFYPgpeyPNYYlk/?=
 =?us-ascii?Q?p6XC9eNFwP0X/tOxAjGC3epu9BO8UFHb5WROMhgRouZDG6omlcVgr12ENmYH?=
 =?us-ascii?Q?OxLaeRQPexWA32kcIo0H3IJF+Jrr0IXFyF7udmnN5e+MB6OtgJz9teYkXCGB?=
 =?us-ascii?Q?qlqEGrPSF+AST5PP+o6bgIWFrSsP5xx2XNkntoPfUkrNF3cbVcKQpQgz7IQF?=
 =?us-ascii?Q?6m98gOkq1ZqsGLTra/vEPnxlSxy6qGZjVDqk97ePanS3/BwSNhNU4IR+C64J?=
 =?us-ascii?Q?3caFvcFy176ckof6Bg9R263KRPtNUYWDyIsEJzZiF6Pah1mWJaofTsdJDHQ7?=
 =?us-ascii?Q?mZCV9nU3r7fB1ZJ0b2qcjNJhgsaT/APau5SebwCzItp6d0X8jRfAMV9TSlic?=
 =?us-ascii?Q?kEMNObh6UP873zZYgUSqPDVIJbaiNMsIXrMPuWitbdvWOKCGN+8zS4f79A4m?=
 =?us-ascii?Q?8tSYkVmOHIGpuuqXgRjgvt/qIEOCz6mepOl3CvBwh2QDnp1k6n6Vl0eZF7JJ?=
 =?us-ascii?Q?8RkLVWsERH6BhnPvpyGyFOv2JgGxTdw1mmRhcFfDiyXmQ2MEy3PkhKXsgbSf?=
 =?us-ascii?Q?koYVtfNp20XMdaOeANNybjsa8bXHSnBGiF3l8UXL0QHWAdPcjCUtlLFdkoTZ?=
 =?us-ascii?Q?WT3eHK8WsSc/AOXqyf/KOIxLfet2Tr02Q2Q/YGsHVc3QVk5xNgR6w9UM/i7j?=
 =?us-ascii?Q?Tf6w0zbfD+ivGtkXl+JXEYa1IFfqPoG6RVqpugAA+g4OqAznlrnXKWigz4sV?=
 =?us-ascii?Q?epcg6QB2jeXjMCTKO99+2eqJoiPljrZ/tRBL1PfTPsqLwFC3phF9ehKPxRg2?=
 =?us-ascii?Q?mB3mvwteV4BMFTkBgXQLAAO81LvdRtfh3o3MK4IOrOZGtwdbRm7HbI42OtV8?=
 =?us-ascii?Q?c815lPAbWQnW/t9bYxc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7b9012-faf5-4053-1b0e-08dcbe0e56cb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 16:13:17.7611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r40I0NXXFu+hnqXtT4k+MYBiSf0x6Qvx7kaDGa9hrsbWYB9XbhkBI3Ah/fujozEqnFulRcnZPWWAyuuioDehVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10563

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

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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
 .../bindings/input/touchscreen/ads7846.txt    | 107 -----------
 .../input/touchscreen/ti,ads7843.yaml         | 167 ++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |   2 +-
 3 files changed, 168 insertions(+), 108 deletions(-)
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
index 0000000000000..6fcebdd1c4f8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -0,0 +1,167 @@
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
+    description: A regulator node for the supply voltage.
+
+  wakeup-source: true
+
+  ti,debounce-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Max number of additional readings per sample.
+
+  ti,debounce-rep:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Additional consecutive good readings required after the first two.
+
+  ti,debounce-tol:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Tolerance used for filtering.
+
+  ti,hsync-gpios:
+    description:
+      GPIO line to poll for hsync
+
+  ti,keep-vref-on:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: set to keep Vref on for differential measurements as well.
+
+  ti,pendown-gpio-debounce:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Platform specific debounce time for the pendown-gpio.
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
+    description: Maximum reported pressure value.
+
+  ti,pressure-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum reported pressure value (threshold).
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
+    description: swap x and y axis
+
+  ti,vref-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Vref supply delay in usecs, 0 for external Vref.
+
+  ti,vref-mv:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      The VREF voltage, in millivolts.
+      Set to 0 to use internal references (ADS7846).
+
+  ti,x-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the X-plate, in Ohms.
+
+  ti,x-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the X axis.
+
+  ti,x-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the X axis.
+
+  ti,y-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the Y-plate, in Ohms.
+
+  ti,y-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the Y axis.
+
+  ti,y-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the Y axis.
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


