Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E340868A83F
	for <lists+linux-input@lfdr.de>; Sat,  4 Feb 2023 05:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbjBDEnT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Feb 2023 23:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjBDEnS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Feb 2023 23:43:18 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C21131E9DE;
        Fri,  3 Feb 2023 20:43:16 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id g8so7783938qtq.13;
        Fri, 03 Feb 2023 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=ZtIZbgC3Ee5nRN6C46HbuTWX7lJSUl0+GkqaDWj2e69lOZ48g5yiQ+XR+sqZzCqI1T
         yIdQ1p5ZoAX1Bmzl9+jZSbiZE8Fj3mbHa8WWg31I6e1QdEKAvSw3HASlgJfqYJdXlhRn
         3489mViZ9oIDr9ouITRPMbhGr52Al0aq0CKaTR/FLBrtNc6ga/utIcvA8mA4CaIUrTw0
         aSE3+vl+StrTKujSLQA7LmDnrHd4JVFzwbRn42DLDYtfEQqXWw+hGkIjCKAXe0DXqShG
         PoIDtmZVkQrQSjtDehiD5mn9AIIecEpHjOF4H0ZaSlXBbHc1ftf5ZGU1aeAdy9Mal0mA
         TZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=YCSUYfGKlaWaZoJaz9pAqx2++uKzis0+B0AeBvEHuPPY/yYTPHNlfvlSlUaC6/6GFT
         4JP62I9HtAr0R/JW4YGxjD58DcD76CDJW2isrAwLkHysKINdowP0wkF/WI5y/ifzaQAc
         8tDQYBATiT3hc3+qq/5t5ZEfsTerXwK72rlZbCRxR3LDdBffkZn1ZKnFTIfIhHb1NmtF
         SaPsc6yhbc4mQiAZkwqVJqQHUag1IYT8aufWcRN/pbm7mgjJofhq6lKWUFbitCTPy0AB
         JY+f/euqayULGRxPhIW2/lBWx4imTbYqkQ1jjY+rF8CBrjZwCbbxFpArviNCkhPuMlgt
         2EKw==
X-Gm-Message-State: AO0yUKUEHWaQe+qZX/+I1FEMSsNFke8EtUoOrPHdd9wP7Zor+p9TkGEg
        TKjHdmqzP6ccAv1V3UX3ngw=
X-Google-Smtp-Source: AK7set/PArO3t3pEAhGdhPIKKxoZYD4mzsElB9TfIMowuzcXW+oyI6b/d8NNEYy8ERLMmi5lLuRC1A==
X-Received: by 2002:a05:622a:60e:b0:3ba:1113:751a with SMTP id z14-20020a05622a060e00b003ba1113751amr3942436qta.67.1675485796354;
        Fri, 03 Feb 2023 20:43:16 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id l23-20020ac84597000000b003b85ed59fa2sm2882135qtn.50.2023.02.03.20.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 20:43:16 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v2 2/4] HID: usbhid: Share USB device devicetree node with child HID device
Date:   Fri,  3 Feb 2023 22:43:11 -0600
Message-Id: <20230204044313.364-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230204044313.364-1-kaehndan@gmail.com>
References: <20230204044313.364-1-kaehndan@gmail.com>
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

