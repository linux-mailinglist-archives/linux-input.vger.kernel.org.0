Return-Path: <linux-input+bounces-4989-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE23592F4E5
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EBE51C21DF9
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36611225D9;
	Fri, 12 Jul 2024 05:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP/tOpmJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0521B964;
	Fri, 12 Jul 2024 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761545; cv=none; b=PrwR++U6uxZkPUZmuWDgd4D4mkRlWcKaKu+MXetZBqKqFGXfIjGS/UDeYbaarEyTmQ3EiCvdJo7DPh4hVvgIb2896GJHzdQegYNwP3mC9NQ2xFI0uM5gKwNVnYiVm146Ag36tLLp+y43Cuq6jGNR+OvWGrEF1kvLlBjPULjipd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761545; c=relaxed/simple;
	bh=7eqopMkDjKlu/hakA2C6CO/W0kEaXw6bfsB1daa0d30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jDZkKHRVQeJ52yvpdvcoAh3a18pwaDYs34i4eCYZ+JKJ7jyXVTiHFkv0g/lft1nqlaMVr/zPpMGiRhYtd3b3+DTeKwkPxJMLKmSSptAG7CrjhkesJ4TZzm/4AO+ybrMHmnMqD8FJG71aaJO9X7F9ktCRNxZbEAMZNvfR04bxx/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP/tOpmJ; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d93f9c793fso842363b6e.0;
        Thu, 11 Jul 2024 22:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761542; x=1721366342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm74VrxyqY+0uev/+f0ppn+yBayQJCAzAB2dk3rWmmM=;
        b=HP/tOpmJ1D9w25yx3tBQE9Pph1tMtGQTYcv7mb3xOitRjrLNqyko4m3Grzjm+3pxGt
         V+Pyk5P5C6cShaDYIABcqnuS5CyGvFkJ6qtDwMJ9EHk1geygf51srG00kS2uc21F130U
         AmNaccI6zjPTHIqQ4XvoFubnieVwbLSCNUhnMwH9MlgGoI3boMrzgrPkxWnn9zrRU1Gn
         vlN+rH9hYVH8l2lnIi7YCB3tCkylld82B1+2sDQ8PyQKvG3/FVM9A3Vj95RhOJh095Vu
         oyYIudXZ/V9UCPg1wsGcG/jGdcU7O+2Y88wuK79fbADSylpPrNTBqWNGhIMa+iUYq/cz
         191g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761542; x=1721366342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pm74VrxyqY+0uev/+f0ppn+yBayQJCAzAB2dk3rWmmM=;
        b=OF9bn1I749ZG1rnE/BfY3l3UaZzaktd3jQHGiSJiZ4vnkcrRQkRht+DxJV0T4na570
         4ThJO+1cusUCON+CHprIMIo95zjAzUiAbT4oYa6fdxr6zxctsah8JQuZeSPaS2ybg85O
         h9BK9LhY0XMmrQIJRn1ITuw8uhhCu8tIYgetLkVwHWVQAy8R3HGPTloBD179anhDW0z8
         uoadCZswiWM//TwIw+PDC/u/QaLjE2zticWYRN3Qkn9kpMORB6MZNsRYN0n24MVbmcB0
         askfcQKBsxNCdUeSCfw+0lMwf0DZ1p1cLP2+xG09qKq30RokO3+6aP8eG03dlsI1YlJZ
         AZlA==
X-Forwarded-Encrypted: i=1; AJvYcCUKHJ0RLfTdGFgyluwiG4DF7DA0g8RsiIrVZscYFNe5iM6FUV7L+h9iOBKYRYkEUqTx/M5sx6zE7DmEx/t+rRWJxlRYlJw4o8vznXaJ
X-Gm-Message-State: AOJu0YzH/aAwlbXHRyuxWcWtf0TkI3Yyx5wJLjMZrTR2Qqv3jkcw9Eia
	soTR0w/cgRJddNJ8/rYjlQHlzEU0JSCWE/yeufiiFhzYrxkjFHVcE9RxRQ==
X-Google-Smtp-Source: AGHT+IFe25qCmxaQzes5XsqGYjN0Q/sgR8+ACQ6FgpwQOUA+X03VilQllfnIXl5PdwJfokiQDoviGw==
X-Received: by 2002:a05:6870:c34c:b0:254:96ec:bc44 with SMTP id 586e51a60fabf-25eae88a6d3mr8154434fac.28.1720761542349;
        Thu, 11 Jul 2024 22:19:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:01 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] Input: usbtouchscreen - move process_pkt() into main device structure
