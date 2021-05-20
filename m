Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D47389A6E
	for <lists+linux-input@lfdr.de>; Thu, 20 May 2021 02:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhETAYp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 20:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETAYo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 20:24:44 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D705C061574
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:23 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 129-20020a2504870000b0290513326cc5e0so7543727ybe.10
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=AenL15v8bpaPcpQGDiRTmDFhfPfdIWtA5+WOLaYpXgw=;
        b=VvcQtCUz9ro5f/2GJPPyTD4MOGVxvgaJgQJRgMlwvvVGz7PAAvKZpLujlAY+9C68Bg
         B5DY04hCio/63XC1NHKynQL1c7hZpSVf/+ScVEwp7UpeuybzDuP09qIkJIOiZmCP7YYd
         b9VD78GBCfTVEVYO/nnJvz3L/CBIxB6qqb3IE20374UAfE5Y9/DTNAdE2hBUQviuQn77
         tqE7IEOkTINGr7jjNpJXwoaDOE/rzBkxtp1UQMjVX14pIvdFFygpx3Y/AkVdwT0xXpOL
         T9o1CtTzx3Ivq8c+KVs9+8oFfWSkrKFo+XAE7zd8dA8Y9AXGtKgixXdH9nOZZlCEqjNj
         lRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=AenL15v8bpaPcpQGDiRTmDFhfPfdIWtA5+WOLaYpXgw=;
        b=dAZTO94QpeqasyQ+ehnxCUrLoa+s5am+Qwhq5kvF12e9+tUU5baWVVwUAc0Str05pw
         mKxyR3gTev90pXaZL3kclWocW2b9HgPy+eGopvcKWzQzXPtXDVOXOmmg6HSZx7NPIMig
         dha0LyZErfPkKR6LLjjQCFyUwG45PiHN93/dXigkDOTKvs37TlWdM0R2xaLDVaivhHe2
         4hMjhhFroKCOUS89pX4i3jv62MPAcCIMJcFNTEyRqiSgSHs5+JAMvNLFyjHvvumZMG2k
         rWoJMvYbYtnbXId+YeeShO1JMxNcpH273dI6YB82VPSAbuVeajo9a3MGio5wgtIasG8u
         gcdQ==
X-Gm-Message-State: AOAM532ufcRRgfZ+x42o4uf8JbvL0Z9D7UzdSKScRcG7U4EObJJwko6l
        bh/9KEW8nn4KT64HtbLxsWYQjZWUtPnE1nhWG26coKVD8eLF/6NMf045hrZQN1zYS4sqSbsuCij
        lOIdbxI3Uer+r/U32rkW1SUUaMzKiTGCQX2NQZ3R/QmPbWZHljRtru6wa/e1GKeCHr0FOjQ4=
X-Google-Smtp-Source: ABdhPJxQVZWYbp3hCkjs303e+9sQBrIy9DoypVnOE0YqeU+1J7Dl5a5/v6a7VLY/7cGFZnaZNr011LBTJjjf
X-Received: from kenalba1.mtv.corp.google.com ([2620:15c:203:200:4404:83b2:506f:fd71])
 (user=kenalba job=sendgmr) by 2002:a25:1c3:: with SMTP id 186mr3084790ybb.111.1621470202534;
 Wed, 19 May 2021 17:23:22 -0700 (PDT)
Date:   Wed, 19 May 2021 17:22:49 -0700
In-Reply-To: <20210520002249.361821-1-kenalba@google.com>
Message-Id: <20210519143836.3.I9d559632e582daaecdafd995ce7dfd9c89e64838@changeid>
Mime-Version: 1.0
References: <20210520002249.361821-1-kenalba@google.com>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 3/3] [hid] Emit digitizer serial number through power_supply
From:   Kenneth Albanowski <kenalba@google.com>
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID devices that expose a battery strength can have
associated power_supply nodes. This fills in the
SERIAL_NUMBER power_supply field if the same HID device
also has a Digitizer.Transducer Serial Number usage,
effectively allowing that particular stylus to be
identified.

If the field is present and non-zero, the serial number
will be 'DG-ABCD' where 'ABCD' is up to sixteen hex
digits -- field lengths of up to 64-bits are supported,
the largest currently known about.

Devices are expected to emit zero if the transducer
does not have a serial number, or the serial number
has not yet been acquired; zeros will be ignored.

Note that logical min/max (and other HID item
parameters) will be ignored for this field.

Signed-off-by: Kenneth Albanowski <kenalba@google.com>
---

 drivers/hid/hid-input.c | 100 +++++++++++++++++++++++++++++++++++++---
 include/linux/hid.h     |   5 ++
 2 files changed, 99 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ee9e8d31a45ba..c5767ceb4a61c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -286,6 +286,7 @@ static enum power_supply_property hidinput_battery_props[] = {
 	POWER_SUPPLY_PROP_ONLINE,
 	POWER_SUPPLY_PROP_CAPACITY,
 	POWER_SUPPLY_PROP_MODEL_NAME,
+	POWER_SUPPLY_PROP_SERIAL_NUMBER,
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_SCOPE,
 };
@@ -402,6 +403,26 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 		val->strval = dev->name;
 		break;
 
