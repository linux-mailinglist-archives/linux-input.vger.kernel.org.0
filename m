Return-Path: <linux-input+bounces-16488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A36CAE6FE
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 01:01:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 666653021E65
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 00:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B429A19F137;
	Tue,  9 Dec 2025 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PmhznZCI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A9414A62B
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765238459; cv=none; b=ZgYRbdXDbfnxjOeSBsyT8/D/bAZ03d0CD+ZAvTpGN+0bnjI3Bib8mKJtsWKVf8Au6K+chPOcQKCZcZfyxB8tUQs0frlCndGI07Sbv1v5MGWG5+BBjPANILFgrP2zYXz4Z6z0I9qTRuV2tVFEH0tiVEvefsK9VOpUFowVlkWJPZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765238459; c=relaxed/simple;
	bh=sZxp/YxOwA/9R1Hssa2VWcELnTdFG2XpTpphl7WrG1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKdIpcSWG8zF7O9ml8IR/yiYilOGKQ0zL0wOeYGU5GaeGVO2c1U7AgidOKkDJ1ECRMO/tUHY0VG01s6CE884iRmw8jPgUv8KSZfqtFbiC4jO3y69av/M/4Ib4vW4grMzsu4RkWOP6duU3UlGmNn9BLeJOV/NIg+VF/T/icEO6yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PmhznZCI; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-640f88b873bso5090395d50.3
        for <linux-input@vger.kernel.org>; Mon, 08 Dec 2025 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765238456; x=1765843256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqiXeNnTsqEPjuzk9xY5LcUuh9/ncQax3m0n6/apyfM=;
        b=PmhznZCIemmmPXQnws20V4w7HeH+fW2lYYQlc4KyU6afTLqKo6BrJzqnRnS7FXr2ZL
         Eb62GOA0DS4Xq+t2oRVaLoIqaSNcQ7c5pGUw/AvynAaruPUu4kFU2ZqyrI/pWyJbRG0C
         gwMWhlnOfxChWzA/e6zC7B/nIYk497K6nTu6lTB0BW6RVCTp1hHEKql+kMxOhxuucjXu
         4V7f0M7CHhZ5JPFr80CoFvHsuurjsJ1e826n706K1e0JzKWjgonDygP4Ci95qIghWviB
         iCM87DvAaIAjcJeYt17e31PPvbZQnBedtqg5emnElQLhHAsnq7z0BhnlZbiV1nX3a+nj
         Cezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765238456; x=1765843256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqiXeNnTsqEPjuzk9xY5LcUuh9/ncQax3m0n6/apyfM=;
        b=XtJ8qZo5OT2yvZd5VrH1WQ3Y0r4MAKa6xWO6vbPpRKXPCkeXolerK5PhbLC0MutbR6
         IDjC4D4/r161JdbvxC8YKoEjNCLIgPxE2obXZNPw1nl5UTaFQBer/YW1+iC8ZF6F8F0F
         L0xWhv0hsitt962t+DT5Ogo5P9tUJMmRACQvxqj1mqiuuAo70nPgnC8lZiQsqyT25coo
         cIm+Mm0CKI+IBwJdXUrpbO1FYC+rBuArAr3Z1b9cbKL16Xnlrx9gZWfm1lY92qfMoIjx
         Yi9KimUgt/CToHrBGL8nl7GJayOf7VD8da1GnJAHYwWcB2AdjGfN67hM7LMjUakyqP2K
         DDkQ==
X-Gm-Message-State: AOJu0Yxhjr5E6GNoJm/d9IbrVS3VmQIQ8GDLm840Kd9fOKr8LTwayrVu
	5EqyQZEJ8pIIz9OXTKW0iykE5mS3G+GgJqyEbd+1IWKiIwuJQDX1xTTdHRcSZA==
X-Gm-Gg: ASbGncut2V+wDzhLWCW7h35x2wNcFpBcVP6+zDKrNT/ejroMnWE9QI+igThsabUVEKy
	THmRwYVIN3XBSl/QvNGlJCkIEvJwtuo/emA3NcDttg8lgchXuZCTN4nI4S8iBhrClFFPaDBXIOU
	enBVxxEjhWcEnBm6AoNmiF4sc4HLF3c6StVzTIINu5Vzqxl/yJJYpYUTwQdfF1r+eShIL2PG/3d
	XCERxbBVKYN3UJ1EDSNU2HSzAzuhR4jqbUduXqhi0QpgzxQ/zgH3WZrS1RKyVHso7T4CZeI2DZ+
	1402uMTqrQnAluSQrRY8DVDAZLRdAiAOvVX3wfEbb5q1gXrqQJifGyYK1m5Cxk2TFa7S/VqXcdQ
	03wyCbpmRiadPvzC2tWNBRzZYVMCnNKew/wMbmcQjZuw0DY4tR1oyiWm3j9tU5t1txZK7WQN71m
	76r4oesDqz12yMp0JkigohJix93Hs1b2Bg42NOz8E=
