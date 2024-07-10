Return-Path: <linux-input+bounces-4955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275192DD24
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 01:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 284EA286DEB
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 23:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC4715DBB2;
	Wed, 10 Jul 2024 23:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDAn7u0B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153D12B169;
	Wed, 10 Jul 2024 23:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655349; cv=none; b=l+TBn3ZgCXX64afO6nLwX0Ntm7omcfDxVlim3G0plXohA36cSBsgfUSmcSVC11Ycp9DSNWoqLmtudW2Dbd64Of7SY3tGRPKFMQcmOfSRQOKq9SiBZ/x7kLSdYZ+S9gFYqQN9DjKARufPNLhxe4cbAvSlDFe5E/reqE9W7YFYYLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655349; c=relaxed/simple;
	bh=/qhZ/8EldfOQcZyKDuycbq7YZYfFu4W+0Ywhu0pKNtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXTdlqEKcSOGiV8xV90HMS4MumswpYmd3trs5x2H16Gc7OfNiOvaHS9LPQ9mcDIBTy20EBqdugh0WixixJORVdrfCKa3O2tLdR2NHe2DCHoFMBDz++hluz00xU4HS453op+k81VKAr6yeyi7w7R8+dser0UXogeIyDo/BsF87kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDAn7u0B; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7035c367c4cso130354a34.2;
        Wed, 10 Jul 2024 16:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720655346; x=1721260146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9sJ1oPQPjgwywY1YlFfTHBfdtWjkTQty7nEM6VOOkE=;
        b=iDAn7u0BlIi/iAH2pYt/QR/1lULJJnksCwWMy4ov4kiKgv9x3Lh8LxNQQpVwPwUkLr
         cRnQSDtZgr7eRw0wuYBYDBK5EhFiVF6O6N967E5UDEgTcYCiX0KLdO4bBneTiVqlzIzc
         eYIf3DrmVZ8R1TqNPZ2/zoa2G97JiGY6sAtSRoDU8cuGsKqi2E4p/vVeRYO/HauHlstw
         +bpMWTf/XniATGe5YmMXf3dYpapGOzztC6JUzjzW9i1aKa01+jAvbHjp+yg79fFITvmv
         t+iPFr/nTpTd79Ab8Iuh6zeADcjJEVRo4cPuF5vTnz+xzzj+ukHbt+hxbcgQQkNNYDJW
         rJGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720655346; x=1721260146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9sJ1oPQPjgwywY1YlFfTHBfdtWjkTQty7nEM6VOOkE=;
        b=vrD2a82JZXIab5iVfR5BZrQPp+uuyEk2qXPEEa8xQyWjEBfc5ExBXsc/w1Ucgtmnx5
         gk8nr5vvmPdbH8+YE2ICTteBDBkXIpzLx+r0zjeWYsAavXUdgrQaY+u/LD8CTsn1jaDG
         0qfPCzYBCdd7ELzFgujU8O+gQBsygRREX0JqiaI22KnqpX+IEVphlEeboaw2RzM6QfvI
         r6MFHYMJd6SlHveeKBtLI0HZlKX7M06tYDxbxdn+ZK24tbxvC+xfGoLgaEWo+SCnIms6
         Zw5jvJ2Zud5AnbLERDBID1zi5kwurqQsW9s/5XOEqkOsRHlIB/mVCBs6yO8v/XHuZDlL
         yruQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWBN2brlJ8kHUvHyo0PlPNNXqodbC68w6ZBbx9mMfuHbMI4QdtC2h3v+x1GLw3x3ztkPZdeD0Cf5fwOyYvJvhqv5cnZSPfncRzdF7q
X-Gm-Message-State: AOJu0Yx58lR0i4nmVakJhNkL9efMVkcc4eOCBZLLhpwDz+w2USx536VB
	cpFWNrzy31JGHwb1Nh9lm0dP7xbxq148sfiQhrhpG+BML4Iiz7EH8oZdMw==
