Return-Path: <linux-input+bounces-4993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4847192F4F0
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC18B1F22BB3
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FA4481D3;
	Fri, 12 Jul 2024 05:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAb7cqrP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADE23A1BA;
	Fri, 12 Jul 2024 05:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761549; cv=none; b=Wk0eXcY3Cz83CbmkdwLikIgs8TH1SFUjpJfG45txVoN0xlEzW2OAjAAdRnOxCprlZZ+NhsOXbSCkeENihoEhjniGpdpB4A1jCi6FmgTat0nDBn73QPtwe5y8XLZVAUsDNOwMKTSuXT/SSFitinYJ9E9+1yqvlancNyjgvlf/76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761549; c=relaxed/simple;
	bh=w+G4BfHVpVBkDFF8FQEOE0VdqRV7pWvbUoSZVKhCrvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJYfh9EC13lA6bfJF7yjnenGa7/UoAkmwoW9YppAYpKkQlZSPPYvrzR40U8EZL7f8uQigG31LEHNHHU6Zd8wB4ef95fXbz2spz2nSiWmpmMGpMBlNQA3qNMk298qeBODJ7grvpQ6j9ZcKWjR+eygn3dVmt1PXR3lhpnkI3lBQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAb7cqrP; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70364e06dc6so835719a34.0;
        Thu, 11 Jul 2024 22:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761546; x=1721366346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDd+LKdP5f/9OVPsEfS4sFqdHu1O+4Ux+66M12pvVJY=;
        b=IAb7cqrPV0nJxeBW/1dHSge7rFt3WR6eO7TY7dW9wReFOWFkyJj2DZAcEmlk6VlWmA
         e3AyudNWgcrqTpnUM/5tQuKOx7i8X4PLuJI/a5aSSDvLf9lSU4JS8sh1Eqrry5nINmhA
         +sptrbPflbiElYIDkxAdwYbGIHnhDk5cLJgQ+FkW8YJswxWaudkPLxAPdomNzbgrUkhn
         MGFOf1U57P5poSNdiGtq8IosFPKr5PsE/rTaDW5KHolvvKw9pYFUXFcM3yBe8fAshcvy
         gy7Qv9YTZ7XfYLpld1DXu9m+Z79Af6prUDypFYRMVR9kBjhmdVD8PP2y42PW1JnDKifh
         +vXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761546; x=1721366346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDd+LKdP5f/9OVPsEfS4sFqdHu1O+4Ux+66M12pvVJY=;
        b=YCuML2xV0VE6Htxqhnaal5qF/f/24fLghbRnWEdQXTykt2ROkD5Am4mIETUIiawi//
         9lg3r+84BMANJHuI04hMh91dDsQLMXg1wyQ1bXPZ+OfuRc7EmMcKXOEOVRQKscjoiVun
         E2zFZC1eZF0KjQN1NGLHRfTZgMPeZnxnMVh/NDwBQLjFkBkH1h5LSkFR2CRd8pIYQYNV
         enh0oBQNftUnFbBH4sF0ilEhguaYmN/5r4vQDf31UtpnAJ3ZV4VfiF/XqB6I2xrbB6t9
         o/f4QNqjwpVQFm9JTGCzXkLSxz3JKhZGUBVoR+pSo1BfJ4FfBxPiUE1ixsFACFPCKabJ
         lf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXeulfYeRV6TcHXUyjEMvMfkAH1NNqkZ+Zzhk0HCwoQCYkOBptMRDaQKKKUg8YyXHJpZN8OUOUXLAAQUKmSFzuj+jxKWJVP+VRir0O0
X-Gm-Message-State: AOJu0YwXkQo3OMammZ8w2lwAXzBuboPmzIGnf4ra1mb6S1hebxzQUGkc
	bAHfEYPBXFJH9qDg5768rKJJyAEw3FrVbULNdieGXH53B8zNR1t0AaTIag==
