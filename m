Return-Path: <linux-input+bounces-16220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0379AC6F60B
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 15:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1E35C346C39
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 14:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 685EE26FDBF;
	Wed, 19 Nov 2025 14:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cfAawISv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sOuOoVqb"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9524A049
	for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763562620; cv=none; b=bZGpGcANVwrzCc3TVlo8gt+5qyNX/HuDK18YK3sC1+v0pZqBmaUP1TpyUUC+X17kE3ZRwd89iJkIbQUNMz34ndIeV44nmU6KPAV6uMhVjLog77MFN2QMhrMdgpXjmR95yybui1OFHoBiZqjhSEUxX7Xav0KEux+NgjIUvLfGYww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763562620; c=relaxed/simple;
	bh=S/IMXg0stCGOsMsc987uzm/caPevy5CZZMdi54W51pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6OM+icV+H8uK1rA9B4J1DfC98YnHTekoyHuTS96WfUUMoxMBP/qFPCDVDHEmX0Ip0JaVltsThpkhAEmrCt2in1UVF4JDEAYrBVbcYJVahFFVx3ykid4fcSF5rQfDlEwMp4kq4eMvBg8X4gNY5IqbLlQ5lvecLVWSGFcft/Jurw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cfAawISv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sOuOoVqb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763562616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K0D02QjsQoQpaA5a03/22N46amm6DhKZLB+D4Yu9g2c=;
	b=cfAawISvoWdFDswMULZFrTHE4eIOjyYErRdV8q4IFa6iUp5msHXlV+sfLkto3yVHRou8MJ
	+rT0dNknSgUnVxbpuDnl64qXR47htexbDSrdDYVe0ke+q9GbMMkCxcvjYevE4E18Vpqti5
	RwCiiWm0QMiSp4au3PVcq3fBO4X5xNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-PzdxVFf8M1O3v-cRAZPd9g-1; Wed, 19 Nov 2025 09:30:14 -0500
X-MC-Unique: PzdxVFf8M1O3v-cRAZPd9g-1
X-Mimecast-MFC-AGG-ID: PzdxVFf8M1O3v-cRAZPd9g_1763562613
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477563e531cso63728625e9.1
        for <linux-input@vger.kernel.org>; Wed, 19 Nov 2025 06:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763562613; x=1764167413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0D02QjsQoQpaA5a03/22N46amm6DhKZLB+D4Yu9g2c=;
        b=sOuOoVqbPS9q9f09rnVwqgjza1PorXcJMUHy8zU1CyjgAOzyOBdWvUOShUe9BwXMaP
         Tr9UvOG0wy54z7UD7wAmzceo/8D0BG5N1nPJMncsS5eXoHpLh4ezUomsnuCb2ihfWLFX
         4iChTFlLYc46Vdr5R0sFmfIEkzi2UhzLp+C0hiJWuBgqnd8Y8gq9bmI4Ly9PfRxYJpR7
         ku8BjXdxl+ORFsCUpdZjVNWBOwjl/w8KKprsFq+wCPtbAec8iyGtgP0CipBUJI8dvjRh
         HRU9WBq0004+N3hnDHdBui1jrrP8kEOBADZ2eD+/rjZ4sYlx0AujJau0od6dgwRc+vZW
         iS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763562613; x=1764167413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K0D02QjsQoQpaA5a03/22N46amm6DhKZLB+D4Yu9g2c=;
        b=bOh557i+rLLQDw/FczB5c0FgqMTCm5Fdn244cG6DqiFMq8reHugSHV1HuGmVWilNTK
         Dsx+G39xR4hxp6i2bLapxTl7wOX4UVEONo9Fz91e6gSnAU6qCwVt0TUTVD9tpcPbMU2Q
         AJdCvTVKcQl5ztvW2oKL/7wQmbl/PdQ7enTdlAxi4g0CqwUYAJS4iC5DyuTDcuT9cHLi
         oXcFxmqX3FcntQRnnkoIKeTvOQiB/O/bmf/ExkoLMHp+m0qvqao9yB/FoOT2eVIuRheJ
         877EJYOIctWZ96t4ODRpf+w+hu2RnuDk9hLsPAqIJPtg5UBwtfBCl2zPHP3XgDPajkNE
         UboQ==
