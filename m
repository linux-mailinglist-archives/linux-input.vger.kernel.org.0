Return-Path: <linux-input+bounces-7048-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD73798F1C6
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 16:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30F4EB2290B
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 14:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526519F46D;
	Thu,  3 Oct 2024 14:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQxhZ5Z1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138D719993D;
	Thu,  3 Oct 2024 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727966829; cv=none; b=d1+44jxuLC2SGvzbPds8HDkoKkKP8tSdRN+NffRzRQH99Hk7TChSp9+23fA0iXFnNLwlo/aJxQTJocdAQ8prjdA0rqFmi2WdHDgDGHyhQWtzj2OBSizEyBaL3M3VupWDszauvwP4z8/tyh3+nqC+QWCOl23zGRNuT1uBA0FN/4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727966829; c=relaxed/simple;
	bh=ED0vuK8W04BwgAQcaS9QRRQdbMEBgs1mTyJjh1Z1Drw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndG55MdGXGmvmE7K/7uRDGfs2+CTDIZJ6SYrXkL+pT3hHKImsD6OVKGaa1c2yCoYfDlcyKCvpeFqvCj6tl5nU5fxukbL258JNIR4ALjXfNOx0nXcBxAwUREG3Rndx1V8Jm3SgqhqxD8MBmZ5nhEWYjoIVh7iHy1fMTSvmofoQSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQxhZ5Z1; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a1a90bd015so3563465ab.1;
        Thu, 03 Oct 2024 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727966827; x=1728571627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGJ2zDC0Th6sGFjmgN+RNTxcD0mMHKwfhiuDOaxUw6M=;
        b=TQxhZ5Z1X1J4QUlRJ/yl0vByFcgI7wbvNm14vZOQy2URFYTRgncJVpMKjXzVVnFjdK
         X86ICIjADL4DdCR4xJqgH71OGgwY0oBKjDyfaX9SFZBQy4r/r7SF+rJeh/vcs/1JR28n
         jeY3vBoibVuDEZAk4zG37lnm8rHidhhhkSatWoW/DirAsjw783FSfEwFNX0HTGrkDvKN
         D06oxSAFFPbzMGaLB7ELQ1YPMRJiZnyL6b+rIVVw45GzNStgvBbWdQr9oXxmoNQVtTa4
         uuWATXbnL1uAfBhv+ENJrBFeE6GiZ30jHZol08ile896jtOTxes8+ZzrctGoqYmpK357
         0s1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727966827; x=1728571627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGJ2zDC0Th6sGFjmgN+RNTxcD0mMHKwfhiuDOaxUw6M=;
        b=OADWHkAGSFOO6aCXqkRpCOjgJh5PPYJUrXpY4Od3t4ldV6+5tGFrfFkLA97vUIb7XB
         dLgBC9yWSA54LO9JXJ8bmhWAakj0irN2TKEtp5pDJSXJ50rIJC/6IW/2mVW8cDf7w8Ha
         /eU7meKyEaz9V67M62pVP4XwQTEz1Cozf4OTV0oTYqFn6zUYS87sjYgxjbMiEEKksGGq
         Clg1Qvh39gjevH9DbTvpJ6k6vGbvBOc6nj0EjRvSUnx0Um5Ll5zSw4SqxgyJqY6XR2Gh
         QcWTtQvPPAFcDBgPa0OY9JuAnwvrbzJtZgTEf59naHAw+GHjL59TZHRERLyL6WpTBQJo
         b7lw==
X-Forwarded-Encrypted: i=1; AJvYcCUjgOPxkcw+QW635+DAkzitijuCmvBkk5KouQLME81f1oPZirAWSBgmmqNO+5Bvl36GOOd+OhjfqJCrRu2Z@vger.kernel.org, AJvYcCVvqYwYsOHEn6NVyCrWhc3fd2DWVbazWcx1kVp1VFRK6dw/pibv4gTAk2Y0cg/M4T1CnszjguBUJ2tFAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQx23NEg4eN/QAsh0d7s0Dy+KJPMnjM9OOR0n1Fp0hSF/Bqk+s
	1YS93EbToiS36grvUItdD+oAGbO38eLMfXYdSOvjfkPrcwXMr4Fh
X-Google-Smtp-Source: AGHT+IG/i8g5UUHpWKtz0wzz7p25UTOrJrTRyDNvzjy2wTO3lstRdhkQYzkoBmc6e6uANM+qrAfFCw==
X-Received: by 2002:a05:6e02:1d9a:b0:3a3:449b:5989 with SMTP id e9e14a558f8ab-3a36594cfc7mr66560575ab.21.1727966827013;
        Thu, 03 Oct 2024 07:47:07 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:fba0:f631:4ed6:4411])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9dcb05a5asm820774a12.24.2024.10.03.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 07:47:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: stop exporting hid_snto32()
