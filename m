Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6299D81F8E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 16:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728855AbfHEOxb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 10:53:31 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35568 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728043AbfHEOxb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 10:53:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so4595910pgv.2
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3yrZtEjMZiA0RuhclX++rYTRWQZnWKq123k2rmttsIk=;
        b=YbOwPvWSkBrhOPFGfhuoQQPskms6KscbpIqua0m31ZzcLeCky60r4lgjY3QT9BleZQ
         0sfifuIXXoh9U4S+he2BNUzLIZeS/d+hxdMRHzqR3BSXXv/VQOBtHNqelkqGtE/MZro0
         EeQq+xKMO7qt9BUrU01mXGptULKI9uzQ4wQpverDIpKLAR65B+vOxYyuzaFTdzuvEfwK
         f83jr6Ypn6LlwQm1wam9CI/pi/DRdEMFJYNKBgDSUCMmKJmdQIDeura9CfUN8fhDHcbk
         I4Ol2cQyVamPqHWEk8LRv/0RRuarQ2ITIUvs6cIPjv0N94rWJHQYAug364UqLYeaXBTh
         FNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3yrZtEjMZiA0RuhclX++rYTRWQZnWKq123k2rmttsIk=;
        b=SyxIGwBc2GZD4qbhgpEcBMtY4iS5huc1B2fhWqbHaojo3L1AockD7HCRJwt4O/SIbA
         4T4a/K+xvom8oaBGPJ/fL42ave8+ddxLFyr7sE2knBz792ub44sJiBsTg7jH2lvHQK5g
         tdbovKj44e/GwepNm2sqFn+FEc8W05MiR/I9K4FTr7iTtGhMVYrcAPjMViTj4vbNI3DZ
         fDhyZ3GtBacPgDnRAkaeex+xkSdU3V5I0MNtqeLr8zSXnEdB4T9lGPI9a6RWcDl/0JAf
         Ap+Y7zVm5LWRMOG9UyzfsfAsDCwFN48YsLHxV2bccNswkbcVOqMdF3tX378kgdYjsBb7
         yChA==
X-Gm-Message-State: APjAAAV/xHjveFGplFGJnhZFaS9DrJeRgV0OmvAiPpeB1VVwXAW2TM0L
        9tmoozsM/AQlJJ6beu9yLGhcDo6IHMdFq87f5Zy7BQ==
X-Google-Smtp-Source: APXvYqzzlBk6DPv8RuMCq7E9sUUUfAZEHeUAkO0PI0d+zpxQGbkl33n+v77hL+by703BxRqjh6GOhjnkMC5r6XjLWeM=
X-Received: by 2002:a17:90a:a116:: with SMTP id s22mr18407803pjp.47.1565016810082;
 Mon, 05 Aug 2019 07:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000e5742c058f5dfaef@google.com> <1565014816.3375.1.camel@suse.com>
In-Reply-To: <1565014816.3375.1.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 5 Aug 2019 16:53:18 +0200
Message-ID: <CAAeHK+wS2YNDgtjQ-piggaMoYTVdKrYkn=iE=G8psEHRvPYK4w@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in lg4ff_init
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 5, 2019 at 4:34 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 05.08.2019, 05:38 -0700 schrieb syzbot:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=144c21dc600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=94e2b9e9c7d1dd332345
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169e8542600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ec8262600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com
> >
> > usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,
> > different from the interface descriptor's value: 9
> > usb 1-1: New USB device found, idVendor=046d, idProduct=c298, bcdDevice=
> > 0.00
> > usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > usb 1-1: config 0 descriptor??
> > logitech 0003:046D:C298.0001: unknown main item tag 0x0
> > logitech 0003:046D:C298.0001: unknown main item tag 0x0
> > logitech 0003:046D:C298.0001: hidraw0: USB HID v0.00 Device [HID 046d:c298]
> > on usb-dummy_hcd.0-1/input0
> > BUG: KASAN: slab-out-of-bounds in set_bit
> > include/asm-generic/bitops-instrumented.h:28 [inline]
>
> #syz test: https://github.com/google/kasan.git e96407b4
>
> From 7e7f8ce9108b69613f8bb4ff2f95c258e22c3228 Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Mon, 5 Aug 2019 16:14:47 +0200
> Subject: [PATCH] hid-lg4ff: sanity check for offsets of FF effects
>
> Malicious devices could provide huge offsets which would lead
> to setting bits in random kernel memory. Adding a sanity check.
>
> Reported-by: syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/hid/hid-lg4ff.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> index cefba038520c..f9572750d889 100644
> --- a/drivers/hid/hid-lg4ff.c
> +++ b/drivers/hid/hid-lg4ff.c
> @@ -1327,8 +1327,12 @@ int lg4ff_init(struct hid_device *hid)
>         }
>
>         /* Set supported force feedback capabilities */
> +       error = -ENODEV;
>         for (j = 0; lg4ff_devices[i].ff_effects[j] >= 0; j++)
> -               set_bit(lg4ff_devices[i].ff_effects[j], dev->ffbit);
> +               if (lg4ff_devices[i].ff_effects[j] <= 15)

Can't ff_effects have one of the FF_CONSTANT, FF_PERIODIC, etc.
values? Those are 0x50, 0x51, ... Or maybe I'm just misunderstanding
something. Are those ff_effects provided by the device?

> +                       set_bit(lg4ff_devices[i].ff_effects[j], dev->ffbit);
> +               else
> +                       goto err_init;
>
>         error = input_ff_create_memless(dev, NULL, lg4ff_play);
>
> --
> 2.16.4
>
