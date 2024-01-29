Return-Path: <linux-input+bounces-1541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6848415C8
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 23:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20C5C28A572
	for <lists+linux-input@lfdr.de>; Mon, 29 Jan 2024 22:37:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2C351C4B;
	Mon, 29 Jan 2024 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaNqFvAy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A850252;
	Mon, 29 Jan 2024 22:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706567752; cv=none; b=UiJCWQYOBUYz6gqEtevnvqQzQoOAA+U5A/g8Bsk65sF9XIm1Ct10CDWY1fWy2A+Izp7b9eYaQypx35FHkwRaStYExIwJTWWZKRZfMTk9kiBvBd581ee61HEZJJ8dV/p2/YllDffha5hU5RnrSEaAQheHpnpEaIjvfYQEKyRtCHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706567752; c=relaxed/simple;
	bh=RKi7RV5uqTYfeY17D9UUBa5mdgGZY9nJH1x5zySQN08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N43HPuS1y5cOgnwFmdk3lF7gfWUw88nez76AD8MFDxgyJXm87MYuD4MKIz12mJIVp8yE+4agm85EQNDh1RpBWRYvptcvV30mGlVUHQOfzYU7LuEerm6H3eo3aX3wSd4oZEBO5sft5+UaFXGWzY7CJBm+a79vt7TyoF+5dG1YBq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaNqFvAy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1d72f71f222so15515875ad.1;
        Mon, 29 Jan 2024 14:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706567750; x=1707172550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qt7MhmC7YFSSDzqSKXTM+a9Cksa0zpWSc7G/OxtRoCs=;
        b=SaNqFvAyO/4Z2grAh7ecohHyAaFTsTF340L4aUWiTeoJoaWLryVR1/35bA6ac/Otv4
         EEwBQ6ox6Y1hR/MqznfBh0AN/vsg5JHhopBZ124t5UWSO63q7AyTfE4/XpaZPgayVBOV
         1kz3wRYEzLeHKJ4xeMQcp/3CVKRg2apTPBqWyzb+N3UYWOlCzJQ4dW6sx0io9iwNrMvS
         Uvtk+1OsTD4f4184UxfHv56NE+p7wgWkOtjn2qA/4KZsrHEoabSjcb+IomfnDYDJxSA3
         LA/5pG/gM+P541OwGLU2V3FPWm1V5lFm3CgXeiN+RM5m+3Y2JHpnY6ZHTUKKphPgnXIo
         hGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706567750; x=1707172550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qt7MhmC7YFSSDzqSKXTM+a9Cksa0zpWSc7G/OxtRoCs=;
        b=gDnBPZrVckAKV6RBhR/wb7dbwDhovCR/UFwA/8Xd5sun+Z1Mxhe9df3j7nmb+Vec1K
         iaii+tl1pEcztbo9Y9EWzrLgGwENGIV+BjnskvU99AFhWA3upholro/lbcUKSgDJrNux
         PKhEofq1G0mTwkLkGVPh2HJfsaZQw308HEHCp/7I36zqpvTyZ/iCXh5iWL71pAiA6ChV
         KI+yAjwFuvzqyzXEKqGvEPOI5XFAZCxQDMLpGT/qOSbCALdjYYEfUQDQI9FY4fmeljxD
         6JrpJTYzKkfhDOYezoNWSqm2X+msyFeHBWBsYZWYsllbmvL4hMDnZmMFWmIVyJ/OWQ3B
         xryg==
X-Gm-Message-State: AOJu0YwZ2AbK4QggAJWp9QF67lfFBYvvkI1fkA57sVVs9L9VYrOZEfUd
	g7ANijrvmcMV3TgAwea8ri8DaCYe96ZpGZcDaRH8/d3vigIh5BtGTkIyToPK
X-Google-Smtp-Source: AGHT+IGGHRacYsONgU0PrWaDv+9HCw/HGxLsryzJhjBWEgwyij0xLle+dVcQwSxAOslqFz71bsICAg==
X-Received: by 2002:a17:902:e549:b0:1d8:fae3:21ea with SMTP id n9-20020a170902e54900b001d8fae321eamr1608403plf.61.1706567749513;
        Mon, 29 Jan 2024 14:35:49 -0800 (PST)
Received: from localhost.localdomain (75-164-166-173.ptld.qwest.net. [75.164.166.173])
        by smtp.gmail.com with ESMTPSA id jk7-20020a170903330700b001d8e5a3be8asm2184262plb.259.2024.01.29.14.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 14:35:49 -0800 (PST)
From: "Gerecke, Jason" <killertofu@gmail.com>
X-Google-Original-From: "Gerecke, Jason" <jason.gerecke@wacom.com>
To: linux-input@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Ping Cheng <pinglinux@gmail.com>,
	Joshua Dickens <Joshua@Joshua-Dickens.com>,
	Aaron Armstrong Skomra <skomra@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Jason Gerecke <killertofu@gmail.com>,
	stable@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH] HID: wacom: Do not register input devices until after hid_hw_start
