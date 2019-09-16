Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6EADB3388
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 04:54:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727688AbfIPCya (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 22:54:30 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49648 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727510AbfIPCya (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 22:54:30 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id ADBBB1A04FF;
        Mon, 16 Sep 2019 04:54:27 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5ACFC1A01E2;
        Mon, 16 Sep 2019 04:54:09 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id B8AA5402B7;
        Mon, 16 Sep 2019 10:53:54 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, fugang.duan@nxp.com, peng.fan@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, olof@lixom.net,
        mripard@kernel.org, arnd@arndb.de, jagan@amarulasolutions.com,
        dinguyen@kernel.org, bjorn.andersson@linaro.org,
        marcin.juszkiewicz@linaro.org, andriy.shevchenko@linux.intel.com,
        yuehaibing@huawei.com, cw00.choi@samsung.com,
        enric.balletbo@collabora.com, m.felsch@pengutronix.de,
        ping.bai@nxp.com, ronald@innovation.ch, stefan@agner.ch,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V4 1/5] dt-bindings: fsl: scu: add scu key binding
Date:   Mon, 16 Sep 2019 10:52:49 +0800
Message-Id: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
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
No changes.
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

