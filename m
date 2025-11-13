Return-Path: <linux-input+bounces-16062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8843AC54E21
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 01:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0A270349BE5
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 00:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643DC158DA3;
	Thu, 13 Nov 2025 00:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaXiyMzl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DAQSbhmH"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870F476026
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 00:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762992923; cv=none; b=Y3Enu8aD1Gj6t/K6vsaWB5BDxlzmYc+Lj916GDe0ZjbgGJ7/5rVINc7AYDC0N3lI6K6KBSD1cCua5/8ZcFqj1sTQV2XcAfl+AJ5Ufsev2bbJ22grkOvIGne8WkXcU/RRYCHGNbwEAlMLGEVdMpXhCMxqsPtOpzzt2H7cHScASUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762992923; c=relaxed/simple;
	bh=iFZsqRH5eByoiejBJe2tCpiSPFSMdpwxoI77YoyNZXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V2sWWjVHioya2K58b99rH7CIw5tL3+NfkT5pKtkm5mJEl0cqQzmh4apZGONsBh+EOCklRiN3Q8XoaQqzUOXG28VoCFFq3nqSHR4kTGcAoAvIVWbri9swjddJ22FA2lDQn7eUesnUQFeJi8FqWg9e2UWZ1eHSOvQelK+MddN110o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YaXiyMzl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DAQSbhmH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762992919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+jraoxNmzCzqfQSJ06TY8sylDjJVSc0Y8i9xrHNp7CU=;
	b=YaXiyMzlTwPqGMpgc5eG83ZCjewJrPDw6X6NugAiccE3WwtFhxfSVZYaxStf+RxSSDA0O1
	zkY0LpIPkya3lYaQDD9f2zoOZXUkrxqPCa7LaIrAKD/dmEHnwZipmU3Cug4Bq+pKMZDdcI
	dEKggD8T12UvY4QtxnfXJ2Q6GU3PgBc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-YnYbWA69NY6-DD2ikit4PA-1; Wed, 12 Nov 2025 19:15:18 -0500
X-MC-Unique: YnYbWA69NY6-DD2ikit4PA-1
X-Mimecast-MFC-AGG-ID: YnYbWA69NY6-DD2ikit4PA_1762992917
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso1160865e9.2
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 16:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762992916; x=1763597716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jraoxNmzCzqfQSJ06TY8sylDjJVSc0Y8i9xrHNp7CU=;
        b=DAQSbhmH4LFfl+xKyVqupVADAuiQCm5i9F0DH6OFP7I/TliDuFJX2EnCsG8UUXsY3Y
         VZSPC4q34Q9CDDeR8BfcEDMmKYXm4mp2kZACoa4Elnv8L5GfXS23b1Qqr0zX/FEum9YF
         chVRKzWj354uCTjY05w5ctSV8gY4ktqdpZSoSAu1ClXDEvXSZ4ymWSju59Ulkq/pRTv7
         Yo2fv2quRqcyx6Q0KAFGfU9JfHdvIg1ZKTTuoAdT2Qvn/7K7FSJkUlspKNz59eZvYDCL
         PP83+AMPE+8HcFyAWkDUTJLQbd73KoXG0zYpk1z82d07LUn2o9KEzXtEC65Bu5/UmkcM
         tCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762992917; x=1763597717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+jraoxNmzCzqfQSJ06TY8sylDjJVSc0Y8i9xrHNp7CU=;
        b=koHQxMsIYzYTW+IIzgXpeiFNrCnaVd7eGfVK2R/TPv62KvuASGuNd1gspNU+gjdzKs
         /liWtbTKUkd13UP7pzzCdVLCCd9y/d7yHBwduxqJQrwKr2a3sdchKHcG7SFCv6HhOITe
         1GqzPYO8sRlgoFoSkpU+9oSaygop9KTeQe0xcyaJ/I85XL1r8FBEL6vxegFIaXHy7GsN
         By7afR+XHM3D93GvzFS79CV3XHl314wGMhwOz+t6Gdr8RpCEYFlvFb5HAyubliXTVuVj
         cXJ4xtnRc2uP8Hfsd6A3KaiLTk73COPK69T/IzWyVpX8oYRSnrS50xqXBPtzhksxUApG
         orfA==
