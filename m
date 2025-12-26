Return-Path: <linux-input+bounces-16692-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B6DCDEA17
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 12:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51A0E303A0AB
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09D231AA96;
	Fri, 26 Dec 2025 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KdyOpjD6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHORhA7q"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A031A7FA
	for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766747441; cv=none; b=R+1bCXfr+rf+VEXinCU/0zG9QUSou0mie5LtOSOtrVkNgwklrtF/9OfRwcW9wOlKjifUgeUTesVYHrw9bfj4LgP/s5lSDUKYdQ6oEVwYtiH1iHYsLymGB/hI/DD5liPe8Wu+tf4UnDkwdYO/21VrDcRrq6GN6VZ7ChcL2wvmx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766747441; c=relaxed/simple;
	bh=Rn1+K+oDKCqxE1iwfPRSHgU9Q3fMkg2TcTCaOkKZL0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gz2NNSDWFbnQIRCzj5LhFfzUbLYI68ypCf1ScCQ1G7q/ZIqn5ZLxXv2tUDlRHfVDJoxdGHV9HycNX28lTuLjx7D2rgHsxOyjRFPB4g683504VouujMz8NDsUE9kKjwkLiGsmYTdfMD7QrpbQ5aXdbqkWo199ydQtJnnc+mYQQ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KdyOpjD6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHORhA7q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766747436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoSNpVz84k6O+emje+qv97k+nCpKT4dVeE4/DACkgMQ=;
	b=KdyOpjD6gOIVqLakpyHjGi0CGOvX1je4ox5LEVJo8og5Vh9lYsFVu7h0H+OIuM+pB5VePA
	Tz5urj6Lrkf/n2UmcaePYlqjPOa/9N2Ti9lhLiW/r0gtKrA5/9PLECtVzq69xARERWE52f
	DLFMixJgLR3B0vZSw1kPTDPZojF7ib4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-rW5LCn2xPF-HiqTOKRO6DA-1; Fri, 26 Dec 2025 06:10:32 -0500
X-MC-Unique: rW5LCn2xPF-HiqTOKRO6DA-1
X-Mimecast-MFC-AGG-ID: rW5LCn2xPF-HiqTOKRO6DA_1766747428
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47918084ac1so60251105e9.2
        for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 03:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1766747428; x=1767352228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoSNpVz84k6O+emje+qv97k+nCpKT4dVeE4/DACkgMQ=;
        b=jHORhA7q1RTfI507fEN/OERgeVrwGF7v5LUw0JJdzmnLFYqWs3tB5E0EBAKP/8yqMX
         wx2M5pHvDe5zOyAC3ZcUTxtFR06/3ubi+bcNVRtppq2lmdMRopoM121hbZygnA4iMUsQ
         z8PG9YSmT7tQa8wto+RHdxt8JciI2l+dtQ9rz7HZjGv8IIXceQbi8fwiS5nrTwRZas42
         M74sbEDPTQj1zMNj6nadvefo0DyphuwqSxroZNTtbvQqtL6M4PMrYDwC2VKdAd+bJya1
         zFJtS68PCEp8O7zydtYNzyd5hGLUCMeKKowDgamYa7hrgg/CunLl53gSWi6DDVj2wVmg
         6kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766747428; x=1767352228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoSNpVz84k6O+emje+qv97k+nCpKT4dVeE4/DACkgMQ=;
        b=ROPhgzKHaiLQxH+mt8/Cz3dqEO4KV+b+k0wgS5fKb+qMRbHzTYSIiK9u4FRB/1Hw8v
         EYCQRZ68HQxFJRzq+FnuwHk1cc58sEloYjketMedrMNdgVbX55xTFtFX7cxtrrfxoKDt
         /RTRoANFaU577Zg41UF0uCMKyp4S+pcZ7LGoR/lsPAacIDsDKP2QtgXVYeoCUChGAq8S
         aBM0s2gy6HcHjenzdk7a6t3X9vwz6LZVo9mBWUvfGbWzTyQfIS9Y0BXPzyLovK9XR8lS
         g6aMrxRK/2xj3D++LZoJwLxvdOQlO2C/HBZ1fRobpEG47MRhRQ1hgjbAsb9yJVMYW32P
         kR+g==
