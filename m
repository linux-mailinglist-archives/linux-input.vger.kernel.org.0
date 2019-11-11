Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14448F825B
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2019 22:38:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfKKViV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Nov 2019 16:38:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51687 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKKViV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Nov 2019 16:38:21 -0500
Received: by mail-wm1-f68.google.com with SMTP id q70so899601wme.1
        for <linux-input@vger.kernel.org>; Mon, 11 Nov 2019 13:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=R5WcLZLJDPYlPEyZV+QBLOP5fndhaKhLIxh1Dan/fnA=;
        b=DaCrhObTcxgPDtZcp7op2F5jr1+zXsffqwijf6Um5mID3WkB4d/VveZjIN/eyeup/T
         egF4MYSY9Tl1Ka8myJOktBsTOlzrpGPl89CYcwbRyEFieRwfj5Mi+pYz6sMKWbZCGckg
         g0Si3faClMcJ91ONOKKx2LISPsRkX1EOl5VKCYbTyB6NqtjNqZt+L6+NOBILg9PfRdWN
         Xn+eVqkQBifCfrwpin9XyWi0e2m8RozScxmJsn27SdiPfcJ3L5ZwZSN1iERCI75uZxra
         qJhIDe1MaZE8uDm+wAIohB80VR25fCLmLGsroA0SA9sSNFqzn0UFe7pJEbnSvdB80nvB
         ZGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=R5WcLZLJDPYlPEyZV+QBLOP5fndhaKhLIxh1Dan/fnA=;
        b=P2mYbGqFpKwvJaRUbFvfL6Fvg1BX7gBQLK4cboEsGM9U/1kAx9KUpsFKcVVg1JxpNG
         AINXdMjqVy/EKt19CJ6oDI9yFQvRdK8e8iKOUQiGxTi67iHXI8AvQXJaB/J3DaX0aTDi
         +lyLtqv5kuEkxVbP5WZAFazAW8Kl6oFYrTN57BLXZPk4LO2VxDUmeYbkix6M2pXktD0U
         FlHrFwh/SXnE5guaMYf0S4sfs7jxYipM2iXswQrssS9Hy3/dg05i/hO/SQZ9l/RMFtBk
         +He5eQrKUu+HteJLMUm14wfsuGIttSkoo2cSL0RxS76dZmRno+PPt1S2FNr548rRwFDW
         ctMQ==
X-Gm-Message-State: APjAAAX1wW/HZDy5TmYWWH/nCQgSxav5/qukV7WDCPJW6TyOQM91QrIy
        eqCqpJUcaK4AsmOWVjY2Q/dR4YOb
X-Google-Smtp-Source: APXvYqy7ywt6dlYztBE9k41flQgWnZC0J7YKgH8exa6Q948gj9Rg6fnj4VPjj1mxOyhkRnW+G4hsjQ==
X-Received: by 2002:a7b:c098:: with SMTP id r24mr924388wmh.63.1573508296702;
        Mon, 11 Nov 2019 13:38:16 -0800 (PST)
Received: from ?IPv6:2003:ea:8f2d:7d00:e9b5:1831:3cbd:a0c3? (p200300EA8F2D7D00E9B518313CBDA0C3.dip0.t-ipconnect.de. [2003:ea:8f2d:7d00:e9b5:1831:3cbd:a0c3])
        by smtp.googlemail.com with ESMTPSA id g11sm799777wmh.27.2019.11.11.13.38.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Nov 2019 13:38:16 -0800 (PST)
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] HID: quirks: remove hid-led devices from
 hid_have_special_driver
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Message-ID: <dee18394-b0cb-8f85-2db3-9e07407184ba@gmail.com>
Date:   Mon, 11 Nov 2019 22:38:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since e04a0442d33b ("HID: core: remove the absolute need of
hid_have_special_driver[]") it's no longer needed to list these LED
devices in hid_have_special_driver[]. This allows libraries needing
access to the hidraw device to work properly.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hid/hid-quirks.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c50bcd967..bdaab79f7 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -419,13 +419,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
 #if IS_ENABLED(CONFIG_HID_LCPOWER)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, USB_DEVICE_ID_LCPOWER_LC1000) },
 #endif
-#if IS_ENABLED(CONFIG_HID_LED)
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_WN) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_CHEEKY_FA) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, USB_DEVICE_ID_RI_KA_WEBMAIL) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
-#endif
 #if IS_ENABLED(CONFIG_HID_LENOVO)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TPKBD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_CUSBKBD) },
-- 
2.24.0

