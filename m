Return-Path: <linux-input+bounces-13832-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961CB1C167
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 09:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8B2D6269F0
	for <lists+linux-input@lfdr.de>; Wed,  6 Aug 2025 07:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8D921883F;
	Wed,  6 Aug 2025 07:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMC8XaWZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D851FC8;
	Wed,  6 Aug 2025 07:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754466001; cv=none; b=BqsprhANk+3U3o2ViijEqEw24SQyNSKslqpMr3IxcZXpnJftYXyu6PLNmzI3d3OEWgDoqbMn5EKh8dU/HII7iit4CNtrdnekIGEzen/8oN7bNrB9zL63R9szOeGHjf9uF4gdXw4e9cvHHh1Cdx8LUoIWIDhoWB4sKEFoZH2jo+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754466001; c=relaxed/simple;
	bh=F5zPoQXjEzTOEXHL4JcaoVM9M5QKpJ6Ml6ujj9jYxOM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tSGfiiWKzXgrSMPrFad7UD6vIguceyE4BhSVFD9zBt6M26zC1mjHeTfG8PgmL/IXLBdcEN/HP1TmHlX5AWkMBw+8Gn+KWZHuqeoCLIncbYh9mGMAUJ1qKPhwWHxtwm9mX9Atp/qkPiaUtNQdlhdg0rbb4UhXRRv+uyGMHzRktn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMC8XaWZ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso5354876f8f.3;
        Wed, 06 Aug 2025 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754465998; x=1755070798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2grg21zDeT4xUe2LkQ8aWlNpni0wUjhxOCwWXMCGNhs=;
        b=IMC8XaWZzmh5QyJCdg89VxcykZlChImr+teb0OvTLe6J1wvLk0lgsp0UKbzdh+jKOE
         9rixzDGOKUH4M+gFJv8SFeB6zCOq3lA+vZqBPFYsLNz9mgpb0WaUpVVbs/uAsgUNa1lB
         LVoFYdaHWz30EMuH99JI9Z4x9XITLcYOfmujaABGuw4SRoM4wgvEXcopjOiTqWcwgkoL
         ov/ZjdlgiIeMh46BOEKmaBuy5g0G+Roh4VTgLhU5eMOjNlmNgZErXjiNY+Ebwmy7mCUU
         Mfow2wOeyMvRL7ZTeDbOBMjJ641UKICaE4HQsOmdh/YuLq0TBxHUxc1opSzuUH3i8J0s
         02lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754465998; x=1755070798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2grg21zDeT4xUe2LkQ8aWlNpni0wUjhxOCwWXMCGNhs=;
        b=MIZK+GdUkDAiduOcI6WiS1WMMMfTO4dR0YTHcNRsVU1jHm9qh7Bs2b8JJki+hBucHY
         t/cchA2H1LPqIbZwJDPwk0m2wSrkT7e1RZNzwxkScstF+8LqtvtUr9xCT6yJ8HFIvpar
         OTMigiKhWj+H71MDc6WVODGciyc5oV7pIAzR0/7heMe4LkMWEuIdGeZWoCxuoPqiKkg2
         za4Q0hxMGKDMrnsDIjnCK1S/v1frZ0csDkWPAgSUXHfLQ/PiuXAr9lXRY0XMMXVUdpMR
         VnOa5brJ5i49RpE0BbdhPKsYB/5KNHEd89jWTsas3bR8H6rorKumgMSVDS8yoLJk/no6
         wPTg==
X-Forwarded-Encrypted: i=1; AJvYcCULGq13prhhIo5IwlH7fyXXsCFYpeh7EeUdrYeZTlGriVQJWT/FsHjopYNu4oEGAAh1Odvf5Okf7QqhQYek@vger.kernel.org, AJvYcCUc+vngH/+xJJBwtsq3FMujq5rheEMWpp+miSeqN0t5xDlIXFxbwE4pVd0htu0XJzX/UWPanBMz6QwsXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkZaE5CzYxL0oE0iiGTO1GmK8V6sasEUSqGAPfsCsSqQX/rkw+
	kNn0b6RK12a4RejVLpATh4I5Y57miC/Mcc+stnN3tW0i1NLHJ7J0RCRy
X-Gm-Gg: ASbGncunTKeVsLi0OVtTKcXVKd+/EGpuuIcP4nScmaZZ0B0I2DIX9Eou9Mg4bjOoEoA
	wtKmKlDRJBe+8+ZpKVnYgwBsirBMwjMZE7CY8R3oUpl785XZ8ijyDe3j0u3RzA9hzvhgSJeZiYq
	tRUypllJk0CJT636oAtdEW042X0zfWViZFv3N9ul/hTnuanuLByBL7/omKrFslUomShlbsKg7Ov
	Ota6tTrpDFC4D8vSogJqXnENLOdZNRlf4upIX/i8WXkVNIi9E77+OWJBpBresNJFhVx1xwzzpye
	ch+MFcM5RWHGQvM3ID/B8ftbzZym6sSuijrLkFQyGc1VU0hP4xMEg4hVtTd7JAQEtkIc2CCS60K
	6nl7ywtkK5dtpeKlzNMU=
