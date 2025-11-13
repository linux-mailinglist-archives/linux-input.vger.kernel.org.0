Return-Path: <linux-input+bounces-16071-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B8AC560AA
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 08:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9DEA84E3B03
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 07:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4491322A0A;
	Thu, 13 Nov 2025 07:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VW5BmTao"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ECA2FF167
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 07:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763018628; cv=none; b=aS7FI8gBxUJliuXkkWK42VlaBiUBbaF94Gy1JOpKm8TgxKTseDZHlAu7h860Aq0nS8aDVAOiYFuei6QNYGlvyiJZojPWUdJ0vGH3cCoriJBlysn1zN3zUq6zV7vmhrHYm9qDUkbcFucgEh7ND2Ufy6NPL+9Ij1x7O8eNUa+XFsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763018628; c=relaxed/simple;
	bh=D7sUkI42jEJjX1tA7CxdUx5Jq/c1IcZy8u4I7hWCBN8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=edUza+EQIDWTYe9w1ZTmCmg8AJ/3B45aVnATDyiSF7RCB0Py2sVjleDTrz2PPo+qi4n5REcTE2PGD/DP7oLymZXwa3xVh42ZcpP6HaTf4jJpypeWsjWITZspzodcJCuo01YyQ5G+H1O03aT21E5XabtiZ9o0+NqlnTLZerh/Q70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VW5BmTao; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4711810948aso2858755e9.2
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 23:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763018624; x=1763623424; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxX+r6XiZQwV9AslpVMlrPtWhQaILahrl0JlFIrjDU0=;
        b=VW5BmTaocDj37J8VeHfOD+rEeJXvzbu1pYmmc/j9s8L1t+4QUnpciFtlE8go6SDy6a
         TFtAQXZhzhMU88DTGUU9/Gqzq+vaJJXuSZ+ZLhzlkkSThH6diVXl8EqX1hnS3v1LlIu3
         nWEPuNYy+aZjDbJzTSMRnrQXKJwH8pD9qYg6J94nmG0oUD14BNmKk5ju+C84sN4oEfgk
         jdwjsRs+UPVXi8SyaEg5kFYSBDrdyXEl/qvHsAoUxh2BS5IEnl3zDxNUTyZDchGTuxN5
         NOgcERgQsRFsQm9it0pZd67FLf5MvjwpRiQe8wffM+5eAMRJrOX4OtVskU2CDYnJtkwl
         QvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763018624; x=1763623424;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hxX+r6XiZQwV9AslpVMlrPtWhQaILahrl0JlFIrjDU0=;
        b=R9CkWh+307pfM9hRKVMMoxcTalQd0SvvWCCVdX1regGzREHjfxNAWrIIgA0Q6ZGCn8
         sTLYmXlG5OW8ZNEN2wT8XCV08lr34hjssthJUca7I+AaiTh67P2jF06HCPyA6qVD6O+B
         C89966Wtt0OxxKqDYV5ye0QM/i5gP3TymL2VEMIvWJMKUABizAmkP/Qns0Kig0mbnQmz
         9Zm21JyGGgqtCVgXeUloEDVGwVMBn3JOpi8NOdwE3HYmK2cF5Q95unjo8LDNA00TH2Yg
         pbClp/VNf0FskFT3y4KGR72havFCJSYdxKPhMZC4Pbb8bN+MZ1/Br7D5vUdChNY8zLsk
         wFZA==
X-Forwarded-Encrypted: i=1; AJvYcCUV8FBbGivbHEhL/XFDsqd/VcREwEbAdOa9ZU9P4JM+V7XR2v5PKwp//KKSAA5cZ9BXloN5lcZo4UgXAg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8+iLQgDtAO085WM0fH1jZAcaClk6avlfCN3cLKqZSq5mkQGcj
	UvJ9gyjL7njjTwsZ8ZJkDohtMTn1rWvtDsN/TkCT+gLIV+RxOZ+NNkIAfqFGUUK7Wp4=
