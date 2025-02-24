Return-Path: <linux-input+bounces-10262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECFA414CB
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 06:37:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5EE9188DB16
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 05:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DD386324;
	Mon, 24 Feb 2025 05:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRhjZmCE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3FA7FBA2
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740375421; cv=none; b=GHXYHWGDZrH0fWB9Bale27hq2KAb2LibbGB1fZ2mIFAewKq5Ud7k1MzzmeHtFoEW31TFDkJ5vwrfp/OPMI4RAtXulPYInAL+n6Gsx0qxPaNV8C3g+mJvB3txQ85Rq1cB3/pzK+oK3lvG/MYp/VZlrTv5MpJvaBqFfqkjqHKi+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740375421; c=relaxed/simple;
	bh=MHqIAlB2GQ127hZy/zm32sQDxLu6hB0tD8h943VUkWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TAxfJiaspUeLDSt9D4/ocbisPd4cWwG1S5fSV1xLDq5pvAbhS2Qi3y1sxXgX0/gDrWb9l9b6D/RgqzvlZZ3RESdB0W2PeLdJ0O0nnTkXPmueIGLPfWD+8lviWn5N17GCRnO06yMh+yNH9DqoC6ZVWjEtCZGFUR+TRGk1tJ8C/qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRhjZmCE; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22104c4de96so66029135ad.3
        for <linux-input@vger.kernel.org>; Sun, 23 Feb 2025 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740375419; x=1740980219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w4Njh96tf/tQgctzaq0U2OLrYHuv1Xi44DsFkofjVIg=;
        b=FRhjZmCEtVeUvWgdZfqBtxE4heXr7z0zi+k4/Nw9AzjYn1D0K25sevHAsl+hPAlpJm
         1hYExgBVLzf/eGrRXTyH8KEnlYz4ba7hwnmsV9Z4T73LAGhE1PCWiT7IIlQxAn7Jzwe5
         PVJxjcLRruAEL5xb4lW+JKaAJuD8chT0bwOkhWLl4lz1UppzA9t6jnr2GUrSUywyrOwU
         Gl8zcU4gZRRjmJKS4TAdRPyqYeFjnD8wuIXmk/YPwpU7p05Pyl0maNhYfdhxYonN9ECH
         KaQL3l6UHdt0LboSBR6y9QEhZ307Whpez6ZxfOzuQ+3sZeSj+k0kAw5i90MU/S9Y5bGp
         AICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740375419; x=1740980219;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4Njh96tf/tQgctzaq0U2OLrYHuv1Xi44DsFkofjVIg=;
        b=l7TF8+XWus1utpxaRxi9tnoOpQIrVkf1EsA1ybr8CAvl5jdEfoEg3znyJTCGMj7aQy
         8hLM5fanS1HvQvJSgQinl83l1HULITXSTXOzYNsMP3c23BsqavcFtOCBPR6ZI/8+M4BE
         /i9+oSaZbO1NLmN6CpYhQNLDCLJnhMrXyZ0feZVssITf7QhTRn/Kw0PUiJ8VqEfcjrAr
         OfA7RntDbSgeXoTUSAB+wxV51aCm7hC5ny7nzHjoPi+e3rzB1Q+LKjQYk6d32+B3AJGJ
         ofPwd3yjoVI6gkzLxQndpI2+y774vMgflTTdeBr5qXSdv6rZC6KYV7AKjOjjTe1u6+Oj
         dFQA==
X-Gm-Message-State: AOJu0YyURUkclaExJ/nYP8tlL8zcdONvcOTkaJdYW43/2uPIBOsfcEAS
	VPW79uVLtU+SxsI8KbJvM6qVwTunm7x4Koo2qbWkd0CKo7QqaQYSz3Moag==
