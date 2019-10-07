Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A6CCDA30
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 03:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfJGBoi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 21:44:38 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40650 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726739AbfJGBoh (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Oct 2019 21:44:37 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 756EC1A00CF;
        Mon,  7 Oct 2019 03:44:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5ACCA1A05EF;
        Mon,  7 Oct 2019 03:44:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E4AFC402EC;
        Mon,  7 Oct 2019 09:44:01 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        catalin.marinas@arm.com, will@kernel.org,
        dmitry.torokhov@gmail.com, aisheng.dong@nxp.com,
        ulf.hansson@linaro.org, peng.fan@nxp.com, fugang.duan@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, olof@lixom.net,
        mripard@kernel.org, bjorn.andersson@linaro.org,
        jagan@amarulasolutions.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, arnd@arndb.de,
        andriy.shevchenko@linux.intel.com, stefan@agner.ch,
        enric.balletbo@collabora.com, yuehaibing@huawei.com,
        ping.bai@nxp.com, m.felsch@pengutronix.de, ronald@innovation.ch,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH V6 4/5] arm64: dts: imx8qxp-mek: Enable scu key
Date:   Mon,  7 Oct 2019 09:41:48 +0800
Message-Id: <1570412509-7893-4-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570412509-7893-1-git-send-email-Anson.Huang@nxp.com>
References: <1570412509-7893-1-git-send-email-Anson.Huang@nxp.com>
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