X-Gm-Gg: ASbGncsO16uLrQ9Vj7yUrhUQcQj6aKmXMymvQw8NkfuRTS/UYHSjfOUXUt4E78yRmw9
	sYW86+W2716AhukBdLu74Bf0WB41Lq1cXReo75MuiFYvIBLER5pCkgaYddIMDMJInb8IHBtr7xx
	sKToG+0GAxFuXio6pmaMsIi341Rm5UWiqWDeOzyVrPWL2e72cTGxm9nUzscUpSevXB0et6KbnZL
	fey7ky0qPPglA34t2fHx9ip6kmOWdSjb2kxJiLPliDWi+TO54w9HX69YWPksz/XCnWQPLituCvD
	wH1gy/7+8L31cvJidHI/diz/L47O7KHa7uA7thBYou2mE94ZkjcvCrKbUp1bQxHxWGdsQMtXvGF
	EM+3fJvIVI3ooi7iT9+bJjZNBc0TedKNHvhDeyVmM4OHBiVjfTZDLU9kJNUuLoHa6UckwDNJfhJ
	JzJkbbhmDWpRd8uGhqXbGK+9PGchx3eOs04gcOeNhb8mcSJpPYddDR9mY=
X-Google-Smtp-Source: AGHT+IEjXysf1MoBU6BxxdZbTIsObaSFUIi0T3sI3i/OAWDjvClDg/GDPASlUJQ2bIOPpZoDY0Ledw==
X-Received: by 2002:a05:600c:1f83:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-477870b3a04mr59380255e9.32.1763018623822;
        Wed, 12 Nov 2025 23:23:43 -0800 (PST)
Received: from ?IPV6:2001:a61:1339:d501:d897:dbf5:d546:6589? ([2001:a61:1339:d501:d897:dbf5:d546:6589])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm74978885e9.3.2025.11.12.23.23.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 23:23:43 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------cvypr1pdGab7G4x0u2rjTvC0"
Message-ID: <148861b7-4f6b-45d9-8d52-1b21f8bb2395@suse.com>
Date: Thu, 13 Nov 2025 08:23:41 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [input?] [usb?] memory leak in
 dualshock4_get_calibration_data
To: syzbot <syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com>,
 bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <691560c4.a70a0220.3124cb.0019.GAE@google.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <691560c4.a70a0220.3124cb.0019.GAE@google.com>

This is a multi-part message in MIME format.
--------------cvypr1pdGab7G4x0u2rjTvC0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#syz test: upstream 24172e0d7990

On 13.11.25 05:38, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    24172e0d7990 Merge tag 'arm64-fixes' of git://git.kernel.o..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=12a44692580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cb128cd5cb439809
> dashboard link: https://syzkaller.appspot.com/bug?extid=4f5f81e1456a1f645bf8
> compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1508c658580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1051897c580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ded911fa4408/disk-24172e0d.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/a1f3e61cb784/vmlinux-24172e0d.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/b92fd0e25cb7/bzImage-24172e0d.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com
> 
> BUG: memory leak
> unreferenced object 0xffff8881192f9a40 (size 64):
>    comm "kworker/1:0", pid 23, jiffies 4294944710
>    hex dump (first 32 bytes):
>      02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc c51b5d6b):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4983 [inline]
>      slab_alloc_node mm/slub.c:5288 [inline]
>      __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
>      kmalloc_noprof include/linux/slab.h:957 [inline]
>      kzalloc_noprof include/linux/slab.h:1094 [inline]
>      dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
>      dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
>      ps_probe drivers/hid/hid-playstation.c:2845 [inline]
>      ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
>      __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
>      hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
>      __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
>      driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
>      __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
>      bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
>      __device_attach+0xf9/0x290 drivers/base/dd.c:1031
>      bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
>      device_add+0x983/0xc80 drivers/base/core.c:3689
>      hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
>      usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
>      usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
> 
> BUG: memory leak
> unreferenced object 0xffff8881192e7740 (size 64):
>    comm "kworker/1:0", pid 23, jiffies 4294944884
>    hex dump (first 32 bytes):
>      02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc c51b5d6b):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4983 [inline]
>      slab_alloc_node mm/slub.c:5288 [inline]
>      __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
>      kmalloc_noprof include/linux/slab.h:957 [inline]
>      kzalloc_noprof include/linux/slab.h:1094 [inline]
>      dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
>      dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
>      ps_probe drivers/hid/hid-playstation.c:2845 [inline]
>      ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
>      __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
>      hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
>      __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
>      driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
>      __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
>      bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
>      __device_attach+0xf9/0x290 drivers/base/dd.c:1031
>      bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
>      device_add+0x983/0xc80 drivers/base/core.c:3689
>      hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
>      usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
>      usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
> 
> BUG: memory leak
> unreferenced object 0xffff88812484e5c0 (size 64):
>    comm "kworker/0:0", pid 9, jiffies 4294945059
>    hex dump (first 32 bytes):
>      02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>      00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>    backtrace (crc c51b5d6b):
>      kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
>      slab_post_alloc_hook mm/slub.c:4983 [inline]
>      slab_alloc_node mm/slub.c:5288 [inline]
>      __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
>      kmalloc_noprof include/linux/slab.h:957 [inline]
>      kzalloc_noprof include/linux/slab.h:1094 [inline]
>      dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
>      dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
>      ps_probe drivers/hid/hid-playstation.c:2845 [inline]
>      ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
>      __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
>      hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
>      __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
>      driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
>      __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
>      bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
>      __device_attach+0xf9/0x290 drivers/base/dd.c:1031
>      bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
>      device_add+0x983/0xc80 drivers/base/core.c:3689
>      hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
>      usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
>      usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
>      call_driver_probe drivers/base/dd.c:581 [inline]
>      really_probe+0x12f/0x430 drivers/base/dd.c:659
> 
> connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup
> 

