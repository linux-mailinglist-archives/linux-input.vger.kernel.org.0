Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDD3517C227
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 16:49:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbgCFPtS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 10:49:18 -0500
Received: from inva020.nxp.com ([92.121.34.13]:53034 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgCFPtS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Mar 2020 10:49:18 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 004B41A0BC4;
        Fri,  6 Mar 2020 16:49:16 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 700461A0BBD;
        Fri,  6 Mar 2020 16:48:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5449E402D5;
        Fri,  6 Mar 2020 23:48:45 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, dmitry.torokhov@gmail.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        rui.zhang@intel.com, daniel.lezcano@linaro.org,
        amit.kucheria@verdurent.com, wim@linux-watchdog.org,
        linux@roeck-us.net, daniel.baluta@nxp.com, linux@rempel-privat.de,
        gregkh@linuxfoundation.org, tglx@linutronix.de,
        m.felsch@pengutronix.de, andriy.shevchenko@linux.intel.com,
        arnd@arndb.de, enric.balletbo@collabora.com, ronald@innovation.ch,
        krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH 2/5] rtc: add COMPILE_TEST support for i.MX SC RTC
Date:   Fri,  6 Mar 2020 23:42:33 +0800
Message-Id: <1583509356-8265-2-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583509356-8265-1-git-send-email-Anson.Huang@nxp.com>
References: <1583509356-8265-1-git-send-email-Anson.Huang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add COMPILE_TEST support to i.MX SC RTC driver for better compile
testing coverage.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/rtc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index acaf6f98..a86768f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -1772,7 +1772,7 @@ config RTC_DRV_SNVS
 	   will be called "rtc-snvs".
 
 config RTC_DRV_IMX_SC
-	depends on IMX_SCU
+	depends on IMX_SCU || COMPILE_TEST
 	depends on HAVE_ARM_SMCCC
 	tristate "NXP i.MX System Controller RTC support"
 	help
-- 
2.7.4