X-Gm-Message-State: AOJu0YxxetefwxwK1wEA+kmoG33lkHhm1pGfkcpCyg392xU7jxPFAzB2
	lE3FWUEqJ2FqUrUdm6uIzEy4sRWN6gyys0tRB4eqsnjrZhTd/oljYOTWWcSs5ZJ05EBahI7XtkS
	FJAXJFRhjQQTFhHPYvzwGtGQsIWHWx0gJYmhGgb4LXxjVLYl3qTkYvNTrEjv0GV7/7OQHhdHAPe
	kvMnKfCoks96BAtwm2yrZMFeUr0k7RgFl7Ox6hWiotFaWyvUfQ
X-Gm-Gg: ASbGncsfku73Utful5kxThSdUWT44ttx6bClpCS/60PMNj0cGV36tS1Pn33bdMiSD/V
	Ttw6PLmaSORLGF/XposFvDqV3Fz1s+sM1E9ZYnEHLbeEl0OIARYVJ2+FQM0S+5zAhDd1xM+pyh2
	KyLqgTs0NZbH2s1kzkzkKkFXK49zrYYuKn3ZnRBqWBmP/dHVujI4oZp3AKdQM2K0tf9RNRCfknh
	/wxLpE3+lroKcAjheUt4zMpak2yVbuaW6P4aCMOVmb/grxhh7s8+nmNh3O09qAPWfI9D5/MD0Ry
	Z5ePFn2bpxgkqplRk+iu9vpoJ/ss9+TLyHRBM7EsyuMEHU0cUz15riZYQJre1KkaHPNu2OcDr89
	kRkhhQYtYzHHvCQwXTSVH+4w0JGeVB17CiBRHwgDq9XFQWfjaQkAW3QxIbLJEI6iJjSytLMFY/Z
	QBTwwNJqdSIQ==
X-Received: by 2002:a05:600c:3b12:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-4778fe5c87amr189173015e9.9.1763562612873;
        Wed, 19 Nov 2025 06:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3IGD1d+vLrZjZJhnjSMsJuo0Csd1OdlHv57EOZt7umfalJSJeTw61iOrdyp5vPvNh7EzdHA==
X-Received: by 2002:a05:600c:3b12:b0:475:dcbb:7903 with SMTP id 5b1f17b1804b1-4778fe5c87amr189172595e9.9.1763562612228;
        Wed, 19 Nov 2025 06:30:12 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b1013edcsm50606475e9.4.2025.11.19.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 06:30:11 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 1/1] HID: input: Add support for multiple batteries per device
Date: Wed, 19 Nov 2025 14:30:03 +0000
Message-ID: <20251119143005.1513531-2-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251119143005.1513531-1-lzampier@redhat.com>
References: <20251119143005.1513531-1-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce struct hid_battery to encapsulate individual battery state and
enable HID devices to register multiple batteries, each identified by
its report ID.

This change adds struct hid_battery with all battery-related fields and
replaces the legacy dev->battery_* fields with a batteries list. All
memory management is converted to use devm_* for simpler cleanup.
Batteries are named using their report ID with the pattern
hid-{uniq}-battery-{report_id}. External drivers hid-apple and
hid-magicmouse are updated to use the new battery API via the
hid_get_first_battery() helper, and hid-input-test is updated for the
new battery structure.

This enables proper battery reporting for devices with multiple
batteries such as split keyboards, gaming headsets with charging docks,
and wireless earbuds with per-earbud batteries.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/hid/hid-apple.c      |  10 +-
 drivers/hid/hid-core.c       |   4 +
 drivers/hid/hid-input-test.c |  39 +++----
 drivers/hid/hid-input.c      | 191 +++++++++++++++++++----------------
 drivers/hid/hid-magicmouse.c |  10 +-
 include/linux/hid.h          |  54 +++++++---
 6 files changed, 182 insertions(+), 126 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 61404d7a43ee..fb09b616f8cc 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -618,17 +618,19 @@ static int apple_fetch_battery(struct hid_device *hdev)
 	struct apple_sc *asc = hid_get_drvdata(hdev);
 	struct hid_report_enum *report_enum;
 	struct hid_report *report;
