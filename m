Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759B1A333C
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2019 10:56:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfH3IzR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Aug 2019 04:55:17 -0400
Received: from inva021.nxp.com ([92.121.34.21]:45884 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbfH3IzQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Aug 2019 04:55:16 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5B1152003F4;
        Fri, 30 Aug 2019 10:55:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 571362001C0;
        Fri, 30 Aug 2019 10:54:56 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EF46E40281;
        Fri, 30 Aug 2019 16:54:41 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, hsweeten@visionengravers.com,
        tglx@linutronix.de, gregkh@linuxfoundation.org, stefan@agner.ch,
        ronald@innovation.ch, ping.bai@nxp.com, m.felsch@pengutronix.de,
        andriy.shevchenko@linux.intel.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 1/5] dt-bindings: fsl: scu: add scu power key binding
Date:   Fri, 30 Aug 2019 16:53:45 -0400
Message-Id: <1567198429-27886-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
system controller, the system controller is in charge of system
power, clock and power key event etc. management, Linux kernel
has to communicate with system controller via MU (message unit)
IPC to get power key event, add binding doc for i.MX system
controller power key driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index c149fad..001d0b7 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -157,6 +157,17 @@ Required properties:
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
 
+Power key bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible: should be:
+              "fsl,imx8qxp-sc-pwrkey"
+              followed by "fsl,imx-sc-pwrkey";
+- linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
+Optional Properties:
+- wakeup-source: See Documentation/devicetree/bindings/power/wakeup-source.txt
+
 Example (imx8qxp):
 -------------
 aliases {
@@ -220,6 +231,13 @@ firmware {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
 
+		scu_pwrkey: scu-pwrkey {
+			compatible = "fsl,imx8qxp-sc-pwrkey", "fsl,imx-sc-pwrkey";
+			linux,keycode = <KEY_POWER>;
+			wakeup-source;
+			status = "disabled";
+		};
+
 		watchdog {
 			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
 			timeout-sec = <60>;
-- 
2.7.4