X-Gm-Gg: ASbGncvKctXHDIp9wxBfbmSuA1eYbty23NbVwH+CJysgdwm0BUt2FhF1yYpHdI1GFOi
	vyPSpo1fPzXeIukprTCUs2ww+d/eljl4iyHKEF56c1nE/iPc5VXJjEOcvTiumMOON0Q93li4qV8
	JwzvqqEHx7W3R+hKzeSdkhNpjkRAeOGSYSgQ9XtuHJZsGC0SqfZiz7oEl5+3JEBXJT9Kl9PQG6n
	dB/e30t9rq+p0spjbCpO6InL2YH+vn7WzCYeb7J8x2iR02RUgvDoXtw7LyKhngL0Wjeiqtqng02
	ABPGdhQsHZdjEoebk/6WIOc3tnUgJiU0
X-Google-Smtp-Source: AGHT+IEpiI+JqxtaI1OOn7/vNGt3vXeTeFXuCn/rvZ96tN1vOJEYWXWQOJvy8EI+VTGtdl4b8JiOOA==
X-Received: by 2002:a17:902:d4ca:b0:215:aee1:7e3e with SMTP id d9443c01a7336-2219ff34a5emr224133285ad.5.1740375417275;
        Sun, 23 Feb 2025 21:36:57 -0800 (PST)
Received: from panther.lan ([2607:fa18:92fe:92b:789d:b111:d61f:4754])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d82e843fsm169823655ad.220.2025.02.23.21.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 21:36:56 -0800 (PST)
From: Alex Henrie <alexhenrie24@gmail.com>
To: linux-input@vger.kernel.org,
	jkosina@suse.cz,
	benjamin.tissoires@redhat.com,
	gargaditya08@live.com
Cc: Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] hid: apple: disable Fn key handling on the Omoton KB066
Date: Sun, 23 Feb 2025 22:36:30 -0700
Message-ID: <20250224053632.2800-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the fixup to make the Omoton KB066's F6 key F6 when not holding
Fn. That was really just a hack to allow typing F6 in fnmode>0, and it
didn't fix any of the other F keys that were likewise untypable in
fnmode>0. Instead, because the Omoton's Fn key is entirely internal to
the keyboard, completely disable Fn key translation when an Omoton is
detected, which will prevent the hid-apple driver from interfering with
the keyboard's built-in Fn key handling. All of the F keys, including
F6, are then typable when Fn is held.

The Omoton KB066 and the Apple A1255 both have HID product code
05ac:022c. The self-reported name of every original A1255 when they left
the factory was "Apple Wireless Keyboard". By default, Mac OS changes
the name to "<username>'s keyboard" when pairing with the keyboard, but
Mac OS allows the user to set the internal name of Apple keyboards to
anything they like. The Omoton KB066's name, on the other hand, is not
configurable: It is always "Bluetooth Keyboard". Because that name is so
generic that a user might conceivably use the same name for a real Apple
keyboard, detect Omoton keyboards based on both having that exact name
and having HID product code 022c.

Fixes: 819083cb6eed ("HID: apple: fix up the F6 key on the Omoton KB066 keyboard")
Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 49812a76b7ed..d900dd05c335 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -378,6 +378,12 @@ static bool apple_is_non_apple_keyboard(struct hid_device *hdev)
 	return false;
 }
 
+static bool apple_is_omoton_kb066(struct hid_device *hdev)
+{
+	return hdev->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI &&
+		strcmp(hdev->name, "Bluetooth Keyboard") == 0;
+}
+
 static inline void apple_setup_key_translation(struct input_dev *input,
 		const struct apple_key_translation *table)
 {
@@ -546,9 +552,6 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		}
 	}
 
-	if (usage->hid == 0xc0301) /* Omoton KB066 quirk */
-		code = KEY_F6;
-
 	if (usage->code != code) {
 		input_event_with_scancode(input, usage->type, code, usage->hid, value);
 
@@ -728,7 +731,7 @@ static int apple_input_configured(struct hid_device *hdev,
 {
 	struct apple_sc *asc = hid_get_drvdata(hdev);
 
-	if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
+	if (((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) || apple_is_omoton_kb066(hdev)) {
 		hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
 		asc->quirks &= ~APPLE_HAS_FN;
 	}
-- 
2.48.1


