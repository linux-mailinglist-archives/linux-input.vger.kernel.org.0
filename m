Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB98727E770
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 13:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgI3LIS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 07:08:18 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:42187 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgI3LIJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 07:08:09 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe4c1769
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=erMBzehXuC+SfnHlrylUjqx4fTE=; b=29NiO5
        PCSuIyx1lixLnDdtwqNRJ6mCXis+TWJSJm3oH0SXlr6xdNmkNC1aXilccCLqtEmn
        sIxzhIxnginmTZ2CaZ0Kn7rsF0xsEwocAh8oR0GLm9bVgUwdOm2WyOLR0gub5TBG
        3gjYwGJh8zM9Aqdqr2amRdFPFRaSpXHjJ5xXPcw38rCeY33XTBQH9OYgwM/WJnWU
        JFyuOC/JQUX1eAUM9TutUrdx0sXWq7+97KY3jsxkDX9U5IX1VJhsLM33AypL79Sl
        awSXI1orDhevFCzjZarPsAcjYWbHe/pOKdS6uNv1sH5YtTSUt55ZIrQ2nGMNFpyG
        zMNWsHr9GgCPMRXg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0845658 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 10:36:23 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id c5so1181529ilk.11
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 04:08:06 -0700 (PDT)
X-Gm-Message-State: AOAM532SXPHFpg3ICTT1TJgvyNDunOmcdSiA3oXpvLe1ksAO2+SjKboG
        rxHuuLAkyaMz/iRvIahJz4SzCf4Mz/HSHKKz558=
X-Google-Smtp-Source: ABdhPJxFxnmJXigOuzphr8R0GBCfFp46O7fuKTDANV/7PM79NGZaUDtWtnOlDpFYcKEE9YRh958rau5ZLSiO5ec6yZU=
X-Received: by 2002:a92:d905:: with SMTP id s5mr1586131iln.224.1601464085224;
 Wed, 30 Sep 2020 04:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200925163602.204047-1-Jason@zx2c4.com>
In-Reply-To: <20200925163602.204047-1-Jason@zx2c4.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 30 Sep 2020 13:07:54 +0200
X-Gmail-Original-Message-ID: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
Message-ID: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics - enable InterTouch for ThinkPad X1E/P1
 2nd gen
To:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     Lyude Paul <lyude@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In addition to the dmesg warnings in the commit, I'm also getting this
null ptr dereference, presumably when dereferencing f34->, which is
NULL. Stack trace follows below, but it's pretty straightforward
what's happening. Seems like Vincent's recent patchset might need some
more work in being wired up with the f34 driver?

thinkpad /sys/devices/rmi4-00 # cat bootloader_id
Killed
thinkpad /sys/devices/rmi4-00 # cat configuration_id
(efault)