X-Gm-Message-State: AOJu0YxZaWkm+mYTK3roUDpfsiUYtyKGbNv606u4HkU2/U27ypCDWUu1
	P7Del8G93JG2NDr81mh/5/xWRhyMWDrH4yPTsqNLbJUYjDppZtfqOh6d7Rx8oHCYXBpEzzUJ9A4
	x6ZoxJotCzhaWXSm0RXpOu7QK4h93QnCzarQ0sVowFd5VrRKTsHo9dFJNkBJJlO4NUkj8mBCTnj
	dF6Kh7LrHtMNZoiPdmQkknrRYF8mceQ4vM/Jie7v8FfkakUxrL
X-Gm-Gg: ASbGncuDx+7eUJuUEJbza4tP0mo04oGYf1UWSrwKt+U804FEQ7smeOe2MdzUjVZGAng
	osfjrqhpgUjaSDyVugYrJ2PUm6lll7qtkl+xQOz4Ckty5gwpZUdXMPL4i/gpQbhzgn1cecWVnBZ
	RtIwY1UNDe6RuZTkWsKVr+/mSnWQIvC7uq4Cc5LP1yhpqtLspnfDoCMVVHPgamSava96T0uNK+L
	akkqc0vDcFSXGfdjb8elshQzmoSIjWflWqogS9lBLq7cOZs8ua/0kQ3EWHq4qccegeLywfGQ7Q9
	mG01GN4FHx2NVdLRxgj0s7lQb/UQhsZJNbii2VREmnHNdZocehRJo4ll9xDdM2LKwQY1zhrLyzb
	MG/FUSuvPVugiug==
X-Received: by 2002:a05:600c:138a:b0:477:19b7:d3c0 with SMTP id 5b1f17b1804b1-4778703d63emr49826615e9.2.1762992916574;
        Wed, 12 Nov 2025 16:15:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqqQ7G2RU6cj93XJDUMviHL5Kr7pxCjAO+RqdjhI94usTzWHkoFMclayr8p3zMJ/v1JLLkIQ==
X-Received: by 2002:a05:600c:138a:b0:477:19b7:d3c0 with SMTP id 5b1f17b1804b1-4778703d63emr49826415e9.2.1762992916150;
        Wed, 12 Nov 2025 16:15:16 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b589sm432983f8f.23.2025.11.12.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 16:15:15 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org
Subject: [RFC PATCH v2 2/3] HID: input: Refactor battery code to use struct hid_battery
Date: Thu, 13 Nov 2025 00:15:04 +0000
Message-ID: <20251113001508.713574-3-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113001508.713574-1-lzampier@redhat.com>
References: <20251113001508.713574-1-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the battery handling code to use the newly introduced
struct hid_battery internally, replacing direct access to individual
power_supply and state fields.

