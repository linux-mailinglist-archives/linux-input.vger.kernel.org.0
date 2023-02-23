Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F956A120F
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 22:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBWVb4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 16:31:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjBWVbz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 16:31:55 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901F518162;
        Thu, 23 Feb 2023 13:31:53 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id r5so2789583qtp.4;
        Thu, 23 Feb 2023 13:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQLtlVN+sRXbnWehgURQpNSTbev0VNH05s1JB65dZEM=;
        b=nlYQpJeB87/hwgDR8TGGtvLUWPjhRo/giVBFHwmxd5B2HHavpgLGjf5WvFB8WPIj+I
         Mry/mg83wW8MCpQOZq0hlELBds47k7pLSnvPQFP0139EKGXjzxp60LVUdOSrX//phmvQ
         x+3a321jO2Wd5Bg5V37MmWTuCuRki+6TgguQo9f21nkbR+tD9eBbx+8MGNkUbHIu9dnn
         GZav8orvRoEr/OVoU/85gC85D3hP+vHM+3F+oPBD35/g0oQO5tRJljZk8YEtTSuujujg
         cCRRNL4tz0nKZvk2z50Wtc61jwk8G5gylxzkbmQkpgBtGUXWj0aBSmdCFz0RmEnp7eBP
         V8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FQLtlVN+sRXbnWehgURQpNSTbev0VNH05s1JB65dZEM=;
        b=wn/zkuBEH5+ExrLd485OBBtIRBEmrDnsu4u/sp1x3BOJ4LDbr3Duq6BsivFxJl0/Ae
         hK9qnrmKe8oD1QpfasmtXOijhuhlAhXbD7z8QBu07gUi92oTD6VXzK5BhrjOWGVRZE1Z
         NxaWhd/OKGOVIpZAToefQWdiNtLBXDuOXpDPqaQ2h9RBWsr23sjO9wLnTr11jI+JRE30
         /GWjeUTnbjne8ybognfawOzcLwmF/oIAx4BLj1EWAvxcsMILKQpjv99zqVvA26ueKJ9+
         XezfJBJeaphLEaUv9Da7nYEFlPXuCeGnt5KYmrLK1V10SyPAJSLnbSuSxr8lHM1zVqPD
         1oXA==
X-Gm-Message-State: AO0yUKW7flD9eidxpDKEa/OPat1+twD1ULT8ffMKwBF5ONgG3uw8ALgC
        gfk2Duc2iJSwAmwdLtp6j7o=
X-Google-Smtp-Source: AK7set9ZRssBG1XuqX7U1jM0EHeVBUOIxoeF37JsQJba9FqRz6kxwPduO5RSR7Zb1+zA9pVbu/FLtA==
X-Received: by 2002:ac8:578b:0:b0:3b6:895c:d18d with SMTP id v11-20020ac8578b000000b003b6895cd18dmr25615760qta.15.1677187912573;
        Thu, 23 Feb 2023 13:31:52 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id j187-20020a3787c4000000b00739e7e10b71sm3475394qkd.114.2023.02.23.13.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 13:31:52 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v7 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date:   Thu, 23 Feb 2023 15:31:46 -0600
Message-Id: <20230223213147.268-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223213147.268-1-kaehndan@gmail.com>
References: <20230223213147.268-1-kaehndan@gmail.com>
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