X-Gm-Message-State: AOJu0YxbKE5mUQn6Bt202abiSXsnUZBgs+hgyoazexzjnJE7xFmGYDwm
	31OoqJl0FMysQH7xO4CPIRe0lzG4nRKVv3ZSsqeouU1MZ0I71jg0+M2zPq67tXKnuILeIy3L2+P
	6B2MvQAOI5z9CWoYMI5AnU5nbXX4svmvE09fJ7l8Y0s5DaiWLmWY2fD4oD/8Er4uTI0wdTTkZgf
	X/Xh35bQPlKbFYUoZCWwS4pkUTs5BZ8aRK4tOEELKWjiUun/6lMlk=
X-Gm-Gg: AY/fxX6W1yvzQCc/n/XAcTGnDuflyyA76VbwzZdeGnWxgxnbhovaAy6a3naDgLXfklT
	LSJfmdlGowsbaAoyyKOK2AQ8ILbL1kA0aSsefH5gLDsDPP7V8taeQsXZzB06fw2v2nuUw6yFlTF
	niCehceDCsoGJxW+I4PXt9lQ290gm5GaYj7tKTsUsDYv7nmVg2PNvMET2EFB+N/qCs2qqlcu2jE
	PXlALUO8oFX4PlTV+QEf4wrP2aaaRGYOU9FUN6rdw9huwrgoGZKQx3hRLQb9tJPzWIEfPzB0Ss9
	Z0Yap5tO0gyZUS62Vj5YJBdYPfTBpfLMxzca0/WjcnZu/1v71XjfwDKu3fv2mvhKgIVyXJ6Mw2M
	cvFMwtQdcdWUQ+4R82TxPGWW3Xsfh0mX8OeJzQ9YHgO43PEQFtvJBVvRcYXFCrNs5bsrKFwvF2g
	X8XNfmaqD00A==
X-Received: by 2002:a05:600c:4fd4:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47d1958a43fmr220083785e9.19.1766747427798;
        Fri, 26 Dec 2025 03:10:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEU4MGJHqxBEWn5UWS0CJv1A2i60wxgLqqXa5EqtmhmRyIjWHos23C9iDTSKsLczNxqr/tUVQ==
X-Received: by 2002:a05:600c:4fd4:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-47d1958a43fmr220083225e9.19.1766747427304;
        Fri, 26 Dec 2025 03:10:27 -0800 (PST)