Date: Mon, 29 Jan 2024 14:35:45 -0800
Message-ID: <20240129223545.219878-1-jason.gerecke@wacom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jason Gerecke <killertofu@gmail.com>

If a input device is opened before hid_hw_start is called, events may
not be received from the hardware. In the case of USB-backed devices,
for example, the hid_hw_start function is responsible for filling in
the URB which is submitted when the input device is opened. If a device
is opened prematurely, polling will never start because the device will
not have been in the correct state to send the URB.

Because the wacom driver registers its input devices before calling
hid_hw_start, there is a window of time where a device can be opened
and end up in an inoperable state. Some ARM-based Chromebooks in particular
reliably trigger this bug.

This commit splits the wacom_register_inputs function into two pieces.
One which is responsible for setting up the allocated inputs (and runs
prior to hid_hw_start so that devices are ready for any input events
they may end up receiving) and another which only registers the devices
(and runs after hid_hw_start to ensure devices can be immediately opened
without issue). Note that the functions to initialize the LEDs and remotes
are also moved after hid_hw_start to maintain their own dependency chains.

Fixes: 7704ac937345 ("HID: wacom: implement generic HID handling for pen generic devices")
Cc: stable@vger.kernel.org # v3.18+
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
 drivers/hid/wacom_sys.c | 63 ++++++++++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index b613f11ed9498..2bc45b24075c3 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2087,7 +2087,7 @@ static int wacom_allocate_inputs(struct wacom *wacom)
 	return 0;
 }
 
-static int wacom_register_inputs(struct wacom *wacom)
+static int wacom_setup_inputs(struct wacom *wacom)
 {
 	struct input_dev *pen_input_dev, *touch_input_dev, *pad_input_dev;
 	struct wacom_wac *wacom_wac = &(wacom->wacom_wac);
@@ -2106,10 +2106,6 @@ static int wacom_register_inputs(struct wacom *wacom)
 		input_free_device(pen_input_dev);
 		wacom_wac->pen_input = NULL;
 		pen_input_dev = NULL;
-	} else {
-		error = input_register_device(pen_input_dev);
-		if (error)
-			goto fail;
 	}
 
 	error = wacom_setup_touch_input_capabilities(touch_input_dev, wacom_wac);
@@ -2118,10 +2114,6 @@ static int wacom_register_inputs(struct wacom *wacom)
 		input_free_device(touch_input_dev);
 		wacom_wac->touch_input = NULL;
 		touch_input_dev = NULL;
-	} else {
-		error = input_register_device(touch_input_dev);
-		if (error)
-			goto fail;
 	}
 
 	error = wacom_setup_pad_input_capabilities(pad_input_dev, wacom_wac);
@@ -2130,7 +2122,34 @@ static int wacom_register_inputs(struct wacom *wacom)
 		input_free_device(pad_input_dev);
 		wacom_wac->pad_input = NULL;
 		pad_input_dev = NULL;
-	} else {
+	}
+
+	return 0;
+}
+
+static int wacom_register_inputs(struct wacom *wacom)
+{
+	struct input_dev *pen_input_dev, *touch_input_dev, *pad_input_dev;
+	struct wacom_wac *wacom_wac = &(wacom->wacom_wac);
+	int error = 0;
+
+	pen_input_dev = wacom_wac->pen_input;
+	touch_input_dev = wacom_wac->touch_input;
+	pad_input_dev = wacom_wac->pad_input;
+
+	if (pen_input_dev) {
+		error = input_register_device(pen_input_dev);
+		if (error)
+			goto fail;
+	}
+
+	if (touch_input_dev) {
+		error = input_register_device(touch_input_dev);
+		if (error)
+			goto fail;
+	}
+
+	if (pad_input_dev) {
 		error = input_register_device(pad_input_dev);
 		if (error)
 			goto fail;
@@ -2383,6 +2402,20 @@ static int wacom_parse_and_register(struct wacom *wacom, bool wireless)
 	if (error)
 		goto fail;
 
+	error = wacom_setup_inputs(wacom);
+	if (error)
+		goto fail;
+
+	if (features->type == HID_GENERIC)
+		connect_mask |= HID_CONNECT_DRIVER;
+
+	/* Regular HID work starts now */
+	error = hid_hw_start(hdev, connect_mask);
+	if (error) {
+		hid_err(hdev, "hw start failed\n");
+		goto fail;
+	}
+
 	error = wacom_register_inputs(wacom);
 	if (error)
 		goto fail;
@@ -2397,16 +2430,6 @@ static int wacom_parse_and_register(struct wacom *wacom, bool wireless)
 			goto fail;
 	}
 
-	if (features->type == HID_GENERIC)
-		connect_mask |= HID_CONNECT_DRIVER;
-
-	/* Regular HID work starts now */
-	error = hid_hw_start(hdev, connect_mask);
-	if (error) {
-		hid_err(hdev, "hw start failed\n");
-		goto fail;
-	}
-
 	if (!wireless) {
 		/* Note that if query fails it is not a hard failure */
 		wacom_query_tablet_data(wacom);
-- 
2.43.0


