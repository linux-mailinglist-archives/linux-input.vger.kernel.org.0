Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E223E69B28C
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 19:49:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBQStM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 13:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjBQStK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 13:49:10 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CAF3C2C;
        Fri, 17 Feb 2023 10:49:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id g30so2190225oic.0;
        Fri, 17 Feb 2023 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB9yw80m4eUWIlzkt3mXh3jD0Iw3rE375qRHv4MHbow=;
        b=hDzVfPqBTQIJKUT2QIQPiT56235k+GG9IusgG4d+ROF+ejNxliNO+7cEn4bYzCIA2j
         yWBP1pscQWQi6B1Of6iqaTUpkzAdiTVaCM2uGRITFlzRYH6YPOLxXqHRWP2glaLcZe2U
         WQORSZ/FeRsSIS2l7YynqkFtxzOL1I4rHtldBXwdmXhaMvyJXAtLYqGD5LhThDtTB0K8
         11YEnfo3UIyaR3POHPrBc/5tKQ3LzVAlXyoOxWC9Mf7pZ2+y78d1X5ekt+B8ALNB6MEU
         ojU+zsvlvheOhiMGll15Arf34FDwIN95B0ub3SyEUdFDq4tnWXPA6csVEQKAtusEj/Di
         NFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB9yw80m4eUWIlzkt3mXh3jD0Iw3rE375qRHv4MHbow=;
        b=Isl3Rr4IyRJK8uWvpG9FBlyD9n03DcpQj8FG/z8xWUeqs3FIALgAsdeSlLnvJtuwcl
         pTza7hGRrtNRFj/PDwZA6d8aa4WNR4ewh1+q2wWBnT0tmpqv07k4sUGJ+ujKNLcLTYYx
         ZRKVobatV+g1jNQIs/5cLV27Qc0C7762ARhL1Tngk7MdinwYkcwlJSJuqHT+XvOd/zSJ
         tx9p7+1IWHqBX8sJfOTLzanswUNwj6xFmcmCTcyhnDUOhVYZjv/OemrCnvqi6NlYcVfA
         ImqRQ6JQtDAbQzIsD3AjggfCfENRMfBoK1BW1AEPpnlMkpYTGEt0mdHNmtpPlPDgHfVj
         SiUQ==
X-Gm-Message-State: AO0yUKXSioE8BUonvgHigNcmn1G04Txx92ttL87lpLo9d17i8dtXYCkB
        BJNiQhgM1zCVynpUkwi2nkZ1kiX+rLeG+Q==
X-Google-Smtp-Source: AK7set+v69wOFExUGByI++AQS8WvVNTG9oNF01wwy7YIuDbWJ8YT1xBtqUtoKSYrijFBKpt5sa8vcw==
X-Received: by 2002:a05:6808:200d:b0:367:e4e:ed98 with SMTP id q13-20020a056808200d00b003670e4eed98mr3779696oiw.23.1676659748905;
        Fri, 17 Feb 2023 10:49:08 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id s22-20020acaa916000000b0037fa61eb1dasm1198521oie.47.2023.02.17.10.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:49:08 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     bartosz.golaszewski@linaro.org, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Subject: [PATCH v6 2/3] HID: usbhid: Share USB device firmware node with child HID device
Date:   Fri, 17 Feb 2023 12:49:03 -0600
Message-Id: <20230217184904.1290-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230217184904.1290-1-kaehndan@gmail.com>
References: <20230217184904.1290-1-kaehndan@gmail.com>
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