X-Google-Smtp-Source: AGHT+IFe8Yb6JpnccCqH85XtVDIF2L4be5Mkmo/JOYuuP/jhJrh2XpIdavSfKWzcBavyQ2LTiDOnMw==
X-Received: by 2002:a05:6359:4c85:b0:1ac:289d:a209 with SMTP id e5c5f4694b2df-1ac289da275mr866143955d.23.1720761546201;
        Thu, 11 Jul 2024 22:19:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] Input: usbtouchscreen - switch to using __free() cleanup facility
Date: Thu, 11 Jul 2024 22:18:50 -0700
Message-ID: <20240712051851.3463657-8-dmitry.torokhov@gmail.com>
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

Use __free(kfree) cleanup facility when allocating temporary buffers
for USB transfers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 90 ++++++++--------------
 1 file changed, 33 insertions(+), 57 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 0015f0a6de01..7567efabe014 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -167,9 +167,8 @@ static const struct usbtouch_device_info e2i_dev_info = {
 
 static int egalax_init(struct usbtouch_usb *usbtouch)
 {
-	int ret, i;
-	unsigned char *buf;
 	struct usb_device *udev = interface_to_usbdev(usbtouch->interface);
+	int ret, i;
 
 	/*
 	 * An eGalax diagnostic packet kicks the device into using the right
@@ -177,7 +176,7 @@ static int egalax_init(struct usbtouch_usb *usbtouch)
 	 * read later and ignored.
 	 */
 
-	buf = kmalloc(3, GFP_KERNEL);
+	u8 *buf __free(kfree) = kmalloc(3, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -191,17 +190,11 @@ static int egalax_init(struct usbtouch_usb *usbtouch)
 				      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				      0, 0, buf, 3,
 				      USB_CTRL_SET_TIMEOUT);
-		if (ret >= 0) {
-			ret = 0;
-			break;
-		}
 		if (ret != -EPIPE)
 			break;
 	}
 
-	kfree(buf);
-
-	return ret;
+	return ret < 0 ? ret : 0;
 }
 
 static int egalax_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
@@ -358,10 +351,9 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
 {
 	struct usb_device *udev = interface_to_usbdev(usbtouch->interface);
 	struct mtouch_priv *priv = usbtouch->priv;
-	u8 *buf;
 	int ret;
 
-	buf = kzalloc(MTOUCHUSB_REQ_CTRLLR_ID_LEN, GFP_NOIO);
+	u8 *buf __free(kfree) = kzalloc(MTOUCHUSB_REQ_CTRLLR_ID_LEN, GFP_NOIO);
 	if (!buf)
 		return -ENOMEM;
 
@@ -373,18 +365,13 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
 	if (ret != MTOUCHUSB_REQ_CTRLLR_ID_LEN) {
 		dev_warn(&usbtouch->interface->dev,
 			 "Failed to read FW rev: %d\n", ret);
-		ret = ret < 0 ? ret : -EIO;
-		goto free;
+		return ret < 0 ? ret : -EIO;
 	}
 
 	priv->fw_rev_major = buf[3];
 	priv->fw_rev_minor = buf[4];
 
-	ret = 0;
-
-free:
-	kfree(buf);
-	return ret;
+	return 0;
 }
 
 static int mtouch_alloc(struct usbtouch_usb *usbtouch)