X-Google-Smtp-Source: AGHT+IH11VZpABvg+vhll8L/b6XBNn75fkidKUjb6kX6hO4Uo+1hHwEHseZyiG5WSoPJdzEMAwVp2A==
X-Received: by 2002:a9d:7358:0:b0:704:b695:9557 with SMTP id 46e09a7af769-704b6959812mr2784547a34.16.1720655346386;
        Wed, 10 Jul 2024 16:49:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b4efasm4382803b3a.182.2024.07.10.16.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 16:49:05 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: usbb2k-api-dev@nongnu.org,
	linux-kernel@vger.kernel.org,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] Input: yealink - simplify locking in sysfs attribute handling
Date: Wed, 10 Jul 2024 16:48:54 -0700
Message-ID: <20240710234855.311366-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
In-Reply-To: <20240710234855.311366-1-dmitry.torokhov@gmail.com>
References: <20240710234855.311366-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The locking rules in the driver came from era when sysfs attributes
could live past the point of time when device would be unbound from
the driver, and so used module-global semaphore (potentially shared
between multiple yealink devices). Thankfully these times are long
gone and attributes will not be accessible once they are removed.

Simplify the logic by moving to per-device mutex, stop checking if
there is driver data instance attached to the interface, and use
guard notation to acquire the mutex.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/yealink.c | 72 ++++++++++--------------------------
 1 file changed, 20 insertions(+), 52 deletions(-)

diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 435a46baad9d..8866bf65d347 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -36,7 +36,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-#include <linux/rwsem.h>
+#include <linux/mutex.h>
 #include <linux/usb/input.h>
 #include <linux/map_to_7segment.h>
 
