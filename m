Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A03DF44FB9B
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 21:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235996AbhKNUkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 15:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234970AbhKNUkb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 15:40:31 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0562EC061746
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 12:37:35 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z5so2585695edd.3
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oHmAMav3MOPHrIfW7FO2eW1dSLP/t9SYbCRO3d9hWKM=;
        b=VmnXThrDWmHryB0TN9dL52YLoPFDDEa9SBj3qE2HfiiYfA85T1xXzedHLShI1oQOuE
         7CmSeFY29c889JJSNLLYB20D/HkBQfv/20kzy4WNghto9Su+lTA0w5fOBjD36X7YEoau
         q66tDUKlPTdIe2q9bE1dysb8ggjPZCiNxWsPXy/vO/bPeUsZVfNikpJGHJC51tlRu4GT
         8t30Hxnqm619biaJHVm1IUnZ/XwRBGyqjzsMt1iLSw3FhgEA5Ix5Z6OfMCCyzjkfcZDH
         sj7wFvIeKvd2fHe8rqCdXXkkYP9hswmcBzh5lYqx90vouPo153s+yk5bPGMd9tRWyZj1
         1raA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oHmAMav3MOPHrIfW7FO2eW1dSLP/t9SYbCRO3d9hWKM=;
        b=ZGhqcqrZRwwefUujFSPTxtvPSfn77c3gi2VcFWl0rShzulo8gzg/7NqMBzTW76z4Fu
         +cEe1s2RcQbP4FPFa0fHWbbBka3KNsRDkLj9aJ8oT0UDf5c8pZzFwCnzt/qeeYl5c20E
         e4vU4jF76s084zJhWEYmBKpwA03u/fHSClnCzfBbJpP+fBOGk3jmOn67oxTg0kyudXRm
         a2CCa+euJe95V5wrwisDPX3tIqdxJE2yzyY2ybVRQvIZaaZo9kq2JdZjkWd9/WM9A6Gm
         kS943DgrESiUCC9ookLXNMFSJkUZvwu+FHV8t2o5OOaVdih+QxgEntkDjX0i/EyylZRz
         pmiw==
X-Gm-Message-State: AOAM531dIYl4UwC53Hf9CWQmowFkI5Vh8jRg8Zf4l+oylFwCzKL6JAyO
        6xpI1SYJVXTkgS/yOx3S7pQEIEjnDCW4dw==
X-Google-Smtp-Source: ABdhPJwjFuRO/WhWTNstq0LQKNuFMmwhm2xin4GNnyPqLgncQ17N3UzYG03fzMMOkZAzUVNu+xYpGQ==
X-Received: by 2002:a05:6402:35c2:: with SMTP id z2mr47538451edc.135.1636922254489;
        Sun, 14 Nov 2021 12:37:34 -0800 (PST)
Received: from rechenknecht2k11 (200116b8456c370014a1cb2603939609.dip.versatel-1u1.de. [2001:16b8:456c:3700:14a1:cb26:393:9609])
        by smtp.googlemail.com with ESMTPSA id s12sm6119503edc.48.2021.11.14.12.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:37:34 -0800 (PST)
Date:   Sun, 14 Nov 2021 21:37:31 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: Re: Input: xpad - add more Xbox one controller IDs
Message-ID: <20211114213731.2573be3a@rechenknecht2k11>
In-Reply-To: <20211114205122.575567c6@rechenknecht2k11>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
        <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
        <20211114205122.575567c6@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 14 Nov 2021 20:51:22 +0100
Benjamin Valentin <benpicco@googlemail.com> wrote:

> The problem is that the gamepad then gets assigned the type
> XTYPE_UNKNOWN which excludes it from all run-time code path switches.

Ah sorry for the noise. xpad_probe() already takes care of detecting
the gamepad type for the XTYPE_UNKNOWN case.
And this works for my Xbox 360 pad - not sure what's wrong with jstest,
but that is unrelated.

To avoid that confusion, how about

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c914f75a902..155ee644295d 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
 @@ -1783,14 +1785,19 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 
 	if (xpad->xtype == XTYPE_UNKNOWN) {
 		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
-			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129)
+			if (intf->cur_altsetting->desc.bInterfaceProtocol == 129) {
 				xpad->xtype = XTYPE_XBOX360W;
-			else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208)
+				xpad->name = "Generic Xbox 360 wireless pad";
+			} else if (intf->cur_altsetting->desc.bInterfaceProtocol == 208) {
 				xpad->xtype = XTYPE_XBOXONE;
-			else
+				xpad->name = "Generic Xbox One pad";
+			} else {
 				xpad->xtype = XTYPE_XBOX360;
+				xpad->name = "Generic Xbox 360 pad";
+			}
 		} else {
 			xpad->xtype = XTYPE_XBOX;
+			xpad->name = "Generic Xbox classic pad";
 		}
 
 		if (dpad_to_buttons)


