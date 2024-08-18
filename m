Return-Path: <linux-input+bounces-5625-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC78955BCF
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 09:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0DC0B21225
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 07:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60677134B2;
	Sun, 18 Aug 2024 07:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myllfzCe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B84F9FE;
	Sun, 18 Aug 2024 07:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723966096; cv=none; b=NCSQq8sYGWgJMs8j3lKHlFBYiSlmbXd9sYu4L18/+E01Py8dtcuXIrsKfJurv2P0lPWRxDnB0z37V2sdWwF2dkcj21+qz1vDxt8hDdbxMn0PPCZxdy2zx3/sqYci1XaDhu1sD7UmK380xPuds40NoYqYhifkP46FQgE1rx46bjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723966096; c=relaxed/simple;
	bh=IVR+z55MFJ3ngR5dRGE8+7/zyHoxZdRpiN7nHZnN1+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gGyXpTzF7Lkz+LT9H09lAMCcbD93Zvcm3OAu7c6KZ7F99c3Xv+WK+VlRbIIyhHyFF7Jk0ZjFo3Kf9NW7avCSWKlgTza5V+Yn6Rdvv3dt7vRqUAXxDWYp85NI1eV2M+N+wP2DCH5FnV8Lp9XLax4ceEqn5dwVX2PzeoG1A2zIB9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myllfzCe; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so2514097a12.3;
        Sun, 18 Aug 2024 00:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723966094; x=1724570894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzLxMA3hQ+0o81svAEODFVHHE1sYADEpFXAQ+Lx7OwY=;
        b=myllfzCec2uNcowV/ROcI4Qu9UhiSf+cbDRngD62VKG5xykTVQuWjsFGSE1WHOJsgK
         IqSyJ/wlXI519caJl0c3pUbrcEBHLayiTWSIUCoWBbUtxr79j/QhS5AS399v9M2Tk+cJ
         OpntOoQ4UQIOOZFQR3nNY2StxXC3jpqfdyNq0VjAZgZEm9ViJ+0ZA1VNI5P02ExHGA6J
         6tlJR3uG8zOevIHZkuFBl893/2FbViqoEYS/JQDcDYPSz8Vq+p1hl7JVtczUCgU1bLNh
         Rwu73nLEh86RPSJYCE4NDM/k15DRF1K0+97T5wwHMqhaX+vndmBrSeh271eggGvkhJl1
         UU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723966094; x=1724570894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzLxMA3hQ+0o81svAEODFVHHE1sYADEpFXAQ+Lx7OwY=;
        b=tCtecCB/1emKUL7wSBUivz3aavMgd0fyifxwa5/lTslcs+cRpZ6FNfcsHz9ITf0lLh
         ioXvnCJHlI4fyfcgTtdguQTUjyWgwHP+/ZhHqfA5JBrJ2aMEdIkSNEhd0vbrl9QzmXJR
         ETD0XoJnBheRwNIOhkawTIqMIgfTqplxJqUtypOZ0h346R5NpvwLySj5i8JqJlIn6HCx
         XX2WNBQJUsMyRjJuENV0tTSO2KHe2heWAlF5bT/1efwplVbpk8Z8Q3Q2Z0U6QpeXzVo3
         2FUwCWi8EZYQj+pA8KvlCLzxZLdYY6W8mckkH+CYAjtqce+pwTfn1xCuadIp9cx+TsLB
         IhYg==
X-Forwarded-Encrypted: i=1; AJvYcCVMN2g095KapFqDFXxuz3Ancef6t72kUD5+WnemTF57ZJ9raI9etbKPGy/o1CdYAKzsL5aO/6XbSxqfZ0djb597zzmzOyb891aYcCNzK/6j5l/JBcitJAHMpQ8unf6hwNBB5c9kKlsq++4=
X-Gm-Message-State: AOJu0Yw9jl9cpZAvRr32ukwgNCQczCw2LSYHohX9l+RnOthe0kUFFgnI
	mFf8QoqLm0yI+jpRLf/fMOhIIv7Zmao0RgaLG1OV6UV5yN9MGIhp
X-Google-Smtp-Source: AGHT+IGJ37vB2kHTwlPsG5VqQ9zkMJzbS2l0M+JsFAJ9JBahwDt6x+FxpX9ELe2gXJRrWGl1HoorRg==
X-Received: by 2002:a05:6a21:3483:b0:1c6:aa39:5101 with SMTP id adf61e73a8af0-1c90504986amr12088961637.52.1723966093908;
        Sun, 18 Aug 2024 00:28:13 -0700 (PDT)
Received: from hera-2-ThinkPad-X12-Detachable-Gen-2.. ([59.99.220.234])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-201f031bc36sm47155025ad.100.2024.08.18.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 00:28:13 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: mpearson-lenovo@squebb.ca,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH] Adding Support for Thinkpad X12 Gen 2 Kbd Portfolio with 0x61AE as PID
Date: Sun, 18 Aug 2024 16:27:29 +0900
Message-ID: <20240818072729.33511-1-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This applies similar quirks used by previous generation device, so that
Trackpoint and buttons on the touchpad works.
New USB KBD PID 0x61AE for Thinkpad X12 Tab is added.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-multitouch.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7c..981813f50 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -807,6 +807,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
+#define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
 #define USB_DEVICE_ID_LENOVO_OPTICAL_USB_MOUSE_600E	0x600e
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_608D	0x608d
 #define USB_DEVICE_ID_LENOVO_PIXART_USB_MOUSE_6019	0x6019
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 56fc78841..1b0844ffa 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2081,6 +2081,12 @@ static const struct hid_device_id mt_devices[] = {
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X12_TAB) },
 
+	/* Lenovo X12 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT_NSMU,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X12_TAB2) },
+
 	/* Logitech devices */
 	{ .driver_data = MT_CLS_NSMU,
 		HID_DEVICE(BUS_BLUETOOTH, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.43.0


