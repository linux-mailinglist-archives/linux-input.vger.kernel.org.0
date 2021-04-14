Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC6F35EC50
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 07:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345352AbhDNFpv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 01:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233412AbhDNFpt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 01:45:49 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20449C061574
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 22:45:28 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id t11so6077795qtr.8
        for <linux-input@vger.kernel.org>; Tue, 13 Apr 2021 22:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HuJxIR2Vrwi/GT+ihhswEEVFoPc3SOlf/Ryp9WXFdGY=;
        b=qiMfUCeq8jVFRYBk+a7N+afSn80ZE6L00ud7EtXnexDUINcEqAct2+zx4SBIFW9564
         b3nhsNrvJkfcwXhXVxh1ol4MpYXx05i9I9I8SOBqTmUN8lsIOo/JdhxUpfzLLnkrqlDG
         QzLWQhjuMVu9GvyhqbRwmkeDikm8YDj51WB9173/b70clft6UOxotrUJjPpjma7a3lv6
         4+Zf2F4yc2o3z3+5AZILzpSlZxuVTLzLYD3VfUvhIwPk14hB7hMo39ZeYddYbd84lJ6k
         tsN7/3+GktCQkCli45D1c+Vlm71dyuQA0KMJp8kJiTJbUiaBsz18gM3YeRwrbvAPIbBX
         iv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HuJxIR2Vrwi/GT+ihhswEEVFoPc3SOlf/Ryp9WXFdGY=;
        b=Fuk8wPen0jUnJWzey2ANAUpzhgpQLDc8TVJRdZRvEvdDp+gpMX7fOyrJ7KDc8fNIv6
         75tWVR5GlknsDGRUUlNeQfBt8Xdi/6a2ZwYmbMc0fAsrwEQqJA1j36yv36Har/qxZxxw
         2yDDN68we5N7bn8YAh2p+/KtnyXVjH7E0BH/JI5fFI0NHoi8pbm7E68vXKTb4bC6dpks
         RYIRTX788aqmyLFUimXGjJi2pGXujMvH0gtlK6WxFGf00XUcdggqY/0EAdG0Hw6ugHYo
         MG0ad2xif1Hmo+eVpmHUhR20JAE6esNvvSiUN4DnJ4aF2CcGYNfLpxuMOnsfEiOLgnjc
         DRiQ==
X-Gm-Message-State: AOAM532yh7nbVU0I84bEj6t0jGb+stYugWt0xJwYZ1KwLlw1e2yd+Uri
        zshGklc2GD0rTtmiebGthnXpL3RVZ423hZ7qkKsFZg==
X-Google-Smtp-Source: ABdhPJz9BJrrUyL37nW6ECgf9eah2cTAPtH27QkThs1x3ikas9uTaxjoIG/q2FM/PF9WbynH3TxSJSmZrhlCjnmfxIA=
X-Received: by 2002:ac8:110d:: with SMTP id c13mr33362682qtj.337.1618379127178;
 Tue, 13 Apr 2021 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000301a4d05bfe14b8f@google.com>
In-Reply-To: <000000000000301a4d05bfe14b8f@google.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 14 Apr 2021 07:45:15 +0200
Message-ID: <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
Subject: Re: [syzbot] unexpected kernel reboot (4)
To:     syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 13, 2021 at 11:27 PM syzbot
<syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    89698bec Merge tag 'm68knommu-for-v5.12-rc7' of git://git=
...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1243fcfed0000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db234ddbbe2953=
747
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D9ce030d4c89856b=
27619
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D173e92fed00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1735da2ed0000=
0
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com
>
> output_len: 0x000000000e74eb68
> kernel_total_size: 0x000000000f226000
> needed_size: 0x000000000f400000
> trampoline_32bit: 0x000000000009d000
> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.

+linux-input

The reproducer connects some USB HID device and communicates with the drive=
r.
Previously we observed reboots because HID devices can trigger reboot
SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
How else can a USB device reboot the machine? Is it possible to disable it?
I don't see any direct includes of <linux/reboot.h> in drivers/usb/*

r0 =3D syz_usb_connect$hid(0x0, 0x36,
&(0x7f0000000000)=3DANY=3D[@ANYBLOB=3D"1201000000000e40260933334100001b0001=
0902240001000000000904000001030100000921100000012201000905810308"],
0x0)
syz_usb_control_io(r0, 0x0, 0x0)
syz_usb_control_io$hid(r0, &(0x7f0000001440)=3D{0x24, 0x0, 0x0,
&(0x7f0000000040)=3D{0x0, 0x22, 0x1, {[@local]}}, 0x0}, 0x0)
syz_usb_ep_write(r0, 0x0, 0xfd,
&(0x7f0000000b80)=3D"34981a23c3490d163907e65ff758478e74cd7dc073700ebf655f1c=
e3394018ade882075917a36a30ad3594f98282ea729f3620534fd655c69ebec66aa7397e843=
ee79879e825e6a31a189616c611912dee259ab9d8ff1566c90ae8985ec380bcab6b8265695f=
7b76654377adab6b1930de1f44060000000000000021f50f1dd3fff126f862f378ef2deb2d4=
331b9bcb3f394062133b4bb44a7f168473f7ca3d9945bfb4c456b22428a7a11d5d7df1fcc4f=
7ffad0e526d34321fb6aedfb5dd4fc6797cba2cf45369daea9f0953bf1a8343aa7548f3f981=
7c6a1bedde9dcaa4b8eed4a493828384fc9ccb7d230967ea0cb2003076ac7d9f386a5fbaec3=
92")



> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
