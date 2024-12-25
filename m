Return-Path: <linux-input+bounces-8768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6939FC5F9
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 16:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6180A1882AAD
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 15:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B82A4F21D;
	Wed, 25 Dec 2024 15:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8OCvkz5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D532E822
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735142189; cv=none; b=GrEmMpRRstxM+y5radXRWYTuV2+Ozj8Uga9J+NiLCQYPu32ymvHo4pKxx20K7yBdEHDwkreVbMRKYPJO3ciubCuJ1GSz0ldkf7JRVe/YANj4xgqNGqJFBggCEXil3StfZwZVSx/Fzxp/JcVuki6xmuoZIf8sdgzW1G3o63xfM4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735142189; c=relaxed/simple;
	bh=u7CI+rMEZbK6aizwSCasaQpCMaTWNoL9avYDWOLh5PM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AbqYS+XLOEYQywVC1aufk6B8w8ueDA0Ch6DcUwhmUJrbEk9v9GxCEbWL8wshy5cv6ogMybQMFkra+cSUha6OCRxROB58GjNujafapdb0aag37yn+TJnjMxweGDC6zZO3X0GG3yo/whkpvkPyqTEfIhmogM7/oRAA1K8jiIVCyLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8OCvkz5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa679ad4265so1250093466b.0
        for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735142186; x=1735746986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y4wZnuupbzrVs5WnzDcjSCeFQ9zg7QYSD7cFeNPoAD8=;
        b=S8OCvkz5NLH+Wlo+oHj2jjIoVaKd+/wGhRP7xSwBPMKBCTqZkgjsQ9HYXKWeOdnr1j
         UktpxPJ5tXA0JaCTBcyLkj8333OO8uxR64d0z5lVhQrdOAVN2SvLxf8lVvryul6ilhm/
         oVod0qN8PKR3ocTJm7pbsvc2QBnmCo4KZKRe4y9qSj37NxZsEiVG71YdXfQGAJtAe8qM
         AzJ2n0T1XUpyh12Zme3uSVvulwFDhr9Y/GuLC+ZZYp6zAsEczeRnVMY37esh5gMq3fje
         4VYapQYCMfSeXc6sJbAK6l9zps2GAyrcWwWc9p70nstGmU1qGKdiPJ2mfhAdLo5icxg7
         d8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735142186; x=1735746986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y4wZnuupbzrVs5WnzDcjSCeFQ9zg7QYSD7cFeNPoAD8=;
        b=BgCKZIYdsRybgS2Acvme1yZDd4NkzIruF7bk4eXmXErFX2Tnu//PrW4a5rj1Xpc5kB
         y0xTA4j3KuMxboRSD8xDYo3eBVum4jqUrHkykqP98eqXXGXG1n9e1r33fnsoUkJyudlz
         YfkYk/5M+EjyyY1wMZsKq5PLqeZAHsvunxT9oMtTbupF0z9Kz6nJoy1Q9bC8wnCstEdc
         9AbY3LPgtGgtAHgy5WirW13GLGx/XySXqugXsH9nDrPSiHc7SV61PXa6rVZtxJhYtqIs
         LnwmZQnlzM91l8mmjsbp41vdCKtTTH+fzutiC8UMyRQt2lyqfpI6+NyNCTaMPGtJ1G/g
         FMfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ0RKiIpigeNx2sJ5tNeY/kwU0Y+uSCL2bNOlnnSNWKvU025znesh9O0+jm7nKSH8hrGCMDPsYegdwPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxExacd3jDUXe8aA8nTZQZVC3+WJuyVF0cJkIz2/o9znVx20oP
	uh5ktD/njhoNaw/Nxqe1ywaV42RG6V8UhwDkyePEDya0Q+JmYPiV
