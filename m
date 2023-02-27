Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B68B6A43BE
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 15:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjB0OIJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 09:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjB0OIH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 09:08:07 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA03C4222;
        Mon, 27 Feb 2023 06:08:03 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id 4so3970813ilz.6;
        Mon, 27 Feb 2023 06:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IFtKKERmi0HGnc/lJWv1rhtLxqCIn+aR68TrM9Jz4M=;
        b=T6xnmXLA+mVgifsMnODihHXXq1ibStuU8u1yloxEHXrFt1TwTmqqn8Zk4udPXnlwFn
         0N4lm6/Gj92E5GPUrj4LQCGSiGKTsj1b6p/1imHq0YVB73Tx3ZizYcyCsHk1/nhe6A/h
         sHRL7KsUSBA91oJw9dSIEM4pia+ehC0gRTvy04rQe5+PxvG7y9z+2t5zEktros1rXG/P
         OvUZAdbB/EFtZ3HamgqXJRkdJh51flBeWzr2TGDfOd2hcePPNJnashS5taq5lUscv/6m
         HFaDmrMH9z5oPip9Mkqmtr8J8qMxKd2/V8LJ+ffLrpDZhULsOA1nB28qEnUY5E26xqcT
         ry6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IFtKKERmi0HGnc/lJWv1rhtLxqCIn+aR68TrM9Jz4M=;
        b=W3AOAJoJHkbNyr4Ed5TkA+qbPRn9v6r4FRG+M51dET/GwDODdx34BmnIBQW4aw6KKx
         U1iZ2tIfreaqxqMv/SGntjNzGvv+W8NCqfNfU5vnIOP1l9gvtpypISyTH5XIjg1VvT9M
         nVLTSFTkHdDsXihLHgCGP5hFalu9ELj+Y+M7uh6GLgY3hP9mp3hD81IjuUQ2GIcWs3pB
         +vndiuaKpAuAKAJLCFNHHDVvR3Zpn/nvtKUovbcAFjcLPSXTjxBUxP0kZWEzmXSu7e3+
         Ow1R7BOZcGlHYE3vVsvU1Y6veKw8u/Qv944gNfC25MxXQ23UhZCmK1y0fPsi17WHk48z
         hB1w==
X-Gm-Message-State: AO0yUKWkL/JUB3GsnttlKg9LY4Lu82uNRZZs0U886JvVWmubYhPjuCn4
        NcZQy4QW31m3UtYTOcG/R3o=
X-Google-Smtp-Source: AK7set+XauvThNTMgxM7uAahQtTSOsQTHn1F+i93c9SFTB4w3WpHCAdpb4gcZ9vnIr8z/Rcr9YdZgA==
X-Received: by 2002:a05:6e02:1d0e:b0:316:e453:5372 with SMTP id i14-20020a056e021d0e00b00316e4535372mr18643907ila.1.1677506882949;
        Mon, 27 Feb 2023 06:08:02 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id 14-20020a056e020cae00b00316dc3afe57sm1921503ilg.86.2023.02.27.06.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 06:08:02 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v8 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date:   Mon, 27 Feb 2023 08:07:57 -0600
Message-Id: <20230227140758.1575-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227140758.1575-1-kaehndan@gmail.com>
References: <20230227140758.1575-1-kaehndan@gmail.com>
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

