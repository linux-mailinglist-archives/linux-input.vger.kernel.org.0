Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158804137A6
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 18:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhIUQfX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Sep 2021 12:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbhIUQfW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Sep 2021 12:35:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048ACC061574;
        Tue, 21 Sep 2021 09:33:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id g16so40982172wrb.3;
        Tue, 21 Sep 2021 09:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4O959HY4uJXPTwzINpSqdurSsUaNuNPAPUgJobPVG8Y=;
        b=MlInAdkiy6d3MnQsTolT2Bk8UjDWVJq6CDFKLRHSiPl0PdM6a7QjNKRXnklXpJqjjl
         FMi6ckyCCgG8k3OP6Wi/OIzXkuxSVe2MjOHgFZMOtjO+t+1mKrpR3guNnSpocJo5+xa4
         PIyRwxoYKbZo5LYunAoeMTHesPW7aFgTvo2Z9sGqIYj+oPM5RQAkDhtpAe5kwS7ppUSM
         pWW677fBkwJPnujvZG6H3ZWGC1p68P26D72Y25ML4QLN5Sd+lrb0UHps74NSbe0MMBgS
         BVlJRyPjP9g/eInwpqnKy7TIO3QTL+3k4ZQj6GaVPZVbf2dZId4dereZ24YwCq5xfwdq
         fhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4O959HY4uJXPTwzINpSqdurSsUaNuNPAPUgJobPVG8Y=;
        b=smDbmZ3V3mn9g2M3CtHGkCeZf/pXDtyLTLIHMm2YngNi7k/dXejFUBJMMh/RSZpOpb
         avjwkLBV6Rl6IiyTk85NnrzwOdJqsyD/wKVQlMooiCFtzdtdNY/wIsc++XXMdwH7s0hp
         +5hSm9VfW7NuJ86mWIlJnkcDDvnWPDrIjHKLqw3ldWWUmncnkqUK/jDd6ktP6Z7HGsmn
         E6XEBmbYqVqTYoqgxEjD/Dq5Jm+m+VcVo/GYWgR0C+o/gYsGWU/VnOJqQVRaQIih4NHJ
         Bx/e4OCRKDNvPdBMw5fp0ibb3pmXf767JMSiNHQiJ/I7P+Db6zATS6FbuzfCSTfAq9xr
         mH6Q==
X-Gm-Message-State: AOAM533C3+oLqv0IYj605pOTgyPEPM1FMXlvXqt7O/Nc+jODHYUaTmR5
        OsDvx05bZWrxXKU63SUFiG0=
X-Google-Smtp-Source: ABdhPJxD3FNRIsD+G7IkPP5YFYjGMI+Rxlu+9FHCJhUj7rJLK0EqnbgTt3EMbTW+L1tFw4L4P4uYVw==
X-Received: by 2002:a5d:6292:: with SMTP id k18mr36425372wru.110.1632242032582;
        Tue, 21 Sep 2021 09:33:52 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.139])
        by smtp.gmail.com with ESMTPSA id z13sm23149308wrs.90.2021.09.21.09.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:33:52 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH RESEND 2/2] HID: magicmouse: fix checkpatch warnings
Date:   Tue, 21 Sep 2021 18:33:47 +0200
Message-Id: <20210921163347.7317-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921163347.7317-1-jose.exposito89@gmail.com>
References: <20210921163347.7317-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix warnings reported by checkpatch in hid-magicmouse.c:

hid-magicmouse.c:39:  WARNING: Missing a blank line after declarations

hid-magicmouse.c:79:  WARNING: Block comments use a trailing */ on a
                      separate line

hid-magicmouse.c:156: WARNING: Missing a blank line after declarations

hid-magicmouse.c:190: WARNING: Missing a blank line after declarations

hid-magicmouse.c:505: WARNING: Missing a blank line after declarations

hid-magicmouse.c:756: WARNING: Possible unnecessary 'out of memory'
                      message

hid-magicmouse.c:825: WARNING: braces {} are not necessary for single
                      statement blocks

Ignore the following warning because in this case, the else statement
is useful:

hid-magicmouse.c:161: WARNING: else is not generally useful after a
                      break or return

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index b1ae61f9e675..6fda883e23fb 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -36,6 +36,7 @@ static int param_set_scroll_speed(const char *val,
 				  const struct kernel_param *kp)
 {
 	unsigned long speed;
+
 	if (!val || kstrtoul(val, 0, &speed) || speed > 63)
 		return -EINVAL;
 	scroll_speed = speed;
@@ -76,7 +77,8 @@ MODULE_PARM_DESC(report_undeciphered, "Report undeciphered multi-touch state fie
 #define SCROLL_ACCEL_DEFAULT 7
 
 /* Touch surface information. Dimension is in hundredths of a mm, min and max
- * are in units. */
+ * are in units.
+ */
 #define MOUSE_DIMENSION_X ((float)9056)
 #define MOUSE_MIN_X -1100
 #define MOUSE_MAX_X 1258
@@ -153,6 +155,7 @@ static int magicmouse_firm_touch(struct magicmouse_sc *msc)
 	 */
 	for (ii = 0; ii < msc->ntouches; ii++) {
 		int idx = msc->tracking_ids[ii];
+
 		if (msc->touches[idx].size < 8) {
 			/* Ignore this touch. */
 		} else if (touch >= 0) {
@@ -187,6 +190,7 @@ static void magicmouse_emit_buttons(struct magicmouse_sc *msc, int state)
 			id = magicmouse_firm_touch(msc);
 			if (id >= 0) {
 				int x = msc->touches[id].x;
+
 				if (x < middle_button_start)
 					state = 1;
 				else if (x > middle_button_stop)
@@ -502,6 +506,7 @@ static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+
 	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
 	    field->report->id == MOUSE2_REPORT_ID) {
 		/*
@@ -752,10 +757,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 		return -ENODEV;
 
 	msc = devm_kzalloc(&hdev->dev, sizeof(*msc), GFP_KERNEL);
-	if (msc == NULL) {
-		hid_err(hdev, "can't alloc magicmouse descriptor\n");
+	if (msc == NULL)
 		return -ENOMEM;
-	}
 
 	msc->scroll_accel = SCROLL_ACCEL_DEFAULT;
 	msc->hdev = hdev;
@@ -822,9 +825,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 		hid_err(hdev, "unable to request touch data (%d)\n", ret);
 		goto err_stop_hw;
 	}
-	if (ret == -EIO && id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2) {
+	if (ret == -EIO && id->product == USB_DEVICE_ID_APPLE_MAGICMOUSE2)
 		schedule_delayed_work(&msc->work, msecs_to_jiffies(500));
-	}
 
 	return 0;
 err_stop_hw:
-- 
2.25.1

