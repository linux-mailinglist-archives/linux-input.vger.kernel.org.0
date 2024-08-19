Return-Path: <linux-input+bounces-5679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B61519572AD
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40A3B1F23FE7
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750C5189528;
	Mon, 19 Aug 2024 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YNY4+Y+U"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011015.outbound.protection.outlook.com [52.101.70.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14E6189517;
	Mon, 19 Aug 2024 18:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090757; cv=fail; b=T3C4ZycXEVXZP+UtCxlgfuZXMi2oqOKTo4pHl31kFwHq64iLo6tiTYSSiXPyJyljKTC+NwX9u4aHDlL1LPXHovX+fspYoE5UajFLLFJ3F4o6Fr4Vbmv7N8nQZXRRIOMbZZA5UAnl1BlmmtboiDw1ZHXhgqpmJIVlXPz+52EHnLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090757; c=relaxed/simple;
	bh=4FC0YVWp6/KvLcZ2kDQDDmpYoiYFXJm70PuuiG5JuFg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dhqr4Aro0r3rjyn95ycZ6JVpHNWSKJXkH4zwfGk619/9L81HhTMK+UWbUSWQe37y9Cb3VOMpx1pz2SKBaS9VJEJWFuhjVzgC0Jx/7FT7jyb3fI8F7/yWLDCD/2wLnMX5com8iVhhNRdye116segGwBdLie+zJ0OcD8jGe7kqphw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YNY4+Y+U; arc=fail smtp.client-ip=52.101.70.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaMU8wQkbqKodF9sPi6nLiJzEDBnwGeRi1pxLUoLDTSTJujiV+S8tzrMKbH2cVHBNq38V1YSCWD6A4Nln3syxc/crEwp2Q6q0KUnAi5TQLyHKZZUlcLZhj5GpRLAjQ/pFPta2ZwlZNnA5btdQLg+GJ7XsWFfscQSxS7k7siby6EMiFNaEYLrrrQkWQcDjQxh++jnKAKkjvsuoAbi8TKQv8buQnk28EC/exmATupUWBQapYm9G09/XJejvo5Wcxb3BqWflEE8i7V1Q9Fnw7iHakfrBGigEUp+j+s+fKGR/XLYQCfCb5TPQifV2U1aM/xSTeL1TcRDAkPSRfuBjHlr7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJLEPo3qwdfiPEm9unek9kdSEl87u2kT552cED0SK0I=;
 b=fqTTpA/ssCGoabI76k2f3GYWVynYKiXv+YqMFzUG2joL8sZUti+msaikp4mHYQ7fcKN8dZw3VTZQc5oqoWIDgSsnfbcdLVVpwAadNpPNjNjFZ0Y934PguZOPlZzEN5UVt8BNWeqg1TUO83yztmX+YO/2FXah5e51Q4/WqLrov4b3UqlAm1NbKEkvocL6AxHjZztZvfsTWbsT4X/TYAYAxoPp3MTZYUf1nvucbiy5g+UQ2bWM36/PQCHcYWURVhiY2bUInb4IOpVZ21CLWwkDuohGdV4S46Azcl1vklpn9nsgX30U6w1sPt0OBCQgefrMhQnwr1/Wo3Tv/xLdFHEzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJLEPo3qwdfiPEm9unek9kdSEl87u2kT552cED0SK0I=;
 b=YNY4+Y+U0wuO3mAa9mHTFCPCy/Fywd+rUz6z+JKdSaOuAYKxxVVZJKdE6zlWj8Jv6uN4jvsx/YwusNrHx8lwki2ZSobUYTpw0UL4tUmNBjFsGgWudaZoCLAjuFxg7XUKMnjeYq1ars/ih2YoKSrTIXiTPPRtdF13wqGoTGZYoqmiJXul/9jP12zgTO/guXI9xpTqY7N2VsoUqigKggj1NLKLcGVetU8BZsjC8eozvV1bSZnpbvGfppjy1+Gysa5FQk+VvEqSknAXihuuajTtSQvpEKhj92TufaU3I5CYRAKqLj602x/KIbT6H5BHHG2K+xL/YmEzQdN3URoiXdvCOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI0PR04MB10290.eurprd04.prod.outlook.com (2603:10a6:800:244::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 18:05:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 18:05:51 +0000
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
Subject: [PATCH v4 1/1] dt-bindings: input: touchscreen: convert ads7846.txt to yaml
Date: Mon, 19 Aug 2024 14:05:29 -0400
Message-Id: <20240819180535.368902-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:a03:338::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI0PR04MB10290:EE_
X-MS-Office365-Filtering-Correlation-Id: af784fb8-ad5a-4670-5724-08dcc0798fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o0ZRioIajN7hpTctJGD+j0njmaMtC/VRVCYFfkZPpiThn4I3iIfd9u9kF/Qh?=
 =?us-ascii?Q?GIbOI21vETOa9viBUwPCnHCKzfhf9YB819rm8OdJRsxFccn/moGzhCz2cArM?=
 =?us-ascii?Q?ds7gZ4uAdVdElhFtGonESM0euEfoSkd9PJke2hHb/3/0lNDFzetOzxqnxERM?=
 =?us-ascii?Q?VJZRThFwSRNYFsKIksjHPRynisVcTxYdCfRZlwXg+7o4sO926cFQwAb1qJZQ?=
 =?us-ascii?Q?bgRL9UKl1UpfCNu5Evi6YcH0i07k74+uQVh4R2tGPog886VYzEqiGL6TIYjG?=
 =?us-ascii?Q?MO4Jdq5fC5wohfVO9P2w/F2pSSAI2yNwkpz8ibWIfx0ADz3f92RMSPVEuKfK?=
 =?us-ascii?Q?h7dQqFCixeRGobk0vvfQABOM/BfXR1cEQ/cAUIyUhv+4BtzZAzJy1lT2bMkd?=
 =?us-ascii?Q?cNpXNZ5y1mUqA0EM//9BNZ2gaIvtPium2p+iv58QgN+IzweJQ8WI9QQcwnU7?=
 =?us-ascii?Q?z27rAg99vuPqCJlmWgFK1Kr4EWA+R/gBzelU2dal7OozP6grUOw8FVpPnFSs?=
 =?us-ascii?Q?SEUCBaFbLZqZpMEZXooz0fjL3CDyoTk7QDbGJ4cdf6VmHZ/TN4rD965vpsfw?=
 =?us-ascii?Q?vYkem4LzpLpJJ0KcKuvFb000hB3DCD1AHVEDkiteLjHkNIYuDJPhAMfgcAK+?=
 =?us-ascii?Q?dGTOAdCmDvFT/hGv5SpRIbbWw+NiEK6WmO2eHYtskbc7/HBb7h6GusCEG4Am?=
 =?us-ascii?Q?Jn3fjnz2FZszFccHknQuIyeVR38w+GVtOOdm9F5Tje5evO+dXj018l+tMm2C?=
 =?us-ascii?Q?kO40ZsyPgu3HXM7ajL3EDbt2CWTVaf2+49wq5Ar2kNXfQaxeygNMnSyz5+GY?=
 =?us-ascii?Q?RizSOYvGCHlpMPUV8Qavgv2jsUVG/i6JV9OtwnuOGMajKcOjOQUMO594Df8X?=
 =?us-ascii?Q?xb11um+QuxgQrgSfshXgiBIwoQGn/dKFTlmByhVABiq28JBnCi8karVf1mkD?=
 =?us-ascii?Q?BgqfQSQfcb5yfqwM1/kPLjgZlrNMjUSf1dJgmw2qPHvfc6H1vi2SiVuZ6/bu?=
 =?us-ascii?Q?hDrie7esbO1Wkn9ap0C4U6bpHauD1mF5OEcFt76MUC8jJlcW9VOB+IHVEizM?=
 =?us-ascii?Q?pidBoMkhboa5ni8fmtDPgriOR6eniNQSrDCNGbue0FaXHXhNSzAH+/CyNhQd?=
 =?us-ascii?Q?umQrqeC74y6sERWn6rNmMYtT2/gi/hh74Ms1MY+I/1IhAiQw//D1lU8Die+p?=
 =?us-ascii?Q?gepgPUAuKv3Be+aL2X+OPTmsWGrLVfSqXhAFtLPU2fyig+dSCfi70p1Z7LKe?=
 =?us-ascii?Q?o8Sk9q30HAj3lwRtskJOLGfsfkSEcme2lGkgy1cI49wixhs/77QCv85sUM+8?=
 =?us-ascii?Q?hajj3X2Kk+J5MK8glyKsF8WFl2lVzAWgqhvF9e0zFQ9Xc8iOhYCxVCCAIs7r?=
 =?us-ascii?Q?MD0/c8E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+O6eiMtP5pUoXykFd85X1gNaJBa7RdI78iLofn3jF21LMx5k59p17lioJri4?=
 =?us-ascii?Q?rkhlfmD6L5qGvIh8sF6dmFwHioBgb8qX88ZShvDr1jt8NvO82uMXMz0D0fun?=
 =?us-ascii?Q?uky/XUvlq1roaG8Y52g+db8byW+FXOcY9/PuHqCL57xhTzv2gSagb9Jp7fCm?=
 =?us-ascii?Q?/yMmAWY9U56XonKMlkWU8VdXtLnVF2clX+AiqaosUcA5TXAyFtFA3KFhECrd?=
 =?us-ascii?Q?PVwLXZhaYUyzAbhN0JyG5BNJnUyTyjTbmjBu4WVI2IpkiPntc3v7w00IcIQ9?=
 =?us-ascii?Q?SsOGi2BpSdjMarWW99zESSThA+CfNkHAeZQiXNAqMYRJWG3GZdwjNjL7fOL3?=
 =?us-ascii?Q?h0zTlIaZ9V7H78AilmhuJgFkYq0eZMxZmMucPpSDPuL4w4VDJ+53kzyUazxQ?=
 =?us-ascii?Q?a9kvrlxQ8oVN3rOnaQG3KmUFqCaVLpNl6KSoLzbfaTtzOheeMVtlinj7GAav?=
 =?us-ascii?Q?Yv4L28NcJKwtkYPzqx4MTagdM7rOmCSr1bGSvMVAcBA4iz9Xt9KTo++tJKuN?=
 =?us-ascii?Q?qXnWGFAwa1rvoxvFEQbKYo3czILx6UwWkXHDHhFGbADawL5Y1IjFGIC3pLFa?=
 =?us-ascii?Q?6tzanZCUqPy9cAVlmjg7f+uLgVKYlBCXGthRSIcofZqtqZReZqm76Np4ecwn?=
 =?us-ascii?Q?mGwNcmH3IaUb2smXPbYvRKprNJZaOwcbVQetVf6a1ajhOwMtfbPTADxGGLKy?=
 =?us-ascii?Q?vSuKknJWewGQ1fzV/vIS1boZg9rdtsVT+XSa1wi0caxmNCQMl7NPJJ8V5Ms4?=
 =?us-ascii?Q?O3ijUmNYQ6nJ6Lpugw7bekeF/1to1vIb7EYWgA0ZHYr1IfRz/m58MWPDNvkB?=
 =?us-ascii?Q?bdHIpUTwtsu2qDplys3litGH/JALJk3lv1Ksl2y8uZrT1nKArRk0iEcDBC66?=
 =?us-ascii?Q?cz6vj3x2mDmxukbxd35fBGGntAGqeUNnmlQxiK7++mCqdgPXZY5qSJcwvvGF?=
 =?us-ascii?Q?OQWHjoYoVeLkaY13d3NgSyXLeGMHQbr0BOUplhZjKpDU1TuIs0w3bbGfIlVG?=
 =?us-ascii?Q?/gZmE3/mRTLvQx4nYafknlrfd/DM24LFZ0PBGfrxEJffocoz6KlT+4xl4u7I?=
 =?us-ascii?Q?gNDxITCs0u9ikqDrhDu6TQOZxczQVBxcE2owps232jgkhVi11H33R55LDTZh?=
 =?us-ascii?Q?YHcwdk4w5A5kTkGy7hTdWiw+8n8QNYOo9r0VH/U9egHg1vFcrv4ZMZCkzMT1?=
 =?us-ascii?Q?Ym2ygCqK368AWSYVgBYYQVN9lrhe8FfszoEWAhXinlaklGeRnq7xZsvCvciL?=
 =?us-ascii?Q?A+aOQVVr26/80MUailbpf+WLBb5Bi+z1DWH8yOxVZeOWGwSU9K81BbieVbU7?=
 =?us-ascii?Q?rCH8Vd+v0HeAnanVQ6xW4VZEQvH75+RrEMpUV/3O+mfEjqpQVZnaxNuylhhE?=
 =?us-ascii?Q?iMg9QW+OElshpT+xvj41r8zVTimQ5cHOk+iUaGc8AhukA7DVvgB01IvHf92H?=
 =?us-ascii?Q?XdjxttH86XkDOOV+z4onOgTWptjKl4Lo1O/L96KnLZxumxhSGNuOAyXLPmHp?=
 =?us-ascii?Q?RrL83HZmAQIZTLX+jCsAX0VTY5TVGZmjZzkPRuQxBH+CJXW7fjWcf3OZLpoj?=
 =?us-ascii?Q?mPlDaCng+CRo1N6vf6pZ3dESM8t7DvytxG4MW6uM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af784fb8-ad5a-4670-5724-08dcc0798fc6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 18:05:51.8305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W0NbQc25OKDlFbk0yhrXn0H2W7g4hJztc54XIWa0DqjQlHU0u2TbFTXm6XZvXLszPwwj6VO0OBvzAXbZ2cgd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10290

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
index 0000000000000..86e881403f9dd
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
+      set to keep Vref on for differential measurements as well.
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
+      swap x and y axis.
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