The legacy dev->battery and dev->battery_* fields are maintained and
synchronized for backward compatibility. This refactoring prepares
the code for supporting multiple batteries per device in a subsequent
patch.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/hid/hid-input.c | 125 ++++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 42 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e56e7de53279..0e71efea9da3 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
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
+		if (bat->status != HID_BATTERY_REPORTED &&
+		    !bat->avoid_query) {
 			value = hidinput_query_battery_capacity(dev);
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
+		if (bat->status != HID_BATTERY_REPORTED &&
+		    !bat->avoid_query) {
 			value = hidinput_query_battery_capacity(dev);
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
@@ -513,8 +514,9 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 				  struct hid_field *field, bool is_percentage)
 {
+	struct hid_battery *bat;
 	struct power_supply_desc *psy_desc;
-	struct power_supply_config psy_cfg = { .drv_data = dev, };
+	struct power_supply_config psy_cfg;
 	unsigned quirks;
 	s32 min, max;
 	int error;
@@ -530,16 +532,22 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	if (quirks & HID_BATTERY_QUIRK_IGNORE)
 		return 0;

-	psy_desc = kzalloc(sizeof(*psy_desc), GFP_KERNEL);
-	if (!psy_desc)
+	bat = kzalloc(sizeof(*bat), GFP_KERNEL);
+	if (!bat)
 		return -ENOMEM;

+	psy_desc = kzalloc(sizeof(*psy_desc), GFP_KERNEL);
+	if (!psy_desc) {
+		error = -ENOMEM;
+		goto err_free_bat;
+	}
+
 	psy_desc->name = kasprintf(GFP_KERNEL, "hid-%s-battery",
 				   strlen(dev->uniq) ?
 					dev->uniq : dev_name(&dev->dev));
 	if (!psy_desc->name) {
 		error = -ENOMEM;
-		goto err_free_mem;
+		goto err_free_desc;
 	}

 	psy_desc->type = POWER_SUPPLY_TYPE_BATTERY;
@@ -559,63 +567,85 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	if (quirks & HID_BATTERY_QUIRK_FEATURE)
 		report_type = HID_FEATURE_REPORT;

-	dev->battery_min = min;
-	dev->battery_max = max;
-	dev->battery_report_type = report_type;
-	dev->battery_report_id = field->report->id;
-	dev->battery_charge_status = POWER_SUPPLY_STATUS_DISCHARGING;
+	/* Initialize battery structure */
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
+		bat->avoid_query = true;

-	dev->battery = power_supply_register(&dev->dev, psy_desc, &psy_cfg);
-	if (IS_ERR(dev->battery)) {
-		error = PTR_ERR(dev->battery);
+	psy_cfg.drv_data = bat;
+	bat->ps = power_supply_register(&dev->dev, psy_desc, &psy_cfg);
+	if (IS_ERR(bat->ps)) {
+		error = PTR_ERR(bat->ps);
 		hid_warn(dev, "can't register power supply: %d\n", error);
 		goto err_free_name;
 	}

-	power_supply_powers(dev->battery, &dev->dev);
+	power_supply_powers(bat->ps, &dev->dev);
+
+	/* Maintain legacy single battery fields for backward compatibility */
+	dev->battery = bat->ps;
+	dev->battery_min = bat->min;
+	dev->battery_max = bat->max;
+	dev->battery_report_type = bat->report_type;
+	dev->battery_report_id = bat->report_id;
+	dev->battery_charge_status = bat->charge_status;
+	dev->battery_status = bat->status;
+	dev->battery_avoid_query = bat->avoid_query;
+
 	return 0;

 err_free_name:
 	kfree(psy_desc->name);
-err_free_mem:
+err_free_desc:
 	kfree(psy_desc);
-	dev->battery = NULL;
+err_free_bat:
+	kfree(bat);
 	return error;
 }

 static void hidinput_cleanup_battery(struct hid_device *dev)
 {
+	struct hid_battery *bat;
 	const struct power_supply_desc *psy_desc;

 	if (!dev->battery)
 		return;

+	bat = power_supply_get_drvdata(dev->battery);
 	psy_desc = dev->battery->desc;
 	power_supply_unregister(dev->battery);
 	kfree(psy_desc->name);
 	kfree(psy_desc);
+	kfree(bat);
 	dev->battery = NULL;
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
+		/* Update legacy field for backward compatibility */
+		if (bat->dev->battery == bat->ps)
+			bat->dev->battery_charge_status = bat->charge_status;
 		return true;
 	}

@@ -625,32 +655,43 @@ static bool hidinput_update_battery_charge_status(struct hid_device *dev,
 static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
 				    int value)
 {
+	struct hid_battery *bat;
 	int capacity;

 	if (!dev->battery)
 		return;

-	if (hidinput_update_battery_charge_status(dev, usage, value)) {
-		power_supply_changed(dev->battery);
+	bat = power_supply_get_drvdata(dev->battery);
+
+	if (hidinput_update_battery_charge_status(bat, usage, value)) {
+		power_supply_changed(bat->ps);
 		return;
 	}

 	if ((usage & HID_USAGE_PAGE) == HID_UP_DIGITIZER && value == 0)
 		return;

-	if (value < dev->battery_min || value > dev->battery_max)
+	if (value < bat->min || value > bat->max)
 		return;

 	capacity = hidinput_scale_battery_capacity(dev, value);

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
+
+		/* Update legacy fields for backward compatibility */
+		if (dev->battery == bat->ps) {
+			dev->battery_capacity = bat->capacity;
+			dev->battery_status = bat->status;
+			dev->battery_ratelimit_time = bat->ratelimit_time;
+		}
+
+		power_supply_changed(bat->ps);
 	}
 }
 #else  /* !CONFIG_HID_BATTERY_STRENGTH */
--
2.51.1


