Return-Path: <linux-input+bounces-5662-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA17956D28
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 16:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 623DB1C21408
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 14:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003BD16DEDA;
	Mon, 19 Aug 2024 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dz06x33Q"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96823170A21;
	Mon, 19 Aug 2024 14:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724077494; cv=fail; b=dXPo2KUArxTkMeQRRkvZBrX5Adk3aDP5v43aUn6Qxl2NYQjdehQ8EKGEwPYehUymJWgOW6H4502q8rYvwmIMT4j6p7xPLZ/vZib247CUMe0MdaOHdoVTuetzvEdGttaoIoer5SQIZ21ZOB/BoTIsuoSosyhWQKeYR6GD7lJ96pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724077494; c=relaxed/simple;
	bh=aQUVD5VY2Kx30GU7AsfE+d/lw6fuSTFDKEoAFyfW5P0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Zakd1lfGvYL0WLKgRRdgZXBX9j7CwYGlK2uratAEkYc2oDCb39r24BhAb7ogvgAvlcDsKU/zVUW3ZeFftm3aOLkIOXgWPj2H//4zqHiNW7QAP2rM8qraEnBi/FZc2PhdyLhR9ZCQ1NnpRz6MfFA53QbpfDX8m6ZSo4yUsyoJvKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dz06x33Q; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5Dl679Bg74et/KAmcGJh/WkPYhmxn8CL9llxuJv7P+x0OaKg3F1uuahE4DyqQ91T+pskCeE4VDVawHVMn8WqBXiEtk5fXRQ5D585j/jFBukINOuJXYWfPM/harEs9jGpXjWlE+lpJloDsdzp2zSPX5klOUBtH3gNzuIm2JfQiRFFWHGN3TIYtAFwOv7+UylUy0gWU1FVyBBtPbTGaxKEv6zGreTRSL0PTTYO/SluLG8DzjncbrHEhMgrPYHwDzGJvRBS14QIHTSScu+wBsCILeI16PWpjjX5GzavXFcGS5TOVawUsGzIdNLORr6gMcnWLsKjBJyspXEp9fz5focDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2qk3K7JgJZK3up6FfTCrOlaaKv0kyX9yh2M1ulwlKA=;
 b=f0bDOx2hIjDSumZh38jzhEc7jbUzRS5RXAAGSXJqCIWSv7dmnxxLU0Vh4uhTDlUXKdTPamplNlclq1zkDF7SZ5JYtTV4UL4gJk/fOrhimQfHpLt6i6utHwk2p8RiL1/9qdsSnLBIZJaYGxA2NlahpKZWEgDMkjuEraK8mzm6MmhJ8FjJDCsO53FlVo9ZDR4B4gWJDDUU+RpEGyXsmLk0lAYRcV4fyBCkwUjibBxsbtUTDfAL7UztAsFKhXGnykMcT3bj9q0aVa2xHp+o+t0G1qQRGS02aFNMsLvVfgn3n+WppktSXxs9/nCUu8w6t+aqKs8j+DzYwx8KhLBrI3VZzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2qk3K7JgJZK3up6FfTCrOlaaKv0kyX9yh2M1ulwlKA=;
 b=dz06x33Qr/Ch91jaTpIUgPf0exaP1KW0i40PMsDZHO/bQEtDBwJ0BZMhieV+/WbdBSFc28z442DIjfEhLgCfWmaFDj8XK2iJ8JkK0vF2OCQoS2Oe3mvUqMlthbxdJKY+ymTEMQzBSpmkx587elQlftZ7W4e2g3tOiaBop0NvVnClQGU+zMcM4dEkrGIrVaXlFNWw16+3AnaDshv0sxzHTrdwXo8eSH+DAdFQf561TXpCcFiwdpVco74tIlVqMMtMg6pZRgxXNtpCSERvqDI8LvciyRzxRXvbzNkhuGQXjZYKIsX1v1rpyfEXoLMnmlO4wlJi/+3qeyW3JzWtj0AVuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7408.eurprd04.prod.outlook.com (2603:10a6:800:1b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Mon, 19 Aug
 2024 14:24:49 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 14:24:49 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sanchayan Maity <maitysanchayan@gmail.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: input: touchscreen: convert colibri-vf50-ts.txt to yaml
Date: Mon, 19 Aug 2024 10:24:29 -0400
Message-Id: <20240819142434.311760-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:806:d2::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 905dcfc5-4e9c-4619-6d41-08dcc05aaee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hUPXOtRtKblZC0ovDYYzwMIUQfgbJXo0PdVIOIsIPXur39zZ5RA4/XzsE+1q?=
 =?us-ascii?Q?nIFPVuRHesJAYtx/+B6Sc8AoyY1gX/k0/9VJFDq36ZGm0xp5daLcfT0RbNYR?=
 =?us-ascii?Q?j/m1OJ1zAd/sjQoXVuwRZsqeOXE7GNdFTOAiTN0XVJhOx822vmirWZaoMGRz?=
 =?us-ascii?Q?2Ci7e/zGSWD2521web/2MPlQpvYxcvvdBV9qPPgTZAPSPNHrkeEAYRMhtMdh?=
 =?us-ascii?Q?Qd3x3pXDOBondHyMdYjP53UKrq2KArBSW3wSUk4oDv6p88mfvaldj2GwhSYy?=
 =?us-ascii?Q?mDsFduB3ADhq5nPqF4cvMjjUxFN4bVF8Q3ePqxsd1yIqqUUMf60zRO762Hlr?=
 =?us-ascii?Q?E2wbY0OHRJ5Te2X1BsBs9rlr+vkref15fAaf9vz74iVtIu/LsayE/GzyHu+K?=
 =?us-ascii?Q?Altu2jPnoDcbd1vCbIF5tzYKBAl+MXiml0kTTAYRMK2OAQ9JOE10JzGQdNDv?=
 =?us-ascii?Q?LwVq98k0AwrDl6cdsS+qudH8lvBrgwKdgmX0v4uF9GXRj84y61Tuk6NkvgQO?=
 =?us-ascii?Q?+PtV/8T5vQVLkgH7WYUGnK0a3cRMsIvEPcJMBtm/IQLMaX9xgjMNRIg8XwRL?=
 =?us-ascii?Q?prHvnn5g+QJTLOdkTtLGZRrBBrB1tBrCRYi9FmoSalSUIH+AORcnnr4qlDx5?=
 =?us-ascii?Q?TBO/Av9pywX6+OAwXF5DeFXNYkgewa1oMpzMW+nhMMejs7MAPoyM181vBSZl?=
 =?us-ascii?Q?4+p7LNwcIDSJgLSH+UOyMUyZ2+091Wv8WSDyKI7CIYT9r0ngncOm8GFtFngv?=
 =?us-ascii?Q?tnVcEHpw5+GJOYfyKf4elWLlxgERKx+Gutk50omjIwmGOm33Sgd7cS7dZnA8?=
 =?us-ascii?Q?x+TAtPfV3cUBgSmDh0F5MHt0UwpFRkBc1Nt8i6RyZHj3e9GnsDkyFNx96/dM?=
 =?us-ascii?Q?rML61vnvs8wl+R0/Z1MyAFJK1knTywJbPcFJeUE5/clUBBNwH8xzOJd119Da?=
 =?us-ascii?Q?ICo1MzpI5ZUcA5N7aoMSgaejYt3B6dyVqWuSEwdGjaq1+w1NS/NXD/aHz0Jn?=
 =?us-ascii?Q?vkutUdkiDX5p/8rASfda1Tn5Q/q3wb+1NolRBNA1+tJRnvullUh+jVZiU7kf?=
 =?us-ascii?Q?N51tksXmbGEAWdhsMs9etf907hV+sVERnlOhPHni6pmSikFLeQI/Xz3UuPgk?=
 =?us-ascii?Q?UE+0dPS2EimHns+QNAGz9966ZeHMp5NdY0k0QBNpE2dZJ/Z68cDHHvy8nzjZ?=
 =?us-ascii?Q?awGNnbcNE4wWKoEca3AcVcQXTjjK5ckYTUd95VL1CaaThgS6EQInhOtMtRYk?=
 =?us-ascii?Q?z1TIfU/psBP+jpqahmux5It4sER+GTJgwdC5obaIciIIktRDQM38f9EXlHDe?=
 =?us-ascii?Q?LQjMPvOiSAKFLkV3M5Wy2a7cFB8FynhemEuHgeLspxCOz+Dl3k8Dd3rivEOH?=
 =?us-ascii?Q?cktZhp4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7E/OfZyY12IkJwFOjafe0m8SzvoK5BMhrDzM15S+ffBc0v4il8oebJ3ro7qp?=
 =?us-ascii?Q?SEt/enL2hxPRYJDITNpOCVQXFltiVB9YO9ECc2hOyehL9LX16EuZ8nX2WXa7?=
 =?us-ascii?Q?bdq6ZK+XsiZdqrQrN/3FxGTe9q9q/O4j5Lm8UnQY46s8jYiIJ0AAOO08WcPS?=
 =?us-ascii?Q?Xcf+VSXHTE3mmo9r5gmd4bXfKm2NfWiGPrLMb8+GiQG+uqyPCRj15/fE9e5x?=
 =?us-ascii?Q?s6Qp5PRWivFc7md6cyRhBzbr9O4nODWb3LjUje69swNmkqTBGW/zoaSGfcWb?=
 =?us-ascii?Q?UrUXqfqKJ1Bo8n04tsd83frtCA5p/rv36OfZSGk2Vno2vdsWMduqZgT2RD4q?=
 =?us-ascii?Q?cmWutf8ZodxrduY6uCV3NQh29dNS9KbD2n813jRJQadWSI+OqKwtXjXf1MRX?=
 =?us-ascii?Q?5YtMjUqs5ouQFIdxHNf9dkdFinVNIeHewHRsIP77kfQ06Y04N731LXLsh6Km?=
 =?us-ascii?Q?th81jXDEwCNUuZ82XEiZl7U+h1ngydBTTqiKxI2Lm4h1DN+07KfbnyyOfa+/?=
 =?us-ascii?Q?kIW+EpqvPWUUfjhH2aFw3GzG4Q3vyZ5aIyADPqvyL+9vQbNYa9Q5qeeNCS+P?=
 =?us-ascii?Q?be5Y+D7Ujh32U6Ej5YekQf9JDooSvrpuuUKrQCo+XJqH6gtzxOvbZ5Ju4Nkz?=
 =?us-ascii?Q?gDwUEIVr5SPp/QIvnljXGEzesm8k3CNU/R3M3CJ/qQMXJ9aA2I9SrXi66U2r?=
 =?us-ascii?Q?V2HiZ0ZaG11JaeaRi1MHJcZ0wlpNoBA48/pBZi5LJyG6x9n9RNp1vd1NtLnD?=
 =?us-ascii?Q?ojkHN605ku08SZZ+qvBNX8jntSoFq2O4FUEmlITD36BcLAZqAx04qwd/Z64B?=
 =?us-ascii?Q?yfeX5aSpkwC9+073qlxcjm6GwaElHOr/Ivl5dWJMrLkDOQxlTfSTRgvzG40W?=
 =?us-ascii?Q?r4COSJtx0CgAscOYL5b6eGUyW5tOLTPe7hMXILQ0UEkCyr7iiyBZMKsx3Qzc?=
 =?us-ascii?Q?B9RvzX30G84HYnMB49F5TTqUft8EatlG7EAe8P6fcW2/KUTjuiNEaGtnzmrE?=
 =?us-ascii?Q?olz9VimqaW51TwP2xdb6OLL0cSNjIouXOs49UDCbgCmGCph8CvT6+GI5GDnW?=
 =?us-ascii?Q?NIzoO8MM1qClm0zYjsLh1+8jQP6L6KsJ0EIkWh93JqoeKh3WkKkAV8xjganL?=
 =?us-ascii?Q?5ZfR+CJlOB4iWBDteyO61443oJwmnufQ089L4f8oSFxs10krZ+zXmBrDrdgu?=
 =?us-ascii?Q?3K0ebvR+UgI9p+zJx/iHDXfAlhGo/wckMNMeFIfSsI4AMsZenamQK0b2feJ4?=
 =?us-ascii?Q?es0r52MnB9tB2VM6iaLtZJYt20gQdxQIAkxU8m/9KknxiAqRSpogP4zgSIeg?=
 =?us-ascii?Q?csqibMYRKaOD9GPj6uwnFKymEzY5gj3xbZjgcy2HMH8WXwRTPVEvXwvQpuav?=
 =?us-ascii?Q?jX8i39SAPMXRBn8xyEon3rkkIaqb8PwlW/YFhGsj9BCSiodYAS6Y+MAAQP3n?=
 =?us-ascii?Q?xgOcdHzTVH0rJYBk/5k+I+EhCGrGz5G0GS6hmEkcTnuo+7hqSDWCqBu/hkmE?=
 =?us-ascii?Q?NGDnWwXzAxkxlfNjQhR/LBByAflJ4NutF+p+6pt1lIyAo1QPFUKDhOpRpwlI?=
 =?us-ascii?Q?2vH1+nDRRgN5OmzzJj8hrYr1qgfhRJUXGnbZa8zX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905dcfc5-4e9c-4619-6d41-08dcc05aaee4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 14:24:49.5410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wwnjiy/hB9KOCs/GWe1KGTfRbCTjRRFqBtSpSpx79J8xrWRGNBccwGfT2kA4DSgzl1K9Ltl3vd/5UzVC+6Swyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7408

Convert binding doc colibri-vf50-ts.txt to yaml.
Additional change:
- add ref touchscreen.yaml.
- remove standard pinctrl properties.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
  failed to match any schema with compatible: ['toradex,vf50-touchscreen']

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- raname to toradex,vf50-touchscreen.yaml
- Add Rob's review tag
Change from v1 to v2
- fix missed required properties
- use original submitter and input maintainer
- add value limitted vf50-ts-min-pressure, just provide rough range, which
not mention in original doc
- fix style problem in example
---
 .../input/touchscreen/colibri-vf50-ts.txt     | 34 --------
 .../touchscreen/toradex,vf50-touchscreen.yaml | 78 +++++++++++++++++++
 2 files changed, 78 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/toradex,vf50-touchscreen.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt b/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
deleted file mode 100644
index ca304357c374a..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-* Toradex Colibri VF50 Touchscreen driver
-
-Required Properties:
-- compatible must be toradex,vf50-touchscreen
-- io-channels: adc channels being used by the Colibri VF50 module
-    IIO ADC for Y-, X-, Y+, X+ connections
-- xp-gpios: FET gate driver for input of X+
-- xm-gpios: FET gate driver for input of X-
-- yp-gpios: FET gate driver for input of Y+
-- ym-gpios: FET gate driver for input of Y-
-- interrupts: pen irq interrupt for touch detection, signal from X plate
-- pinctrl-names: "idle", "default"
-- pinctrl-0: pinctrl node for pen/touch detection, pinctrl must provide
-    pull-up resistor on X+, X-.
-- pinctrl-1: pinctrl node for X/Y and pressure measurement (ADC) state pinmux
-- vf50-ts-min-pressure: pressure level at which to stop measuring X/Y values
-
-Example:
-
-	touchctrl: vf50_touchctrl {
-		compatible = "toradex,vf50-touchscreen";
-		io-channels = <&adc1 0>,<&adc0 0>,
-				<&adc0 1>,<&adc1 2>;
-		xp-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
-		xm-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-		yp-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
-		ym-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "idle","default";
-		pinctrl-0 = <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpios>;
-		pinctrl-1 = <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_gpios>;
-		vf50-ts-min-pressure = <200>;
-	};
diff --git a/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50-touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50-touchscreen.yaml
new file mode 100644
index 0000000000000..69da21d40e729
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/toradex,vf50-touchscreen.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/toradex,vf50-touchscreen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toradex Colibri VF50 Touchscreen
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+  - Sanchayan Maity <maitysanchayan@gmail.com>
+
+properties:
+  compatible:
+    const: toradex,vf50-touchscreen
+
+  interrupts:
+    maxItems: 1
+
+  io-channels:
+    maxItems: 4
+    description:
+      adc channels being used by the Colibri VF50 module
+      IIO ADC for Y-, X-, Y+, X+ connections
+
+  xp-gpios:
+    description: FET gate driver for input of X+
+
+  xm-gpios:
+    description: FET gate driver for input of X-
+
+  yp-gpios:
+    description: FET gate driver for input of Y+
+
+  ym-gpios:
+    description: FET gate driver for input of Y-
+
+  vf50-ts-min-pressure:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 50
+    maximum: 2000
+    description: pressure level at which to stop measuring X/Y values
+
+required:
+  - compatible
+  - io-channels
+  - xp-gpios
+  - xm-gpios
+  - yp-gpios
+  - ym-gpios
+  - interrupts
+  - vf50-ts-min-pressure
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    touchscreen {
+        compatible = "toradex,vf50-touchscreen";
+        interrupt-parent = <&gpio0>;
+        interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
+        io-channels = <&adc1 0>, <&adc0 0>, <&adc0 1>, <&adc1 2>;
+        xp-gpios = <&gpio0 13 GPIO_ACTIVE_LOW>;
+        xm-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+        yp-gpios = <&gpio0 12 GPIO_ACTIVE_LOW>;
+        ym-gpios = <&gpio0 4 GPIO_ACTIVE_HIGH>;
+        pinctrl-names = "idle", "default";
+        pinctrl-0 = <&pinctrl_touchctrl_idle>, <&pinctrl_touchctrl_gpios>;
+        pinctrl-1 = <&pinctrl_touchctrl_default>, <&pinctrl_touchctrl_gpios>;
+        vf50-ts-min-pressure = <200>;
+    };
+
-- 
2.34.1


