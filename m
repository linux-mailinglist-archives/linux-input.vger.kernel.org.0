Return-Path: <linux-input+bounces-14119-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5FFB2B465
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3045962597D
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF20827FD5B;
	Mon, 18 Aug 2025 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MHoVwHmJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DF527E1D7
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558645; cv=none; b=CzVrOtG/UHJ6x+0b2vC/+p5rcI64ufW5b8AnhU0HOLhxpvYCw0e4OstY/9Xq75TFR7BLOnSojywiH4omgl38zPv11SnGox3+g4kiuL56d0x5j7e8o/BL+loaTzoOrodeHsTLchTvOs7tfAtGMxkNXOiajF/ywVXdrkDZJ8rdhpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558645; c=relaxed/simple;
	bh=Jkdjos4RgOTVipcn+UeTFakdYiYYbNUhS5lMAT2XaQg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qSux5/5q1x+CxjMmuMZaQFy+rgB2R2DpKWTVh6fskYptorG45kPKxjRoMLv0LqaLIZaAlWbO3LTDL97c+rpJLb+7bLvd4wKup0h7XEpmVBkmHUV2mBn5R3wzRRaBAgz34uL93RZDf6yUseyBos4HG+OM451j63nfUWoo/NeHJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MHoVwHmJ; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e570044f0eso138610285ab.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558642; x=1756163442; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=no73ok1TStGeLP/XVd+vdAffNUb1wcTzWByPRFwJ434=;
        b=MHoVwHmJbHFKM94Slb6tZs7CAhlnCEwVE/6q8MN2xVEjOQlDaopsuAATbQLHzTTbWf
         QqsLvVG9877HlT//Fv3RJmLUTfUTYZIsTzbHlcEG6QA77LKrw9cfvVQOuFZziFOHht/u
         RaUsqqdBaM8Ki/Wuue4vxhBNZIcOtzZFY5dOOcYxWek+1kIskjFPIw0W4xzCU9AVyrO0
         sj45fRSlGKE17OLaBpOYx05rQwuw+jTgkj9/3evI3kDYII9Ln5JUmaeALiT8zU1XjNF/
         jJyqYSKipKXU2jI1aQRF3xo8ZnYqg9W7L8/fZz48QrhLxd6WZbwrR+mS0GHN+31B7wfd
         NuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558642; x=1756163442;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=no73ok1TStGeLP/XVd+vdAffNUb1wcTzWByPRFwJ434=;
        b=m6L/RAFWpFr+9LC52PP8ru1B6cLUuimPaAY0o9tv5/4zreqygebTpCcx28Tp8XpEFv
         hIs9nuGM1HbhAN7LTeBdEHUuUzmUJzxK7t2ELIMWw+fCOIhdQfE/vOnBo5mggA9RK2Nc
         8T07EloOWGaFWi2BFnxsp8Sed+rAKybkyeEcP0/6F0KfvwDmuVx773w/3tWJZsJDAGAS
         mSx35vN6n1eCqV9cxuynCu2OWgrn0F0A60M5CvKM2bP00dtEkITO6OmI9u7taoVuwi8c
         SqbnnVeRqR3RmP5kjsaOZEQIdp+RSDQWyLExeT5pZZH+s7/493PhNqnXY85BKLhlg9PV
         i0mw==
X-Gm-Message-State: AOJu0YzmDdniQCdvyWxXiT5kUMS5pkEHRYQi7zKKm4W/O5QHDmRdjFvy
	1Ym0O8fz6vsD2qT62OWhbW7asKei84QYAFzTjCcTTDgcruagrMA/aTio0diHL2aZWKteZAVU6FF
	d2hKK4XTYsQ==
X-Google-Smtp-Source: AGHT+IHurdh+bNvbqq4rcSts2NvIBgNlA+bfgJ0A1Iz1oYUr7I4W0BYAjz+BOz9KO1SHicln1gt8LPcc/sEJ
X-Received: from jablw11.prod.google.com ([2002:a05:6638:ad0b:b0:501:ed30:8c8e])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:3a03:b0:3e5:4bc5:538a
 with SMTP id e9e14a558f8ab-3e676640018mr9183085ab.11.1755558642340; Mon, 18
 Aug 2025 16:10:42 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:49 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-8-e4f9ab0add84@google.com>
Subject: [PATCH v3 08/11] HID: haptic: add functions handling events
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
index 25e0e2cef9399199796d8679d66209381b6a59f2..abdd7d710c0b832ad0be8fe63ebfa7692c8ea5ca 100644
--- a/drivers/hid/hid-haptic.h
+++ b/drivers/hid/hid-haptic.h
@@ -70,6 +70,10 @@ int hid_haptic_input_configured(struct hid_device *hdev,
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
@@ -103,4 +107,15 @@ int hid_haptic_init(struct hid_device *hdev, struct hid_haptic_device **haptic_p
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
2.51.0.rc1.193.gad69d77794-goog


