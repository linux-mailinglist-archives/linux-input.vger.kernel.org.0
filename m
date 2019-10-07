Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE13CDA34
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 03:44:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbfJGBoj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 21:44:39 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40684 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726779AbfJGBoi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Oct 2019 21:44:38 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4E2941A05EF;
        Mon,  7 Oct 2019 03:44:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6CC671A0939;
        Mon,  7 Oct 2019 03:44:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A5C504032B;
        Mon,  7 Oct 2019 09:44:04 +0800 (SGT)
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
Subject: [PATCH V6 5/5] arm64: defconfig: Enable CONFIG_KEYBOARD_IMX_SC_KEY as module
Date:   Mon,  7 Oct 2019 09:41:49 +0800
Message-Id: <1570412509-7893-5-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570412509-7893-1-git-send-email-Anson.Huang@nxp.com>
References: <1570412509-7893-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Select CONFIG_KEYBOARD_IMX_SC_KEY as module by default to
support i.MX8QXP scu key driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c9adae4..9062d57 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -314,6 +314,7 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_ADC=m
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_SNVS_PWRKEY=m
+CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
-- 
2.7.4

