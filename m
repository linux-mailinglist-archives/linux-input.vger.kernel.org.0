Return-Path: <linux-input+bounces-3767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 559B58CBDBD
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 11:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 872841C21BC0
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A45C80BFC;
	Wed, 22 May 2024 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WQ+Fxc3H"
X-Original-To: linux-input@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE2280C03;
	Wed, 22 May 2024 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716369857; cv=none; b=uGSW3OIY4mDdDK+5usfXQbtfPuOQCAFnRZhS3qCYr0vgQ/upRUV9/AtebnnOBQ3FLwHlBBYg8cG6rUxRZYHcPh2tJ0+yGDpLgh17zTmZMwI7ruCnBsqGN/ImeynnFii4E4QjneggZnBNMt9N7n2IFcgylOnjCasaelwysZ/jomY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716369857; c=relaxed/simple;
	bh=kzzkB8V8z296o4CBEK4CUuCnDBnubxduo8Qf8Pgb+Q8=;
	h=From:To:Cc:Subject:Date:Message-Id; b=BLX0OiXpW2D+OaJ8yzHYTnbsolwIB/WvYezfrAM7j9jcbHn1r2zbrX9r0ZEE4maEB5to+sARsv83m/S5MLozbwtRuOvDft22H5ArdewI5K3tjJdYuB8wo8WyHfAwqeZjj/8MxqoBeBSQMBT/Zjy2hTjpkJgMrdhodMQEoRCDG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WQ+Fxc3H; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=RwMGp8RoTylMfwZCt8
	jxh3g8ipDYLlZV8k6iQyzxZPQ=; b=WQ+Fxc3H1Ad3e8rRfmPDVsHGLx0R6GHpYj
	4RPfzhP2IWZ/a0ki6td49eK8ib8mvtHxoq/ZHDctZBoKRm9MNhCdXdaTFVYdUyiM
	Wgt34mwhIQP5kjO+mFxxjFgzFoZbWWDMTWtmnpYhQTKAE1ZJ4sYJmRSA5Kiq+fad
	aslXbzh7U=
Received: from localhost.localdomain (unknown [111.48.58.10])
	by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wD3f0VzuU1mWW3nAw--.29954S2;
	Wed, 22 May 2024 17:23:00 +0800 (CST)
From: huanglei814 <huanglei814@163.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huanglei <huanglei@kylinos.cn>
Subject: [PATCH] HID: usbhid: enable remote wakeup for mouse
Date: Wed, 22 May 2024 17:22:57 +0800
Message-Id: <20240522092257.19373-1-huanglei814@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wD3f0VzuU1mWW3nAw--.29954S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw1ktw1UAF4fKry7ur4DJwb_yoWktFX_Kw
	4UuaykG3WfX3Z7Ka45KrWrtryakw4j9rWxWF1Iyr1fX3y2vws8Wr4DZr1qgw1a939rZa48
	Crs8Kr4Fvr1vkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8VHq7UUUUU==
X-CM-SenderInfo: xkxd0wxohlmiqu6rljoofrz/1tbiLBjm9mXAmD8koQAAsj
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

From: huanglei <huanglei@kylinos.cn>

This patch enables remote wakeup by default for USB mouse
devices.  Mouse can used to be wakeup devices, but the correct
place to enable it depends on the device's bus; no single
approach will work for all mouse devices.  In particular, this
covers only USB mouse (and then only those supporting the boot
protocol).

Signed-off-by: huanglei <huanglei@kylinos.cn>
---
 drivers/hid/usbhid/hid-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a90ed2ceae84..7ed3ab36426d 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1189,6 +1189,15 @@ static int usbhid_start(struct hid_device *hid)
 		device_set_wakeup_enable(&dev->dev, 1);
 	}
 
+	/* enable remote wakeup by default for all mouse
+	 * devices supporting the boot protocol.
+	 */
+	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT &&
+			interface->desc.bInterfaceProtocol ==
+				USB_INTERFACE_PROTOCOL_MOUSE) {
+		device_set_wakeup_enable(&dev->dev, 1);
+	}
+
 	mutex_unlock(&usbhid->mutex);
 	return 0;
 
-- 
2.17.1


