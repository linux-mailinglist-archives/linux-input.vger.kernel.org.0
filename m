Return-Path: <linux-input+bounces-7707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925D9B12A9
	for <lists+linux-input@lfdr.de>; Sat, 26 Oct 2024 00:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C16B92834D1
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 22:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CF5212163;
	Fri, 25 Oct 2024 22:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmfodXba"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19600217F4E;
	Fri, 25 Oct 2024 22:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895566; cv=none; b=MFE2q61z5qUtif9qmjLMvNQXT9rhKTJL6LkLpIW+KLm/b0OvhS53cw7XQP0ccvwWCQydDud6CTVWNGBuSuIFENq5JBumrHhVX2KI2KZJRWCC+Ed+mXPWcLl+0FE2BmSWhv+KbZEUDyxOsX148T+hOX7dpjPjGZZGhhRmxfsPy1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895566; c=relaxed/simple;
	bh=3lwEj6BJprZSby+HR1saL69Egl7/bvOfE86F9yvSlNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rOutgsbjcPlVYKTiT502h/lqgIgt20Pku+xYjc+y9XDuGlqQ6zT0jw09uGTa1kVBiHNLqNYLwUZfztNCSDkvE0o7PX3OaiSLYForjP8JzTD0rbr75u6znulI0NKKsM/aRjBDAbiZvjvO72zTd8qzlrNBtga8x/AIr2rZOTZYlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmfodXba; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so1922559a91.3;
        Fri, 25 Oct 2024 15:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729895563; x=1730500363; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQ0Ls5ckSfkt3xLVPRBTrg5UuObdMQ3WxF8K6kuNUMM=;
        b=lmfodXbaFg/QsbWf83sudMFqPYfjAwB8JhP9qHkUftTASo9+BWRvwTXeiBTB9bvyqh
         llad2NsVS4B46i+fFelfNZ8tMqHCEJxn4AgYCv/u69EY/MeVvEd6CrPt/yEi1FxVFM5x
         EWlC95VM7B5D6PMXuo6jqofxreKJoylsV5ujpDfOJl7/93FfJJXQP90a/4b1XDxvb6Hf
         FXPtlW/U6HRPIwo7XLxKPWI3ecg9k95yf9SfLTvTFHeAWCRxfBEGsSxEsS/Vb5D8JpvR
         zSTYiyqblq8wGBahwREqCGl1QaJH4Sd0yj5KTlE5UJmzB5t/HJiaxm1re06AXYxcbmaT
         NOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729895563; x=1730500363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQ0Ls5ckSfkt3xLVPRBTrg5UuObdMQ3WxF8K6kuNUMM=;
        b=oxoYUF0x2mnYoaQSW8Z3YzsmgX/kClRyItv0FBr6BjGkT/rBGWgxq4gsxTffwGpHyL
         SBDiWOPKuYBDR6oMqSqXzL6LUrh6YFrxEzYATU2FUlyxwUMrfo4mxt0ADoFDAJgm6A4m
         9B3jnDaoku9WSsZQIb4AsQg8l1WrXY3wLJSOM63UZ9MHMwafDOzbTe6efQc4Va3v7x/V
         pf4sZzWvKL6YQiL+82OH9Zr9iOyP7SAyK+jGLblOf1LsnfZVE88hQv+8mlsrCFTc0BRT
         5cwoY40Pgnta0l2Z5jgxXMJq2aWdjuTPmDjYVnlmrwVmBwfx/QqI/Uy+h6woHMufrHad
         YVAg==
X-Forwarded-Encrypted: i=1; AJvYcCXw/8EAavAgSZWumsKYv6WPoHy4bTHUhn+Yddc9XW9EunFce+mvZkNr70hfuLSkp471F+S6S/apq0LMkqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKye0ouiliGw6gCA4MaapU1Rk7zBz8U8bG9+AM+MDHLvTV8oz/
	Bcf38M0dw08pSG0D7TkmZaHr04CHKqP5N+GmnqHDk+tvEq9K7mE1v7r4uw==
