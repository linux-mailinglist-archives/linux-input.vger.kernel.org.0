Return-Path: <linux-input+bounces-13012-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9304EAE7061
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 22:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 732235A2A18
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 20:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA862E8887;
	Tue, 24 Jun 2025 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="RWFGGhKL"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012056.outbound.protection.outlook.com [52.101.71.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655012550D3;
	Tue, 24 Jun 2025 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795926; cv=fail; b=RCgK3yyjMtB09p38Lm+eebS5nXxHTRSd/WvhQaVKnK5tYX8zxM0PaV2gM4zUc6kXbQByOr8sbXgfhlztR+4kWnr3wuF9JN0UhbGcjOeQV1CRUWW57iTU6zY8hol+4YxZhP2ipy5AIpLHPssicL5yCAwGTSUKdwqCJAjzM2YOa4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795926; c=relaxed/simple;
	bh=f5B3rYm+uQxTVqTKzM/Q2zPxVc78ip12pu9xEoxVM+A=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dorfydE2XarD8+AtI7BwCp1aDQT+9lABzh6RIlhNgFly4mJsM+L8rNwXayCsKGOa4jxPQE0gJZLYWYR7NvPv8+Lqxp2Gl6LqVzRsZrfcpYd2KF1IhnB8FsbECtuKO/z95de55Vj3u8BjZw6aPfPYZ/fFIM8MO+treLuIBgvEy3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=RWFGGhKL; arc=fail smtp.client-ip=52.101.71.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ugrrkdb0bsO7ZvJ29URm2aU7I7U8yrt+gue2UqQq5f5VqVnA+E4FF7ysoiU/6irVM7Yhl3p407ZGXVJs3LdvZbp5gtBivRNIZ+VAJVoheJAGlUdpZE1DQxthff8AhvXHApR8dheaUJQlXXyBtmZjlK79XQgw4cj8mz5KHTlp3Spy+8Uq0+CIHPQL5rxZC6GAFUTIHRbNGizAUTjhSBwGe+Hir/5AyE+A2lxGs5QTmPRgPxLF9oodQ62ePtEdr1D9TIM5sgsqmhPI7Trya3EDZpZFJ+t4CK6QgPa4QzllkKX1rfYcdx+FD2z6gIDaY74yHHpfSM7j7FpeWIjrBQJI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp+NAJVL7dULVmK8BOOqsi0CFnngidcZeKlKS0yblmc=;
 b=YlWrJCPKE3Zy1dP4aUU4x86TNabypEkphonaWghEzsCVlgCguupBN8XE29URcGfWVQfsJQkwxmwfQ6q+JZMOOlNEi/Dxnu/d9JAm1K2ASKMqY2DXOZbaA9VVZ3FgfivxjqclE0wkk2mqTLlORETvwzhxvwTQ4YpWXc0fJuNnK5Y0NiNdrw9rEHfRtSq3S5adrs/DN4LPQL4EzeOqI0pcn5847cgMIPBqHfVOo7asOyTKZpowK2Qu3AeS7yNSNTi6OlhBP86tSTv5oNHGS7yw1ryKxMeUcGdBkN9AKt6RAnY//vT87ecgGo66vFkj7RLioTrWHEN5okUytzUM5/u74w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp+NAJVL7dULVmK8BOOqsi0CFnngidcZeKlKS0yblmc=;
 b=RWFGGhKLOwW4gfag/+N8mEkHiAxo85VzTvAagG5eDL1s4Nxc61S+EHA4qJiKqThgvYtj+rZu7gUxm7Yw6uqCu9ihK0PO0q2aQAcCr54Yc1gz6QKwDy6CZE0mw/0HD88hHFtv44YsCthH1ifHriWj36ftsO+5BMSBrezBVcnak46hZP4igMRFl840cyuLUWZcHUqH5gh0fWsMC/Ad55/wofdwS+8bsxP/B0xBt1QgAyXBJo5CfgGzKEsQL1fg1yiO5d+CSfIN9tpAjvpfo0fdT4NAjdxraEpfGkgr/UkFZbvx2Y8nbugJO7I7l6zyvFcqn4w5PY67oGdZeCyPOKuRPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11458.eurprd04.prod.outlook.com (2603:10a6:10:5d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:12:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:12:02 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/LPC32XX SOC SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: touchscreen: convert lpc32xx-tsc.txt to yaml format
Date: Tue, 24 Jun 2025 16:11:46 -0400
Message-Id: <20250624201151.2515150-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR03CA0027.eurprd03.prod.outlook.com
 (2603:10a6:208:14::40) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11458:EE_
X-MS-Office365-Filtering-Correlation-Id: b1abd120-4943-46ba-71e4-08ddb35b6196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DL63PwD9LX8/Yz842rB/D5cDS5PeYV3WKp97ekTMwgPek1UnZdWYfPEv2Jsr?=
 =?us-ascii?Q?gZMs9rKxyH5QTLnN44MbI7MJLSpauYpXAfya+CmpRePASWYcqSp/WbrQSiNw?=
 =?us-ascii?Q?tLc8sbAJxZbEbWVX8Rg2k5qPmmMErTjL/w7w7fSjnehowcTfKVmjC6S4QmoI?=
 =?us-ascii?Q?WEpudqjnfuG93o0SmdSXy3NZjbvfJZmDm8i/dbCmjI9aap4SSj7zBQMZ7stT?=
 =?us-ascii?Q?x+BenpL2unUN0YUcJRPMIVpjpcmW+pQ8K/Km7/Bp8J80Kdlfqx/TLI9cy3sq?=
 =?us-ascii?Q?gVKCKJPmhL17NS/C5mV0dAi9vihPKFe3w3MjSca3fNykefoYkQfl9Z3cRX7N?=
 =?us-ascii?Q?Mpz3oGZfCyCF4MIhTefPvuFv4VWE8hg+R/Rz9rI4ahoB0h1al9G3gcqSYCrf?=
 =?us-ascii?Q?CD4/+PtuIg//VMFkjgWCNhCtBJ9a/TtBVNhxgcmHmuEqZAL3ZAfEHuSTBFNY?=
 =?us-ascii?Q?KI6wwRqGYIKvox92MWuoHdsvCXpSHtdKiTg/0hARgbTxMY2F7PD0caMeEHqT?=
 =?us-ascii?Q?NIhMBJcDceAA3uHU+TD0uGHQ14TtIQP4pwpgNFrF/entOE4QnfN7dQZyLTh+?=
 =?us-ascii?Q?iRBlmvwZS+xiBuuZdqS+QNX1R1hSB+W4ukglBHdomB7IlFFoLMpzkuDV6UE1?=
 =?us-ascii?Q?KnYN7zVc+lFGprIwB677EdZ79hVj1+JZa7J+LAbBAkxpxgVzyF11QO83LkGO?=
 =?us-ascii?Q?JS0FVuXjF9LXLvYwE9z0H0nfDBtkVaeVxikoVEKBTDRGpPyKu5c1du4U7ZJr?=
 =?us-ascii?Q?Oz+2mhuiuMZWsFOf+JeR7jZFYBXIydB4rfwitiO0LSqf11sZOpvADqWqZsAg?=
 =?us-ascii?Q?gd4ZnU25QTk6GDqr87q21jDp/Fw3Q2h35InhG3iC+RFLJc4pEdkEzFFoMZA5?=
 =?us-ascii?Q?BdySrRH+UPmU1KN+x6eycWcni8Ja6znsKgsjqURXQ4bYzY5FBoDztjE1RodF?=
 =?us-ascii?Q?GCBvRidWxIbUWCHS3Mu5gFtv74fIm71lZ4Rs6XitQovMBxO/GSqzHxtOYkXh?=
 =?us-ascii?Q?B81LbfmSNUf6CdbU0kV/PE4mEtblPUgWctuO3tiszDNIWit2eJOWZLPD6L9c?=
 =?us-ascii?Q?2ZaAoDD8Umt8FzDUadl1z1h2jNaVZpcATDflFCLHuRVv4spva0+VR9UBmpjj?=
 =?us-ascii?Q?aEUsJZklKSF6QdjJZ4hxDP8B6sSp7kb1leC8az96J0cc328eJNm+6JKnJ9+9?=
 =?us-ascii?Q?naLVD8PuY7r8N4h26GodZPoNXuhxCLzucA3nWg7P0d+yZWTDLpVyPB7UWAkO?=
 =?us-ascii?Q?vtLJN8xdK09rISUi6qSnG6HpjwgD4aknjK1XC3cV6Qxi2NOjwdItfiLZUf9A?=
 =?us-ascii?Q?vMbCV5pOQhznvhm/tNfcXOTzxteM9x+agO+a+v4EPwA20tt1crVq87HoU7tQ?=
 =?us-ascii?Q?5AU6GVBSSlXOtINdZm7puEeLmhv04GYEZWWvufBoYDFqdeOIVpUb7xXqlNIJ?=
 =?us-ascii?Q?WEqa+70p6GTX5qjFtF06eS6OOSp3Uvn5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OjZu1wNGfX+I4dV1oZf8Zj7VrnU1WRJ5+Yfs+aV2HsVRNqPp37Dwr44UcN8z?=
 =?us-ascii?Q?ODRwxVgzZK0xKoYyF7f4nc9J7jUfGfkFOa5jfFq5IIaoxHXQKFgLvKNkqaKd?=
 =?us-ascii?Q?5K5eagXsDT8VuNT3Ii+0gMzPWllqXHcXVe+jyVCFvKanB0dYqlfygLY0TLYf?=
 =?us-ascii?Q?0A4Srm0r6+yh42AfwGbBXEGAMR8VucpvNQ65Xd9i7Af3SC99bEfnudAAndaK?=
 =?us-ascii?Q?QheuzWWLp2QaTM86kipwCOTbu1q5W0JQtJtTM30sxkixPL3V2C0bJCYXztzl?=
 =?us-ascii?Q?QWsnoQspZU8uehMOcN9IYflwkQzMOl0MUuH21WzviYvP9DrNmZ2RlP/7tud+?=
 =?us-ascii?Q?mdSUo78TAr0UsSMGA42Np6h1VXALhCF3ukygBWxUWUNJhZU3mn8kE/Bsbjtu?=
 =?us-ascii?Q?dmB9Rxapiq+jpprkLihsQmCMdofp3m9PqMebwuFbINUWo1ulrpNEOgQ4go1Z?=
 =?us-ascii?Q?1DDa5pdQDxzJYPK7vhE5a+l37N7tsgDKttn1dQpqYAPs8AAzKK+rxXFoEoLX?=
 =?us-ascii?Q?GQNm8n37eYFVDvPy92VHOwR5fi/1gOn0UroHNgCWMR0owBk8aYqRCdMNeo2y?=
 =?us-ascii?Q?952R9+7Do0FYgj3/LDmWAMatRg2II8RZsnW4nx9xUnCM2GVSAU2oc2VX/FKv?=
 =?us-ascii?Q?GTc6GfIS/SatVOO1UqhUwJnL+cdkJdxHwkp7SuwEEgbht1KBTGbN9BaZJe26?=
 =?us-ascii?Q?Ma8xf8CBePyUY+GoDX+jzg/yKD0mzNRc/FFENSApm3hihQncAIAT/alwbgM9?=
 =?us-ascii?Q?LDsOpHgPrWDOoJjS06D1sv1pyPlzqpU2Walxnu14oDwjG4ZOhxU73dy+zfup?=
 =?us-ascii?Q?2imqjHsj3mt0aP7e0aq+1BGhuEbFLnXfhAJoIwaJjc0qdBztejhV1EuHTFXO?=
 =?us-ascii?Q?nxgKZzihvYMQlTaX3bKvIDhVIJPalQ3eXUVbnxwMbWgUSfPNwfBKSPKeQ5b9?=
 =?us-ascii?Q?l9IGoQFFy+SbEXsM3zHgVd6Fxe09zdXlrEJrTPMAlElFU4JkcmFRBApSGlBz?=
 =?us-ascii?Q?DgZhLVGokmBVVQ2OGqm2fnN9pjDtgx8/YgB9CbsigB7lQsunYT+G0JUpCcJ+?=
 =?us-ascii?Q?V4vcTcGRbLDPNF8/u7pfD+vPZgA5Pfq8ONawnhR1nROxJWviW54zUm81Hj9o?=
 =?us-ascii?Q?TOubPKX2pGFI5pBK2BQtSVsOaPpGiFZWl9xmDIQIUKPVDYFdPNmVPMfMv/jM?=
 =?us-ascii?Q?1nbYYsOw9ByIq9Z/zUym1wNY4Jtvpv8ylGgOZrtTANZ/fu8A/oJkois48nFw?=
 =?us-ascii?Q?sYoVEpSTW3E2K96hPcDe2u73czEGdGwCo8bXcZbMdKyYrHKXI79VTJA0PwTn?=
 =?us-ascii?Q?MA4YluPquRzBnadY5NdG9NX2vPpCRQp7HLwBHIfv6vWWeMybOunA8OpZt+Cs?=
 =?us-ascii?Q?oPuvLqn+akcnVVgMLTd70Ig8Hcgbc6lKAeDx/GKtAaHm49IE/B9lPm+0CWC4?=
 =?us-ascii?Q?e0OwmbbsnOl/LlIUVCpWCIGONlyeVFnPWMA7n+SZzqwkjMT8Rg/3wMUhknk9?=
 =?us-ascii?Q?M11nxXfIHko+EzdP6mBHHBh98RPb+ZOWYQXWKzVeU0JVEfXdcIdn36Yy5HFd?=
 =?us-ascii?Q?tHvdIy2SDVnvcSbUp6m3bnskgQ6QU7PsubMC9OVY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1abd120-4943-46ba-71e4-08ddb35b6196
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:12:02.0095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4MMsD95t1Q+Wpshvmd0Usv04E9XuYsf1oYkmdiChp6oJspR0ddTdVSEIQmOOrtHEtF9vhoY2LWLPmpYx956Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11458

Convert lpc32xx-tsc.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/lpc32xx-tsc.txt         | 16 --------
 .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 39 +++++++++++++++++++
 2 files changed, 39 insertions(+), 16 deletions(-)
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
index 0000000000000..34cb8b68216aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
@@ -0,0 +1,39 @@
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
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    touchscreen@40048000 {
+        compatible = "nxp,lpc3220-tsc";
+        reg = <0x40048000 0x1000>;
+        interrupt-parent = <&mic>;
+        interrupts = <39 0>;
+    };
-- 
2.34.1


