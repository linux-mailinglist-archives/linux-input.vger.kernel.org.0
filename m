Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FEF2EA49C
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 06:02:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727722AbhAEE7E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 23:59:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727706AbhAEE7E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 23:59:04 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB9CC061794
        for <linux-input@vger.kernel.org>; Mon,  4 Jan 2021 20:58:23 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id s19so6818060oos.2
        for <linux-input@vger.kernel.org>; Mon, 04 Jan 2021 20:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=4O67zF7JdX/JKmieMUjvbjy1uoLO+Nicx2rwbUpsORA=;
        b=dW5w1Z0+lDR1JjBoqJ3OR1LRyPphNxIRtFz1GIakKBAbOiexsJIj77MJ/Y5zot82y+
         NAkkJdZyuLK1Yd/g4pS7aIbNpSW5hObKFDcMqCzzoULPm9BMbxMsOBjJOqac7yEKxiun
         EvBOoXCxI3HWmzQj7HShiQ0al43doFn+HDLCnq2lYM+jTzfHhwdGY983HJ66V6oXpjXr
         pYCCvTgrBZI4DueMDGmOZskgRjvpn7GfyZbMIYmjvpSSUydSfqoVJg6VuBmlJRZdoKqc
         PY70ZoA19ORRRM7O7XGlh5Bw8gbxSHloKFLZCDJ2rcOeT8ktSHv5Nxv2kGyrWM0I1a4F
         c07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=4O67zF7JdX/JKmieMUjvbjy1uoLO+Nicx2rwbUpsORA=;
        b=rTfnxg9hbliiXpkJ1Mf8DT4SfT2eTlOn6rcQUkTA/JuPh7zvGDcUWzsS9AASqxHq74
         iF9trQx2XTIBg/QyIE0gBEhBkTJ9pcqHneW1hYXTW//QjhrpNSUVOqTqQSxxIr+dyxYE
         O/X7L7BIJmcedi/XRxciWl0bD1HQ6Zg96809+4jkuzzqIAj6J3zAcEA5zVvj+qk0Pin9
         /FoiZOYiPhPmZ/+ItbwxgxrWVFfVDNS+/wLujL0cdrJEXxwiOySPu1qYQl4qQ+mqsR8k
         zvop6KjhmmqQhqRhWpPEC6/slgTzALjufAbtekUlHsjoDyYkixkMymRB4+/O9nylp5Yc
         I83g==
X-Gm-Message-State: AOAM532N5KRE6tP2fNwER/7KDUAjJ/wR6u0JUDX5wFOeXavFdkma9zmX
        dZV0Yfx+FGA7b4hQarKjU5qT3/1hLa+2vysYZbj7WLIC2AlFUg==
X-Google-Smtp-Source: ABdhPJw88uTZfj2kXnbDeu4J29lDqXO88TFGMLcwlaqjW+csRd6+RwPc7pq+Ue74PoYHeTDs8ZTIVc43eaFKGCONzE8=
X-Received: by 2002:a4a:d126:: with SMTP id n6mr50872208oor.47.1609822703025;
 Mon, 04 Jan 2021 20:58:23 -0800 (PST)
MIME-Version: 1.0
From:   Seth Miller <miller.seth@gmail.com>
Date:   Mon, 4 Jan 2021 22:58:12 -0600
Message-ID: <CAMh5ckdy=z8j7X5BXLtpnOz2-Ha7MZqN-DvJS0e1w4CdiLJ4EQ@mail.gmail.com>
Subject: [PATCH] HID: Ignore battery for Elan touchscreen on ASUS UX550
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Battery status is being reported for the Elan touchscreen on ASUS
UX550 laptops despite not having a batter. It always shows either 0 or
1%.

Signed-off-by: Seth Miller <miller.seth@gmail.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 4c5f23640f9c..5ba0aa1d2335 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -389,6 +389,7 @@
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W        0x0401
 #define USB_DEVICE_ID_HP_X2            0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER   0x0755
+#define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN   0x2706

 #define USB_VENDOR_ID_ELECOM           0x056e
 #define USB_DEVICE_ID_ELECOM_BM084     0x0061
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index dc7f6b4a775c..f23027d2795b 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -322,6 +322,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
        { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH,
                USB_DEVICE_ID_LOGITECH_DINOVO_EDGE_KBD),
          HID_BATTERY_QUIRK_IGNORE },
+       { HID_USB_DEVICE(USB_VENDOR_ID_ELAN,
USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
+         HID_BATTERY_QUIRK_IGNORE },
        {}
 };

-- 
2.29.2
