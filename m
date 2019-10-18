Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC9ADD092
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 22:48:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfJRUsj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 16:48:39 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42113 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfJRUsj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 16:48:39 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so2092432plj.9;
        Fri, 18 Oct 2019 13:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RcolS2WK2QNO/eFSnt70gILOjF3pCbIwHp6NSAOaUTU=;
        b=ecNXxobj3K9jukXSeLOIi5dx987mjSdPiVgcy4pa6p8pChw9/USlayZI1O5fEoPaJY
         McbzjwCQCaRhQsqCAbewvMOOWkK8ExnWgpLcAVyHoFEmb3LnBui1V8G0PvHBYSS6hoKf
         9wJLpPSwbHTUKjY6bgNb9UJLQSuWhGSZJnOEZb4h2/oQHwRg+idXZy3wX4T3Gw8G7e6v
         c2tgyBAwWwsH9jw6J7uzaXmVC0cUuwBnudoh8hx23vSxZHuyakFAbLqov1aRyoZl9gbg
         0bFlKAaKas44Z/RylHw2jZLEIfhOJL4DG/WmlO93gWgM00MAn4s0Y+E/VQZACnULmqJO
         hylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RcolS2WK2QNO/eFSnt70gILOjF3pCbIwHp6NSAOaUTU=;
        b=PWhoCIvxF3Zn/8/Uj59MQdmjbRNcyPvchPqTEM1lnPgzyOf/QfMM83GuXA8HbCOHs8
         mLK6tbPcKDsVjPRenwALz+gPG1uIRqiwBZREkYqX3HC4TJQKKlSDgkrTMZby18cDtyEZ
         A0Nqacv5dnZLgRsTnJheSGPD8iFveRzBSSqHV3d7cU9yXYYIcVEdxm3yNzvLDvLVwadq
         U5FhvJ61XP3+mDvVaidY15H1TbB7berE2YPGd2InTBPcbIkgCKhAKT5VvkwKymkexbRY
         J9O1mk8yjzi39Jsg+pRTBm649VlX0s+OJ7s3Pwva1Uk1D7ZEbenTS3XgUeSN1KO7WmpR
         sWcA==
X-Gm-Message-State: APjAAAUrXHA50XoaZCxI//lPtRcyy1ghjdkOuX6Ddth/WfG6ZMPbUQwP
        BYukesFHW4nK/Zlf8+jFKP0=
X-Google-Smtp-Source: APXvYqyw9KkYo3e8BtV+g3MQIyw3iLsU4NoWFHeULWIQTewK8FksKO2hXy5R3V8vAD+MGsrEgRT5QQ==
X-Received: by 2002:a17:902:9696:: with SMTP id n22mr11037394plp.252.1571431717821;
        Fri, 18 Oct 2019 13:48:37 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i190sm7936452pgc.93.2019.10.18.13.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 13:48:37 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Haojian Zhuang <haojian.zhuang@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Mark Brown <broonie@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: wm97xx - switch to using threaded IRQ
Date:   Fri, 18 Oct 2019 13:48:33 -0700
Message-Id: <20191018204834.213424-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of manually disabling and enabling interrupts and scheduling work
to access the device, let's use threaded oneshot interrupt handler. It
simplifies things.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/wm97xx-core.c | 42 +++++--------------------
 include/linux/wm97xx.h                  |  1 -
 2 files changed, 7 insertions(+), 36 deletions(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 0a174bd82915..a9c6267a2998 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -285,11 +285,12 @@ void wm97xx_set_suspend_mode(struct wm97xx *wm, u16 mode)
 EXPORT_SYMBOL_GPL(wm97xx_set_suspend_mode);
 
 /*
- * Handle a pen down interrupt.
+ * Codec PENDOWN irq handler
+ *
  */
-static void wm97xx_pen_irq_worker(struct work_struct *work)
+static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
 {
-	struct wm97xx *wm = container_of(work, struct wm97xx, pen_event_work);
+	struct wm97xx *wm = dev_id;
 	int pen_was_down = wm->pen_is_down;
 
 	/* do we need to enable the touch panel reader */
@@ -343,27 +344,6 @@ static void wm97xx_pen_irq_worker(struct work_struct *work)
 	if (!wm->pen_is_down && wm->mach_ops->acc_enabled)
 		wm->mach_ops->acc_pen_up(wm);
 
-	wm->mach_ops->irq_enable(wm, 1);
-}
-
-/*
- * Codec PENDOWN irq handler
- *
- * We have to disable the codec interrupt in the handler because it
- * can take up to 1ms to clear the interrupt source. We schedule a task
- * in a work queue to do the actual interaction with the chip.  The
- * interrupt is then enabled again in the slow handler when the source
- * has been cleared.
- */
-static irqreturn_t wm97xx_pen_interrupt(int irq, void *dev_id)
-{
-	struct wm97xx *wm = dev_id;
-
-	if (!work_pending(&wm->pen_event_work)) {
-		wm->mach_ops->irq_enable(wm, 0);
-		queue_work(wm->ts_workq, &wm->pen_event_work);
-	}
-
 	return IRQ_HANDLED;
 }
 
@@ -374,12 +354,9 @@ static int wm97xx_init_pen_irq(struct wm97xx *wm)
 {
 	u16 reg;
 
-	/* If an interrupt is supplied an IRQ enable operation must also be
-	 * provided. */
-	BUG_ON(!wm->mach_ops->irq_enable);
-
-	if (request_irq(wm->pen_irq, wm97xx_pen_interrupt, IRQF_SHARED,
-			"wm97xx-pen", wm)) {
+	if (request_threaded_irq(wm->pen_irq, NULL, wm97xx_pen_interrupt,
+				 IRQF_SHARED | IRQF_ONESHOT,
+				 "wm97xx-pen", wm)) {
 		dev_err(wm->dev,
 			"Failed to register pen down interrupt, polling");
 		wm->pen_irq = 0;
@@ -509,7 +486,6 @@ static int wm97xx_ts_input_open(struct input_dev *idev)
 	wm->codec->dig_enable(wm, 1);
 
 	INIT_DELAYED_WORK(&wm->ts_reader, wm97xx_ts_reader);
-	INIT_WORK(&wm->pen_event_work, wm97xx_pen_irq_worker);
 
 	wm->ts_reader_min_interval = HZ >= 100 ? HZ / 100 : 1;
 	if (wm->ts_reader_min_interval < 1)
@@ -560,10 +536,6 @@ static void wm97xx_ts_input_close(struct input_dev *idev)
 
 	wm->pen_is_down = 0;
 
-	/* Balance out interrupt disables/enables */
-	if (cancel_work_sync(&wm->pen_event_work))
-		wm->mach_ops->irq_enable(wm, 1);
-
 	/* ts_reader rearms itself so we need to explicitly stop it
 	 * before we destroy the workqueue.
 	 */
diff --git a/include/linux/wm97xx.h b/include/linux/wm97xx.h
index 58e082dadc68..7d5496fa6ac7 100644
--- a/include/linux/wm97xx.h
+++ b/include/linux/wm97xx.h
@@ -281,7 +281,6 @@ struct wm97xx {
 	unsigned long ts_reader_min_interval; /* Minimum interval */
 	unsigned int pen_irq;		/* Pen IRQ number in use */
 	struct workqueue_struct *ts_workq;
-	struct work_struct pen_event_work;
 	u16 acc_slot;			/* AC97 slot used for acc touch data */
 	u16 acc_rate;			/* acc touch data rate */
 	unsigned pen_is_down:1;		/* Pen is down */
-- 
2.23.0.866.gb869b98d4c-goog

