Return-Path: <linux-input+bounces-4956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A99A92DD38
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 01:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEEA6286F58
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 23:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0E414D290;
	Wed, 10 Jul 2024 23:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuI3ys/a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE7963A5;
	Wed, 10 Jul 2024 23:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655982; cv=none; b=g5E5sv2b56EYrlVlnI9BBHTr5S4QCQbTK8W/y3W6TkvSkbWucPnj1oO6vFHprJfJipI71w82U/uacKTT0q6qJptrJyGXCF4YbA/KFZpsdrW2MqY57oN1BkiKiJoHNs8/WaubmcCjdyS75VBzE9Cl26rW0+yAu+D6TGd2L+inKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655982; c=relaxed/simple;
	bh=mRDssuDg5Zz6Ni3sINw42i482DKodzTUEqcX8NWNXl4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhQAoAzOKd1OMZDZ5l82StvrkIdaU/8zauxzsCu3XaOm/tLXAutH8Juprs6OinR3LWmjoHqiM3fDTfbT3OhIBiOreatcOnQR8iUQ0Hi7uKWcFFWlh7HsQ2HcX0KQlvfKTp0W4yl8MNAszOjO2zoC+uBZRAkermA1HoDESJqadcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuI3ys/a; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fa55dbf2e7so1765505ad.2;
        Wed, 10 Jul 2024 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720655980; x=1721260780; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTRjYS1yLdbH+ExwJFF+sOWBEY9lEw3jAhS9psVzGGE=;
        b=BuI3ys/azMIay30h2BVh6lTFzWHCcD/NpQR2Ss0Bm32Khc2Fepg1xD5UuXQrUUBVoW
         rypslI33IDDSobrjev+HuEva3FhrevZoX6zk3SvYXchHwGbUFAyTdHxwCDZJDU5+MwBN
         Wdq3/xWSAF7L/vO4F+VsJ/pvZ0+v9/OLWW58fggU1IKH8axMEnx0QEqZ2OvB2e/Izkpz
         ZKeteHHRmQPZjhjGhs5Q2Oc0HpRlg4UH+sQ9ECdvOjKUoMBjsVJQ7cx7g/pxxLOEImL8
         prgU+1m7JympRkls1PZVG8vNpWDyGiiWQXqC1LcyYZ+SQkfzdWDtnJ2CcQq+t44tMABR
         C2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720655980; x=1721260780;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTRjYS1yLdbH+ExwJFF+sOWBEY9lEw3jAhS9psVzGGE=;
        b=vDBBuWgDvb9XsINu/sejUT2cxYhR1pVkhfNlssWuTCxb9yhrXhITUPvnQxINf/GnEw
         ucjDtAigMRzh7C1FrlztndtalDEYdVUuXgnf4WxMo9vbGP9zEuwemeI+5wqCdbJNbFWW
         jNCHycQiKJ+0Wr0304wPFUgRsf0ASReCHg8nu8Rsm14RyJR2u/kjRNxyxEzvHyKJDBiO
         vTt5S24gFRn3MxTgun7E5JKD70GrBbuTLHaftssz+W7mDAovKjGKVvbxlf/VwezYRIad
         F3oKJoobhUPF39ogrkMezgFBSBqbDYvHdzSPnPI5dWdScnqHkVG+5Y2EzSF49aa+B8Rd
         zRDg==
X-Gm-Message-State: AOJu0YyL/Rlw0l4eSC0BiOwQykLDNf2bYIh9YPxJrz/FexpEb5t40Hcz
	H+tmIlKuRW9+SN3qj9ddStFg5ySCbkRmwUJ6o+ndAmT3O7irF9oM6hiizg==
X-Google-Smtp-Source: AGHT+IFVieOrz3XBmLXt8PQ6I74EASxKygSN9QKxN8ssvW9EytptIdlt5cGFPb2OZCyA+U3d6E5aHg==
X-Received: by 2002:a17:902:650c:b0:1fb:5585:2c24 with SMTP id d9443c01a7336-1fbb6d35a64mr43985775ad.37.1720655979589;
        Wed, 10 Jul 2024 16:59:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ab76b5sm38982045ad.146.2024.07.10.16.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:59:39 -0700 (PDT)
Date: Wed, 10 Jul 2024 16:59:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ville Syrjala <syrjala@sci.fi>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] Input: ati-remote2 - use driver core to instantiate device
 attributes
