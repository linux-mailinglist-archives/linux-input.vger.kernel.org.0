Return-Path: <linux-input+bounces-8710-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A49F9A73
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 20:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBB418974E9
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 19:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C1D221DB7;
	Fri, 20 Dec 2024 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mv/NqdFd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3669C2206BB
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734722716; cv=none; b=J3kXYB/A7inusMg6HHiVggIedpmAhgUsJw5RIFUXxJtDMvOuMgivxt9Y60Hka7uPjRRCnlm6rR7SXiPclNz7s49nXwvAof7UwTGhx/4jfWEg7zojjsXFa+9aPuaXPi/9GsFfvrYHS+nwoiokqN2VlLVJ7SJBvsiz+pm/bra2Qfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734722716; c=relaxed/simple;
	bh=nfhS06Ayye6R1XC2YITQF8UvfJVepkBtN4RX/JR43o0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nMp0XIu2qlXIm7T+X+rNtpgwu7MdKY2EImvamujfsUajFhauvWsyb+MN9tKAm+WzZUfX76DwB2YSNjHKj2I5h+4OccqVT73UKsDfXp+97XKm4Zuu+pMebMks0ANDU48IUh8z4a2JuEgQ+wnpFr+w7O8LteA0BryhD6BlRyn7QlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mv/NqdFd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361815b96cso15865605e9.1
        for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 11:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734722711; x=1735327511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMwKXTQuxbITLfqkuPO9faM5Wqt8RWA68rd4+vY7cao=;
        b=mv/NqdFdnzDrCjge+TVNegQKc7jzyh/yq8CGWFanulB9j9oWDEmKWlGmDsSSa5Oec6
         AJpChyIdzAi3XsmCfsbZe8lAWx1Ikpvjg+mgOjL8ZUyaN8Cm0gsfDVAt4xCi+x93Wv2v
         L4uxO2q2ojl8TTlRTR8K0aEI5izm4yI+xpVQ5Pb+Lz2ECtsBDPbfn8bQfbLq7JlvgpVf
         wCvYWsCWE02sZES5XP13qEGNAMYKyWExS61IY+zT0nj4gV5T5PNCiUV/HwKaNnVhAbVB
         +ey+vzhQTHgA97ZiN7aDSYpvBzzs2WPFI3sBox67stn/TM54oEPESfNBKgyEc1GweDmR
         OkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734722711; x=1735327511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMwKXTQuxbITLfqkuPO9faM5Wqt8RWA68rd4+vY7cao=;
        b=DlgkLr265P8gf8Ij4xLrZMkP7UypVcEHNkBcun6gQSFiA2IxzwlpcZwN4jlVg67bEu
         J5kxSmnvAV76XDFWwfKKCweLIKlgynYUIA9gmdVsNiijLq4sRKU5uG2t3a8lteqyI3aO
         R8VLGdsLsSG1MLQ9bm2yeWT1fjtESs4ngijEZ+ZIRsUVBGYpx3qCq9MakOltBN98XVxS
         rJz4kWRtrSSc+opYG3BKF4jjb4wqlw/nk9u7sOZJJookXIfWpOfnHo8agp0ROYFdqwRM
         XBEvk/UikBXaIzEl8fq0RCvHPoT0QJoUpM+6i89l4bemN8C2SnIijBklnEcYht3ur3wA
         SkRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6wODj7J1dxkAWybDogN0lJCEC3+S2rVtkQjggb7Cbwds7dwK85qq+T8dMZz2B/orAMPUU/BP4hSJwzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr+Rl7lF7v2kQpOgYZKj+BeVMxMW3r7ItXTV04jAsFoI8CKRIK
	uPb9MJd+nUa4qFhSTB5vMSVUKM/h+UfTq6CBO24NuHA0Mkz3EPT0r8Jk4ueDyRk=
X-Gm-Gg: ASbGncv1THaL7JwxotpRLT/Ioyxi01FLjlurxrzGFKOXtXEtkix1KP+Cy8U3n4p9HRR
	lhV9/tg8lhmvTd8IgkiDsyq85873O79Pqx9hMudyN5+OYji/VdmHwRfA6gnEdxJfylT8lFGaezl
	GexL4RG6i+seOP5T2uVZLPFglmGFrcneL8e2Cc4EVPEbMtgWnjzjA9Lzxn+QeVkbmws+/fV5bad
	FJ2n/gMsTI/DiPFPuXz73Tow3lM0X6hBw1S9yZHiZa5e6kLbIjBRDJ6wr9oH2z+g7nc0JNMLAcO
	qPChGzNaCdYd4cwhNNlKXdICz6VoU0Fv/LxmHUhp4RlGMUSceOmcy1ByGL9NVOLe
