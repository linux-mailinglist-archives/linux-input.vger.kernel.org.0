Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CE738ED0A
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 17:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233103AbhEXPdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 11:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233193AbhEXPce (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 11:32:34 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEBDC08E820;
        Mon, 24 May 2021 07:57:48 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso93735pjx.1;
        Mon, 24 May 2021 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=UpgWWaqRJSv+ldPuvlsNrJYw/LOoZUhMrwWVqwyHvOw=;
        b=tnrr8MNN8/zoyRJbbrHI80mW2pYIue6ZNjCt8Ps2cTfG+2J9DCTw/WwenQefR6ZZz4
         7omiZS16IC5BU/B+m9mfGSiOZewzcr53BDSlmAPKg30wSNVvfi2OmdhN4jZrq50ZERb4
         qnSp8y9EOqYPkSM7ZN9dqTbvu08Tc9l9VfSVybB3Vd6iPt8TZfJ4GP/akCel85k51rC0
         4irox27haDgAdgchUoNO9Ols2TTB3+j9SBl+QIG3L6/6DhgRsnjfWaPM8NqgXJQdcdl7
         tabV9bieSlsrNHkQEMU0jXyLwFI8owl5ZJxanucs5y7kwjgb5k1CfnKKXrsj8aPnOy2b
         Wsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=UpgWWaqRJSv+ldPuvlsNrJYw/LOoZUhMrwWVqwyHvOw=;
        b=XYM+zZDW3utOwm585NZnPE3ugeBQTYDAvvz7QCfDMo6QcUZKBOlTSTmYNilwpAGU2O
         C1LuIReIPknHpjFb3eNnrvaPwNBg6Ic1Cr9fD4YKJyrQWm904U7v/NIg3f8VoGEfb+W7
         tX9yuun5MCp+7KfksTsOpEuZzXXU1JXRqv2Kru9fqZAFH8/VAJQRfIpja1wYmY7WVvHw
         cRLOTRhbCLDund6XzQkrlTWElwqOfk3pJRgcGC4KKBPkVduqS6yZx1a/OjSRauZ+4WhK
         GT4CrXobhFuYqD7mHWDo39jOL6hG3IHclmfnMdoSQl2UPWUaDyAFOqNrpFpsmUpc7soa
         JZPg==
X-Gm-Message-State: AOAM531sn2rnJl401lsW3PwVMidDb9LZhYzwxAFfW+JPf87DiFcpqDTb
        5yY4aFuVqb+9WeQVPI/TIxh4WDiXdoJrWQ==
X-Google-Smtp-Source: ABdhPJyB0Ko8atad96hwk3nC5Zcn43hhK9rwbzdEy3Gm93tqfuP2pu+UjjqNja9NadL6ycV2nGO6SQ==
X-Received: by 2002:a17:90b:1244:: with SMTP id gx4mr26232703pjb.210.1621868268447;
        Mon, 24 May 2021 07:57:48 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id y66sm11478001pgb.14.2021.05.24.07.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 07:57:48 -0700 (PDT)
Date:   Mon, 24 May 2021 23:57:43 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: usbmouse: Avoid GFP_ATOMIC when GFP_KERNEL is possible
Message-ID: <20210524145743.GA92203@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

probe in usb don't need to be atomic. So GFP_KERNEL can be used here,
instead of GFP_ATOMIC.

Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
---
 drivers/hid/usbhid/usbmouse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/usbmouse.c b/drivers/hid/usbhid/usbmouse.c
index 073127e65ac1..c89332017d5d 100644
--- a/drivers/hid/usbhid/usbmouse.c
+++ b/drivers/hid/usbhid/usbmouse.c
@@ -130,7 +130,7 @@ static int usb_mouse_probe(struct usb_interface *intf, const struct usb_device_i
 	if (!mouse || !input_dev)
 		goto fail1;
 
-	mouse->data = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &mouse->data_dma);
+	mouse->data = usb_alloc_coherent(dev, 8, GFP_KERNEL, &mouse->data_dma);
 	if (!mouse->data)
 		goto fail1;
 
-- 
2.25.1

