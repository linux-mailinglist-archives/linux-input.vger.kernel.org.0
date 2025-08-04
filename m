Return-Path: <linux-input+bounces-13794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACCB19E8D
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 11:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A6E4178E1E
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 09:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6688244690;
	Mon,  4 Aug 2025 09:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oh4W9/qg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07630239E79;
	Mon,  4 Aug 2025 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298752; cv=none; b=kmHSXTKR2/ymvVVsm7DzDkn8fkOaFJO8TGLkyKNWAbROWdPk3TZKYD7Fe10btP3kpiMb5QTKwWifDPe1eawPbdDrITMIwbzHGvEQkTP2qt9vq9OQtV1OGGliP1aictiGljdqDAN3mXoKuXABuVEPyXzvyxmBsyVO4+1m7H24Exw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298752; c=relaxed/simple;
	bh=rYwiPbUwE3ZR8zDhxKTvfWV+F5595stwAdq1GbSlCEs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M4xAh8oepy5WM+G7U97NW0R7ntfyU/56oRdhke2X4v820vK9E92da1Rb4JclIpMpM4LkfMTNeP7Y5Q+5YjGL7UKzrRnI8RpBTG1QdU3W+CkXNq6Jcof40jZTjdGCq5DPPCCdWaRpYN6whF2Mtb98EJM/Russ9pI8eCUBGgXlmAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oh4W9/qg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so28871755e9.3;
        Mon, 04 Aug 2025 02:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754298749; x=1754903549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v1QoC3Wp+9TcUFHhgQ3SUzoiJEMLXa+IMXATFtuRysA=;
        b=Oh4W9/qg+3om3O/EO3otVOkJoa6in9r99tmooQ4Lbtga1T9FP2PR+wl8NucgEdBrib
         pQm02csp8XpQmc954MZUO114q9/Mjizd7ZzbPYe1hFwjofrU2ApL0kYHpK3Xjp5T4q/R
         7VQXo1GsgwlVoa1ZfgafP6KcXpF27ANhdgh/jrgsxnsHkrBKRc4z9GRvE4ehtVbRMBjU
         6fX/2lFON+odGnMKgHJCLKVTf+3cLAxpy6cRh14knlHFV+yKQQbMqn29gTBJp0PntSG5
         LpgZcwjdZbqKm9OdAVgKir14JcRmqYmL5uqK/42f35a6twS4h3+1xEXMzQBTe2u5omTo
         8sJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298749; x=1754903549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1QoC3Wp+9TcUFHhgQ3SUzoiJEMLXa+IMXATFtuRysA=;
        b=pewn4ZjStxL8ddN9gYCTSPCLlKl9lYyKUP3LowsmMIivEsA1m+jw5nu/Ls5sqSvDFL
         JDioAfYM+EWq5hJiogeuyDHNe8b0X8gsYMGn+wGCaqwobNChD2p3dtT3nGrkMSz0mHIp
         4wAgUE25aSTRiNGiBKAvVvjwlD+TPwcxw9rKyDHww99RDNsdmAo5wMdLCjIp/E5tUvt6
         D37euvL4hSm2W6wVa+UohCKiFqGvVr+s59ER054wFFZ403TFSCyjfEGjsknnAX/Bwgr5
         f+Pn3MXjstY/zI9dGk0RzDAg+CFQ0QKL66f5eXgdg+hDZWQ2EmZs2uqNTDl2QVSOxqmE
         Chpw==
X-Forwarded-Encrypted: i=1; AJvYcCUeKe1zVfh8rGWnoxkKg/BSfSWhfak0E+aVIlUoE4Oyb/D8Dy/sHv3ZIaHu/mAPKMAW0ZpDVXgbv29JTg==@vger.kernel.org, AJvYcCV4GphB44bxGQbcdMW8ClbuO3YBi78bk4xq3PSFYfCQJTKzTFo392dqkCoeMYqh8vZ7PTlDzPq1IqaMR5C1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LKdbu3R9lf7nJGRL2n/KQsLP00TJaj0JaLQ2kh/dFZOY5G/T
	6FLdF6Lu3I4AZp6fx27wD/z3/T/Ypk9iOgi0dE3tus7WO3VbBVuosF0L
X-Gm-Gg: ASbGnct0Q37Rj0aVBE1iWlwp45hYnxUxRwHAMOT48O3Zjle5iqLOJwT0Gzi5L0QIeKK
	YQUkCDt8rSKYi+0DJHhJ71YZ4Jkb1tOTq63gley5NGISM+2wLXV0Ymr7WJr1H3Q+0OH2GnKKAoh
	f1MjveTtTU/bI0EisWUQf7/HzINAdJcWrpbJQ1WAiKcjGPNPD4Q+o6j7Yog7oSH/xQH1294DvA7
	HltAl9UZwobnP1Qd9PbY816lx0sQRhsb7Guv+NvdXi8zQz67NSXprcr1CpnqSTEDK0tAh0TxrDs
	qMTboKepe9eEVLd9x8wTqjZZjyrfjIlGNkIuNnfmGzjPz6GybvNybX3VScmWuXrRHaR4ALhW9GY
	33QWzol4ryEm5DkFz/kY=
X-Google-Smtp-Source: AGHT+IEQHf0T5z9SgoKdhuIsab1QkH/EMeWOlidgzoajtjrvoKCDKE703URsnpI+Oad0H2i7K9z18w==
X-Received: by 2002:a05:600c:470d:b0:459:d709:e5a1 with SMTP id 5b1f17b1804b1-459d709e91emr30292275e9.6.1754298748589;
        Mon, 04 Aug 2025 02:12:28 -0700 (PDT)
Received: from fedora ([94.73.32.0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453328sm15480607f8f.46.2025.08.04.02.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:12:27 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	luguohong@xiaomi.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 1/2] HID: input: rename hidinput_set_battery_charge_status()
Date: Mon,  4 Aug 2025 11:11:51 +0200
Message-ID: <20250804091215.6637-1-jose.exposito89@gmail.com>
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


