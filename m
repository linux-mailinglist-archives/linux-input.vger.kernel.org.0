Return-Path: <linux-input+bounces-15869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D93C2B99F
	for <lists+linux-input@lfdr.de>; Mon, 03 Nov 2025 13:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C951F4F185C
	for <lists+linux-input@lfdr.de>; Mon,  3 Nov 2025 12:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8798830AD05;
	Mon,  3 Nov 2025 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JR8gkNwl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B8A30B513
	for <linux-input@vger.kernel.org>; Mon,  3 Nov 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762172240; cv=none; b=bRQ+/ktx+5Z/JCyawvQ0aQpXBqEyofgurbZQiSfDEHi1O1/xv816wzecsped1cpkQPn+QHo+a3OLDnfcAhPDR0i+oS2cUYusKfXTnnsqEUYvK+9qKKMyAMyLOcpySGCtVaKj82uC5TX70ApFTquOEGOjRzranvYS5aiACyiXfI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762172240; c=relaxed/simple;
	bh=Eu2RF6OKGPIVUkFaQXnVTBKltfcqNVSb1NPLbOG6NIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YRCq+az6K76ZUWzO5tmTj8+FYZY/sR6UoJHeT4LwWx+oBsu3m2LM52PY1ZYWNyQaw/APsJm1BekRLjElSZW3DVRVFpX7p5mu+nU89MZFXc4pfX9gvF66RsTM6D1sQ99RvVCVBGMHfxz1/9N51eZ2W2eLA9R8TNauvWSc/cO7VfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JR8gkNwl; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-34029cd0cbdso4070909a91.3
        for <linux-input@vger.kernel.org>; Mon, 03 Nov 2025 04:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762172238; x=1762777038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G7Xr+ijHIHt+XuI+JKJP5xoXGES4lQ31jxbVccQq1k8=;
        b=JR8gkNwl/yNio9zyRpXCGE4NUCf5hAQ9mEgsE+JAKbei4bow9AUuLXotL80x9Fi/vt
         UoNF6YT12wjqRIEUnVQLuBzf2ARuqMuJRQVLxAopL6LnI35W3I9Ssl76ZHyCAEG3DsIW
         ofFZvBy1wANvi3wOuX/favZHHXIyoaOL6WbTpdwREmbT8yFAf39ZmIcZg32yiPo+JaHw
         cN0k47N2hQjqCab6fLzJsuLLk7qsShd6NYvNU1G8MjKGVqRsV0WG8HlBp+CpYgMQqmby
         7Bo4HutcyIguyemGpakWWpfcRZbYCLWdef66Hy7OLKjuHrqvAckWTM65lGn0iQ2pTv58
         vGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172238; x=1762777038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7Xr+ijHIHt+XuI+JKJP5xoXGES4lQ31jxbVccQq1k8=;
        b=weQlJmq9V5KJD7yo4LLKop6GEuFWYxU0mHZpaDPf1X5JXOSRwNpdfPCkbFB0HPVOhW
         wEC/S9lB9AQU1RG7R65sA75YkowVpYk8vVz295iPR2XC/GF+vToUX4BnHlLagdn73dyp
         ATOnaoAhUT1+xDUjh9IyW1ihMehBDcyYT8rws65sfBwDY16iqDpY+Uxdp+lvns4oCtJi
         VKUWhdHmmA5t95j62ZYOJilJmxzQ4FZjC2ktQKo7NHNfpEHm1ZB/ybC6FFRMlDn87h7B
         C8CKlpWbCJiyBX1D20LCCxKGZgYUk5hZkAwe4FfQMQ+y8i29vMWDNR43Dhbr+iMHPfEt
         qLlA==
X-Forwarded-Encrypted: i=1; AJvYcCVYOjnAYp39tcOPUunMYM0l66l0mt7LZzk/HlDPkHCOlJh9iMQNlN2bjs3GiTn3h5qFfxwgGFjww0lriA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsn9KOagpxTsUfrKC5y7X4504T785thfKRlLJuX7kzbcR8c5jb
	CFiBkx00lPaStNeInmC4oaHuG8dB/XDpjAKOWMch0mIgQhkOLBKLIOX5
