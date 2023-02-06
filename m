Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B87F68BEBD
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbjBFNuu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:50:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbjBFNuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:50:35 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A132595F;
        Mon,  6 Feb 2023 05:50:18 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id j9so7098124qvt.0;
        Mon, 06 Feb 2023 05:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=L7tu4+Ff+mvJHHdSiME91P7faYWX9NShpu+J0SyBJLwdGoutPMa5oMv93RQbcWB6Um
         J9Qvf2lvrk2VbVHLlpLZ8cLeT1hyvsjBPUEQneLO71CEFlpPYGuYpDKlXiGxxozG6y9r
         7Uh6xhcp8GXOPQ/d7774RrczEE3xAzC+SLJ+gYcSjYkp15QdFDEJyILeKnn3V71aRMyN
         15HKtac3UBjEsNyIqPOU8AiR021B9ZnmTP75XHNqNZT/bRV7mMF98F+2WR52Hc+Pd+1D
         SQV8ndUMdsa3BCDK0//sWM5STSy7orKooEFcMeF70YGPfX1xorULXEOcfAOASPVRr1hb
         ZPWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxwJJG81TUrsdw3X7aHgdC1I62jcckROfzmxoyJojKQ=;
        b=dBXZ9qjKRGrFp2gAhhYFxjSrBEopvsIiR3VgAX/b3y84H3SCiJL4F+XCFmKKY/BubO
         mChChT9z6waReBBHiwEYqzpo1wD9f5PSrWrdznQvcmHlyPP5t561O4Z3KK995vCjAyeP
         nd3THKAvOXOrcnuC7OEcgm1fsyTTHGK0AMjFJZqOrTCarj1AGtCqqdNGU4Ia9+ie/BjG
         ZPTgZkXwUO2LMpQ1MAkr8MkBxxrvfd944N2PD0HNq4hIKmsGcD02UH3J7v/TilM9/QjO
         woqHlpSq+2A9hr7Mvq54GRU1882hkopxnkYhmejzhwKhKh4QwdeJ8uW4p2ZC8Lq+XSh1
         sxJw==
X-Gm-Message-State: AO0yUKU8+Nwk1VzIr7v4KRPG5n1Rk7QpBMszBXdyEeq9kBUKZ4BadsZy
        O1garJ8WfGUUiF4SQ/IN8ro=
X-Google-Smtp-Source: AK7set+m6zeI3ljrsdQWTgn1Lrkwm5DqLvOozgHnekR2TD3UgLoowgtrUomjxIOKiRhnbhiEFlcBFw==
X-Received: by 2002:ad4:5145:0:b0:56b:ec8e:6a9d with SMTP id g5-20020ad45145000000b0056bec8e6a9dmr6949698qvq.12.1675691417598;
        Mon, 06 Feb 2023 05:50:17 -0800 (PST)
Received: from DANNY-DESKTOP.localdomain (071-013-243-092.res.spectrum.com. [71.13.243.92])
        by smtp.gmail.com with ESMTPSA id ed4-20020a05620a490400b007195af894e7sm7349492qkb.76.2023.02.06.05.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 05:50:17 -0800 (PST)
From:   Danny Kaehn <kaehndan@gmail.com>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: [PATCH v4 2/4] HID: usbhid: Share USB device devicetree node with child HID device
Date:   Mon,  6 Feb 2023 07:50:14 -0600
Message-Id: <20230206135016.6737-3-kaehndan@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230206135016.6737-1-kaehndan@gmail.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
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

