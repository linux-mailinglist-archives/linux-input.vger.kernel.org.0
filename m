Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66AF54472AF
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234611AbhKGL1M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:27:12 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:58633 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234554AbhKGL1M (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:27:12 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgGgmjsQ8; Sun, 07 Nov 2021 12:23:29 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284209; bh=/t4afwvWKwIcozWo7+JhPaKv7o+8VqLY8nNdi3B2CXc=;
        h=From;
        b=fHzteAiyasVaRsB0cI4j2Oyac+re88KVXpZPW3ixdg/b1A1O6Sl+3Ijko4k7IDCd8
         I8vzkxug8li9bQgz4XulyrVHxXNF6eTuXSdeJtc/vgaK48JVo6qVusJrEHuPQqNoZ+
         cG/12BCOEefx9zUZCtf273N+lkQQSquBIm8U088grEQImyyEM1b+b4WJuaP6nHczll
         dGsL3iFYkm2Z17V5UNxpeTPogrBZt/RVvCLKPvZHzuDP0qxSb6jQPOOX3NAfvCwdCn
         cKqwmg+IQgd0PUReJDYt6e+A+6BG667UX/RtA+sx/821FPUum1gmcDhBLBqEsAnXsV
         7Tx/lWbgUYYEQ==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b731 cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=Us_wMsjpGDddDCpAM8cA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [RESEND PATCH 2/6] input: ti_am335x_tsc: fix STEPCONFIG setup for Z2
Date:   Sun,  7 Nov 2021 12:22:32 +0100
Message-Id: <20211107112236.7969-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfFRxzP24/5zuorUvVQDiFCV5cQ8vaaiE4fcDq+Pglv84vVqf9dAxEIMxaGxzjV/zDs+gnxOvr5IvcFgy0EpZ9Rnn47AuvIM7Y6KRS3hUupugxZxXpLKt
 TCADoVews87briZKEdV5EAvQOu78va0hSrGFZo2c4Y5bUA+5cpl5exp+PawQtHrgomMrpRSsLLADYwYztXScFwBP2RzayO1wV9p1ynCKNORIwCSV4F9GcPt1
 hku3cgTBc/NUlRDiuUzbEdgaU+eiWvT8uFSnWWDmSqJ5WkCTo0lB85yBYhg00iMKdq3EhZFwUWdammwJeTq+OPUcRB81AM+C7Cabd/qRcIvYMbTWUTw0/HBm
 tJ2Snpg1v3E9vbbvIEUTDn0iBNYbSpMZvFXXlY8gB2cNQMT6iW5aC0q5iLN6SFOdDabGrUnKfi0BzIM+81wEzZAaNhrwOA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Z2 step configuration doesn't erase the SEL_INP_SWC_3_0 bit-field
before setting the ADC channel. This way its value could be corrupted by
the ADC channel selected for the Z1 coordinate.

Fixes: 8c896308fea ("input: ti_am335x_adc: use only FIFO0 and clean up a little")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/input/touchscreen/ti_am335x_tsc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index fd3ffdd23470..cfc943423241 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -196,7 +196,10 @@ static void titsc_step_config(struct titsc *ts_dev)
 			STEPCONFIG_OPENDLY);
 
 	end_step++;
-	config |= STEPCONFIG_INP(ts_dev->inp_yn);
+	config = STEPCONFIG_MODE_HWSYNC |
+			STEPCONFIG_AVG_16 | ts_dev->bit_yp |
+			ts_dev->bit_xn | STEPCONFIG_INM_ADCREFM |
+			STEPCONFIG_INP(ts_dev->inp_yn);
 	titsc_writel(ts_dev, REG_STEPCONFIG(end_step), config);
 	titsc_writel(ts_dev, REG_STEPDELAY(end_step),
 			STEPCONFIG_OPENDLY);
-- 
2.17.1