X-Gm-Gg: ASbGncu4piWSECWKXNMWyctH7XjPpCQdePfvA0Lk0m0ZdeocHxVcjxglXMVEuQfKSHM
	mOxGtYD8X22qoz81IMLP0R4lWZeUg0hTD0kHI4RMqki3ElFmj95BonZ+KXqQcrrVAbPW1LX6oVz
	ZDRKmpzpTldrEodG7y4/rJzbFzyXs8PfqFcWEIpdnyaohnFYfzFsqI/BvPKBj2Ms1jY8bhr5gvs
	o5NNuLHXSeO2FNkOX2DBRZucxiaFoK3KmKzqg2PAVdMWbLB8inWmKhnc43b0uZ2seq7Sdp3E3Od
	l915ofin4eUJMvEH3pfvGLz6sBQ9A8bzR+jnbqJArU2SsvcsQrh9xcHF9/NBtY7pWF+fg8SzZAn
	5h3eBeeXTUC5o9KVkxT5KgD2rkw6CkiyeOJ72b9bEUhlG3WSpLZwtslnXU7vOuOQSoncf+qqc/z
	T9Xr0XNMkFzrx1Ipb2plywGvLGEQ==
X-Google-Smtp-Source: AGHT+IEdJFw3Y79J46j/TZCnFrPTXTKo16wKrsnYv7B37Yc8KjkJ16rPr8YsgV4iwyDVvmk3g9oAWg==
X-Received: by 2002:a17:90b:48c5:b0:340:f05a:3ebd with SMTP id 98e67ed59e1d1-340f05a40f0mr6354475a91.28.1762172238104;
        Mon, 03 Nov 2025 04:17:18 -0800 (PST)
Received: from c.home.lan (ai099037.d.east.v6connect.net. [138.64.99.37])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415994267asm908537a91.8.2025.11.03.04.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:17:17 -0800 (PST)
From: Naoki Ueki <naoki25519@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Naoki Ueki <naoki25519@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: elecom: Add support for ELECOM M-XT3URBK (018F)
Date: Mon,  3 Nov 2025 21:16:45 +0900
Message-ID: <20251103121646.202256-1-naoki25519@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ELECOM M-XT3URBK trackball has an additional device ID (0x018F), which
shares the same report descriptor as the existing device (0x00FB). However,
the driver does not currently recognize this new ID, resulting in only five
buttons being functional.

This patch adds the new device ID so that all six buttons work properly.

Signed-off-by: Naoki Ueki <naoki25519@gmail.com>
---
 drivers/hid/hid-elecom.c | 6 ++++--
 drivers/hid/hid-ids.h    | 3 ++-
 drivers/hid/hid-quirks.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 69771fd35006..981d1b6e9658 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -75,7 +75,8 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		 */
 		mouse_button_fixup(hdev, rdesc, *rsize, 20, 28, 22, 14, 8);
 		break;
-	case USB_DEVICE_ID_ELECOM_M_XT3URBK:
+	case USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB:
+	case USB_DEVICE_ID_ELECOM_M_XT3URBK_018F:
 	case USB_DEVICE_ID_ELECOM_M_XT3DRBK:
 	case USB_DEVICE_ID_ELECOM_M_XT4DRBK:
 		/*
@@ -119,7 +120,8 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 static const struct hid_device_id elecom_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_BM084) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 0723b4b1c9ec..2245d85cacf5 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -449,7 +449,8 @@
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
 #define USB_DEVICE_ID_ELECOM_M_XGL20DLBK	0x00e6
-#define USB_DEVICE_ID_ELECOM_M_XT3URBK	0x00fb
+#define USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB	0x00fb
+#define USB_DEVICE_ID_ELECOM_M_XT3URBK_018F	0x018f
 #define USB_DEVICE_ID_ELECOM_M_XT3DRBK	0x00fc
 #define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index bcd4bccf1a7c..5ec5eded5f0b 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -410,7 +410,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_ELECOM)
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_BM084) },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
-- 
2.51.2


