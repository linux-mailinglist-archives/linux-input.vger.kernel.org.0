Return-Path: <linux-input+bounces-16696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B85CDF22E
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 00:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0177300E790
	for <lists+linux-input@lfdr.de>; Fri, 26 Dec 2025 23:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3E82857F1;
	Fri, 26 Dec 2025 23:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6lzhDdf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A42857FA
	for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 23:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793251; cv=none; b=DjLW7C0+8VtuU20yrtLrdvXt0Iw9eFrndZyPZUe9KNUZW3+QiX3Tp1ud5jybgYtmUqfpxDMjM9W8vbRGHJkvZ9HskdRZaDYkIPG1e4J1N+shyrk3IK797JdsN31hIPNOVH00TdN8tSkQNV+NbRnro1bd0VNQlCAa1Jm6LDkS8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793251; c=relaxed/simple;
	bh=EHO8zs+g1Ko8UHjpjUG4wCs7CJMj3UxzMt+d6rQqm7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1OzKpu3Gc6NBxLH3uv88RsRwHQPALIO9HiV3kWKZpfr+6oHAb5PMWhJ6ptqBmPMZufHXpcPwrD7V61Udyj1eoPg3DzKU/n39J5s+rHHzKeBPNJcJbZn5VSrXIp2jTwKpI36rrMemTD5BH5LvupS3JsCmHILSRlSRgnaeWXmpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6lzhDdf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so9327250b3a.3
        for <linux-input@vger.kernel.org>; Fri, 26 Dec 2025 15:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793248; x=1767398048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=j6lzhDdfGg1c3OQzxctuT0XS6lBZ7dk6RD6hCvaNbTmGB0a/FhEPY7/5kg4LsIIIUG
         ja7L+RBCw28iP2l8h3XrBFYD3RkkhJndl4F4j4JJXMt0qURBX3Oc7pAYADJYJQ0jM+xh
         ZW3/57S+SMa02uGMsCQ6iNTbNw4klpZgsaDGOchrko6ySpqT5E6zkzrEtcEFGCcLxE39
         26YVl2vbYF98ZEipxPU2YESSVOVhn+Rojptk94jStkN/Zkh2aoU+vmuFbFv6PgF5ZWm2
         MebYRFAqE63YKo9lkUl6CZaYFHy2pmL7FrkzKFBcgNND/x1rmB7FcVVE2P7tc5WnbxVp
         pTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793248; x=1767398048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5DU1y+/2ttdbcr+v/9sCW2fX8t95H3Z19WR35X2oK4=;
        b=L10rD0UJIhVzNL+BET2by9+6wHVUqBhormTGLAk/FCzktNrXxcRdrEfX6CdEl8ljaE
         16ex1u1Jzr3RwL/iltX3jnaPyTJ2TlFk/ZrHcPtxaamwz0kXQxrqoShsiW2b46RDDgLF
         5gnCWaNT34ptU0+IwciT7q1z/amMxLM68qhwwrmLcCIUo6yufJV9SJkL5oN+6T18LUm8
         Snpp3/lmF6al5UT2EC72gWbHEFal+rMhlzWVliaabiM2F3F2Bh8nNOyHUIVUHcRfVoDG
         kVmjvqCWp3Fzef3NDcFQB0PzjAe/exmiQM1pVp3iXdefaZOWrINSTL+SPfnSwtrmdfMx
         zksw==
X-Forwarded-Encrypted: i=1; AJvYcCXL24g9m8hJmnwNR2yV9hf9+IpyjptNfLud5sGPm4uJ0LJxleoZSoZEnrKNsEvxOo+qc09ey7HHxsPXvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHkNuGI88L9UZIWGqZwbuFrOtdvWjPZhLlU+hI/OkvbhdF99D
	mr80JogXVqYGA735lcI3ssGiKkrMe01hJ9FS+Pw2GxQYkeaN7OhB7dDw
X-Gm-Gg: AY/fxX4BPPwzJGQtBEVYn2j8c+dY5hgAArsudXdm010CCst21dTyimSHZ3y6Hi72Yj7
	9j+UnlP57sp08OWLRFDmLPuCGci5fjKkiggbDoQXFhZC2kJb7etJT9uqCmpfiuHKxRp7nq5+YDM
	90UThYGaDHJ1cfRwdmNnIe9E0ahyPm8NEEd8dwPFWoj6q/2iNdXgkSFeak2OYccRu/KEb48gW/k
	P5ew+DHhoGWLWNgLECoGdKvCvl0X0G5T+EOhnRz8zQa07nsY8YivDb/d7CwEyxpc4SA47RsebLI
	YmfmCHK4xS9Qp/gPI2YdcKiHcjjCDSYfMoEb5HnE4LrwmMrXg5uZY5q5+agDeFz9Lu5l8vNtVQL
	RM5DCujUExDcN6AV0Z9WqJ/1asOpw5Gapr4LU5brreBxb0mwx60rI7aARXy8w4ag7v4kgjEKcNe
	euGWoxqK/yV5jq4Vj/QwlEP+Boy5wLpaJjyM8opVMfehOCFh5mXIqCZuvqwt/5NLJHfw==
