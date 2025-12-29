Return-Path: <linux-input+bounces-16714-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 296E1CE5D0A
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 04:18:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D66F83000DC6
	for <lists+linux-input@lfdr.de>; Mon, 29 Dec 2025 03:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343B71B983F;
	Mon, 29 Dec 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8pYdAwB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737E223EAA3
	for <linux-input@vger.kernel.org>; Mon, 29 Dec 2025 03:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766978281; cv=none; b=L/JwGeI2VGoGv3SUx9/pEfijgyJekE3GJko6ahpNXARzJzQWTunc2RPlh2SWHc1l9HFiPRpVPPA2uq88JRMrrudi5vt8rekU5hP0Hb7Qxn0Ozvrlt2EQIryq+XdHi5XlMFCBRKOTKVPCjnAfmNRdBG2fna31hKobGuFtBiC/2PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766978281; c=relaxed/simple;
	bh=JYwujQFMXSGgCntgSP08tb0z8gWWluEo30iDiljW/dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a4xDt5k9Va/ldE9f/H5GhSZM7eY68emHNnrAVEMRM8Ok1O4nzDlxWYZq6BDHwCTUnna5R5MsGB5fKUmOvaLeTLfQlZlehUs65GGSuOv54AD+nVIOdOnOXL1Wnw0q4eRxE3l/blKkh3ZMi3lbORJ4XfwDsG6WGT8xY6L2tktujjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8pYdAwB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo9741369b3a.2
        for <linux-input@vger.kernel.org>; Sun, 28 Dec 2025 19:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766978279; x=1767583079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jny3euFMoUvIIQc8PkVqUx2UEsum5WbafcB5Jo0OEm4=;
        b=m8pYdAwBYj/E9TBk4zT2/LZH91X5e1BrntbTrXBOvaCVHyxs8BigWfzTi2YnYcdFtq
         gva4Vor3jVOke0CogBm8eVgTcjKyJH1Edak+QNeSzfoHJiXPJDRINUcz+6MJ3eAqbOcI
         /F58yort6NG/RzofxcOCyjJjoDRFSqWI8W9yPrkk22drhTDKIHubCr4QxHAemif4o7oE
         5Tfn2EU+wae2g7fKcj0QIHjAuGmk2DfiiODQyy3lleb6SFRLq/p75B7uInZa3+9pctfQ
         QbFTJtNnkl8Jr1kSiQp09hme0ce0ebDxry6PPlRPn5YoHntj02aoJjR8TDxLeOnVY6Q3
         DcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766978279; x=1767583079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jny3euFMoUvIIQc8PkVqUx2UEsum5WbafcB5Jo0OEm4=;
        b=gJR28ztOtXWIAqf8g7miUJK0l2xul7XPqL2NGb05tKbl293UXFROGMTQwy6CXDV/Jv
         xE9U6yWAzQTZYl664+nb4T/6uHfAG00VgjM3sRV+grAQELY/4OiMnzG1J3/TafrSEaLY
         G1H7LFoyDl6gzNpOKMemvv9zT04i3yLW5JWQTmZpPD3zq2KovfGlPmntp5QXmnVeU69o
         BSPWVsa2/vltVmykYTMqg0kIgU8vQjAMUK+hfHrCVjp2DtkzLpHGCN0i1dLhMZKLasyX
         ZTqrqcXNaUvv+ctfprC8+FhErCvJcopM0oIsQ2jPLpIxicCKccKI6V+pvdk/k1nzMmBK
         8nOg==
X-Forwarded-Encrypted: i=1; AJvYcCWc1rCJ+wLveNlux1t4FgRqsHdMziiQLn3y+beFIHFSNq4z8QX9JbOGL1/gAg84eS21EMseX8Yd9a4TqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWAHEU6VX9QZPE8MhNcC1S7Pqryj3+VaAodNh5fa+kGu00Eg2x
	dpYTKeORW4uk3uGNriWZcAgJwTSyk5bKVzReYDtSedTOx3tBdBci2WCU
X-Gm-Gg: AY/fxX6Cyl9OmgSksUTtPjWMbrIHTR2foboNTH3ubIyvZ13tONuFJaqf+DJNN2yba0Q
	tNiWxgQbO3rz8Jap5wj2HzwdqFTIYLRQxm2VfTR4ZexaBZXLDCWWzvJ6bNZysrxirvayws6gFnJ
	fO/E6m5lW003mHS2Rx0fsUe4iFRgIN5KzJQO8T+qZV2J7+a2E7XYnhGmpCCc1SfjHGcbA54o8Tv
	EqpOsnv935rtJRfR4tFj88GiI4NU157bZOZ1XNCo1LAvuD3/7jF7gIHeS5JCbjiOZ7CSdhm2CFQ
	GbVlPuMXaXXgpgwPAmYNve76vvreJwCieKf85s62M++ABJKyEtbeyAnkxbdm0iW8XqZ/TsuSw2A
	Pn7FbkA0PRu+ixu9c5xbYKPZ3URnmqMatpR8IbrccSmlUI8SJ4GUuKw3De2nqJx8Qa02xrP/bC/
	WEJ7Je3rsdoFRkhNCTnIYDPTJ4BnOFv815385CWK1hKrSORrYsySapl82kULB+Ce4=
