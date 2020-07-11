Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D627921C6C2
	for <lists+linux-input@lfdr.de>; Sun, 12 Jul 2020 01:55:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgGKXzH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Jul 2020 19:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbgGKXzH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Jul 2020 19:55:07 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFF64C08C5DD;
        Sat, 11 Jul 2020 16:55:06 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e4so10573824ljn.4;
        Sat, 11 Jul 2020 16:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E9dH9xs0WOC7kOt2IbwahbmPC33CGD8YY7xKZOFfTBQ=;
        b=sHjyPED15yrfHyhsVLnPdupQLP3/g8GVPQemwRNJGA6EDHCMR1CO71/o0kZ2Oz8Kav
         r488SxyoTCtqoTDxMOnAw4Irp285Yny/3CQjl+Tgr8eNPOJRGMR6Bd8WT5qSEHsFqR7S
         Lv9GIKHOffRTtZgf1ifqVT/fhQN2Fy+edkkHyKEN3n0zVTowj5Qz4xd9Pz4gEfx2714i
         sVnxzrqJSeaH/h0Dui8s9AFKu7WkbWc1FlhEUwK8RRrx3tFuW+o7CmIyuua+CCyPZTJP
         2s5igv6p8F2/Rh/jzoajWl2s+yEUyEjUt0zuzmdPJkDS8e85hYwFPtKKV3fmXED7ICXj
         sFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E9dH9xs0WOC7kOt2IbwahbmPC33CGD8YY7xKZOFfTBQ=;
        b=QbnDbCQBfdLY81LIrVUZG4VLtOuQtvOwYkxZpGkOJHblx7P2tfq7IsgDC54L9Z+Cbk
         rKc06WXDFj0RCrJtRm05jwVsalziW2Cr0EctR05nfqZwhvQVhmvgHGdqaCO2v/8ml/TD
         5q9ggKDqPgjWv9wnobruY7dXxriGlVMVhgq9vSUmN/eJ63a3wf5jjmiyQLoa7n7ce2Ko
         QVXGalQE11QRG2msi1d+zucTwvzyE894pU+jgQ22xCHE8S925e80zp3i843PWCreErTP
         uXWXwUavPYDLIl5r0XXoeCthb4emYCKPYH8WFCeX4e20ym6jZLrHcKh8Th2rqOegiTyC
         SOlw==
X-Gm-Message-State: AOAM531jxYL+iWalq4UstVvHvV0yuf1rGPWxDcg9H0PqmG+R6yJnePz3
        a8BtVqrjmXBfTTyvaUznbMiFRRVYh/3OWRrM7ZhCzR1E7Nw=
X-Google-Smtp-Source: ABdhPJxjD0K7f0vNG0otnFa0TzRqm8fcm99gbNPJ3m//mFp9ZflKoKVmrPeSmnChE3vkedJvYvRkJK+4D/f8GHWmvpk=
X-Received: by 2002:a2e:954c:: with SMTP id t12mr43979065ljh.287.1594511705088;
 Sat, 11 Jul 2020 16:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <cpuwolf@gmail.com> <20200710065112.18286-1-cpuwolf@gmail.com>
In-Reply-To: <20200710065112.18286-1-cpuwolf@gmail.com>
From:   Wei Shuai <cpuwolf@gmail.com>
Date:   Sun, 12 Jul 2020 07:54:54 +0800
Message-ID: <CACa7zykn0q9XJAUvrqnNATr4DUv3Kc7XujF3vm6sfRB5pE6YNQ@mail.gmail.com>
Subject: [PATCH] Input: break joystick limitation of maximum 80 buttons
To:     "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     cpuwolf <cpuwolf@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Borislav Petkov <bp@suse.de>, Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Erwan Velu <e.velu@criteo.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The joystick max buttons 80 limitation comes from

#define BTN_JOYSTICK 0x120
#define BTN_DEAD 0x12f
#define BTN_TRIGGER_HAPPY 0x2c0
#define KEY_MAX 0x2ff

include/uapi/linux/input-event-codes.h

according to function hidinput_configure_usage() in file drivers/hid/hid-input.c

the joystick button mapping is not a continues space
generally speaking, the mapping space is from

1. BTN_JOYSTICK~BTN_DEAD
2. BTN_TRIGGER_HAPPY~KEY_MAX

Finally, I got the max limitation is 80.
The patch is expanding KEY_MAX from 0x2ff to 4ff
and the change has been verified on 104 button USB HID device on Ubuntu

Signed-off-by: Wei Shuai <cpuwolf@gmail.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 8d764aab29de..35eb59ae1f19 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -311,7 +311,7 @@ struct pcmcia_device_id {
 /* Input */
 #define INPUT_DEVICE_ID_EV_MAX         0x1f
 #define INPUT_DEVICE_ID_KEY_MIN_INTERESTING    0x71
-#define INPUT_DEVICE_ID_KEY_MAX                0x2ff
+#define INPUT_DEVICE_ID_KEY_MAX                0x4ff
 #define INPUT_DEVICE_ID_REL_MAX                0x0f
 #define INPUT_DEVICE_ID_ABS_MAX                0x3f
 #define INPUT_DEVICE_ID_MSC_MAX                0x07
diff --git a/include/uapi/linux/input-event-codes.h
b/include/uapi/linux/input-event-codes.h
index b6a835d37826..ad1b9bed3828 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -774,7 +774,7 @@

 /* We avoid low common keys in module aliases so they don't get huge. */
 #define KEY_MIN_INTERESTING    KEY_MUTE
-#define KEY_MAX                        0x2ff
+#define KEY_MAX                        0x4ff
 #define KEY_CNT                        (KEY_MAX+1)

 /*
--
2.17.1