X-Google-Smtp-Source: AGHT+IGHZNdiYUAkHVfUtkTTfJbCMz+mzs2nqIy6hLh/pD7Fj59xEYPwd2APipEMKlpWGct6gJgcbA==
X-Received: by 2002:a05:6a20:12c9:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-376aa4fc463mr26589388637.40.1766793248246;
        Fri, 26 Dec 2025 15:54:08 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:07 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 2/3] platform/x86: thinkpad_acpi: Add sysfs control for TrackPoint double-tap
Date: Sat, 27 Dec 2025 08:51:00 +0900
Message-ID: <20251226235101.106451-3-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a sysfs attribute to enable or disable TrackPoint double-tap hotkey
events at the kernel level.

The TrackPoint firmware enables double-tap support automatically. This
interface allows userspace to control whether double-tap events are
forwarded to userspace.

The attribute is available at:

  /sys/devices/platform/thinkpad_acpi/doubletap_enable

  0 - Disable double-tap hotkey events
  1 - Enable double-tap hotkey events (default)

Filtering is implemented by suppressing ACPI hotkey delivery without
injecting synthetic input events.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v2:
- Updated commit message to clarify dependency on trackpoint driver
- Now handling sysfs read/write of trackpoint driver using file read/write
- Removed sysfs attribute creation of trackpoint double tap here
- Reversed the logic and return false right away
- Dropped unnecessary debug messages
- Using dev_dbg() instead of pr_xxxx()

Changes in v3:
- No changes

Changes in v4:
- Simplified approach: single sysfs attribute for user control
- Clear naming: doubletap_filter instead of doubletap_enabled
- Intuitive behavior: 0=process events, 1=filter events
- No cross-driver dependencies or complex interactions
- Minimal code changes using existing thinkpad_acpi infrastructure

Changes in v5:
- Rename doubletap_filter to doubletap_enable to match actual behavior
- Fix inverted logic so events are emitted only when doubletap is enabled
- Register sysfs attribute via hotkey_attributes[] (no device_create_file)
---
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 42 +++++++++++++++++----
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index cc19fe520ea9..ca01323c990a 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -373,7 +373,7 @@ static struct {
 	u32 hotkey_poll_active:1;
 	u32 has_adaptive_kbd:1;
 	u32 kbd_lang:1;
-	u32 trackpoint_doubletap:1;
+	u32 trackpoint_doubletap_enable:1;
 	struct quirk_entry *quirks;
 } tp_features;
 
@@ -3018,6 +3018,31 @@ static const struct attribute_group adaptive_kbd_attr_group = {
 	.attrs = adaptive_kbd_attributes,
 };
 
+/* sysfs doubletap enable --------------------------------------------- */
+static ssize_t doubletap_enable_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	return sysfs_emit(buf, "%d\n", tp_features.trackpoint_doubletap_enable);
+}
+
+static ssize_t doubletap_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	bool enable;
+	int err;
+
+	err = kstrtobool(buf, &enable);
+	if (err)
+		return err;
+
+	tp_features.trackpoint_doubletap_enable = enable;
+	return count;
+}
+
+static DEVICE_ATTR_RW(doubletap_enable);
+
 /* --------------------------------------------------------------------- */
 
 static struct attribute *hotkey_attributes[] = {
@@ -3032,6 +3057,7 @@ static struct attribute *hotkey_attributes[] = {
 	&dev_attr_hotkey_recommended_mask.attr,
 	&dev_attr_hotkey_tablet_mode.attr,
 	&dev_attr_hotkey_radio_sw.attr,
+	&dev_attr_doubletap_enable.attr,
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	&dev_attr_hotkey_source_mask.attr,
 	&dev_attr_hotkey_poll_freq.attr,
@@ -3557,8 +3583,8 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 
 	hotkey_poll_setup_safe(true);
 
-	/* Enable doubletap by default */
-	tp_features.trackpoint_doubletap = 1;
+	/* Enable TrackPoint doubletap event reporting by default. */
+	tp_features.trackpoint_doubletap_enable = 1;
 
 	return 0;
 }
@@ -3863,9 +3889,9 @@ static bool hotkey_notify_8xxx(const u32 hkey, bool *send_acpi_ev)
 {
 	switch (hkey) {
 	case TP_HKEY_EV_TRACK_DOUBLETAP:
-		if (tp_features.trackpoint_doubletap)
-			tpacpi_input_send_key(hkey, send_acpi_ev);
-
+		/* Only send event if doubletap is enabled */
+		if (!tp_features.trackpoint_doubletap_enable)
+			*send_acpi_ev = false;
 		return true;
 	default:
 		return false;
@@ -11285,7 +11311,9 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		mutex_unlock(&tpacpi_inputdev_send_mutex);
 		return true;
 	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
-		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
+		/* Toggle kernel-level doubletap event filtering */
+		tp_features.trackpoint_doubletap_enable =
+			!tp_features.trackpoint_doubletap_enable;
 		return true;
 	case TP_HKEY_EV_PROFILE_TOGGLE:
 	case TP_HKEY_EV_PROFILE_TOGGLE2:
-- 
2.51.0


