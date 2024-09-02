Return-Path: <linux-input+bounces-6043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 965B2967DEE
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 04:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FB951F227FF
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 02:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575823A1CD;
	Mon,  2 Sep 2024 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OI2fhqN5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1643125DB;
	Mon,  2 Sep 2024 02:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725244942; cv=none; b=CndAInVET6RZOj69W8CX2rKO8ityQhD8WC9BQgFdaooQKjWgVuY1ZdYIB9eyYdrsd9a7MsyCbP5VH/1vw5W2T1a2eo+Ku9PsUvC4j1OAz+UA56HQOrmOiVbFV8/h7Wjm+u0bXWy8fd7XlFvcLSoJBAbyvmuGzhpcZ1cCetOTnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725244942; c=relaxed/simple;
	bh=t6chKW6RMvMt2i9pgxOGJ5l7bmaMm7fN5NVEpyqYIHY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WNWTwntSQbnGeWJkwGzzu2+V8aOudhP0RvAwSD3uUM+tjQPBLACfPKgmM+rctJqQ7Ok0y0+OEVoEX4De5VUDsohmt1/sN0DV7CqFyw60DoQpfLQsznuJLi2T0Ep7wdGIuRo55YIyXnJgca6SHSocAxTgQ1n7RNslK1pRtPb6UE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OI2fhqN5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so1369314a91.1;
        Sun, 01 Sep 2024 19:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725244940; x=1725849740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXd0X4HGrs7xpc3uqMOVPvCYkT/FBY5ETInSg1kYP44=;
        b=OI2fhqN5aH7QktoJvwdHA0TfSVunVllMedaDPcUZYnQQ7lFunOZgws2LE8rT+XmbKD
         Bty1E0JpJSC2+yfhNxDc1c/PGMtD4oSRRIUoySYXH9GMqkC8BuI6ClATgD9cPrqf3FhY
         +VOx/bfD/sJLjY8HE3hKOwj7gLe1683pSApbmb2nv2/1ukUD8SRxXm21Vg6jBRk4F95s
         IK0tH0qVeSqRYdC/g9mLGkcOj8IMWJ5lPn1SzFxHpij2G9uQfeDGk+14QlGtGd/UA3jj
         bopvBN8cifzAUTz5pH9CD5tko6JOkHTOad5dph1J3DH7RGN9VKE5tH5lINjywivTD4a7
         F7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725244940; x=1725849740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXd0X4HGrs7xpc3uqMOVPvCYkT/FBY5ETInSg1kYP44=;
        b=pMZNldTjdrTtYz99XtzMI5Xd4rsz8Y6FOS4aF7jG46bmBzl/TTWC6r5UJMzT0GrvbQ
         miu8rFrA5JSZD975cBIny3q89SxrfsVUzRWwy3bpPXRwoHuEjdfoozV1Cd14rIFomWOi
         Ik01eziUCREH8dG5j2NViEjT7c+mfi5MbEFl2z+Qo2z6IWmvgfWNgCOhMe27Vi4zgzs4
         CW4Bt1psHAnXRtrC/R5HR2UQUiry90Z/Qjtuh9JzcwEZAffZla5Dwo3rrqDMDGvFOSKF
         OWceXKpGr9WUr14lCmJlPysSQqRmAdSJU7BSM7ExK/ZgZ82WZ0xKv0GNJo4Im73Lsie6
         90vg==
X-Forwarded-Encrypted: i=1; AJvYcCWffTdPd9t2UTsOLHjjQAZ9vhn50AjJOyhg8Ep+JtIoPjOsvAApbSXKPJfN/U83g7XMOECTwoakWmitwA==@vger.kernel.org, AJvYcCXB95j6Z4bL/9BMaPaSxCehVy4oMuAb5uYrV3dUHrTFC32rlBY2oTPs+cl/SpaMlZGRbegXD65BuMJ/Xbem@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1g1DsG7PafO8VFNmrX7KBY9EY+t0vZogWVF6v88IkvuLBADv
	zaF/t3SUcG9aVe7PwEjreqd5TfXBNJT8IfHm/3MDuGIUOz2WTfEx
X-Google-Smtp-Source: AGHT+IFbP04WevZii1FQd+1xfh1FpFgPQh+p+H/vJhSqt+lAcxOjo4/qNj5li6ohhC9f5GcFNoRwPw==
X-Received: by 2002:a17:90b:3c8:b0:2d8:999a:bc37 with SMTP id 98e67ed59e1d1-2d8999abeb0mr8334608a91.19.1725244939864;
        Sun, 01 Sep 2024 19:42:19 -0700 (PDT)
