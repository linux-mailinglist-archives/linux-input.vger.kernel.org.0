Return-Path: <linux-input+bounces-14494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37624B44618
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 21:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6785836EF
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 19:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37ED6248F5A;
	Thu,  4 Sep 2025 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jh/cdLkr"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C121ADDB;
	Thu,  4 Sep 2025 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012661; cv=fail; b=NmP9oznZ3U0tNKiaOXx27loRkXcbHnDFu/YXy8UTgmAI5MqQFXDllBFD0VHFFhCk7ymmC9qOW+qylMLr1rBDhBYR+fenh8jdfHmvDQzsQqzoF4wKSo3HZaYFkbLf6dHhUW6BC/mKRxOa7pSbwsEKFZpEJ3f8DNsnCOG3Y9kqiAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012661; c=relaxed/simple;
	bh=9KHECr3ZWAHVzlnSTgvLLofk4oUGP+lEURv77B0JzcA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UKAkFysfvA+CQP/ffIbR8+VPxWsWxgWE5MgZ5BFWDi5e3mBy94Ocz9ao1kPI9A+7zN8mME98ENGMdl99ysscfsx5CvCbrmXlePOdqnlmehLsxp6CeMCCkwMUDqX+Noy4aH1d10/FTIAhctXjf8UrKJrDTXsBsUsBMlwJmoXJLIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jh/cdLkr; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPQQVb8ilH/3x0GFPAnW7nmFgzrLsYLxd24LEOZXSAEIIMpaMrLvoejG4qLGdnkEVYBknVXCillgiQpI61CD8GPZ3tXzQudZnWmXge0V5BmeGifqQ8YVfNz39HJKIiywAhJC3rujH//TPT7KrLSaayw+dAtBSXMmngHcvZmAR8vhPhKYBwcRrYxYFnjcFecZn411eeNzhHtVGR+4E+7SmaRF7s0snjVkmTI5yOtNpWleyM2enDiqmXpvT1Y6KTPcOFPq4C1EnhNCTukgkWAGJ2rwhxxKJJBumOSVEglZivWqPEwC9Rs2+20Qa1ULrUHG/t0J0nMcX5mAJyFofHfJ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27zOo2ZKcZnsqmeaHbzbrLJKeh5MnWeclC4nBRsiwgU=;
 b=elkeX2TRcV33D9ZkfNKgRnihCJE122xaWorM5UJsennBlqyhcO5uk0+pgUX+g+ZYkiqXhrnFwig4aWjwh1t4k/tRPswEhNG20DOqhoEH5L0xHCWByqhejOI4I1sOHi9v0DmyK5+QshyTxN61E21jnbJ/kcVvXkODXTDEHPh01y6b1MbemMDf34Dqjinj/CfT8iMH+b3MC3iEW4xJNtL7q+ukbeSS/WVf4sPxua1+jSBKe3t/X6aqgBUVkCow+/OD++y1aVywWKeU1/EdzTo9k0yJnqRYfDbx+fAGpZgqFilWfMO2mdDGJZ147GInlXgmafglSt5bz0RYdehTkhJoeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27zOo2ZKcZnsqmeaHbzbrLJKeh5MnWeclC4nBRsiwgU=;
 b=jh/cdLkrud+iUSzqtKfCuYysuCvg9HB6kY4jQP9g05zjoK07h30d+abVwhfc7mXJ87rCzqp0eGYVlwn12qtKYiD5o8rJ7TF0jX0Xu8uGKh/qjvon25y9Lv+NvHM3e5Mmueh3s+NW9ARo6aoAYKepC3bknkF6DiXVYd6WbX274ax110KX4/QCDdOLcUkH2637bVVQs4S2IXUo5DnxnVi/JWgX4ulwZba/f9eHzzt52G/PTP+V8gpw43hphOziRZ+CXAN4JA7vxKACW4dIbjI+HbMJoy+4WqYFig8D71sRP4m0ZAjLRTkJd7UyzFIeN3ku52xwyYtLSmKO7X/gCU9XQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7841.eurprd04.prod.outlook.com (2603:10a6:20b:244::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 19:04:15 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 19:04:15 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: input: convert semtech,sx8654 to yaml format
Date: Thu,  4 Sep 2025 15:03:56 -0400
Message-Id: <20250904190401.524052-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0077.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::12) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e977162-af1e-4075-8027-08ddebe5d78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LPiwYsw8gmm0dp+4rIT2BqQKSg9XUy5qbxc9q3P1oAptXOna5bE/fUTiCHrG?=
 =?us-ascii?Q?bIrczLmmeJtyVWrPKIMkAUhQLK8g7Oa5pT6fXa2T8uXEASB81Jl1/CDqysW/?=
 =?us-ascii?Q?BVJHu9ThOuY4Qi4qfX0ZMDqA6LfaJLRbz9UXKeK1Gcf1ul8YgRS2Z4gkeGzt?=
 =?us-ascii?Q?dS+bg+YI5ZjIbmhknEq/UWEZ9jewGp0mxwwZCPD2+4OuwwqzIo4GYqS2bEBL?=
 =?us-ascii?Q?J9dV6cpdXexjvxrlk2C6fo9/OIyZme+4q1irpJUyH62Ap7SflcMceVgDgA1Y?=
 =?us-ascii?Q?j+5vzSMxA8R2b03GZQheofjOPc2KtA0dWdGh1pn7F+R8jnTH75dYzyba4sDm?=
 =?us-ascii?Q?mKHI1d/5KHebfEyQO6//RdkHzH0A5gQpdfmPjt5td47n/0/qov6fGlE5tJOp?=
 =?us-ascii?Q?IYZXO2jKAvNj1g55kEj1ue48H6HKIZ5PZ+IjsVM8KiY4gdzWJCCr1yKfcTJl?=
 =?us-ascii?Q?wK2Bx66xv1KMBAJoht0d7WdAIJVZZC5ET/ntlRB+7lLiaqfmujzXp46IwyW8?=
 =?us-ascii?Q?NY8E67/uGMFkKS/jrwNx19nLxzS3wuv2Lnrhl/4kJgA9O1orJB+srbB7Ow+G?=
 =?us-ascii?Q?IoXIRHoGfZhm+FSsi0PiwIdvKoWpr8OlN6R+Wt5Oimf0Sb2jgtLTVACJ0g9T?=
 =?us-ascii?Q?gBk8A1dgTV69k47saaCbpzvqX250L6MXstSebwmLITsUGT8XQcVELoKjgxtc?=
 =?us-ascii?Q?i49iLAUws9Fen5mIZEZS6zhfAFSIT8X8pTfN4OclIc+KwCGLxAYgyQ2LmDMq?=
 =?us-ascii?Q?GNTGNOz2IpcWFvXqteZhYR9r2Pgi7lsCuX8/gHxL6v8syDnPkJWqeDKuJ+QN?=
 =?us-ascii?Q?fTvhzbxKBLhHiuPiyzR112i/U2yzqpfeEynrLaoGkNQUBn4MTgk7Auek5yDr?=
 =?us-ascii?Q?juq8Y7WLHDXOUCajz0e/Pb1Z6UPv47FKd8g60Tmv8v3CRLsdXQITWu0ajCSs?=
 =?us-ascii?Q?+mrh5/UeGl4S4E6333UAsKAg/CL02kpFmLbndxcsYZYcNtTDmmfxw3sMm1uZ?=
 =?us-ascii?Q?/T2szwoT0DMZ3PRhnMTqfEUIQxCtwfq9CtCot2UpzDzkYXptd/cOoFLK1Ar+?=
 =?us-ascii?Q?/WUmt+hAXW91pOt3DlSpC1KsTo30bncqlpmGLcEHM63ZH0VntVxerFW4k0Qf?=
 =?us-ascii?Q?x/ehT2Ie+EWln2a5CGOD7zR0vjhnJyQn9CimHBz0W6dNaL0kmrP9ye+ImLVr?=
 =?us-ascii?Q?Gxpbv5QCmt+KaNBE47wMreMkCGkvSz7gxvCsLoAPnoO41c5sfvmcssM7BgXM?=
 =?us-ascii?Q?UR5PQGVwuAcT6i8wUYTlsQcOjzFPtQxi/AEVKNwGQf8bXHOdBmK7jgYsS5sX?=
 =?us-ascii?Q?sjEuayY1dBd7MeJeRmwgetbYx66DPyx7UUeDOIrNgdog0xUFAG9f+Znxpq0r?=
 =?us-ascii?Q?rNCW977fkCe8fe65BdNVtdYHQ93a1P7LwnqdfX5El9EO309OUHzOKO3O0kEs?=
 =?us-ascii?Q?xebpvWPRv+VA0R41zhw4rvC4bK6qJwBe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V6WI4M5zG/kkOIRoGx+Qq5Tx2toRj7goamSwpVS7hdMVA3KP2dTMZEXRnwoD?=
 =?us-ascii?Q?2lCob/rfFs2d8T7FeQGMhCqKegRUFVCKNx4CiY3O+AZzdr6yFMRUiPD8ejBF?=
 =?us-ascii?Q?1rrUHIRsfruNWopXDR2XwE5OPVZtqLhoSyF4M/iLb3HOkmgYyp04LxdthciC?=
 =?us-ascii?Q?hfzOgHSccer3128wHVl6ydcch3yJwa3tWBMFohnXFtvuk1rooHZSw2+M+VMy?=
 =?us-ascii?Q?PpUw8imkJbPmCMzMjANe3txcUnWzYzISsmw807eMh2bmUANMgXHfBWBN2QmC?=
 =?us-ascii?Q?wnwgiRMF8L85dj57GOm+oem6xRYWmyd2cDZiJmNLL0cw+Q01doVMPATy/SWK?=
 =?us-ascii?Q?sn08QXB1Bmow6iR0v6Kv+UYwrAHe7e7wPyY+z6CLZ7bGV6/Xb9wHAekifZK0?=
 =?us-ascii?Q?rLcf9CiVSnyVXSwftjwypF0Y5yLFlOUcG7GU0v/tBRaZa7NdBbnDXeYJPRs0?=
 =?us-ascii?Q?Apxg0ObrXOlj7GK3V7N+IBa/+MK8nElpeXGmWnjFvSyyOffOv+WeMZcJGxrd?=
 =?us-ascii?Q?Q474tMDnjYSGrwyuRlcBAZAP2bXrprfhFIDamPP+UV7FHkEOkRMnfYDy1/NN?=
 =?us-ascii?Q?DuGJEkbgYCVE/EsWVoet1TWBrxVu7GhERxawQBG/i8nxm7NBO3djfimW8nmW?=
 =?us-ascii?Q?EyiZyobiFNtZxT9uH5/1tYN0Gyu2u1f88OsMo6lRCkQ5g9sk/x8j+mk+5DWP?=
 =?us-ascii?Q?/iLW3Hc5EslEzYqki/F4OZB8rPstVCQv20wc9QW0fVlo9/e+LEz+EvU+TKj7?=
 =?us-ascii?Q?juNRp7ioWOvSU8zCiO1cNJk+p5vSgKKRt99kiPg22SlPfmnRIm9fuoqrNUU+?=
 =?us-ascii?Q?EVrpHIEA2Yk6yRr4rLCVdvz/KrzpCmbdQXl6IxBcRQkRPxzq/aOMmeJlGxzy?=
 =?us-ascii?Q?ZoZKvBTQE6UpgzTPzowF/FdAtlXtyIfD1kz0YynZKtYhA4Jx86lxMsZkllsM?=
 =?us-ascii?Q?cUEEfIKkixWL08VAQFJrvTNVXxagkJIaQ+LfqyRO4P39dpClSORT6na+iQY5?=
 =?us-ascii?Q?jBlmvOI9ws1OdfK9Z59xLEhgE8Uh3nCs8DViyHg3gxXdshGuu2GLn5+qNSMC?=
 =?us-ascii?Q?RbjtBhGB+UxEyqlCVc5ALg0mt54/2ub/4B92rc3y2dciKhwrI81x1yqo+4DK?=
 =?us-ascii?Q?t3rft9RMYDx50/XPigBysluZM12AoNk8qQI1/oG50U/CqI58MonyoE1awrC6?=
 =?us-ascii?Q?HRt5WmmKrPgrIGyJ+efmw1lIHACoEbfD+0Cu5Md05Z6g+fV2Pp/HIXj/1Su6?=
 =?us-ascii?Q?MD9qoC+PoQjjiuA3FRafColvo4S2ZgNCCEghcwpYxoIpIUGSLiHoci41bVlw?=
 =?us-ascii?Q?iaY3n+cs9TmO8AcqYEGyT1xyZMk6nhyxzSlGmeqYhqkw2k1aGTXAxny5uviR?=
 =?us-ascii?Q?9SPkbpadsEyXOxWIcdonuVDrVF1rYc7Pj4vR6TI9ynuXoY8RsAimr3G/bv57?=
 =?us-ascii?Q?zvSL/wnTeiUh6JDt2CC7BY6YKNpkJ2MgK/QH2aLJp5e7dKUgNSNb5WqsHtf5?=
 =?us-ascii?Q?5kt+JQlR2gfckdc8okTem8RFBawdymA/UmW3FDlCOF319mhUgVz1/uMHajTt?=
 =?us-ascii?Q?1eGE8eiFfhEGW7ZaAOy5LY9mCxS4Mj7WwD9mZtx4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e977162-af1e-4075-8027-08ddebe5d78a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:04:15.5070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0zZR76oPOCAi20f8DHNjWnkvIGbxZg2sp/KAwFKGi6IFFj0pzwpKvoPkmMo5djcFAgE+rSaodVdWxo6yIMUyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7841