X-Google-Smtp-Source: AGHT+IFrb8pm0Woj6DVTVyEjr48hi2oExt3XYaIJB/vssa0vuEyPZeKYn1FoInozVX8JXL0Lf3EqjA==
X-Received: by 2002:a17:90b:1c0a:b0:2e2:cd80:4d44 with SMTP id 98e67ed59e1d1-2e8f11ac13fmr1051624a91.28.1729895563169;
        Fri, 25 Oct 2024 15:32:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1691:2dbd:7c00:4e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3578b02sm2059448a91.23.2024.10.25.15.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 15:32:42 -0700 (PDT)
Date: Fri, 25 Oct 2024 15:32:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: multitouch: make mt_set_mode() less cryptic
Message-ID: <ZxwciG6YeVFgfDRU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

mt_set_mode() accepts 2 boolean switches indicating whether the device
(if it follows Windows Precision Touchpad specification) should report
hardware buttons and/or surface contacts. For a casual reader it is
completely not clear, as they look at the call site, which exact mode
is being requested.

Define report_mode enum and change mt_set_mode() to accept is as
an argument instead. This allows to write:

	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);

or

	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_BUTTONS);

which makes intent much more clear.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-multitouch.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99812c0f830b..e4bb2fb5596d 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -83,6 +83,13 @@ enum latency_mode {
 	HID_LATENCY_HIGH = 1,
 };
 
+enum report_mode {
+	TOUCHPAD_REPORT_NONE = 0,
+	TOUCHPAD_REPORT_BUTTONS = 1,
+	TOUCHPAD_REPORT_CONTACTS = 2,
+	TOUCHPAD_REPORT_ALL = TOUCHPAD_REPORT_BUTTONS | TOUCHPAD_REPORT_CONTACTS,
+};
+
 #define MT_IO_FLAGS_RUNNING		0
 #define MT_IO_FLAGS_ACTIVE_SLOTS	1
 #define MT_IO_FLAGS_PENDING_SLOTS	2
@@ -1486,8 +1493,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 				     struct hid_field *field,
 				     struct hid_usage *usage,
 				     enum latency_mode latency,
-				     bool surface_switch,
-				     bool button_switch,
+				     enum report_mode report_mode,
 				     bool *inputmode_found)
 {
 	struct mt_device *td = hid_get_drvdata(hdev);
@@ -1542,11 +1548,11 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 		return true;
 
 	case HID_DG_SURFACESWITCH:
-		field->value[index] = surface_switch;
+		field->value[index] = report_mode & TOUCHPAD_REPORT_CONTACTS;
 		return true;
 
 	case HID_DG_BUTTONSWITCH:
-		field->value[index] = button_switch;
+		field->value[index] = report_mode & TOUCHPAD_REPORT_BUTTONS;
 		return true;
 	}
 
@@ -1554,7 +1560,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
 }
 
 static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
-			 bool surface_switch, bool button_switch)
+			 enum report_mode report_mode)
 {
 	struct hid_report_enum *rep_enum;
 	struct hid_report *rep;
@@ -1579,8 +1585,7 @@ static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
 							     rep->field[i],
 							     usage,
 							     latency,
-							     surface_switch,
-							     button_switch,
+							     report_mode,
 							     &inputmode_found))
 					update_report = true;
 			}
@@ -1820,7 +1825,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		dev_warn(&hdev->dev, "Cannot allocate sysfs group for %s\n",
 				hdev->name);
 
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
@@ -1832,9 +1837,9 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 	/* High latency is desirable for power savings during S3/S0ix */
 	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
 	    !hid_hw_may_wakeup(hdev))
-		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
+		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
 	else
-		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
+		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
@@ -1842,7 +1847,7 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
 static int mt_reset_resume(struct hid_device *hdev)
 {
 	mt_release_contacts(hdev);
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 	return 0;
 }
 
@@ -1854,7 +1859,7 @@ static int mt_resume(struct hid_device *hdev)
 
 	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
 
-	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
+	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
 
 	return 0;
 }
-- 
2.47.0.163.g1226f6d8fa-goog


-- 
Dmitry

