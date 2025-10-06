Return-Path: <linux-input+bounces-15270-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2CFBBCEA4
	for <lists+linux-input@lfdr.de>; Mon, 06 Oct 2025 03:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A08304E3370
	for <lists+linux-input@lfdr.de>; Mon,  6 Oct 2025 01:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB4C199E94;
	Mon,  6 Oct 2025 01:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmxuEYH8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168DA2F2E
	for <linux-input@vger.kernel.org>; Mon,  6 Oct 2025 01:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759712878; cv=none; b=An4naK/0SRXQagRE9/PzezVXUVYFGNDq+ZgboCQdqtgIYf9shvoIbhj4K31G2H39AfAhwzRhl/bGx4jVjxd4sgOyMYRO88qqwuOf3JZb9ry2Vgetuw5pWu9HVXPSCOrt3v1aLjbfec2YzP/B9FTh4tQaeGPOjZIfWrdYbj0V7is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759712878; c=relaxed/simple;
	bh=QMiD1qwbeA5/neIsw+5PU2x945Tw5HB6WOm7BzeC7kI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oDv7e0RQQZyUpvtCWo/eBzk2K5aSMxZsAkJ85/cMNIrUFcZ6Nwqpet9o9Eprp9tII+jjy01Mz3/PmPXSqSrgHR0oqppEaZMtfpXdWkYbgubBH9dMuYSI8nW4oRtJoVgFs5xZzDQ+ceZZ0RvxnPvI/Q0uNT6zLUzbp3f0DvNqliM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmxuEYH8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4060b4b1200so3827791f8f.3
        for <linux-input@vger.kernel.org>; Sun, 05 Oct 2025 18:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759712875; x=1760317675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IKzui3wcQLHh7+MPWXRL+dASlXd9vfw32BfptGnQh+s=;
        b=AmxuEYH8mtHhg764PBpSQ6HTVYmxjCBjoDzeHHxyPCF/XwnSBC/T7a4vsQ7Wndx35S
         jyGVbluWr+YANaP1uS7kIdZyt+POHJpPTSR1gFd4f0sjNmqvgB479+7OZN3JyM6quXKt
         H+5MFsahk6v2bNn/VxomK56TXTptMjBuRaSV3ZHpnpaw+/cRDJZhntC5FToyixX8wWhb
         rSaE2NDHZr+/QvfQQj49ocUPSz1wSGsa6OTt7OeseCY5gdabU1AqAZcsqvw2p4Y1VjoY
         r+MGcK0VWlydR8t7bF4Ulvi8pMPi8Nz4OeLbgACNmjxhuhhngT5TYPdPUQYwShV9IuJn
         HoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759712875; x=1760317675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKzui3wcQLHh7+MPWXRL+dASlXd9vfw32BfptGnQh+s=;
        b=oCYvay2qE9jHw9mzO4yVT84c4OdyZVvwpJK7AsAqJ/KA3Qgu/ZT6MZDgvzkzwFgTgg
         KHTwp1edja5ZkN3qcAQ2vLRj6Oy1mWcFiL5UHyk4wTz/Ki4MiGGKnfqMSSjSn7S9Oak8
         Ebosn+r+Mc8BCobg1fQC9XtUq75nsf1bE5YpYK7SKVAXpM2Fik7tFyAlQBzT7zPPQLQc
         gJI88c5mws3bUQz+1zD0oX37nAeV7MQ97aoCeYvj7XUrRNepx+S3rE1bPBIBx6Wy0uci
         cynhNGy2d5v6D2Y5rADY96G0mh0Y9oR2gpKqAsP9VrmIdGmtlif+14n6StssETMdk445
         NcJg==
X-Forwarded-Encrypted: i=1; AJvYcCVk2MQ6v5+FUylULj2cZspBNvmGl1uFJ4SYtZPWVCXwZ1xLl36Ur0kcqHmeFl4uNZqYzth2fMnvFQwv8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhrFT0/Iz6I5G+mjrY5TqTyiEVgnKk44YhjH1KZMjvec98KYHI
	c0jb3BEaIVw5zCSXGVmERz7u8u2Vslbk85Si2ZPZOf8dmNZjQ0SBm8iY
X-Gm-Gg: ASbGncs0XGhr5VUwXS3h5lysRBguz1dB11yY9kndW04CfSwHloe+PODhf1F8H9QESqk
	Lp+uat6FEQRHrADA3eSrQMAdpo2Q0DTD/VAwQiAq5dX9/tZstTOmYVnM+wdpXc7305QjRRCpgSK
	DNYWbMBPCBmU31yAB1zCLo7SNKl+Irn3ccfXxGShrZp6fWPapZByKcAY0KIhcCYrXGj406EmyRv
	9Z32PtciMNqYHpo34H42TIvY3n3+vOKKUegeuSSBzAvJuAFmYPLMi3HOrx6efbD4eFFXciUOszt
	6jWKgDmSOt3fY8LWfsOQPFuexDaPwZPCZZFnjdYF1lvOipe12H5ORBwp10e/LjaO/RV58alHPmj
	Rrn//Tb0lFI6yP6zrmGP7eK03Cc9c/g15XbqB16c86D7bfpuX+uT3RqapIyx6oeEMCw==
