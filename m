Return-Path: <linux-input+bounces-4284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A629019AD
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 06:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF681281C85
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 04:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAC3A93A;
	Mon, 10 Jun 2024 04:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3vCgylG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CEE2594;
	Mon, 10 Jun 2024 04:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717993100; cv=none; b=lkkmKPcyfN05fwwC8EERlmYKE7fWn3tcDPpyvmKhlNUNIYMInLQIF2cZcNMy7F7M5Bc1ik5z2eb68wmMtubPq0EQS3hqsBVWnj8dixJdUee23l1Q4brSfXAscQZXxmGiVN/hnDCvsmqgSeDuANmvPTOt/RTG+MoHM6CmsnZP4Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717993100; c=relaxed/simple;
	bh=8pqUekQ/VXe34Sof/ze9V8VnC4gCLC5dWK8TF3hQHOI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NWPiMOOb+9TDRTxd1emhtABOvISXSM3+mXWH9cZJNwkVPJzinG6IiISMY1KAA+9XHYG1yxh/h7+Qv+dxSIwihpp3iBP7Mmf4pXSQve4IfayKCfbyecTNp4Zohi0A48Kwqk9+x5UwC5yVe3T43x8qofDi7TzOQRuigufK1ebgxuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3vCgylG; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5baeab9fd60so448521eaf.2;
        Sun, 09 Jun 2024 21:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717993098; x=1718597898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzhzsPNDuSX6gKE8vpJn202qpdY8rDL50cyxODxHnlQ=;
        b=T3vCgylGNPv30M8Udh7c7bBHAXQd1CZrNA/aIy4FflKNy841FLYcgIvHL8uofWRoeM
         3TQjcg1VuvEHu/oWQsLuoBxTtRbAwUWBJCxtLfY9hv1+Yt0IIgRQ5EAwiYd2VeIsYdn9
         0x7pvk9mzdfDQI+W3mYxZqB0Mk/aGBvlJbnT2qIfX2a6jPa64I3xKuZCx1MhaxgDCdu8
         gD1fHNqcDqTHAKiKxhtrGeHSoxQTft/VAJAeASSOUTYOZ7ZFDBtDukTyFNLCDK9uyN1J
         rAN6ZBcgwnd3BWmn9pAOyPjZ3WRRoDROb2gqIDtY1FmOxR7VnDx41DfRidog9eMRlohP
         UHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717993098; x=1718597898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzhzsPNDuSX6gKE8vpJn202qpdY8rDL50cyxODxHnlQ=;
        b=QijuexGMU5wemzSNauMWpj7U3SBYHqEJj39VHXAct2pPDoAgKRJ/A0j9teEkFgHYq3
         2IDLZ2ic4SJ7F1KH28Pox24tZ3Qkcw/0CGdykuqF3prYbCiW4ABZdiSz8r5Myty5vCyO
         UzXbCjQV0+TIfpFjlB7/vULdSfzEnl4Am8smOE/AdYtgtdg7zDBrAEPedMw21/XcxNwx
         m2uhDKwhpt5YRdUdULp0kfV9X+yZimTxUtMsAsI0I3lmiFuagVloDddZzc9fP5kKhu/U
         NNQ02plw2kxewd3D42LZKyo0NTtbHBW7wqGenuTVGqdv/4e93OZIE6K56WqmavL+NjdZ
         mgfA==
X-Gm-Message-State: AOJu0Ywlw0CRQdBC22W6xVHJBiGRq3O1hLsg4KNE8iOV1QrZYhoPwRgW
	7ImT247dXerdpdIPR4qxM6v8jkJiQURViFanAGzsifgZnPNYyuPG1Z3HBg==
X-Google-Smtp-Source: AGHT+IGaDq+RETCtSbvoruoInziFThVaFFMAie8RRU1Aw4YNSChUHgQ6wqpoKGJp13JpAgPHy8yhiQ==
X-Received: by 2002:a05:6358:72a:b0:19f:4ca6:86c2 with SMTP id e5c5f4694b2df-19f4ca68843mr386940155d.25.1717993097590;
        Sun, 09 Jun 2024 21:18:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:83cc:2314:b3bd:bf64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f5a05b83sm30658355ad.249.2024.06.09.21.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:18:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: ims-pcu - use driver core to instantiate device attributes
