Return-Path: <linux-input+bounces-9544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A332A1C56D
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD60B3A544E
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F13D20764C;
	Sat, 25 Jan 2025 22:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bForWo8G"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8652207649;
	Sat, 25 Jan 2025 22:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843946; cv=none; b=q7vRstucI98AGvVAgCUbyMWf4pRLcmS4B/9FNXDmvCjwoYhLWbgW8OrBYktz1/fTj+2AkZtEl8QpE9o4Xd2h3c5UYER75eTrCVOdTPjpSizP7negCqKoDFHG/BZ+X8YJIi+TA2mDPNZv7TjqEyxk83JIulP8aq4IK7evyTHy1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843946; c=relaxed/simple;
	bh=sfJp+cEStH0iOHMy+L5yy3UCQpbG3St448sBy3TIeoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ez7agktzNTNiTfndL2qbbm7jXNAj2Br88gzoW5VfCLfC5Z1Noi009JvryZHYsxYELBUCo0vYjlGTCXxuYI9mZL040zBwyn2pn3DUC/wYZsqYNHpPMEZiebl0NgQYnW7Qiw6VZJxzBUzH9ISf8VkreljQgT2fCXBqPu1+n1ka1IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bForWo8G; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5db67d1bf0bso834475a12.0;
        Sat, 25 Jan 2025 14:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843943; x=1738448743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7ipsiTl1dRTYPh+Rs2vHcEMW70oojF4sOlian54NsU=;
        b=bForWo8G5NB6Afx/SkCFeSYt4ld0NY1CJLuMH2/TX372GYT0EGLUR2CuEkzjveo/L6
         M8ZxG3Bp9W8MJFMpFcWxbfxRrL4PzmwIQyKaeX9HWv3M/MLajyeH/BOCzRfhzw+yyXAJ
         /RFlMYGJ57Zx3oelylzYCCo0VXcksGfJfgUCf8AcTLw/Zg7qgyPlthMImhv7Rdy0QxAA
         UyQjJsoK2LSeVZQB+3bkYN3h+ENuvIsSY/C7WeFSsK8daDO1KjFvnWwIFaXNt+jEI2SI
         +pwm6lMn5P7Oc6UtQd3IqikaqPo/zzk+HwDY2vLlfoxWJYPbg3dMdyJNkc7m9RROENUD
         vDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843943; x=1738448743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7ipsiTl1dRTYPh+Rs2vHcEMW70oojF4sOlian54NsU=;
        b=D7tcWTkU7iM6d0dkKQn4J4WY9Z0GgMFS7uXT0t7PHqciD2NLYBPdYlEWwppFIP+qAM
         lagdOUzOYIaetPDnM/wCwWc4vdNju8a0neF5H2RzpSSuzvaSAxYhrKJYl6rFIGShFTw9
         51R4agcXKrhukkMuU7+J97UoBIUNDnBPEvKhLJWnqiW8gzjmygAP/iU83d0GU4qHs1qK
         A59LM2SBFV0LDh3HCaNJjV0nIFmLk04cpkrlih3QbxED3Kix0NPi0RVxgTJGRwbqdNjZ
         +ldSolwfTftfdgaizUxklh9+biPe4PDqg5DBq8G+XiH+9HK5CSWEtutlYsbpiJL1fG+Y
         gnIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMpZgXm5PhE8hgUf1IIKumC4iwAeoGoyz/aM8/Ig2qbNJJvs4SCKn2MpwZWEjv2WjjcZvIQX5zmoOYAA==@vger.kernel.org, AJvYcCWadQtxICEc1pFS347YCY3hkbOnabX1jpkF/IOam8MnTnPacIWGpaRwfbDgk+tcnPkn1sXAWdkZWq2z@vger.kernel.org
X-Gm-Message-State: AOJu0YzW49JCBnJ1MWhLfMEo5m5F678gGs2I5x+f0Pt4v5MJY6cKLheN
	qQwUEJ2NkTk76xJeMbsOiXUdYShyckuLuSNXKxaHKXEaC1/yvp3piivI9IMc
X-Gm-Gg: ASbGncsSlSESvzi9wPNOFrdj54gAAKIZJSxaHYAOqyy7zUyZBbqbt6NiU7N7xp2bj7h
	APzo7oLeSmuJ0GBi2tB/6sZqej2BrHsQ5WmY617LFCCgnD8tOOEwxzd8ThLr7oLh7pvX/jZJ1S+
	QFS3hX4K8hmpwfYG7cTqSx5AMYLrjh5jXvsAr+ycch5YA94NapE70SYwTslqS6EF83LM8zbTU+3
	vc+zgzM/l068pFFCWX4WQe2z3Sqrj0QJx9H4QG3+aVJXSBxyM+HsYGZjqVuDYYItvlDz5gLK4vF
	Y7ILQbR4HM8I4+bh1chaza2lFXNkonbwDnys2oGViXMohMBov4k=
X-Google-Smtp-Source: AGHT+IF1qE/zHzbCjcUPKzxu2EF7d2M6EHxN2mOeI3DSl2MiUOCit0EFC8STjWGDHvLLP+YOPU3o4Q==
X-Received: by 2002:a17:906:7314:b0:aae:e684:cc75 with SMTP id a640c23a62f3a-ab38b503573mr1085913566b.13.1737843942788;
        Sat, 25 Jan 2025 14:25:42 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:42 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 08/17] HID: pidff: Add FIX_WHEEL_DIRECTION quirk
Date: Sat, 25 Jan 2025 23:25:21 +0100
Message-ID: <20250125222530.45944-9-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Most steering wheels simply ignore DIRECTION field, but some try to be
compliant with the PID standard and use it in force calculations. Games
often ignore setting this field properly and/or there can be issues with
dinput8 -> SDL -> Linux API translation, and this value can be incorrect.
This can lead to partial/complete loss of Force Feedback or even
unexpected force reversal.

Sadly, this quirk can't be detected automatically without sending out
effects that would move an axis.

This fixes FFB on Moza Racing devices and others where effect direction
is not simply ignored.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 12 +++++++++---
 include/linux/hid.h            |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 298a971c63fd..9e03dfb2b1e7 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -136,6 +136,9 @@ static const u8 pidff_block_load_status[] = { 0x8c, 0x8d };
 #define PID_EFFECT_STOP		1
 static const u8 pidff_effect_operation_status[] = { 0x79, 0x7b };
 
+/* Polar direction 90 degrees (North) */
+#define PIDFF_FIXED_WHEEL_DIRECTION	0x4000
+
 struct pidff_usage {
 	struct hid_field *field;
 	s32 *value;
@@ -337,9 +340,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->effect_direction->value[0] =
-		pidff_rescale(effect->direction, 0xffff,
-				pidff->effect_direction);
+
+	/* Use fixed direction if needed */
+	pidff->effect_direction->value[0] = pidff_rescale(
+		pidff->quirks & HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION ?
+		PIDFF_FIXED_WHEEL_DIRECTION : effect->direction,
+		0xffff, pidff->effect_direction);
 
 	/* Omit setting delay field if it's missing */
 	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
diff --git a/include/linux/hid.h b/include/linux/hid.h
index e6e9081d7dac..856bed149246 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1233,6 +1233,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks);
 #define HID_PIDFF_QUIRK_MISSING_DELAY		BIT(0)
 #define HID_PIDFF_QUIRK_MISSING_PBO		BIT(1)
 #define HID_PIDFF_QUIRK_PERMISSIVE_CONTROL	BIT(2)
+#define HID_PIDFF_QUIRK_FIX_WHEEL_DIRECTION	BIT(3)
 
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
-- 
2.48.1


