Return-Path: <linux-input+bounces-14004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD67B262F9
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 12:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C26D617EFFE
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 10:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331D0239E7E;
	Thu, 14 Aug 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2dYubL9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B68318133;
	Thu, 14 Aug 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168000; cv=none; b=k1IYMM7uZZETA4vYWhOpKB88F3Xqz+/+4tXJZ52sZEQhToQCjQlFWvf6wZCnHOqTau78vDfKKAMQTrcWrpyD0dT11RAleNjvEUshmVL5BvMhNSmxzlEC2GwiLHKOWZw8SVdiBuLir4BUZPzZqYrhP7/2XxriFB3S/8gKuXSgAqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168000; c=relaxed/simple;
	bh=p06MvJgtcL5Wzvs+Hc9e0fECqZuplhgzVFE2ug/2z8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cMsH5E7yBLOEzIhlSOxfUSvwkTSmXpQHZVju8ib0o52xi+wrVJlMSbIpeddj8FTDUDmwfTDrkHGsrRF/2wg5ogyEI5XGN0l/QYZ/FJD/nPicec/vYM9picClblG7jj5xz+QQBVvT9sHr33w5/vcm6ZqMMHz04CKafKsuMjHCNR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2dYubL9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45a1b281d25so2953495e9.3;
        Thu, 14 Aug 2025 03:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755167996; x=1755772796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=57VUURc27LxVFIBsmK8jZRMZVLyyp3u4YL6pJCsmNDY=;
        b=Y2dYubL9fz/M5n8VdKhNXDOIJhrNqjBYJdBPyK2zGUAZjNh29pgwpK+H4Tsv0cgfyl
         MfnOn8Ebm3ch/LstGxqiohfBKLsqWDt2xKbnmb0ZODp+Af0Q6WijtQaa85+rL+IOGEpF
         CgTDThCtvTn8g8+zSAUkTUfrkytNTrsTrvxlzWQb+yiDS231GDl8Fwyn2UR/5sZ4fQFr
         Qec+rr/SMJxx9Mni7EE850rgtoTIZe5BLLyJuO1l7MJmYgVbfNpYJA9zjY42anYJu6yt
         7XlRIpnv2tlRsmZojSBcJfLxFRqRHw9P4Tc0AJsWoIkKZe+IEqVxquOO99u9oEr0HyHw
         t89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755167996; x=1755772796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=57VUURc27LxVFIBsmK8jZRMZVLyyp3u4YL6pJCsmNDY=;
        b=TDvI91EYs9xJ7FU0c8g5UYF8HPYJDKr8zb6okHNZ5QWgVkvNED89LLE/RFJIaK27bl
         dliYdds8eZFw1nhUIF5C18ylHM4L2FmGym+LNJWx/MmsWLSb7qqCauGfIeWKD9FWvHH+
         Xk+lp+QJkq4MMm8AOCbpJkrShZDXXkA0xk10sozUgvGleXGSaVrnMndAqrpmhNquBgOO
         iM6Nj73GxyFxnDMWx7iQBZSiiqZxx1nPGPm+d8rzBV3cDq4vxtuwrNmBs2I/jCHVLm7u
         A22jnfpdZ8P0mHpnM5DERZa2R9fQPdNj+Vn5aFFDAveAnW5qi8RDY6h0clTJU2R5ngiN
         g4vA==
X-Forwarded-Encrypted: i=1; AJvYcCU/b3gZ8wgW3amuweY5ix/RU1yUJBS3T+2vucT2qcp5UGpcbYuJzonvmRRVqk+UduSiCk7VIDvWOI3Iu07Q@vger.kernel.org, AJvYcCVF9FxuQPl+jMzLUspEa6KX5bYuGJn1Nku8sHLOFXnm2YrET5ajFEKmIY8AO0k7xpOa+dtDdtvMRttbGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNSJtVwy/Up27hh3+OgY/WFn08qy02XfoNe9xCsvNQ+MlmRdOx
	kTI+wsfRq5Phefz94S/vGZ45ihfEG1perihaYXL2hfCUZkxRwFIVPjfIZywSyw==
X-Gm-Gg: ASbGncsGNaRwpRlEYTA37Bf/SSLIuCPZim1QVg05XpFa3FKxpgcPI6EEVVtEI+WhSRG
	BZMZtB1bKXaoTlijraKKyQ5YnHdrmlxonFKnx4EYm/6X2/IuwLE2DgXDZydAHlKzzELI7qr5HgV
	+/Z9mvI+pjd3w9s94MGvVd1MUmzMf/G0+CEJ/l4w9a5sJidgVgCGk33OoL/TqRF/K4DJfp9DT99
	j0pIqGv8McV0uDKDCXIycqYjPo3BR1k4DvhviYRrYZA/h9XvUQF9dQEjTD3k5bPjO2Qez69Btgb
	d9/mlg2bnHTjEdYEAzItgAFIeBK9i1ZHHMc9FD4YYEAefgwXk23hJ15U8sv1rYWMnZYAhPUfjgy
	veH30+eXV+JdqJeLJrSgANEkjMISBdw==
X-Google-Smtp-Source: AGHT+IFAkKLNmtuyJkHer8b7gaduPvs4Mr3VYaQlQqlwAQOjoaeNWP0Kmsbn4DSFm9O9VoSLBLKJ2Q==
X-Received: by 2002:a05:600c:524c:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-45a1b601572mr18942675e9.7.1755167996373;
        Thu, 14 Aug 2025 03:39:56 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b9132f00ecsm8214300f8f.24.2025.08.14.03.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:39:55 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 1/2] HID: input: rename hidinput_set_battery_charge_status()
Date: Thu, 14 Aug 2025 12:39:39 +0200
Message-ID: <20250814103947.116139-1-jose.exposito89@gmail.com>
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

v3:

 - Improved commit message
 - Link to v2: https://lore.kernel.org/linux-input/20250806073944.5310-1-jose.exposito89@gmail.com/

v2:

 - Added Tested-by: 卢国宏 <luguohong@xiaomi.com>
 - Fixed compile warning:
   https://lore.kernel.org/linux-input/202508042305.PBym6Evd-lkp@intel.com/
 - Link to v1: https://lore.kernel.org/linux-input/20250804091215.6637-1-jose.exposito89@gmail.com/
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


