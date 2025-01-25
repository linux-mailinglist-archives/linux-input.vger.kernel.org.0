Return-Path: <linux-input+bounces-9545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C65A1C571
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CCF87A3976
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFDD20767B;
	Sat, 25 Jan 2025 22:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0roP/ya"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D10A2066E5;
	Sat, 25 Jan 2025 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843947; cv=none; b=Ai2paFIeLywk4EHeiklNem6okaMLxdkdsiwk6Xmo/Hg7G0Y2Moe2EF17rxJ9i8BziVsGvF307HMDHTzh7mWemguSlipvbYRLSkuXRA9EHJZ+R43t4al8LoVHfMoxvYk/f0nQcd6PF1V/jyurDM10DK4N5covSspsnFp08STRCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843947; c=relaxed/simple;
	bh=4K6Ktazg8UjZRyNjmJVyYZQUmtkSr7vSe5kY4mMQ1Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e7PjiLHApWaMCq+Xhses8OKRSKfXZHOR8HhF+npUaht3vQRNV3kG9oB3mDXm3AoX9ygG3Psrl31Gwc9ZxrJ4NqKySaxi8V4L40QupUqzUxXye/yrhWl0bYIXGTyfBV6gNCdYURjtqGMeN9jzA8kEUsQzG9DCWMmZptjksF+thP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0roP/ya; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa676e4f36cso38239166b.2;
        Sat, 25 Jan 2025 14:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843944; x=1738448744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Al4YBblnhD6mAXZvY6iETyAjHehfO4Vpa6xV+iv+c=;
        b=K0roP/yaViQ5l8YMOLDdiiYwcphxuvWghWyPCRpDzSdigdHO9oWoLPpHGPHBFvMlet
         0y7vpR+2E+6FaYXwYYIYYDU68EiXF0QLX5jHh2KjqOKy5rEJMiGPxo38uFD5lej0ljuV
         Pu+o7uWLuTvDTV0Z1fCbzZldYAFs9WFLv5AzvQ4XKLlfIM1HCKHQ+4BzcwTChlJVGbMS
         uEIkm0g49jqo5fX2sI9bMizppOD+A4KNItPQVKQsHsnrzD1K0yKdF44x5u5VQUbWWyVY
         U9wp0xte7FHTFjXsmhwaX/AWSMQx1oGIoM0r6SmOJlbiqTLmPXhBg5ObllsD/a53kH9G
         Pv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843944; x=1738448744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7Al4YBblnhD6mAXZvY6iETyAjHehfO4Vpa6xV+iv+c=;
        b=HpevTRVkrUBVHpf4kMZ26CwY77jwGhxilWjdQSwCFIJdqaP7eD6yH7sI2jS8buiLEY
         OTHzcWEf7rUgxfPMOEadsARF5rTFGLieAfg0F7Mn/HWrmc4dpfE/8iutpfhmPBsMNrLs
         ZjXweV/rNf8JQPBAwKsuomk40ScrQCU2PvMH5aoexXNSSZQ5roOaN8R5ez3JtbUh0Jku
         ygX0/DqjsOZetb1DIQ57AGQTg6E5tjbW+4IH5lvbnrr9GhUSmINXf9WR4Wh0yDd1fG+y
         xCGfeAfqcfLmA0E6NH2kIm5BMasQsPllIwNU9etw4SVsy9z0007mqJZyfU1sEIZ7w29b
         c8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWur/R/IwCBu4SIwExUdHVeb8j5PHy6yYZSQ89oThdYCq/4xaCB+go5Gb5HjBA9M5s2WsU9jWghiquE1w==@vger.kernel.org, AJvYcCX3oyvtUr5zRdoxAC918f+YYX3zTUD6Af24ENxNHtjIiljI1xOoW2fQQbZAoONovTvDbUrk2EqUnyd9@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5/6BxBDn6wNXx4lR4GOcTqQCo64v573vL/eOG4wAIYKaNDqsG
	0qOeIWMqjyE26521eGTndQ885zhCPUOUSUoI1ucaHqY/e7JfvZ1e
X-Gm-Gg: ASbGnctmLuCv1s6m3j9DDNvSsbKlvp/RNKDG8uAcCtL/KzziCSI6mJ5Jk6pHzoOe2gO
	ZWp8OX1fUVxMTrA0NTqYKk4I2Kbl3AoReVaHP26a9BN3WjzBeod46HyoyMEsK2n0M69tE6anQrX
	3fnL0wrfdW5OMG+4b6R76/xBi+iz8AHwL6KV+mElNbqVanzWHu24k1d4GRwSZOvb+3mETCFeQfw
	d+nEP5w1ZYr+RwJ9trZGK4AjqDGG6uW2jgUkZcTK91Bkz6bpiRdcmWsylUTp2vKaH4nw1xI8qDT
	iL8VKh7kZyD6yU3i5pZCv6q/P7IfLG+W8TETY88FFwvdJ1LDdqY=
X-Google-Smtp-Source: AGHT+IF/1541SngmeRXbjOSd9/HXoG7lEzbVtMEQBy3YWECJJ3j/fNEp6XMkSq2Rh/6YUdsHBRQjzg==
X-Received: by 2002:a17:907:72cf:b0:aa6:91ca:3674 with SMTP id a640c23a62f3a-ab38b240583mr1277545566b.4.1737843943778;
        Sat, 25 Jan 2025 14:25:43 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:43 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 09/17] HID: pidff: Stop all effects before enabling actuators
Date: Sat, 25 Jan 2025 23:25:22 +0100
Message-ID: <20250125222530.45944-10-tomasz.pakula.oficjalny@gmail.com>
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

Some PID compliant devices automatically play effects after boot (i.e.
autocenter spring) that prevent the rendering of other effects since
it is done outside the kernel driver.

This makes sure all the effects currently played are stopped after
resetting the device.
It brings compatibility to the Brunner CLS-P joystick and others

Reported-by: Jules Noirant <jules.noirant@orange.fr>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 9e03dfb2b1e7..c125f029b6d6 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -109,8 +109,9 @@ static const u8 pidff_pool[] = { 0x80, 0x83, 0xa9 };
 /* Special field key tables used to put special field keys into arrays */
 
 #define PID_ENABLE_ACTUATORS	0
-#define PID_RESET		1
-static const u8 pidff_device_control[] = { 0x97, 0x9a };
+#define PID_STOP_ALL_EFFECTS	1
+#define PID_RESET		2
+static const u8 pidff_device_control[] = { 0x97, 0x99, 0x9a };
 
 #define PID_CONSTANT	0
 #define PID_RAMP	1
@@ -1222,6 +1223,10 @@ static void pidff_reset(struct pidff_device *pidff)
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
 	hid_hw_wait(hid);
 
+	pidff->device_control->value[0] = pidff->control_id[PID_STOP_ALL_EFFECTS];
+	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
+	hid_hw_wait(hid);
+
 	pidff->device_control->value[0] =
 		pidff->control_id[PID_ENABLE_ACTUATORS];
 	hid_hw_request(hid, pidff->reports[PID_DEVICE_CONTROL], HID_REQ_SET_REPORT);
-- 
2.48.1


