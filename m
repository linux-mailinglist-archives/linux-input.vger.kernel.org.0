Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D8C300EE0
	for <lists+linux-input@lfdr.de>; Fri, 22 Jan 2021 22:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbhAVV0W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jan 2021 16:26:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729270AbhAVVZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jan 2021 16:25:58 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C15C0613D6;
        Fri, 22 Jan 2021 13:25:17 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g1so8173280edu.4;
        Fri, 22 Jan 2021 13:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TdBClChG74PdzxlB6jNRbLR1P/Chu7Exwe8kc5GSg3c=;
        b=DSjYSf6swflJPfJ0qDwV9T3GZRyOMC7UAIxnEyigiaJVPFjgLXOvt/eVRSayftV6NW
         ga1Ml4rflc41djbqoqu3aSeQZUJIRWEp8OjL5cL4czXhqWM3fl57JqhjNf6ZTkFPUZ3R
         6jvDnxju+gmtPlFaob89BgM5bO40j+0GBOKFzWXzESX8xbekNHjU6UtcpcI1usitc2gc
         PQG99FAmy/7WR1UwpkSLgyemNiEtvMknMCHU6diN21rokOpRmPxIldLcf8hatjRLRbfg
         +SKp1DJD8A2Z/i/K7yZFWdSGrFxvVkzCKCqo0fEOIIHolGkqucB9snkT5xgp/+yZbUYN
         hfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TdBClChG74PdzxlB6jNRbLR1P/Chu7Exwe8kc5GSg3c=;
        b=U8q4GpHodi5UqBAd6JkNDujKQPel2c4ztgB3ELs1Cbt+/dfsamlbPLjKbPq7VVlWWd
         Q4ClDsPJ0v9HykGALmddiRmCBwG9OVF2z8rY4FWVJlg6Vt/k/AUEXzF+Ft46oHT8B4CY
         BTfYY69LBnvko+0vXpA+31Q6W2QreIj6KmgPbM78qGh+jDnJTTSC/ky72EsZ6YxS9ECW
         qE81gCz+rJZez4hN09R/r+6jQ/x7GwTpuxUq42ryqHbHBGzAFN+AH7gE406j6xp6qeaf
         F5Y9lDunpsPqlDYYyuGFRvVdw8F+FXA7Tfb7oNORll2wBcwaiZEuJ7zX/LfkO/E4TGRC
         aIIg==
X-Gm-Message-State: AOAM53082Rb5O+humbqbvcg0FC+Dp1o6pKS0IGO3rHOKOtespxjfLjHN
        q7LNPaAwsJ1sTNZVsLcCLl8=
X-Google-Smtp-Source: ABdhPJxUQ/u2TsSOrwXyEKR5Rmydb9CD9fAXXQBnAknBQ8aNZCOzhmGYsVdAGzPy89saO7SegDFwqg==
X-Received: by 2002:a50:8004:: with SMTP id 4mr4638043eda.155.1611350716567;
        Fri, 22 Jan 2021 13:25:16 -0800 (PST)
Received: from localhost.localdomain (a-tm1-24.tin.it. [212.216.206.55])
        by smtp.gmail.com with ESMTPSA id c14sm6538889edr.46.2021.01.22.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 13:25:15 -0800 (PST)
From:   Elia Devito <eliadevito@gmail.com>
Cc:     Elia Devito <eliadevito@gmail.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: Ignore battery for Elan touchscreen on HP Spectre X360 15-df0xxx
Date:   Fri, 22 Jan 2021 22:24:37 +0100
Message-Id: <20210122212438.4122-1-eliadevito@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Battery status is reported for the HP Spectre X360 Convertible 15-df0xxx
even if it does not have a battery. Prevent it to always report the
battery as low.

Signed-off-by: Elia Devito <eliadevito@gmail.com>
---
 drivers/hid/hid-ids.h   | 1 +
 drivers/hid/hid-input.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5ba0aa1d2335..899449ced29e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -389,6 +389,7 @@
 #define USB_DEVICE_ID_TOSHIBA_CLICK_L9W	0x0401
 #define USB_DEVICE_ID_HP_X2		0x074d
 #define USB_DEVICE_ID_HP_X2_10_COVER	0x0755
+#define I2C_DEVICE_ID_HP_SPECTRE_X360_15	0x2817
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 
 #define USB_VENDOR_ID_ELECOM		0x056e
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index f23027d2795b..8ed7f468bd95 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -324,6 +324,8 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_HP_SPECTRE_X360_15),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.29.2