X-Gm-Gg: ASbGncuxvtzysXsceZ1xSU7mWvnSNiQ1zFo2YLchK/9CvtxUZkliiJaP6QHtjGYEY6t
	ImJD6SjXu762pA68BKbWTESmVRiRVSY9VZ5bs704F/Jy5n+lgfHP0JWvsIzR59IfPYrwhdZwyBG
	4y+qnQEwZGr6z23GxuqTWeJ68ahwdWYcuyNwH32536mycZKo2sfLSd2GoEduqRB/Fy1sRTq1vJo
	OSIn96G6LGhtxyiWWX6sDvtm3+9hBbR4X/aCpCpn20ecIGiJf4LiyaMrUvzvg==
X-Google-Smtp-Source: AGHT+IE/EOY2i844Z1ffmsrrZok4E7nUwVBcn+1nITrbWzUtAGEGVqup/P1AzR6ui50vxKUQ6gmJ8w==
X-Received: by 2002:a17:907:94c7:b0:aa6:42d8:afac with SMTP id a640c23a62f3a-aac08155190mr2599389866b.15.1735142185861;
        Wed, 25 Dec 2024 07:56:25 -0800 (PST)
Received: from carbon.. ([185.117.243.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f2fasm811962266b.9.2024.12.25.07.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Dec 2024 07:56:25 -0800 (PST)
From: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
To: jikos@kernel.org
Cc: bentiss@kernel.org,
	linux-input@vger.kernel.org,
	vi@endrift.com,
	Eugeny Shcheglov <eugenyshcheglov@gmail.com>
Subject: [PATCH] HID: hid-steam: Fix Lizard Mode disabling
Date: Wed, 25 Dec 2024 17:55:07 +0200
Message-ID: <20241225155507.30288-1-eugenyshcheglov@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable Lizard Mode by setting the lizard_mode option.
Set lizard_mode to 0 to disable switching between Desktop and Gamepad
using the Options button, and use Gamepad input.

Signed-off-by: Eugeny Shcheglov <eugenyshcheglov@gmail.com>
---
 drivers/hid/hid-steam.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 6439913372a8..c64f716c9c14 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -10,7 +10,7 @@
  * This controller has a builtin emulation of mouse and keyboard: the right pad
  * can be used as a mouse, the shoulder buttons are mouse buttons, A and B
  * buttons are ENTER and ESCAPE, and so on. This is implemented as additional
- * HID interfaces.
+ * HID interfaces. Joystick input is blocked when Lizard Mode is active.
  *
  * This is known as the "lizard mode", because apparently lizards like to use
  * the computer from the coach, without a proper mouse and keyboard.
@@ -555,9 +555,6 @@ static int steam_play_effect(struct input_dev *dev, void *data,
 
 static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 {
-	if (steam->gamepad_mode)
-		enable = false;
-
 	if (enable) {
 		mutex_lock(&steam->report_mutex);
 		/* enable esc, enter, cursors */
@@ -566,6 +563,7 @@ static void steam_set_lizard_mode(struct steam_device *steam, bool enable)
 		steam_send_report_byte(steam, ID_LOAD_DEFAULT_SETTINGS);
 		mutex_unlock(&steam->report_mutex);
 	} else {
+		steam->gamepad_mode = true;
 		mutex_lock(&steam->report_mutex);
 		/* disable esc, enter, cursor */
 		steam_send_report_byte(steam, ID_CLEAR_DIGITAL_MAPPINGS);
@@ -1590,12 +1588,14 @@ static void steam_do_deck_input_event(struct steam_device *steam,
 	b13 = data[13];
 	b14 = data[14];
 
-	if (!(b9 & BIT(6)) && steam->did_mode_switch) {
-		steam->did_mode_switch = false;
-		cancel_delayed_work_sync(&steam->mode_switch);
-	} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
-		steam->did_mode_switch = true;
-		schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
+	if (lizard_mode) {
+		if (!(b9 & BIT(6)) && steam->did_mode_switch) {
+			steam->did_mode_switch = false;
+			cancel_delayed_work_sync(&steam->mode_switch);
+		} else if (!steam->client_opened && (b9 & BIT(6)) && !steam->did_mode_switch) {
+			steam->did_mode_switch = true;
+			schedule_delayed_work(&steam->mode_switch, 45 * HZ / 100);
+		}
 	}
 
 	if (!steam->gamepad_mode)
-- 
2.45.2


