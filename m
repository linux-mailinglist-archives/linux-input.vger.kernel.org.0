Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5D7C18A357
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 20:50:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgCRTu2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 15:50:28 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34624 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbgCRTu2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 15:50:28 -0400
Received: by mail-io1-f65.google.com with SMTP id h131so26360471iof.1;
        Wed, 18 Mar 2020 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4aLfiI+rQ0cYELzjINAnUkigulEn0L8tevInm5D213Y=;
        b=lIZXLCGWiQfGpa2sRwFMr2ggdWx/VNwEcuJejdn1e3OV2QweLGnrfgUr0sMxCplw+e
         N0rFgyRbdyBlzjG8hgRIt772vfmfLdPNNUO5M/lvigtnOXGNATSQN+9LJzJXvSdoxBio
         gQtLRtgSbr5ttxMYu2IsCVgRqjZcGJ8thyuW7VJZLLlBeuLP3sWxHP7aq8d0bRiaHoTG
         ZRAWmu32ctG76Pd7NS+m9hICZCm6MCh8a7ODDovGDROxuD/OfoSMLirfyK5i9zwY8v6S
         Drdf2+BuIGVLresQqbvyxrgvEkY9ACkDLHNwHWmfQJgG7U+R3khuI6pgeCHbISRrKw7z
         5gZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4aLfiI+rQ0cYELzjINAnUkigulEn0L8tevInm5D213Y=;
        b=rG5G/u77gXrG4/mNEfqSB3ga+ek+TubQc/vSk8TNknx3reMjXr0tA+eHYGVCe2M+81
         3JcFD4mWuDPYNmX4fvVdcEM11ykhTbGtPevZoQ2jKKIqvIwGbtZkrIy6lgWpXEVgFxc5
         /jlq3hVA3CfBEAIj4O3qqU0LgHQUaaMKVH51r9es2KRfnqiXwnY3pcYaXOBSqgmzv+/k
         0aCd6orrth3dbugQP3FXD1nRu1/+s6fSXT8l4AfJbZfXIRNStEK+rdc0PO9r+4WOgcCa
         41NVeKOcCYO+RMb+2zZDTHNWyfB5w5Xm0qsO6woMKB0bISEAJEZlldAVQBhg1R8y/APA
         sQkQ==
X-Gm-Message-State: ANhLgQ30FyGHdHt+75BErLpIs3/CCsTdNolwTBiBO1Sx9flYg1J/0xK/
        TMDN2HKFaqzbff8fB9Mw3/o=
X-Google-Smtp-Source: ADFU+vuAR6Yx9vXuQ1AIahveU22TaCE59kDlrKVPz5OhMZtIWUgmpcfPHpPWBy3qtibyH3MvHvmG1Q==
X-Received: by 2002:a6b:9386:: with SMTP id v128mr5384303iod.15.1584561027420;
        Wed, 18 Mar 2020 12:50:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-1.hlrn.qwest.net. [71.218.108.1])
        by smtp.gmail.com with ESMTPSA id p23sm2381562iop.8.2020.03.18.12.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 12:50:26 -0700 (PDT)
From:   James Hilliard <james.hilliard1@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Oliver Neukum <oneukum@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH] Input: usbtouchscreen - add support for BonXeon TP
Date:   Wed, 18 Mar 2020 13:50:02 -0600
Message-Id: <20200318195002.111562-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Based on available information this uses the singletouch irtouch
protocol. This is tested and confirmed to be fully functional on
the BonXeon TP hardware I have.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/input/touchscreen/usbtouchscreen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 16d70201de4a..397cb1d3f481 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -182,6 +182,7 @@ static const struct usb_device_id usbtouch_devices[] = {
 #endif
 
 #ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
+	{USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
 	{USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
-- 
2.20.1