X-Google-Smtp-Source: AGHT+IHz8RzUSp1KM7kI01Wr+i40qkvd1/EJG2uYFI6ySetf1j7As+fO939uIKp1pE/Zex2B6iPr1g==
X-Received: by 2002:a05:600c:470a:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-43668b7a33dmr40093155e9.31.1734722711565;
        Fri, 20 Dec 2024 11:25:11 -0800 (PST)
Received: from green.cable.virginm.net (nail-04-b2-v4wan-169014-cust557.vm26.cable.virginm.net. [82.47.146.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm4710745f8f.46.2024.12.20.11.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 11:25:11 -0800 (PST)
From: Terry Tritton <terry.tritton@linaro.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aseda Aboagye <aaboagye@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Terry Tritton <ttritton@google.com>,
	Carlos Llamas <cmllamas@google.com>,
	Terry Tritton <terry.tritton@linaro.org>
Subject: [PATCH RESEND 1/1] input: fix generic desktop D-Pad controls
Date: Fri, 20 Dec 2024 19:23:18 +0000
Message-Id: <20241220192318.1174945-2-terry.tritton@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241220192318.1174945-1-terry.tritton@linaro.org>
References: <20241220192318.1174945-1-terry.tritton@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The addition of the "System Do Not Disturb" event code caused the Generic
Desktop D-Pad configuration to be skipped. This commit allows both to be
configured without conflicting with each other.

Fixes: 22d6d060ac77 ("input: Add support for "Do Not Disturb"")
Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
Reviewed-by: Aseda Aboagye <aaboagye@chromium.org>
Reviewed-by: Carlos Llamas <cmllamas@google.com>
---
 drivers/hid/hid-input.c | 37 +++++++++++++++++--------------------
 include/linux/hid.h     |  1 +
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index fda9dce3da99..9d80635a91eb 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -810,10 +810,23 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 		}
 
-		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl*/
-			switch (usage->hid & 0xf) {
-			case 0xb: map_key_clear(KEY_DO_NOT_DISTURB); break;
-			default: goto ignore;
+		if ((usage->hid & 0xf0) == 0x90) { /* SystemControl & D-pad */
+			switch (usage->hid) {
+			case HID_GD_UP:	   usage->hat_dir = 1; break;
+			case HID_GD_DOWN:  usage->hat_dir = 5; break;
+			case HID_GD_RIGHT: usage->hat_dir = 3; break;
+			case HID_GD_LEFT:  usage->hat_dir = 7; break;
+			case HID_GD_DO_NOT_DISTURB:
+				map_key_clear(KEY_DO_NOT_DISTURB); break;
+			default: goto unknown;
+			}
+
+			if (usage->hid <= HID_GD_LEFT) {
+				if (field->dpad) {
+					map_abs(field->dpad);
+					goto ignore;
+				}
+				map_abs(ABS_HAT0X);
 			}
 			break;
 		}
@@ -844,22 +857,6 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		if (field->application == HID_GD_SYSTEM_CONTROL)
 			goto ignore;
 
-		if ((usage->hid & 0xf0) == 0x90) {	/* D-pad */
-			switch (usage->hid) {
-			case HID_GD_UP:	   usage->hat_dir = 1; break;
-			case HID_GD_DOWN:  usage->hat_dir = 5; break;
-			case HID_GD_RIGHT: usage->hat_dir = 3; break;
-			case HID_GD_LEFT:  usage->hat_dir = 7; break;
-			default: goto unknown;
-			}
-			if (field->dpad) {
-				map_abs(field->dpad);
-				goto ignore;
-			}
-			map_abs(ABS_HAT0X);
-			break;
-		}
-
 		switch (usage->hid) {
 		/* These usage IDs map directly to the usage codes. */
 		case HID_GD_X: case HID_GD_Y: case HID_GD_Z:
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 121d5b8bc867..80433ee3e5ae 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -218,6 +218,7 @@ struct hid_item {
 #define HID_GD_DOWN		0x00010091
 #define HID_GD_RIGHT		0x00010092
 #define HID_GD_LEFT		0x00010093
+#define HID_GD_DO_NOT_DISTURB	0x0001009b
 /* Microsoft Win8 Wireless Radio Controls CA usage codes */
 #define HID_GD_RFKILL_BTN	0x000100c6
 #define HID_GD_RFKILL_LED	0x000100c7
-- 
2.39.5


