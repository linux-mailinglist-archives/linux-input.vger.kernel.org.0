Return-Path: <linux-input+bounces-11366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1AA75DBF
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 04:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 982463A76D1
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 02:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A2278F37;
	Mon, 31 Mar 2025 02:14:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516243AA9
	for <linux-input@vger.kernel.org>; Mon, 31 Mar 2025 02:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743387269; cv=none; b=hczJsuzoO6QaUcXtLCoW1ThtV07NCWYB/seldiCpCJtN8s8Du/COeEXrIsZvu6Zd8ij/eHJVjcCnT8t4Tad1YmbDTNZ58Z8M6k3QxZg7Fvw8xSoqX5a9s/amDo+7zD1wciIhJXXXOus7d+Ue0tHDPK++Wts46KNHiUDSVl15NnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743387269; c=relaxed/simple;
	bh=otP5ppnT9Z1XPJMiBGLIWJxYif8WNzKhHlwtQdlMvUc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=H7tPp4ZGaWxd6WmROLeT9lWNXBOV5Q9bmuHgAAmPsGhucx4bmOWL3ZcYXdTR6maYeqEfoh3cefs3Y4y/vd412pYmIpvB53u6TJNIueLWosQvLp9CsdPI607GoPCWU4INRp09y70UIujRFoykEx1iLAtV9rJhk6BDCYRaxcjgUnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so39948655ab.3
        for <linux-input@vger.kernel.org>; Sun, 30 Mar 2025 19:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743387266; x=1743992066;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zn4wsqECmycelK2HB+BPPSdvs//fE/pmKUurDQYNNO4=;
        b=Un4veB/1+uEyCI1zLJKpRzWftNYLzftTmtb5NR2hoXW9IQ8KnrzE8MBO/m7stEsNb0
         XyBApHWK8+Tfm7MAFqSK7KU6IteUZ9kfWfwaaa/GSMTRFjz39pThneW1nHOgIksqEPPC
         WNItlBYcDvhEzvRltJcVa6URMbp1QrxjYMbquswuoR3/m4sbz2RddMkd6VOjB2Sl9zYC
         c7qils8Vd+iFUd2CMCecqNvcvg5ch0hk/Ncnd4OkOM7wzkEGVcYEKSNm1miQ79ecmIxK
         VLoBiG+p9v22UTNVvNWJXjvOsQmuskvJqs0IQglodB0R5ra4s0XWclzXEkYhr+7p+4xI
         VcSA==
X-Forwarded-Encrypted: i=1; AJvYcCXGIvdEyGDb/MH11fg0NP95P50/ZxXPaOoTsxfAUi3d5sKoEFKkxhQAj1S65eQht07GkDB+39/X/m70xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcB08OsdmbJm05TvUpPpOrgZALgZAP1L6x5Ra+4tb3PVV4EFh3
	A9X8uKV/K7caxR8fy1m0HRe3p3DL91TPAIMOUE6PbZhql+OwRnJNqqggqpUt5d7rN9i32Xa2buP
	4ubtQ9QpLI51htBuHsRyGJUeJ642SSdfVltcMWIcTZLuEA4mfTCPUog0=
X-Google-Smtp-Source: AGHT+IHzaYoQ6A44D1gbKMagzp6/4TOHACf+Mx08YIPA7ACJMpaj92WyCyyf1pCWil+4DLIasr/vgutg399jYAaX6NfMvuhZXDIM
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1646:b0:3d3:fdcc:8fb8 with SMTP id
 e9e14a558f8ab-3d5e090cedfmr58623345ab.10.1743387266684; Sun, 30 Mar 2025
 19:14:26 -0700 (PDT)
Date: Sun, 30 Mar 2025 19:14:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e9fa82.050a0220.1547ec.00e8.GAE@google.com>
Subject: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in __kfifo_alloc
From: syzbot <syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f6e0150b2003 Merge tag 'mtd/for-6.15' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ebabb0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a15c3c5deef99cef
dashboard link: https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146e4a4c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d1d804580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-f6e0150b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/416c28ebba43/vmlinux-f6e0150b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/df554d24e7cb/bzImage-f6e0150b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d5204cbbdd921f1f7cad@syzkaller.appspotmail.com

usb 5-1: New USB device found, idVendor=056a, idProduct=00f8, bcdDevice= 0.00
usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 5-1: config 0 descriptor??
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in ./include/linux/log2.h:57:13
shift exponent 64 is too large for 64-bit type 'long unsigned int'
CPU: 0 UID: 0 PID: 835 Comm: kworker/0:2 Not tainted 6.14.0-syzkaller-03565-gf6e0150b2003 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:231 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:492
 __roundup_pow_of_two include/linux/log2.h:57 [inline]
 __kfifo_alloc.cold+0x18/0x1d lib/kfifo.c:32
 wacom_devm_kfifo_alloc drivers/hid/wacom_sys.c:1308 [inline]
 wacom_parse_and_register+0x28e/0x5d10 drivers/hid/wacom_sys.c:2368
 wacom_probe+0xa1c/0xe10 drivers/hid/wacom_sys.c:2867
 __hid_device_probe drivers/hid/hid-core.c:2717 [inline]
 hid_device_probe+0x354/0x710 drivers/hid/hid-core.c:2754
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2900
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1432
 usb_probe_interface+0x300/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3666
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5533 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5673 [inline]
 port_event drivers/usb/core/hub.c:5833 [inline]
 hub_event+0x2eb7/0x4fa0 drivers/usb/core/hub.c:5915
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3319 [inline]
 worker_thread+0x6c1/0xef0 kernel/workqueue.c:3400
 kthread+0x3a4/0x760 kernel/kthread.c:464
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