--------------cvypr1pdGab7G4x0u2rjTvC0
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hid-hid-playstation-fix-memleak-in-probe.patch"
Content-Disposition: attachment;
 filename="0001-hid-hid-playstation-fix-memleak-in-probe.patch"
Content-Transfer-Encoding: base64

RnJvbSAyOWQ2N2Y4YWE0YWVkNWQyMDdjZWZmNTJhZDljNWM2NzVhNDM4NDI1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29t
PgpEYXRlOiBUaHUsIDEzIE5vdiAyMDI1IDA4OjAzOjU1ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gaGlkOiBoaWQtcGxheXN0YXRpb246IGZpeCBtZW1sZWFrIGluIHByb2JlCgpGcmVlIHRo
ZSBidWZmZXIgaWYgd2UgYmFpbCBvdXQgaW4gdGhlIGVycm9yIGNhc2Ugb2YKZHVhbHNob2Nr
NF9nZXRfY2FsaWJyYXRpb25fZGF0YSgpCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3Vt
IDxvbmV1a3VtQHN1c2UuY29tPgotLS0KIGRyaXZlcnMvaGlkL2hpZC1wbGF5c3RhdGlvbi5j
IHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvaGlkL2hpZC1wbGF5c3RhdGlvbi5jIGIvZHJpdmVycy9oaWQvaGlkLXBsYXlz
dGF0aW9uLmMKaW5kZXggNjNmNmViOTAzMGQxLi4xMjhhYTZhYmQxMGIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvaGlkL2hpZC1wbGF5c3RhdGlvbi5jCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1w
bGF5c3RhdGlvbi5jCkBAIC0xOTQyLDYgKzE5NDIsNyBAQCBzdGF0aWMgaW50IGR1YWxzaG9j
azRfZ2V0X2NhbGlicmF0aW9uX2RhdGEoc3RydWN0IGR1YWxzaG9jazQgKmRzNCkKIAkJCQkJ
ICJGYWlsZWQgdG8gcmV0cmlldmUgRHVhbFNob2NrNCBjYWxpYnJhdGlvbiBpbmZvOiAlZFxu
IiwKIAkJCQkJIHJldCk7CiAJCQkJcmV0ID0gLUVJTFNFUTsKKwkJCQlrZnJlZShidWYpOwog
CQkJCWdvdG8gdHJhbnNmZXJfZmFpbGVkOwogCQkJfSBlbHNlIHsKIAkJCQlicmVhazsKQEAg
LTE5NTksNiArMTk2MCw3IEBAIHN0YXRpYyBpbnQgZHVhbHNob2NrNF9nZXRfY2FsaWJyYXRp
b25fZGF0YShzdHJ1Y3QgZHVhbHNob2NrNCAqZHM0KQogCiAJCWlmIChyZXQpIHsKIAkJCWhp
ZF93YXJuKGhkZXYsICJGYWlsZWQgdG8gcmV0cmlldmUgRHVhbFNob2NrNCBjYWxpYnJhdGlv
biBpbmZvOiAlZFxuIiwgcmV0KTsKKwkJCWtmcmVlKGJ1Zik7CiAJCQlnb3RvIHRyYW5zZmVy
X2ZhaWxlZDsKIAkJfQogCX0KLS0gCjIuNTEuMQoK

--------------cvypr1pdGab7G4x0u2rjTvC0--