Received: from localhost.localdomain ([220.241.42.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8f1b74a26sm59624a91.52.2024.09.01.19.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 19:42:19 -0700 (PDT)
From: "Wei Ping.Xiao" <xiaoweiping.pccw@gmail.com>
To: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: svv@google.com,
	hadess@hadess.net,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH 5.10.y] HID: microsoft: Add rumble support to latest xbox controllers
Date: Mon,  2 Sep 2024 10:42:05 +0800
Message-Id: <20240902024205.9243-2-xiaoweiping.pccw@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240902024205.9243-1-xiaoweiping.pccw@gmail.com>
References: <20240902024205.9243-1-xiaoweiping.pccw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Siarhei Vishniakou <svv@google.com>

Currently, rumble is only supported via bluetooth on a single xbox
controller, called 'model 1708'. On the back of the device, it's named
'wireless controller for xbox one'. However, in 2021, Microsoft released
a firmware update for this controller. As part of this update, the HID
descriptor of the device changed. The product ID was also changed from
0x02fd to 0x0b20. On this controller, rumble was supported via
hid-microsoft, which matched against the old product id (0x02fd). As a
result, the firmware update broke rumble support on this controller.

See:
https://news.xbox.com/en-us/2021/09/08/xbox-controller-firmware-update-rolling-out-to-insiders-starting-today/

The hid-microsoft driver actually supports rumble on the new firmware,
as well. So simply adding new product id is sufficient to bring back
this support.

After discussing further with the xbox team, it was pointed out that
another xbox controller, xbox elite series 2, can be supported in a
similar way.

Add rumble support for all of these devices in this patch. Two of the
devices have received firmware updates that caused their product id's to
change. Both old and new firmware versions of these devices were tested.

The tested controllers are:

1. 'wireless controller for xbox one', model 1708
2. 'xbox wireless controller', model 1914. This is also sometimes
   referred to as 'xbox series S|X'.
3. 'elite series 2', model 1797.

The tested configurations are:
1. model 1708, pid 0x02fd (old firmware)
2. model 1708, pid 0x0b20 (new firmware)
3. model 1914, pid 0x0b13
4. model 1797, pid 0x0b05 (old firmware)
5. model 1797, pid 0x0b22 (new firmware)

I verified rumble support on both bluetooth and usb.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Siarhei Vishniakou <svv@google.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-ids.h       | 10 +++++++++-
 drivers/hid/hid-microsoft.c | 11 ++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 9f3f7588fe46..c4e4a24692f6 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -875,7 +875,15 @@
 #define USB_DEVICE_ID_MS_TYPE_COVER_2    0x07a9
 #define USB_DEVICE_ID_MS_POWER_COVER     0x07da
 #define USB_DEVICE_ID_MS_SURFACE3_COVER		0x07de
-#define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER	0x02fd
+/*
+ * For a description of the Xbox controller models, refer to:
+ * https://en.wikipedia.org/wiki/Xbox_Wireless_Controller#Summary
+ */
+#define USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1708	0x02fd
+#define USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1708_BLE	0x0b20
+#define USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1914	0x0b13
+#define USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1797	0x0b05
+#define USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1797_BLE	0x0b22
 #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
 #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
 #define USB_DEVICE_ID_MS_MOUSE_0783      0x0783
diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
index 071fd093a5f4..9345e2bfd56e 100644
--- a/drivers/hid/hid-microsoft.c
+++ b/drivers/hid/hid-microsoft.c
@@ -446,7 +446,16 @@ static const struct hid_device_id ms_devices[] = {
 		.driver_data = MS_PRESENTER },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, 0x091B),
 		.driver_data = MS_SURFACE_DIAL },
-	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER),
+
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1708),
+		.driver_data = MS_QUIRK_FF },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1708_BLE),
+		.driver_data = MS_QUIRK_FF },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1914),
+		.driver_data = MS_QUIRK_FF },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1797),
+		.driver_data = MS_QUIRK_FF },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_XBOX_CONTROLLER_MODEL_1797_BLE),
 		.driver_data = MS_QUIRK_FF },
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
 		.driver_data = MS_QUIRK_FF },
-- 
2.39.1


