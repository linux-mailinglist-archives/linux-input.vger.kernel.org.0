Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D367997C2E
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 16:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728641AbfHUOLm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 10:11:42 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:45146 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbfHUOLl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 10:11:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id y8so1393352plr.12
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 07:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KyagEtJwr97UZhdPVPlAODAj+hx3jo919OKvpo2MSic=;
        b=ojXjp/h8E1nyEqRFj88NYU1iP/VXNza9U3qHSeAnHpCRePXgEDOKJlEH+vJjoIojJc
         aariDNBTGPIbyAi8DVwCIk7dNDnPsGNa/+J2op6ch39qMx62W4MTga8yU89UJJNOAw4H
         ReumPDhO0Mv+g1GVxQzeEe+POilIwIHeo5n4TI3oa1G22t3v/MNmThRCzSW7yVuAcQPb
         +7Zjko62eAuUrhJizKPOAca13CGSnX1VFwlptMDB0FfpTyzO7pLjAQt5azwiTcnEy7h2
         T+9rpqC69SvUUt0Tx304zDAkH07R5BTZwfB+1Mj6COhs+eCy9T962CB6eEpG4xSiTYOY
         h3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KyagEtJwr97UZhdPVPlAODAj+hx3jo919OKvpo2MSic=;
        b=KEuYaas7MWjtpOUnd7ngnXxEg22qBX0jZSi4hAzHZ28VPf/gpFx2UD3sBS5ar2JnLQ
         GpKwOa6y2dKMeRpZX6SfEiLUVBXbSqqCM8hxTv7I0o456Ea2gxRS74nmzjs/akrd4c+u
         AZj1tgJMO+Iq9ks2HBFUCjFLCDuQ20f/qaX1fLM7rb68Vj95Nuea+xGCXmUYCqhJWFTc
         6HdcR1hAe0x++DBb3PDkDOSnsAYcMlxu0z18NKmsjRjH1QkSpCydnpA2ESgPbXxRxQ5d
         ftddb2gpMzjwpAGRBMljNuE99EaMyw42mNT90ycDLBkTEAZ6BBUSukPCs25u+Ftf236n
         t2Rg==
X-Gm-Message-State: APjAAAVwfjiFHnlgvffqcKkb4i46qrp9cDoBnf2ymUEJycUfeBWtd1k+
        CS4hYofJaffAjGgIi+O6SC8qyQEoVtjtDEfpJ8Lmbw==
X-Google-Smtp-Source: APXvYqyWV2KRIHOx8oe5wfeuOfF+QVP6oODv57mZnFYHI8bNSwb1xa/oOmvMoDGAUt8iKyhvezgFuKXNl5AlBcfpHJo=
X-Received: by 2002:a17:902:8649:: with SMTP id y9mr31542383plt.252.1566396700708;
 Wed, 21 Aug 2019 07:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908151333220.1343-100000@iolanthe.rowland.org> <Pine.LNX.4.44L0.1908201557220.1573-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908201557220.1573-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 16:11:29 +0200
