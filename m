Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A4C0392FF0
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 15:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhE0NnI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 09:43:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236552AbhE0NnH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 09:43:07 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6C9C061574;
        Thu, 27 May 2021 06:41:32 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id g17so4574048wrs.13;
        Thu, 27 May 2021 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/0EAjIXy5/pf3Kvar6GSKhBiyXllv5FEc76NqStVIVE=;
        b=BbgkqQNyMneZFGrPWjeirOP+g4GcdcqgjtH7MfHC5b2XqBN3qXSOpQ/wUpYcNl20EB
         3zbWkCbbP5OFyk2kG6hno2qaVxVRn23wUgVxkvFbQwRKdP7MsPFPHi0as0m4qR93Vt9F
         VzxcD5bOrxgDqIsBEO9VHRtsejsF50fjWvEugEH+3Q7UPiR83kASHFB6OyklJqXDF/Xr
         De8doBaujHWeARpVeqvH5dMMjiQX3IqFuVtSrWhLVWbP340B+z5sifvqOikREklFJw5L
         j3fS3ucR4FlS2cbJ3wFazVW76vvnPjSo97pUAifNpu69MnEy3lUUCft85HUpX8NOSRoQ
         J2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/0EAjIXy5/pf3Kvar6GSKhBiyXllv5FEc76NqStVIVE=;
        b=nU8a3d9ZOR3TczszcyJlUuch2Oq3vfjCRDbqxbA+y08JF49VCNRyoUUmB4PD91dKPt
         3UZqZEl2QmtuxiZX2MeSrXPVtxgZqMWskca4vZMYvXwRM0k3IYJn4SeUkxnk7l02DV1O
         lfP/gErMClJSfPmw9+FGI09N89fYSMNE7RnZiHBvNPm9u/MljNTbtRW1Ixqz5TMoKmRn
         lfFbbWwS+sPB3qWUUHog1J0ymEDp0fMKc6e74gLkskKJVKZ6LBGlGyBLZ2Eqb0CCtRYs
         UNV3OLqmF7POQMKapb11T/XYd78lxi+6dQNp+l3HoMT1xaBZfuxYcHifc37btAhZ/Prf
         HXtg==
X-Gm-Message-State: AOAM531CHYwqwTLalnNI9D4hCD/IknLG4v1GeLBYltXxJB4owe5Iv29O
        nY3rcKky1juC/wr1vm1Jxjw9Ri4xgvKDBNjO
X-Google-Smtp-Source: ABdhPJy02CGCEoyeDa73+Y/TLDtK6K3OWbHjOnWHY3dbO968oT0SZK7vQMoCT7zCb8akSpOqErViOQ==
X-Received: by 2002:adf:f907:: with SMTP id b7mr3441881wrr.357.1622122890388;
        Thu, 27 May 2021 06:41:30 -0700 (PDT)
Received: from caroline.lan (233.119.189.80.dyn.plus.net. [80.189.119.233])
        by smtp.gmail.com with ESMTPSA id b10sm3741284wrr.27.2021.05.27.06.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 06:41:30 -0700 (PDT)
From:   Erica Taylor <rickytaylor26@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Erica Taylor <rickytaylor26@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Matt Reynolds <mattreynolds@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-kernel@vger.kernel.org, Simon Wood <simon@mungewell.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] HID: logitech-hidpp: add G923
Date:   Thu, 27 May 2021 14:41:03 +0100
Message-Id: <20210527134104.217865-2-rickytaylor26@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527134104.217865-1-rickytaylor26@gmail.com>
References: <20210527134104.217865-1-rickytaylor26@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the Xbox variant of the Logitech G923 to the supported
devices.

NOTE: By default the G923 boots in 'Xbox mode' (compatible with the
xpad driver) but Logitech uses 'PC mode' when on Windows. PC mode
seems to support more features and works well with this driver.

This patch does not add code to load the device into PC mode. This code
can be exercised by using USB passthru with a VM, or manually issuing USB
commands.

There is a following patch which adds support for the protocol change to
the xpad driver.

Signed-off-by: Erica Taylor <rickytaylor26@gmail.com>
---
 drivers/hid/hid-ids.h            | 1 +
 drivers/hid/hid-logitech-hidpp.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 84b8da3e7d09..41d7f1495727 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -789,6 +789,7 @@
 #define USB_DEVICE_ID_LOGITECH_G510_USB_AUDIO	0xc22e
 #define USB_DEVICE_ID_LOGITECH_G29_WHEEL	0xc24f
 #define USB_DEVICE_ID_LOGITECH_G920_WHEEL	0xc262
+#define USB_DEVICE_ID_LOGITECH_G923_XBOX_WHEEL	0xc26e
 #define USB_DEVICE_ID_LOGITECH_WINGMAN_F3D	0xc283
 #define USB_DEVICE_ID_LOGITECH_FORCE3D_PRO	0xc286
 #define USB_DEVICE_ID_LOGITECH_FLIGHT_SYSTEM_G940	0xc287
diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d598094dadd0..936dfea2ed27 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4269,6 +4269,9 @@ static const struct hid_device_id hidpp_devices[] = {
 	{ /* Logitech G920 Wheel over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
 		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
+	{ /* Logitech G923 Wheel (Xbox version) over USB */
+	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G923_XBOX_WHEEL),
+		.driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS },
 	{ /* Logitech G Pro Gaming Mouse over USB */
 	  HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC088) },
 
-- 
2.31.1