Convert sx8654.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../input/touchscreen/semtech,sx8654.yaml     | 52 +++++++++++++++++++
 .../bindings/input/touchscreen/sx8654.txt     | 23 --------
 2 files changed, 52 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/sx8654.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml b/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
new file mode 100644
index 0000000000000..b2554064b6888
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/semtech,sx8654.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Semtech SX8654 I2C Touchscreen Controller
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    enum:
+      - semtech,sx8650
+      - semtech,sx8654
+      - semtech,sx8655
+      - semtech,sx8656
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
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
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "semtech,sx8654";
+            reg = <0x48>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
+        };
+    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/sx8654.txt b/Documentation/devicetree/bindings/input/touchscreen/sx8654.txt
deleted file mode 100644
index 0ebe6dd043c7b..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/sx8654.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-* Semtech SX8654 I2C Touchscreen Controller
-
-Required properties:
-- compatible: must be one of the following, depending on the model:
-	"semtech,sx8650"
-	"semtech,sx8654"
-	"semtech,sx8655"
-	"semtech,sx8656"
-- reg: i2c slave address
-- interrupts: touch controller interrupt
-
-Optional properties:
- - reset-gpios: GPIO specification for the NRST input
-
-Example:
-
-	sx8654@48 {
-		compatible = "semtech,sx8654";
-		reg = <0x48>;
-		interrupt-parent = <&gpio6>;
-		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
-	};
-- 
2.34.1


