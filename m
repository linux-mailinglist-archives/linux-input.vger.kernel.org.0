Return-Path: <linux-input+bounces-9523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A87DA1C36F
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A63FB3A8E8A
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29221209F26;
	Sat, 25 Jan 2025 12:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqDyG3WE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C26A208964;
	Sat, 25 Jan 2025 12:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809701; cv=none; b=GvR0OT0FrPWWX8ZE4ItFB+EjdYagBdG9sEcfh1APAGIDV0GTJAEExiLoE2aaVj4Ox1sJvoZykFcWyoabYT9j6FGnR5C2hPA7IOgUz+mOfOVAQNQieQOB4qp7YxarpPFSbtaMVhZxH5Oz/DSR8i2QGRAiid6PYy7mmpdFhoPnIPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809701; c=relaxed/simple;
	bh=4K6Ktazg8UjZRyNjmJVyYZQUmtkSr7vSe5kY4mMQ1Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SN0PT4zbB8DLS+8qyVMTMCNJeTtIpZu7H/2ZXrRs4ed5aXRiPdGG0xPQzZg9y1Med55z9WBaGKMYbnXT1RV2MA9UpfuaD814lgc8kqHnUyLujyuZG8CcGnroj5ztDTi8i1cAK1grOsAXNRWQb6m4+jty/nyEFVQVBBtJwliCN1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqDyG3WE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5402ec870b4so448689e87.2;
        Sat, 25 Jan 2025 04:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809697; x=1738414497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7Al4YBblnhD6mAXZvY6iETyAjHehfO4Vpa6xV+iv+c=;
        b=lqDyG3WE+GIBdsRbCSLwaAskUAa2hEONtGcCBkUDdOjarHW7O/VPxoLSEUmvASsbt3
         S4dxRK60z4cpMV8rflcuAkaT7rwMz8l80KKLz88CAWZLYmTu9t2EZ2DVPa8gPaosWuFZ
         Aguf7vbO69xkpqCp8GqdQd3/98ORe63uAvTRa+zx7v4GsfvVij2zD+pchSareRLSY7l2
         +hGBlyfilC14Df7UY733pgMO6HDAP4RkdD/oJPmX1t6lx/TyZ/xViS+dduN/nC6nvSd6
         RPBSAn84hUcdm1f9Ahq0+6DhDGlLUcf6v4wvSWd5iqikeLIe7RtZ1QGjiwzOqXdsoXKt
         lQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809697; x=1738414497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7Al4YBblnhD6mAXZvY6iETyAjHehfO4Vpa6xV+iv+c=;
        b=QoFFRBz72eR6wXO+UGbfhJrYNS53SpIWgu4zmKOft5MiuCSwGppnBv0r9Fojx5hCp9
         Ux9NVuaA34fUCyrXMTZenRGtCxnlT5F5/vNDcsgRpyZ+7R7aKDpQuqZvQw7vC7ryXC8u
         DLBfy7rGJZra6UWwWTI+RCcwKZkdkseQSa7ZezNm4EEgUBJTFEG8kjpBDFQ60Xi8HJPD
         JbHTYj2pbH4Ya5MZypdNZQyUcsfzvNe/6Cn+q6moo/je+sm5VDlDr3qRIx3VBDQ9vtZi
         Uf6CV/OwFiettIJ4v9FkuVo0awMcc+yJIaocn+fnqWBhaUqg8Plg2gxMouSVXO0jV9m8
         9utg==
X-Forwarded-Encrypted: i=1; AJvYcCVxVqh5WLrbnxwL5rKN6jpI73eB9MkAmy9zfnlSlzNFmOho9ddQhm3w8yBNHT8TtSlX4SDyrqEU6OLa@vger.kernel.org, AJvYcCWHsumr6yUQoRodBXOWL4Xaofb9wLLywEmc9RCyQT3XVcHLuiozHFEqDrs9E6JEE6F6sg/lKF/EvUoM/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSDJfnTSUEjzLSultmS7MMlCY1zygqPXC77tVa2bsbJf59vGD+
	dyZPiVJ09cXtClokD/vrKz3aCoFukvBJFEnRaccp+eGUVNT7VWTbvr2iUx2H
X-Gm-Gg: ASbGncv9z5yDhu/5f89iug8B1DYLlRFtI1ThqWVoy8zX+QaT0FgUGwHrrM7xihgiYvb
	2msQy8UsbY79TTqpJhLZoKy23nltOwi2791rQj400G0Ee4KYv8jwMJ+eN0Ga5oVunvd+LNSEVuH
	6sfaH5PRdGA8ldeiI6RjMu+06SYtMhWei3/+30vHuGSzpGS3MZTFzWFq4tDYLw4dncyZ2kki40Z
	r1D55ajG/NrpWdLx6gR4jWLICFv5LR8rsKl6Brf32OFdpsAYTDpIpW45ufz+GTB/eydlkgqUoh5
	GSRD/riLZTQ6hE0Tj0EN6/Mdubwvyqy54tPIZfjMmGHLlJOLiEs=
X-Google-Smtp-Source: AGHT+IHz7RwK62kFFp70tDXbfYQ5LhTzdw2WhwnkSTMWPWMV9t+pKjbrHnfiXRKKQVH5dg8HqJXGhA==
X-Received: by 2002:a05:651c:50e:b0:307:2aea:55a4 with SMTP id 38308e7fff4ca-307587d598fmr21555541fa.8.1737809697304;
        Sat, 25 Jan 2025 04:54:57 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:56 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 09/17] HID: pidff: Stop all effects before enabling actuators
Date: Sat, 25 Jan 2025 13:54:31 +0100
Message-ID: <20250125125439.1428460-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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


