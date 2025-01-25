Return-Path: <linux-input+bounces-9540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4242BA1C566
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ABF516794C
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5FF206F1F;
	Sat, 25 Jan 2025 22:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJIoYQki"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0051206F05;
	Sat, 25 Jan 2025 22:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843941; cv=none; b=NNtWHBWiqjruvUUpgwMoE0eR54WH6kbJDJmq3nsDZ+Ea6k9w/7XFh8dtHrm8sBRjlDTFF2e9VcWik+90oq8exBGPZgsbBdJeJqFBA3dLpm8hFhLWOUXn1P7sJwY4v5DWrZRSfVdvqNOJkG+VoE0EATvzy3gxsLML9QJqmjSXjDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843941; c=relaxed/simple;
	bh=r2HpBPQDjRrVyhEvSIOGQAE936KzKNRVsJ73B7MzFOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L59q3ymRaVEeTqB/Fj0i6o+Af4fnX2h/tNgyFKDNsAbwT/gMcR6sUPAfQgfD+gEkrbSMB9kZzTalUdZr7FqyiuZLQzpnPQ6ZXEp3Wt3vMA7vMLx9GpF/0SBGKuEVftFZjurhjVURsMGII0RuD7UrLVVQehm6+g0LKbPg8+hWecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJIoYQki; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa6647a7556so63026366b.2;
        Sat, 25 Jan 2025 14:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843938; x=1738448738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQvhEKzM5pHRizGyFJEW6UlDPPbtCBt3Q8hUG+OtEJw=;
        b=hJIoYQkign4Dhun0alFFQGQ5qwQO7R4skkD8/+4urG1aNhPHg0SDALXu2QIrUqYjqE
         +t4u/gjXuVlnmtuj5MxtqGzkWJc94LyAejyNed2YITqher4YOT7SOttg491t5kw+bNzw
         cdhEFvb0taeOjKBGmRCpbPMz5w5hueNRoY9SMUDibiRl7NQPNGLyehbPKyiPiTJMs5HO
         DVe+Xuu3XQcirUjdxNxskFG1GTKSq5D3MMF8sGw/F1eGDwLPgQDjy1y/KQblr1kGuiNW
         +7eGLTHXmFpurNRcNpp21I3xOuITL8xAhKCd2TYhsc1eJJ+WtIaNq095T7vKFXWXQIdP
         YZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843938; x=1738448738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQvhEKzM5pHRizGyFJEW6UlDPPbtCBt3Q8hUG+OtEJw=;
        b=XYhSAz1hJCLNDlPQLUziJt0rDYGx92XT+3oBmHBgHNw1rIr31fNGa9+XVHvhDzuDQz
         gj5pqtXqJVhG3kntJIP8XifImtlG/8CWR5zN+uZpDc7T7xFKhhxXUFE5NYjPS7iVOtfA
         gzFFpQlJQff/O1qdNwP26V3mOuNmR1O064KyCqjiRpPCNlMCgIYWJin0BCDl4Ftwl0SF
         ts2BCxj+Z7J4Zzbhc8GU4vrzJuNk2Uy94amxDgm2D+EZDNpSnk/pQIowjPbhuqwx19JN
         YIrpweAOnmjnuZ+JsA/5RKn459im/UuBjwfvNlJYFzhTYzKlyT7+zlPYhoJ1uGEA2vz+
         RjdA==
X-Forwarded-Encrypted: i=1; AJvYcCVaelJe3hL0wO2vty1Q0/eRwauvZ9aUZhcWU1scuqwLGgZ5zXVhp+XU+151KOBJIw1Ydope7Yxp4ZYfMw==@vger.kernel.org, AJvYcCXY7/suBxBVRsmmY1oEktEcNgiind29rUDGNdoUOOGHgji/vImGG6KsQzVcDX4I5LQgp4jtMMfcuF8J@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+SjfJOhx1OLbTo98d7VuQ7L9rPw6un5kRPLG0XYENhy4rAPK
	8lGfp8zEtQ1dgaYAjcVJBaCM9CAOEM0jnL6qYO4eKU1bgMQVlyvC
X-Gm-Gg: ASbGncthouUC/NoWGUz6wHQKOp6Bjft+xJ04v1laNNead6E96NOmOeXSz414tZL4V+n
	zev5uaZcWo9PQUTRaK0Hc9l4hUWpZPrIMSSEWLOE76Sh6ybeiSdkQAiiklY78sg8vIcTfKUjspo
	W6Bd1vSq2y8KTcXwJVvhfNk1+1mjTET5R+clU8/51rBDe7PxZTvTlXv3QY0F7+jh1cw25rmUE6p
	b0aa7wflDdzENk75RLl0XuaZKJBbXzZ6C5AcVUKstg4PyQqpW9AA5WF3Wv+1qzA2UOUPVVqsnOL
	IGEXdJgR/S2a/S43wrdh/prxPrCnspMaHTIZ/pEHceAEoty4sdoT9kl+eiy3pg==
X-Google-Smtp-Source: AGHT+IG+oZYpMqKN4HUOrASc+ZNr6PQG3+Opt+CCgz4R253JiKL6E/9yk2vYXpm8+kHSPEBMua2xfA==
X-Received: by 2002:a17:906:6a06:b0:aa6:6e2e:b7f with SMTP id a640c23a62f3a-ab65139dd94mr625144066b.0.1737843937705;
        Sat, 25 Jan 2025 14:25:37 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:37 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 04/17] HID: pidff: Add MISSING_DELAY quirk and its detection
Date: Sat, 25 Jan 2025 23:25:17 +0100
Message-ID: <20250125222530.45944-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
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


