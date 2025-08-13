Return-Path: <linux-input+bounces-13989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8394FB25463
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 22:11:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF845C1875
	for <lists+linux-input@lfdr.de>; Wed, 13 Aug 2025 20:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3F22741CD;
	Wed, 13 Aug 2025 20:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZF4JGoX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31D82FD7C7
	for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 20:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755115820; cv=none; b=twMp7r7mubb5gjVaXb07lvabu8fFBBLn/w5q5BNDrpqlP4VKNly9XQMlzqBMHUrMLxpPTyjkGeemuS45IsIYHnqxZCQDyTjpxq4TpITprxcmLcehBfj3jddUpVT98ttM5KnMXOu8bC9m3jPnd9tNX9+xgLBKY9wKbl3zb//USUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755115820; c=relaxed/simple;
	bh=yrlhigK1RxXwfStkjT2r3h7LUb7oHvvLZ6lbpzqZ9lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMNqGxubtIMwEfo2lisEaWAsZV9m6QNVBpMOJ+dOkoW+0ir7Xb+xeWRPeELy76HzvtlKNrBhH8vpX/Hl/dFzq77gKc8JZqNDyHSjPxKx4lzF3TPAySen9dQ0HmxMpD1IAPUhow27K1wW9Woda2bVBbsrBjPf+A3qDZz6o7B0FLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZF4JGoX; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so3770966b.3
        for <linux-input@vger.kernel.org>; Wed, 13 Aug 2025 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755115814; x=1755720614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkHoZAZTJRN4g81i3DAmyJ5gOdFE6biw+IQS/NMNIl4=;
        b=EZF4JGoXkhg/v+SHJdaEa6R1TBX+As4Q9bsJwsTZM7oZakTKoWppcNEoY6dwNJOPF1
         dffsR+ebUdhihyclCQLuWX3o/BsJiRRnaIxFc9j2jplMYyTB1tMu2x4qa4KYctB5KCoQ
         7nSU6FRFmsfT9vk2CctJM0DiiCUCraTRwMl8JaP2wkTDe+e8FVkMsZVUXHLtrLLOyJz2
         2n6A/dVcTciLleQhrBd+yUPqLHgzww71krka4hZDGDn8mr7zbvf3RjuAfe07lmFt8aPY
         LkZ+Df7WOlnZWBnIQb5vCUxvinHDiuzmeQtOQufCr6KMbyRyJhw8qDq9s54z4f5msTce
         aK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755115814; x=1755720614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkHoZAZTJRN4g81i3DAmyJ5gOdFE6biw+IQS/NMNIl4=;
        b=rnIDNLxq5LYIV1hgS5dNb3PlfuHUhTIBfQtd5OC7QdPpo187iVZ5LW837J06cS5XPA
         Zq4GV+SZXgSMoT9HDuNoWC4R7sLl8aPrg/7r7p7GFt01iiWm1E+Sf8XjTnM2wvfpnlNN
         MJt+0IO1m3TfnKqmv5BQ4O/NaJhlD4ZatmJbiticIgVGS0iaEe/xsckhKGpXgmYE0bxT
         8BthuvwGj+SfMIskm1RaH0lrB9x08UV0EyfQ1Y1sp57XYVs2PQSZbkF6hQjF3VsogEVe
         GxHhBWSlsZWBghubMAbHO0d5C/5DNDQBtOlGZBd1Vm/Sh5VxlyB29lfq08c2zr/fvBIP
         9Mfg==
X-Forwarded-Encrypted: i=1; AJvYcCVjclmfSX2q76AQJc7w+/hgPQn3RwJY6+ROA6eYowlDHfLRy8U4AdJ8S5AWTffstdULo0vvabmgv6N7Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYrlfpykGbfsMalHJPXORxvcy4C4kZBTtZQbak84p1N2Wr1Lt7
	gxFjca9p/uV9Pmft++O0qDpd9UHD02DZAPNX0K25l0germeRkK4SodRV/XBH4w==
X-Gm-Gg: ASbGncteG1swMrPC/Jw523PuB+GSDXe0n4WMX0+ZpiFWnCjQJ8dgy2VUlIU4vlna3nT
	953WqjDpP7mQANPDBBNBl+K8P2jkp/dACqCnI6vpyEWtHJbG7Y8lk1adOiVg/4CwN/d2S86rNkl
	b/CxvvmGip+cjdw6G33EP7V3Lhpz+EnxMt/TIdgbOiq42KGqMByxV/B00EX4Wf9gY2+9iSQEvA+
	cGdhEqTHQos0B2k2k5qJNUTluaDtYv31KNpDNILT11XfdrxISli0kst4SJU4YMXR29+fNv+ObYR
	GA20at/60EtKi+FDtvCZ0QgD76U7yBSibmnrqVS8637kEO3k0tGzG9AlaVvA1IZE3wZg3lcAPQh
	lqzY04Lc74pePb9Mj6FXkEs95zNiYh95jwEg898iUGp3PkmLZQKRkXsI2X1zkccyvRFDxbiNoz5
	Q=
X-Google-Smtp-Source: AGHT+IEmgdpXqITTvtEsdkyag23kTZqTI+VpH3u3zYcJ0S8Lz2otibCOMPIbkOh1gLz9ZE+Pd/iW1w==
X-Received: by 2002:a17:907:c0d:b0:ad8:9fa3:8dd9 with SMTP id a640c23a62f3a-afcb99dd8d9mr17382366b.13.1755115813983;
        Wed, 13 Aug 2025 13:10:13 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0ccsm2454092266b.111.2025.08.13.13.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 13:10:13 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH v2 09/17] HID: pidff: Update debug messages
Date: Wed, 13 Aug 2025 22:09:57 +0200
Message-ID: <20250813201005.17819-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250813201005.17819-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

Better indicate what operation is requested on a given effect (play or
stop). Previously, we only had the info about requesting playback but
this could be misleading when the looop count is 0.

Add debug print that shows what device control command was actually sent
to the device. Print out its hex hid usage.

Make field_index const to make sure it won't be changed by mistake later.
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


