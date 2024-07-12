Return-Path: <linux-input+bounces-4987-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCC592F4E2
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B968B1C21A2A
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0411718AF9;
	Fri, 12 Jul 2024 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atfht8Ln"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AC317BCE;
	Fri, 12 Jul 2024 05:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761542; cv=none; b=jFUAp1MBozMNEwFOKVATx26De9VL1M897hBrfj7GE3uNTVHMs7FOiiT1uLKX4G3QPvjvXlFzvYbewToeTjmLSn0XcqMWPpgKbnSv88l1Nz31o+PVOLdOFaqZwd9OWUWKUx9UJ0y9MzePF2DXho7l2TES7DWltYet1XrKfOWQlXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761542; c=relaxed/simple;
	bh=CN/ITA2G6cUvJqw4Cnp6OChd0HkQBlwBpF31CGCHrqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hP+KnrxX6LNYywjPTy5DOB5FOcyueHDw4I/gonYkolFJ8aHHBq6hKEYPc9I+OmtgGxgdNKXqj6GvOlv+5ZBVEmdmCbb8+Veolho9J/t8s0RcNnXDGysrNWDhq3FZv2GVK82LcXBiRt6YZ1Xmj1vvHIejcBaVj8N86M1ELzf2WvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atfht8Ln; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b31272a04so1786505b3a.1;
        Thu, 11 Jul 2024 22:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761541; x=1721366341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aH9D5gn2H045SFSH2+RZMGbl4EE1+sMrVrGFVphOnxc=;
        b=atfht8LnkcsSfYLRnSpbWFFivsEthC/yWYTNXs1yqIqybLzUwLB4DEnJBOgIVba12X
         leuQoBqh+bNgDwno6utwKC1iXTLwB/zzcgRbkmRVAgcu3aAWOIZoQnRczq5QidrOgHOq
         o6KbZpV07UNZ6a4Vb066p+XIva28UviQJCnfdTBpN7oUeqKpiFJyjr+wbeKSzk6W+n8I
         tbg478+BRCGXYvay2g4sOGxt8KYZSBKUcl+ZUq+qz0DmWHaj2ioA0NJSxTF61HyiZ8gv
         GuWEOCIBJU3ILNwxCdbWwA4fxZZ5lJxBPjnTEXwpTzLuSIm9s6HlV0ZyIw2NZhPc5id2
         rTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761541; x=1721366341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aH9D5gn2H045SFSH2+RZMGbl4EE1+sMrVrGFVphOnxc=;
        b=ay+FoJwTw88ZyrSsOy7I1u7fRlua98s+QyLZ6P6c8D324v7IfB07jfcERvpsGuWjXQ
         ZxBg7TIWhzpYa7Wu9tfpmGKab7n31KMSJW3clj8EcoUzx4BG26pehqHd9P5bWbEWx+Uu
         /CJxAzEFHScBXI/T0En7//tj0O/OxLjKfGYWnV7ZBCZNruHYcbUWO+syT6aq2bbG9p4s
         f4LBvSGIr6XS8dCRBF93wJ+RmreBHyLdmLUSSuAZE4DzpLSgBBRQwhHEo3vg8MU69VWb
         KpGUkaMClbPHhfGugbvYhyncDOZl0+Kk3UoaFNfXpvNldyeNh/WSmb48N0WpPlzfsTJc
         rmgg==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZIOrXt5UpiFNh0zHXGMd8AbmGO5fZiXOJfs4rE/MaVZ5nBpOdav4v96kVi9AAjDGaJZTK581DEL8+YinrAgQgUeJevYeW0O9Mxer
X-Gm-Message-State: AOJu0Yz1LI+ENcgN1WcladTAPV+m/4ERo+DqwFYtEx9ctN4hDb4OyUB8
	aCnbEeJp6WBGzCZNShgBsFNnxpudS1NCulbugeh8Fi7DFA54SfvpFMdEhw==
X-Google-Smtp-Source: AGHT+IH+1Fjy+5YmoEXdFBXLdEYNXdt5IyzDYa7+xI0zjYHno2WkVwviU2hONJAxLdN8jl6AV4hQwQ==
X-Received: by 2002:a05:6a20:9143:b0:1b5:cc1f:38d4 with SMTP id adf61e73a8af0-1c3bead10ebmr2669281637.17.1720761540483;
        Thu, 11 Jul 2024 22:19:00 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:18:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] Input: usbtouchscreen - remove custom USB_DEVICE_HID_CLASS macro
Date: Thu, 11 Jul 2024 22:18:44 -0700
Message-ID: <20240712051851.3463657-2-dmitry.torokhov@gmail.com>
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

There already exists perfectly suitable USB_DEVICE_INTERFACE_CLASS
macro, use it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 8b3a6e7fd990..57a5b7d503d5 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -130,18 +130,13 @@ enum {
 	DEVTYPE_ETOUCH,
 };
 
-#define USB_DEVICE_HID_CLASS(vend, prod) \
-	.match_flags = USB_DEVICE_ID_MATCH_INT_CLASS \
-		| USB_DEVICE_ID_MATCH_DEVICE, \
-	.idVendor = (vend), \
-	.idProduct = (prod), \
-	.bInterfaceClass = USB_INTERFACE_CLASS_HID
-
 static const struct usb_device_id usbtouch_devices[] = {
 #ifdef CONFIG_TOUCHSCREEN_USB_EGALAX
 	/* ignore the HID capable devices, handled by usbhid */
-	{USB_DEVICE_HID_CLASS(0x0eef, 0x0001), .driver_info = DEVTYPE_IGNORE},
-	{USB_DEVICE_HID_CLASS(0x0eef, 0x0002), .driver_info = DEVTYPE_IGNORE},
+	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0001, USB_INTERFACE_CLASS_HID),
+		.driver_info = DEVTYPE_IGNORE},
+	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0002, USB_INTERFACE_CLASS_HID),
+		.driver_info = DEVTYPE_IGNORE},
 
 	/* normal device IDs */
 	{USB_DEVICE(0x3823, 0x0001), .driver_info = DEVTYPE_EGALAX},
-- 
2.45.2.993.g49e7a77208-goog


