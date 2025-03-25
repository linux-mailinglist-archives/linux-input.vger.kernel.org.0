Return-Path: <linux-input+bounces-11171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEA4A6EF40
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 12:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67B643B95D9
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 11:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BB1256C65;
	Tue, 25 Mar 2025 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lY1mCGKl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD082566EE;
	Tue, 25 Mar 2025 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742900893; cv=none; b=LysOdEASwBRkuDk17A7M+XHBKiAoWG3TmlPLxZznyF8MAQMo0oKhygjv4QiuAw6LxuH7V/sFPseQ/j+Axzzd+kWI5o3bX151PuZky4L3HHVi8tXz7e+/Vy9norXxIY6TzZd68IvcPMjv5wdJ/UU5gsfSDehEIGlgzGiw9gYGaTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742900893; c=relaxed/simple;
	bh=Dw+fYQ8ICtK3GHaI2BfzIfiP6RgOGIwBHKH8+SCDsPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwBHGkFQi1B9bQ7MtzJkSFpuHiAKzDv+ZlRHtZ8omTXuyCDUTsX1iK9cwqo2TcsrEj7kNGR2SRbUKuhiWKE2fJpb2oBmVZl5hc3Ctg6zRN1NXgQgXhwmc6O0LBPI0kdvi/tqwLlbwZB0XTtYFgKUGabzC36sxuQdZ7AshUnguIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lY1mCGKl; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224100e9a5cso104343255ad.2;
        Tue, 25 Mar 2025 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742900891; x=1743505691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsDB8xid94rpoG1NCkWeFF6azdqml4lQDa8tqLtmM+0=;
        b=lY1mCGKl2k6/JamtDX5KxzPzl2NrVcDRBAGA7F58VtJ05P8eR+NSbiLhM3JDBU4EWU
         0L2+1wekue5jXyW5CaoNT/SrDT3V+A6KGBi09SLM/BwPh/ZQL8TgHcI2veo0otko+pxz
         y73x8QrtbRN+LPs7yBeDQZB4ctMixmWTkPm/vTtb/aZqpi7AdsihiOcB7e4UqUhpfsl0
         ATQMNlCsWU1PL9157wCbeYQyx6sV41ZSrn9+HXMJFIWuL0TaSAZvev/kRFSXNFQpFLYX
         uRiN21R5Vp7l0peB9F4NmGwBQ44Ltc1m3AFkaXkLhOYSsMdceISyuWtVBg2z1nfP43jJ
         Se5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742900891; x=1743505691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsDB8xid94rpoG1NCkWeFF6azdqml4lQDa8tqLtmM+0=;
        b=CEH1sGRSffrG3Pt7GEA+XFHeF6Ve6RUYCvV9jWXZOvyvoLQXqd19NaxfZxN9iSb+BW
         rZ9qRkYbRhZBNnMCM/kWW3QTZOrKJtxWjhrEBSc7qHi3E6r7E3xKgBwvpe4DijGsKrLf
         namfA92EQqVIhlTmu5N+bOFVu2B3If6dOJmnwodztGVZZ2vlwlgjphVWDEuYk/ORdXmW
         o+r6Spo2lOTvAA52ZGmvPczpGvm3bCAZIrpZMG8ebjpeh+fywWBR/Oz7lO+1HKIYmCy0
         IfaRm66TACDpXDlzsDM1bfBz/udh7Nnh2/1wkd3ZFza5B0HuqJdsIjPX5NRi1iCHqjFQ
         zerQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsZmUk/HPB32oZ7DhfWDrWHcE8QayXYlwpPTiK0XLLR3bC2RTu/T8IweoEeTaVQr72jwWc1pvfiVnxDncE@vger.kernel.org, AJvYcCXKkzh37J5ItOaYZGR+L4iJNmy4tP7xTAc1SjBkdrn3yU3WSreX2b9So5HkrnySgl9UJ6QwBYOBGXfFZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7foQ+Oukpc1EA8JjrFWTZdoQ7m9SeA+0gq6lbacsdQ6nihef
	9v7FWz35MgkCxt/3nhT5ix7IDRggpL46nqA27GVn493HZFhG3dLI
X-Gm-Gg: ASbGncts9u3cqAeXlIneFisQW8Jt/Pg+zAaA+++XMEG9lcHC8UvxLFalL+LXZKPeSEc
	NHW1HGO3z3iv/koVhNWVTeCH+ShHhqnH1R87olxcRzSvqL4G6Y3/tCtkwl0cC6lhI0ClNTkzF21
	ghA230mPcurjBpScHTFLmECYTZSGaNXsnb+wIrw5Oi6NXq5awfS3aA4ZmDFCnizqWc2gLe0dQR7
	CburBjF71/l2lWJ+XW4JjBlBpex+RXwozAfChpkKVtpeW66n7Iqbbh363GRolpjX81iY6iwx7dd
	EAiYOGCFZfO4Ipy2ViFDLK57EQnyTFX2mfwstlCr+36uAQZjtqHR33LZ39ypxMnRR7Ox+a1T+sx
	cAaBdmUoKVuIm8YlfSQb6jv/MybBYMxX8oPns2nVjHI7iww==
X-Google-Smtp-Source: AGHT+IHc+ZII8EOEW0S7Jo/xArzooNn8yY9wrMSuWQcSDMAJuNffQ/NnlM6qPF04UZDE1TJnzwjsbw==
X-Received: by 2002:a05:6a00:14c4:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-73905a3b2dbmr19516295b3a.17.1742900891370;
        Tue, 25 Mar 2025 04:08:11 -0700 (PDT)
Received: from codespaces-3dd663.dxrpqgqhlb3ehogrxrezr215ye.rx.internal.cloudapp.net ([20.192.21.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm9787667b3a.152.2025.03.25.04.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 04:08:11 -0700 (PDT)
From: Aditya Garg <adityagarg1208@gmail.com>
X-Google-Original-From: Aditya Garg <gargaditya08@live.com>
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	gargaditya08@live.com
Subject: [PATCH v3 1/5] HID: apple: move backlight report structs to other backlight structs
Date: Tue, 25 Mar 2025 11:05:23 +0000
Message-ID: <20250325110754.28359-2-gargaditya08@live.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325110754.28359-1-gargaditya08@live.com>
References: <20250325110754.28359-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
 
+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
 struct apple_magic_backlight {
 	struct led_classdev cdev;
 	struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
 static const struct apple_key_translation apple2021_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-- 
2.49.0


