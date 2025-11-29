Return-Path: <linux-input+bounces-16401-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99711C9469B
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 19:46:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 47D8C4E065F
	for <lists+linux-input@lfdr.de>; Sat, 29 Nov 2025 18:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874C21B81D3;
	Sat, 29 Nov 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRjdApaM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06A8288A2
	for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764441983; cv=none; b=bShcc84sQ7OScwc+9Sza/DLdCLDVeSwTz0Oghg7Iimw0B9DExhLllIIBk8iGw2hhvPvHQ6tgHjjiluFPi0GjhXkDZjbVtuc5RDAmB6XhvkBA60wPeMlDVVe7fASApZd9HltsVm9wJjVHshufFW2kJwpreLqAMKCw5EfxR9J3UX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764441983; c=relaxed/simple;
	bh=a6HbKmFCVnm6ZfqDjPAqL4Gx6FWruNaDxo7MWLlAwm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XKnCTGjsFe/rlmnBm+GtcvevR+U/ENLkz1HaidGFOKChVtIF8/h2eb7vF6Z27j1XSlLxcD1eCxkmW8p60q1MxLTyCPaLlreS370oFVT1aBNbvA8F3cRMRbqHfQbrISLZSNADlCuwBjLvcLKArhSJMwiEqEJL6/gIE7LH+LdZvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRjdApaM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b735158ef24so41879266b.1
        for <linux-input@vger.kernel.org>; Sat, 29 Nov 2025 10:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764441980; x=1765046780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe7WQnj0FgtsBxHiiKgzbfESV9z+/KaeJmZd5lNY4nA=;
        b=WRjdApaMN5RiXOuRk9vlKhrcWnQOE6FPXhC7V4D0ibH4xA7B/ZjP/l3ZIP+hncENyu
         nj1Fm23b7zCTmmS56kxqHaEE/vllMVDmJRysMn3MEAyWmZ4exUdTelaa5rz2dHq9xzPB
         7WQq2IhAWZajhWvvUztsGrpi16xyykyNIb8IMyZLML1J5HH0pQ5Dg0wN8YoyXxS1ZGhF
         sglpUYI2yQ8sbwccDd0DjZfJmZV0T7Br5QZn3BEGTzRM2LNtKairV44BrjTlSBsG26rX
         EhjGWnv9gwPCKFHK5/ZvVGUWksLBG2jrzXGzMJ/Yl2QQScedw6Et/Fi1xRt23hw8K+Aq
         2wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764441980; x=1765046780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xe7WQnj0FgtsBxHiiKgzbfESV9z+/KaeJmZd5lNY4nA=;
        b=NORogeYegdvnutwiH6CuP3C0iYC5THC4zqPha+2EG/wsqh+vamE+ldY5Zylvn8ZCXC
         KTUhIZrIDNiTvdLW6v/TrvutrvMRL+QRcrDTLpJEA5oUaKnvkKUwsBDzkuhweQ51K8t3
         3SMVm9j1oWBb8oOPYe1NL6qsvhjYXTWZvZx/leCPE0oWdIwP8cXq2KFqEjLbw3KETaFx
         oikk2z30kG5bRde8hZ/MW53RQuaFsdHweVzUEz61b0N0bOafATV7+1WWh+fjkfkJwaY8
         TEWKhq/IHr1I55hf0uBECk+mvCuiWoIsWxQjs7G0NZN/Jht4EkdTrCTQ5Ybjd/novTDt
         JqAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4P0F6/lrvjb0R/wNvp6D42D8quhDNomuzQ6QS9MN6plWZQzmi1PXwu/aQPm6eN64GASqJCyK9X2wCOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+k0w9HUVh45hGXKxvN3fUVa+K/y2eEfCF+FLVkh2D1yWn4OL2
	MAb/3k8lcABqc96CpB3yTUVIXO58xYZu/TEGOGgNGfAVVp3KyiOd/HQhkiu3Kw==
X-Gm-Gg: ASbGncs2XYDSlOtdJwiGaenqYFEoDb33b26/RSMzQJ948XEBcdsINMAgBHh3qyhsa26
	iE2coDzyYCLlzrQAnaYX6Uj295j4cyc5WW4JodlIH7PC1CdmqG5ACQjF+vy4cOuaR/eKEKXFDwg
	ThCghsRveB0Iv0GPxI9jshKWdld9eLEaVr/pfFs8pRVr/HZQHcnsFPmS1xrBVFmtAEXNERh6g7Y
	Nksl8797EbRLs5JjOHzAZXTs5MSGcC8ZiMKdfRNhmhwJaRY3Z2c4PdMdxwnlgalJovO+RqzUASU
	3aF/CFvwPdPh/dnRjxvmpqCHSiDM640UGVSCCi/ccPE2ALl/y/qjfgtzpd5eiimpQWdgZjTkPXK
	4R27cniy+HlNhPNAah0wf81uE23dqY1O3RAwQq0mfnFNFmIMFQYzMKghTGSUHT0joR+Y3dqHrlG
	6C4ZfZNyAxGNqPoFh1kfs2Pv4ZDWzrumWElAuXsfG1cKuqSo2CFNTbUitpeTs/v90p
X-Google-Smtp-Source: AGHT+IEYakAZ00wVP8eUWnUgKKlcHL8OT3rhDcJDR/YyrARZhvIKuvKMB+hII2WmIoO5bVDtIfQNcg==
X-Received: by 2002:a17:907:3cc6:b0:b76:2f66:4ddf with SMTP id a640c23a62f3a-b76773d2c57mr2095495066b.3.1764441979738;
        Sat, 29 Nov 2025 10:46:19 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b757sm748744266b.66.2025.11.29.10.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 10:46:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: pidff: Do not set out of range trigger button
Date: Sat, 29 Nov 2025 19:46:14 +0100
Message-ID: <20251129184614.1919238-1-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some games (mainly observed with Kylotonn's WRC Serises) set trigger
button to a random value, or always the same one, out of range.
I observed 307 and other values but, for example, my Moza R9 only
exposes 128 buttons AND it's trigger button field is 8-bit. This causes
errors to appear in dmesg.

Only set the trigger button and trigger interval in the trigger button
is in range of the field.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 95377c5f6335..a4e700b40ba9 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -523,9 +523,19 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff_set_duration(&pidff->set_effect[PID_DURATION],
 			   effect->replay.length);
 
-	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
-	pidff_set_time(&pidff->set_effect[PID_TRIGGER_REPEAT_INT],
-		       effect->trigger.interval);
+	/* Some games set this to random values that can be out of range */
+	s32 trigger_button_max =
+		pidff->set_effect[PID_TRIGGER_BUTTON].field->logical_maximum;
+	if (effect->trigger.button <= trigger_button_max) {
+		pidff->set_effect[PID_TRIGGER_BUTTON].value[0] =
+			effect->trigger.button;
+		pidff_set_time(&pidff->set_effect[PID_TRIGGER_REPEAT_INT],
+			       effect->trigger.interval);
+	} else {
+		pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = 0;
+		pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
+	}
+
 	pidff->set_effect[PID_GAIN].value[0] =
 		pidff->set_effect[PID_GAIN].field->logical_maximum;
 
-- 
2.52.0


