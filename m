Return-Path: <linux-input+bounces-13046-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C865DAE89ED
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 18:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E8E17F2B2
	for <lists+linux-input@lfdr.de>; Wed, 25 Jun 2025 16:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4B32C3769;
	Wed, 25 Jun 2025 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="D7RtyE6f"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012061.outbound.protection.outlook.com [52.101.71.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CBA1519B9;
	Wed, 25 Jun 2025 16:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750869290; cv=fail; b=Dp9zH9MEJQ+itZwZfsm9i9IQVcQO/8nKm4dlW9sZLsRySdZH0yE1TPHsVtw3t0MF4k34qX0nj+jlkicQZAI7yScoYyltUV0odZNky3/VUuJ1vEB11BJmJyxmZqtRESlsUa46OW7DMnPA135bRF5rARpw+jD01HZajA6RslHZFGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750869290; c=relaxed/simple;
	bh=F/t0fE/bTY30Q65zyJxDX5eT22j5KUnxsnICrDlCV0M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=miRWVLteIL0xREi4AHTAqfsJj4pyK1E5jbYibLoMxwReEIMgoLsrERe1TUDC34fnIafCqDbZEyomfQSxUp/7T0WTajLX7Q9nAOcDPQaBbYLCPsSKz4a5/KtH1atjuRaAuhaHYYkn/HVX/kNxzYKOa3a6RFm9K/JKyVQXFRJu3tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=D7RtyE6f; arc=fail smtp.client-ip=52.101.71.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBocD2roPLtH6lmR37LNu+VIk1dRNHvhSfOHknX7yE1E7wjIkZ1zGLG5OWVNXa8E/dVkZLkzxbZcZe6eV8mYOE4yMRkU3l1OARgYVzgQv8mIaj8YMWbDu9+kOS6WqH06WY9RIv0ar0mkAUWjUvjHxzFf0OjJ6N4Jwbzlyu4O7mYiiQOQYDrkwI74gwaduxhrHqndTSbBwZThH8BIyjobSo0rks0vJkO3b2RW8FcSk+136s3KgywiEvMQz7iux8J27QeJ+Toy4uoqQPrBsvE7SjMbIHdk/eMViei4tpQpEFsJRzzhmShO3tiXAe6LkYzqrZlYaRA/YNQK7Bw2d9QuhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2ky4PcCJa3ZDeDS7ugGnHG12FPATlRJwSWTuvcUYV4=;
 b=mW3Gn13/d6xIXOEP8yWydSZmB730S5VmDrINxWZG9WBpwpQC9FkxrvP9g40V3V3oRcAS8R/B/OJowJm+CoiabLYoJsV1CikcpLyirKPbbC/c4aVF5bE0FgCy0VbF9RrHaPRkv6JCEYAwaxQaqea2p3uJEo3tWe/VEyC22/uwAvMQJbGQ6P9Thi0ZW59UwGIlgnTk6ZVV2F4n3ltLBZADJfWqaU+t3eD7DZqVIQypf0hT1gdU949F1l9Vlnn9pQUDDFa1WoTPT2ZUkXv1gBvLr+M3dG1mIibbDfwm6Bg7qy/+gi2TSvrHzPDqnF21xOrOnUt5gYpFrfNndNTIylR4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2ky4PcCJa3ZDeDS7ugGnHG12FPATlRJwSWTuvcUYV4=;
 b=D7RtyE6fS8P+orHKylk2kJzjc/wqwMFotcTiIw7y0+epf3LXW1IBeDsLQLSbldJfAaPFE0oqyO8gKvyOKkBHTRV7iFuKl5Ae1T1ufUxvcG80dRZhpHMweJTQJVh/CAOg25FBb9Y/tfGjCKnYdpwCZfx4VxITwcwKP5FMB4PjVgEku9lv7A3CXc5N3Nu1+Q/lUj8dosLJqS6D4vIQhLpHyy33tjL4Kki5m/maaYfqr5rQKO5LdzGJ04RUG2k0m87UWqGp4NHLpEdteuT63M485pGVo3Ow16jix0qGPda5yrVmq3ktdoo+TZXgFOUuSHjw9MG/lL+Q31kPR0WwkpF1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 16:34:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 16:34:44 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert lpc32xx-tsc.txt to yaml format
Date: Wed, 25 Jun 2025 12:34:28 -0400
Message-Id: <20250625163431.2543597-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM8P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAWPR04MB10007:EE_
X-MS-Office365-Filtering-Correlation-Id: 042bccbf-9c7a-4c0c-642c-08ddb40630cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mMNp3GOgC5Gxf4FkkyKo6ggHO1Qn+BKYCe5PjLjv5Nm+H4PUlgM1w9mObCqB?=
 =?us-ascii?Q?gLyiMI39BIRIzGBmnpNPrrzVx/3wEYxoCRejG82n8t+ulLsDt+8T5aCyXSCY?=
 =?us-ascii?Q?rbPt4xDwCPB6k9mKLumtfUGEYqaGD76qQrQqAXdnNAsSS8Ui6QR076F2uZUw?=
 =?us-ascii?Q?XGmBBCV1+uE7HvDrgb0/3SPkkHLPjYf/5pobQZwNQPYdiKtOfwNqcXX90ra6?=
 =?us-ascii?Q?gQuds+PHN09OwlBSkcV1iQJw8Y6Ijiaxdl3N0h+6l5ZQztz0Ok187WxPAAnw?=
 =?us-ascii?Q?2gOwGRs1BuJNWyZIpfyNLz1YOwNca0D8VA/ebK6pFdMtglJCzzokz98fLpJM?=
 =?us-ascii?Q?Wlf6rL7CWOe9jZu6FI0s9R7YLL+XPyyMcGpAvNmRyWr/+wz4g39CI1X4mjQq?=
 =?us-ascii?Q?5mD8mVoEmeL0C0B3MpkFTMWad+Z2fYWV2oh9zyXHeBW9BSb+Bqp8A7L+6yHp?=
 =?us-ascii?Q?oj04yg/a1VSoOKjTxitS0UHokhhIz0JAmfpSaXyA/hzWkpblz3rCz+sH8s75?=
 =?us-ascii?Q?bS1XMm1zg/vDz6SEcNLlKuELiVWlap3m63zLVhP8/faF8W51XhcobXfhTR+M?=
 =?us-ascii?Q?cFiq1RH2IozliRdj/fPoM0Mt27cgq5AltdPFM7o9VlxkLjpRXXPWy4RUpH3c?=
 =?us-ascii?Q?lF05EjWHTAlxdIXaymd3T82GZHaksIE6m645IoQ8heizVaCKci3kmzCVqMIn?=
 =?us-ascii?Q?uoR3q5dUqnc6SeGN5js6aJJWdQy8Xf5duOKSYMxS/sR1Vrxzx/9H+cVgGP6j?=
 =?us-ascii?Q?wA+Zct6w6XacZEQE7cYYl9s4g3+mRxRX+HaNntcO/L+c+D1iyq2em4KVKnZo?=
 =?us-ascii?Q?vj4TSRbXr8tkD7ey1pmFSqGjBfzTJpgS1i/1x8zKNPJVL1BwwgJyP0itJvaj?=
 =?us-ascii?Q?ZeB0qFkrH9cuJolQvYho6FCXE3+10X0JlMWWKTgbh/j2PjyMHKWBHfUEMiPc?=
 =?us-ascii?Q?XO5BRsXVoIm1IZUsyC17tK+oOGdD0RYLBUuUYJokrtumPEXG2Yz7z9OqD6Ci?=
 =?us-ascii?Q?I03jwz9Fse56OJAEhnRybXpybKFjliNAM3tjwOM6sfFcyHiQ9y5jFWpb5XnI?=
 =?us-ascii?Q?WreeX0kI/1tEghL2t/lZopHn/ZxTZ3f0wKEjnDAFwbj8QqkR9ohBTBhy6Dcb?=
 =?us-ascii?Q?5jNaZu0H9vv2G9bipejVoIJMUlX30lA9GNnpEJbcF6oC4ciGIQPt29AZi/kg?=
 =?us-ascii?Q?LxyTqxcj9e4gb2Tjt7PI3XsYg5KhtMeLfh2i1iTjMeubpkNUpf28jmK1xRP+?=
 =?us-ascii?Q?4D521kmHxPqBlWGQSlY3BqjWf42HXHcCDXaIbmWrANEox/IwVbKx4YJJepVK?=
 =?us-ascii?Q?MQipedXNpgcX3IogsvyRQiRPlMr+/Tc9ICbgZvPSypXTYaW2zP2QWYPq/fdy?=
 =?us-ascii?Q?1OG/8MgIuXgU5yXLOZHSxSOUZEl5n11UAWKQeiFtbpX9QGa0HI+OnepbFp2e?=
 =?us-ascii?Q?F9yOI1psgx4Oz+pVBZ0dch9VSFuaLhOt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/Rpj8oRIf7W6rzGKo3YykdT59QNmg9jGdQl8I48wpEcykK5mTPOBUMIyKQqe?=
 =?us-ascii?Q?q5OzG0OUhc2C9Aol4TRB7rnd2gCwMKrzGRgMzwDBa+u89g43z7pYA7Y+3qpB?=
 =?us-ascii?Q?4LCr6UepMEr95Ftjhh7WH2C7nD20j6n9wxNGRMo0vIBYK9MMkvZw5vFLDzid?=
 =?us-ascii?Q?gfDlj9aH8go1OOXrjasx+rP2BOLRUL6TvwEZMe2TsLegx7TWI8lzzNJNNFaJ?=
 =?us-ascii?Q?SZ5+HIgOA5K8NQXgYbAleKUl4Ol45PlqZ/ZfhJCBxW++wPN85PjWZDkeQH41?=
 =?us-ascii?Q?7Q/3I6ZebX9VRtAYro69J30B6dA7AN98wTVtXTxFuYeaDSa1xzeOYyl8JeAd?=
 =?us-ascii?Q?tNnLMNV36546+EjQg7ZfI5mv2pg03sg/Co3+TGnpOsabWxeeIKBMbGJEUv/2?=
 =?us-ascii?Q?2R8r+YHdQQjHYSNovPdmJ8iWt/h+CyCyJ67O5qe9MqNVl48S1Ix8L1Ih9bS7?=
 =?us-ascii?Q?CRrLLDxRVHC/kTpLkLWVMoVCi5rIqoKBa8LtrV8xH/9SJ0byRU+8TE9ALvjv?=
 =?us-ascii?Q?86YCc2RBHgOZMsb9N2knkfXYgrIQ/AZ/HVNIDbIVTNqrzV8pwFS7lxohQwFq?=
 =?us-ascii?Q?AyXFy1P3XcN7b1uO82LK4+NfjEydbBGJu4hTT38ayia0649CLqzsP6SMhF4s?=
 =?us-ascii?Q?t87+T1gfbqc9vDJfmq1lVyOYFJOJH+swPq2fYqisCoPW2b7iU7rfKAIS13x8?=
 =?us-ascii?Q?NG5ej8Z+h38HFdG1vs3+CdUOAn2vzIv7ADqlhr0TSBURzZFgJ2WGmA0rIPn4?=
 =?us-ascii?Q?dN5jkLfP1uBUn/zqSqsi6A5yNTU+8D2Wf7kHZEHW0kIDASLDSTYpl8HXFei2?=
 =?us-ascii?Q?zmSuIDbzQmqHfs8cSMzhgCOZuzskL8XGNoa80Is2Z8B9fxESPiLk/PN+dYpu?=
 =?us-ascii?Q?nKwzlwR/QqkbuZ24AT6VN3GbHo+3sA5fVNjpjAtVsGgP8FMhqaRVHZIeIRnd?=
 =?us-ascii?Q?WM3oI/xhA2ogAjP0OsoaujjpsU7fm7Q+4Lp9PoU5FYsuZOP/8LaLIv9B0Xtq?=
 =?us-ascii?Q?HqWDvEFKGDpJmyjIXxneumhmDLa1XRL8RDZhwUDyub6GqkwPx4wqozP1iUxY?=
 =?us-ascii?Q?RBHIH4mVjYrv3nXmuCGuDq4AwJ2wAX+vlPZJEgVRO5gYlBIqc2MDEfzJa6ev?=
 =?us-ascii?Q?zUUxEVgge0suV/YMV2m+LuAG2DvSpFZBI9D+mEywO3mi0kFVL8wiS5RticaB?=
 =?us-ascii?Q?bNZx7Xup8FwtiBussH7AL563fbV55lrolJ9svlKIalkRJEg2m20PJfRUxbUI?=
 =?us-ascii?Q?42V0MlhpMiI+hndcnRI4NJqR4ysIdozH0RL8bGwPiZaF4JoXoRepI50IlnaS?=
 =?us-ascii?Q?u29jItajOYgPG+G7tr+31v6EUQMCZ8fPJxwGxeIC+EAHwpBGDQCg4Y/KrAJx?=
 =?us-ascii?Q?HqFzxc8PYd3cLN8nupN7jAZrtYlWWlPC37gjM3XiYlPYpHUCVhTOXCwrsik1?=
 =?us-ascii?Q?W6rPSOIBd2eEqPGlylcm3nXTHupaj6r7X3VyliTmc3Q3hvI/mYrbk7mmnix9?=
 =?us-ascii?Q?WbCm24a0GEU7E+k6XEJs/9v0D19DnYf1OM01ca1jINgXArdk2DmSiLdKqR9H?=
 =?us-ascii?Q?vlHJWZBJFmYjn+SM4g4PN4UT7OBoTFazEXOf1/oX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 042bccbf-9c7a-4c0c-642c-08ddb40630cf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 16:34:44.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qypsxX3oSjPNjg6USsCqx4GgqSQbNDJ9D266bV+U1D6WpE8Ge4KS0/weSqt/zT+YNcThIFRwwO68w+/UUv7SQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007

Convert lpc32xx-tsc.txt to yaml format.

Additional changes:
- add clocks and put it into required list to match existed lpc32xx.dtsi.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v2
- add clocks and put it into required list to match existed lpc32xx.dtsi.
---
 .../input/touchscreen/lpc32xx-tsc.txt         | 16 -------
 .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt b/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
deleted file mode 100644
index 41cbf4b7a670d..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-* NXP LPC32xx SoC Touchscreen Controller (TSC)
-
-Required properties:
-- compatible: must be "nxp,lpc3220-tsc"
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: The TSC/ADC interrupt
-
-Example:
-
-	tsc@40048000 {
-		compatible = "nxp,lpc3220-tsc";
-		reg = <0x40048000 0x1000>;
-		interrupt-parent = <&mic>;
-		interrupts = <39 0>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
new file mode 100644
index 0000000000000..b6feda127c7b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/nxp,lpc3220-tsc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32xx SoC Touchscreen Controller (TSC)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: nxp,lpc3220-tsc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+
+    touchscreen@40048000 {
+        compatible = "nxp,lpc3220-tsc";
+        reg = <0x40048000 0x1000>;
+        interrupt-parent = <&mic>;
+        interrupts = <39 0>;
+        clocks = <&clk LPC32XX_CLK_ADC>;
+    };
-- 
2.34.1


