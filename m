Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26794692A40
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 23:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbjBJWgj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Feb 2023 17:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233555AbjBJWgi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Feb 2023 17:36:38 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B6EC0;
        Fri, 10 Feb 2023 14:36:37 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id g8so7556044qtq.13;
        Fri, 10 Feb 2023 14:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB9yw80m4eUWIlzkt3mXh3jD0Iw3rE375qRHv4MHbow=;
        b=a9yxqGZ6vF79wsnZvR1mP+EDaX9Z89UW1fi1I9chGS8tQuO8zXrUV98fC04YoYxTM8
         cb2gmIxMEPU7tKxSr5p0dJh9feFAFP9CRKMO+TZeXk6T2VeaJiHUmlsdjSzxZAn07r+g
         VNPfgMpW9ZBwiyEt5Umw282wA283/xdS4ghZKze5yWi8E4/+7NGX6neHGWQeJpOZzMua
         mc4DVCDwE3ALZSwUfP6+pXRukWdz43cZEg9CXIM7hWMxDVhzxAsS13FxzQKW/iGc/yIR
         dXBgA7Uyk0lthdYBqD4NmvxMrSYZ/+IMdE+mPEUB1Uv62HgIh0jOeRbpAIfl14evBqLt
         wqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB9yw80m4eUWIlzkt3mXh3jD0Iw3rE375qRHv4MHbow=;
        b=T1g4wnwALCt5R8OlNNWEFPuwR6P/VVmchrO7eA83uJgGCdPTSs7RdYlG+umMZ14UdP
         KO2OLIKcfjpNnmCrSPy8sJgSM/+Ad1VDyEzQnkJcfqZaandcomP5JG0akTrOyn1YaANA
         J3QTR2XcGXJQSkd9j7etCUjGKsRDzIOpcol8ooRrndXZqt0f74hl6ZqyBwJQJahzXP9B
         lzQ7A0dCc1b0EsX9Gb/KzzCKTqETtYlbBAFJhAd9vK8wcMgO7p2C4JsWLTWoX5Flp7/r
         aZc07jpBglnBfbxvbtRfJZe93XXTCaVl0C2OBnoqHbSrxhlVNKxwE9fth0VuvQZ+O2Am
         8POA==
X-Gm-Message-State: AO0yUKWCIChTFgXrispDidD9A1o+7NXHJm2jarFsV3gwoO13C57mNm2O
        UXzy61fYTWgQ6oZGrgN+SV3ZZlFtYozvyA==
X-Google-Smtp-Source: AK7set8x3BKmYvbwgE9xfrXvynMpqayR23LXPrvHVoUVbK22gOX7qF/CvxAj3TAEaWWte518SXDLgw==
X-Received: by 2002:a05:622a:1752:b0:3b9:a965:7af2 with SMTP id l18-20020a05622a175200b003b9a9657af2mr28240281qtk.45.1676068596490;
        Fri, 10 Feb 2023 14:36:36 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id o5-20020ac80245000000b003b64f1b1f40sm4166063qtg.40.2023.02.10.14.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 14:36:36 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v5 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date:   Fri, 10 Feb 2023 16:36:37 -0600
Message-Id: <20230210223638.12796-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230210223638.12796-1-kaehndan@gmail.com>
References: <20230210223638.12796-1-kaehndan@gmail.com>
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
---
 drivers/hid/usbhid/hid-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index be4c731aaa65..a0859c49d9f4 100644
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
@@ -1369,6 +1370,7 @@ static int usbhid_probe(struct usb_interface *intf, const struct usb_device_id *
 	hid->hiddev_report_event = hiddev_report_event;
 #endif
 	hid->dev.parent = &intf->dev;
+	device_set_node(&hid->dev, dev_fwnode(&intf->dev));
 	hid->bus = BUS_USB;
 	hid->vendor = le16_to_cpu(dev->descriptor.idVendor);
 	hid->product = le16_to_cpu(dev->descriptor.idProduct);
-- 
2.25.1

