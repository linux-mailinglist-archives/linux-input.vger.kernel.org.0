Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 581DD97A1A
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 14:58:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728748AbfHUM63 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 08:58:29 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33900 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728610AbfHUM63 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 08:58:29 -0400
Received: by mail-pg1-f194.google.com with SMTP id n9so1294035pgc.1
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 05:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zzjVSD5kF7kKUBdGApC/vg4IsR41um/NQSI7oP/0cpg=;
        b=VLAOmTam/QeWUx9Y2O4P3MGy+lhUyF10ri0jLbWhRS5OcXMa/fxG3SXrcRdmG3mQOK
         LPU6RaU32rKff0fGIwL+K6XKwmjvhRSA3FQDU+gCmG/eXvhRhBVPAPBkokmjDIyFlMzE
         XALLbTb8JMvptvN9SL0GqgeZaV1qDiKbr8LXfp2EvZou3iGfSNSTNOcuyfA2f40yL0ig
         ubiIpq4UHcAve5GIPdEZ7dvS7JK9BHAtCoqHCu+OMhSaweuekkInLmm1xIq6G+ZZ/U5y
         jdq0TS3EG6K1M7BrV6CRnAnHNQUi+ykTtJqi+WNvUvoar1n6CmJMr1esEiF1U64RAN0A
         Ww4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zzjVSD5kF7kKUBdGApC/vg4IsR41um/NQSI7oP/0cpg=;
        b=liN8kBHdAo5xt1bsHaaItR6aLzFyXR9g8CyFPv8e6yKdNqC6AiDSu9sX/HcIQHvd0I
         WCtdYneTwdJHUHDEewFap0v+bII55wNmN1d1qKrsf1tJ1udyGKFvR3Z6JOFkAV7Wdg3l
         f61ppSCnXl8QGGg4KbEvhhUXD6V8UAGFlh30DQwGeQ7xPgmQtcS+PJeRWVy9mWU65Q+D
         h0FlebZT30NZeFXHhEMrG95jLobw3evL0SskCMdOlBZS1sK/XJYhUhnYyl0CQq4IuCxG
         F4prXpdLxtUfTOMbjslvuG/burxf8DVN6l0i58IKi55ztnhV3Pslxq3PbDo4jFQ5fDiY
         XEOw==
X-Gm-Message-State: APjAAAXkC1Qnn+wgXw9kwTunUuKr7XoYK5IeUonFK8xYA50h2CSlH5rM
        kNngwbVWv+irTasPa4TT710oCTXWso7OPPpFkwzs47ezO/VHWw==
X-Google-Smtp-Source: APXvYqw9qC4gxMoUNmG1B/GGAAmzF+VEa9Qciwt2S99kQ6jWdnqMdcuLFenkRIVSYvmYqFhlcoA5LHtBKuFho5tuSaE=
X-Received: by 2002:a63:c442:: with SMTP id m2mr8736864pgg.286.1566392307855;
 Wed, 21 Aug 2019 05:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000008b8c6058ee52407@google.com> <00000000000016c09c058fdd7faa@google.com>
 <CAAeHK+zeN+bLTix2yaWDo-iu_G4D8T1KELjds=KVTtywiPpc4g@mail.gmail.com>
In-Reply-To: <CAAeHK+zeN+bLTix2yaWDo-iu_G4D8T1KELjds=KVTtywiPpc4g@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 14:58:16 +0200
Message-ID: <CAAeHK+x-q8u_-qyc6=5QjuLAtQafOftdmK_JEFVrvzjmowf2Ow@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
To:     syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: multipart/mixed; boundary="0000000000001875f50590a021fd"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--0000000000001875f50590a021fd
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 21, 2019 at 2:57 PM Andrey Konovalov <andreyknvl@google.com> wrote:
>
> On Sun, Aug 11, 2019 at 10:46 PM syzbot
> <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has found a reproducer for the following crash on:
> >
> > HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=150426ba600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > dashboard link: https://syzkaller.appspot.com/bug?extid=5a6c4ec678a0c6ee84ba
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12725c02600000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=162163c2600000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in strlen+0x79/0x90 lib/string.c:525
> > Read of size 1 at addr ffff8881d29bdf38 by task syz-executor201/1726
> >
> > CPU: 1 PID: 1726 Comm: syz-executor201 Not tainted 5.3.0-rc2+ #25
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x6a/0x32c mm/kasan/report.c:351
> >   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
> >   kasan_report+0xe/0x12 mm/kasan/common.c:612
> >   strlen+0x79/0x90 lib/string.c:525
> >   strlen include/linux/string.h:281 [inline]
> >   hidraw_ioctl+0x245/0xae0 drivers/hid/hidraw.c:446
> >   vfs_ioctl fs/ioctl.c:46 [inline]
> >   file_ioctl fs/ioctl.c:509 [inline]
> >   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
> >   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
> >   __do_sys_ioctl fs/ioctl.c:720 [inline]
> >   __se_sys_ioctl fs/ioctl.c:718 [inline]
> >   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
> >   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x445679
> > Code: e8 5c ad 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7
> > 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> > ff 0f 83 9b cd fb ff c3 66 2e 0f 1f 84 00 00 00 00
> > RSP: 002b:00007ffc8514f3a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000445679
> > RDX: 0000000000000000 RSI: 0000000080404805 RDI: 0000000000000004
> > RBP: 00000000006d0018 R08: 000000000000000b R09: 00000000004002e0
> > R10: 000000000000000f R11: 0000000000000246 R12: 00000000004028a0
> > R13: 0000000000402930 R14: 0000000000000000 R15: 0000000000000000
> >
> > Allocated by task 0:
> > (stack is not available)
> >
> > Freed by task 0:
> > (stack is not available)
> >
> > The buggy address belongs to the object at ffff8881d29bde60
> >   which belongs to the cache shmem_inode_cache of size 1168
> > The buggy address is located 216 bytes inside of
> >   1168-byte region [ffff8881d29bde60, ffff8881d29be2f0)
> > The buggy address belongs to the page:
> > page:ffffea00074a6f00 refcount:1 mapcount:0 mapping:ffff8881da115180
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da115180
> > raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >   ffff8881d29bde00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >   ffff8881d29bde80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > > ffff8881d29bdf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >                                          ^
> >   ffff8881d29bdf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >   ffff8881d29be000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ==================================================================
> >
>
> Trying Alan's fix from another thread here:
>
> #syz test: https://github.com/google/kasan.git usb-fuzzer e96407b4

