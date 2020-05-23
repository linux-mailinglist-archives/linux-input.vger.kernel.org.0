Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0661DFB21
	for <lists+linux-input@lfdr.de>; Sat, 23 May 2020 23:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388001AbgEWVSp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 May 2020 17:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387586AbgEWVSp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 May 2020 17:18:45 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A14BC061A0E
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 14:18:45 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id 124so479579pgi.9
        for <linux-input@vger.kernel.org>; Sat, 23 May 2020 14:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9jv4udf0l+XW7VWYmxXWSggBd4riECC547Cyi5R9Vqc=;
        b=tsgwPyk+oS7cD58ob8gppNvfyZRoegw5L5L7RdorLuCTAQjuyz3Vqe5w9Lw7gpFr5k
         tD63EIBDkH06Tl3aqJrlA3EQJxxaYuE84mxRB8l3x9VT/stjungDsVPByJSOySUG9d9N
         u97fJ6zGPp/DseBx518Bw5mokfBWnn4XIp0hroqb+u4PTuicFd4qn6nMGtKliwNc7qXF
         a/zDneq9CTmn/+A4eoaAdpjYjAeh99bGkyUOV8zhxSx0lUQHKPlEF/ek4ZybVGddzIrC
         8DL+xaGBGWsnN8XPleUZ5+3YrRyQRmqhYhqIHc2vDUayjqxSxvt4+hFuPfhSgtzQeIAg
         7ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9jv4udf0l+XW7VWYmxXWSggBd4riECC547Cyi5R9Vqc=;
        b=qkaSUGQikEijR0MvFGqxdrQ3dwWO75/v+SQYxXYncmEFLTw3IsGxaAVMaRirqxvSeD
         hxN3bpm8JTPoRz6Jn99RQOiwiBfpvuT7SRtsN2nN9aKFir827K2aNgsCs4dfmRoCLew3
         Z33PWQ9CHTey1OLTiYzIvaRIhsTbdW2mU0ACsC0f537VmAxq7fdIu7nH0sCqCbRx0LjA
         jPLW5i3H+csloUu12eEMCoUuYkzbcKbatPLYKoKrSsly//t8ToCyic74JgIuwsYkXfgF
         aO7CuP5twKiEpkxJ1rC4imc5kGWnXzcBZpteRKqP3nTr/I2+JZFmweVDklpEI/s0wkuv
         kPDw==
X-Gm-Message-State: AOAM531WbCAcIHc2eZ90p7Ht2q0lm+n2YZjSWmztLL5xzwzJuW9YzaYn
        e1vkncCAJ8I6bA7+g1HDFoHTGuPe
X-Google-Smtp-Source: ABdhPJziHxjbFV43pHmx0sVrLK8KwrRQY3wSwDGpihR7RMjhOSwbkUqC4pJs1Z5Tns8S6tJmX4D4rw==
X-Received: by 2002:a65:6459:: with SMTP id s25mr19727632pgv.329.1590268724536;
        Sat, 23 May 2020 14:18:44 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c7sm2499201pjr.32.2020.05.23.14.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 14:18:44 -0700 (PDT)
Date:   Sat, 23 May 2020 14:18:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yariv <oigevald+kernel@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: PROBLEM: Apple external Trackpad event timestamps are jittery
 (regression)
Message-ID: <20200523211841.GD89269@dtor-ws>
References: <CAEwx+QrfLk4SR=yn4Df3rD_Lm0Xht1hgAi4szmOTU1nkFhMwhw@mail.gmail.com>
 <20200511201118.GW89269@dtor-ws>
 <20200512051925.GA48688@koala>
 <CAEwx+QpN7c4i4qRfaVAP6yPFoydQ+W_0DOsv-NfgwU8Zb1BVZQ@mail.gmail.com>
 <CAEwx+QowRY3UTkFcwFvOD3h0=ejZSLL3miFQzdOMNT84w86M6g@mail.gmail.com>
 <20200523183734.GC89269@dtor-ws>
 <CAEwx+Qr=nJ0tPcuHhjO4=Mw_OHr17QcqeqTvcEzgZ0EcoNc8GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEwx+Qr=nJ0tPcuHhjO4=Mw_OHr17QcqeqTvcEzgZ0EcoNc8GQ@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 23, 2020 at 10:11:50PM +0300, Yariv wrote:
> Hi,
> 
> I omitted what looks unrelated, please let me know if you need other
> details or the full content.
> Also I wasn't sure how to find the relevant driver, so I pasted the
> relevant dmesg snippets. If there is a more precise way to identify
> the driver please let me know and I'll send the missing items.
> 
> Gen1:
> 
> dmesg
> 
> [   11.307056] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> [   11.307060] Bluetooth: HIDP socket layer initialized
> [   11.310541] magicmouse 0005:05AC:030E.0005: unknown main item tag 0x0
> [   11.310657] input: john’s Trackpad as
> /devices/pci0000:00/0000:00:14.0/usb1/1-13/1-13:1.0/bluetooth/hci0/hci0:70/0005:05AC:030E.0005/input/input21
> [   11.310776] magicmouse 0005:05AC:030E.0005: input,hidraw4:
> BLUETOOTH HID v1.60 Mouse [john’s Trackpad] on 00:1a:7d:da:71:09

Ok, awesome. Can you please try the patch below?

-- 
Dmitry

HID: magicmouse: do not set up autorepeat

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Neither trackpad, nor the mouse want input core to generate autorepeat
events for their buttons, so let's reset the bit (as hid-input sets it
for these devices based on the usage vendor code).

Reported-by: Yariv <oigevald+kernel@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-magicmouse.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
index 34138667f8af..7ea78be11c84 100644
--- a/drivers/hid/hid-magicmouse.c
+++ b/drivers/hid/hid-magicmouse.c
@@ -535,6 +535,12 @@ static int magicmouse_setup_input(struct input_dev *input, struct hid_device *hd
 		__set_bit(MSC_RAW, input->mscbit);
 	}
 
+	/*
+	 * hit-input may mark device as using autorepeat, but neither
+	 * the trackpad, nor the mouse actually want it.
+	 */
+	__clear_bit(EV_REP, input->evbit);
+
 	return 0;
 }
 
