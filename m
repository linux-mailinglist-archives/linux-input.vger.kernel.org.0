Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E872D52F3
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 05:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730872AbgLJExj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Dec 2020 23:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730557AbgLJExj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Dec 2020 23:53:39 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2895C0613CF
        for <linux-input@vger.kernel.org>; Wed,  9 Dec 2020 20:52:58 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id q22so2874156pfk.12
        for <linux-input@vger.kernel.org>; Wed, 09 Dec 2020 20:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Awg1XDOa9g3fYp8wNW597kAEi2dDUFxUsBblErDr8kE=;
        b=aNH/ZHQ8qGjOpzxl1AokJZ4hJS1SrSe5OKhTudmtCZrDgNILFFnI/tEE5LvqnZ2Rzz
         5tt5ZZM9V3ak9YtLKisnK1ibXrZBRGP2cv+KGW+ATxg0lVd4hdsz+zVC86/NDXriVWXc
         /PtEyTGsxfXnm/GGOVd6oLmTm25dD+8xiajCRhdqPOrdOhn4VYuU1tT2ZhzM7bkeGJ4C
         9UT1YXxTroIXY5fKAXxMZBa3k6sH4GzYJ60/KNCBQ+pyXDGrzjrzTqW9Rcaje2Zd1rBe
         Cuf1EqPxbALZA3xBpxVu8X1vL5qeDCTfHgpqZ/zpsMvV8X/kZSXPub9qOcbMqtCDxQFc
         k7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Awg1XDOa9g3fYp8wNW597kAEi2dDUFxUsBblErDr8kE=;
        b=E5GM2OzpaLAmhrSq3Jp9lx1jGQGvb6AQixjR90cAKntC4/gRyUuswGfwIWxiQqZwDP
         UN8fET2twM0z9RBV/qAOTxJNvSv/cp2ZkVNUUzvt+XIicYQjHPhCwREIn9ygxKqgOjfG
         e/gSQP6UFCv8o/fx2L72bNM5MnnNq7R6bAybLgLopC49qCsHZfbBk97zdEkSDR05xeWS
         0cUbMx9UhlrUuZFCoNRphL8y91ZomeHPjHLgQynMQWMJR0VksBMYkx5u08LCm3ywjB1j
         vG2HiCQcen5MZyk2qzhj06rB9M1GU7sSoxj3Bm66hWvNomVyTxjrMeBP/Pu6ihWSzgbg
         sGOA==
X-Gm-Message-State: AOAM530Kh618GWStFZfqeJgeR3UFOmhtv6EvXZdCMxqoIFlrVScBIyB/
        yFxlsgDeIqRrVqi0b+dfdoHrBLQ42uz1TQ==
X-Google-Smtp-Source: ABdhPJxUrV5bBPhyTNixi33FIeAeFnyakmxIxB1XCjU7txB9HmHYPzo3Dh1xbpeb+Y4+6ZwcbLyABg==
X-Received: by 2002:a63:d354:: with SMTP id u20mr3540368pgi.344.1607575978205;
        Wed, 09 Dec 2020 20:52:58 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:4f03:210:a121:a863:fb21:93ad])
        by smtp.gmail.com with ESMTPSA id y15sm4047637pju.13.2020.12.09.20.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 20:52:57 -0800 (PST)
From:   Ping Cheng <pinglinux@gmail.com>
X-Google-Original-From: Ping Cheng <ping.cheng@wacom.com>
To:     linux-input@vger.kernel.org,
        syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com
Cc:     jkosina@suse.cz, benjamin.tissoires@gmail.com,
        Ping Cheng <ping.cheng@wacom.com>
Subject: [PATCH] HID: wacom: Fix memory leakage caused by kfifo_alloc
Date:   Wed,  9 Dec 2020 20:52:30 -0800
Message-Id: <20201210045230.26343-1-ping.cheng@wacom.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As reported by syzbot below, kfifo_alloc'd memory would not be freed
if a non-zero return value is triggered in wacom_probe. This patch
creates and uses devm_kfifo_alloc to allocate and free itself.

BUG: memory leak
unreferenced object 0xffff88810dc44a00 (size 512):
  comm "kworker/1:2", pid 3674, jiffies 4294943617 (age 14.100s)
  hex dump (first 32 bytes):
   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
   [<0000000023e1afac>] kmalloc_array include/linux/slab.h:592 [inline]
   [<0000000023e1afac>] __kfifo_alloc+0xad/0x100 lib/kfifo.c:43
   [<00000000c477f737>] wacom_probe+0x1a1/0x3b0 drivers/hid/wacom_sys.c:2727
   [<00000000b3109aca>] hid_device_probe+0x16b/0x210 drivers/hid/hid-core.c:2281
   [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
   [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
   [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
   [<00000000efb7c59e>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
   [<0000000024ab1590>] __device_attach+0x122/0x250 drivers/base/dd.c:912
   [<000000004c7ac048>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
   [<00000000b93050a3>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
   [<00000000e5b46ea5>] hid_add_device+0x151/0x390 drivers/hid/hid-core.c:2437
   [<00000000c6add147>] usbhid_probe+0x412/0x560 drivers/hid/usbhid/hid-core.c:1407
   [<00000000c33acdb4>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
   [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
   [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
   [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844

https://syzkaller.appspot.com/bug?extid=5b49c9695968d7250a26

Reported-by: syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com
Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 drivers/hid/wacom_sys.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index cd71e7133944..9e852b4bbf92 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -1270,6 +1270,37 @@ static int wacom_devm_sysfs_create_group(struct wacom *wacom,
 					       group);
 }
 
+static void wacom_devm_kfifo_release(struct device *dev, void *res)
+{
+	struct kfifo_rec_ptr_2 *devres = res;
+
+	kfifo_free(devres);
+}
+
+static int wacom_devm_kfifo_alloc(struct wacom *wacom)
+{
+	struct wacom_wac *wacom_wac = &wacom->wacom_wac;
+	struct kfifo_rec_ptr_2 *pen_fifo = &wacom_wac->pen_fifo;
+	int error;
+
+	pen_fifo = devres_alloc(wacom_devm_kfifo_release,
+			      sizeof(struct kfifo_rec_ptr_2),
+			      GFP_KERNEL);
+
+	if (!pen_fifo)
+		return -ENOMEM;
+
+	error = kfifo_alloc(pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
+	if (error) {
+		devres_free(pen_fifo);
+		return error;
+	}
+
+	devres_add(&wacom->hdev->dev, pen_fifo);
+
+	return 0;
+}
+
 enum led_brightness wacom_leds_brightness_get(struct wacom_led *led)
 {
 	struct wacom *wacom = led->wacom;
@@ -2724,7 +2755,7 @@ static int wacom_probe(struct hid_device *hdev,
 	if (features->check_for_hid_type && features->hid_type != hdev->type)
 		return -ENODEV;
 
-	error = kfifo_alloc(&wacom_wac->pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
+	error = wacom_devm_kfifo_alloc(wacom);
 	if (error)
 		return error;
 
@@ -2786,8 +2817,6 @@ static void wacom_remove(struct hid_device *hdev)
 
 	if (wacom->wacom_wac.features.type != REMOTE)
 		wacom_release_resources(wacom);
-
-	kfifo_free(&wacom_wac->pen_fifo);
 }
 
 #ifdef CONFIG_PM
-- 
2.17.1