Date: Thu,  3 Oct 2024 07:46:51 -0700
Message-ID: <20241003144656.3786064-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241003144656.3786064-1-dmitry.torokhov@gmail.com>
References: <20241003144656.3786064-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only user of hid_snto32() is Logitech HID++ driver, which always
calls hid_snto32() with valid size (constant, either 12 or 8) and
therefore can simply use sign_extend32().

Make the switch and remove hid_snto32(). Move snto32() and s32ton() to
avoid introducing forward declaration.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-core.c           | 62 +++++++++++++++-----------------
 drivers/hid/hid-logitech-hidpp.c |  6 ++--
 include/linux/hid.h              |  1 -
 3 files changed, 31 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 5f62df91030d..f8c0a0316104 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -45,6 +45,33 @@ static int hid_ignore_special_drivers = 0;
 module_param_named(ignore_special_drivers, hid_ignore_special_drivers, int, 0600);
 MODULE_PARM_DESC(ignore_special_drivers, "Ignore any special drivers and handle all devices by generic driver");
 
+/*
+ * Convert a signed n-bit integer to signed 32-bit integer.
+ */
+
+static s32 snto32(__u32 value, unsigned n)
+{
+	if (!value || !n)
+		return 0;
+
+	if (n > 32)
+		n = 32;
+
+	return sign_extend32(value, n - 1);
+}
+
+/*
+ * Convert a signed 32-bit integer to a signed n-bit integer.
+ */
+
+static u32 s32ton(__s32 value, unsigned n)
+{
+	s32 a = value >> (n - 1);
+	if (a && a != -1)
+		return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
+	return value & ((1 << n) - 1);
+}
+
 /*
  * Register a new report for a device.
  */
@@ -425,7 +452,7 @@ static int hid_parser_global(struct hid_parser *parser, struct hid_item *item)
 		 * both this and the standard encoding. */
 		raw_value = item_sdata(item);
 		if (!(raw_value & 0xfffffff0))
-			parser->global.unit_exponent = hid_snto32(raw_value, 4);
+			parser->global.unit_exponent = snto32(raw_value, 4);
 		else
 			parser->global.unit_exponent = raw_value;
 		return 0;
@@ -1312,39 +1339,6 @@ int hid_open_report(struct hid_device *device)
 }
 EXPORT_SYMBOL_GPL(hid_open_report);
 
-/*
- * Convert a signed n-bit integer to signed 32-bit integer.
- */
-
-static s32 snto32(__u32 value, unsigned n)
-{
-	if (!value || !n)
-		return 0;
-
-	if (n > 32)
-		n = 32;
-
-	return sign_extend32(value, n - 1);
-}
-
-s32 hid_snto32(__u32 value, unsigned n)
-{
-	return snto32(value, n);
-}
-EXPORT_SYMBOL_GPL(hid_snto32);
-
-/*
- * Convert a signed 32-bit integer to a signed n-bit integer.
- */
-
-static u32 s32ton(__s32 value, unsigned n)
-{
-	s32 a = value >> (n - 1);
-	if (a && a != -1)
-		return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
-	return value & ((1 << n) - 1);
-}
-
 /*
  * Extract/implement a data field from/to a little endian report (bit array).
  *
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 400d70e6dbe2..30ad42aac804 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3296,13 +3296,13 @@ static int m560_raw_event(struct hid_device *hdev, u8 *data, int size)
 					 120);
 		}
 
-		v = hid_snto32(hid_field_extract(hdev, data+3, 0, 12), 12);
+		v = sign_extend32(hid_field_extract(hdev, data + 3, 0, 12), 11);
 		input_report_rel(hidpp->input, REL_X, v);
 
-		v = hid_snto32(hid_field_extract(hdev, data+3, 12, 12), 12);
+		v = sign_extend32(hid_field_extract(hdev, data + 3, 12, 12), 11);
 		input_report_rel(hidpp->input, REL_Y, v);
 
-		v = hid_snto32(data[6], 8);
+		v = sign_extend32(data[6], 7);
 		if (v != 0)
 			hidpp_scroll_counter_handle_scroll(hidpp->input,
 					&hidpp->vertical_wheel_counter, v);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 1533c9dcd3a6..6dd0eb6cda68 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -972,7 +972,6 @@ const struct hid_device_id *hid_match_device(struct hid_device *hdev,
 					     struct hid_driver *hdrv);
 bool hid_compare_device_paths(struct hid_device *hdev_a,
 			      struct hid_device *hdev_b, char separator);
-s32 hid_snto32(__u32 value, unsigned n);
 __u32 hid_field_extract(const struct hid_device *hid, __u8 *report,
 		     unsigned offset, unsigned n);
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


