Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC7D62E04AF
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 04:23:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgLVDW5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Dec 2020 22:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgLVDW5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Dec 2020 22:22:57 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79BAC0613D3
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 19:22:16 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id b9so8181901qtr.2
        for <linux-input@vger.kernel.org>; Mon, 21 Dec 2020 19:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YGkAsnFjTHhG/RBSMPSnDqLMbnWSi3P5cKmZXZ+oYs=;
        b=WNwu7+fBmPwSyabZ+MXoTK8y8ji2zV2VL84hNIwHyv+EQX50OvKwHwhjukjfnSVo2l
         +vAptFEJr2U7fIJAfEqUbMRgRdmvsy18XaR10jecZ9k8LUmniM6a7GJ7gOJIDs7HxSgs
         P3OIomqVpUE0PwzhJtutrkIiWi9fMDyx1XYXRS3i4AIBmzGZjTDGF9GthdmLmlpaEf4o
         pOSQvmRoF1ZXkHKH4Qw0oetxdPjR2MIsUtBBFfQq6SZujQUQ/s3e0vq/rdvEcH7MZ/Z6
         Axuqr9F9b71zI1WdAZr2Xu2h/wT5zGlVpQzd4y19/AMhI268Bz4vXUjVacX3pZsDKv1M
         ys3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YGkAsnFjTHhG/RBSMPSnDqLMbnWSi3P5cKmZXZ+oYs=;
        b=LHJS2En2cjBtfAlhYj2xLLoi9JGe3HJVjOW+IQ8c8Znfc40/xlx581oj2B7iLRrXD3
         uWn+oZ4Z/8SnIZo5F3MkDJd0lW/tIEu/B4OThQNtG/n+irUHZKXgbWTDuUu4whRxZvzY
         rEW8z5em3eY8R6vdx6z0Xe9bLkdnRIPeXtfVSFIqm3maqozaBV4BNdgXjLjaWI+ZnYB2
         BxojKCZeyCQxPo+P2K8jO8ef7JcegXOqQLGaciubmGf6J+l473zoNHLnJStnZHIXXmNC
         0erRso/Bk1LuStv1qttOfoHob93vjGRKf7pR3e+MHCUr8EQ2N3g5hI+T0+XFlx7GZort
         PcHg==
X-Gm-Message-State: AOAM533aZQxdkBheVlY0qnG2ab+vaakDYqD7avELcJHrywv0oRnKczMn
        8WWx2QooCSFgWxaMaXQ70bZWBzA05FgW3Oluw+Y=
X-Google-Smtp-Source: ABdhPJzg9a57xVV2jE6IELWwr1tluUgD2QvfpKGGWtejZqAcc7MShbA2Womsesp9CZiQfgAgmYMWE4DrOMwKHBcykPk=
X-Received: by 2002:ac8:44a2:: with SMTP id a2mr19369371qto.91.1608607335983;
 Mon, 21 Dec 2020 19:22:15 -0800 (PST)
MIME-Version: 1.0
References: <20201210045230.26343-1-ping.cheng@wacom.com>
In-Reply-To: <20201210045230.26343-1-ping.cheng@wacom.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Mon, 21 Dec 2020 19:22:04 -0800
Message-ID: <CAF8JNh+yARDrw1ViUKcaK_zFrZJGWdTUmSJr09QQhiKY10z=xg@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Fix memory leakage caused by kfifo_alloc
To:     Jiri Kosina <jkosina@suse.cz>
Cc:     Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi @Jiri Kosina,

Does this patch work for you? Is there anything else you'd like me to
change for the patch?

Thank you,
Ping