X-Google-Smtp-Source: AGHT+IFe+27l2U5tQ7qG6gB1swN5RnfK1UxvFzjwetf6zIo7ZvWlO8zJ7rYrgYU4xTdkI6oo6KtY+w==
X-Received: by 2002:a05:6000:2401:b0:3b8:f358:28b0 with SMTP id ffacd0b85a97d-3b8f416d28fmr1459099f8f.25.1754465997791;
        Wed, 06 Aug 2025 00:39:57 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8f5d7deaasm1012694f8f.65.2025.08.06.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 00:39:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 1/2] HID: input: rename hidinput_set_battery_charge_status()
Date: Wed,  6 Aug 2025 09:39:13 +0200
Message-ID: <20250806073944.5310-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for a patch fixing a bug affecting
hidinput_set_battery_charge_status(), rename the function to
hidinput_update_battery_charge_status() and move it up so it can be used
by hidinput_update_battery().

Refactor, no functional changes.

Tested-by: 卢国宏 <luguohong@xiaomi.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-input-test.c | 10 +++++-----
 drivers/hid/hid-input.c      | 38 ++++++++++++++++++------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/hid/hid-input-test.c b/drivers/hid/hid-input-test.c
index 77c2d45ac62a..6f5c71660d82 100644
--- a/drivers/hid/hid-input-test.c
+++ b/drivers/hid/hid-input-test.c
@@ -7,7 +7,7 @@
 
 #include <kunit/test.h>
 
-static void hid_test_input_set_battery_charge_status(struct kunit *test)
+static void hid_test_input_update_battery_charge_status(struct kunit *test)
 {
 	struct hid_device *dev;
 	bool handled;
@@ -15,15 +15,15 @@ static void hid_test_input_set_battery_charge_status(struct kunit *test)
 	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
-	handled = hidinput_set_battery_charge_status(dev, HID_DG_HEIGHT, 0);
+	handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
 	KUNIT_EXPECT_FALSE(test, handled);
 	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
 
-	handled = hidinput_set_battery_charge_status(dev, HID_BAT_CHARGING, 0);
+	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
 	KUNIT_EXPECT_TRUE(test, handled);
 	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
 
-	handled = hidinput_set_battery_charge_status(dev, HID_BAT_CHARGING, 1);
+	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
 	KUNIT_EXPECT_TRUE(test, handled);
 	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_CHARGING);
 }
@@ -63,7 +63,7 @@ static void hid_test_input_get_battery_property(struct kunit *test)
 }
 
 static struct kunit_case hid_input_tests[] = {
-	KUNIT_CASE(hid_test_input_set_battery_charge_status),
+	KUNIT_CASE(hid_test_input_update_battery_charge_status),
 	KUNIT_CASE(hid_test_input_get_battery_property),
 	{ }
 };
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a4..262787e6eb20 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -595,6 +595,20 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 	dev->battery = NULL;
 }
 
+static bool hidinput_update_battery_charge_status(struct hid_device *dev,
+						  unsigned int usage, int value)
+{
+	switch (usage) {
+	case HID_BAT_CHARGING:
+		dev->battery_charge_status = value ?
+					     POWER_SUPPLY_STATUS_CHARGING :
+					     POWER_SUPPLY_STATUS_DISCHARGING;
+		return true;
+	}
+
+	return false;
+}
+
 static void hidinput_update_battery(struct hid_device *dev, int value)
 {
 	int capacity;
@@ -617,20 +631,6 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 		power_supply_changed(dev->battery);
 	}
 }
-
-static bool hidinput_set_battery_charge_status(struct hid_device *dev,
-					       unsigned int usage, int value)
-{
-	switch (usage) {
-	case HID_BAT_CHARGING:
-		dev->battery_charge_status = value ?
-					     POWER_SUPPLY_STATUS_CHARGING :
-					     POWER_SUPPLY_STATUS_DISCHARGING;
-		return true;
-	}
-
-	return false;
-}
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 				  struct hid_field *field, bool is_percentage)
@@ -642,14 +642,14 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 {
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static bool hidinput_update_battery_charge_status(struct hid_device *dev,
+						  unsigned int usage, int value)
 {
+	return false;
 }
 
-static bool hidinput_set_battery_charge_status(struct hid_device *dev,
-					       unsigned int usage, int value)
+static void hidinput_update_battery(struct hid_device *dev, int value)
 {
-	return false;
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
 
@@ -1515,7 +1515,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		bool handled = hidinput_set_battery_charge_status(hid, usage->hid, value);
+		bool handled = hidinput_update_battery_charge_status(hid, usage->hid, value);
 
 		if (!handled)
 			hidinput_update_battery(hid, value);
-- 
2.50.1


