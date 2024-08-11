Return-Path: <linux-input+bounces-5510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430694E36F
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 23:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8FC41C2114D
	for <lists+linux-input@lfdr.de>; Sun, 11 Aug 2024 21:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB829158A25;
	Sun, 11 Aug 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bZySg0Q0"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010032.outbound.protection.outlook.com [52.101.69.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7F12C1A5;
	Sun, 11 Aug 2024 21:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723412841; cv=fail; b=llFtAoV6H6ZLxC9d10hj1ZNZk7Zzwnjfcz5OIAAIQWvvoW+il2CB3+Ia0K2gtIiUH0idFpVyHNGgzg/+fO+sTr95mnjPuvq42WX5uH4onvL1R2v0TDafH0PHdRAC5+XfPmSmLPiPfgiUzn2NGYgFJgL3RrhQ3YyJAMd2RtQwXAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723412841; c=relaxed/simple;
	bh=W0HahD58Liw+nlbz/NpbFHj4gC2SHFjCFFJNkpQxs0s=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tcyFPlnp8UV3f6B3rAAoM3vPAeXH2BGLmgzmRcvQKChWBf22HzUVkjv7lY8pRR8Tn9aX/Yk804zNMzg0XCfU8RZU0Vv7S9NBFFm5qvs/iPFvvIt9Y0EKuzLztmheidPT8+HBrnFB8eFBiiUhBGdAs99svmpETaTh8pEXJ7kJDpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bZySg0Q0; arc=fail smtp.client-ip=52.101.69.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZpCOaJVMFlUGgRZBW/QnJsZSs4UlcvwU6HvwIwbZqq/BlLHqmjbRkohxa8rt9HFvoFmD7Ad3Beqz8DFZwI2oCZQznmu5gQkifmn7zpIMERqilSCQwCl6926dwpiw15BA8JK4hUcgeBD5UWFO3HNPQiIE7GyNAQeJf+RB6CEYa3ZAgaW+q7TMJuMnBV0Ms0X28xXfHD/RcdQEWk5KNdFBpJ5QXXSYYq3UG8hfMkBdQkdOJLgM8o1k6HeuyUJXfKVbSu23sg7yQFp04TsblXm7giHkoQX2T5jMtIX+fTyt4qENwVnVbfV/jeDzA/mS4QzUBNuUCpS2EDQKK0kUDMl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hran0EUDj68icBdfnjLc1XiTJ8hNj7atRHuiehfcWqQ=;
 b=WQmROUFz+anVlOdulync4Ump0dITyAkrUAR/urju9pgRVQ28A67uZqGuNZxdhK8Uuhd6Nzst53Vxy8InUBKUCYa5sj1u2ppoaSLFSKxCaXnkQcRKJg2C29C9G3olwg+35u5o/JE4q+1fD6CegUB4+c5DTav8sjSPJ+UdcTZ+fH9z1xW8UCszvsme+oKmytV7R1gaPykSfjgyJafCh+RRWbzwlc+93SPKlAffJmSS/JXPGgBv1tMSOdMTmjJ7sOq56CE5/fqdzfcV1BvPd1BKnEBYoIw2CIDcdK8dlSzppAidnIXSrNxCbvktekkPA0947UI1CTiqviqvXdSN4GUnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hran0EUDj68icBdfnjLc1XiTJ8hNj7atRHuiehfcWqQ=;
 b=bZySg0Q0qbZUViaErFaulVR6RQ27NxdtHv6lNydzHKHOGstgScJKSmg/AevnlcaWfwigcTYiaREt/UBw9/ev9eJ+nx2fy5sQ1lTyaQ4k5KtXO41F8JrrTmirUT2tRp4Kn6bE53XOp08xrnuwbgFSD8Ht25Mqh6hgngtV1FxuWIIImidPUphv0OnG4w4Y7C6dl+QQHQZuDu+NChfA9R4odUtUbf6HXj/vh4B3cNIyHhhoRkgan9r3NGX139tmyNErJs8Lj27WkiDXrTliJwA6ZCuK/88XpsJVWeTnRTyZusZECDst4/MKhG6hEtzJNxMUZMnP6CeIWF+VdEoeKh6kzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7623.eurprd04.prod.outlook.com (2603:10a6:20b:29c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Sun, 11 Aug
 2024 21:47:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7849.018; Sun, 11 Aug 2024
 21:47:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: convert rotary-encoder to yaml
Date: Sun, 11 Aug 2024 17:46:55 -0400
Message-Id: <20240811214656.3773098-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0140.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fc7f94-1324-435f-0144-08dcba4f2a93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iupIlrqPdipwOiIAgwZ5IJqztJ87LbeqChOvSWq9nyftTTCPOaYJD32YJj/v?=
 =?us-ascii?Q?1neoqAUeg32j1Y++Fw9sku+9sUIrkZhBvNRHzxEa49SjU3UbcK4TIUQeMxJr?=
 =?us-ascii?Q?fUSpJJywYwT9OjLpmtYWAEoJ1+DtzTvWtIXj+WjLtevMrFc0cdwP7m+4oD61?=
 =?us-ascii?Q?qwzOOgNZEbdyfsl9TveqsDeGlQImGuf7e85CeXEUZao48pPq3d0vjG3dbQo9?=
 =?us-ascii?Q?+m+YFqk+Ef9Z1hNf78TVxs13Y7qTk8ougAt9BruwbAf0kYFmeoORBZnGH7yR?=
 =?us-ascii?Q?g2mwued96zVw1zMzIbgZy6PHZ1jIqrOXT4kvbbvP0qRyqi9cWN3BxNVFFvSm?=
 =?us-ascii?Q?VWIqejEd7Jnp/1G1cCi4U5uwRrEytQMnSohYyFzNb0G6hfmtnL18xpay+VJY?=
 =?us-ascii?Q?0fsPPqS38Cf3JF01qVrBglhlLqAlZ2Bx780CgFMRgZjfIkNIE7B7FBd6CWnP?=
 =?us-ascii?Q?0w1qG1tsFwliofhTlI7MSQK0UW55yQJw3smEt4Voodhf+duTp4TJm2qmm7AW?=
 =?us-ascii?Q?oYM8ljEuWMuoguev6yIwNPj9btbQ1eMDsPJ4ewb/wo+eibQQvbnnfW1Ipjn7?=
 =?us-ascii?Q?S7cbQc63AdGdQ6zUq83kSrIQVb58InyrLzTbofL8ZYtt4UwlkGq4ekuzgxat?=
 =?us-ascii?Q?2Qw74gw93ElaSOdhPxXVwf3qAW/68ZK1ZU2MmnO/xZTxeXa+ZJTzz17nQXLx?=
 =?us-ascii?Q?LD+lgyg6lHwgop/pnEo253Koh+JVKB3HdIhk1Fhyy/QsYJ/8o4CkVnnWHZFP?=
 =?us-ascii?Q?gYmsQkq1UX6S8t+vqwgUda/QcHt0JI1tpgvt8rmdrHrL+6C9yq2FxgQ1WDw+?=
 =?us-ascii?Q?Fx04wENFmDQ7+xhOP7eSf+ZtvwBgDugRU8Ruyu7hCk/sKTo6hQRtPjnbpBHt?=
 =?us-ascii?Q?2PBWL+TK6pophxI6bmdvTD5QgfaajC1TxpUO/Y5gC9b+YfHhOttjFo8eyZKW?=
 =?us-ascii?Q?XK67m4K3iLp/PI39zA7ktuMglT/H3HoR0SCUaavF6EAW6m1qK1aoXI8bGNG3?=
 =?us-ascii?Q?U4TFv1NbOy2TQzXPXP5oWj78Jl6vsIV0pkh0S1qYWICnS4BT+h6OHVwe+Kag?=
 =?us-ascii?Q?kNrT26UUG616YrLaCWsXka2onCPxDVDxfba7PMDCmVgHx9JM2h7yuUNAVnNc?=
 =?us-ascii?Q?7DAuH0UgCAhptMlzUYGCUtF+GkqI6p247TZng3rpf7RX6SMMVRrDfGJQmJhv?=
 =?us-ascii?Q?PpZndq13uKuA8teRucnjZjk2jBPpFL7IPko71J+oiJfYPGtzEU5ZZSCuJ5fC?=
 =?us-ascii?Q?btxSGomZ8OF2okifRT33dDJbVUlYKWLjh8EmkVDf42VAm1ZKq3C3yuG5hVCv?=
 =?us-ascii?Q?aT6fs9j86hy3WBndR85klsqlmr3Mw971QKrulGYC3XB/mcsf+9iwP52VAZIq?=
 =?us-ascii?Q?WUAREWM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1ihR89l2K7LcmjbCoSokV1mJ3v2ZuhBJ3tOMISLBYyeuwaQUXYiZwqJXt+z7?=
 =?us-ascii?Q?x43EDoJLhsu/UJ0WcxIsdXHl1yLp5bE0nqQuBmmFTIOsyuGxiKqsG4KfB+V9?=
 =?us-ascii?Q?Lnm/5tzahOrKrxZzBYHwDkNtvUms8Gltn9NhLZ561tonJyIylu7ZA1Hj9FTI?=
 =?us-ascii?Q?lntG+Ay2V/6PBEM4Rb/vsXIb3I7WQtyLxTfJtR1PZQAlcHU2ppXxYhezpk1D?=
 =?us-ascii?Q?S8LSnpICmjzfrUbLrLxTzyLy2vzwB+osS/msgOcH0NDagcBcSjawzgtcGE2O?=
 =?us-ascii?Q?DFEuKuHh6B4D9v55h6hySpTODbI8H0xUmVsI+WDpUvlMijE+hbsJeblspw1U?=
 =?us-ascii?Q?x5GgLUbxeaUV7TZ2TQ5j7gCbjE0n/kdZJhX49/hnMHhVPGH1aRADE49OryiM?=
 =?us-ascii?Q?Lz8f9p9uvmMGRt+xtboXrUpOdAL6mkiz8s/jdXNyWhN6IrwCdUG8MzvVSLyO?=
 =?us-ascii?Q?W8w8of+ETeNzmXgFKoGslEZoVcE33PtF4Y6tbb/OKRJs6PD8GQs8j0bjBf/Y?=
 =?us-ascii?Q?Dgd2mPuFezu5Ffbc99ykthQZWh1wGmoO7+Ul8/CSRIwBtwscG/98sDDEFRqH?=
 =?us-ascii?Q?cEevfMHdS0cAf5nzg6mK1FO/ilw3NuHvrp+KP1mwKaKAwJ9Bf5C369weczdG?=
 =?us-ascii?Q?E58bxOlWXSwcE1lfwEXn2Q7IsweQ77bcjL02qSGoQ+v73x3cxyd9wE/0Sfuw?=
 =?us-ascii?Q?2YeIIg0cf7aJdF1prVy1pG0q8hwtk7IO2Z8miduyqD6O7TOTdcbNQkaN7MId?=
 =?us-ascii?Q?ADlHQZu8x2u5HzvmSYeMSbeN0htdeMia5pih9qWzdMk3vPrPp5mRtZQjS7hl?=
 =?us-ascii?Q?2FV09M5shrKCu0mYzdnekljd03OmSPZMkVsyNKnsO+ILeFnPd54u7Hd8mKfr?=
 =?us-ascii?Q?E5HKxyFcPhq4UTXshhAfbV8f/6lBGadOUG01C+qVrXAuPK7b2aoMRYkxE1Dj?=
 =?us-ascii?Q?N6OP32IarhR1UDH6SEhRsWv8UHTfcBfeLnPbumCnTlGi3iNfA++ifdBYqFsW?=
 =?us-ascii?Q?llcbtrHBYfgee18VrmEBthRw0DWaUYZMi/E5KuSFN4GK0E4Gxk2VokNkKNcg?=
 =?us-ascii?Q?K1J9tVmCEKIElaxmi9g2vhzv9RuPk2Emol+5WweihpapDPjFNk/VjRw6BXGD?=
 =?us-ascii?Q?PbchuFzIl9MbaBnx3wrJrr9063WZ1yX7mEgV86amWls8AwO1zBaKx5L4MfOg?=
 =?us-ascii?Q?hFQc3F2SywFuHyKqQBsA2Iv/Eqi3eFYR8xH323N+C3ngIU/ixE13haSYdb+S?=
 =?us-ascii?Q?+mcJIrEzdAogSaSfkjdmMTNQ5MAMr/rmDxCZQiqtMYCzKYuZT1Znu5Aec09C?=
 =?us-ascii?Q?JJft25nOYad9GXtrhsqW1xxSEkzDh7nDJJsbbv5Ba9z+FPSAEYZV+kNoWXSS?=
 =?us-ascii?Q?K38BRlh7ybxKdBkC0wc6jT3pvdkNV2KlL46DLevPOLhK07+x/o8ebO0OgeHb?=
 =?us-ascii?Q?E3jQr+ouC4L7rultCPRIUcO+KRoK/mfO57RT969J1IfpryCbyeI7Q9J/gUFv?=
 =?us-ascii?Q?5ATpUyObBQj1E1oqQVpZUTLwt2xjuVQ96mhIK65CGnLWO7SbXQhGpRUtQ5nE?=
 =?us-ascii?Q?1jWWBlb2edgKV2IVF86iNyUIQIApU2mU9M1xPLu5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fc7f94-1324-435f-0144-08dcba4f2a93
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 21:47:16.0697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9fVbaXkF2oSnVfm6/UVMOfH8RuWjwIFJ5SX5nelCWgFTe08lRIgHltAAtBigC4KBIkIFOBssRhKTDsfhnYdzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7623

Convert binding doc rotary-encoder.txt to yaml format.

Additional change:
- Only keep one example.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mn-dimonoff-gateway-evk.dtb: /rotary-encoder:
    failed to match any schema with compatible: ['rotary-encoder']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/input/rotary-encoder.txt         | 50 -----------
 .../bindings/input/rotary-encoder.yaml        | 90 +++++++++++++++++++
 2 files changed, 90 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
 create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml

diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.txt b/Documentation/devicetree/bindings/input/rotary-encoder.txt
deleted file mode 100644
index a644408b33b8f..0000000000000
--- a/Documentation/devicetree/bindings/input/rotary-encoder.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Rotary encoder DT bindings
-
-Required properties:
-- gpios: a spec for at least two GPIOs to be used, most significant first
-
-Optional properties:
-- linux,axis: the input subsystem axis to map to this rotary encoder.
-  Defaults to 0 (ABS_X / REL_X)
-- rotary-encoder,steps: Number of steps in a full turnaround of the
-  encoder. Only relevant for absolute axis. Defaults to 24 which is a
-  typical value for such devices.
-- rotary-encoder,relative-axis: register a relative axis rather than an
-  absolute one. Relative axis will only generate +1/-1 events on the input
-  device, hence no steps need to be passed.
-- rotary-encoder,rollover: Automatic rollover when the rotary value becomes
-  greater than the specified steps or smaller than 0. For absolute axis only.
-- rotary-encoder,steps-per-period: Number of steps (stable states) per period.
-  The values have the following meaning:
-  1: Full-period mode (default)
-  2: Half-period mode
-  4: Quarter-period mode
-- wakeup-source: Boolean, rotary encoder can wake up the system.
-- rotary-encoder,encoding: String, the method used to encode steps.
-  Supported are "gray" (the default and more common) and "binary".
-
-Deprecated properties:
-- rotary-encoder,half-period: Makes the driver work on half-period mode.
-  This property is deprecated. Instead, a 'steps-per-period ' value should
-  be used, such as "rotary-encoder,steps-per-period = <2>".
-
-See Documentation/input/devices/rotary-encoder.rst for more information.
-
-Example:
-
-		rotary@0 {
-			compatible = "rotary-encoder";
-			gpios = <&gpio 19 1>, <&gpio 20 0>; /* GPIO19 is inverted */
-			linux,axis = <0>; /* REL_X */
-			rotary-encoder,encoding = "gray";
-			rotary-encoder,relative-axis;
-		};
-
-		rotary@1 {
-			compatible = "rotary-encoder";
-			gpios = <&gpio 21 0>, <&gpio 22 0>;
-			linux,axis = <1>; /* ABS_Y */
-			rotary-encoder,steps = <24>;
-			rotary-encoder,encoding = "binary";
-			rotary-encoder,rollover;
-		};
diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
new file mode 100644
index 0000000000000..e315aab7f584f
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
@@ -0,0 +1,90 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/rotary-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rotary encoder
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  See Documentation/input/devices/rotary-encoder.rst for more information.
+
+properties:
+  compatible:
+    const: rotary-encoder
+
+  gpios:
+    minItems: 2
+
+  linux,axis:
+    default: 0
+    description:
+      the input subsystem axis to map to this rotary encoder.
+      Defaults to 0 (ABS_X / REL_X)
+
+  rotary-encoder,steps:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 24
+    description:
+      Number of steps in a full turnaround of the
+      encoder. Only relevant for absolute axis. Defaults to 24 which is a
+      typical value for such devices.
+
+  rotary-encoder,relative-axis:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      register a relative axis rather than an
+      absolute one. Relative axis will only generate +1/-1 events on the input
+      device, hence no steps need to be passed.
+
+  rotary-encoder,rollover:
+    $ref: /schemas/types.yaml#/definitions/int32
+    description:
+      Automatic rollover when the rotary value becomes
+      greater than the specified steps or smaller than 0. For absolute axis only.
+
+  rotary-encoder,steps-per-period:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 1
+    enum: [1, 2, 4]
+    description: |
+      Number of steps (stable states) per period.
+      The values have the following meaning:
+      1: Full-period mode (default)
+      2: Half-period mode
+      4: Quarter-period mode
+
+  wakeup-source: true
+
+  rotary-encoder,encoding:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: the method used to encode steps.
+    enum: [gray, binary]
+
+  rotary-encoder,half-period:
+    $ref: /schemas/types.yaml#/definitions/flag
+    deprecated: true
+    description:
+      Makes the driver work on half-period mode.
+      This property is deprecated. Instead, a 'steps-per-period ' value should
+      be used, such as "rotary-encoder,steps-per-period = <2>".
+
+required:
+  - compatible
+  - gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    rotary {
+        compatible = "rotary-encoder";
+        gpios = <&gpio 19 1>, <&gpio 20 0>; /* GPIO19 is inverted */
+        linux,axis = <0>; /* REL_X */
+        rotary-encoder,encoding = "gray";
+        rotary-encoder,relative-axis;
+    };
+
-- 
2.34.1


