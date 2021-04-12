Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CE6235B80B
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 03:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236358AbhDLBV3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 21:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236329AbhDLBV2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 21:21:28 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38501C061574;
        Sun, 11 Apr 2021 18:21:10 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id t22so5167843ply.1;
        Sun, 11 Apr 2021 18:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YZNlQJhFG4qD/x7YVQs5Q/vIJOU+Y0vRNafnFm9QJmM=;
        b=h9JWQ6Ol/bM/2R9gY9tZa5rc+gsWRaAgOUw2l3PC9nYKCxW/Kqk/TmPo1R1ybRFHP7
         1EILT6YvI5wl9RJQI/8ZduiVwu27qXyX69YNABMCnIezE6Igl3scrCOizyyWCqzP1Y4v
         ioGpyXFpR1ju0r4PrgjoSvDuYkhNyzrbR2N/CLTVPehn2f1yRNBJ8uB5K3xwjMVmYKd8
         iBM1fCSZ+daTyHDEP0lK2mxlCLSktaBHG2egUGSxL7COThsqOxWHlvMm5xczSlmV/Jhw
         6ZzROiS++6gTxAccCPinOd1DHA8NZj+qkKK2BSQb0yuzvvNCFHXSNCohzkrEEMxX/Ooo
         n/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YZNlQJhFG4qD/x7YVQs5Q/vIJOU+Y0vRNafnFm9QJmM=;
        b=sR3H4EuaaXxPMhBXp6UOu3i9zn2Ch3UocBeMFdifzWk6BcAdY09FXDDhp0OVVmCtUC
         aITpimleeNBeNSuX1eyyeuDJpOtpIgmEYFuSYv+lg8HNu/CTjdjXen6w9p9dRC4CGx2S
         qz8lMMhjES58qHW8XZnT482kIeY9n9FNC9yygjJ4fWpbwcX6K/+bPXneccPquyHIbNWb
         1Zyw9rXeBf3Wssp732lJaSP8ZtRZIVbwKC1ePwJ3W4q33yxpAi6zzqbjwAUSeH1i0kFl
         h4hCbKm2iI7NXjX0tVbIIhUJwfjyIkch8VT8PT8ckx65q/bZxLLet3G23he0yPhI1WKE
         z02g==
X-Gm-Message-State: AOAM5317rvvZ3ZpJYU3qzyDxfk+p0pQnbdv1YdrIqoiEIApyS6ip2I2d
        1xoJCd0fHMcTiyHRuAhCaxA=
X-Google-Smtp-Source: ABdhPJxvcsTgZjtXqK32GaAuV2MtCNgkx+s1Bjk3eR8/pGt2rFEPU53LYOGuqOvzBSy3EvwtzUuBLw==
X-Received: by 2002:a17:90a:6304:: with SMTP id e4mr19053959pjj.63.1618190469675;
        Sun, 11 Apr 2021 18:21:09 -0700 (PDT)
Received: from localhost.localdomain ([2401:e180:8830:7d97:945d:de90:edc9:855b])
        by smtp.gmail.com with ESMTPSA id i73sm10093477pgc.9.2021.04.11.18.21.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Apr 2021 18:21:08 -0700 (PDT)
From:   Johnny Chuang <johnny.chuang.emc@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Harry Cutts <hcutts@chromium.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     James Chen <james.chen@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>,
        Douglas Anderson <dianders@chromium.org>,
        Jingle <jingle.wu@emc.com.tw>
Subject: [PATCH v2] HID: i2c-hid: Skip ELAN power-on command after reset
Date:   Mon, 12 Apr 2021 09:21:03 +0800
Message-Id: <1618190463-12993-1-git-send-email-johnny.chuang.emc@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Previous commit 43b7029f475e ("HID: i2c-hid:
Send power-on command after reset"), it fixed issue for SIS touchscreen.

For ELAN touchscreen, we found our boot code of IC was not flexible enough
to receive and handle this command.
Once the FW main code of our controller is crashed for some reason,
the controller could not be enumerated successfully to be recognized
by the system host. therefore, it lost touch functionality.

Add quirk for skip send power-on command after reset.
It will impact to ELAN touchscreen and touchpad on HID over I2C projects.

Signed-off-by: Johnny Chuang <johnny.chuang.emc@gmail.com>
---
Changes in v2:
    - move comment to quirk entry
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 9993133..957d865 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -45,6 +45,7 @@
 #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
 #define I2C_HID_QUIRK_RESET_ON_RESUME		BIT(5)
 #define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(6)
+#define I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET	BIT(7)
 
 
 /* flags */
@@ -178,6 +179,12 @@ static const struct i2c_hid_quirks {
 		 I2C_HID_QUIRK_RESET_ON_RESUME },
 	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
 		I2C_HID_QUIRK_BAD_INPUT_SIZE },
+/*
+ * Sending the wakeup after reset actually break ELAN touchscreen controller
+ * Add I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET to skip wakeup after reset
+ */
+	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
+		 I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET },
 	{ 0, 0 }
 };
 
@@ -461,7 +468,8 @@ static int i2c_hid_hwreset(struct i2c_client *client)
 	}
 
 	/* At least some SIS devices need this after reset */
-	ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
+	if (!(ihid->quirks & I2C_HID_QUIRK_NO_WAKEUP_AFTER_RESET))
+		ret = i2c_hid_set_power(client, I2C_HID_PWR_ON);
 
 out_unlock:
 	mutex_unlock(&ihid->reset_lock);
-- 
2.7.4

