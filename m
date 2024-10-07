Return-Path: <linux-input+bounces-7128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE860993A34
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 00:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C46E61C23D87
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 22:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3914518CBE6;
	Mon,  7 Oct 2024 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1yjyZfp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C33718C333;
	Mon,  7 Oct 2024 22:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728340006; cv=none; b=ff57VExyMvfatQO4gz+pRoLbNxe8ADnSMLPnZPVR3uvdnEDLhvqdnn3Ailf1xBppoYedeOyGwV1E+ZtfD5BSv7wiM91f1evCTy7qCJGjZyPZfj9D61MO5zohj3PVNMrdH3h/YMC44ZJiEkRItjs3MMEvQiQrnBciRkW2MHfQpL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728340006; c=relaxed/simple;
	bh=s1chuupEFHKJUenoqKBKV9drZcUicju1+fwNELE5Pbk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XzbWwWPwCn7SBRgpxXP/HT4eeh/5s8BAWuZt9L/4586uQegim2TamLwcxuOCNW0daa0oQKJ/JBqkPx/yA5mdhhad/cGjvVHC6CcOJ5bGG9HdvqBOtsutPc089HB2EQaF0YCGtFgI2UkGI/QKwJc44Iu7lr02lyuZAzU4isRdb5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1yjyZfp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a99650da839so75872566b.2;
        Mon, 07 Oct 2024 15:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728340003; x=1728944803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n/CGUkd/GhgN2cUAcq2ngCPNBjuX5m2rLE3sQnCAUPk=;
        b=D1yjyZfpanllwHdn4gCu6cQsYOyyn+vRruc4lk1USlosXG8bT2LeZkZCAGE0YghdkC
         bHViQIlL9fnQA8Y/lsaNtIlBnTvsKKw4FKeFDEQjvzipybEguGwP9qRDalbOPTqjhfpa
         y16bXt9OWo+x+Y7A3v2UEou8y3OYxR4Zl9HauVOruo7SQvvO3f2NrsaAyI53lwOAc6GQ
         ggCwTTanVrkpRAQa9ZiGrTv37Cght67znyQOnpyOWZUD4D6G0dkEwhMqrq/rSqfwO8s5
         MjJP6yoWZ9NVbcXUZOJmv6eXBIFMLMKARNvCLSd4tJY4GihTi+l3c2UfmJSSxB7pVUfM
         ZQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728340003; x=1728944803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/CGUkd/GhgN2cUAcq2ngCPNBjuX5m2rLE3sQnCAUPk=;
        b=WCFi6GqwPFEbTm/qOKPwW6SMWOA2qY3TqXyivQ8FGTdDDa3K5lxct3HevTdqGcFOCL
         FBynpl2ssAFPvo8EEQWAX+YUUzv28HAVhAvM5IT18YiU/9MvY47A1MA/70wmdtPU3vyg
         H1NiquZQMYUpuag/LgVOLzQudPdIolXuqg4mwRH/gaEyMqcKz4IP/mAlnM6KEe1KiC3W
         fgg9KESbtQTCcdM2/JnrDtl70iwIChJGlKms5lG447wMGJHVbF1LUI6tWS/sEnYSMz8d
         N379FJwkIVjhkYE4B1k8ZFHSUwc7do8oGfn9sSl8AtKNBxofw5OiNZguBa+sfdiQgud9
         xlTw==
X-Forwarded-Encrypted: i=1; AJvYcCVjufb37gjJ7ETNF+uesoA6blmrvgReIVpvxpbZuz3QJNWicq8y8+Xcc6un3/IhSq4knJsK5FWy25YhQxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgGzXWX60PPjMC0ijr0Vy1iM7TY0nLfjR/sitHOXhNnkgyBRKh
	Y4bXW0URN7ObKIq69McHPIsq3dVik0sa3atfsL4tiqczJwSpGg5sEaOSVtOB
X-Google-Smtp-Source: AGHT+IHlVl3OOFzjVznzFE4NYNRwcpNycMWIQvcE4qqive3GnmFuzPTxrV0Z7Iz8Lyw5JJp//0RTAA==
X-Received: by 2002:a17:906:99c1:b0:a86:789f:c756 with SMTP id a640c23a62f3a-a991c04e6d0mr1198459566b.53.1728340002668;
        Mon, 07 Oct 2024 15:26:42 -0700 (PDT)
Received: from fedora.. (apn-78-30-66-171.dynamic.gprs.plus.pl. [78.30.66.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a993f866da4sm354358966b.192.2024.10.07.15.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 15:26:42 -0700 (PDT)
From: =?UTF-8?q?Bart=C5=82omiej=20Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bart=C5=82omiej=20Mary=C5=84czak?= <marynczakbartlomiej@gmail.com>
Subject: [PATCH] HID: i2c-hid: Delayed i2c resume wakeup for Goodix touchpads
Date: Tue,  8 Oct 2024 00:25:42 +0200
Message-ID: <20241007222629.172047-1-marynczakbartlomiej@gmail.com>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch for Goodix 27c6:0d42 touchpads found in Inspiron 5515 laptops.

After resume from suspend, one can communicate with this device just fine.
We can read data from it or request a reset,
but for some reason the interrupt line will not go up
when new events are available.
(it can correctly respond to a reset with an interrupt tho)

The only way I found to wake this device up
is to send anything to it after ~1.5s mark,
for example a simple read request, or power mode change.

In this patch, I simply delay the resume steps with msleep,
this will cause the set_power request to happen after
the ~1.5s barrier causing the device to resume its event interrupts.

Sleep was used rather than delayed_work
to make this workaround as non-invasive as possible.

Signed-off-by: Bartłomiej Maryńczak <marynczakbartlomiej@gmail.com>
---
 drivers/hid/hid-ids.h              |  1 +
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 86820a3d9766..8d21d250a258 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -509,6 +509,7 @@
 #define I2C_DEVICE_ID_GOODIX_01E8	0x01e8
 #define I2C_DEVICE_ID_GOODIX_01E9	0x01e9
 #define I2C_DEVICE_ID_GOODIX_01F0	0x01f0
+#define I2C_DEVICE_ID_GOODIX_0D42	0x0d42
 
 #define USB_VENDOR_ID_GOODTOUCH		0x1aad
 #define USB_DEVICE_ID_GOODTOUCH_000f	0x000f
diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index be5d342d5d13..43664a24176f 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -50,6 +50,7 @@
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(3)
 #define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(4)
 #define I2C_HID_QUIRK_NO_SLEEP_ON_SUSPEND	BIT(5)
+#define I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME BIT(6)
 
 /* Command opcodes */
 #define I2C_HID_OPCODE_RESET			0x01
@@ -140,6 +141,8 @@ static const struct i2c_hid_quirks {
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET |
 		 I2C_HID_QUIRK_BOGUS_IRQ },
+	{ I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_0D42,
+		 I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME },
 	{ 0, 0 }
 };
 
@@ -981,6 +984,13 @@ static int i2c_hid_core_resume(struct i2c_hid *ihid)
 		return -ENXIO;
 	}
 
+	/* On Goodix 27c6:0d42 wait extra time before device wakeup.
+	 * It's not clear why but if we send wakeup too early, the device will
+	 * never trigger input interrupts.
+	 */
+	if (ihid->quirks & I2C_HID_QUIRK_DELAY_WAKEUP_AFTER_RESUME)
+		msleep(1500);
+
 	/* Instead of resetting device, simply powers the device on. This
 	 * solves "incomplete reports" on Raydium devices 2386:3118 and
 	 * 2386:4B33 and fixes various SIS touchscreens no longer sending
-- 
2.46.2


