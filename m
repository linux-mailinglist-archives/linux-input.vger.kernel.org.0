Return-Path: <linux-input+bounces-4988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB192F4E4
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 07:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 310CD1F226D5
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 05:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E96B1CAAC;
	Fri, 12 Jul 2024 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvqiBtsq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2270182C3;
	Fri, 12 Jul 2024 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720761544; cv=none; b=Nmd+ZdN0wFo4JeI3q4XoIIwe1tq6dh96fwaXdnDBt4DicN5TwRwhXHr0+BHQIzouPhKJX8s3Zl5UHRjphi83vKxflPZ1N0ujDlbZGTtNRRdOU3Y1nNBHIFw7/GXu3b1AnU7s/pq21+Jl6aWNeEmc50sciMFBgzPkwxIIXtbDAi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720761544; c=relaxed/simple;
	bh=cUQiFMMF+9hZA4tgQkNBaYdNRO8e49vzvTF7ifqhXOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYR2UplchlRV76CVBcZDL93XI0cDLs4ltHFUuszGY/aBmPw0uthQ1n77R5KyUdXeU0E5QBbNYXcLuyOV6WUmPwuJtvcdm88PghJjWk4VUaOFLgqosrA7fESgVyH1Rw0OYOUlQzLGvWI91pTOK1XfGLFKt9xPsJtHV/e+v/Bu9y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvqiBtsq; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d9306100b5so1049324b6e.1;
        Thu, 11 Jul 2024 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720761541; x=1721366341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8F2Z7o9tWJAaAOtucMBRsGDbemuCjNEYUY94GLUdRo=;
        b=QvqiBtsq9PdHCWsniptG9H1+lBr/HxFSOw4MeKh190i6CWvGZakyu4autLXrcP2S95
         ebleExJZIPcDRtXkM000KG/B/jwIbOxAOBTqYkarTzggyHzFRUgJ0ghcxY8aDkYDUFBU
         wEnGJAxsT2Jq8chN8z1qIb/Ldf1D8cmd1z3BUlcFT1YwRGLA/9GmC7oN4fizwgFjfZYk
         fRzzdl58Er1paGkM8FThhIHeyUoBm/9ENOVr7SXvQ2OKoGga46FxrlNMvlGFejNIa+08
         G57RJ/OOJW3D8r4/IlDM2bTi8tFbq1i5QrZJCdXn6gz4iLnozHtraqtmiYqr8wB+H9b4
         D2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720761541; x=1721366341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8F2Z7o9tWJAaAOtucMBRsGDbemuCjNEYUY94GLUdRo=;
        b=SxML5TIdanLR9fBS+jnE1w76j4c1n7U29jlv4mQ6FdyE1fCGzOhzz+kJ/1aIgKncNs
         tLvXGd5m/HrwPivK23PsmYGgchYYDUdf4Yx2iO07J8mKtlEd+24HhC2/ZVBGMS6MTxd1
         qrwNNloLPgyKZYI5aVAAgmZ3ysgFEGsmFSxfSiRrYjYQ1dsjI3lhCBon8P6AcOZwlsLE
         CnRYS81Hg3VaFS3shXRNTuCW3UhV1qY3UHhRB2ANswALpRE/1UhoFpimhSUp2hDllI5E
         N9u1560xD0uZilTqWdoZkKw91A+eRHGV5ZQ91X8eZex+zdkRPJ2VVga93IRYNu0lEeST
         TJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrblsZc4+gxlp2Nlnv913rQEU7eLMtKzx4Ldo8q8AId0t9KqPx+KIoUC/uJL9iEY425FCVrl8/bu2K0JiQGU7tiV6JuHmtsWgqiNq1
X-Gm-Message-State: AOJu0YygWNmc30RJUhVwvNeCD52GILSQiQF1ZoTid5Kp9ycDwShjqAKW
	OdOwaxyl3fhldTWrbec14ygEaPujx8n3kOuLcf9JmXqoqDLaIu7DFB2JtA==
X-Google-Smtp-Source: AGHT+IGgKnVo2p40tHpEeqbelq09wldtXq+m+0zRr3srCCVkyUR8LC4BchVaT54FL8O2Hb2M4Ig21Q==
X-Received: by 2002:a05:6808:148b:b0:3d9:2920:bc2f with SMTP id 5614622812f47-3d93bdd1669mr12394154b6e.10.1720761541522;
        Thu, 11 Jul 2024 22:19:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:acda:de52:5c83:f72d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d525csm4328972a12.73.2024.07.11.22.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 22:19:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Greg KH <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] Input: usbtouchscreen - move the driver ID table
