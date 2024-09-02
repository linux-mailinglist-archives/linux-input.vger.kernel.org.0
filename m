Return-Path: <linux-input+bounces-6042-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D57967DEC
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 04:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DF46B249FE
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 02:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B592A8D0;
	Mon,  2 Sep 2024 02:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZxBHRTG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E22D125DB;
	Mon,  2 Sep 2024 02:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725244937; cv=none; b=CwWjNaUT+aG4MAJ5pveZKNRktQUxbluroVkg3pFIiDIPo83B14r+7iQIevfgdtp6GiQSemMMLKNOJazjZNf+qQbdTRaApiNQBSbDtDfmBd5nlDRSouNr8sChpAyjNcTiKtJn7Kxvt6UQk/JpWTetdil8GP1QVi1f7quK71ghMJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725244937; c=relaxed/simple;
	bh=t6chKW6RMvMt2i9pgxOGJ5l7bmaMm7fN5NVEpyqYIHY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oL4rtNSlEJELft9LDFo4TFXNls6DK6lht57wPBy8obYzbGM1SA+aEiAzMrOqBQctHNCyihFcV1XM2JECZYG8UeO13+Cx8C1jbZMrzDOV/TfU12t79Xifn+DRvWLIhZV+hrsswSVVDYcSopPJQjcbkbNcMS0pa4imluhmkxpnlS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZxBHRTG; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d885019558so1396112a91.2;
        Sun, 01 Sep 2024 19:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725244935; x=1725849735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yXd0X4HGrs7xpc3uqMOVPvCYkT/FBY5ETInSg1kYP44=;
        b=BZxBHRTG7Bc7xbj/o/AaOnrUDsJCUxZUYR6mO8aAfZ1Rnt7adeBRQIGTaJzAOWXBR5
         MhkxbjOjxWyILahq7LtV5KMFA+xm4p3icmXBmbCcKF5Kwk8CM5Ao4ahcGfwsOw4h1Nf9
         O9wK5lWiV93mN7Qvoz1QAZbn/t7PNCMQSXRsQ9mnhbvsRetbp6+h8iHiAwPxWkrCgyj7
         e/uMjpt4yAgdJbjzkX9Hjeos24W4CESliT0lN1Q7LY5kLzpYCJBMR4C9l9rcxp6SSMwL
         jxqmD0Hzm4Nphn649B3LkKF+DkmVDWDditpPxeIJz2/Zt9HUzQebZX+tnu43pF7SwPiS
         vj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725244935; x=1725849735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXd0X4HGrs7xpc3uqMOVPvCYkT/FBY5ETInSg1kYP44=;
        b=het0UWxCfwr+x9Nw2dHsDzkQTyuyooUUZ4UW2pilrIPu+img3BopwkIXZA6zrYiVcX
         B7Dr4UGMCTpZ2EY86ycJtmJsfNCWuU1QKx6+MHZkBBr9LZd3cZ1fECx5rViePvkFjQY+
         gCVKfakWv2grAJEEdvkH+DlxgUewbXHTuRm4Hb8bqL8QSI03MKlJgUIWBRx9CAbXN3tQ
         13RPjp/Ep8k1t5YFCEpgo7eOWixibin8UuyJxs9PozOFBlice+lfO868u8R4tfB6X+lP
         S6l35899P7G0mZ64XLREYEAIARJMF/4pT/RtR2zks8wZLaU7nj/uDBvzGGIyOWNx/FwO
         jOfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn4Zi4v3YmZ0HP1wIQOXcrvClkPu4nXY4hrCp4UNx+s1vyKXjnHKvQ2509qYfNJltjdCOUguSl3z//Og==@vger.kernel.org, AJvYcCVnk8dt9O/xP3YtY2QAdH5uprsg0kb1UpOedUXqxDY9mQ8ppr8IuAM3mO7FKsubmHzFMTW0FYhobDD6ZODr@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZCiz+J3QKhS6w60VcJesUfLpq6tr5XwLnJidE0PuR+VlLS8X
	ZKfNsB33SqFV61ubWFADiIcVHzcHr6aFk59jj0Xsqs9WdCfaWCxF
X-Google-Smtp-Source: AGHT+IGMEiR+Wf704jZkmMCHwoJerLosuLHdtxaDsJ+nahsJmCTwIWMyzIhXlDWcaofmH8ip319cnQ==
X-Received: by 2002:a17:90a:a884:b0:2c9:359c:b0c with SMTP id 98e67ed59e1d1-2d894453d99mr4168342a91.28.1725244934527;
        Sun, 01 Sep 2024 19:42:14 -0700 (PDT)
Received: from localhost.localdomain ([220.241.42.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8f1b74a26sm59624a91.52.2024.09.01.19.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 19:42:14 -0700 (PDT)
From: "Wei Ping.Xiao" <xiaoweiping.pccw@gmail.com>
To: jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: svv@google.com,
	hadess@hadess.net,
	Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH 5.10.y] HID: microsoft: Add rumble support to latest xbox controllers
Date: Mon,  2 Sep 2024 10:42:04 +0800
Message-Id: <20240902024205.9243-1-xiaoweiping.pccw@gmail.com>
X-Mailer: git-send-email 2.33.0
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


