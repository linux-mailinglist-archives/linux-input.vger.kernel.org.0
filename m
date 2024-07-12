Return-Path: <linux-input+bounces-4986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F91E92F4E0
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98BB1F22890
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4970B1803E;
	Fri, 12 Jul 2024 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcS1mnMc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED35179A7;
	Fri, 12 Jul 2024 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761542; cv=none; b=ocv/13m5E5EY8mJFmeS8Joy5i89Jiavb0uaHWL+N3NZBvcM0qcij+IxDoczvnzsDs1nbHqCzudaLSmMepeZ3PcKnYTki+sqeUCqc1V3OCP5UNMxbIVhYHjLUR4GhncjtsWhvivMGXFEMVBDdm0uGN7NswIf+98l5EB01NmH1aLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761542; c=relaxed/simple;
	bh=l6nvyllH4QEDzSHsVde4XTA4lsBdgRU1D1GLy5qtsH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cq41OzK5NeZXuUBKi4A9yXnbW2l/ATX/8ES/94lKnb4NbnexT7hTFa6TMkQXifPBLAXbQOpuFJ+Z4o0CDAxO/DH0Digr3CDOBZQLXG8BC87zZSloalSj3pYAT/3VirnPd6I2jf6/vyKJ1uZ1uRw83KnxRBk06OEBb+cdk9cm65c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcS1mnMc; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d9272287easo812297b6e.2;
        Thu, 11 Jul 2024 22:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761540; x=1721366340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M1CGwcQZMXLIzxE6Px/5LUIZz/+qZ5J0Np8VPgeqfF4=;
        b=kcS1mnMcj6l+G0U/Vgz7apTvOUbDiMAh4imwT1flJTu9x3B/q2okJKWkVEkE/4bACT
         PeqHFKyZKbUYEEdlSecYao1GFtrqRGQY2oPKzoxQJHyKmLTpoT1CiUi0p86ao4/ZPBoU
         AkFBU3IJnikygLq7/fJW0f6QMuw+CGpLZXlELyU9F4IUkzw0xAPUul+O372BxosGHYJZ
         q7ekROPiEsVVg7MfujSSqkbTpU5RDxq6zQTPtt7AnrJ+B+VZfHkL835Y1BsDREWtX9jr
         ZQKtW7W4KcDuQuWM4qpo8gQ3bqYN/DVBlQGpLJ6Ydg4+SFp2R4EeJ/JinCcqmhYBqonG
         +4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761540; x=1721366340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M1CGwcQZMXLIzxE6Px/5LUIZz/+qZ5J0Np8VPgeqfF4=;
        b=GENLTk6V9q8F0FGWu/m0TApcD1h5LJUVkSqE9ixsJ2onohd4ZGmGRTD6QbMwjyWEm5
         pkDIRjIwCowTlJeyT1c9ZUYTSAY7XoMJQdrBMLr+sjb5qrl4W/H58B7Ck8Ws0z2xoo5J
         fSDKDBUpU7+3Vzxm6fQ0se48C9Z5/zSt9Y8ArkpXkaWHpOGCm7eX98kWr7lnR3bTZWMH
         sU5n+1ad7RGTQlyt848G9GPAMPY9e2wdT79V/mZpoPmy23Nw1/p1b4hptnePFFIljI6E
         VW/i5HqgvdLwdyR8UuQrFDJPpSzlwaQvh9WJO44pRYIPZZctIGxOXHdRD9RTTLZYeGOm
         XDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXRlCM9fVex5eXz8oSYk5lHodJe/kbuF/nBXyQ5JAL11BpLQniJbjreuKwZZ8AAdCvkRr8ngO8fYN5RRO1lTJM5N3TCFFw4r7NdwXb
X-Gm-Message-State: AOJu0Ywh4PDC63Z5PTILXBdtXyNe86Zy/VCnKnXJ4S8+mh2rlbqxuuqi
	WyUdq+0D6AeKRhPjgaK53uu1PAUpwQIoe+iFxI4BnFTh7wYjkkPlYtppAQ==
X-Google-Smtp-Source: AGHT+IGGK71r3iEz9krfXkoSAEVHEPqDp4gsemuUJgntwfe0HJR1E88DoN9bqbClm5Sznlmb3YFqig==
X-Received: by 2002:a05:6808:1928:b0:3d5:6775:1288 with SMTP id 5614622812f47-3d93befbab7mr11449547b6e.14.1720761539541;
        Thu, 11 Jul 2024 22:18:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:18:59 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] Input: usbtouchscreen - use driver core to instantiate device attributes
Date: Thu, 11 Jul 2024 22:18:43 -0700
Message-ID: <20240712051851.3463657-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of manually creating driver-specific device attributes
set struct usb_driver->dev_groups pointer to have the driver core
do it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 31 +++++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index dd6b12c6dc58..8b3a6e7fd990 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -240,6 +240,7 @@ static const struct usb_device_id usbtouch_devices[] = {
 	{}
 };
 
+static struct usbtouch_device_info usbtouch_dev_info[];
 
 /*****************************************************************************
  * e2i Part
@@ -466,7 +467,19 @@ static struct attribute *mtouch_attrs[] = {
 	NULL
 };
 
+static bool mtouch_group_visible(struct kobject *kobj)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct usbtouch_usb *usbtouch = usb_get_intfdata(intf);
+
+	return usbtouch->type == &usbtouch_dev_info[DEVTYPE_3M];
+}
+
+DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(mtouch);
+
 static const struct attribute_group mtouch_attr_group = {
+	.is_visible = SYSFS_GROUP_VISIBLE(mtouch),
 	.attrs = mtouch_attrs,
 };
 
@@ -506,21 +519,12 @@ static int mtouch_get_fw_revision(struct usbtouch_usb *usbtouch)
 static int mtouch_alloc(struct usbtouch_usb *usbtouch)
 {
 	struct mtouch_priv *priv;
-	int ret;
 
 	priv = kmalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	usbtouch->priv = priv;
-	ret = sysfs_create_group(&usbtouch->interface->dev.kobj,
-				 &mtouch_attr_group);
-	if (ret) {
-		kfree(usbtouch->priv);
-		usbtouch->priv = NULL;
-		return ret;
-	}
-
 	return 0;
 }
 
@@ -571,7 +575,6 @@ static void mtouch_exit(struct usbtouch_usb *usbtouch)
 {
 	struct mtouch_priv *priv = usbtouch->priv;
 
-	sysfs_remove_group(&usbtouch->interface->dev.kobj, &mtouch_attr_group);
 	kfree(priv);
 }
 #endif
@@ -1842,6 +1845,13 @@ static void usbtouch_disconnect(struct usb_interface *intf)
 	kfree(usbtouch);
 }
 
+static const struct attribute_group *usbtouch_groups[] = {
+#ifdef CONFIG_TOUCHSCREEN_USB_3M
+	&mtouch_attr_group,
+#endif
+	NULL
+};
+
 MODULE_DEVICE_TABLE(usb, usbtouch_devices);
 
 static struct usb_driver usbtouch_driver = {
@@ -1852,6 +1862,7 @@ static struct usb_driver usbtouch_driver = {
 	.resume		= usbtouch_resume,
 	.reset_resume	= usbtouch_reset_resume,
 	.id_table	= usbtouch_devices,
+	.dev_groups	= usbtouch_groups,
 	.supports_autosuspend = 1,
 };
 
-- 
2.45.2.993.g49e7a77208-goog


