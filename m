Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFDEBA6582
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 11:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728176AbfICJh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 05:37:58 -0400
Received: from inva021.nxp.com ([92.121.34.21]:54534 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728122AbfICJh6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 05:37:58 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8FAFC200303;
        Tue,  3 Sep 2019 11:37:55 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 65B222002FD;
        Tue,  3 Sep 2019 11:37:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 71247402B7;
        Tue,  3 Sep 2019 17:37:23 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        daniel.baluta@nxp.com, leonard.crestez@nxp.com, mripard@kernel.org,
        olof@lixom.net, arnd@arndb.de, jagan@amarulasolutions.com,
        bjorn.andersson@linaro.org, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, stefan@agner.ch,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, tglx@linutronix.de, ronald@innovation.ch,
        m.felsch@pengutronix.de, ping.bai@nxp.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V3 1/5] dt-bindings: fsl: scu: add scu key binding
Date:   Tue,  3 Sep 2019 17:36:36 -0400
Message-Id: <1567546600-21566-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

NXP i.MX8QXP is an ARMv8 SoC with a Cortex-M4 core inside as
system controller, the system controller is in charge of system
power, clock and scu key event etc. management, Linux kernel has
to communicate with system controller via MU (message unit) IPC
to get scu key event, add binding doc for i.MX system controller
key driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
Changes since V2:
	- use "key" instead of "pwrkey" as the key function can be defined in DT.
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt          | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index c149fad..5eab7d0 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -157,6 +157,15 @@ Required properties:
 Optional properties:
 - timeout-sec: contains the watchdog timeout in seconds.
 
+SCU key bindings based on SCU Message Protocol
+------------------------------------------------------------
+
+Required properties:
+- compatible: should be:
+              "fsl,imx8qxp-sc-key"
+              followed by "fsl,imx-sc-key";
+- linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
+
 Example (imx8qxp):
 -------------
 aliases {
@@ -220,6 +229,11 @@ firmware {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
 
+		scu_key: scu-key {
+			compatible = "fsl,imx8qxp-sc-key", "fsl,imx-sc-key";
+			linux,keycode = <KEY_POWER>;
+		};
+
 		watchdog {
 			compatible = "fsl,imx8qxp-sc-wdt", "fsl,imx-sc-wdt";
 			timeout-sec = <60>;
-- 
2.7.4

