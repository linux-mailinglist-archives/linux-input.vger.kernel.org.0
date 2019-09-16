Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2F36B3394
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 04:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728535AbfIPCyu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 22:54:50 -0400
Received: from inva021.nxp.com ([92.121.34.21]:49588 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727510AbfIPCyk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 22:54:40 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F3F06200518;
        Mon, 16 Sep 2019 04:54:38 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7172120012D;
        Mon, 16 Sep 2019 04:54:20 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 39AED4032B;
        Mon, 16 Sep 2019 10:54:03 +0800 (SGT)
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
Subject: [PATCH V4 4/5] arm64: dts: imx8qxp-mek: Enable scu key
Date:   Mon, 16 Sep 2019 10:52:52 +0800
Message-Id: <1568602373-14164-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
References: <1568602373-14164-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable scu key for i.MX8QXP MEK board.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 1946805..88dd9132 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -234,3 +234,7 @@
 &adma_dsp {
 	status = "okay";
 };
+
+&scu_key {
+	status = "okay";
+};
-- 
2.7.4