Received: from sissix.lzampier.com ([2a06:5900:814a:ab00:3725:2991:6cf3:b3aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm375653855e9.13.2025.12.26.03.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 03:10:26 -0800 (PST)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-input@vger.kernel.org
Cc: Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	linux-pm@vger.kernel.org,
	lcasmz54@gmail.com
Subject: [PATCH v6 3/3] HID: input: Add support for multiple batteries per device
Date: Fri, 26 Dec 2025 11:10:16 +0000
Message-ID: <20251226111019.31243-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226111019.31243-1-lzampier@redhat.com>
References: <20251226111019.31243-1-lzampier@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for HID devices that report multiple batteries, each
identified by its report ID.

The hid_device->battery pointer is replaced with a batteries list.
Batteries are named using the pattern hid-{uniq}-battery-{report_id}.
The hid_get_battery() helper returns the first battery in the list for
backwards compatibility with single-battery drivers.

Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/hid/hid-core.c  |  4 ++++
 drivers/hid/hid-input.c | 44 ++++++++++++++++++++++++++++-------------
 include/linux/hid.h     | 11 ++++++++---
 3 files changed, 42 insertions(+), 17 deletions(-)

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
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c2d16236c638..445d6f160be8 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -511,6 +511,18 @@ static int hidinput_get_battery_property(struct power_supply *psy,
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
@@ -521,13 +533,15 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	s32 min, max;
 	int error;
 
-	if (dev->battery)
-		return 0;	/* already initialized? */
+	/* Check if battery for this report ID already exists */
+	if (hidinput_find_battery(dev, field->report->id))
+		return 0;
 
 	quirks = find_battery_quirk(dev);
 
-	hid_dbg(dev, "device %x:%x:%x %d quirks %d\n",
-		dev->bus, dev->vendor, dev->product, dev->version, quirks);
+	hid_dbg(dev, "device %x:%x:%x %d quirks %d report_id %d\n",
+		dev->bus, dev->vendor, dev->product, dev->version, quirks,
+		field->report->id);
 
 	if (quirks & HID_BATTERY_QUIRK_IGNORE)
 		return 0;
@@ -542,9 +556,11 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 		goto err_free_bat;
 	}
 
-	psy_desc->name = devm_kasprintf(&dev->dev, GFP_KERNEL, "hid-%s-battery",
+	psy_desc->name = devm_kasprintf(&dev->dev, GFP_KERNEL,
+					"hid-%s-battery-%d",
 					strlen(dev->uniq) ?
-						dev->uniq : dev_name(&dev->dev));
+						dev->uniq : dev_name(&dev->dev),
+					field->report->id);
 	if (!psy_desc->name) {
 		error = -ENOMEM;
 		goto err_free_desc;
@@ -595,7 +611,7 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	}
 
 	power_supply_powers(bat->ps, &dev->dev);
-	dev->battery = bat;
+	list_add_tail(&bat->list, &dev->batteries);
 	return 0;
 
 err_free_name:
@@ -604,7 +620,6 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	devm_kfree(&dev->dev, psy_desc);
 err_free_bat:
 	devm_kfree(&dev->dev, bat);
-	dev->battery = NULL;
 	return error;
 }
 
@@ -622,12 +637,13 @@ static bool hidinput_update_battery_charge_status(struct hid_battery *bat,
 	return false;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
-				    int value)
+static void hidinput_update_battery(struct hid_device *dev, int report_id,
+				    unsigned int usage, int value)
 {
-	struct hid_battery *bat = dev->battery;
+	struct hid_battery *bat;
 	int capacity;
 
+	bat = hidinput_find_battery(dev, report_id);
 	if (!bat)
 		return;
 
@@ -661,8 +677,8 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	return 0;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, unsigned int usage,
-				    int value)
+static void hidinput_update_battery(struct hid_device *dev, int report_id,
+				    unsigned int usage, int value)
 {
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
@@ -1530,7 +1546,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		hidinput_update_battery(hid, usage->hid, value);
+		hidinput_update_battery(hid, report->id, usage->hid, value);
 		return;
 	}
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index d14b867299c8..5069ef90cf7b 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -647,6 +647,7 @@ enum hid_battery_status {
  * @capacity: current battery capacity (0-100)
  * @avoid_query: if true, avoid querying battery (e.g., for stylus)
  * @ratelimit_time: rate limiting for battery reports
+ * @list: list node for linking into hid_device's battery list
  */
 struct hid_battery {
 	struct hid_device *dev;
@@ -660,6 +661,7 @@ struct hid_battery {
 	__s32 capacity;
 	bool avoid_query;
 	ktime_t ratelimit_time;
+	struct list_head list;
 };
 
 struct hid_driver;
@@ -698,9 +700,10 @@ struct hid_device {
 #ifdef CONFIG_HID_BATTERY_STRENGTH
 	/*
 	 * Power supply information for HID devices which report
-	 * battery strength. battery is non-NULL if successfully registered.
+	 * battery strength. Each battery is tracked separately in the
+	 * batteries list.
 	 */
-	struct hid_battery *battery;
+	struct list_head batteries;
 #endif
 
 	unsigned long status;						/* see STAT flags above */
@@ -764,7 +767,9 @@ static inline void hid_set_drvdata(struct hid_device *hdev, void *data)
 #ifdef CONFIG_HID_BATTERY_STRENGTH
 static inline struct hid_battery *hid_get_battery(struct hid_device *hdev)
 {
-	return hdev->battery;
+	if (list_empty(&hdev->batteries))
+		return NULL;
+	return list_first_entry(&hdev->batteries, struct hid_battery, list);
 }
 #endif
 
-- 
2.52.0


