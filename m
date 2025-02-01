Return-Path: <linux-input+bounces-9659-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3347A248B4
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6A047A30CF
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D6B1885AD;
	Sat,  1 Feb 2025 11:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmbZ6T2D"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2781ADC92;
	Sat,  1 Feb 2025 11:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409973; cv=none; b=sw97ubeYc7DY1uRXre6zo7cW66u2ED2rsZEbCF/wnpBOLAahProESee9z3lE15JH2hXd8z/N4AKThJ/fZSzDpIdYfkF5q8ep6vHrdEHbrkCjO5coTxKU46O3+Uqjz8KA9GHa/ZWCbeWThkMNsTw1Wf+cbvk70yMdGqP8mcCV+AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409973; c=relaxed/simple;
	bh=jfrMUxoZZP++/18h4GPIFMVQvhWUN0Y/s+8JSUEz7IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DP1kbITF1QXqmt1imdzZ6uo0lwUtUuP4WEq1LrigvTKAxjbCH/LdTQ2VUfQ69ZyUjI47Kaa3B8ZDJy2H9Zg8LDnuUKGvKkPmcK9ZnOmI5UDXrio8Hckg7T9U5jsKFBCsPxVVdlUI1N/lKqFJgfLj43PNQkebyKoKpcqb7hWkOWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmbZ6T2D; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc050e6a9dso479154a12.2;
        Sat, 01 Feb 2025 03:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409969; x=1739014769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubzWnXZ1u1+fgPUqTz7rDMh/vzeIBjFqX+hxw7Dimc4=;
        b=ZmbZ6T2Ds/tBKGN67ttu7d5V6RdruRK2MXbGwM1+aM1qFcI5C2JGwkf0lUE4GoQYYE
         +JxCEHDsmj3a2pg1Wql7HL9s1KgXKQf9EOOkBY14aRh9taK9nCQezwb3qSLY5bBnNotR
         2DY13RSQuaEHcLyJL8SI3q0Sdgh47vfu8JRXnA2IJmYCJf6zXh/29Q/kbrP1lLDuZa85
         IGGiecE5J++jeWLCxTh5R7nersgWgDiRzpsm93zTC0dvJ46ZS0ndkprnTcAQdYVAX5pP
         pVVsMuPsZ7kBGFTPwcZOwbuFk+T6SPw/RoixcGefb802E6y5k3wybuCEjvJJuY61Md/K
         LUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409969; x=1739014769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubzWnXZ1u1+fgPUqTz7rDMh/vzeIBjFqX+hxw7Dimc4=;
        b=ONUd3brYVOKhXvJFhU2hWLXi03uuucjh1RCFVJieS30ot6Gkap+UR7FRuvVJ5Un8F6
         lBF9ywNCyxgF7GMiy6lLZ2qd7zloH27hLW14ZOIscHLCkxUh3666ER7N/aij4KSci2Dr
         R9Qe3Os9obpj1uwt6GQI9yWWaxuH9R3NuHuTdD2V1XGBGPeh/3r05NGA72plONfdah4M
         31SY0eWEnxmCGbxN4QQ36FcVDoSJ/y+kA9AZE6lC3DRfBbyTmPtIdTnUSTlMbbhqhxtD
         LT/H0Adztn9+c2GyqNkbx5s1Whn++GKhusOWsWGACnF1L1sUrG2kh6KqBVz9mhZAwmeN
         +41Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJzHvTB2Rm0xZ0VzXFluskyzAbIsi765rSXItt8lvTwTTu+UEshF3Q6sOp0JllkUowOaz3LXMO+sG/ug==@vger.kernel.org, AJvYcCVjwQdtgx5J0334sbu92jle95F2PbyXPsUkRtabz65mrjn5bgwNchKs4KNksmeZU9ym+/Eagkdf7s1y@vger.kernel.org
X-Gm-Message-State: AOJu0YzxdYdGExeHlyb/2cIOF+3hk4m1iJIUukpEQpiEG4YLu6pdOB3n
	YNa3CewGSL1FamY/fgUVtfw9R6z37rcnoVLi4TQndU6yjLxurrl1
X-Gm-Gg: ASbGnctWYBn1GDjswZ0tNLoAoyYpoxpsAhhLuwknfM3fdhYZ0mhPXg6nyl2pqp6vJR4
	TAamh/gkvvHeyAGmHP06Ve2m8L+C5t7F9nBoTteRtDw2imRJ+Daz9HnsK+2jQOBJVuJdcgU9T3V
	JoaDgMyUgfiJVM+G1WRSGINlYHa5Kob8ENvbvwUWrOgAokCo2UZekF2P91ujcMfjgbqI0I4c6rU
	k7r0HdB01Q+mFnoriV8v4C3Sc/obC08bSGrbR/ZWU0xQb+Q2rRqeeGwxycVuHskiMhscTiF9Km2
	NoBKYAc7juUShcJpyZU8x1noi80kKvpOsK7doFpP16n0CQgIfnxpiQqM2krJPg==
X-Google-Smtp-Source: AGHT+IEa3vCydLEA5VgjxRewSsiuefBMq6yQ49dVS92HGZlzSKhtePUJwwxaQP1O83rm4v+w+4bJHg==
X-Received: by 2002:a05:6402:34c7:b0:5d0:d786:b87b with SMTP id 4fb4d7f45d1cf-5dc5f0308e5mr6231174a12.9.1738409969257;
        Sat, 01 Feb 2025 03:39:29 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:28 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 17/22] HID: pidff: Factor out code for setting gain
Date: Sat,  1 Feb 2025 12:39:01 +0100
Message-ID: <20250201113906.769162-18-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Makes it possible to easily set gain from inside hid-pidff.c

Changes in v7:
- Check if device gain field exists before setting device gain

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 8a2a4bed2632..a7d9f9b19668 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -539,6 +539,19 @@ static int pidff_needs_set_ramp(struct ff_effect *effect, struct ff_effect *old)
 	       effect->u.ramp.end_level != old->u.ramp.end_level;
 }
 
+/*
+ * Set device gain
+ */
+static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
+{
+	if (!pidff->device_gain[PID_DEVICE_GAIN_FIELD].field)
+		return;
+
+	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
+	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
+			HID_REQ_SET_REPORT);
+}
+
 /*
  * Clear device control report
  */
@@ -865,11 +878,7 @@ static int pidff_upload_effect(struct input_dev *dev, struct ff_effect *effect,
  */
 static void pidff_set_gain(struct input_dev *dev, u16 gain)
 {
-	struct pidff_device *pidff = dev->ff->private;
-
-	pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], gain);
-	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_GAIN],
-			HID_REQ_SET_REPORT);
+	pidff_set_gain_report(dev->ff->private, gain);
 }
 
 static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
@@ -1404,12 +1413,7 @@ int hid_pidff_init_with_quirks(struct hid_device *hid, __u32 initial_quirks)
 	if (error)
 		goto fail;
 
-	if (test_bit(FF_GAIN, dev->ffbit)) {
-		pidff_set(&pidff->device_gain[PID_DEVICE_GAIN_FIELD], 0xffff);
-		hid_hw_request(hid, pidff->reports[PID_DEVICE_GAIN],
-				     HID_REQ_SET_REPORT);
-	}
-
+	pidff_set_gain_report(pidff, 0xffff);
 	error = pidff_check_autocenter(pidff, dev);
 	if (error)
 		goto fail;
-- 
2.48.1


