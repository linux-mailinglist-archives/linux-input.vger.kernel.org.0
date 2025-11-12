Return-Path: <linux-input+bounces-16015-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C80C503FB
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 02:55:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC85189ACE3
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 01:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B59728B4F0;
	Wed, 12 Nov 2025 01:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rct3LXnn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBA07262F
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 01:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762912463; cv=none; b=jiAUtA5DdY4DwisPfz4N4ZCAJ+2pzU7+qA2R/RgVldZ50l8d3F17MbgXN3GYH3ZhaV0XAIOPWALea8LFbhgwRx5nSBQz3LEvwaKbKK3lh7034yi6wW1JOysulNakOu61K9gfWZkvQ/nM4kyG0rkh1anvLro83MKtbHEX2PrftqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762912463; c=relaxed/simple;
	bh=V+NLqMYPtbXGUxK8gaZ/4ZH91OoRNhD7Ixnn+V2Fgf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4SN5NZqFbyk+re6xGOZ+ApzRzCAC5NOmIRZiHOiGTNksrhWCv/NQkdr1ZAxPEnGUIcdmM6aMpoRL/oZG+ga2jhVftD9MUSiE/FOHZnNJmang+nga3gr+cXHkLjSuZo41WSP4Nxn1FoNuuSLxa4jXMtmcDnMOw+ReVX3dC26D8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rct3LXnn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b98983bae80so216900a12.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 17:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762912461; x=1763517261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=Rct3LXnnY0+be+blUrxiVerK8hJQWRuRzsIY98LmSKSHBPzOSQQDl9cdym54PGoe4H
         HwvzdUf5O0n0JQjxgZUPb6xIs3A0MSki0ceiZ3eIRa5yzslMSY3wDbDaVgyUBsdKKveQ
         wcMoAsISvn2ABmTAg32DE4UINqv5qnY4XvEZ2i5DFBzAjWAatlm5Jxi5OHY6w/EwI6G8
         PT25g+9+l0ameZp2qChUgD76bIzwKB06dZP+ACLta+GEFsjjtMBEGBpbCuIkPdQKMgdA
         VPOe/bUZJtMVfc5G1ZUn4e/HszyeNW8PFhJsthMeHgvQLbLEQJdutu+gKCVozL+A0YX8
         IMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762912461; x=1763517261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rAa0jaAUx7OJIZvkSAwlza4QkLZm6Uf91ra/ugzjRqY=;
        b=tzIzRGykDlCzJz4CSlcXILFJ4cgZDLp0MZTjGWkBrsgtkX5GigJk71Qlm5oZ6mspV6
         G8mc4tpuR1d8lksh4N3u+oYQRqt8ymCguPbImJQCXAOUSwd5uHxy1To/W23RgEE43aOf
         JihoGuo38HyBCvYduTyNMlPGoRjYUY/MTL+uBBR0xwCC0ZvCqVfL1bUy2s6N3sr/ZaaU
         aVNkdZOl2QfD6pERw7VfQi/ScrMIp43mTYZpepnym0INSNUZaTzHID46GyKsanJZQjRv
         AZxm49qICmapTxdO82Ct52VGPN0CN8MPzpv+6bfOWtqNqQhMAZI/Uiye2M/+VsBBr7nt
         GeSA==
X-Forwarded-Encrypted: i=1; AJvYcCWT0Gz+jcwbA/3REUkl00DSyrxFLDZZsjofJhE66oJj0UkXPjSyS3DQlIBTG1BFGrNAcxalV1CXxyUghg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+VQeZkypnVcvdUEh5V4j20AVCoC/en5LiTTd1mzmZDIGhrEd
	mi5he9b3a/wH/lDxfF8mlXxKYSKOpylW9+Af5Si77jJ8smy3y/eYqByhvn6CgBRGGWg=
