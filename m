Return-Path: <linux-input+bounces-16795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D53CF8AA5
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 15:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EE2A3004E31
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 14:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 739A533556D;
	Tue,  6 Jan 2026 14:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWNGUhh8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A8B285C8C
	for <linux-input@vger.kernel.org>; Tue,  6 Jan 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708330; cv=none; b=S4AL1geJQJ3tarjZgBlJg0Iv6Q+Y0/tGiJqJo3BLixJjKeBd9O57sKKWyByx42W2lxsY/dOQee2glg8cU5fgaPAbz2/S/KzoIAwA7QjZ6bHZ6ssrjt84l8NBxGGv1BGdeSs3PCgxcUbjgt+7mS0j5Su/awI/pCMN5SXv67rNvDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708330; c=relaxed/simple;
	bh=RWf3KEW6AVKCaa2CyFGLEpJSlPcwyz+8NTP7nWnFW+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKACVw12OELu2DiuKaNUFkOXkdELL//z0EAzBdyE9Sfz1JyUbMqVHRMN1KBR9O8MN5Ge3aW7EFayautZSGrzidTnU6pmSFR7EfeLkmXTSyS4VoE19J+U+HAYZ4hA1lfVBpDp8RoRfx8Syx29SXsTNsMK4PaEv32E9YwmGFuF3EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWNGUhh8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so10636255e9.1
        for <linux-input@vger.kernel.org>; Tue, 06 Jan 2026 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767708327; x=1768313127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr2WD7GFGeysfRSn4bnKKJHA1iBWUw2OoVEUmA2LDvg=;
        b=JWNGUhh8c+FuKc2mLY1kBMQCdZtNE03rdrgbcGbJd8hO9ZKtvplV0qxHGhfY+ksQUq
         hUpchW3RxPpDOo4hfc0XunCytIRBTW4JOwWFzBMvCCGik3u0RiqFZ9DKIdgfAE0bqLLM
         HFJGy5W+aOiMot/YFOGTYXYDePD9tulSTPYmYgQA9TEWk5F1xYbLIOoteJZLQHjmLokP
         z6o8gE+CA+XxCmTgSpRWLctScEy0YAp6m/AdJ81HFHCoHqfd0sy+EJYtAJ14NHSsAjxX
         35e1O9iFvnpOOY3yR6m59DUlC6eIcNhgdvSIWaNdfQhsAaKTTxFfdF3BOF6VA7HmKL0/
         ZE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767708327; x=1768313127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hr2WD7GFGeysfRSn4bnKKJHA1iBWUw2OoVEUmA2LDvg=;
        b=noyfBI/eF1uOV/nvjSYz5btbnz6kD/o6D86CIOqgQoPCo8tMKtfrgOj/PIuV3162o2
         d7lC+mE4QCXz6wNxeQ76SIsyVoKRHfDTUmuPxHi+cC6JDC78NiZ/RP0NRIuCt6z2a4B7
         GOkFh7iK5/NFbaUA5LL/Q01+5d7RMRrTu9dN1m+5SQXvb5wjPugQoTQFQdIR2nC/BhqP
         nirQwAMHlBOUAUB9Ae+fv6pbc2b7aYP4WZ63v7XnyxFYbrki6PsSkrIWldnBVIANw1Oz
         cJ3tkgp37e1aHddwOB7aeF/mWpYdSwNdhaC22h8Zpxs4rGCGFCLo6okgIg1y3TQ7uI5n
         B6BA==
X-Gm-Message-State: AOJu0Yy7LG5WVrnsKFlRWZtf5Bk+se3WJdKl5IVjsE8aahSBNBAjddvQ
	ee55wsvvjgP1UY5QPOWriSKq5Os2ztSgJJuJ046lnnb3C0pWvBGZ9x93
X-Gm-Gg: AY/fxX7LaErYBzv3cNv6Izmg8XPq9ypJnBN0zzqeXxXMkS+g01fOWgFXCL7UojET7lO
	xtNRD/g+rKtksbe1kA5Dhrx0lDDrDdJ+3ybGTpFUe2uCkZFswPS4uy4Un8t8oL7wfQftVVlg6JR
	gmPapPeN1fK1odkz+ZWdmLOBewqHq+4XSx2KHTRavtXHX5A8hLfBJTxG9NlztjHBp9TNR86tCPn
	kAhLKI6bhyj4YzWHU6hnqoYA06JwfqQ89W75NQTRK0XAsXl4s+6HGniHmS393byyKk8cd9amjYr
	WyDrmlsf+sL++e1IFS8lmAhFGZ8NfctWgw8MkffLnBm52X8pe+VZDGwNlS/YbbeQ6L8+dF3HaxR
	DEL2VkFTT/hCxK+V2OJFRo2vdzNY63I4g2BI+xNAblgl1/C4GAZyVBtK7iGQE+l4I7ECT6ujo63
	FdFaM7OtAfdGxhNjQq4PaGd553cE/a1zsSvM0FUvU=
