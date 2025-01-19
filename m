Return-Path: <linux-input+bounces-9391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62EBA161FD
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 14:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE20B16485E
	for <lists+linux-input@lfdr.de>; Sun, 19 Jan 2025 13:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23AFD1DF271;
	Sun, 19 Jan 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIHtre4q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629201DF731;
	Sun, 19 Jan 2025 13:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737292456; cv=none; b=b24HSx4VJFkvC4ZHdxHNqJPOJMU1c9DVkZonmJlEnQOt+7KKw0MnASHWBmHSIpdg4oX9Plq5AwgUU80PeSyRsBcs2gjrKsuKn/akR3Blu0sSTRgrqGTCJBlv0KUAOwcTyS35I8SViIFIl2YuNHSz/gPW7lx7I+hpFm1YfjnX2d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737292456; c=relaxed/simple;
	bh=sE1wG2MzsF5AXI0uMU1EmAKL9ibe6BkNsGz3+hAYNnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=svGuLUunsxOEOvOCSx7dEnUjHtNrnBB5YV14ObxprAYg6NkQJKQNEjtVDADvShxEcfSEObeEjOjH4YsfuAwpEXB1QbSsoSVEw9eh0WnZuvFYI9cIp0sTVazg1M/kC6bi2jxg6pz/zoe8bruN7k6KiPstE7ifn/F4O6Q8NY8n+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIHtre4q; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3ea2a5a9fso561408a12.2;
        Sun, 19 Jan 2025 05:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737292453; x=1737897253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOUgFxoQTFAjXcydLrtUiE3FRvCWB7EkDAPknhRAiQY=;
        b=JIHtre4q/4WchtLd2Akuh/9IxWLri34LcwuzluEz0dX+0QFYMjLMkbWp0AAuV7n3SA
         DR6LDXKVvx8y2SCo6EGrbWG4Vq8FCfX0I78O1dN4JzQHAhSSwinjG74RZXLWrxXF3jLh
         Y0YheGPZIOzqbvOWiWdUTmUQJzUMxPX2KXI373nJOkPNz/bnoVZHAfcdRgKd6VccC6bb
         s3CAAARsGTwLX3vyBk5ydjd+g3wAND8hWTpLSnTiiyiiBgxi6Z7pARpOi6i4gHvhREny
         jwfTkYr2VE939W+DVLbnR/+Y40xjNG7vVFM/zaJgs1lLnCm+eQmq67ILLCMwO4AuCh7P
         ubNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737292453; x=1737897253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOUgFxoQTFAjXcydLrtUiE3FRvCWB7EkDAPknhRAiQY=;
        b=L2/p7kMqF4rtDrOkbhjdnaOxZhcB9rp972H31Rc2tlwsp5z3uMQiaKG39BtNVbAxKA
         V5VlaCmo5GpMaXDw6nZeXMwh4zjMuLb+Z5KgybsZuX8+RkKYT0u+Ne6x9SxkotjUJ/vW
         9zvifyZ7CxLBq0IxWIX3eretRehmqoxd9+M11jsq7bDAcUT8Tguysg781iK/yQjIoFuf
         kDSY/I0/Meb8NY/KD6PyaebXNVoXKI+6sYywEVzHwO/q+PbsaRot72BZNXZfbJZNquz6
         sw/iigOF4lc2AbQ4neQSOen6BiIN32ysOKv5ttGQBdq1cZocCIa3k/jCn+kQ5wh7RKbP
         acfw==
X-Forwarded-Encrypted: i=1; AJvYcCW0RQ64koAzf78baEiG2dXtfwypm0lv/iJemPVI0ayqV+0Fmely95bkeSww10SAbe75a/aBAjqgJZmugQ==@vger.kernel.org, AJvYcCXstxmuJhT4l3QeCExNEAn1Wcb3RPFF0Elck5ms21urUODmoiIbMm5nMLjqxyGOee3NmR5HTN0+8X5T@vger.kernel.org
X-Gm-Message-State: AOJu0YzHCnvQ1m7c3SX14i3a1bpb77VbE+yXfbL4D1+IcMMEgW7r/gly
	ffKESAAEpHXHzvMKOqOkfAH9K1V0xqaZG0nYtAXSD3jFIPUajheT
X-Gm-Gg: ASbGncsHmHpR3Ai5A55wU65VJlPRuNBxMNz6poHBgyA/Q0ieMhJ0wS/BmNmkAjeBdQv
	g9ynBGWHBOqTm36nXi3xTA5756CxaXcqy9AbHRAu9H57yClhgAjJCvUV5WOoiz2FwBkaNAgzs2i
	jAwCJCLFU3HoxwsMQe+WXE9VSFUreOXWFSZZ24s0UmtfmG6gujadg49lhLOZV8R6X18qwEBXUaF
	QqJBxcTTPjOVJe6TbCbty8lO6gJIJiNaUS9kL1c+phmapiGasza4cqRa8Dj+C6DtZImLuh2Z3pZ
	t4sTJmzyX8Py32GpRVKXFfXC+lp3N2OJ/rqZ9eUw
X-Google-Smtp-Source: AGHT+IEOnJMw/lNJimPnU6WghcELjDe/DOMcrEYspYwtQCTr5Oep85kTfXKDEQzwzHP7T1UWOlFp/A==
X-Received: by 2002:a17:907:7f0a:b0:aa6:ab00:7b9d with SMTP id a640c23a62f3a-ab38b26f478mr264644466b.4.1737292452369;
        Sun, 19 Jan 2025 05:14:12 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d27117sm481155966b.75.2025.01.19.05.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 05:14:11 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v5 09/12] HID: pidff: Stop all effects before enabling actuators
Date: Sun, 19 Jan 2025 14:13:00 +0100
Message-ID: <20250119131356.1006582-10-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
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

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 6b4c4ecf4943..25ae80f68507 100644
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
@@ -1240,6 +1241,10 @@ static void pidff_reset(struct pidff_device *pidff)
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


