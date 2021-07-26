Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 024463D564E
	for <lists+linux-input@lfdr.de>; Mon, 26 Jul 2021 11:17:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbhGZIhN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Jul 2021 04:37:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbhGZIhM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Jul 2021 04:37:12 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC50C061760;
        Mon, 26 Jul 2021 02:17:41 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id n12so6643342wrr.2;
        Mon, 26 Jul 2021 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/XdUJGh74UESXdQL22e6YfTwgwrep2ayTQFSX53EDsk=;
        b=JFlJsXfql4wxBZ0Yc0wYWlxnVaOduEA6A58aT+YPrHCRaZ9D5f4ZyW4hxotUgQglqK
         Hjb7MaKLptbrmxu5Q1WYqZOwH8m9R5Ojwot/XI+YfOBMnbIiZMR28h1Z1PlnC4gKeQm9
         jf20fylXAmGawweAdN0OU/W09+8vqBGRUpPwS9/h2UCeyaBPgnR8RmnKkQncneyUwpf9
         MmpzSsBGaI0F9IGRcb7q6i/embCTTac0O9r4YXiIbl02SYwUJebckhPiNLTt1qzBaDBP
         CVmY1j6/qL+wMPyfqeTRA3gXkbjGyu9zcZGHNjyIonCuIfPfww8Ih4E2Dm6hnN4eIaMp
         KuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/XdUJGh74UESXdQL22e6YfTwgwrep2ayTQFSX53EDsk=;
        b=sNkDiAblsZKs9z5rPqCTjrP6bStO/QFKFKFS1E0WVeAkwLbyeleononr0eqGNzgFZM
         f6tQbE5i2J/112qAQkAwjVGGVSYTVMAGtLuB6Q64b9uZOSH6LyjrsCs/Iiin3Io1DKCd
         IgCf80pbBJWSwzJPqSVLIAwsJJIUB28Uj0tTvTjXYimSZXD7MvY+zvbuR6pgXCry1NhK
         76IR1z7+vuhrXayAGTxIaV7qLVQ3jXMBUwWkChx+h0RRSbE2P7n5PzKgi8KwBm1XSlBs
         jsu6u7okjzRIJnURoqknzeFpSSh111tZSuiXZ1y+MD50bUTE/EdiFFvuur4B86ZC4Kx7
         GAQg==
X-Gm-Message-State: AOAM531EO17iECU5qHziZxdVFMCyLgcfgqbpf1DLshlLJmzVi2Oh50+Q
        abYE2jV4ZTE/ZeHvtELlFrY=
X-Google-Smtp-Source: ABdhPJwSBGB8LclMeidKxBiEMVDL8GqwD0QI4jatvUCjvURWcYIDLnCnPW6hkFoRYEKPLAgEEbyoDg==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr18487810wrw.131.1627291060430;
        Mon, 26 Jul 2021 02:17:40 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.151])
        by smtp.gmail.com with ESMTPSA id g3sm41805869wru.95.2021.07.26.02.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 02:17:40 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH -next 2/2] HID: magicmouse: fix code style warnings
Date:   Mon, 26 Jul 2021 11:17:19 +0200
Message-Id: <20210726091719.47886-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726091719.47886-1-jose.exposito89@gmail.com>
References: <20210726091719.47886-1-jose.exposito89@gmail.com>
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

Ignore the following warning because, in this case, the else statement
is useful:

hid-magicmouse.c:161: WARNING: else is not generally useful after a
                      break or return

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-magicmouse.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 3c911c97fe57..6fda883e23fb 100644
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
@@ -503,6 +506,7 @@ static int magicmouse_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
 	struct magicmouse_sc *msc = hid_get_drvdata(hdev);
+
 	if (msc->input->id.product == USB_DEVICE_ID_APPLE_MAGICMOUSE2 &&
 	    field->report->id == MOUSE2_REPORT_ID) {
 		/*
@@ -753,10 +757,8 @@ static int magicmouse_probe(struct hid_device *hdev,
 		return -ENODEV;
 
 	msc = devm_kzalloc(&hdev->dev, sizeof(*msc), GFP_KERNEL);
-	if (msc == NULL) {
-		hid_err(hdev, "can't alloc magicmouse descriptor\n");
+	if (msc == NULL)
 		return -ENOMEM;
-	}
 
 	msc->scroll_accel = SCROLL_ACCEL_DEFAULT;
 	msc->hdev = hdev;
@@ -823,9 +825,8 @@ static int magicmouse_probe(struct hid_device *hdev,
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