+	case POWER_SUPPLY_PROP_SERIAL_NUMBER:
+		/* Serial number does not have an active HID query
+		 * mechanism like hidinput_query_battery_capacity, as the
+		 * only devices expected to have serial numbers are digitizers,
+		 * which are unlikely to be able to pull the serial number from
+		 * an untethered pen on demand.
+		 */
+		if (dev->battery_serial_number == 0) {
+			/* Make no claims about S/N format if we haven't actually seen a value yet. */
+			strcpy(dev->battery_serial_number_str, "");
+		} else {
+			snprintf(dev->battery_serial_number_str,
+				 sizeof(dev->battery_serial_number_str),
+				 "DG-%0*llX",
+				 DIV_ROUND_UP(dev->battery_serial_number_bits, 4),
+				 dev->battery_serial_number);
+		}
+		val->strval = dev->battery_serial_number_str;
+		break;
+
 	case POWER_SUPPLY_PROP_STATUS:
 		if (dev->battery_status != HID_BATTERY_REPORTED &&
 		    !dev->battery_avoid_query) {
@@ -485,6 +506,8 @@ static int hidinput_setup_battery(struct hid_device *dev, unsigned report_type,
 	dev->battery_max = max;
 	dev->battery_report_type = report_type;
 	dev->battery_report_id = field->report->id;
+	dev->battery_changed = false;
+	dev->battery_reported = false;
 
 	/*
 	 * Stylus is normally not connected to the device and thus we
@@ -526,7 +549,8 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 	dev->battery = NULL;
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery_capacity(struct hid_device *dev,
+					     __s32 value)
 {
 	int capacity;
 
@@ -538,11 +562,57 @@ static void hidinput_update_battery(struct hid_device *dev, int value)
 
 	capacity = hidinput_scale_battery_capacity(dev, value);
 
+	if (capacity != dev->battery_capacity) {
+		dev->battery_capacity = capacity;
+		dev->battery_changed = true;
+	}
+	dev->battery_reported = true;
+}
+
+static void hidinput_update_battery_serial(struct hid_device *dev,
+					   const __s32 *values, int bits)
+{
+	__u64 value;
+
+	if (!dev->battery)
+		return;
+
+	if (bits > 64)
+		bits = 64;
+
+	value = (__u64)(__u32)values[0];
+	if (bits > 32)
+		value |= (__u64)values[1] << 32;
+
+	if (value == 0)
+		return;
+
+	if (value != dev->battery_serial_number) {
+		dev->battery_serial_number = value;
+		dev->battery_serial_number_bits = bits;
+		dev->battery_changed = true;
+	}
+	dev->battery_reported = true;
+}
+
+static void hidinput_flush_battery(struct hid_device *dev)
+{
+	if (!dev->battery)
+		return;
+
+	/* Only consider pushing a battery change if there is a
+	 * battery field in this report.
+	 */
+	if (!dev->battery_reported)
+		return;
+
+	dev->battery_reported = false;
+
 	if (dev->battery_status != HID_BATTERY_REPORTED ||
-	    capacity != dev->battery_capacity ||
+	    dev->battery_changed ||
 	    ktime_after(ktime_get_coarse(), dev->battery_ratelimit_time)) {
-		dev->battery_capacity = capacity;
 		dev->battery_status = HID_BATTERY_REPORTED;
+		dev->battery_changed = false;
 		dev->battery_ratelimit_time =
 			ktime_add_ms(ktime_get_coarse(), 30 * 1000);
 		power_supply_changed(dev->battery);
@@ -559,7 +629,17 @@ static void hidinput_cleanup_battery(struct hid_device *dev)
 {
 }
 
-static void hidinput_update_battery(struct hid_device *dev, int value)
+static void hidinput_update_battery_capacity(struct hid_device *dev,
+					     __s32 value)
+{
+}
+
+static void hidinput_update_battery_serial(struct hid_device *dev,
+					   const __s32 *values, int bits)
+{
+}
+
+static void hidinput_flush_battery(struct hid_device *dev)
 {
 }
 #endif	/* CONFIG_HID_BATTERY_STRENGTH */
@@ -1273,7 +1353,9 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
 	input_event(input, EV_REL, usage->code, hi_res);
 }
 
-void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, const __s32 *values, unsigned value_count)
+void hidinput_hid_event(struct hid_device *hid, struct hid_field *field,
+			struct hid_usage *usage, const __s32 *values,
+			unsigned value_count)
 {
 	struct input_dev *input;
 	unsigned *quirks = &hid->quirks;
@@ -1290,9 +1372,13 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
 		return;
 
 	if (usage->type == EV_PWR) {
-		hidinput_update_battery(hid, value);
+		hidinput_update_battery_capacity(hid, value);
 		return;
 	}
+	if (usage->type == EV_MSC && usage->code == MSC_SERIAL) {
+		hidinput_update_battery_serial(hid, values, field->report_size);
+		/* fall through to normal standard MSC_SERIAL processing */
+	}
 
 	if (!field->hidinput)
 		return;
@@ -1423,6 +1509,8 @@ void hidinput_report_event(struct hid_device *hid, struct hid_report *report)
 {
 	struct hid_input *hidinput;
 
+	hidinput_flush_battery(hid);
+
 	if (hid->quirks & HID_QUIRK_NO_INPUT_SYNC)
 		return;
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 8494b1995b10b..d5585a99b5ad9 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -587,8 +587,13 @@ struct hid_device {							/* device report descriptor */
 	__s32 battery_max;
 	__s32 battery_report_type;
 	__s32 battery_report_id;
+	__u64 battery_serial_number;
+	int battery_serial_number_bits;					/* Actual number of bits in SN */
+	char battery_serial_number_str[20];				/* Space for "DG-" + max 16 hex digits */
 	enum hid_battery_status battery_status;
 	bool battery_avoid_query;
+	bool battery_changed;
+	bool battery_reported;
 	ktime_t battery_ratelimit_time;
 #endif
 
-- 
2.31.0

