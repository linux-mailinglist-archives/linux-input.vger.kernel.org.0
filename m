Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6EC61E8837
	for <lists+linux-input@lfdr.de>; Fri, 29 May 2020 21:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgE2T74 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 15:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgE2T74 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 15:59:56 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA89C03E969;
        Fri, 29 May 2020 12:59:55 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q16so1670113plr.2;
        Fri, 29 May 2020 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=NqCh5MuSBiPzMUhleT1sZw8juhuIUtQrFL1mEW53Q4s=;
        b=mj5+iTyniqmHjsnJZCR+wxrcaPZD3SthbrpEGnjj6uw6toTDl8uRi7su0+pSi12Pxj
         +8XEe/lG6NE9SH5ucyxo3bK5DFKJrQN/SWzw932+ppnqcFr/KWF9I2NrCgf3FRIiONn8
         dgm+6F0uW9BPOWYjRlBakZab1Az65eA//okVNAfUClpx1ixMU6tOnYUoD1FlarBULW5i
         439tzmt6c3CgFO2OZ0Q14z19kqDiSnJQXNzij7fI1XSkEloVbzL6KVCm0N830EvbsPZM
         EkizbX0/2AsCQZ2aJMoZTdJPi/xIpF9r5eAE1orTb1wAM5WZhmt27duqxXo+J8zcNsmI
         YA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=NqCh5MuSBiPzMUhleT1sZw8juhuIUtQrFL1mEW53Q4s=;
        b=Baao3BHIqgocunhOfPXjWrerSbR123mNs+PyeoS4rJ8oZ4keveB4e9+FIpT0nn4QQI
         G5zZvu/rmfTVS5rENKtgt+A6aru8VZuaF++fqqfDtPQq1dAxO7aLCB54HKyr+8mNJPIB
         PhEaRvzSa7On2arQKzJUYUeFhGSCezz1LNCYQYQv6eRuRIv+PABtd2bCxc4z6UuTlKhl
         k1oXBf+l4h2nsjyJxIk06u+iUWubcq1yrpotJdjQruHEh66fOBjDhHYFIQNyCLHwqZTn
         WWvvVALR6utke/vvE3/fGz1t0SW+AL8z8DdcjMGwEoGPWLtVWhivy6OpxU5+Hwv69pYN
         0uXg==
X-Gm-Message-State: AOAM5306gCxNLDrh9nIa1X7RVOcJy8ZC6sYyORoqajI1tgR76PrR2XQf
        n5eUHMCiY7FayLUF2ExS/9Nd5iiG
X-Google-Smtp-Source: ABdhPJw0upWt+qRhajyHtIOjnw74ra+SoT6WwUUEVOb6liaLdQy/i5yVCr2Oo2w72txXs2X2kLvHfQ==
X-Received: by 2002:a17:902:7602:: with SMTP id k2mr9490608pll.296.1590782394849;
        Fri, 29 May 2020 12:59:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id z8sm7379120pgc.80.2020.05.29.12.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 12:59:53 -0700 (PDT)
Date:   Fri, 29 May 2020 12:59:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200529195951.GA3767@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

usbhid tries to give the device 50 milliseconds to drain its queues
when opening the device, but does it naively by simply sleeping in open
handler, which slows down device probing (and thus may affect overall
boot time).

However we do not need to sleep as we can instead mark a point of time
in the future when we should start processing the events.

Reported-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
 drivers/hid/usbhid/usbhid.h   |  1 +
 2 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..e69992e945b2 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
 				set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
 		} else {
 			clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
+
+			if (test_and_clear_bit(HID_RESUME_RUNNING,
+					       &usbhid->iofl)) {
+				/*
+				 * In case events are generated while nobody was
+				 * listening, some are released when the device
+				 * is re-opened. Wait 50 msec for the queue to
+				 * empty before allowing events to go through
+				 * hid.
+				 */
+				usbhid->input_start_time = jiffies +
+							   msecs_to_jiffies(50);
+			}
 		}
 	}
 	spin_unlock_irqrestore(&usbhid->lock, flags);
@@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
 		if (!test_bit(HID_OPENED, &usbhid->iofl))
 			break;
 		usbhid_mark_busy(usbhid);
-		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
+		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
+		    time_after(jiffies, usbhid->input_start_time)) {
 			hid_input_report(urb->context, HID_INPUT_REPORT,
 					 urb->transfer_buffer,
 					 urb->actual_length, 1);
@@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
 	}
 
 	usb_autopm_put_interface(usbhid->intf);
-
-	/*
-	 * In case events are generated while nobody was listening,
-	 * some are released when the device is re-opened.
-	 * Wait 50 msec for the queue to empty before allowing events
-	 * to go through hid.
-	 */
-	if (res == 0)
-		msleep(50);
-
-	clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
 	return res;
 }
 
diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
index 8620408bd7af..805949671b96 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -82,6 +82,7 @@ struct usbhid_device {
 
 	spinlock_t lock;						/* fifo spinlock */
 	unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
+	unsigned long input_start_time;					/* When to start handling input, in jiffies */
 	struct timer_list io_retry;                                     /* Retry timer */
 	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
 	unsigned int retry_delay;                                       /* Delay length in ms */
-- 
2.27.0.rc0.183.gde8f92d652-goog


-- 
Dmitry