Date: Sun,  9 Jun 2024 21:18:10 -0700
Message-ID: <20240610041813.722445-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
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
 drivers/input/misc/ims-pcu.c | 53 +++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 408a586f8c36..0e61d969662f 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -1466,9 +1466,27 @@ static struct attribute *ims_pcu_ofn_attrs[] = {
 	NULL
 };
 
+static umode_t ims_pcu_ofn_is_attr_visible(struct kobject *kobj,
+					   struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct usb_interface *intf = to_usb_interface(dev);
+	struct ims_pcu *pcu = usb_get_intfdata(intf);
+	umode_t mode = attr->mode;
+
+	/*
+	 * PCU-B devices, both GEN_1 and GEN_2 do not have OFN sensor.
+	 */
+	if (pcu->bootloader_mode || pcu->device_id == IMS_PCU_PCU_B_DEVICE_ID)
+		mode = 0;
+
+	return mode;
+}
+
 static const struct attribute_group ims_pcu_ofn_attr_group = {
-	.name	= "ofn",
-	.attrs	= ims_pcu_ofn_attrs,
+	.name		= "ofn",
+	.is_visible	= ims_pcu_ofn_is_attr_visible,
+	.attrs		= ims_pcu_ofn_attrs,
 };
 
 static void ims_pcu_irq(struct urb *urb)
@@ -1890,16 +1908,6 @@ static int ims_pcu_init_application_mode(struct ims_pcu *pcu)
 	/* Device appears to be operable, complete initialization */
 	pcu->device_no = atomic_inc_return(&device_no);
 
-	/*
-	 * PCU-B devices, both GEN_1 and GEN_2 do not have OFN sensor
-	 */
-	if (pcu->device_id != IMS_PCU_PCU_B_DEVICE_ID) {
-		error = sysfs_create_group(&pcu->dev->kobj,
-					   &ims_pcu_ofn_attr_group);
-		if (error)
-			return error;
-	}
-
 	error = ims_pcu_setup_backlight(pcu);
 	if (error)
 		return error;
@@ -1936,10 +1944,6 @@ static void ims_pcu_destroy_application_mode(struct ims_pcu *pcu)
 			ims_pcu_destroy_gamepad(pcu);
 		ims_pcu_destroy_buttons(pcu);
 		ims_pcu_destroy_backlight(pcu);
-
-		if (pcu->device_id != IMS_PCU_PCU_B_DEVICE_ID)
-			sysfs_remove_group(&pcu->dev->kobj,
-					   &ims_pcu_ofn_attr_group);
 	}
 }
 
@@ -2031,20 +2035,14 @@ static int ims_pcu_probe(struct usb_interface *intf,
 	if (error)
 		goto err_stop_io;
 
-	error = sysfs_create_group(&intf->dev.kobj, &ims_pcu_attr_group);
-	if (error)
-		goto err_stop_io;
-
 	error = pcu->bootloader_mode ?
 			ims_pcu_init_bootloader_mode(pcu) :
 			ims_pcu_init_application_mode(pcu);
 	if (error)
-		goto err_remove_sysfs;
+		goto err_stop_io;
 
 	return 0;
 
-err_remove_sysfs:
-	sysfs_remove_group(&intf->dev.kobj, &ims_pcu_attr_group);
 err_stop_io:
 	ims_pcu_stop_io(pcu);
 err_free_buffers:
@@ -2070,8 +2068,6 @@ static void ims_pcu_disconnect(struct usb_interface *intf)
 	if (alt->desc.bInterfaceClass != USB_CLASS_COMM)
 		return;
 
-	sysfs_remove_group(&intf->dev.kobj, &ims_pcu_attr_group);
-
 	ims_pcu_stop_io(pcu);
 
 	if (pcu->bootloader_mode)
@@ -2130,9 +2126,16 @@ static const struct usb_device_id ims_pcu_id_table[] = {
 	{ }
 };
 
+static const struct attribute_group *ims_pcu_sysfs_groups[] = {
+	&ims_pcu_attr_group,
+	&ims_pcu_ofn_attr_group,
+	NULL
+};
+
 static struct usb_driver ims_pcu_driver = {
 	.name			= "ims_pcu",
 	.id_table		= ims_pcu_id_table,
+	.dev_groups		= ims_pcu_sysfs_groups,
 	.probe			= ims_pcu_probe,
 	.disconnect		= ims_pcu_disconnect,
 #ifdef CONFIG_PM
-- 
2.45.2.505.gda0bf45e8d-goog