><

#syz test: https://github.com/google/kasan.git e96407b4

--0000000000001875f50590a021fd
Content-Type: text/x-patch; charset="US-ASCII"; name="logitech.patch"
Content-Disposition: attachment; filename="logitech.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jzl9j2ej0>
X-Attachment-Id: f_jzl9j2ej0

SW5kZXg6IHVzYi1kZXZlbC9kcml2ZXJzL2hpZC9oaWQtbGcuYwo9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSB1c2It
ZGV2ZWwub3JpZy9kcml2ZXJzL2hpZC9oaWQtbGcuYworKysgdXNiLWRldmVsL2RyaXZlcnMvaGlk
L2hpZC1sZy5jCkBAIC04MTgsNyArODE4LDcgQEAgc3RhdGljIGludCBsZ19wcm9iZShzdHJ1Y3Qg
aGlkX2RldmljZSAqaAogCiAJCWlmICghYnVmKSB7CiAJCQlyZXQgPSAtRU5PTUVNOwotCQkJZ290
byBlcnJfZnJlZTsKKwkJCWdvdG8gZXJyX3N0b3A7CiAJCX0KIAogCQlyZXQgPSBoaWRfaHdfcmF3
X3JlcXVlc3QoaGRldiwgYnVmWzBdLCBidWYsIHNpemVvZihjYnVmKSwKQEAgLTg1MCw5ICs4NTAs
MTIgQEAgc3RhdGljIGludCBsZ19wcm9iZShzdHJ1Y3QgaGlkX2RldmljZSAqaAogCQlyZXQgPSBs
ZzRmZl9pbml0KGhkZXYpOwogCiAJaWYgKHJldCkKLQkJZ290byBlcnJfZnJlZTsKKwkJZ290byBl
cnJfc3RvcDsKIAogCXJldHVybiAwOworCitlcnJfc3RvcDoKKwloaWRfaHdfc3RvcChoZGV2KTsK
IGVycl9mcmVlOgogCWtmcmVlKGRydl9kYXRhKTsKIAlyZXR1cm4gcmV0OwpAQCAtODYzLDggKzg2
Niw3IEBAIHN0YXRpYyB2b2lkIGxnX3JlbW92ZShzdHJ1Y3QgaGlkX2RldmljZQogCXN0cnVjdCBs
Z19kcnZfZGF0YSAqZHJ2X2RhdGEgPSBoaWRfZ2V0X2RydmRhdGEoaGRldik7CiAJaWYgKGRydl9k
YXRhLT5xdWlya3MgJiBMR19GRjQpCiAJCWxnNGZmX2RlaW5pdChoZGV2KTsKLQllbHNlCi0JCWhp
ZF9od19zdG9wKGhkZXYpOworCWhpZF9od19zdG9wKGhkZXYpOwogCWtmcmVlKGRydl9kYXRhKTsK
IH0KIApJbmRleDogdXNiLWRldmVsL2RyaXZlcnMvaGlkL2hpZC1sZzRmZi5jCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
LS0tIHVzYi1kZXZlbC5vcmlnL2RyaXZlcnMvaGlkL2hpZC1sZzRmZi5jCisrKyB1c2ItZGV2ZWwv
ZHJpdmVycy9oaWQvaGlkLWxnNGZmLmMKQEAgLTE0NzcsNyArMTQ3Nyw2IEBAIGludCBsZzRmZl9k
ZWluaXQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCkKIAkJfQogCX0KICNlbmRpZgotCWhpZF9od19z
dG9wKGhpZCk7CiAJZHJ2X2RhdGEtPmRldmljZV9wcm9wcyA9IE5VTEw7CiAKIAlrZnJlZShlbnRy
eSk7Cgo=
--0000000000001875f50590a021fd--
