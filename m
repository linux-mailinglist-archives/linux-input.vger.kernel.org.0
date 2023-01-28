Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C2167FACD
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 21:26:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234851AbjA1U0M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 15:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbjA1U0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 15:26:11 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36945974E;
        Sat, 28 Jan 2023 12:26:11 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id g16so6999070qtu.2;
        Sat, 28 Jan 2023 12:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=URtavpQBA2/CY0XWdyBJ0v+t61xJy68CN0yky35YNb7oRu57C7nq4bz+/Z3XEmxKCy
         n8M56bgnBSBaVD643+JDLdCEu5pqG0veZ1/0UL2j+njHoXN5xJyIF0ko81TcFIVgdgtT
         rjSEZfQyD+DjItgz6OqkoBrrpF4+hRVmJaPr2E0PDCmzcT6pV3Ox7fAwGln+hrKQB/M4
         rBrGzOOqN8TjaNl6i9G+3kmhz5518wvOA+e6LtpkZHrgzKB5zhHU3ybrS10dd6rpAtLN
         KdO16/1/89VbK8WlL5FsvmVtd9sd+4nuGc7EK40k4XcaaqXDkiaqBOCJFBLLXiUUtTph
         ZHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=DtpUaSjdLvd7Kx6dXld2RZqu9C270PNpgeUUE/d/pcj+GEwQ3po2VP61awVIQmaFIT
         q779FTTB6iFEwnVexlKF1pGHRzn4dIKbvEQgqhUcpkvExdQJtTof/rGUbZ+ApXqTOnzy
         Tdiib6IuY8gM46Y07D+2s5YZbvjMysPfNDyT04oINCdW8hAce5zfW9Pk9BYi2WOmnw5M
         IGl3o+ImqeSmq3V+05owsW1yXxva9YqhfxnjMa2KH6QE3ow3zAb7Bd7Rdr2j03GUhYh4
         fqoOnyINYA1xXh8Bd9+CQm3UErEn7Fjw8rGnDSfgzUgAKi+9ELK/NiwtsWL6pKkO9hUP
         8OYQ==
X-Gm-Message-State: AO0yUKXNzal6PFBkxHllIh4jBLE6mSj8DkoOLR5s+10umL86ux5dS1e5
        bxBPOb6xEzfPJiyyFVx7v+U=
X-Google-Smtp-Source: AK7set8Aig5lx3lr9IWnguPTAkqw3Yw6Iv6eicsQkUAkdzYNhORw1Eox/FQb54W7hduRHg8wDARBGw==
X-Received: by 2002:ac8:5cc7:0:b0:3a5:977e:d05d with SMTP id s7-20020ac85cc7000000b003a5977ed05dmr5599574qta.52.1674937570222;
        Sat, 28 Jan 2023 12:26:10 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id q26-20020a05620a025a00b0071de2b6d439sm52460qkn.49.2023.01.28.12.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 12:26:10 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH 2/4] Share USB device devicetree node with child HID device
Date:   Sat, 28 Jan 2023 14:26:20 -0600
Message-Id: <20230128202622.12676-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230128202622.12676-1-kaehndan@gmail.com>
References: <20230128202622.12676-1-kaehndan@gmail.com>
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

