Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB8739AA94
	for <lists+linux-input@lfdr.de>; Thu,  3 Jun 2021 20:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhFCTAi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 15:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCTAh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Jun 2021 15:00:37 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EDCEC06174A;
        Thu,  3 Jun 2021 11:58:39 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ci15so10748959ejc.10;
        Thu, 03 Jun 2021 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbEvBk3gKy5YwKIHjvGti6b3CDDoQZQwQNtHKPX0zOk=;
        b=JH9BHwNpQA/42p6l/8wg/11/gEfqNafmV6AYQ576RBbZTP8iLrwbHcU/TE7+Ci7X/D
         OS2/BiMxrlwa8ZDjSjB0AP95A1bt1ZJEJ7hTJrg/ybFIc2t6uDn4PoCFcBe6AHgqCRYa
         GQxWleZAjwsjZjWH43J6NQPxnxJQUJ5zxayVuoMjy1E6fedJdXvzZ4pCyQemKzLvKUp6
         gloVXgoyZGl0Rd/bBOE9Thd1D8z+C6TkV4BMefDIMv1pPNf20LT5hxWCJQ3LpezPRX1g
         lN7e0Ow0e58x6S92RAP6z7+0HCBZxnECJDpPPM8Ts7lS2LSXBqM74eoLAWcEluAONdV4
         0epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbEvBk3gKy5YwKIHjvGti6b3CDDoQZQwQNtHKPX0zOk=;
        b=UC8/E+mfiuFos5+4F73vWTt2telMMLnDQL193zjByVLbTYu3CrOfXwJZEQYSn5Hxxz
         UAXzjXpuppAOSaP9c24AOb6ey8BOsI1Bx61AVo1IoorvufJbn/Z8UMKoSVFe2+5QjouD
         v5lnGdAm5dms0i1oPeTlVsuX8kFrG+Yl+Uu69BONgLJAmLeVJ/0RZGN9GQAPD6Ax9VU/
         KUWA2ECuVg66jch2S83clDnNeYlUg4oQY5Ku+MOftTw/8vQhycP9+SBULxFGEG83+LZY
         iVdufQfWEUxvb/PzL2SHJRaEebvWpVh5VpPntWsbo7Ln5gP6IzwlhVVAY8eMIkeqJKoO
         8grw==
X-Gm-Message-State: AOAM533yGpbEhshEIptNk1x5Yigt5HaE1oaoq5MwLaHj79TPMQR8tseH
        zvcCgfwcnRXLDQ/cWatbxu2z3V5OkhoZ/zcr
X-Google-Smtp-Source: ABdhPJworaiejXvq0MaWaO29/NnW2WH7FqkYcdx9IlDplm7xlMPvgdtwOO4TBRD/ksbCEhCo84B8qg==
X-Received: by 2002:a17:906:e88:: with SMTP id p8mr715372ejf.105.1622746717650;
        Thu, 03 Jun 2021 11:58:37 -0700 (PDT)
Received: from Surface-Go.lan ([85.191.188.212])
        by smtp.gmail.com with ESMTPSA id e25sm1858186eja.15.2021.06.03.11.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 11:58:37 -0700 (PDT)
From:   Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>
Subject: [PATCH] HID: hid-input: add Surface Go battery quirk
Date:   Thu,  3 Jun 2021 20:58:14 +0200
Message-Id: <20210603185814.12659-1-zoltan.tamas.vajda@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Elantech touchscreen/digitizer in the Surface Go mistakenly reports
having a battery. This results in a low battery message every time you
try to use the pen.

This patch adds a quirk to ignore the non-existent battery and
gets rid of the false low battery messages.

Signed-off-by: Zoltan Tamas Vajda <zoltan.tamas.vajda@gmail.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index b84a0a11e05b..63ca5959dc67 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -396,6 +396,7 @@
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
 #define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
+#define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
 
 #define USB_VENDOR_ID_ELECOM		0x056e
 #define USB_DEVICE_ID_ELECOM_BM084	0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index abbfa91e73e4..3e39aeafca91 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -326,6 +326,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.30.2

