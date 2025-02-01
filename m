Return-Path: <linux-input+bounces-9646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F1A24899
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EC2918852D7
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E1A16F858;
	Sat,  1 Feb 2025 11:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1j6cYmm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BD218870C;
	Sat,  1 Feb 2025 11:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409957; cv=none; b=hFjRMVGh8pqekMbLiGLd/f7utSa33F0kPb2wuEkK2zyfffmiiW4AFqTHr01Hnt3D1dWS6EvLh8hpfsTYgn0mNCdMUS+BEzDTj4HL2rT2Jgtuc6mXas3tbNq3N4RzONwjWPi3WTQ6LZEkzww+YMai7xDsi28JGpKSF0eGIf0REzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409957; c=relaxed/simple;
	bh=LoyKfdbmLD5YVIyqX4neirnxrenqNH8z23PNKKhKNQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iH4d+Kv3MPV9eNH/xGkcpA2wQdJZ5lGPTNPT82yYuBLtpj2Iz257k/7RJhOBDwCNg+iNicG5j7TwD5zXlN+WRfkIBPtW5qg6hf45uJ+AhcDX/07SW2JtI1lRSrRZ3iaTBckPvQ4f1RarT9yo4Lqky6P6W7LOMlrNLl5bgA4xssc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1j6cYmm; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so540547a12.0;
        Sat, 01 Feb 2025 03:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409953; x=1739014753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGU+KH8qALy60yOsWjLoA1nEcSW/ZuFe45ziT+4m0gc=;
        b=U1j6cYmmm4yAUsZ9FslZLoeWHsoPuIR6Z7/9tPmedeuH4CvYT9r1sSVfEpDQcV2QFW
         eMjK8jR/cjyINKvU/3nILsACMIHcffakOWGlC25yBqrKxkZOmkFH4txObqHl0G18IH2r
         k/YYIQ9k+WU4TPDqNTnigEtyr9HWGFphy7HIojfeiT5yqpOO5nnQe16E57cKJDLXdKBs
         1yLFTCaPdKMxDptVLYkbmEjFpoMhCBPURhflqH3nBYYVUAvNrl9PHR8y2sGQ17abC204
         ew+fk5YfUaRUQQ3CfhljtBopr9Z6HJqtgJqYk2YYQjaB6ZPUIEtAf2s1bsY2Y/bpj0N7
         TSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409953; x=1739014753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zGU+KH8qALy60yOsWjLoA1nEcSW/ZuFe45ziT+4m0gc=;
        b=gCBeaGQdxc2hnQdnkT1KIWorywVbeiY6kD49pQf2CS5+gZAveJ5zf+43l4923dfKg5
         qOFd6YHu3XkCErz68xQAEycbjYwlAv4mTfY5c1V2aN4Je0dZjhfTXDNto2DfKxctCQtu
         vU77nW4euWipPmAZaDnOeEeJUlAP2NjlYVScqnnwq8by1hIKIZHkYY6IqUBzWPInQ1cv
         vZVjTTBJNWDTt0SBbG+7Ju/6ERyQMYdvdALD/xLzMAri5ndSwOc/7s1isduwoJuHctxc
         /dIjgcaXRZA4F3Dia8W0FrqlgRGU88dYqypuoUN8AurVUIhpDSprfWbuk90QNdFuTX/R
         798A==
X-Forwarded-Encrypted: i=1; AJvYcCXK4/wwPin/9sf/o7N3grM2+iTAzSJYnb2mIQShGZvLU1GGVtQV46T06DoOBr2tUAVfiMg3063Vqt8p@vger.kernel.org, AJvYcCXfDTq0ueJNnAyW0Hzx1YBRVFSk7NCJeeah/boYng5LwSgtoWarq9wTvGwg1aLczJHcrAkYpT+sO6aBNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHSE0xFH2KsdTm1UwFUVPaKosocc2IhfOjYQSmpS/Y1BMNV9hJ
	pOA3klNSWZ0TnfIffA7cmB5yRsehSiCjnK4a1vzs7vR03DTM96ek
X-Gm-Gg: ASbGncs0/DhUBwEvygvYIY7lTjbv1kKjCkHT021d8KruvufqYNSXUVjcPL+69YtIuIh
	tNm3blOofViFe+XH8LRcQYponpbaNsQbwc8PivVDypV8bizj9SLcgqW2svRY17n6UoFAgkJyqIp
	gw8r9OMKgu4yhOzalwRJZydfWEvuF0O+6yZv4olPQsf7OU9wlAplTpZFX3y03JZX015YH7UBXkD
	QksmByMeWZ/OJ0Fybj7sehUtq/S9VbqW4KMCedA/r7+V8Ym7A/13KdtFShiVgemCicsNXYbEhCP
	24Js5DYA3IOi7HRPM+uPpgCds3oXbypyQo1hfxdFV+ERq/RfqYvmcgvzZWyGNg==