X-Google-Smtp-Source: AGHT+IG9KD2f/UKT2SVki942fc8VnC20C+WwkAXyuAMC1VIwXeBQI2mAMa3Bkd+fKKSoiTmjZxXPSw==
X-Received: by 2002:a05:6000:4210:b0:407:7a7:1ca0 with SMTP id ffacd0b85a97d-425671463eemr7336334f8f.14.1759712875118;
        Sun, 05 Oct 2025 18:07:55 -0700 (PDT)
Received: from snakeroot ([109.175.243.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e97fbsm18185933f8f.34.2025.10.05.18.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 18:07:54 -0700 (PDT)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org
Cc: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	linux-kernel@vger.kernel.org,
	Benjamin Tissoires <bentiss@kernel.org>,
	Bastien Nocera <hadess@hadess.net>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH] HID: logitech-hidpp: Add HIDPP_QUIRK_RESET_HI_RES_SCROLL
Date: Mon,  6 Oct 2025 02:05:49 +0100
Message-ID: <20251006010726.189197-2-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Logitech G502 Hero Wireless's high resolution scrolling resets after
being unplugged without notifying the driver, causing extremely slow
scrolling.

The only indication of this is a battery update packet, so add a quirk to
detect when the device is unplugged and re-enable the scrolling.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218037
Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
---

I assume this affects more than just my mouse, but I don't have the hardware
to find out which other mice need this too.

---
 drivers/hid/hid-logitech-hidpp.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index aaef405a717e..5e763de4b94f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -75,6 +75,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
 #define HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS	BIT(27)
 #define HIDPP_QUIRK_HI_RES_SCROLL_1P0		BIT(28)
 #define HIDPP_QUIRK_WIRELESS_STATUS		BIT(29)
+#define HIDPP_QUIRK_RESET_HI_RES_SCROLL		BIT(30)
 
 /* These are just aliases for now */
 #define HIDPP_QUIRK_KBD_SCROLL_WHEEL HIDPP_QUIRK_HIDPP_WHEELS
@@ -193,6 +194,7 @@ struct hidpp_device {
 	void *private_data;
 
 	struct work_struct work;
+	struct work_struct reset_hi_res_work;
 	struct kfifo delayed_work_fifo;
 	struct input_dev *delayed_input;
 
@@ -3836,6 +3838,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 	struct hidpp_report *answer = hidpp->send_receive_buf;
 	struct hidpp_report *report = (struct hidpp_report *)data;
 	int ret;
+	int last_online;
 
 	/*
 	 * If the mutex is locked then we have a pending answer from a
@@ -3877,6 +3880,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 			"See: https://gitlab.freedesktop.org/jwrdegoede/logitech-27mhz-keyboard-encryption-setup/\n");
 	}
 
+	last_online = hidpp->battery.online;
 	if (hidpp->capabilities & HIDPP_CAPABILITY_HIDPP20_BATTERY) {
 		ret = hidpp20_battery_event_1000(hidpp, data, size);
 		if (ret != 0)
@@ -3901,6 +3905,11 @@ static int hidpp_raw_hidpp_event(struct hidpp_device *hidpp, u8 *data,
 			return ret;
 	}
 
+	if (hidpp->quirks & HIDPP_QUIRK_RESET_HI_RES_SCROLL) {
+		if (last_online == 0 && hidpp->battery.online == 1)
+			schedule_work(&hidpp->reset_hi_res_work);
+	}
+
 	if (hidpp->quirks & HIDPP_QUIRK_HIDPP_WHEELS) {
 		ret = hidpp10_wheel_raw_event(hidpp, data, size);
 		if (ret != 0)
@@ -4274,6 +4283,13 @@ static void hidpp_connect_event(struct work_struct *work)
 	hidpp->delayed_input = input;
 }
 
+static void hidpp_reset_hi_res_handler(struct work_struct *work)
+{
+	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, reset_hi_res_work);
+
+	hi_res_scroll_enable(hidpp);
+}
+
 static DEVICE_ATTR(builtin_power_supply, 0000, NULL, NULL);
 
 static struct attribute *sysfs_attrs[] = {
@@ -4404,6 +4420,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	}
 
 	INIT_WORK(&hidpp->work, hidpp_connect_event);
+	INIT_WORK(&hidpp->reset_hi_res_work, hidpp_reset_hi_res_handler);
 	mutex_init(&hidpp->send_mutex);
 	init_waitqueue_head(&hidpp->wait);
 
@@ -4499,6 +4516,7 @@ static void hidpp_remove(struct hid_device *hdev)
 
 	hid_hw_stop(hdev);
 	cancel_work_sync(&hidpp->work);
+	cancel_work_sync(&hidpp->reset_hi_res_work);
 	mutex_destroy(&hidpp->send_mutex);
 }
 
@@ -4546,6 +4564,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Keyboard MX5500 (Bluetooth-receiver in HID proxy mode) */
 	  LDJ_DEVICE(0xb30b),
 	  .driver_data = HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
+	{ /* Logitech G502 Lightspeed Wireless Gaming Mouse */
+	  LDJ_DEVICE(0x407f),
+	  .driver_data = HIDPP_QUIRK_RESET_HI_RES_SCROLL },
 
 	{ LDJ_DEVICE(HID_ANY_ID) },
 
-- 
2.51.0


