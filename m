Return-Path: <linux-input+bounces-14096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B3BB2AB32
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86998722711
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04353322C72;
	Mon, 18 Aug 2025 14:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kRRRVc2H"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD64322A01
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527349; cv=none; b=MzwvUf6BzjMH46nBaMiNLwlgmda9jfru2cOyeuMJUg52xRhdWisdsPcgqBhki3vxF1XPmAexaCH8PVc6FeIiuIKQHTw6pH2dwL9w6fPYP8paPvBwzCI8pKQU38n+D6kuCnBduFpAUF6HycwTLE11LW29fCywphXRrX9/Dm2wgQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527349; c=relaxed/simple;
	bh=NWZOt7Tv/JR11rhWhB2/TKtjzpxtTktoH9dWK3nHU4w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=STkGu31zjSHfnc8jNuE7xmX7TQrO9VJCWZnQd6SvBNcTUvGXVjzi9/CPjJ9PcJXobkfHukwawKFH/t414par8Wb0x0K952z15/IFJG1/XZB1xJXDEu6oU/VOERhQt+SYujzVLcBVuz6kYwejwenfdm0qfWJ3RDC7fulFgOS7tP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kRRRVc2H; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-74381f38274so695904a34.1
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527347; x=1756132147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OWqdzpYUL7+PpXDh/tU9TKsciamS6RX7nVkdacIMWsQ=;
        b=kRRRVc2HQH1Jsn6PtczYQg50oJDl8xMJsg87ksNogm4YmBRjzZ4Nm/CS7Y/imJCft2
         FLtrSJbLMhoKiu5D4k8YpWtuEhAqVwW3JQwjbtuhdzU7KUKU0baPC+uDK8ga2oj9HySr
         8tNU85QTyuMYkd4YAfUTuKMV0eFUGZ57ArYfcdyyb0ZuI3Ta0x9n9obSc7sgwdr/Enkb
         6On97Z/eUI4+mAEIsE7dHrLgyG+2+AxNMojRVTLR7jafYGHgVGKkU3+S76jjTeTdRdjp
         sMiZ5GGVOlVOimcPEG9FzfoCAuC800JdUzAxKBipK07iqJH2fuXVyFX4hwYDI2YvgKw2
         zP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527347; x=1756132147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWqdzpYUL7+PpXDh/tU9TKsciamS6RX7nVkdacIMWsQ=;
        b=oSb6iWTjmkn8/BiEmQcsnnI+BPsCAtf6MoHsb0n2Eq4rSUONiMBN019Q1p4XvdeR8e
         moSkRyCFH224PCaPVXRKKwfiuy+oj+Netlx/gZrOXcX+o2nWkZudWqD39N5RcFE2O8jD
         Y1tupBRUnsmDws0RbfqQCe4ABsHF4r1/s1Bq3JHUdOqDr7nfcaoMOZHklOxrqJVe8/bK
         tB/fkuwZJmGc/Me4iMk1bYy7tpJUlL5fzNKWgXytieCFYC9ziYuo83TjKpU6jPf80BOI
         uvwEuRtXf70bB13AWCpiXoAJh+BnPuYqxOPu2ptxds1iCTP6i/zUSeYw3I5hl8iYnFgf
         iuPg==
X-Gm-Message-State: AOJu0Ywd93KOz34hi3KvINHLR/D+EmZyvE82qKNMzEfM8JpLiElu5+Go
	mdZYVKknc8zUaPrhClBp9SCFt/rkjUTn9TrG8NH36j+ucDc/RfR8ie5WuWKhSP8MEjbr6Kayl9p
	iIv5PrDKIQg==
X-Google-Smtp-Source: AGHT+IH/qWzGqtEr/vp9llvd19SDMUbdy4409bfsCXcE5kPKwgW4iYVg3RWQ/06UA2ygO5oVNc/NYMA1/tmT
X-Received: from otvq39.prod.google.com ([2002:a05:6830:4427:b0:741:614a:ed95])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:6110:b0:743:8443:6b31
 with SMTP id 46e09a7af769-7439b9ccd8dmr4664627a34.6.1755527347292; Mon, 18
 Aug 2025 07:29:07 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:08 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-8-ca2546e319d5@google.com>
Subject: [PATCH v2 08/11] HID: haptic: add functions handling events
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Implement hid_haptic_handle_press_release() which generates haptic feedback
as well as saves the pressed state of the haptic device.
Add functions to increase and reset the state of the pressure detected by
the device.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-haptic.c | 20 +++++++++++++++++++-
 drivers/hid/hid-haptic.h | 15 +++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-haptic.c b/drivers/hid/hid-haptic.c
index ef09b4039f33f15d7220e69fbed10bd8b0362bb4..c02af820051c22d1c899db84496c5a44b868fe49 100644
--- a/drivers/hid/hid-haptic.c
+++ b/drivers/hid/hid-haptic.c
@@ -50,8 +50,13 @@ EXPORT_SYMBOL_GPL(hid_haptic_feature_mapping);
 bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
 				    struct hid_input *hi, struct hid_field *field)
 {
-	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON)
+	if (field->unit == HID_UNIT_GRAM || field->unit == HID_UNIT_NEWTON) {
+		haptic->force_logical_minimum = field->logical_minimum;
+		haptic->force_physical_minimum = field->physical_minimum;
+		haptic->force_resolution = input_abs_get_res(hi->input,
+							     ABS_MT_PRESSURE);
 		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_check_pressure_unit);
@@ -508,3 +513,16 @@ int hid_haptic_init(struct hid_device *hdev,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(hid_haptic_init);
+
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{
+	haptic->pressure_sum = 0;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_reset);
+
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				 __s32 pressure)
+{
+	haptic->pressure_sum += pressure;
+}
+EXPORT_SYMBOL_GPL(hid_haptic_pressure_increase);
diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
index 402ac66954e315eb5444df277ab2b9a4ec415dd6..73601f429de16bae3b1d877445f7eebf41a69d94 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -74,6 +74,10 @@ int hid_haptic_input_configured(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_input *hi);
 int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_ptr);
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic);
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure);
 #else
 static inline
 void hid_haptic_feature_mapping(struct hid_device *hdev,
@@ -107,4 +111,15 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
 {
 	return 0;
 }
+static inline
+void hid_haptic_handle_press_release(struct hid_haptic_device *haptic)
+{}
+static inline
+void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
+{}
+static inline
+void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
+				  __s32 pressure)
+{}
 #endif
+

-- 
2.51.0.rc1.163.g2494970778-goog