On Wed, Dec 9, 2020 at 8:52 PM Ping Cheng <pinglinux@gmail.com> wrote:
>
> As reported by syzbot below, kfifo_alloc'd memory would not be freed
> if a non-zero return value is triggered in wacom_probe. This patch
> creates and uses devm_kfifo_alloc to allocate and free itself.
>
> BUG: memory leak
> unreferenced object 0xffff88810dc44a00 (size 512):
>   comm "kworker/1:2", pid 3674, jiffies 4294943617 (age 14.100s)
>   hex dump (first 32 bytes):
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>    [<0000000023e1afac>] kmalloc_array include/linux/slab.h:592 [inline]
>    [<0000000023e1afac>] __kfifo_alloc+0xad/0x100 lib/kfifo.c:43
>    [<00000000c477f737>] wacom_probe+0x1a1/0x3b0 drivers/hid/wacom_sys.c:2727
>    [<00000000b3109aca>] hid_device_probe+0x16b/0x210 drivers/hid/hid-core.c:2281
>    [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
>    [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>    [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
>    [<00000000efb7c59e>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
>    [<0000000024ab1590>] __device_attach+0x122/0x250 drivers/base/dd.c:912
>    [<000000004c7ac048>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
>    [<00000000b93050a3>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
>    [<00000000e5b46ea5>] hid_add_device+0x151/0x390 drivers/hid/hid-core.c:2437
>    [<00000000c6add147>] usbhid_probe+0x412/0x560 drivers/hid/usbhid/hid-core.c:1407
>    [<00000000c33acdb4>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
>    [<00000000aff7c640>] really_probe+0x159/0x480 drivers/base/dd.c:554
>    [<00000000778d0bc3>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
>    [<000000005108dbb5>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
>
> https://syzkaller.appspot.com/bug?extid=5b49c9695968d7250a26
>
> Reported-by: syzbot+5b49c9695968d7250a26@syzkaller.appspotmail.com
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> ---
>  drivers/hid/wacom_sys.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index cd71e7133944..9e852b4bbf92 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -1270,6 +1270,37 @@ static int wacom_devm_sysfs_create_group(struct wacom *wacom,
>                                                group);
>  }
>
> +static void wacom_devm_kfifo_release(struct device *dev, void *res)
> +{
> +       struct kfifo_rec_ptr_2 *devres = res;
> +
> +       kfifo_free(devres);
> +}
> +
> +static int wacom_devm_kfifo_alloc(struct wacom *wacom)
> +{
> +       struct wacom_wac *wacom_wac = &wacom->wacom_wac;
> +       struct kfifo_rec_ptr_2 *pen_fifo = &wacom_wac->pen_fifo;
> +       int error;
> +
> +       pen_fifo = devres_alloc(wacom_devm_kfifo_release,
> +                             sizeof(struct kfifo_rec_ptr_2),
> +                             GFP_KERNEL);
> +
> +       if (!pen_fifo)
> +               return -ENOMEM;
> +
> +       error = kfifo_alloc(pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
> +       if (error) {
> +               devres_free(pen_fifo);
> +               return error;
> +       }
> +
> +       devres_add(&wacom->hdev->dev, pen_fifo);
> +
> +       return 0;
> +}
> +
>  enum led_brightness wacom_leds_brightness_get(struct wacom_led *led)
>  {
>         struct wacom *wacom = led->wacom;
> @@ -2724,7 +2755,7 @@ static int wacom_probe(struct hid_device *hdev,
>         if (features->check_for_hid_type && features->hid_type != hdev->type)
>                 return -ENODEV;
>
> -       error = kfifo_alloc(&wacom_wac->pen_fifo, WACOM_PKGLEN_MAX, GFP_KERNEL);
> +       error = wacom_devm_kfifo_alloc(wacom);
>         if (error)
>                 return error;
>
> @@ -2786,8 +2817,6 @@ static void wacom_remove(struct hid_device *hdev)
>
>         if (wacom->wacom_wac.features.type != REMOTE)
>                 wacom_release_resources(wacom);
> -
> -       kfifo_free(&wacom_wac->pen_fifo);
>  }
>
>  #ifdef CONFIG_PM
> --
> 2.17.1
>
