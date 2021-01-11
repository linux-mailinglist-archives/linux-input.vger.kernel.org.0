Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5CBB2F0CBE
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 07:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbhAKGKJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 01:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbhAKGKI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 01:10:08 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C62C061786
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 22:09:28 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id be12so8954481plb.4
        for <linux-input@vger.kernel.org>; Sun, 10 Jan 2021 22:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=SENDDBcyqDONedjRDgqRGD4btez8dwdugfY0rjrKk6A=;
        b=jhmZrHem3ud+QoSrexJ52viLjLBuEBDClHOGEXHbabKdXvSzecF5e+b7OygjSD2mAi
         whtyppQebx0HXWCk7WGGIBBrICEwbw+WouSJdEaY0XYI5suQ16tg7DRplPloifEyYE4g
         aXdfba1XyqavgElL1R0vrs61smqCzm6jpr280S7hAaUFWMf2P2xQzJDw2t0/3pyP4wJZ
         8dZxsxbY7eqdi4Bxk8QHnFCx860hd4jqKnQRcjXjh4QnQWCIGX1TUim8cnzN+xT8ksYu
         W8FUr41VVfuvdGmY9W5imAx2UcwGPmAvQB7F7ID1wBgTIdtqd19Xn09z4WkQOONFfjNZ
         8/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=SENDDBcyqDONedjRDgqRGD4btez8dwdugfY0rjrKk6A=;
        b=nrjsEh4jB//BoXVCwq+RWbumOLWAeJ7lLXqBNKpfxPTM0eup3Hk6CMM7QFGFQKmIlE
         W9HY/ZHD5PSXugXNImnupVga9ufZW7Xb1DnPbjMaeBLl30FemRSqxpAIkTU3b7SJAt3V
         zE5mEiQ34TU58dvDnGWT3p48R5z2JtJE1TWOMxkhrbwZtrPChqxwA5WBlcsO203qcDXc
         hoe8YqLkvG0XH6wxrwbNdNQisIoVOSHzk7bD1PLzVjYi+g2U7JMru11Lc71Iho1ZUPzY
         56tvrstJvVvp0lkaecmOeOl4bTfurhQf1TucSSdCiRIefJpVnlPa3tcuGx+++hLKNHS7
         DZ0w==
X-Gm-Message-State: AOAM531UGSwI284hqWxR1UreI6A4H5uroq9Pt13IZRkow6ZpytC2D73c
        bh1ExhjUIeGyJ8lg8mcO9msg6IVtYmho6w==
X-Google-Smtp-Source: ABdhPJyQdF1MhU1DltazpK/B1gsK2FZmLNOH/zmvbHABcmYTLfEKVXaDazO6bnhq9vMG4iOTGgo69A==
X-Received: by 2002:a17:90a:fe8e:: with SMTP id co14mr16568876pjb.105.1610345367511;
        Sun, 10 Jan 2021 22:09:27 -0800 (PST)
Received: from ?IPv6:2601:601:1401:3540:7705:2d1f:7496:570? ([2601:601:1401:3540:7705:2d1f:7496:570])
        by smtp.googlemail.com with ESMTPSA id j15sm18050591pfn.180.2021.01.10.22.09.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jan 2021 22:09:26 -0800 (PST)
From:   Nicholas Miell <nmiell@gmail.com>
Subject: [PATCH] HID: logitech-hidpp: Add product ID for MX Ergo in Bluetooth
 mode
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, hdegoede@redhat.com,
        linux-input@vger.kernel.org
Message-ID: <6b58bc1e-7ab8-0d5b-be9e-a8c29df2c252@gmail.com>
Date:   Sun, 10 Jan 2021 22:09:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Logitech MX Ergo trackball supports HID++ 4.5 over Bluetooth. Add its
product ID to the table so we can get battery monitoring support.
(The hid-logitech-hidpp driver already recognizes it when connected via
a Unifying Receiver.)

Signed-off-by: Nicholas Miell <nmiell@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index f85781464807d..7eb9a6ddb46a6 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -4053,6 +4053,8 @@ static const struct hid_device_id hidpp_devices[] = {
        { /* MX Master mouse over Bluetooth */
          HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
          .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+       { /* MX Ergo trackball over Bluetooth */
+         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
        { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
          .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
        { /* MX Master 3 mouse over Bluetooth */
-- 
2.29.2