static ssize_t rmi_driver_bootloader_id_show(struct device *dev,
                                             struct device_attribute *dattr,
                                             char *buf)
{
        struct rmi_driver_data *data = dev_get_drvdata(dev);
        struct rmi_function *fn = data->f34_container;
        struct f34_data *f34;

        if (fn) {
                f34 = dev_get_drvdata(&fn->dev);

                if (f34->bl_version == 5)

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ f34-> dereferences

And then:

static ssize_t rmi_driver_configuration_id_show(struct device *dev,
                                               struct device_attribute *dattr,
                                               char *buf)
{
       struct rmi_driver_data *data = dev_get_drvdata(dev);
       struct rmi_function *fn = data->f34_container;
       struct f34_data *f34;

       if (fn) {
               f34 = dev_get_drvdata(&fn->dev);

               return scnprintf(buf, PAGE_SIZE, "%s\n", f34->configuration_id);

^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ f34-> dereferences

Same thing here, except scnprintf smartly just prints "(efault)".


[29815.060755] BUG: kernel NULL pointer dereference, address: 0000000000000008
[29815.060759] #PF: supervisor read access in kernel mode
[29815.060761] #PF: error_code(0x0000) - not-present page
[29815.060763] PGD 0 P4D 0
[29815.060768] Oops: 0000 [#1] SMP
[29815.060773] CPU: 8 PID: 399580 Comm: cat Tainted: P S   U  W  O
 5.9.0-rc7+ #143
[29815.060775] Hardware name: LENOVO 20QTCTO1WW/20QTCTO1WW, BIOS
N2OET47W (1.34 ) 08/06/2020
[29815.060789] RIP: 0010:rmi_driver_bootloader_id_show+0x1c/0x60 [rmi_core]
[29815.060793] Code: 48 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 49 89
f8 49 8b 40 78 48 89 d7 48 8b 50 20 31 c0 48 85 d2 74 2c 48 8b 82 90
00 00 00 <80> 78 08 05 44 0f b6 48 09 0f b6 48 0a 74 17 45 89 c8 48 c7
c2 8a
[29815.060796] RSP: 0018:ffff88888a2c3e38 EFLAGS: 00010286
[29815.060799] RAX: 0000000000000000 RBX: ffffffffa0405960 RCX: 0000000000000000
[29815.060801] RDX: ffff888fc51cb400 RSI: ffffffffa0405960 RDI: ffff8888b4366000
[29815.060803] RBP: 0000000000001000 R08: ffff888fc51cac00 R09: ffff8888b4366000
[29815.060805] R10: 000000000000eba8 R11: 0000000000001008 R12: ffffffff81c7bed0
[29815.060807] R13: ffff888fc51cac00 R14: ffff888dea8e2e40 R15: ffff888ff0bdb470
[29815.060810] FS:  00007f09168155c0(0000) GS:ffff888ffc400000(0000)
knlGS:0000000000000000
[29815.060813] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[29815.060815] CR2: 0000000000000008 CR3: 0000000dffa43001 CR4: 00000000003706e0
[29815.060817] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[29815.060819] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[29815.060820] Call Trace:
[29815.060831]  dev_attr_show+0x11/0x30
[29815.060837]  sysfs_kf_seq_show+0x8f/0xd0
[29815.060843]  seq_read+0xa3/0x400
[29815.060850]  vfs_read+0x94/0x180
[29815.060855]  ksys_read+0x4a/0xc0
[29815.060861]  do_syscall_64+0x2d/0x40
[29815.060866]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[29815.060869] RIP: 0033:0x7f091674145e
[29815.060873] Code: c0 e9 b6 fe ff ff 50 48 8d 3d be e0 09 00 e8 f9
e4 01 00 66 0f 1f 84 00 00 00 00 00 64 8b 04 25 18 00 00 00 85 c0 75
14 0f 05 <48> 3d 00 f0 ff ff 77 5a c3 66 0f 1f 84 00 00 00 00 00 48 83
ec 28
[29815.060875] RSP: 002b:00007ffffed954d8 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[29815.060879] RAX: ffffffffffffffda RBX: 0000000000020000 RCX: 00007f091674145e
[29815.060881] RDX: 0000000000020000 RSI: 00007f0916823000 RDI: 0000000000000003
[29815.060882] RBP: 00007f0916823000 R08: 00007f0916822010 R09: 0000000000000000
[29815.060884] R10: fffffffffffffbcf R11: 0000000000000246 R12: 0000000000000000
[29815.060886] R13: 0000000000000003 R14: 0000000000000000 R15: 0000000000020000
[29815.060968] CR2: 0000000000000008
[29815.060973] ---[ end trace ab9fd5f66457177d ]---
[29815.205960] RIP: 0010:rmi_driver_bootloader_id_show+0x1c/0x60 [rmi_core]
[29815.205965] Code: 48 98 c3 66 66 2e 0f 1f 84 00 00 00 00 00 49 89
f8 49 8b 40 78 48 89 d7 48 8b 50 20 31 c0 48 85 d2 74 2c 48 8b 82 90
00 00 00 <80> 78 08 05 44 0f b6 48 09 0f b6 48 0a 74 17 45 89 c8 48 c7
c2 8a
[29815.205965] RSP: 0018:ffff88888a2c3e38 EFLAGS: 00010286
[29815.205967] RAX: 0000000000000000 RBX: ffffffffa0405960 RCX: 0000000000000000
[29815.205967] RDX: ffff888fc51cb400 RSI: ffffffffa0405960 RDI: ffff8888b4366000
[29815.205968] RBP: 0000000000001000 R08: ffff888fc51cac00 R09: ffff8888b4366000
[29815.205968] R10: 000000000000eba8 R11: 0000000000001008 R12: ffffffff81c7bed0
[29815.205969] R13: ffff888fc51cac00 R14: ffff888dea8e2e40 R15: ffff888ff0bdb470
[29815.205970] FS:  00007f09168155c0(0000) GS:ffff888ffc400000(0000)
knlGS:0000000000000000
[29815.205971] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[29815.205971] CR2: 0000000000000008 CR3: 0000000dffa43001 CR4: 00000000003706e0
[29815.205972] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[29815.205972] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

On Fri, Sep 25, 2020 at 6:36 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> With the new RMI4 F3A support posted yesterday, this appears to maybe
> work, with a bootloader warning in dmesg:
>
>     psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4690]
>     psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1160..]
>     psmouse serio1: synaptics: Trying to set up SMBus access
>     rmi4_smbus 0-002c: registering SMbus-connected sensor
> --> rmi4_f34 rmi4-00.fn34: rmi_f34v7_probe: Unrecognized bootloader version
> --> rmi4_f34: probe of rmi4-00.fn34 failed with error -22
>     rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: Synaptics, product: TM3512-010, fw id: 2956703
>     input: Synaptics TM3512-010 as /devices/rmi4-00/input/input91
>     serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
>     psmouse serio4: trackpoint: Elan TrackPoint firmware: 0x11, buttons: 3/3
>     input: TPPS/2 Elan TrackPoint as /devices/rmi4-00/rmi4-00.fn03/serio4/input/input92
>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  drivers/input/mouse/synaptics.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> index 8a54efd6eb95..9d6fec84047b 100644
> --- a/drivers/input/mouse/synaptics.c
> +++ b/drivers/input/mouse/synaptics.c
> @@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
>         "LEN0096", /* X280 */
>         "LEN0097", /* X280 -> ALPS trackpoint */
>         "LEN0099", /* X1 Extreme 1st */
> +       "LEN0402", /* X1 Extreme 2nd */
>         "LEN009b", /* T580 */
>         "LEN200f", /* T450s */
>         "LEN2044", /* L470  */
> --
> 2.28.0
