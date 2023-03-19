Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7736C04E7
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 21:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjCSUsO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 16:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjCSUsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 16:48:09 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 779564494;
        Sun, 19 Mar 2023 13:48:07 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c19so11099670qtn.13;
        Sun, 19 Mar 2023 13:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679258886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IFtKKERmi0HGnc/lJWv1rhtLxqCIn+aR68TrM9Jz4M=;
        b=Rlgl6wopi9y85Z0jlFBr8jex8DuEEDf7Qk2q4azhhAgMVROO9y7IbA/pKA+XK2J5sx
         gQiK83K1Zk8E569TDUkQ3TresRY2yj7EE6aeAV+QFVH41sD0FvaUtI8tJbRWSkks3cbC
         sX02UCEu5FiRc/aoYljieILce5svmt3BuovHAcy7HSvgyxO7XAhyTKotqHClgsOb2s4B
         zeS+0MLfIZJVNfgW+dh1m+z5rhrua5I+vuPu5Da7C46nRp+r2lRwV19lPhYHh6oUGflp
         xmZh5nDUQYIRDK+2LTq1Mscfr+R9fv+XrB5GxS4s9a2iFkMJt9pA3wzsyjggYJo3IGZH
         uZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679258886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IFtKKERmi0HGnc/lJWv1rhtLxqCIn+aR68TrM9Jz4M=;
        b=XJTx8/k3yfG7fL7Ynnb5+XusBqK3+SjidnYOdwAShlkiUw74m11ZQSNk7r4uwBQH8d
         bSWucH5stBFYHKvGBQyulbUYp7EycWBY8jv07A/Ycuf7Pi5Y4XSwfOivyVTfPdcp110m
         hwpB8lzY9j0gyYlm/lldFJY+Y0y6ejav/LY6drUCJQPL7EOvQ0vAJxf2fLCQtWzPndUZ
         GhGd8jo3zTiBZ7+rQYZkKqhhiOJcE+31KW2fWAQSxbPO3njrIDgUqquXQkdylXsNaPO/
         Z+NpyYG6z2oQU+pkLdJTNYAlsmr9l+4rVfXUH74LyWV7Z3mQyFbMLoBt0QDSFWf+SUTT
         n8hA==
X-Gm-Message-State: AO0yUKVNkf4UCZGsZULZYZVgJnP7lcvDnuYFUKU4qqQR4ukTzYJhJnIz
        OWuuSc2qHjloe2w21/CcC3xQvpulg4Q=
X-Google-Smtp-Source: AK7set+vaxLrwhsyEDIhp6Ph21RYYN15wkMUiE5fB3P10q44iA98q7YhLF9+bp/tV47ZHnn/tjPurQ==
X-Received: by 2002:a05:622a:1109:b0:3bf:b08f:1dcd with SMTP id e9-20020a05622a110900b003bfb08f1dcdmr23846432qty.38.1679258885784;
        Sun, 19 Mar 2023 13:48:05 -0700 (PDT)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id m24-20020ac866d8000000b003b7e8c04d2esm5186021qtp.64.2023.03.19.13.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:48:05 -0700 (PDT)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v9 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date:   Sun, 19 Mar 2023 15:48:01 -0500
Message-Id: <20230319204802.1364-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230319204802.1364-1-kaehndan@gmail.com>
References: <20230319204802.1364-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

USB HID core now shares its fwnode with its child HID device.
Since there can only be one HID device on a USB interface, it is redundant
to specify a hid node under the USB device. This allows usb HID device
drivers to be described in firmware and make use of device properties.

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/usbhid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 257dd73e37bf..090260d99c84 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -19,6 +19,7 @@
 #include <linux/list.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/property.h>
 #include <linux/spinlock.h>
 #include <asm/unaligned.h>
 #include <asm/byteorder.h>
@@ -1374,6 +1375,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	hid->hiddev_report_event = hiddev_report_event;
 #endif
 	hid->dev.parent = &intf->dev;
+	device_set_node(&hid->dev, dev_fwnode(&intf->dev));
 	hid->bus = BUS_USB;
 	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
 	hid->product = le16_to_cpu(dev->descriptor.idProduct);
-- 
2.25.1

