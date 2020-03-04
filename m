Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 406C517959D
	for <lists+linux-input@lfdr.de>; Wed,  4 Mar 2020 17:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387860AbgCDQrP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Mar 2020 11:47:15 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45989 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729792AbgCDQrP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Mar 2020 11:47:15 -0500
Received: by mail-qk1-f194.google.com with SMTP id z12so2245276qkg.12;
        Wed, 04 Mar 2020 08:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czUUsTYyYv4aMuyuTWXd4LsVX5riUlW5X85NHq9ZSmI=;
        b=cA/B56Rzwdv57NkhQssbXzL6cC4IXf6Y3TdSU6eACtMMqmTkpjKNaP3AG0RFfQq7hY
         0dvE9gIncXjPKU9y4sA5LlVd2f4NMSHnowZecE4xZyEIyZnx5UjH1V8e1fFXxFxVMvlo
         QOenHumwAgOZYAktyYrm8DxsEJiW7h1XpUAiHTlOBEeJeZR7bE8OBht0Ob2I+TpcqjT3
         jVkUZQDNWY2jcBNzHmcsrKJQ885ylrJDoS1eF6e+u5yWhaBcnzej5bxn813eV5G3ye2N
         0fAY6dAPC0jnfqlCk2W6eo+tbBXegIwI5bDKidkIWHDms0fWyxxg1M8Bg31hHjLbzsU2
         HRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=czUUsTYyYv4aMuyuTWXd4LsVX5riUlW5X85NHq9ZSmI=;
        b=GHKfW8bMkiJNLK/vBLX5Y1fJQbHl5WweFITOmxBcsh7nO4OsTjnYlcdvlK8fxkfB8F
         JTxtQkljuPoPgLxDZWUDvohhaXAuvAtMGW/YEjATVqCZL4CSHer/3TLpROR8rJvl3q9Y
         bzG+BZCILbiW6Nlvys7zhGEHdqazZ1v2HFKIRZoBxo1oZWNx25VNwofGXhzWjUpyawWH
         KRgTN6u3PNhZrsjeUKupLz9zDGHD6Rpzj7fEhCytSD56reFYuTmIxBhwLzQd5mZBdYXA
         ssaIbl0c0Cefob6n/qBO8r7SutBuOjTNk/Sl3fdVMYDRf/EraP9MYxFF6018taGz/28U
         pQEQ==
X-Gm-Message-State: ANhLgQ2rVrxfWXk4kUAbY37i9U/h8yHoyT7uISglDUizZD2u+7EmM+ai
        Km3/pn1yPiL5GTeIfcwXdVc=
X-Google-Smtp-Source: ADFU+vtKQCMYIACC9m0z0xKgAZngGRhg0Jz+TEUzs2A/FqWhJpQy9OC9+L+Ix6PfTiYdk69lh3sdqQ==
X-Received: by 2002:ae9:dc85:: with SMTP id q127mr3736449qkf.460.1583340434302;
        Wed, 04 Mar 2020 08:47:14 -0800 (PST)
Received: from localhost.localdomain ([65.88.88.177])
        by smtp.gmail.com with ESMTPSA id t55sm14923074qte.24.2020.03.04.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 08:47:13 -0800 (PST)
From:   Tony Fischetti <tony.fischetti@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        tony.fischetti@gmail.com
Subject: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
Date:   Wed,  4 Mar 2020 11:47:00 -0500
Message-Id: <20200304164700.11574-1-tony.fischetti@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A lenovo pixart mouse (17ef:608d) is afflicted common the the malfunction
where it disconnects and reconnects every minute--each time incrementing
the device number. This patch adds the device id of the device and
specifies that it needs the HID_QUIRK_ALWAYS_POLL quirk in order to
work properly.
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce603c4..9e1dfc714ea8 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -726,6 +726,7 @@
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
+#define USB_DEVICE_ID_LENOVO_PIXART_USB_OPTICAL_MOUSE	0x608d
 
 #define USB_VENDOR_ID_LG		0x1fd2
 #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0e7b2d998395..247747d6d8cf 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -103,6 +103,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_PENSKETCH_M912), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_KYE_EASYPEN_M406XE), HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_KYE, USB_DEVICE_ID_PIXART_USB_OPTICAL_MOUSE_ID2), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_PIXART_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C007), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_C077), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_KEYBOARD_G710_PLUS), HID_QUIRK_NOGET },
-- 
2.20.1

