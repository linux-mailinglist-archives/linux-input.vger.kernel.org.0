Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1B21F4C6A
	for <lists+linux-input@lfdr.de>; Wed, 10 Jun 2020 06:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725270AbgFJEia (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jun 2020 00:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgFJEi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jun 2020 00:38:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718CFC05BD1E;
        Tue,  9 Jun 2020 21:38:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id d6so361694pjs.3;
        Tue, 09 Jun 2020 21:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=bYegErhvXUhKWYoec/3/c1SV8F3ijk3h3IUkeCGeUVE=;
        b=QxPlUIxUHr9+eA/5Zu9Fz3/+FxoUWMPM1E5U2ckHJ+6Djxxv+ManRZOS2+ncEmGiul
         gX+0GXaX0qLgyJaN9zpvTlIiq2UqJiQw3uyNuTCj5sZOO5/3qOj9wLXQih+nxka5Pw+F
         z3PBMJ5GGY7OaM46XEl834rMuA4nh/4qfX0UEQDUTnbxmTo6xpMJAW6vr9+Ll/T3sJ3S
         tkJjoV4SzXn5m29UcofvIZbP2Sx8UpG+AVNXLihHEkkQCL8rhI5YzY12HGcmGUN9G7es
         AykDgjXiKv4C3NU5WrMfbqnmRel1cjlYX9NEd2UVQGjD1PWe777KrsxuWt8UmSJfjhcU
         QVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=bYegErhvXUhKWYoec/3/c1SV8F3ijk3h3IUkeCGeUVE=;
        b=r/ginXKfRBM/TmkrW+DACuAtuMNWz7DC69q5r/i8Uc01Xu6foAMpcdeSWFQKeaYUN/
         NKgbLTCdODceYsdIcgvhfaivmBLsQ//aA8P+UdKAUl6m6zufbdpgViIg1rDwu4D28XIO
         qPc1cF/4JIxO6ADeZQDn0xcAK3toxUfTce5CU0kytZ807Wma9FzqScvF9eAFkO3DSd4H
         6JecqfnhbQ4UhFKPNPtwP4PZ6eyJrVlF9CVsW+vHyjsHxdWQwsrYIvB8AL03ILR9y+DW
         wwOuVQExxW5VP9uhA3+8ZRtnkWCrP+jc5mDIWuthiBjoFvQtU7fIuZ+FnEmGbWkpnm5G
         0vuA==
X-Gm-Message-State: AOAM530CRZq4+ZTlxg0RAIUpN5ad1i1XI98YrA1pR+ZTKjvBjJv9LyDK
        ZoT4O9FXgboAyMCdTZiP1Os=
X-Google-Smtp-Source: ABdhPJwobrYmsbIzKhRC/8ezHlCXe/nzhD+kLnuVdC8/nhctqZEqM5gAQ/EtclACpuhNV5aDVIv+WQ==
X-Received: by 2002:a17:902:b710:: with SMTP id d16mr1482133pls.28.1591763906797;
        Tue, 09 Jun 2020 21:38:26 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h17sm9559235pgv.41.2020.06.09.21.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 21:38:26 -0700 (PDT)
Date:   Tue, 9 Jun 2020 21:38:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     groeck@chromium.org, Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] HID: usbhid: do not sleep when opening device
Message-ID: <20200610043824.GA171503@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

usbhid tries to give the device 50 milliseconds to drain its queues when
opening the device, but dies it naively by simply sleeping in open handler,
which slows down device probing (and thus may affect overall boot time).

However we do not need to sleep as we can instead mark a point of time in
the future when we should start processing the events.

Reported-by: Nicolas Boichat <drinkcat@chromium.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: switched from using jiffies to ktime_t to make sure we won't have
issues with jiffies overflowing.

 drivers/hid/usbhid/hid-core.c | 53 +++++++++++++++++++----------------
 drivers/hid/usbhid/usbhid.h   |  2 ++
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index c7bc9db5b192..72c92aab2b18 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -26,6 +26,7 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 #include <linux/string.h>
+#include <linux/timekeeping.h>
 
 #include <linux/usb.h>
 
@@ -95,6 +96,18 @@ static int hid_start_in(struct hid_device *hid)
 				set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
 		} else {
 			clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
+
+			if (test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
+				/*
+				 * In case events are generated while nobody was
+				 * listening, some are released when the device
+				 * is re-opened. Wait 50 msec for the queue to
+				 * empty before allowing events to go through
+				 * hid.
+				 */
+				usbhid->input_start_time =
+					ktime_add_ms(ktime_get_coarse(), 50);
+			}
 		}
 	}
 	spin_unlock_irqrestore(&usbhid->lock, flags);
@@ -280,20 +293,23 @@ static void hid_irq_in(struct urb *urb)
 		if (!test_bit(HID_OPENED, &usbhid->iofl))
 			break;
 		usbhid_mark_busy(usbhid);
-		if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
-			hid_input_report(urb->context, HID_INPUT_REPORT,
-					 urb->transfer_buffer,
-					 urb->actual_length, 1);
-			/*
-			 * autosuspend refused while keys are pressed
-			 * because most keyboards don't wake up when
-			 * a key is released
-			 */
-			if (hid_check_keys_pressed(hid))
-				set_bit(HID_KEYS_PRESSED, &usbhid->iofl);
-			else
-				clear_bit(HID_KEYS_PRESSED, &usbhid->iofl);
+		if (test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
+			if (ktime_before(ktime_get_coarse(),
+					 usbhid->input_start_time))
+				break;
+			clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
 		}
+		hid_input_report(urb->context, HID_INPUT_REPORT,
+				 urb->transfer_buffer, urb->actual_length, 1);
+		/*
+		 * autosuspend refused while keys are pressed
+		 * because most keyboards don't wake up when
+		 * a key is released
+		 */
+		if (hid_check_keys_pressed(hid))
+			set_bit(HID_KEYS_PRESSED, &usbhid->iofl);
+		else
+			clear_bit(HID_KEYS_PRESSED, &usbhid->iofl);
 		break;
 	case -EPIPE:		/* stall */
 		usbhid_mark_busy(usbhid);
@@ -714,17 +730,6 @@ static int usbhid_open(struct hid_device *hid)
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
index 8620408bd7af..0f0bcf7037f8 100644
--- a/drivers/hid/usbhid/usbhid.h
+++ b/drivers/hid/usbhid/usbhid.h
@@ -13,6 +13,7 @@
 
 #include <linux/types.h>
 #include <linux/slab.h>
+#include <linux/ktime.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/timer.h>
@@ -82,6 +83,7 @@ struct usbhid_device {
 
 	spinlock_t lock;						/* fifo spinlock */
 	unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
+	ktime_t input_start_time;					/* When to start handling input */
 	struct timer_list io_retry;                                     /* Retry timer */
 	unsigned long stop_retry;                                       /* Time to give up, in jiffies */
 	unsigned int retry_delay;                                       /* Delay length in ms */
-- 
2.27.0.278.ge193c7cf3a9-goog


-- 
Dmitry