X-Google-Smtp-Source: AGHT+IFGij6+RlOIbE57+wX2wVbjopbFuldruMB0UigRHm8UHdPafu2AZaRBTNrSko0vPM1cEi/jUw==
X-Received: by 2002:a05:690e:2581:b0:640:d174:383a with SMTP id 956f58d0204a3-6444e7d6641mr6168376d50.67.1765238456418;
        Mon, 08 Dec 2025 16:00:56 -0800 (PST)
Received: from cbelli-laptop.clemson.edu ([130.127.255.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c375addd0sm31382437b3.53.2025.12.08.16.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 16:00:55 -0800 (PST)
From: Connor Belli <connorbelli2003@gmail.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	connorbelli2003@gmail.com
Subject: [PATCH] HID: hid-asus: Implement fn lock for Asus ProArt P16
Date: Mon,  8 Dec 2025 19:00:08 -0500
Message-ID: <20251209000008.4479-1-connorbelli2003@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch implements support for the fn lock key on the 2025 Asus
ProArt P16. The implementation for this is based on how fn lock is
implemented in the hid-lenovo driver. Unfortunately, I am not too
experienced with driver development, so I'm not sure adding the
handler directly in asus_event is the best solution for this.

Signed-off-by: Connor Belli <connorbelli2003@gmail.com>
---
 drivers/hid/hid-asus.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index a444d41e53b6..402b3e5d1a5c 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -89,6 +89,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
 #define QUIRK_ROG_ALLY_XPAD		BIT(13)
+#define QUIRK_HID_FN_LOCK		BIT(14)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -132,6 +133,8 @@ struct asus_drvdata {
 	int battery_stat;
 	bool battery_in_query;
 	unsigned long battery_next_query;
+	struct work_struct fn_lock_sync_work;
+	bool fn_lock;
 };
 
 static int asus_report_battery(struct asus_drvdata *, u8 *, int);
@@ -316,6 +319,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
@@ -323,6 +327,12 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 			 usage->hid & HID_USAGE);
 	}
 
+	if (drvdata->quirks & QUIRK_HID_FN_LOCK &&
+		usage->type == EV_KEY && usage->code == KEY_FN_ESC && value == 1) {
+		drvdata->fn_lock = !drvdata->fn_lock;
+		schedule_work(&drvdata->fn_lock_sync_work);
+	}
+
 	return 0;
 }
 
@@ -457,6 +467,21 @@ static int asus_kbd_disable_oobe(struct hid_device *hdev)
 	return 0;
 }
 
+static int asus_kbd_set_fn_lock(struct hid_device *hdev, bool enabled)
+{
+	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xd0, 0x4e, !!enabled };
+
+	return asus_kbd_set_report(hdev, buf, sizeof(buf));
+}
+
+static void asus_sync_fn_lock(struct work_struct *work)
+{
+	struct asus_drvdata *drvdata =
+	container_of(work, struct asus_drvdata, fn_lock_sync_work);
+
+	asus_kbd_set_fn_lock(drvdata->hdev, drvdata->fn_lock);
+}
+
 static void asus_schedule_work(struct asus_kbd_leds *led)
 {
 	unsigned long flags;
@@ -928,6 +953,12 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	    asus_kbd_register_leds(hdev))
 		hid_warn(hdev, "Failed to initialize backlight.\n");
 
+	if (drvdata->quirks & QUIRK_HID_FN_LOCK) {
+		drvdata->fn_lock = true;
+		INIT_WORK(&drvdata->fn_lock_sync_work, asus_sync_fn_lock);
+		asus_kbd_set_fn_lock(hdev, true);
+	}
+
 	return 0;
 }
 
@@ -1259,6 +1290,9 @@ static void asus_remove(struct hid_device *hdev)
 		cancel_work_sync(&drvdata->kbd_backlight->work);
 	}
 
+	if (drvdata->quirks & QUIRK_HID_FN_LOCK)
+		cancel_work_sync(&drvdata->fn_lock_sync_work);
+
 	hid_hw_stop(hdev);
 }
 
@@ -1386,7 +1420,7 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_HID_FN_LOCK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
-- 
2.52.0