X-Gm-Gg: ASbGnctS21A3ZoOucjLadzbZ1+22uHuihtWnd9xa9kKT4l3zqLm+CIN3AUR6lY0cZbU
	jj+OJVHkW9Iia+qcMckzHg+NwGeN/y/pEeqNxi4OBGH/uuJji0UW6EHH3hH9ohessqiVZqo8T47
	wYTsCCs2Qhs/K6lCzVXrTjTnxx0xMYvI//aAOQV9h7tjveYxdMtBp56VyBDh2asbfuQsG6ebnAb
	VjLq+UwiY1pCT5uznIrSQJctOyH3wG3LHGwr0P5cCc8U4Rn7N39UmXxFWRWLdHh/Wn5FA0+VsAE
	rTjCcUOD5SFesexhhrsExH2ILOPKFaSPkuawP//d55aIlMcAZDqhLvnKRKtkM0/jKagCT0HG244
	Ysbk0XPhgx8KsstKDJC7OnR4fuj6Giy8wuWKVCTpon378lL/6hEK7+QIo6y+TTS33gY0Wbt/LvL
	o/sUZGNy+rNw4M3EQEiROQbPv/ln5MxRCaXvvJIPQJvoA=
X-Google-Smtp-Source: AGHT+IFZt9kcYAzpd3HLic3Y5F+9yHyu+euFnDG9WwszKanIAdJLYfUAuWLotX0l9/nM4ymC5UH6MQ==
X-Received: by 2002:a17:902:e546:b0:295:1277:7920 with SMTP id d9443c01a7336-2984edac559mr16453895ad.28.1762912460905;
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
Received: from lugathe ([2804:13c:46ac:1000:f491:d00a:e2fb:e67c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dc9f8f1sm10886435ad.54.2025.11.11.17.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 17:54:20 -0800 (PST)
From: =?UTF-8?q?Rodrigo=20Lugathe=20da=20Concei=C3=A7=C3=A3o=20Alves?= <lugathe2@gmail.com>
To: michal.pecio@gmail.com
Cc: bentiss@kernel.org,
	dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxhid@cosmicgizmosystems.com,
	linuxsound@cosmicgizmosystems.com,
	lugathe2@gmail.com,
	stern@rowland.harvard.edu
Subject: [PATCH v2] Apply the quirk HID_QUIRK_ALWAYS_POLL to the Edifier QR30 (2d99:a101).
Date: Tue, 11 Nov 2025 22:53:56 -0300
Message-ID: <20251112015356.1919586-1-lugathe2@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111203350.3c9a669e.michal.pecio@gmail.com>
References: <20251111203350.3c9a669e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The USB speaker has a bug that causes it to reboot when changing the
brightness using the physical knob.

Add a new vendor and product ID entry in hid-ids.h, and register
the corresponding device in hid-quirks.c with the required quirk.

---
v2:
 - Fixed title
 - Simplified commit message

Signed-off-by: Rodrigo Lugathe da Conceição Alves <lugathe2@gmail.com>
---
 drivers/hid/hid-ids.h    | 3 +++
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..ece1bea0faa5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -734,6 +734,9 @@
 #define USB_VENDOR_ID_JESS2		0x0f30
 #define USB_DEVICE_ID_JESS2_COLOR_RUMBLE_PAD 0x0111
 
+#define USB_VENDOR_ID_JIELI_TECHNOLOGY		0x2d99
+#define USB_DEVICE_ID_EDIFIER_QR30	0xa101	/* EDIFIER Hal0 2.0 SE */
+
 #define USB_VENDOR_ID_KBGEAR		0x084e
 #define USB_DEVICE_ID_KBGEAR_JAMSTUDIO	0x1001
 
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..d104f4829d93 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -110,6 +110,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_1f4a), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_JIELI_TECHNOLOGY, USB_DEVICE_ID_EDIFIER_QR30), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M506), HID_QUIRK_MULTI_INPUT },
-- 
2.51.2