+	struct hid_battery *bat;
 
-	if (!(asc->quirks & APPLE_RDESC_BATTERY) || !hdev->battery)
+	bat = hid_get_first_battery(hdev);
+	if (!(asc->quirks & APPLE_RDESC_BATTERY) || !bat)
 		return -1;
 
-	report_enum = &hdev->report_enum[hdev->battery_report_type];
-	report = report_enum->report_id_hash[hdev->battery_report_id];
+	report_enum = &hdev->report_enum[bat->report_type];
+	report = report_enum->report_id_hash[bat->report_id];
 
 	if (!report || report->maxfield < 1)
 		return -1;
 
-	if (hdev->battery_capacity == hdev->battery_max)
+	if (bat->capacity == bat->max)
 		return -1;
 
 	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index a5b3a8ca2fcb..76d628547e9a 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2990,6 +2990,10 @@ struct hid_device *hid_allocate_device(void)
 	mutex_init(&hdev->ll_open_lock);
 	kref_init(&hdev->ref);
 
+#ifdef CONFIG_HID_BATTERY_STRENGTH
+	INIT_LIST_HEAD(&hdev->batteries);
+#endif
+
 	ret = hid_bpf_device_init(hdev);
 	if (ret)
 		goto out_err;
diff --git a/drivers/hid/hid-input-test.c b/drivers/hid/hid-input-test.c
index 6f5c71660d82..c92008dafddf 100644
--- a/drivers/hid/hid-input-test.c
+++ b/drivers/hid/hid-input-test.c
@@ -9,54 +9,59 @@
 
 static void hid_test_input_update_battery_charge_status(struct kunit *test)
 {
-	struct hid_device *dev;
+	struct hid_battery *bat;
 	bool handled;
 
-	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
-	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	bat = kunit_kzalloc(test, sizeof(*bat), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bat);
 
-	handled = hidinput_update_battery_charge_status(dev, HID_DG_HEIGHT, 0);
+	handled = hidinput_update_battery_charge_status(bat, HID_DG_HEIGHT, 0);
 	KUNIT_EXPECT_FALSE(test, handled);
-	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
+	KUNIT_EXPECT_EQ(test, bat->charge_status, POWER_SUPPLY_STATUS_UNKNOWN);
 
-	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 0);
+	handled = hidinput_update_battery_charge_status(bat, HID_BAT_CHARGING, 0);
 	KUNIT_EXPECT_TRUE(test, handled);
-	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
+	KUNIT_EXPECT_EQ(test, bat->charge_status, POWER_SUPPLY_STATUS_DISCHARGING);
 
-	handled = hidinput_update_battery_charge_status(dev, HID_BAT_CHARGING, 1);
+	handled = hidinput_update_battery_charge_status(bat, HID_BAT_CHARGING, 1);
 	KUNIT_EXPECT_TRUE(test, handled);
-	KUNIT_EXPECT_EQ(test, dev->battery_charge_status, POWER_SUPPLY_STATUS_CHARGING);
+	KUNIT_EXPECT_EQ(test, bat->charge_status, POWER_SUPPLY_STATUS_CHARGING);
 }
 
 static void hid_test_input_get_battery_property(struct kunit *test)
 {
 	struct power_supply *psy;
+	struct hid_battery *bat;
 	struct hid_device *dev;
 	union power_supply_propval val;
 	int ret;
 
 	dev = kunit_kzalloc(test, sizeof(*dev), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
-	dev->battery_avoid_query = true;
+
+	bat = kunit_kzalloc(test, sizeof(*bat), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bat);
+	bat->dev = dev;
+	bat->avoid_query = true;
 
 	psy = kunit_kzalloc(test, sizeof(*psy), GFP_KERNEL);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, psy);
-	psy->drv_data = dev;
+	psy->drv_data = bat;
 
-	dev->battery_status = HID_BATTERY_UNKNOWN;
-	dev->battery_charge_status = POWER_SUPPLY_STATUS_CHARGING;
+	bat->status = HID_BATTERY_UNKNOWN;
+	bat->charge_status = POWER_SUPPLY_STATUS_CHARGING;
 	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_UNKNOWN);
 