X-Google-Smtp-Source: AGHT+IE9keXN+lqbVLjG8oTS5YJcK9LtKC6IpdmHQ5Re8MIlbkB/Fzl8r/i6bNBSEZ6h48XvCXsssg==
X-Received: by 2002:aa7:cb86:0:b0:5dc:742c:c8cb with SMTP id 4fb4d7f45d1cf-5dc742cccfdmr3077017a12.7.1738409952975;
        Sat, 01 Feb 2025 03:39:12 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:12 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 04/22] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Sat,  1 Feb 2025 12:38:48 +0100
Message-ID: <20250201113906.769162-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A lot of devices do not include this field, and it's seldom used in force
feedback implementations. I tested about three dozen applications and
none of them make use of the delay.

This fixes initialization of a lot of PID wheels like Cammus, VRS, FFBeast

This change has no effect on fully compliant devices

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 33 ++++++++++++++++++++++++++++-----
 include/linux/hid.h            |  3 +++
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 488e6a6a14a6..e2e431dec936 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -184,6 +184,8 @@ struct pidff_device {
 	int operation_id[sizeof(pidff_effect_operation_status)];
 
 	int pid_id[PID_EFFECTS_MAX];
+
+	u32 quirks;
 };
 
 /*
@@ -338,7 +340,10 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 	pidff->effect_direction->value[0] =
 		pidff_rescale(effect->direction, 0xffff,
 				pidff->effect_direction);
-	pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = effect->replay.delay;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -761,7 +766,10 @@ static void pidff_autocenter(struct pidff_device *pidff, u16 magnitude)
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] = 0;
 	pidff_set(&pidff->set_effect[PID_GAIN], magnitude);
 	pidff->set_effect[PID_DIRECTION_ENABLE].value[0] = 1;
-	pidff->set_effect[PID_START_DELAY].value[0] = 0;
+
+	/* Omit setting delay field if it's missing */
+	if (!(pidff->quirks & HID_PIDFF_QUIRK_MISSING_DELAY))
+		pidff->set_effect[PID_START_DELAY].value[0] = 0;
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_EFFECT],
 			HID_REQ_SET_REPORT);
@@ -784,6 +792,7 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			     struct hid_report *report, int count, int strict)
 {
 	int i, j, k, found;
+	int return_value = 0;
 
 	for (k = 0; k < count; k++) {
 		found = 0;
@@ -808,12 +817,17 @@ static int pidff_find_fields(struct pidff_usage *usage, const u8 *table,
 			if (found)
 				break;
 		}
-		if (!found && strict) {
+		if (!found && table[k] == pidff_set_effect[PID_START_DELAY]) {
+			pr_debug("Delay field not found, but that's OK\n");
+			pr_debug("Setting MISSING_DELAY quirk\n");
+			return_value |= HID_PIDFF_QUIRK_MISSING_DELAY;
+		}
+		else if (!found && strict) {
 			pr_debug("failed to locate %d\n", k);
 			return -1;
 		}
 	}
-	return 0;
+	return return_value;
 }
 
 /*
@@ -1088,11 +1102,19 @@ static int pidff_find_effects(struct pidff_device *pidff,
 static int pidff_init_fields(struct pidff_device *pidff, struct input_dev *dev)
 {
 	int envelope_ok = 0;
+	int status = 0;
 
-	if (PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1)) {
+	/* Save info about the device not having the DELAY ffb field. */
+	status = PIDFF_FIND_FIELDS(set_effect, PID_SET_EFFECT, 1);
+	if (status == -1) {
 		hid_err(pidff->hid, "unknown set_effect report layout\n");
 		return -ENODEV;
 	}
+	pidff->quirks |= status;
+
+	if (status & HID_PIDFF_QUIRK_MISSING_DELAY)
+		hid_dbg(pidff->hid, "Adding MISSING_DELAY quirk\n");
+
 
 	PIDFF_FIND_FIELDS(block_load, PID_BLOCK_LOAD, 0);
 	if (!pidff->block_load[PID_EFFECT_BLOCK_INDEX].value) {
@@ -1336,6 +1358,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->playback = pidff_playback;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
+	hid_dbg(dev, "Active quirks mask: 0x%x\n", pidff->quirks);
 
 	hid_device_io_stop(hid);
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index d11e9c9a5f15..94ad5a510639 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1227,6 +1227,9 @@ int hid_pidff_init(struct hid_device *hid);
 #define hid_pidff_init NULL
 #endif
 
+/* HID PIDFF quirks */
+#define HID_PIDFF_QUIRK_MISSING_DELAY	BIT(0)
+
 #define dbg_hid(fmt, ...) pr_debug("%s: " fmt, __FILE__, ##__VA_ARGS__)
 
 #define hid_err(hid, fmt, ...)				\
-- 
2.48.1


