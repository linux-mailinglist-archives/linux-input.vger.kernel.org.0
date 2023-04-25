Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F456EE5E3
	for <lists+linux-input@lfdr.de>; Tue, 25 Apr 2023 18:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbjDYQjE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Apr 2023 12:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234747AbjDYQjD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Apr 2023 12:39:03 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A9B13F99
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 09:39:01 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-55605fd3e19so94920197b3.1
        for <linux-input@vger.kernel.org>; Tue, 25 Apr 2023 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682440741; x=1685032741;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n3qrKZjVYwRidQtR9ttCKsIhnttEfhhVP4HOmwIiYyI=;
        b=jfcMep9DTXPMTttSv137SPpXd/zDeV9GsWfo/nmzB2IvVREp8Z8TODmKDKlLcmrsmD
         oV7OGXpLlNRaTWeeikDQBvIasrTIjGfNMy5wNq3uLuSontVplZufn0Was9op7e6hq7Vk
         2hQk4uGF+FRHYpaDeS4k5QZQ5nA1DrYwSChL+xUcY3c34s5I+BEcSXNMpJBdu+Du5YZ4
         1zCjxJageHqYCtfri6PVgPOXMjh9zQIP8svZqrmPZlkEpENKqMnAysNxEO5IfrYhmLQl
         UCIulC3cGBZQ+MFbNb5UhihygZ0U/gDz+UNsjpsy7bXVEZz+12bLlKBY/DTh5+nvunVm
         UDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682440741; x=1685032741;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3qrKZjVYwRidQtR9ttCKsIhnttEfhhVP4HOmwIiYyI=;
        b=cu7KuVcZKdXVTIBuG4fK4ZDYyyuDAST1VWiRXMS1LP0heu/lJa09Qc0AMBhl59Yciu
         JwH/AeaGW8FUGUzWDxyQCHge3F7Bj7je5BBU+HtCDf3xpnPSdssgHlbFy3HyKn2gJ4sg
         VOP7AqGieR46kMntBJyGaUtwZjUZwH50NDTIp25DF4+P+tXEwEg5IR1YStMoS7gWr7xo
         tV0ZS3Z2St6USY3Pa2M0K45aCGKIbzK0+fb8Sq6E5sanIXGqW/OMvhaQKr74nvF7Y44i
         lOMaJF3zshTmc1zdLNmVNr+34q3NyxcZ1RWUZzWgbblswPtR6UxHXSpsjhoEqUe+rstN
         w1Jw==
X-Gm-Message-State: AAQBX9fPEc4ApgbliXHhHqTgyvoUQTLwV0SisBoFhF1lb4DiJCll2IkL
        fWbYTvzVsBk/fdEb+aGiTEUTvyc=
X-Google-Smtp-Source: AKy350YwLCkUypu+bt7JB8k0Vb6dsbknAbJt5zaEYcDarl/8y+ea5VOdjiBAw3LvkLs3/Kube1bZ+rQ=
X-Received: from svv.mtv.corp.google.com ([2620:15c:211:202:5c66:e49a:de5d:a35])
 (user=svv job=sendgmr) by 2002:a81:ad4e:0:b0:54c:2889:7105 with SMTP id
 l14-20020a81ad4e000000b0054c28897105mr9068295ywk.0.1682440741149; Tue, 25 Apr
 2023 09:39:01 -0700 (PDT)
Date:   Tue, 25 Apr 2023 09:38:44 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230425163844.3711710-1-svv@google.com>
Subject: [PATCH v4] Add rumble support to latest xbox controllers
From:   Siarhei Vishniakou <svv@google.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Siarhei Vishniakou <svv@google.com>,
        Bastien Nocera <hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
        USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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
---
 drivers/hid/hid-ids.h       | 10 +++++++++-
 drivers/hid/hid-microsoft.c | 11 ++++++++++-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 053853a891c5..e252ea48bb74 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -903,7 +903,15 @@
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
2.40.0.634.g4ca3ef3211-goog