X-Google-Smtp-Source: AGHT+IEpEdjauXjggn5SR7U1Q+y64OlZqNg4Yg894GTeht+XbUtbyA5M9bniZWJzFw9VSOjbvaSz6g==
X-Received: by 2002:a05:7022:6199:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-121721acb6dmr26336934c88.7.1766978278720;
        Sun, 28 Dec 2025 19:17:58 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm112992785c88.5.2025.12.28.19.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 19:17:58 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/16] include: device.h: Add named device attributes
Date: Mon, 29 Dec 2025 03:17:38 +0000
Message-ID: <20251229031753.581664-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251229031753.581664-1-derekjohn.clark@gmail.com>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds DEVICE_ATTR_[RW|RO|WO]_NAMED macros for adding attributes that
reuse the same sysfs name in a driver under separate subdirectories.

When dealing with some devices it can be useful to be able to reuse
the same name for similar attributes under a different subdirectory.
For example, a single logical HID endpoint may provide a configuration
interface for multiple physical devices. In such a case it is useful to
provide symmetrical attribute names under different subdirectories on
the configuration device. The Lenovo Legion Go is one such device,
providing configuration to a detachable left controller, detachable
right controller, the wireless transmission dongle, and the MCU. It is
therefore beneficial to treat each of these as individual devices in
the driver, providing a subdirectory for each physical device in the
sysfs. As some attributes are reused by each physical device, it
provides a much cleaner interface if the same driver can reuse the same
attribute name in sysfs while uniquely distinguishing the store/show
functions in the driver, rather than repeat string portions.

Example new WO attrs:
ATTRS{left_handle/reset}=="(not readable)"
ATTRS{right_handle/reset}=="(not readable)"
ATTRS{tx_dongle/reset}=="(not readable)"

vs old WO attrs in a subdir:
ATTRS{left_handle/left_handle_reset}=="(not readable)"
ATTRS{right_handle/right_handle_reset}=="(not readable)"
ATTRS{tx_dongle/tx_dongle_reset}=="(not readable)"

or old WO attrs with no subdir:
ATTRS{left_handle_reset}=="(not readable)"
ATTRS{right_handle_reset}=="(not readable)"
ATTRS{tx_dongle_reset}=="(not readable)"

While the third option is usable, it doesn't logically break up the
physical devices and creates a device directory with over 80 attributes
once all attrs are defined.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 include/linux/device.h | 46 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index b031ff71a5bd..76f485e6b24c 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -189,6 +189,22 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_ADMIN_RW(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_RW_MODE(_name, 0600)
 
+/**
+ * DEVICE_ATTR_RW_NAMED - Define a read-write device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_RW(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_RW_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0644 }, \
+		.show = _name##_show,                                     \
+		.store = _name##_store,                                   \
+	}
+
 /**
  * DEVICE_ATTR_RO - Define a readable device attribute.
  * @_name: Attribute name.
@@ -207,6 +223,21 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_ADMIN_RO(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_RO_MODE(_name, 0400)
 
+/**
+ * DEVICE_ATTR_RO_NAMED - Define a read-only device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_RO(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_RO_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0444 }, \
+		.show = _name##_show,                                     \
+	}
+
 /**
  * DEVICE_ATTR_WO - Define an admin-only writable device attribute.
  * @_name: Attribute name.
@@ -216,6 +247,21 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_WO(_name) \
 	struct device_attribute dev_attr_##_name = __ATTR_WO(_name)
 
+/**
+ * DEVICE_ATTR_WO_NAMED - Define a read-only device attribute with a sysfs name
+ * that differs from the function name.
+ * @_name: Attribute function preface
+ * @_attrname: Attribute name as it wil be exposed in the sysfs.
+ *
+ * Like DEVICE_ATTR_WO(), but allows for reusing names under separate paths in
+ * the same driver.
+ */
+#define DEVICE_ATTR_WO_NAMED(_name, _attrname)                            \
+	struct device_attribute dev_attr_##_name = {                      \
+		.attr = { .name = _attrname, .mode = 0200 }, \
+		.store = _name##_store,                                   \
+	}
+
 /**
  * DEVICE_ULONG_ATTR - Define a device attribute backed by an unsigned long.
  * @_name: Attribute name.
-- 
2.51.2