@@ -103,6 +103,8 @@ struct yealink_dev {
 	u8 lcdMap[ARRAY_SIZE(lcdMap)];	/* state of LCD, LED ... */
 	int key_code;			/* last reported key	 */
 
+	struct mutex sysfs_mutex;
+
 	unsigned int shutdown:1;
 
 	int	stat_ix;
@@ -548,8 +550,6 @@ static void input_close(struct input_dev *dev)
  * sysfs interface
  ******************************************************************************/
 
-static DECLARE_RWSEM(sysfs_rwsema);
-
 /* Interface to the 7-segments translation table aka. char set.
  */
 static ssize_t show_map(struct device *dev, struct device_attribute *attr,
@@ -580,15 +580,10 @@ static ssize_t store_map(struct device *dev, struct device_attribute *attr,
  */
 static ssize_t show_line(struct device *dev, char *buf, int a, int b)
 {
-	struct yealink_dev *yld;
+	struct yealink_dev *yld = dev_get_drvdata(dev);
 	int i;
 
-	down_read(&sysfs_rwsema);
-	yld = dev_get_drvdata(dev);
-	if (yld == NULL) {
-		up_read(&sysfs_rwsema);
-		return -ENODEV;
-	}
+	guard(mutex)(&yld->sysfs_mutex);
 
 	for (i = a; i < b; i++)
 		*buf++ = lcdMap[i].type;
@@ -598,7 +593,6 @@ static ssize_t show_line(struct device *dev, char *buf, int a, int b)
 	*buf++ = '\n';
 	*buf = 0;
 
-	up_read(&sysfs_rwsema);
 	return 3 + ((b - a) << 1);
 }
 
@@ -630,22 +624,16 @@ static ssize_t show_line3(struct device *dev, struct device_attribute *attr,
 static ssize_t store_line(struct device *dev, const char *buf, size_t count,
 		int el, size_t len)
 {
-	struct yealink_dev *yld;
+	struct yealink_dev *yld = dev_get_drvdata(dev);
 	int i;
 
-	down_write(&sysfs_rwsema);
-	yld = dev_get_drvdata(dev);
-	if (yld == NULL) {
-		up_write(&sysfs_rwsema);
-		return -ENODEV;
-	}
+	guard(mutex)(&yld->sysfs_mutex);
 
 	if (len > count)
 		len = count;
 	for (i = 0; i < len; i++)
 		setChar(yld, el++, buf[i]);
 
-	up_write(&sysfs_rwsema);
 	return count;
 }
 
@@ -675,15 +663,10 @@ static ssize_t store_line3(struct device *dev, struct device_attribute *attr,
 static ssize_t get_icons(struct device *dev, struct device_attribute *attr,
 			char *buf)
 {
-	struct yealink_dev *yld;
+	struct yealink_dev *yld = dev_get_drvdata(dev);
 	int i, ret = 1;
 
-	down_read(&sysfs_rwsema);
-	yld = dev_get_drvdata(dev);
-	if (yld == NULL) {
-		up_read(&sysfs_rwsema);
-		return -ENODEV;
-	}
+	guard(mutex)(&yld->sysfs_mutex);
 
 	for (i = 0; i < ARRAY_SIZE(lcdMap); i++) {
 		if (lcdMap[i].type != '.')
@@ -692,7 +675,7 @@ static ssize_t get_icons(struct device *dev, struct device_attribute *attr,
 				yld->lcdMap[i] == ' ' ? "  " : "on",
 				lcdMap[i].u.p.name);
 	}
-	up_read(&sysfs_rwsema);
+
 	return ret;
 }
 
@@ -700,15 +683,10 @@ static ssize_t get_icons(struct device *dev, struct device_attribute *attr,
 static ssize_t set_icon(struct device *dev, const char *buf, size_t count,
 			int chr)
 {
-	struct yealink_dev *yld;
+	struct yealink_dev *yld = dev_get_drvdata(dev);
 	int i;
 
-	down_write(&sysfs_rwsema);
-	yld = dev_get_drvdata(dev);
-	if (yld == NULL) {
-		up_write(&sysfs_rwsema);
-		return -ENODEV;
-	}
+	guard(mutex)(&yld->sysfs_mutex);
 
 	for (i = 0; i < ARRAY_SIZE(lcdMap); i++) {
 		if (lcdMap[i].type != '.')
@@ -719,7 +697,6 @@ static ssize_t set_icon(struct device *dev, const char *buf, size_t count,
 		}
 	}
 
-	up_write(&sysfs_rwsema);
 	return count;
 }
 
@@ -739,22 +716,16 @@ static ssize_t hide_icon(struct device *dev, struct device_attribute *attr,
  */
 
 /* Stores raw ringtone data in the phone */
-static ssize_t store_ringtone(struct device *dev,
-		struct device_attribute *attr,
-		const char *buf, size_t count)
+static ssize_t store_ringtone(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
 {
-	struct yealink_dev *yld;
+	struct yealink_dev *yld = dev_get_drvdata(dev);
 
-	down_write(&sysfs_rwsema);
-	yld = dev_get_drvdata(dev);
-	if (yld == NULL) {
-		up_write(&sysfs_rwsema);
-		return -ENODEV;
-	}
+	guard(mutex)(&yld->sysfs_mutex);
 
 	/* TODO locking with async usb control interface??? */
 	yealink_set_ringtone(yld, (char *)buf, count);
-	up_write(&sysfs_rwsema);
+
 	return count;
 }
 
@@ -835,14 +806,10 @@ static int usb_cleanup(struct yealink_dev *yld, int err)
 
 static void usb_disconnect(struct usb_interface *intf)
 {
-	struct yealink_dev *yld;
-
-	down_write(&sysfs_rwsema);
-	yld = usb_get_intfdata(intf);
-	usb_set_intfdata(intf, NULL);
-	up_write(&sysfs_rwsema);
+	struct yealink_dev *yld = usb_get_intfdata(intf);
 
 	usb_cleanup(yld, 0);
+	usb_set_intfdata(intf, NULL);
 }
 
 static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
@@ -870,6 +837,7 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 
 	yld->udev = udev;
 	yld->intf = intf;
+	mutex_init(&yld->sysfs_mutex);
 
 	yld->idev = input_dev = input_allocate_device();
 	if (!input_dev)
-- 
2.45.2.803.g4e1b14247a-goog