@@ -636,24 +623,23 @@ static const struct usbtouch_device_info gunze_dev_info = {
 static int dmc_tsc10_init(struct usbtouch_usb *usbtouch)
 {
 	struct usb_device *dev = interface_to_usbdev(usbtouch->interface);
-	int ret = -ENOMEM;
-	unsigned char *buf;
+	int ret;
 
-	buf = kmalloc(2, GFP_NOIO);
+	u8 *buf __free(kfree) = kmalloc(2, GFP_NOIO);
 	if (!buf)
-		goto err_nobuf;
+		return -ENOMEM;
+
 	/* reset */
 	buf[0] = buf[1] = 0xFF;
 	ret = usb_control_msg(dev, usb_rcvctrlpipe (dev, 0),
-	                      TSC10_CMD_RESET,
-	                      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-	                      0, 0, buf, 2, USB_CTRL_SET_TIMEOUT);
+			      TSC10_CMD_RESET,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      0, 0, buf, 2, USB_CTRL_SET_TIMEOUT);
 	if (ret < 0)
-		goto err_out;
-	if (buf[0] != 0x06) {
-		ret = -ENODEV;
-		goto err_out;
-	}
+		return ret;
+
+	if (buf[0] != 0x06)
+		return -ENODEV;
 
 	/* TSC-25 data sheet specifies a delay after the RESET command */
 	msleep(150);
@@ -661,28 +647,22 @@ static int dmc_tsc10_init(struct usbtouch_usb *usbtouch)
 	/* set coordinate output rate */
 	buf[0] = buf[1] = 0xFF;
 	ret = usb_control_msg(dev, usb_rcvctrlpipe (dev, 0),
-	                      TSC10_CMD_RATE,
-	                      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-	                      TSC10_RATE_150, 0, buf, 2, USB_CTRL_SET_TIMEOUT);
+			      TSC10_CMD_RATE,
+			      USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			      TSC10_RATE_150, 0, buf, 2, USB_CTRL_SET_TIMEOUT);
 	if (ret < 0)
-		goto err_out;
-	if ((buf[0] != 0x06) && (buf[0] != 0x15 || buf[1] != 0x01)) {
-		ret = -ENODEV;
-		goto err_out;
-	}
+		return ret;
+
+	if (buf[0] != 0x06 && (buf[0] != 0x15 || buf[1] != 0x01))
+		return -ENODEV;
 
 	/* start sending data */
-	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
-	                      TSC10_CMD_DATA1,
-	                      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-	                      0, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
-err_out:
-	kfree(buf);
-err_nobuf:
-	return ret;
+	return usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
+			       TSC10_CMD_DATA1,
+			       USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+			       0, 0, NULL, 0, USB_CTRL_SET_TIMEOUT);
 }
 
-
 static int dmc_tsc10_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
 {
 	dev->x = ((pkt[2] & 0x03) << 8) | pkt[1];
@@ -992,7 +972,6 @@ static int nexio_init(struct usbtouch_usb *usbtouch)
 	struct nexio_priv *priv = usbtouch->priv;
 	int ret = -ENOMEM;
 	int actual_len, i;
-	unsigned char *buf;
 	char *firmware_ver = NULL, *device_name = NULL;
 	int input_ep = 0, output_ep = 0;
 
@@ -1008,9 +987,9 @@ static int nexio_init(struct usbtouch_usb *usbtouch)
 	if (!input_ep || !output_ep)
 		return -ENXIO;
 
-	buf = kmalloc(NEXIO_BUFSIZE, GFP_NOIO);
+	u8 *buf __free(kfree) = kmalloc(NEXIO_BUFSIZE, GFP_NOIO);
 	if (!buf)
-		goto out_buf;
+		return -ENOMEM;
 
 	/* two empty reads */
 	for (i = 0; i < 2; i++) {
@@ -1018,7 +997,7 @@ static int nexio_init(struct usbtouch_usb *usbtouch)
 				   buf, NEXIO_BUFSIZE, &actual_len,
 				   NEXIO_TIMEOUT);
 		if (ret < 0)
-			goto out_buf;
+			return ret;
 	}
 
 	/* send init command */
@@ -1027,7 +1006,7 @@ static int nexio_init(struct usbtouch_usb *usbtouch)
 			   buf, sizeof(nexio_init_pkt), &actual_len,
 			   NEXIO_TIMEOUT);
 	if (ret < 0)
-		goto out_buf;
+		return ret;
 
 	/* read replies */
 	for (i = 0; i < 3; i++) {
@@ -1058,11 +1037,8 @@ static int nexio_init(struct usbtouch_usb *usbtouch)
 	usb_fill_bulk_urb(priv->ack, dev, usb_sndbulkpipe(dev, output_ep),
 			  priv->ack_buf, sizeof(nexio_ack_pkt),
 			  nexio_ack_complete, usbtouch);
-	ret = 0;
 
-out_buf:
-	kfree(buf);
-	return ret;
+	return 0;
 }
 
 static void nexio_exit(struct usbtouch_usb *usbtouch)
-- 
2.45.2.993.g49e7a77208-goog