Message-ID: <CAAeHK+wLYsc91CAdEO+mPhEH4ZzBhU35dQ7BNuDw8cwxGh0LkA@mail.gmail.com>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech driver
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 20, 2019 at 10:00 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> The syzbot fuzzer found a general protection fault in the HID subsystem:
>
> kasan: CONFIG_KASAN_INLINE enabled
> kasan: GPF could be caused by NULL-ptr deref or user memory access
> general protection fault: 0000 [#1] SMP KASAN
> CPU: 0 PID: 3715 Comm: syz-executor.3 Not tainted 5.2.0-rc6+ #15
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> RIP: 0010:__pm_runtime_resume+0x49/0x180 drivers/base/power/runtime.c:1069
> Code: ed 74 d5 fe 45 85 ed 0f 85 9a 00 00 00 e8 6f 73 d5 fe 48 8d bd c1 02
> 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48
> 89 fa 83 e2 07 38 d0 7f 08 84 c0 0f 85 fe 00 00 00
> RSP: 0018:ffff8881d99d78e0 EFLAGS: 00010202
> RAX: dffffc0000000000 RBX: 0000000000000020 RCX: ffffc90003f3f000
> RDX: 0000000416d8686d RSI: ffffffff82676841 RDI: 00000020b6c3436a
> RBP: 00000020b6c340a9 R08: ffff8881c6d64800 R09: fffffbfff0e84c25
> R10: ffff8881d99d7940 R11: ffffffff87426127 R12: 0000000000000004
> R13: 0000000000000000 R14: ffff8881d9b94000 R15: ffffffff897f9048
> FS:  00007f047f542700(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000001b30f21000 CR3: 00000001ca032000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   pm_runtime_get_sync include/linux/pm_runtime.h:226 [inline]
>   usb_autopm_get_interface+0x1b/0x50 drivers/usb/core/driver.c:1707
>   usbhid_power+0x7c/0xe0 drivers/hid/usbhid/hid-core.c:1234
>   hid_hw_power include/linux/hid.h:1038 [inline]
>   hidraw_open+0x20d/0x740 drivers/hid/hidraw.c:282
>   chrdev_open+0x219/0x5c0 fs/char_dev.c:413
>   do_dentry_open+0x497/0x1040 fs/open.c:778
>   do_last fs/namei.c:3416 [inline]
>   path_openat+0x1430/0x3ff0 fs/namei.c:3533
>   do_filp_open+0x1a1/0x280 fs/namei.c:3563
>   do_sys_open+0x3c0/0x580 fs/open.c:1070
>   do_syscall_64+0xb7/0x560 arch/x86/entry/common.c:301
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> It turns out the fault was caused by a bug in the HID Logitech driver,
> which violates the requirement that every pathway calling
> hid_hw_start() must also call hid_hw_stop().  This patch fixes the bug
> by making sure the requirement is met.
>
> Reported-and-tested-by: syzbot+3cbe5cd105d2ad56a1df@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> CC: <stable@vger.kernel.org>

This bug has manifested in a bunch of different ways and produced
multiple confusing syzbot reports. Thank you for tracking this down
and fixing it, Alan!


>
> ---
>
> [as1909]
>
>
>  drivers/hid/hid-lg.c    |   10 ++++++----
>  drivers/hid/hid-lg4ff.c |    1 -
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> Index: usb-devel/drivers/hid/hid-lg.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-lg.c
> +++ usb-devel/drivers/hid/hid-lg.c
> @@ -818,7 +818,7 @@ static int lg_probe(struct hid_device *h
>
>                 if (!buf) {
>                         ret = -ENOMEM;
> -                       goto err_free;
> +                       goto err_stop;
>                 }
>
>                 ret = hid_hw_raw_request(hdev, buf[0], buf, sizeof(cbuf),
> @@ -850,9 +850,12 @@ static int lg_probe(struct hid_device *h
>                 ret = lg4ff_init(hdev);
>
>         if (ret)
> -               goto err_free;
> +               goto err_stop;
>
>         return 0;
> +
> +err_stop:
> +       hid_hw_stop(hdev);
>  err_free:
>         kfree(drv_data);
>         return ret;
> @@ -863,8 +866,7 @@ static void lg_remove(struct hid_device
>         struct lg_drv_data *drv_data = hid_get_drvdata(hdev);
>         if (drv_data->quirks & LG_FF4)
>                 lg4ff_deinit(hdev);
> -       else
> -               hid_hw_stop(hdev);
> +       hid_hw_stop(hdev);
>         kfree(drv_data);
>  }
>
> Index: usb-devel/drivers/hid/hid-lg4ff.c
> ===================================================================
> --- usb-devel.orig/drivers/hid/hid-lg4ff.c
> +++ usb-devel/drivers/hid/hid-lg4ff.c
> @@ -1477,7 +1477,6 @@ int lg4ff_deinit(struct hid_device *hid)
>                 }
>         }
>  #endif
> -       hid_hw_stop(hid);
>         drv_data->device_props = NULL;
>
>         kfree(entry);
>
