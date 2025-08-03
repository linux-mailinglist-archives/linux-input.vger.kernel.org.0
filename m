Return-Path: <linux-input+bounces-13779-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F48FB194C0
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 490F11893D09
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F41361E9B2F;
	Sun,  3 Aug 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPIwqzgO"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302141DF755
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244847; cv=none; b=Kfr0sitaoS7UiKsLU9q31AmXxVvw4NGyd+dj1k+OZd2Si6T24gsRsiy1s6osB0yrwWL0Xy44r9z33L+TQpBVvwcBIy+E6G/ovtGtTneEXBj7hfCchu97bEKAubofbMZDw1/52brW5fq9rxMp9I3bM6NJsKAxX0ACJP8Gsd+fGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244847; c=relaxed/simple;
	bh=e915KpSPTIYMb9Gu1Cxy+HipKv6aoKhh+CaRu8damvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPWAeY3s6KSvg8ct+bB121oPB+W5W/ojszu4o2LfuCYUbjPVvF5+XSGCypm/Vw2dk7dYbYV7NxI9a+xIN46MCyZGWn2PQvU5QV/c7EVCMpwqR0obiDpcHk72DYRAgHQQza3Om6V+oKy+7UnyMxfY+AwpRHFvJ3vJtjl0V/ViFWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPIwqzgO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6155527ab87so535373a12.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244844; x=1754849644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uRMpeTcyUbKrM9TQkB8Fprd38OZjJE3OZz28UqTflU=;
        b=jPIwqzgOpw16cS2Rrzsw5bnAtKmraoSQM6+pDDbkCjPzmFH18aAX2Dlk+2oB8usgzu
         VtJOVqVInecDXP4tXY85gtWoaMghs4MopHqjdX2QZ4vqqICSy+ZyoR72r3v2mw6HPXVm
         DQy9v8h99wU6uYoMhEcTR9G9zduypPjwn5csKJK2FRmke49tgbyzstNrUsbQbL9wMMjB
         Ux8GPn3hRINc1kvNCWnFgREgsA3eyOMN2kzPBrNbyAdzCy+WnU6i9wWYicmEnredTsJ3
         TwK/yR8PT8BGb1BTWo0wf30Hr3NUjs3+QwNepe34P9rZ57rtKhiEmLEiJDRhmT/4e1eV
         1VUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244844; x=1754849644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uRMpeTcyUbKrM9TQkB8Fprd38OZjJE3OZz28UqTflU=;
        b=n0+rbiy9ejZ0b+yw/PvzC3lggkVwhcMdnhprUnnyv3Y8610+GMylsfsdwbPqoTAh82
         WQybAQL2KWfk+S09Z4ekMTMDJUXyIT6n/d5Q/K3rVDorY37NLWy43ylUm+SHSOAJkG4L
         oZRrNbp/iwBcsti4mXu0bbgddtxSjZCrGjb7QrIlwTqVbIhgQU1kI5J/FIiFN9j3ZtcM
         Xbmyn+/XfqQsK/0OJ4L+FkQJM1Jev4u/dN1CddVLx6Rq1bADg44XyVu/Zm3xv2MuPm9H
         wYyT8trYefpJafqWUN3Wh37RCcEYwaQQnlBK7mkBqbfqcXivvahFeEaE2+xBvnWaDh/y
         n2dw==
X-Forwarded-Encrypted: i=1; AJvYcCWssGBN1NRoFm9nFHWOzmyaGaD8jDTfDXWgl2vDcOTIbEKG8bBRmKx+2TBJo+40F8ZpU38sl4JT79pKUg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7I/GMjsux1UQNQH43TjstF0mCRWSH3OxJwVtlTZow3XTv7YCX
	+HTu2CWeA8VvXyvdpxT/AJlxrxbTPJchE778lSTmt8CH6AWBOX62tqxR
X-Gm-Gg: ASbGncsJLngrK88bc2dMFaOueUBt4GuL9GutJ5mnwnMcjFmc1kb5kfcU85FCAoELWZW
	1ro0rt+EhdoXnmXfwIfItzA3RalwYDY0hpYr9IEG5XXTnc/7+cM1LyrwXb82Hm6wIjuOh3oOe7S
	vafk2i+vsgaZoTVzS+RIheyNOp24hsmIeP1FJxS9c11Bu8owyPpLUqCcRYA8iZi59+8WqzxOWFU
	Mgn1k8jvddo/6UYtZJ7QX9eVLd5UQcvQwQESEtnbCnsx+FgkiC7FbVyXCD1i6TObvvl1tGE0VBT
	W5bMXUWpZlf4g4jk3112F/AJCQDb9uW+K0gXUPCEfPY2ggLVcrt2CQK+JEaRp892Ov65WzWtrgS
	SGznS98ZOR5B9F9AVKCuHaHgahzSVkH5R5kjAdBwVHH+a95bxwTBOEVI6G0igPY06NKQiAzLE5N
	sRG2fA+CvxoQ==
X-Google-Smtp-Source: AGHT+IEAfi3BOMbep7204KJbj3Xg2i4FparFPJexHVV0SXdhbhlgZb77yRG7iLR2razdbv7/qcA8pQ==
X-Received: by 2002:a17:907:60d0:b0:ae4:1eb:c461 with SMTP id a640c23a62f3a-af940196008mr331817566b.14.1754244844442;
        Sun, 03 Aug 2025 11:14:04 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:14:04 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 09/17] HID: pidff: Update debug messages
Date: Sun,  3 Aug 2025 20:13:46 +0200
Message-ID: <20250803181354.60034-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 0f49d2836e9e..689419b20bf0 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -623,8 +623,7 @@ static void pidff_set_gain_report(struct pidff_device *pidff, u16 gain)
  */
 static void pidff_set_device_control(struct pidff_device *pidff, int field)
 {
-	int i, index;
-	int field_index = pidff->control_id[field];
+	const int field_index = pidff->control_id[field];
 
 	if (field_index < 1)
 		return;
@@ -634,8 +633,9 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 		hid_dbg(pidff->hid, "DEVICE_CONTROL is a bitmask\n");
 
 		/* Clear current bitmask */
-		for (i = 0; i < ARRAY_SIZE(pidff_device_control); i++) {
-			index = pidff->control_id[i];
+		for (int i = 0; i < ARRAY_SIZE(pidff_device_control); i++) {
+			int index = pidff->control_id[i];
+
 			if (index < 1)
 				continue;
 
@@ -650,6 +650,8 @@ static void pidff_set_device_control(struct pidff_device *pidff, int field)
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(pidff->hid);
+	hid_dbg(pidff->hid, "Device control command 0x%02x sent",
+		pidff_device_control[field]);
 }
 
 /*
@@ -751,6 +753,9 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 {
 	pidff->effect_operation[PID_EFFECT_BLOCK_INDEX].value[0] = pid_id;
 
+	hid_dbg(pidff->hid, "%s PID effect %d", n == 0 ? "stopping" : "playing",
+		pid_id);
+
 	if (n == 0) {
 		pidff->effect_operation_status->value[0] =
 			pidff->operation_id[PID_EFFECT_STOP];
@@ -772,6 +777,8 @@ static int pidff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct pidff_device *pidff = dev->ff->private;
 
+	hid_dbg(pidff->hid, "requesting %s on FF effect %d",
+		value == 0 ? "stop" : "playback", effect_id);
 	pidff_playback_pid(pidff, pidff->pid_id[effect_id], value);
 	return 0;
 }
-- 
2.50.1