-	dev->battery_status = HID_BATTERY_REPORTED;
-	dev->battery_charge_status = POWER_SUPPLY_STATUS_CHARGING;
+	bat->status = HID_BATTERY_REPORTED;
+	bat->charge_status = POWER_SUPPLY_STATUS_CHARGING;
 	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_CHARGING);
 
-	dev->battery_status = HID_BATTERY_REPORTED;
-	dev->battery_charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	bat->status = HID_BATTERY_REPORTED;
+	bat->charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
 	ret = hidinput_get_battery_property(psy, POWER_SUPPLY_PROP_STATUS, &val);
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	KUNIT_EXPECT_EQ(test, val.intval, POWER_SUPPLY_STATUS_DISCHARGING);
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e56e7de53279..08b889ecaf7f 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -418,18 +418,18 @@ static unsigned find_battery_quirk(struct hid_device *hdev)
 	return quirks;
 }
 
-static int hidinput_scale_battery_capacity(struct hid_device *dev,
+static int hidinput_scale_battery_capacity(struct hid_battery *bat,
 					   int value)
 {
-	if (dev->battery_min < dev->battery_max &&
-	    value >= dev->battery_min && value <= dev->battery_max)
-		value = ((value - dev->battery_min) * 100) /
-			(dev->battery_max - dev->battery_min);
+	if (bat->min < bat->max &&
+	    value >= bat->min && value <= bat->max)
+		value = ((value - bat->min) * 100) /
+			(bat->max - bat->min);
 
 	return value;
 }
 
-static int hidinput_query_battery_capacity(struct hid_device *dev)
+static int hidinput_query_battery_capacity(struct hid_battery *bat)
 {
 	u8 *buf;
 	int ret;
@@ -438,14 +438,14 @@ static int hidinput_query_battery_capacity(struct hid_device *dev)
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hid_hw_raw_request(dev, dev->battery_report_id, buf, 4,
-				 dev->battery_report_type, HID_REQ_GET_REPORT);
+	ret = hid_hw_raw_request(bat->dev, bat->report_id, buf, 4,
+				 bat->report_type, HID_REQ_GET_REPORT);
 	if (ret < 2) {
 		kfree(buf);
 		return -ENODATA;
 	}
 
-	ret = hidinput_scale_battery_capacity(dev, buf[1]);
+	ret = hidinput_scale_battery_capacity(bat, buf[1]);
 	kfree(buf);
 	return ret;
 }
@@ -454,7 +454,8 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 					 enum power_supply_property prop,
 					 union power_supply_propval *val)
 {
-	struct hid_device *dev = power_supply_get_drvdata(psy);
+	struct hid_battery *bat = power_supply_get_drvdata(psy);
+	struct hid_device *dev = bat->dev;
 	int value;
 	int ret = 0;
 
@@ -465,13 +466,13 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 		break;
 
 	case POWER_SUPPLY_PROP_CAPACITY:
-		if (dev->battery_status != HID_BATTERY_REPORTED &&
-		    !dev->battery_avoid_query) {
-			value = hidinput_query_battery_capacity(dev);
+		if (bat->status != HID_BATTERY_REPORTED &&
+		    !bat->avoid_query) {
+			value = hidinput_query_battery_capacity(bat);
 			if (value < 0)
 				return value;
 		} else  {
-			value = dev->battery_capacity;
+			value = bat->capacity;
 		}
 
 		val->intval = value;
@@ -482,20 +483,20 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 		break;
 
 	case POWER_SUPPLY_PROP_STATUS:
-		if (dev->battery_status != HID_BATTERY_REPORTED &&
-		    !dev->battery_avoid_query) {
-			value = hidinput_query_battery_capacity(dev);
+		if (bat->status != HID_BATTERY_REPORTED &&
+		    !bat->avoid_query) {
+			value = hidinput_query_battery_capacity(bat);
 			if (value < 0)
 				return value;
 
-			dev->battery_capacity = value;
-			dev->battery_status = HID_BATTERY_QUERIED;
+			bat->capacity = value;
+			bat->status = HID_BATTERY_QUERIED;
 		}
 
-		if (dev->battery_status == HID_BATTERY_UNKNOWN)
+		if (bat->status == HID_BATTERY_UNKNOWN)
 			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
 		else
-			val->intval = dev->battery_charge_status;
+			val->intval = bat->charge_status;
 		break;
 
 	case POWER_SUPPLY_PROP_SCOPE:
@@ -510,37 +511,54 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 	return ret;
 }
 
+static struct hid_battery *hidinput_find_battery(struct hid_device *dev,
+						 int report_id)
+{
+	struct hid_battery *bat;
+
+	list_for_each_entry(bat, &dev->batteries, list) {
+		if (bat->report_id == report_id)
+			return bat;
+	}
+	return NULL;
+}
+
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 				  struct hid_field *field, bool is_percentage)
 {
+	struct hid_battery *bat;
 	struct power_supply_desc *psy_desc;
-	struct power_supply_config psy_cfg = { .drv_data = dev, };
+	struct power_supply_config psy_cfg = { 0 };
 	unsigned quirks;
 	s32 min, max;
-	int error;
 
-	if (dev->battery)
-		return 0;	/* already initialized? */
+	if (hidinput_find_battery(dev, field->report->id))
+		return 0;	/* already initialized */
 
 	quirks = find_battery_quirk(dev);
 
-	hid_dbg(dev, "device %x:%x:%x %d quirks %d\n",
-		dev->bus, dev->vendor, dev->product, dev->version, quirks);
+	hid_dbg(dev, "device %x:%x:%x %d quirks %d report_id %d\n",
+		dev->bus, dev->vendor, dev->product, dev->version, quirks,
+		field->report->id);
 
 	if (quirks & HID_BATTERY_QUIRK_IGNORE)
 		return 0;
 
-	psy_desc = kzalloc(sizeof(*psy_desc), GFP_KERNEL);
+	bat = devm_kzalloc(&dev->dev, sizeof(*bat), GFP_KERNEL);
+	if (!bat)
+		return -ENOMEM;
+
+	psy_desc = devm_kzalloc(&dev->dev, sizeof(*psy_desc), GFP_KERNEL);
 	if (!psy_desc)
 		return -ENOMEM;
 
-	psy_desc->name = kasprintf(GFP_KERNEL, "hid-%s-battery",
-				   strlen(dev->uniq) ?
-					dev->uniq : dev_name(&dev->dev));
-	if (!psy_desc->name) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
+	psy_desc->name = devm_kasprintf(&dev->dev, GFP_KERNEL,
+					"hid-%s-battery-%d",
+					strlen(dev->uniq) ?
+						dev->uniq : dev_name(&dev->dev),
+					field->report->id);
+	if (!psy_desc->name)
+		return -ENOMEM;
 
 	psy_desc->type = POWER_SUPPLY_TYPE_BATTERY;
 	psy_desc->properties = hidinput_battery_props;
@@ -559,98 +577,89 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	if (quirks & HID_BATTERY_QUIRK_FEATURE)
 		report_type = HID_FEATURE_REPORT;
 
-	dev->battery_min = min;
-	dev->battery_max = max;
-	dev->battery_report_type = report_type;
-	dev->battery_report_id = field->report->id;
-	dev->battery_charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	bat->dev = dev;
+	bat->min = min;
+	bat->max = max;
+	bat->report_type = report_type;
+	bat->report_id = field->report->id;
+	bat->charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	bat->status = HID_BATTERY_UNKNOWN;
 
 	/*
 	 * Stylus is normally not connected to the device and thus we
 	 * can't query the device and get meaningful battery strength.
 	 * We have to wait for the device to report it on its own.
 	 */
-	dev->battery_avoid_query = report_type == HID_INPUT_REPORT &&
-				   field->physical == HID_DG_STYLUS;
+	bat->avoid_query = report_type == HID_INPUT_REPORT &&
+			   field->physical == HID_DG_STYLUS;
 
 	if (quirks & HID_BATTERY_QUIRK_AVOID_QUERY)
-		dev->battery_avoid_query = true;
-
-	dev->battery = power_supply_register(&dev->dev, psy_desc, &psy_cfg);
-	if (IS_ERR(dev->battery)) {
-		error = PTR_ERR(dev->battery);
-		hid_warn(dev, "can't register power supply: %d\n", error);
-		goto err_free_name;
+		bat->avoid_query = true;
+
+	psy_cfg.drv_data = bat;
+	bat->ps = devm_power_supply_register(&dev->dev, psy_desc, &psy_cfg);
+	if (IS_ERR(bat->ps)) {
+		hid_warn(dev, "can't register power supply: %ld\n",
+			 PTR_ERR(bat->ps));
+		return PTR_ERR(bat->ps);
 	}
 
-	power_supply_powers(dev->battery, &dev->dev);
-	return 0;
+	power_supply_powers(bat->ps, &dev->dev);
+
+	list_add_tail(&bat->list, &dev->batteries);
 
-err_free_name:
-	kfree(psy_desc->name);
-err_free_mem:
-	kfree(psy_desc);
-	dev->battery = NULL;
-	return error;
+	return 0;
 }
 
 static void hidinput_cleanup_battery(struct hid_device *dev)
 {
-	const struct power_supply_desc *psy_desc;
-
-	if (!dev->battery)
-		return;
+	struct hid_battery *bat, *next;
 
-	psy_desc = dev->battery->desc;
-	power_supply_unregister(dev->battery);
-	kfree(psy_desc->name);
-	kfree(psy_desc);
-	dev->battery = NULL;
+	list_for_each_entry_safe(bat, next, &dev->batteries, list) {
+		list_del(&bat->list);
+	}
 }
 
-static bool hidinput_update_battery_charge_status(struct hid_device *dev,
+static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
 						  unsigned int usage, int value)
 {
 	switch (usage) {
 	case HID_BAT_CHARGING:
-		dev->battery_charge_status = value ?
-					     POWER_SUPPLY_STATUS_CHARGING :
-					     POWER_SUPPLY_STATUS_DISCHARGING;
+		bat->charge_status = value ?
+				     POWER_SUPPLY_STATUS_CHARGING :
+				     POWER_SUPPLY_STATUS_DISCHARGING;
 		return true;
 	}
 
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
-				    int value)
+static void hidinput_update_battery(struct hid_battery *bat,
+				    unsigned int usage, int value)
 {
 	int capacity;
 
-	if (!dev->battery)
-		return;
-
-	if (hidinput_update_battery_charge_status(dev, usage, value)) {
-		power_supply_changed(dev->battery);
+	if (hidinput_update_battery_charge_status(bat, usage, value)) {
+		power_supply_changed(bat->ps);
 		return;
 	}
 
 	if ((usage & HID_USAGE_PAGE) == HID_UP_DIGITIZER && value == 0)
 		return;
 
-	if (value < dev->battery_min || value > dev->battery_max)
+	if (value < bat->min || value > bat->max)
 		return;
 
-	capacity = hidinput_scale_battery_capacity(dev, value);
+	capacity = hidinput_scale_battery_capacity(bat, value);
 
-	if (dev->battery_status != HID_BATTERY_REPORTED ||
-	    capacity != dev->battery_capacity ||
-	    ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
-		dev->battery_capacity = capacity;
-		dev->battery_status = HID_BATTERY_REPORTED;
-		dev->battery_ratelimit_time =
+	if (bat->status != HID_BATTERY_REPORTED ||
+	    capacity != bat->capacity ||
+	    ktime_after(ktime_get_coarse(), bat->ratelimit_time)) {
+		bat->capacity = capacity;
+		bat->status = HID_BATTERY_REPORTED;
+		bat->ratelimit_time =
 			ktime_add_ms(ktime_get_coarse(), 30 * 1000);
-		power_supply_changed(dev->battery);
+		power_supply_changed(bat->ps);
 	}
 }
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
@@ -664,9 +673,10 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 {
 }
 
-static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
-				    int value)
+static struct hid_battery *hidinput_find_battery(struct hid_device *dev,
+						 int report_id)
 {
+	return NULL;
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
 
@@ -1533,7 +1543,10 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		hidinput_update_battery(hid, usage->hid, value);
+		struct hid_battery *bat = hidinput_find_battery(hid, report->id);
+
+		if (bat)
+			hidinput_update_battery(bat, usage->hid, value);
 		return;
 	}
 
diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 7d4a25c6de0e..b495f7a4bc6c 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -812,19 +812,21 @@ static int magicmouse_fetch_battery(struct hid_device *hdev)
 #ifdef CONFIG_HID_BATTERY_STRENGTH
 	struct hid_report_enum *report_enum;
 	struct hid_report *report;
+	struct hid_battery *bat;
 
-	if (!hdev->battery ||
+	bat = hid_get_first_battery(hdev);
+	if (!bat ||
 	    (!is_usb_magicmouse2(hdev->vendor, hdev->product) &&
 	     !is_usb_magictrackpad2(hdev->vendor, hdev->product)))
 		return -1;
 
-	report_enum = &hdev->report_enum[hdev->battery_report_type];
-	report = report_enum->report_id_hash[hdev->battery_report_id];
+	report_enum = &hdev->report_enum[bat->report_type];
+	report = report_enum->report_id_hash[bat->report_id];
 
 	if (!report || report->maxfield < 1)
 		return -1;
 
-	if (hdev->battery_capacity == hdev->battery_max)
+	if (bat->capacity == bat->max)
 		return -1;
 
 	hid_hw_request(hdev, report, HID_REQ_GET_REPORT);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index a4ddb94e3ee5..3e33ef74c3c1 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -634,6 +634,36 @@ enum hid_battery_status {
 	HID_BATTERY_REPORTED,		/* Device sent unsolicited battery strength report */
 };
 
+/**
+ * struct hid_battery - represents a single battery power supply
+ * @dev: pointer to the parent hid_device
+ * @ps: the power supply instance
+ * @min: minimum battery value from HID descriptor
+ * @max: maximum battery value from HID descriptor
+ * @report_type: HID report type (input/feature)
+ * @report_id: HID report ID for this battery
+ * @charge_status: current charging status
+ * @status: battery reporting status
+ * @capacity: current battery capacity (0-100)
+ * @avoid_query: if true, avoid querying battery (e.g., for stylus)
+ * @ratelimit_time: rate limiting for battery reports
+ * @list: list node for linking into hid_device's battery list
+ */
+struct hid_battery {
+	struct hid_device *dev;
+	struct power_supply *ps;
+	__s32 min;
+	__s32 max;
+	__s32 report_type;
+	__s32 report_id;
+	__s32 charge_status;
+	enum hid_battery_status status;
+	__s32 capacity;
+	bool avoid_query;
+	ktime_t ratelimit_time;
+	struct list_head list;
+};
+
 struct hid_driver;
 struct hid_ll_driver;
 
@@ -670,19 +700,10 @@ struct hid_device {
 #ifdef CONFIG_HID_BATTERY_STRENGTH
 	/*
 	 * Power supply information for HID devices which report
-	 * battery strength. power_supply was successfully registered if
-	 * battery is non-NULL.
+	 * battery strength. Each battery is tracked separately in the
+	 * batteries list.
 	 */
-	struct power_supply *battery;
-	__s32 battery_capacity;
-	__s32 battery_min;
-	__s32 battery_max;
-	__s32 battery_report_type;
-	__s32 battery_report_id;
-	__s32 battery_charge_status;
-	enum hid_battery_status battery_status;
-	bool battery_avoid_query;
-	ktime_t battery_ratelimit_time;
+	struct list_head batteries;
 #endif
 
 	unsigned long status;						/* see STAT flags above */
@@ -743,6 +764,15 @@ static inline void hid_set_drvdata(struct hid_device *hdev, void *data)
 	dev_set_drvdata(&hdev->dev, data);
 }
 
+#ifdef CONFIG_HID_BATTERY_STRENGTH
+static inline struct hid_battery *hid_get_first_battery(struct hid_device *hdev)
+{
+	if (list_empty(&hdev->batteries))
+		return NULL;
+	return list_first_entry(&hdev->batteries, struct hid_battery, list);
+}
+#endif
+
 #define HID_GLOBAL_STACK_SIZE 4
 #define HID_COLLECTION_STACK_SIZE 4
 
-- 
2.51.1


