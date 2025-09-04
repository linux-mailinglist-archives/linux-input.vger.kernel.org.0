Return-Path: <linux-input+bounces-14495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D4EB44641
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 21:18:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4263AF519
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 19:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4155926B2A5;
	Thu,  4 Sep 2025 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="W3kT/4yF"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFA133997;
	Thu,  4 Sep 2025 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013477; cv=fail; b=BszcoJPCUhw0itsYTR8MIYAE0WUYSHYQpAxFeoreC3JAK1KeeKygpFxijUF8MuMXUABtJ3UKv0Q3rSH10Df7nA2AYGCssCHUEsvxCG4s+QIK5rBJFGwZAyCzEGkHSrzN3AFiwfbPI8d3y3fztM/QRFjIz0lLIay/l6oRkUanBAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013477; c=relaxed/simple;
	bh=9KHECr3ZWAHVzlnSTgvLLofk4oUGP+lEURv77B0JzcA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z9oL/YCz1OmN+ryGNO4NfnaRjMSQT2aE6kpC8ZYFoCeZlcl4sAOKByxzklmCxqVyiDOFSvEfTJGZGOYK/KRON2YZbpkDqSElFFN5iZ/9Pry8ZtvwjOY4GLcwGFQyKHHFT/aOcUUTo9PeiOWyYGB3bzld9aVN0CWQQPDzRa25OTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=W3kT/4yF; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS/8aW7Ra0guEUJzJxmU8VQVSKngg9u6p/xA06+N3DZ6zBJNdGgUMplo152fHB5x3thztzh9OnJkxDaIYg3ACacQBWZHmEJNiq0hqjfNBC0cI2YUI6HEJeq9WmxLrxW98wgTMHyFw/ssDZbG105uHmQ1ZdYR4lyXFdYLr1CitLv+JoYCO7UzmVkT3HRRn/X2O7Vfr+0stYm6EYil+yjNQwpZVdVbWdNJJz5rMzpxeNKh58HW62tRU7I5MylGjsHdnWFdLmoh0IPb+KAHnNEZShgj3Y0W5zZMDcKqRNK/0l8kSH4xsOvLTKeWRhiqqileyFrYtMp41dyBNXH3Bnzwmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27zOo2ZKcZnsqmeaHbzbrLJKeh5MnWeclC4nBRsiwgU=;
 b=fXFkvDDmhPAZiJuZ/GBJZ1+BaRVqao35GbRU8/rGTkXGARG9II5ZeETBdAo+mXhWev7KxO8fD0XYoMhiJh4lOyhNbRyC/EipOFSPASt6feti2wm+IT7bgakuWqzttPsbTtUfDhZfmuooFMfe+ZndoMst1fQ6hHUeqe95GFdTf8JFXasryEONPRx+jUDGbad7lachtz6efOiGuktQFdft4Nwp+U3cPGnv1cSirlIWHmu+umxfqrCWaggeQDyea08grWhZVqb6PaTn7/rnpPaH7SEL7RC2HxTlxnDiIay5GScZpEyJ4Z8Pq4ABr2Peg4ByjwoxNBZkF3+jZS6kGA7V0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27zOo2ZKcZnsqmeaHbzbrLJKeh5MnWeclC4nBRsiwgU=;
 b=W3kT/4yFsccc+s30xmRUw31/lxgFTUkqtaCzsQFsSddZmtneV1y1kPBqB9n3RxtNdSZ7GEke2YpjS2y9P83G7vVAQhaZuQRrWgThIn8R3LtKqFKg+qYbaPjKcF4Qaw5H8Iq2ufDxocyQzEKSa3vP/3+xRSG1By7dB84pf0u7RSglsgljBpI8ICRQlhS97VcfqjgzbnAhQzocw0kVmOvqt0Lxxf/wk6NURPtyPFDAhDOT63xiFCYCRyMb/TqSiOT3XVc0Mx7EyQyrQZQgcFV8X3LqJ1CQ1CGqyljW+HAcGCVBLoe+1kFA4dSn3MWFlRMfD2EINwQJzrdb6Z2Zk1VpWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM7PR04MB6823.eurprd04.prod.outlook.com (2603:10a6:20b:102::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 19:17:51 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9094.015; Thu, 4 Sep 2025
 19:17:51 +0000
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
Date: Thu,  4 Sep 2025 15:17:28 -0400
Message-Id: <20250904191731.528145-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0036.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::7) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM7PR04MB6823:EE_
X-MS-Office365-Filtering-Correlation-Id: f1ce96a9-0e71-46f1-a988-08ddebe7bd5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ETxoHfJ6eFH3Ax9PjyRj5gVmhHtH+nBI4IG3rM6wV2DTHZbDuEf7rBssBNJB?=
 =?us-ascii?Q?p7T614PXhBB/1UrNId+/TxIGZRH38t0F/e3NtZuoj4GC3QTkcvIPtGVQhn6K?=
 =?us-ascii?Q?wNtYnbUqX4eoTIRbn9M+TTog3vOX8/X0Bq9slsmFm1nRjMDobVqotAKaE9h3?=
 =?us-ascii?Q?a+0JMhN4eWz34L/uIfVpYtER31ABwi1LyklUpr3XaPQsAD8gABNowOXDIcfl?=
 =?us-ascii?Q?GPVZFuB0kNfdI/xzPAro8P6WUvP+qkc+PYpbEO1FQKPehuUfL7uQirvYxBOH?=
 =?us-ascii?Q?Q1Hlv3HLAeGNnyS2Hwt26I38pJYHfi75ngHCP85AIJcTFMqLRVTnxKFYpQmI?=
 =?us-ascii?Q?1y0Y3FlN8HINOCBnvENlG06hz7OdyFlC56WkTwrAACIqLOVrhD1nXmWFLNdG?=
 =?us-ascii?Q?m08Nk6ViZLP8DvHTGuiGCXvMb1p26C9w8mFUDb3MRZPsI3sa7A4a3D5g0ZAb?=
 =?us-ascii?Q?8T3wFjdNlVdHsYipng9fCKq5PSbFb5yYQaOGMJyXW5ktEfLLu0/pr27px3AE?=
 =?us-ascii?Q?co43Dnwh7RSXlN07kLJj8CtZtdA4dE0pTtR8ABVDvepbTAPO01lRALLZ9Fjl?=
 =?us-ascii?Q?ZizjZiyjGoWVHiZQI/b+37BVrWsjn1+QWLmL8FZkFdaAkJ4FCNkJYbo9ZOZQ?=
 =?us-ascii?Q?djol4j28up06An0j7BZJHwE9kkre1v/TwOX8nJGKsgzimQHqIZ4dpbVmidEc?=
 =?us-ascii?Q?01eXixaq2tkARqofEHbx0bEPU6O/C3NHQ5ThjRdogopMN9fQvTc7c6rFuy8v?=
 =?us-ascii?Q?Uzay2wyHsVOyO4QgMa5LlQzqj4/EljOKmyULqIE57pV6vtRCh1ATLo6TF7BW?=
 =?us-ascii?Q?M0wSaUHdyhbh227V0kjAbk6HGhp01poiDwOsRf4/VgUaPTOYJfLwRhrHy9MW?=
 =?us-ascii?Q?FYMyZJ30TMMeh5BMU9OcoKLLiCPquqkeOSdYg7qLP2OdZ58sE3lXsjsdqGy9?=
 =?us-ascii?Q?EsI3+CEDthP/Jhu0MyDjyibWP+YAJNOUZO5xQYn89iy3BlDc812ePBP1qY2o?=
 =?us-ascii?Q?WdzizA6aLl0WNpcvWgMPgQ7JEsC6Ga3BdoyM7O5L3/Skj/Ln9rE41B0gAbQJ?=
 =?us-ascii?Q?rFM1nb/jNAFPES6R19u3aOCd6o1cPtpV14yEKkhES9GbAsGQoL0CtdzuKsEb?=
 =?us-ascii?Q?63SagVmeIdo4kzDXVJiwtqUhdEp9kYVaSYLo3AIwO+W5ePqrJ/zxeNR/6yrk?=
 =?us-ascii?Q?HtMCpTBfXR0kXxmB1WsDPdH86L0b5GFWTjgjZSTH+kstPfJSuNAj2aV6o2ru?=
 =?us-ascii?Q?auOWNpZ4M5QWPhYMqDb/fVgjqVph+mkqhuivZKOInNinVbXdqOKbLa2lI92o?=
 =?us-ascii?Q?6WXRL7ZHR7dHrYvQ/GYqLZr8yIMpOCnAX3pS36YnEUjXy/yzmKt685lLgCu7?=
 =?us-ascii?Q?CuCSDinExmUMZdSw5t2lIZylYD5LKd6x3Slyb8n5/55z0d8UY6hCwRoo84kY?=
 =?us-ascii?Q?gY/rScOpTZIz5ZiZ97L4ob1E+/iYXC4u?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iQokV5BI7Tu+PMz7VlcbQrPWiolFIE9AJU4f9M7rN96xuopke8k9X7OhjjNF?=
 =?us-ascii?Q?vqAGHlF0/zQ3wMpnlu2vhW3CVqlFbR+Gya1pscCprggfHTQtTF89sXSt5Bbo?=
 =?us-ascii?Q?QSAdsx2JJvSzCWUOarbUsa09J0B63JiLEAuOsdRxoh5g4BLQx+i7m7lse1yD?=
 =?us-ascii?Q?4luMmERewSiw64Ay4PKbS27Uc98ZJf3VdPkY7IRZ/s7QIyL52mN4EWpoEVVn?=
 =?us-ascii?Q?mfXemDUZqscfTbqI78aWRMF8W4nf8IYm3RkLR2nvjV8AtlaUEwZgKX1XFaZf?=
 =?us-ascii?Q?+r9ejctW/Ncj1P9PA09dCjc8AVTRjumHidy5223YRavjfbVrRliWoUv6dfPb?=
 =?us-ascii?Q?MHHAVjXRifvNpimHX7bdSFAuBnhrYSH2YKzWruI5ETiY6Wm58xELnb2YaWmY?=
 =?us-ascii?Q?jJD4l4cSBr38zbE0ZQRcHJEJYmDRwtasBUeai7GyT8Nk5IInZNjA18S3vN/y?=
 =?us-ascii?Q?vrrhzZ7fRf0Tj+61bEsFm+yQxpsz8T5AySg9E/anxaV0tmeZJfDJvFeFjSdR?=
 =?us-ascii?Q?DL2Z1mYM66OXOTznTm4OnHMrGL1y10rjB2EWT8wg/d+D9h6DkftG7FOYE1Rp?=
 =?us-ascii?Q?IQlVjkKJGW21nwqFDPw6nMSesaV6wRNLgTltHWjbgAbrRrdhUd9BTSjXtZNP?=
 =?us-ascii?Q?Otr71iUeu8jvfkYjbA7Zg3vUfAtmjMCuVDWgjXzkwl4ZbboFZiTa2ZrRz6NT?=
 =?us-ascii?Q?exOwMuwwp04C3Iyy3MixaemH+sBcEXSSgTJm/bhKFUv0T3XUMfH4kQ2M4J2o?=
 =?us-ascii?Q?mqjcBwSPccI7lHw60TF5lRadYWsNCLv5NrWoLOfdOEmqRlQY6JnwRGvjyyWI?=
 =?us-ascii?Q?rWKBtoE20uQOuoZPYX2x19aoknMiDftWDZwsQXxADMEKoNl7SNb75OUmwg6T?=
 =?us-ascii?Q?klb2s3KMgpuh6IsdWX9p/yhZO/NWIL2JYIaGbh+kql5gWjUelFuq+dqVQbDY?=
 =?us-ascii?Q?ukgd6RXFVXXJ2hB2T2KEs97WkvnZUYr+wUhBHHGf8g7Y8gWM/+P0t2OfUmHP?=
 =?us-ascii?Q?XPl1xSi3sUuk8R6gq68DFh/YrvKgwG60jmB2oTUM0cgKnOLiGlw+WMIzcmSn?=
 =?us-ascii?Q?jGgvVfB0gppUbAHJTPWRVkJ6BczWtHe2i98UOhA9vjBYVIqDhtPdObmpKtMk?=
 =?us-ascii?Q?5HeOH3/CcWCkdbMaAi/vc1dVhYp3y+WtMtlt4P2t6jsaVnXD8n+QIdq1Zk/B?=
 =?us-ascii?Q?bcyiiSiyen+9ekr5n9aGNvdlLaQbiabKKgHgxPsCtpSHuslDOVZ33XmHmyJT?=
 =?us-ascii?Q?wlVsbAwcszX7NXYc4cXRpHDXtZKhCrIfWcuBtOlWMSCnwLxVk4mDuXnWx7IF?=
 =?us-ascii?Q?9i7x0kLk4o7UgcSP2mikpoGTH/A1YxxUXwSvGX2Tvda4ha85d45FqzNpN365?=
 =?us-ascii?Q?S4eUupishA6PH5MNa9OhFD74dLZ/7vDYUG9x6xv8EPKtck14+boiFsXOm5t0?=
 =?us-ascii?Q?zHRfl57CfzPxCfdNc5pTnTC+sBcQtmwqF5kQnssQ4JuSZpT0aOg794ehm5lQ?=
 =?us-ascii?Q?yysywfiDnyHYFSf2+m4FDeyH7MeYTD25qZjOFepcwSBYdZBoDKHIxWks9yfd?=
 =?us-ascii?Q?keuI60JO+4Lmo3KuGeduXW6d0WSe8APdO3WWz84q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1ce96a9-0e71-46f1-a988-08ddebe7bd5c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:17:51.5177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M36QT9Wr4MiDtKg/omxqR0uEYyRp8b8Iy+NzgrHsN8XLRlDmWmLtvIUDCRivJoR6xfdbITaIbvcqzJOQhWWaUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6823

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


