Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E7733D781
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 16:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236855AbhCPPcP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 11:32:15 -0400
Received: from m12-11.163.com ([220.181.12.11]:38685 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237907AbhCPPbv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 11:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hwmco
        hvPA6pSBqsTN5q/dpb9KTREeAt8xuIIvviNyhA=; b=l3m5bQ2DJhVJQHNd9GjEm
        LWTt5GBgFH0bUhc3+iZsgqgn+//RKsUeiKsuwMQbIx3xbzL6rsy6bKPnxrXvNP2B
        1M3jy/Mk0zkK/Aop980Qk+dY4L6QRzvDjk24Q+rHrg+n8aGlnFfJhAlJBTqSCWJw
        LcLoIHiV/K57/j3u80Xj4E=
Received: from jiangzhipeng.ccdomain.com (unknown [218.94.48.178])
        by smtp7 (Coremail) with SMTP id C8CowACXkJBcz1BgyqVrSg--.58642S2;
        Tue, 16 Mar 2021 23:31:48 +0800 (CST)
From:   jzp0409 <jzp0409@163.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org,
        "edison.jiang" <jiangzhipeng@yulong.com>
Subject: [PATCH] input:touchscreen/lpc32xx_ts:cleanup cppcheck shifting warning
Date:   Tue, 16 Mar 2021 23:31:50 +0800
Message-Id: <20210316153150.1207-1-jzp0409@163.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowACXkJBcz1BgyqVrSg--.58642S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF4rWr13GryxKw1rWrW8tFb_yoW8XF13pw
        10vFyjkrZ7Xayaka1Utas0qF1agF4fJF98WF9F9a13XFy7Aw1rZrnrXF4rXF1qva4ft343
        Gr97Zw47uas0yw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2a0PUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: hm2sikiqz6il2tof0z/xtbBiARXhlaD+Qd66QAAsl
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "edison.jiang" <jiangzhipeng@yulong.com>

There is error from cppcheck tool.
 "Shifting signed 32-bit value by 31 bits is undefined behaviour errors"

Signed-off-by: edison.jiang <jiangzhipeng@yulong.com>
---
 drivers/input/touchscreen/lpc32xx_ts.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/lpc32xx_ts.c b/drivers/input/touchscreen/lpc32xx_ts.c
index b51450b..82f2ffd 100644
--- a/drivers/input/touchscreen/lpc32xx_ts.c
+++ b/drivers/input/touchscreen/lpc32xx_ts.c
@@ -34,18 +34,18 @@
 #define LPC32XX_TSC_AUX_MIN			0x38
 #define LPC32XX_TSC_AUX_MAX			0x3C
 
-#define LPC32XX_TSC_STAT_FIFO_OVRRN		(1 << 8)
-#define LPC32XX_TSC_STAT_FIFO_EMPTY		(1 << 7)
+#define LPC32XX_TSC_STAT_FIFO_OVRRN		BIT(8)
+#define LPC32XX_TSC_STAT_FIFO_EMPTY		BIT(7)
 
 #define LPC32XX_TSC_SEL_DEFVAL			0x0284
 
 #define LPC32XX_TSC_ADCCON_IRQ_TO_FIFO_4	(0x1 << 11)
 #define LPC32XX_TSC_ADCCON_X_SAMPLE_SIZE(s)	((10 - (s)) << 7)
 #define LPC32XX_TSC_ADCCON_Y_SAMPLE_SIZE(s)	((10 - (s)) << 4)
-#define LPC32XX_TSC_ADCCON_POWER_UP		(1 << 2)
+#define LPC32XX_TSC_ADCCON_POWER_UP		BIT(2)
 #define LPC32XX_TSC_ADCCON_AUTO_EN		(1 << 0)
 
-#define LPC32XX_TSC_FIFO_TS_P_LEVEL		(1 << 31)
+#define LPC32XX_TSC_FIFO_TS_P_LEVEL		BIT(31)
 #define LPC32XX_TSC_FIFO_NORMALIZE_X_VAL(x)	(((x) & 0x03FF0000) >> 16)
 #define LPC32XX_TSC_FIFO_NORMALIZE_Y_VAL(y)	((y) & 0x000003FF)
 
-- 
1.9.1