Date: Thu, 11 Jul 2024 22:18:45 -0700
Message-ID: <20240712051851.3463657-3-dmitry.torokhov@gmail.com>
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

Move the driver's ID table closer to where it is used in preparation
to it using pointers to device info/parameters instead of device type
enum.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 209 ++++++++++-----------
 1 file changed, 104 insertions(+), 105 deletions(-)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 57a5b7d503d5..3a9de3d24e75 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -130,111 +130,6 @@ enum {
 	DEVTYPE_ETOUCH,
 };
 
-static const struct usb_device_id usbtouch_devices[] = {
-#ifdef CONFIG_TOUCHSCREEN_USB_EGALAX
-	/* ignore the HID capable devices, handled by usbhid */
-	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0001, USB_INTERFACE_CLASS_HID),
-		.driver_info = DEVTYPE_IGNORE},
-	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0002, USB_INTERFACE_CLASS_HID),
-		.driver_info = DEVTYPE_IGNORE},
-
-	/* normal device IDs */
-	{USB_DEVICE(0x3823, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x3823, 0x0002), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0123, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0eef, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x0eef, 0x0002), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x1234, 0x0001), .driver_info = DEVTYPE_EGALAX},
-	{USB_DEVICE(0x1234, 0x0002), .driver_info = DEVTYPE_EGALAX},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_PANJIT
-	{USB_DEVICE(0x134c, 0x0001), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0002), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0003), .driver_info = DEVTYPE_PANJIT},
-	{USB_DEVICE(0x134c, 0x0004), .driver_info = DEVTYPE_PANJIT},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_3M
-	{USB_DEVICE(0x0596, 0x0001), .driver_info = DEVTYPE_3M},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ITM
-	{USB_DEVICE(0x0403, 0xf9e9), .driver_info = DEVTYPE_ITM},
-	{USB_DEVICE(0x16e3, 0xf9e9), .driver_info = DEVTYPE_ITM},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ETURBO
-	{USB_DEVICE(0x1234, 0x5678), .driver_info = DEVTYPE_ETURBO},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GUNZE
-	{USB_DEVICE(0x0637, 0x0001), .driver_info = DEVTYPE_GUNZE},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_DMC_TSC10
-	{USB_DEVICE(0x0afa, 0x03e8), .driver_info = DEVTYPE_DMC_TSC10},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
-	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
-	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_IDEALTEK
-	{USB_DEVICE(0x1391, 0x1000), .driver_info = DEVTYPE_IDEALTEK},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH
-	{USB_DEVICE(0x0dfc, 0x0001), .driver_info = DEVTYPE_GENERAL_TOUCH},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_GOTOP
-	{USB_DEVICE(0x08f2, 0x007f), .driver_info = DEVTYPE_GOTOP},
-	{USB_DEVICE(0x08f2, 0x00ce), .driver_info = DEVTYPE_GOTOP},
-	{USB_DEVICE(0x08f2, 0x00f4), .driver_info = DEVTYPE_GOTOP},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_JASTEC
-	{USB_DEVICE(0x0f92, 0x0001), .driver_info = DEVTYPE_JASTEC},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_E2I
-	{USB_DEVICE(0x1ac7, 0x0001), .driver_info = DEVTYPE_E2I},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ZYTRONIC
-	{USB_DEVICE(0x14c8, 0x0003), .driver_info = DEVTYPE_ZYTRONIC},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC45USB
-	/* TC5UH */
-	{USB_DEVICE(0x0664, 0x0309), .driver_info = DEVTYPE_TC45USB},
-	/* TC4UM */
-	{USB_DEVICE(0x0664, 0x0306), .driver_info = DEVTYPE_TC45USB},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_NEXIO
-	/* data interface only */
-	{USB_DEVICE_AND_INTERFACE_INFO(0x10f0, 0x2002, 0x0a, 0x00, 0x00),
-		.driver_info = DEVTYPE_NEXIO},
-	{USB_DEVICE_AND_INTERFACE_INFO(0x1870, 0x0001, 0x0a, 0x00, 0x00),
-		.driver_info = DEVTYPE_NEXIO},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_ELO
-	{USB_DEVICE(0x04e7, 0x0020), .driver_info = DEVTYPE_ELO},
-#endif
-
-#ifdef CONFIG_TOUCHSCREEN_USB_EASYTOUCH
-	{USB_DEVICE(0x7374, 0x0001), .driver_info = DEVTYPE_ETOUCH},
-#endif
-
-	{}
-};
-
 static struct usbtouch_device_info usbtouch_dev_info[];
 
 /*****************************************************************************
@@ -1847,6 +1742,110 @@ static const struct attribute_group *usbtouch_groups[] = {
 	NULL
 };
 
+static const struct usb_device_id usbtouch_devices[] = {
+#ifdef CONFIG_TOUCHSCREEN_USB_EGALAX
+	/* ignore the HID capable devices, handled by usbhid */
+	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0001, USB_INTERFACE_CLASS_HID),
+		.driver_info = DEVTYPE_IGNORE},
+	{USB_DEVICE_INTERFACE_CLASS(0x0eef, 0x0002, USB_INTERFACE_CLASS_HID),
+		.driver_info = DEVTYPE_IGNORE},
+
+	/* normal device IDs */
+	{USB_DEVICE(0x3823, 0x0001), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x3823, 0x0002), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x0123, 0x0001), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x0eef, 0x0001), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x0eef, 0x0002), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x1234, 0x0001), .driver_info = DEVTYPE_EGALAX},
+	{USB_DEVICE(0x1234, 0x0002), .driver_info = DEVTYPE_EGALAX},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_PANJIT
+	{USB_DEVICE(0x134c, 0x0001), .driver_info = DEVTYPE_PANJIT},
+	{USB_DEVICE(0x134c, 0x0002), .driver_info = DEVTYPE_PANJIT},
+	{USB_DEVICE(0x134c, 0x0003), .driver_info = DEVTYPE_PANJIT},
+	{USB_DEVICE(0x134c, 0x0004), .driver_info = DEVTYPE_PANJIT},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_3M
+	{USB_DEVICE(0x0596, 0x0001), .driver_info = DEVTYPE_3M},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_ITM
+	{USB_DEVICE(0x0403, 0xf9e9), .driver_info = DEVTYPE_ITM},
+	{USB_DEVICE(0x16e3, 0xf9e9), .driver_info = DEVTYPE_ITM},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_ETURBO
+	{USB_DEVICE(0x1234, 0x5678), .driver_info = DEVTYPE_ETURBO},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_GUNZE
+	{USB_DEVICE(0x0637, 0x0001), .driver_info = DEVTYPE_GUNZE},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_DMC_TSC10
+	{USB_DEVICE(0x0afa, 0x03e8), .driver_info = DEVTYPE_DMC_TSC10},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
+	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
+	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
+	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
+	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_IDEALTEK
+	{USB_DEVICE(0x1391, 0x1000), .driver_info = DEVTYPE_IDEALTEK},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_GENERAL_TOUCH
+	{USB_DEVICE(0x0dfc, 0x0001), .driver_info = DEVTYPE_GENERAL_TOUCH},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_GOTOP
+	{USB_DEVICE(0x08f2, 0x007f), .driver_info = DEVTYPE_GOTOP},
+	{USB_DEVICE(0x08f2, 0x00ce), .driver_info = DEVTYPE_GOTOP},
+	{USB_DEVICE(0x08f2, 0x00f4), .driver_info = DEVTYPE_GOTOP},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_JASTEC
+	{USB_DEVICE(0x0f92, 0x0001), .driver_info = DEVTYPE_JASTEC},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_E2I
+	{USB_DEVICE(0x1ac7, 0x0001), .driver_info = DEVTYPE_E2I},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_ZYTRONIC
+	{USB_DEVICE(0x14c8, 0x0003), .driver_info = DEVTYPE_ZYTRONIC},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_ETT_TC45USB
+	/* TC5UH */
+	{USB_DEVICE(0x0664, 0x0309), .driver_info = DEVTYPE_TC45USB},
+	/* TC4UM */
+	{USB_DEVICE(0x0664, 0x0306), .driver_info = DEVTYPE_TC45USB},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_NEXIO
+	/* data interface only */
+	{USB_DEVICE_AND_INTERFACE_INFO(0x10f0, 0x2002, 0x0a, 0x00, 0x00),
+		.driver_info = DEVTYPE_NEXIO},
+	{USB_DEVICE_AND_INTERFACE_INFO(0x1870, 0x0001, 0x0a, 0x00, 0x00),
+		.driver_info = DEVTYPE_NEXIO},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_ELO
+	{USB_DEVICE(0x04e7, 0x0020), .driver_info = DEVTYPE_ELO},
+#endif
+
+#ifdef CONFIG_TOUCHSCREEN_USB_EASYTOUCH
+	{USB_DEVICE(0x7374, 0x0001), .driver_info = DEVTYPE_ETOUCH},
+#endif
+
+	{}
+};
 MODULE_DEVICE_TABLE(usb, usbtouch_devices);
 
 static struct usb_driver usbtouch_driver = {
-- 
2.45.2.993.g49e7a77208-goog


