Return-Path: <linux-input+bounces-4954-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C0092DD22
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 01:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60D8A1F21C82
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 23:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF833156F2E;
	Wed, 10 Jul 2024 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObNaLSgG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B314C583;
	Wed, 10 Jul 2024 23:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655347; cv=none; b=b2i8K1APlJ3WFHZnlyvI6f5KvYuegEllEf4t3YBM6GtEXlx0oK9YRVVHEyIeAx++rtWLt729Mj7BvycGSJs6MDCUxoEbW9cWrkAn/vCXVQGOTtUI6np3dOvcmXwen+Vpnx8Ry0wzY4lwU9rIPKnhMAJeC2QLx+MfiRtIBV4/mbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655347; c=relaxed/simple;
	bh=SUEtopNVlc7NONWl/1xhCah1wT0iPKmpksTL83jcjH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IaMvXatfUkRFdHBMqx45ydjYUk+eZMvUXNvByoAxd6WZWcQx20fS36UoqW/6kU2AVKOcHPXFzz4qtEEp+GD/RETTfijIohTwnAxBcD3UHaUajfiEZIlVTDmAPNwbj7XWLefDjDMd1+QzuIfGxRbzVFGevmfHS+i20ebYDgg49eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObNaLSgG; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25e150603a6so173155fac.3;
        Wed, 10 Jul 2024 16:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720655345; x=1721260145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t18qztySaytOOzCiPWaP2tGvEAa51jbhW63V0skAZJg=;
        b=ObNaLSgGcdgcdI5KhOnW0tl2j++KFQnfkctfJQ5UrKgh7NjbTXKKF0OeV4vpkk7gZW
         ZSmgE/Le8zdTS0n+cjdIaKyNVfGFCfesQn1XYC+sBzhIgR7UP2O3BFXPB1ktloYutY41
         K0zC2/Nx3X13/tNex6Ex1cGpg3BO+iXu1QOH5BHSuAowk1RDDkW736dHEu8/5a00uWIj
         VhJcFfH/YktPNdk1hT3H2BPePnWLViRCvBvo9rRrmQD2U5GQm5frMX2gpz9YQLuXGjWZ
         fyqBCaLFDw6xm99e/GjGSEFQiOlHKNMxZcMrZncMCJvK9ZKcf5oSI0iLdz07+jSrGvzc
         X/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720655345; x=1721260145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t18qztySaytOOzCiPWaP2tGvEAa51jbhW63V0skAZJg=;
        b=VtMiWg6fyaN0yOiHfVDnQdgNNqDXZtWibHJ4C5Y8Bng/E97N/e5+7wbyyZev1Hnm1Y
         u7polXHdRMHq063hgmJil/hvMGFt1qVxRWfR05/Wa83UcEuJvqQ+cJdmsd34TYbJViEb
         W0+5cQuTj3fn3ElWC8PobUlZGifhXqFrQvT5VgGX8NQxQkQzN9ptzw+WQMdM1M/zX6Cw
         5uNSznOUA3rnU9qk62w2HbAybIIBze4JhBP7SUt8iEP3ntfWFQ1JzpVzAQrgc4Q118El
         aINyMhSvXq8gjkFrZm0oxbxo/lBREBt/yc7r80+nZsBSfZO6EVBT/VFl/2TBZh6LaELx
         1B2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHogbqAYvbP2YO+BR+8Uq8AfhmQ0sX632DGV8t/udEmf9t2UeGDTEFU0y9AmiCjPGJSCQDeVrKbED2ku61r7gQovpZoZXSSgkkhIHx
X-Gm-Message-State: AOJu0YwutUF8pFWEOL80bRdgOFBc8o2vVgeMgNOCEOMxl/IBMjA0T5M/
	R9Pu3ps6fLyKQWG4XPOwxz34NNGBuU/6mF1IpDmK4YfOF5RKEy3D5asVzw==
X-Google-Smtp-Source: AGHT+IHHVRKNjIh5arwW2JMd9FMLz0JM/PyBn6k4debGLunaZ1bbdVyfcyovyK7HgK1S6rFZupIClw==
X-Received: by 2002:a05:6870:b510:b0:25e:b93:365b with SMTP id 586e51a60fabf-25eaec8ddf7mr5741151fac.55.1720655344940;
        Wed, 10 Jul 2024 16:49:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b4efasm4382803b3a.182.2024.07.10.16.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:49:04 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: usbb2k-api-dev@nongnu.org,
	linux-kernel@vger.kernel.org,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] Input: yealink - use driver core to instantiate device attributes
Date: Wed, 10 Jul 2024 16:48:53 -0700
Message-ID: <20240710234855.311366-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
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
 drivers/input/misc/yealink.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index c3221b960a75..435a46baad9d 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -771,7 +771,7 @@ static DEVICE_ATTR(show_icon	, _M220, NULL		, show_icon	);
 static DEVICE_ATTR(hide_icon	, _M220, NULL		, hide_icon	);
 static DEVICE_ATTR(ringtone	, _M220, NULL		, store_ringtone);
 
-static struct attribute *yld_attributes[] = {
+static struct attribute *yld_attrs[] = {
 	&dev_attr_line1.attr,
 	&dev_attr_line2.attr,
 	&dev_attr_line3.attr,
@@ -782,10 +782,7 @@ static struct attribute *yld_attributes[] = {
 	&dev_attr_ringtone.attr,
 	NULL
 };
-
-static const struct attribute_group yld_attr_group = {
-	.attrs = yld_attributes
-};
+ATTRIBUTE_GROUPS(yld);
 
 /*******************************************************************************
  * Linux interface and usb initialisation
@@ -842,7 +839,6 @@ static void usb_disconnect(struct usb_interface *intf)
 
 	down_write(&sysfs_rwsema);
 	yld = usb_get_intfdata(intf);
-	sysfs_remove_group(&intf->dev.kobj, &yld_attr_group);
 	usb_set_intfdata(intf, NULL);
 	up_write(&sysfs_rwsema);
 
@@ -975,8 +971,6 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	store_line3(&intf->dev, NULL,
 			DRIVER_VERSION, sizeof(DRIVER_VERSION));
 
-	/* Register sysfs hooks (don't care about failure) */
-	ret = sysfs_create_group(&intf->dev.kobj, &yld_attr_group);
 	return 0;
 }
 
@@ -985,6 +979,7 @@ static struct usb_driver yealink_driver = {
 	.probe		= usb_probe,
 	.disconnect	= usb_disconnect,
 	.id_table	= usb_table,
+	.dev_groups	= yld_groups,
 };
 
 module_usb_driver(yealink_driver);
-- 
2.45.2.803.g4e1b14247a-goog


