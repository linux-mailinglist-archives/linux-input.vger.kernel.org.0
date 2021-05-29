Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 345E0394B82
	for <lists+linux-input@lfdr.de>; Sat, 29 May 2021 12:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhE2KFj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 May 2021 06:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbhE2KFj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 May 2021 06:05:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1883BC061574;
        Sat, 29 May 2021 03:04:03 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y15so1185627pfl.4;
        Sat, 29 May 2021 03:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=SgNX52kvrZEZbJ83Eqba9crMV07w0pa5kBmivpD5OuQ=;
        b=rp0YAjZ9oGo86UUEa1UQPi2qp3kT3oVcPX+/l8dBTKf122VlRcvFZpk8KcLTBoJ3Z9
         ++28pCdHzC38gQNZklBWtcAHLenZCq9E7szh9BDviIv9fADYwWHQfdHk+pS4pqL/b23S
         uo1n1zJ58mJ+EQz/rmm9yqrYdUbFXzcqrO9uztMPNUsudP5oItsuZoAb1YsqAHgWaxt9
         TLLz2zgQEuDAgmVGf+n8aUAxaqsjsYz2tXkP4Gmgeiy15zfA9FuwVCpGlnfPwJx5FbJk
         c4bKmjjTtRIxvdCwPJBuVBLmpxGFrGoVJPwcLR9Zi4HfW0xSYoOusLrZqey9g2FCwT5U
         XBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=SgNX52kvrZEZbJ83Eqba9crMV07w0pa5kBmivpD5OuQ=;
        b=UHnxJ0Dg4IC4xbyCabcWjyp7m07LEoHFfQdNrzYKmCS0z3U9y29IjvgPFqzE22/ahP
         lMs2duDm7GxJDYE9gdUmsZze939pEpy/Oa7cCIF9PB6Ip8IImyHezGHbzWs779ZiXrtv
         fbjXEkb7vIteE6UQcla/qtZ3S7xpW3UazU4A7LZgL/dGqnYBrUX6K+cTi+LZaa3uh1cF
         umu0x4ZRRxZR720UMb0cWH8MUZ5yD7yVOZzNsubkYeN0PkDTDZfFAfdOEGOkqvRVAmd0
         f8TCEUkqAFGmCyPsYqB3g5eK7QwCEaPtTAzavifKZwZdmbZ3ktH5ugOYk7CaSyqudRnL
         lvxg==
X-Gm-Message-State: AOAM533dLWrZyh5Q85Zz9l247pa2axvRVEJzuy4FU88ubwNg7aO2mnNx
        5yc8H30Kk8PTULuwhxmf6ws=
X-Google-Smtp-Source: ABdhPJwZTN2YRx29wQmZBTSAM29CwZZ6v5yr1XCB1vdnyGCJIB3yj+XaQ6QPVYNuuiMlpV5iRSy0dQ==
X-Received: by 2002:a63:36ce:: with SMTP id d197mr13144336pga.151.1622282642497;
        Sat, 29 May 2021 03:04:02 -0700 (PDT)
Received: from hyeyoo ([183.99.11.150])
        by smtp.gmail.com with ESMTPSA id o134sm6377612pfd.58.2021.05.29.03.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 03:04:02 -0700 (PDT)
Date:   Sat, 29 May 2021 19:03:57 +0900
From:   Hyeonggon Yoo <42.hyeyoo@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] HID: usbkbd: Avoid GFP_ATOMIC when GFP_KERNEL is possible
Message-ID: <20210529100357.GA46765@hyeyoo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

usb_kbd_alloc_mem is called in usb_kbd_probe, which is
not in atomic context. So constraints can be relaxed here.

Use GFP_KERNEL instead of GFP_ATOMIC.

Signed-off-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
---
 drivers/hid/usbhid/usbkbd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/usbkbd.c b/drivers/hid/usbhid/usbkbd.c
index e22434dfc9ef..df02002066ce 100644
--- a/drivers/hid/usbhid/usbkbd.c
+++ b/drivers/hid/usbhid/usbkbd.c
@@ -239,11 +239,11 @@ static int usb_kbd_alloc_mem(struct usb_device *dev, struct usb_kbd *kbd)
 		return -1;
 	if (!(kbd->led = usb_alloc_urb(0, GFP_KERNEL)))
 		return -1;
-	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_ATOMIC, &kbd->new_dma)))
+	if (!(kbd->new = usb_alloc_coherent(dev, 8, GFP_KERNEL, &kbd->new_dma)))
 		return -1;
 	if (!(kbd->cr = kmalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL)))
 		return -1;
-	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_ATOMIC, &kbd->leds_dma)))
+	if (!(kbd->leds = usb_alloc_coherent(dev, 1, GFP_KERNEL, &kbd->leds_dma)))
 		return -1;
 
 	return 0;
-- 
2.25.1

