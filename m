Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76364472AD
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 12:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhKGL1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 06:27:06 -0500
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:55594 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234554AbhKGL1E (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 06:27:04 -0500
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id jgG9mbDBMCVSejgGWmjsO7; Sun, 07 Nov 2021 12:23:21 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1636284201; bh=5cQItZFlPLSWjbLUBhR1OrUoG0HfywhVMmQfcpeIMjE=;
        h=From;
        b=SEfeX0Fr47RrTqctxX5JRECVjAHyhozljpBcZZfS/YFAlS4+FOxdcFKjfDwQIufLc
         Jn99g8fGChR4kGk/moDzm3TIc8zfOrwWgIg/6KsTVxCQCb8xToxpKznXYX7ki0FQ7O
         +5iX3Mh00GA64oCqVQUiluwCdUXNpjtRo54I3P8oQ/GGm92QnUtF5v44DhkrDte+O0
         Un5IEB6qjODvrCzUF5fOq7lT8bCBxUYAphVL8YCWwjNH2/YaBpTxloYVAxpSRsavLh
         Eoihg7lGOB/41AhX/3eO5qUCk8MeRoNCenj756wjbzwp0/b0Vk1lJrTFp39vYtjpW3
         RpLML7+JNtlkg==
X-CNFS-Analysis: v=2.4 cv=M/2Ilw8s c=1 sm=1 tr=0 ts=6187b729 cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=Lf7JvCFZlXs7EqoJDM0A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Rachna Patil <rachna@ti.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dario Binacchi <dariobin@libero.it>
Subject: [RESEND PATCH 1/6] input: ti_am335x_tsc: set ADCREFM for X configuration
Date:   Sun,  7 Nov 2021 12:22:31 +0100
Message-Id: <20211107112236.7969-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211107112236.7969-1-dariobin@libero.it>
References: <20211107112236.7969-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfKwS3peoja97ebgup13q1Bdw9aa2LVOZMqUcBaQmbJhV6KyRUFW0r8WhfdcuXZCXWU+Ac45kTBzWpkPkMChyvXepWG7HRzHk4Av6nLpdwSpdZBpUFxmI
 8Ioo7+AbV6ffsA2JaZUMErWSDAQKVgoo4f3xZRXXFencgQ60vxDgd9+NBm/tvgDsi8d2OvcG59fHYqpguTkd2Ml6sWFdG7yY8g2WJTibHa7oY4xZFOwHpLbr
 TIGmRlVe5/ag/+2WujNnydf9nzGhvqMe0MaF/E+b1CHOQxAjTWmOc1siOHyIWvo4q7JX+OM4X4A/4CrLacEKqoWmqGtfw1IX/ZfCqSr1lUrKpsmt5aKrc5UM
 A9JGRAbiWYLU9kpl4Cx++s6gE0uCTtS/AyoinPDGBZdlcmz4oF0xqoWo6+GB6KZ5ojOtwZNFstR5i0LUEi5ghplA8jZCuQ==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As reported by the STEPCONFIG[1-16] registered field descriptions of the
TI reference manual, for the ADC "in single ended, SEL_INM_SWC_3_0 must
be 1xxx".

Unlike the Y and Z coordinates, this bit has not been set for the step
configuration registers used to sample the X coordinate.

Fixes: 1b8be32e691 ("Input: add support for TI Touchscreen controller")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/input/touchscreen/ti_am335x_tsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 83e685557a19..fd3ffdd23470 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -131,7 +131,8 @@ static void titsc_step_config(struct titsc *ts_dev)
 	u32 stepenable;
 
 	config = STEPCONFIG_MODE_HWSYNC |
-			STEPCONFIG_AVG_16 | ts_dev->bit_xp;
+			STEPCONFIG_AVG_16 | ts_dev->bit_xp |
+			STEPCONFIG_INM_ADCREFM;
 	switch (ts_dev->wires) {
 	case 4:
 		config |= STEPCONFIG_INP(ts_dev->inp_yp) | ts_dev->bit_xn;
-- 
2.17.1

