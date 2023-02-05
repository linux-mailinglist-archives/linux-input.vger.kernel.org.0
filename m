Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F4868B06A
	for <lists+linux-input@lfdr.de>; Sun,  5 Feb 2023 15:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjBEOyy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 5 Feb 2023 09:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjBEOyx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 5 Feb 2023 09:54:53 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A25661ABEC;
        Sun,  5 Feb 2023 06:54:52 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id z5so10361662qtn.8;
        Sun, 05 Feb 2023 06:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=qM+1Av63ZNvzje3AGryPbJBgQom/HBh7vyi4TYG/z+lKRco2eLKdeVlL9Tnij2euRh
         UnvQTgAAJVTQ1MWVEmooNb7vQrVNjLviYyfPuK3wBeC0vrpjCgFaeb+k+ONEH7vPkw71
         JBGcDfl68qOIuU+j/XTBn54kvkemTlOMwjFKjeRMfEec7lmAYkPy7E44WGKqYRZwOpWq
         0NqPknJnLDoHTXmfXCumqpiSr2bq6oXFiQPwMEvCjjzQuc+A91idL92ta7wide/bqx1v
         f7pMvoV+StSC8qW5+KLiG7Zv1LA0RHImdVYZkth4078kA17aTuDbAV7I6Ygf3o1+BmZQ
         4t5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=gMgUUurXMFHliDgwcG5j6BDuHaMRMwqvmagZfPsjRc9PQhS6N76l9LFiWuCdz6Vpjp
         E043UXzdUJatkaR5UCj7PQMEazWptpuWPvRcuyLVhCfGRrio+mw8PrVJ1Pz6Xh7POgkG
         yp0728BQnJRQVCU+XSSrTgBAmKSjlX+ILPlXbFc358G2JTyKUlrEsrgKL6qE+iRSwoo8
         CwTc28608ZCnA/QLwJpAcvg/90SpBQY//m7zeN6MrJDBJr+QNG8W86S5apbg0IvQJvus
         a/y7dR89dW9JrRZHg7HTZ8sz7Iclgh6vjDKS0tPvMqozRxIdleRwah62oFgdfnqwtZ8b
         FAPQ==
X-Gm-Message-State: AO0yUKWkhd4hT9BLC6Sg8hQTW130AisQKpyYHRTZtWX3GwVvoWHLN3GQ
        V02o0Yyx2c7Yr2NhflUVxib1yXSCJJss/w==
X-Google-Smtp-Source: AK7set+imUc/jAcFTVWz9wlh8gROoRPklyvLMlRlEDiu5jMGOfJ8Xsalikxws4agIPfG+bFhIdsMXg==
X-Received: by 2002:ac8:7fc3:0:b0:3b8:6a5f:9918 with SMTP id b3-20020ac87fc3000000b003b86a5f9918mr31364700qtk.63.1675608891686;
        Sun, 05 Feb 2023 06:54:51 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id b5-20020a37b205000000b00719165e9e72sm5560048qkf.91.2023.02.05.06.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:54:51 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v3 2/4] HID: usbhid: Share USB device devicetree node with child HID device
Date:   Sun,  5 Feb 2023 08:54:48 -0600
Message-Id: <20230205145450.3396-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230205145450.3396-1-kaehndan@gmail.com>
References: <20230205145450.3396-1-kaehndan@gmail.com>
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

USB HID core now shares its devicetree of_node with its child HID device.
Since there can only be one HID device on a USB interface, it is redundant
to specify a hid node under the USB device (and further, binding this way
isn't currently possible, as hid_driver does not support of_match_table).

Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
---
 drivers/hid/usbhid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index be4c731aaa65..b6c968af258f 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -33,6 +33,7 @@
 #include <linux/hiddev.h>
 #include <linux/hid-debug.h>
 #include <linux/hidraw.h>
+#include <linux/device.h>
 #include "usbhid.h"
 
 /*
@@ -1369,6 +1370,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	hid->hiddev_report_event = hiddev_report_event;
 #endif
 	hid->dev.parent = &intf->dev;
+	device_set_of_node_from_dev(&hid->dev, &intf->dev);
 	hid->bus = BUS_USB;
 	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
 	hid->product = le16_to_cpu(dev->descriptor.idProduct);
-- 
2.25.1