Date: Thu, 11 Jul 2024 22:18:46 -0700
Message-ID: <20240712051851.3463657-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
In-Reply-To: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
References: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation of splitting big usbtouch_dev_info table into separate
per-protocol structures and constifying them move process_pkt() from the
device info into main drvice structure and set it up in probe().
We can derive if we should use single- or multi-packet handling based
on presence of get_pkt_len() method.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 28 ++++++++++------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 3a9de3d24e75..f8a67834a695 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -68,8 +68,6 @@ struct usbtouch_device_info {
 	 */
 	bool irq_always;
 
-	void (*process_pkt) (struct usbtouch_usb *usbtouch, unsigned char *pkt, int len);
-
 	/*
 	 * used to get the packet len. possible return values:
 	 * > 0: packet len
@@ -103,6 +101,8 @@ struct usbtouch_usb {
 
 	int x, y;
 	int touch, press;
+
+	void (*process_pkt)(struct usbtouch_usb *usbtouch, unsigned char *pkt, int len);
 };
 
 
@@ -1045,11 +1045,6 @@ static int elo_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 /*****************************************************************************
  * the different device descriptors
  */
-#ifdef MULTI_PACKET
-static void usbtouch_process_multi(struct usbtouch_usb *usbtouch,
-				   unsigned char *pkt, int len);
-#endif
-
 static struct usbtouch_device_info usbtouch_dev_info[] = {
 #ifdef CONFIG_TOUCHSCREEN_USB_ELO
 	[DEVTYPE_ELO] = {
@@ -1070,7 +1065,6 @@ static struct usbtouch_device_info usbtouch_dev_info[] = {
 		.min_yc		= 0x0,
 		.max_yc		= 0x07ff,
 		.rept_size	= 16,
-		.process_pkt	= usbtouch_process_multi,
 		.get_pkt_len	= egalax_get_pkt_len,
 		.read_data	= egalax_read_data,
 		.init		= egalax_init,
@@ -1121,7 +1115,6 @@ static struct usbtouch_device_info usbtouch_dev_info[] = {
 		.min_yc		= 0x0,
 		.max_yc		= 0x07ff,
 		.rept_size	= 8,
-		.process_pkt	= usbtouch_process_multi,
 		.get_pkt_len	= eturbo_get_pkt_len,
 		.read_data	= eturbo_read_data,
 	},
@@ -1177,7 +1170,6 @@ static struct usbtouch_device_info usbtouch_dev_info[] = {
 		.min_yc		= 0x0,
 		.max_yc		= 0x0fff,
 		.rept_size	= 8,
-		.process_pkt	= usbtouch_process_multi,
 		.get_pkt_len	= idealtek_get_pkt_len,
 		.read_data	= idealtek_read_data,
 	},
@@ -1268,7 +1260,6 @@ static struct usbtouch_device_info usbtouch_dev_info[] = {
 		.min_yc		= 0x0,
 		.max_yc		= 0x07ff,
 		.rept_size	= 16,
-		.process_pkt	= usbtouch_process_multi,
 		.get_pkt_len	= etouch_get_pkt_len,
 		.read_data	= etouch_read_data,
 	},
@@ -1378,9 +1369,15 @@ static void usbtouch_process_multi(struct usbtouch_usb *usbtouch,
 	usbtouch->buf_len = 0;
 	return;
 }
+#else
+static void usbtouch_process_multi(struct usbtouch_usb *usbtouch,
+                                   unsigned char *pkt, int len)
+{
+	dev_WARN_ONCE(&usbtouch->interface->dev, 1,
+		      "Protocol has ->get_pkt_len() without #define MULTI_PACKET");
+}
 #endif
 
-
 static void usbtouch_irq(struct urb *urb)
 {
 	struct usbtouch_usb *usbtouch = urb->context;
@@ -1411,7 +1408,7 @@ static void usbtouch_irq(struct urb *urb)
 		goto exit;
 	}
 
-	usbtouch->type->process_pkt(usbtouch, usbtouch->data, urb->actual_length);
+	usbtouch->process_pkt(usbtouch, usbtouch->data, urb->actual_length);
 
 exit:
 	usb_mark_last_busy(interface_to_usbdev(usbtouch->interface));
@@ -1564,8 +1561,6 @@ static int usbtouch_probe(struct usb_interface *intf,
 
 	type = &usbtouch_dev_info[id->driver_info];
 	usbtouch->type = type;
-	if (!type->process_pkt)
-		type->process_pkt = usbtouch_process_pkt;
 
 	usbtouch->data_size = type->rept_size;
 	if (type->get_pkt_len) {
@@ -1589,6 +1584,9 @@ static int usbtouch_probe(struct usb_interface *intf,
 		usbtouch->buffer = kmalloc(type->rept_size, GFP_KERNEL);
 		if (!usbtouch->buffer)
 			goto out_free_buffers;
+		usbtouch->process_pkt = usbtouch_process_multi;
+	} else {
+		usbtouch->process_pkt = usbtouch_process_pkt;
 	}
 
 	usbtouch->irq = usb_alloc_urb(0, GFP_KERNEL);
-- 
2.45.2.993.g49e7a77208-goog