Message-ID: <Zo8gaF_lKPAfcye1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Instead of manually creating driver-specific device attributes
set struct usb_driver->dev_groups pointer to have the driver core
do it.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/ati_remote2.c | 50 +++++++++++---------------------
 1 file changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/input/misc/ati_remote2.c b/drivers/input/misc/ati_remote2.c
index 946bf75aa106..795f69edb4b2 100644
--- a/drivers/input/misc/ati_remote2.c
+++ b/drivers/input/misc/ati_remote2.c
@@ -204,26 +204,7 @@ struct ati_remote2 {
 	unsigned int mode_mask;
 };
 
-static int ati_remote2_probe(struct usb_interface *interface, const struct usb_device_id *id);
-static void ati_remote2_disconnect(struct usb_interface *interface);
-static int ati_remote2_suspend(struct usb_interface *interface, pm_message_t message);
-static int ati_remote2_resume(struct usb_interface *interface);
-static int ati_remote2_reset_resume(struct usb_interface *interface);
-static int ati_remote2_pre_reset(struct usb_interface *interface);
-static int ati_remote2_post_reset(struct usb_interface *interface);
-
-static struct usb_driver ati_remote2_driver = {
-	.name       = "ati_remote2",
-	.probe      = ati_remote2_probe,
-	.disconnect = ati_remote2_disconnect,
-	.id_table   = ati_remote2_id_table,
-	.suspend    = ati_remote2_suspend,
-	.resume     = ati_remote2_resume,
-	.reset_resume = ati_remote2_reset_resume,
-	.pre_reset  = ati_remote2_pre_reset,
-	.post_reset = ati_remote2_post_reset,
-	.supports_autosuspend = 1,
-};
+static struct usb_driver ati_remote2_driver;
 
 static int ati_remote2_submit_urbs(struct ati_remote2 *ar2)
 {
@@ -791,10 +772,7 @@ static struct attribute *ati_remote2_attrs[] = {
 	&dev_attr_mode_mask.attr,
 	NULL,
 };
-
-static struct attribute_group ati_remote2_attr_group = {
-	.attrs = ati_remote2_attrs,
-};
+ATTRIBUTE_GROUPS(ati_remote2);
 
 static int ati_remote2_probe(struct usb_interface *interface, const struct usb_device_id *id)
 {
@@ -861,13 +839,9 @@ static int ati_remote2_probe(struct usb_interface *interface, const struct usb_d
 
 	strlcat(ar2->name, "ATI Remote Wonder II", sizeof(ar2->name));
 
-	r = sysfs_create_group(&udev->dev.kobj, &ati_remote2_attr_group);
-	if (r)
-		goto fail3;
-
 	r = ati_remote2_input_init(ar2);
 	if (r)
-		goto fail4;
+		goto fail3;
 
 	usb_set_intfdata(interface, ar2);
 
@@ -875,8 +849,6 @@ static int ati_remote2_probe(struct usb_interface *interface, const struct usb_d
 
 	return 0;
 
- fail4:
-	sysfs_remove_group(&udev->dev.kobj, &ati_remote2_attr_group);
  fail3:
 	ati_remote2_urb_cleanup(ar2);
  fail2:
@@ -900,8 +872,6 @@ static void ati_remote2_disconnect(struct usb_interface *interface)
 
 	input_unregister_device(ar2->idev);
 
-	sysfs_remove_group(&ar2->udev->dev.kobj, &ati_remote2_attr_group);
-
 	ati_remote2_urb_cleanup(ar2);
 
 	usb_driver_release_interface(&ati_remote2_driver, ar2->intf[1]);
@@ -1032,4 +1002,18 @@ static int ati_remote2_post_reset(struct usb_interface *interface)
 	return r;
 }
 
+static struct usb_driver ati_remote2_driver = {
+	.name       = "ati_remote2",
+	.probe      = ati_remote2_probe,
+	.disconnect = ati_remote2_disconnect,
+	.dev_groups = ati_remote2_groups,
+	.id_table   = ati_remote2_id_table,
+	.suspend    = ati_remote2_suspend,
+	.resume     = ati_remote2_resume,
+	.reset_resume = ati_remote2_reset_resume,
+	.pre_reset  = ati_remote2_pre_reset,
+	.post_reset = ati_remote2_post_reset,
+	.supports_autosuspend = 1,
+};
+
 module_usb_driver(ati_remote2_driver);
-- 
2.45.2.803.g4e1b14247a-goog


-- 
Dmitry