X-Google-Smtp-Source: AGHT+IEOlfdaYvwRJVKFNTbO07ELXVo0zz8qM8HlZW0vw/pP6cpTD3O640uYhr42HxF8yw+l6tJvkw==
X-Received: by 2002:a05:600c:1f94:b0:47d:5089:a476 with SMTP id 5b1f17b1804b1-47d7f0a02e5mr41258125e9.31.1767708326792;
        Tue, 06 Jan 2026 06:05:26 -0800 (PST)
Received: from ionutnechita-arz2022.local ([2a02:2f0e:ca09:7000:33fc:5cce:3767:6b22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0860f5sm4475238f8f.0.2026.01.06.06.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 06:05:26 -0800 (PST)
From: "Ionut Nechita (Sunlight Linux)" <sunlightlinux@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Mario Limonciello <superm1@kernel.org>,
	Ionut Nechita <ionut_n2001@yahoo.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: asus: Filter HID vendor codes and add WMI fan control support for ROG laptops
Date: Tue,  6 Jan 2026 16:04:52 +0200
Message-ID: <20260106140449.90506-5-sunlightlinux@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106140449.90506-3-sunlightlinux@gmail.com>
References: <20260106140449.90506-3-sunlightlinux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ionut Nechita <ionut_n2001@yahoo.com>

On Asus ROG G14 and G15 laptops, several HID vendor usage codes are sent
during normal operation without a clear purpose, generating unwanted
"Unmapped Asus vendor usagepage code" warnings in dmesg.

Additionally, the Fn+F5 fan control key (code 0xae) needs to communicate
with the asus-wmi driver to toggle between fan modes, but this was not
previously handled.

Changes:
- Filter out spurious HID codes (0xea, 0xec, 0x02, 0x8a, 0x9e) for
  QUIRK_ROG_NKEY_KEYBOARD devices to prevent kernel log spam
- Add asus_wmi_send_event() function to communicate with asus-wmi driver
- Implement Fn+F5 (0xae) fan control key handler that triggers WMI events
- Replace magic number 0xff310000 with HID_UP_ASUSVENDOR constant for
  better code clarity

This eliminates unnecessary kernel warnings and enables proper fan control
functionality on affected Asus ROG laptops.

Tested on Asus ROG G14/G15 series laptops.

Signed-off-by: Ionut Nechita <ionut_n2001@yahoo.com>
---
 drivers/hid/hid-asus.c                     | 48 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |  2 +
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 472bca54642b9..cd8d0e495a75a 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -26,6 +26,8 @@
 #include <linux/dmi.h>
 #include <linux/hid.h>
 #include <linux/module.h>
+
+#include <linux/acpi.h>
 #include <linux/platform_data/x86/asus-wmi.h>
 #include <linux/platform_data/x86/asus-wmi-leds-ids.h>
 #include <linux/input/mt.h>
@@ -314,10 +316,33 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
 	return 0;
 }
 
+/*
+ * This enables triggering events in asus-wmi
+ */
+static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
+{
+	int err;
+	u32 retval;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
+		ASUS_WMI_METHODID_NOTIF, code, &retval);
+	if (err) {
+		pr_warn("Failed to notify asus-wmi: %d\n", err);
+		return err;
+	}
+
+	if (retval != 0) {
+		pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int asus_event(struct hid_device *hdev, struct hid_field *field,
 		      struct hid_usage *usage, __s32 value)
 {
-	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
+	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&
 	    (usage->hid & HID_USAGE) != 0x00 &&
 	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
 		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
@@ -330,6 +355,7 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
 static int asus_raw_event(struct hid_device *hdev,
 		struct hid_report *report, u8 *data, int size)
 {
+	int ret;
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 
 	if (drvdata->battery && data[0] == BATTERY_REPORT_ID)
@@ -348,6 +374,26 @@ static int asus_raw_event(struct hid_device *hdev,
 	if (report->id == FEATURE_KBD_LED_REPORT_ID1 || report->id == FEATURE_KBD_LED_REPORT_ID2)
 		return -1;
 	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
+		/* Additional report filtering */
+		if (report->id == FEATURE_KBD_REPORT_ID) {
+			/* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
+			if (data[1] == 0xae) {
+				ret = asus_wmi_send_event(drvdata, 0xae);
+				if (ret < 0) {
+					hid_warn(hdev, "Asus failed to trigger fan control event");
+				}
+				return -1;
+			/*
+			 * G14 and G15 send these codes on some keypresses with no
+			 * discernable reason for doing so. We'll filter them out to avoid
+			 * unmapped warning messages later
+			 */
+			} else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
+					data[1] == 0x8a || data[1] == 0x9e) {
+				return -1;
+			}
+		}
+
 		/*
 		 * G713 and G733 send these codes on some keypresses, depending on
 		 * the key pressed it can trigger a shutdown event if not caught.
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 419491d4abca1..8ed6f603735d1 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -30,6 +30,8 @@
 #define ASUS_WMI_METHODID_INIT		0x54494E49 /* INITialize */
 #define ASUS_WMI_METHODID_HKEY		0x59454B48 /* Hot KEY ?? */
 
+#define ASUS_WMI_METHODID_NOTIF                0x00100021 /* Notify method ?? */
+
 #define ASUS_WMI_UNSUPPORTED_METHOD	0xFFFFFFFE
 
 /* Wireless */
-- 
2.52.0


