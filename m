Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A5614C194
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2020 21:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgA1U0Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Jan 2020 15:26:24 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38888 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbgA1U0Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Jan 2020 15:26:24 -0500
Received: by mail-lf1-f66.google.com with SMTP id r14so10145103lfm.5
        for <linux-input@vger.kernel.org>; Tue, 28 Jan 2020 12:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zajac-cc.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=g3/Rf3/DVjOiT7VXTCGv/j8hdsCnsBbf2EBArGGjXe4=;
        b=cD1XKQN8bS/6Gp7QYWMCWAor5wXFuBs3sfbr3LSxHczHSr74x0gtZjj7FgAb1PRP25
         2me/75bpBIxjg0GyBo2Md+8GNHaZu/6bl275qglYbg9wVdcdbrvucj3NtUCj9cC6t4dx
         7jyt/aHQLPK1/PlOpsjBxpAyOnkvgsb+LgC1G/qiiz/4s6/yiY5L6RKjPwfeUtYQ/Sb9
         JluCgmAZIHUXD06PrY22KGqXzqzJZ5q8QqAjf0zFlNYPLXF7DKIYlQh12jpcj88wFEcL
         WWHtw0rDdGFjEpgFNfylK3KC3jfPirHp9cA9/nTd7YdE0z7Onca/Z+UtrYFI5RjBrZTm
         rK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=g3/Rf3/DVjOiT7VXTCGv/j8hdsCnsBbf2EBArGGjXe4=;
        b=QMYbjzSaSrtzWEMGXU3kNvZVMCrAIIscb+PQ0I7Qe0swPm600qy3ejMF2/0FjPXlHd
         w8W+rn5aFpcDbLjOZ9Xp4Yijv/Wzz2wUqGbPwuHTHW372AR7Kuq76z8n3wRfZP/XUeAb
         9nJfY0cwnidKY8TaeGzkpXLSWQXBCyr1DPjqH+ZC7g8DHD8gRNzbEoagnD6Ujq7XaKrw
         uRS+u9NY0c9CdVSTpFUPg0XfV/bb2yMjGy3x7zflyrucAAUO9yDhzPIwhI2NrqaKG/QK
         TUYRM4ucGbsHSqqN0OwPIMK9o8OUTF86LxFO2G5l09IKv9WZt2jj9/RsuYaOo4EtpKCV
         cdsQ==
X-Gm-Message-State: APjAAAUD6PmmpFx284nuXGCjVqnKihrlUmnEZ5yNUdV5gM59QTxO7MPx
        gG3rwbVDgKnNXsed5gb5IGoeSrVQ0NMrVA==
X-Google-Smtp-Source: APXvYqyKqJu+yQj5Xsaxf5MjysXjXZiQQLISExcZCQPO9VIT/PJw8ubVVhMUNEEpspkqwh4jJYg9tA==
X-Received: by 2002:a19:ac43:: with SMTP id r3mr3471077lfc.156.1580243181128;
        Tue, 28 Jan 2020 12:26:21 -0800 (PST)
Received: from [10.9.0.2] (darke.manwe.pl. [83.144.91.14])
        by smtp.gmail.com with ESMTPSA id t7sm10081272ljo.7.2020.01.28.12.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 12:26:20 -0800 (PST)
To:     linux-input@vger.kernel.org
From:   Michal Zajac <michal@zajac.cc>
Subject: [PATCH] Toshiba Tecra X40-E, Melfas LGDisplay Incell Touch
Message-ID: <83231c43-2004-ecbb-3617-4783d6f71b0e@manwe.pl>
Date:   Tue, 28 Jan 2020 21:26:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Another USB device ID for Melfas/LG touch display, this one is 1fd2:6014
and can be found in Toshiba Tecra X40-E. Tested myself, scrolling and
pinching works fine.
More info: https://bugzilla.kernel.org/show_bug.cgi?id=206295
# lsusb -d 1fd2:
Bus 001 Device 003: ID 1fd2:6014 Melfas LGDisplay Incell Touch

Signed-off-by: Michal Zajac <michal@zajac.cc>
---
  drivers/hid/hid-ids.h        | 1 +
  drivers/hid/hid-multitouch.c | 5 ++++-
  2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 3a400ce603c4..d695f4494028 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -730,6 +730,7 @@
  #define USB_VENDOR_ID_LG		0x1fd2
  #define USB_DEVICE_ID_LG_MULTITOUCH	0x0064
  #define USB_DEVICE_ID_LG_MELFAS_MT	0x6007
+#define USB_DEVICE_ID_LG_MELFAS_MT_2	0x6014
  #define I2C_DEVICE_ID_LG_8001		0x8001
  #define I2C_DEVICE_ID_LG_7010		0x7010

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 362805ddf377..a8b215703ed1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1981,10 +1981,13 @@ static const struct hid_device_id mt_devices[] = {
  		MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
  			USB_DEVICE_ID_ILITEK_MULTITOUCH) },

-	/* LG Melfas panel */
+	/* LG Melfas panels */
  	{ .driver_data = MT_CLS_LG,
  		HID_USB_DEVICE(USB_VENDOR_ID_LG,
  			USB_DEVICE_ID_LG_MELFAS_MT) },
+	{ .driver_data = MT_CLS_LG,
+		HID_USB_DEVICE(USB_VENDOR_ID_LG,
+			USB_DEVICE_ID_LG_MELFAS_MT_2) },
  	{ .driver_data = MT_CLS_LG,
  		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
  			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
