Return-Path: <linux-input+bounces-5589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA895380E
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 18:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D833C1F252E4
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 16:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DE41B4C23;
	Thu, 15 Aug 2024 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e7EwOXol"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013069.outbound.protection.outlook.com [52.101.67.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06701B14E9;
	Thu, 15 Aug 2024 16:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723738474; cv=fail; b=VE5lVQDdIplUOwMTghBJQATlPSAArtiV0oCTkhjFhIclW8kQ4aeBpampKCmH1d79OkaATDgTs6U8yuRojuLHPM+ZdGWIVamMVNJE221v2Fo4nVn8vlJvlwpr+yn/SQBe2YYLKMPkN7r7Xj3uCKRCeHKepjbqtXcGV8SOui9mq2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723738474; c=relaxed/simple;
	bh=rLcuRVgP6KVe0A4F0dSwlfY/ZNSYE8+wjefLa9nvDqg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IVAJRYq8VgFIBcBW0oZb4i4maeMpjK5tPHYNafeHKvg3MtYlPSKzs3bv4G9AMRtjU2XvuIEk0UAaZEJRdxqyR9Nzjf4nN2FO26NJSMd+3LQ8bBp3Oqr2rcgTx6nV8HDKvQLXzHsDa6uuxR5d7IeGHK3peYThaY74GiDKgZyjI+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e7EwOXol; arc=fail smtp.client-ip=52.101.67.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZT104OAGcBKJTIrN2i7/GEh91s4pI3blkszJ728SdSG5yzlbRk2EWhN4Rkfy7xFZZpw3haSyuGDjKRF/yBYii6qxUKWMZXWgdTRgMIn3U/IfgFgPvWPsR642ZYAGq4T2J9ofw74MVlR32bW5/BgNPjsW/3S4MB514Wk5iEYBrqDOElwc4YzQX6vaJJImO+vCvijip8LitAJ+j/cQZ0Kac1Tav0iXpd2WvejLn1YzPSVLEV9saCstVLlu5poedXhmXzZhqkDdkG8nNC0P0At3cH+RkEuRBRnCkWxnWD2yeU+WzYbrTQQXQZ57xhCDs8VSZ9SCJ3E46vO8CFp8MuK+3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYkEvtccROt7ZSJbNtbLZ+ae6v9admwbp/XsSF6Wt2A=;
 b=hVB0Mz0R83gWbXvabblcs4HFfswzLTl5gLOSUTKety4uBolgdwEJdvvzi/FLxalK1Y88p5FrH0FsDGZosjbvgbKPUPt8m+sZW2BLaHWRkdHmgSd3gRt9Ezu/g0ju7piVjpjNWHGBHtTaqdCCV0cUZEizsn9reO07dVi8wlVSsey3bZH544A/IDBbfws7kn483Xlee1aYw/NIPeBhNY5/QMkxFsU/QZdKw6zMn85ihAQwXOOOr3twzPIMtXLCF3X3kVCrv+RrdpwTP+CrQEPEMrXEsOZ2yuQBndSG8FlZoPmZbYTRoQSrFJS0a/oLKkVNxexG+OY05wltzcRwg1ZIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYkEvtccROt7ZSJbNtbLZ+ae6v9admwbp/XsSF6Wt2A=;
 b=e7EwOXolzzjY1umOCcP12rDpeEbhImCUPcWWdnxDQkWHJt0DmXmrn7pjx6y3eK+ItHWg8Oy1CR0vTk/VkLYB7TRLHL7iJqly4Dws2ueY+ajVZM2Hw5aZ9JlYU+twVmviiJ6tvVDk+OiL600dIgCbG2tA+urORIW3tQYQEmZESs4X9gPZW17d6ZN627KbK5FIP3CGXHKFhJraNsOSjrzACGxQ5IJBA9N6IqGG+Grq087srQWHtDSYBy8s1UIMIZ5Km6GnsqZEQ1POMTVLfIMRRszhykAlheeSPZloPK5mS8pr4IH5YC29Ia95h1i6bPQIidLvfSvAA42cNac3NsOOVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9661.eurprd04.prod.outlook.com (2603:10a6:102:273::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 16:14:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 16:14:27 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Thu, 15 Aug 2024 12:14:07 -0400
Message-Id: <20240815161413.4182796-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0134.namprd11.prod.outlook.com
 (2603:10b6:806:131::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9661:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7ad142-c2b0-4bb8-d623-08dcbd455622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O3fsuyeIpPktIu/OUbDPgEgQSRPP8sEMvQKV6VTmsbH8cMzwtdT+EwOpAdkP?=
 =?us-ascii?Q?qdDp5y9xeRfg9jp1a+p+rRJYqHF67R4pU+y0+PbssCcayRdpN/u4cg20eMdu?=
 =?us-ascii?Q?INoURqke6xPHj5VbDMBvwOZDaeI727tl6QCB3cNMHXWRoDe5kjTvUFAcLfYO?=
 =?us-ascii?Q?G78n7DdJLgeOfAhfs9zYcN9icCRViS51v5F4vOcZkxDr24LXdRmt/I0A0qst?=
 =?us-ascii?Q?CvYlb5aHc9lwPAt7A75L80X/v7ciu+sG94JPioUgSjcSq3Kfh7W3wXFjnv9V?=
 =?us-ascii?Q?3cM3w0KUE/R25QRExQnJjJ4yuDGiuOOVUwhrUzvi0ppgD0RH2CAaw8LiFsq5?=
 =?us-ascii?Q?/Y4mCdmTt/4fjqDZZbOlDjy3zXmpd9i4Y9hRZAsU59q/8bS6UyMFBI5XZwAI?=
 =?us-ascii?Q?jQafgPOQKtR62q59pKrqQsVeqqFZRnzBd4xR6C8hfOrwthC8DcFPqtaQKiWs?=
 =?us-ascii?Q?DFK2cFaviz43aHPPJeFCMM3BObwyZjjCfa0+iHDuP1nYBWb/WBDhsNwAHE6U?=
 =?us-ascii?Q?W4ORkiZ2+EurtD0m8KZXAPTAs1UB8vJPvt/rgKmYAhmGP+qIx+O3y/mjSmu8?=
 =?us-ascii?Q?DQKDJRtKAmRCrqc1wBw+MTGyz3B74MX3SvbaIBqyUXo4GeV7OA6L+4DGx/qs?=
 =?us-ascii?Q?+Zn/2LDkbhOEOYCXKPE8Pm9A9YJtJFiCTkOYUbfRYromLWjyhwfDLTBWvACl?=
 =?us-ascii?Q?tpVHQG1/xCjfDxI3PWH9+EYAaqYucnxMO8m0yPjtZyQu8n+nvc92IRFwQCZ2?=
 =?us-ascii?Q?P5HFm12FugBGkds5/SJhAGZRVROlk7hsptmmP7Km97tbiEmFJlhjOMipKylQ?=
 =?us-ascii?Q?QmfMcc0xF8/VX6D+RXxNiqrhwuwaRAO7W3dRRGsyYQUZcTnoNJ/Ta+FOQDU0?=
 =?us-ascii?Q?doON6MrGFCiRjPWcIuNH2sZFZv8Bf1Z1o5+joS5kKHNYkzjx6bbAlHLtDC06?=
 =?us-ascii?Q?hm685IJqCUzgwT2UwBTf6vzhGF/sLovtjn4cRaV3CUMjP3EAfAoG8hNoU1Bj?=
 =?us-ascii?Q?2ENnvL2tiljWnltqJGRTm30NpO36AuXkpWvmLtEuuHJzoziQZ+nSRm7EoY/I?=
 =?us-ascii?Q?vAw469Gd7Sys0r2fzDjqKgq5XOSKi9fypOLxWeYVfDnnfEfWvhvE73YDGlmx?=
 =?us-ascii?Q?Ccr4P4LO2ppRUHdbJVbNtHdym82AcZFSkXiutkUBPFBRHiJWHc+jLaC0lkMO?=
 =?us-ascii?Q?PScfM65xigX6n/GzumE8nAdTVznyeEEb+uM+zcVDId8zWAivfBJeFk539j1m?=
 =?us-ascii?Q?sxBYmDcbVdH7IbkrSAnpHt5HAiUCHpV2QOzaX3QS8RJaOmqlH4k7p3hV22+w?=
 =?us-ascii?Q?UEVgcx/PLHizukPsuYT2nZmEPrJRDP5xgTMZyZcBb+g23eKK6DMHMQHC04ET?=
 =?us-ascii?Q?Xg/zlyY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3JW6/BkC/+DJ9/KpF7J6rdtKCG0ICCtVso4Mo3BWeFQtNhxXsAul9BY7i0XR?=
 =?us-ascii?Q?kMSvG3PDry/bURtkWPcYrw0ka/Tw8fdPgxpRkZXBeMRoVzOHrjWAB++Z88A3?=
 =?us-ascii?Q?PHVIyq1JsZSU5zybEFoYeojEQZZNd/C1z8sAFvwE3FUpGnIElkadGGQ5lRfs?=
 =?us-ascii?Q?000wFlfPwztSQ863zW1Zyd1eE36m5et/KQLBVD8pyrbNGcRoKl+wLZobQp9K?=
 =?us-ascii?Q?0FrUA0zdtndbMDvYW0soeqPVCj16iSBgApsG+1Li530B3PF3Qnb1VuQHp+jr?=
 =?us-ascii?Q?NAgXAv6rqFt2UXsCJppBwSYIlpPycYnS4wy3LTyjsC+tdM6qcc8c9aeCCZgZ?=
 =?us-ascii?Q?vOxRZNk4Wf90tzoamy3LzddDuDxINtQ9HOJZJMfk2kpWOXcx7dxNWICOSDgL?=
 =?us-ascii?Q?2jN+PpZ746uyl5imV021h3n8sO9FKJox+3zCu/8OM9X2AnpkSCqphLsUrYwM?=
 =?us-ascii?Q?B3CPn2svyMg9mtFqIEdhwdrWwNQQ0WCB8BR3tmfPn+xD6COjRK0diVShvd9B?=
 =?us-ascii?Q?fsJ8Gt1yCD7tMIfqWC8lCbVNcEEyxN3pULRMka/saUuosHEwJh6tIifKlklM?=
 =?us-ascii?Q?zQ41VbSXdEgaJOfV+7tQIpKcMtNrrPmmg77tpG3EeE0Lu0p3sHCQN4mF1JHY?=
 =?us-ascii?Q?lB82INaftkGOybJL00ahD1PvXwaofrU7tDkxHxDp5JlgT2vEDV38FajtAJ/a?=
 =?us-ascii?Q?B5l+Q/jyhiPBMOt+GTSDyjl/IB+ctoNu/TUo/JTF5kdGVdHVSPipJUieg8ez?=
 =?us-ascii?Q?eEo0C2NzOgLQLwSTfh/qorri1AX6VHagYXmuu893vfy3oaryIeY3qDEuxMzD?=
 =?us-ascii?Q?xgwIy8FLeZDyxdxLvUrtcLyIl42tx1yHvoyz/KG42Z7U851Nm6tj9xLjmmid?=
 =?us-ascii?Q?+T8Y242yLhByQ8nXdezv0UQ7OBkkzI2+RtM9RyjlzI4J/vHkuSkl0UzmQpBA?=
 =?us-ascii?Q?7+yBCc56LaeFY69S5wQpD6Z6vhV5aBICzXElEWsNuhq7osw7PHSEWIc3sCS/?=
 =?us-ascii?Q?c7Srvd/h+QlrSI49PX9KQIeomrGzO1ZHW/dyMXnBCptuipsLYmHh6Zc+wbiT?=
 =?us-ascii?Q?nsMWmwhmGLoN8joP2LW3CDaJOCvL2uqDpBBkYBX9VPkuEIRHcO4tkI36JgCD?=
 =?us-ascii?Q?btDHK5WGt4fkJcoWo1OztfU9kn56MkO2jLVqDIQDQc7NdCYwr7MIaTJdc3et?=
 =?us-ascii?Q?htY5XrNnb5OO2Mj+pt9bUUuRthTm1mYxpXRHgi74exSHsjVwMVsEqDW7EZTY?=
 =?us-ascii?Q?rj6KLmiaq3VjHBQyRY3MDmvxbP2zF1d9izFubyyAcQnnPSl0tomNUl9U7Kjz?=
 =?us-ascii?Q?25mBQSU7jX+99Lao6o5hJdHWVHMKLVrMZLGSmF9+CcX+VGLeo1G1pZhKtNcL?=
 =?us-ascii?Q?F+Lmc++jbQco6khlOSvs61xYaSgF4j8j4SyzB2rpoOJBJrDzCCQNMvh20tCZ?=
 =?us-ascii?Q?kwVfZegjkaSGOaYEHSdw8YukeiVoMxkHDlQlFWlY1ntbjDBAC49N+A0Xesjs?=
 =?us-ascii?Q?eHXe3kkiTFCdMvAs5m/zMea+ExeqFL29sbuzic2uhrjqw+QvKY5JjFvYJtcs?=
 =?us-ascii?Q?gE3nj1ZgQIW9whm764WfpgIsczQFbbY9ZJYh03UJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7ad142-c2b0-4bb8-d623-08dcbd455622
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 16:14:27.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjfUeUNTjKZDAtFYTXn5eXnSrXoRyd7By4SDOz4FXKti0TdjPQYm+HpgpmejGdIC6xH18Hfpj/VWzcUQDEoerw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9661

Convert binding doc ads7846.txt to yaml format.
Additional change:
- add ref to touchscreen.yaml and spi-peripheral-props.yaml.
- use common node name touchscreen.
- sort ti properties alphabetically.
- sort common properties alphabetically.
- sort compatible string alphabetically.
- remove vcc-supply from required list.

Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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
 .../bindings/input/touchscreen/ads7846.txt    | 107 ------------
 .../input/touchscreen/ti,ads7843.yaml         | 165 ++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |   2 +-
 3 files changed, 166 insertions(+), 108 deletions(-)
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
index 0000000000000..dac2087b99118
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
@@ -0,0 +1,165 @@
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
+    description: Max number of additional readings per sample (u16).
+
+  ti,debounce-rep:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Additional consecutive good readings required after the first two (u16).
+
+  ti,debounce-tol:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Tolerance used for filtering (u16).
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
+    description: Platform specific debounce time for the pendown-gpio (u32).
+
+  ti,penirq-recheck-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      If set to non-zero, after samples are taken this delay is applied and
+      penirq is rechecked, to help avoid false events.  This value is
+      affected by the material used to build the touch layer (u16).
+
+  ti,pressure-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum reported pressure value (u16).
+
+  ti,pressure-min:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum reported pressure value (threshold) - u16.
+
+  ti,settle-delay-usec:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      Settling time of the analog signals; a function of Vcc and the
+      capacitance on the X/Y drivers.  If set to non-zero, two samples are
+      taken with settle_delay us apart, and the second one is used. ~150
+      uSec with 0.01uF caps (u16).
+
+  ti,swap-xy:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: swap x and y axis
+
+  ti,vref-delay-usecs:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Vref supply delay in usecs, 0 for external Vref (u16).
+
+  ti,vref-mv:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description:
+      The VREF voltage, in millivolts (u16).
+      Set to 0 to use internal references (ADS7846).
+
+  ti,x-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the X-plate, in Ohms (u16).
+
+  ti,x-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the X axis (u16).
+
+  ti,x-min:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the X axis (u16).
+
+  ti,y-plate-ohms:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Resistance of the Y-plate, in Ohms (u16).
+
+  ti,y-max:
+    deprecated: true
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Maximum value on the Y axis (u16).
+
+  ti,y-min:
+    $ref: /schemas/types.yaml#/definitions/uint16
+    description: Minimum value on the Y axis (u16).
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


