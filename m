Return-Path: <linux-input+bounces-13555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5CBB06741
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 21:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F62A1895016
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 19:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01E026E6EC;
	Tue, 15 Jul 2025 19:50:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A1F26D4EB
	for <linux-input@vger.kernel.org>; Tue, 15 Jul 2025 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752609006; cv=none; b=pjkzwvLnj/+tskxFKwuVMBoplY5Nip7XJlTpFBgVwMTLMh0Zn0II1aJcTQsv/5VyLRDAah1lMObOevPrHdpX9EK3/131yygNl2NQyHLy0txuGjLvxX04oQ98jw/Nbdg4CQz0LCAVHzRSsgIKfz4bFVh2g4od26z0R0oqGgYc2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752609006; c=relaxed/simple;
	bh=+uEuU7AB6TR+kdqzjELhd9Bdue8Bb7TZZ9tF9e8LmEk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kK1GLoi43jSuLyj4N5R4XZ6VWp3tWXRFNTNly28wA1w0lH+9Kbn8D1BMvooQ1K4LsM9qDKzNN6HekXUPQPYQjurRrdz8oCURjd2r3TZsupu9/palZAkYBlaz5YV3ujA+jFzXvkhnk+V7PCtAqZSmG4tBbcPhUTmxp06aiiQjFoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86d01ff56ebso1014106339f.1
        for <linux-input@vger.kernel.org>; Tue, 15 Jul 2025 12:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752609004; x=1753213804;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vQ3D5M5JxcaGWNBRgjpMcegMV7DZqvWfaA/890sSWL0=;
        b=vL9rFfVoTmeQ0Ise6HJpHdu8mVSJ3rkPvEux6U/EB/UQ5pKR9cdPjO+r+gOpUOtgsX
         fWS8azKsvNyCSS7Nfnp7j7Qjvubu1WOf24gJ9lygavIh+jxj0/RQwjUS5nBKc4tyXNuW
         ftsYe7/ppNNuuCN5xiKrLDbPfV3LdrVJpfjwZ7xUuyeaahha6dqItrvnmcRnOtVE8McB
         Gk0vktjthIDOSVXhpVwUF9WOPh4nY6pCdc3ImPjtt485uYUakrYlVfcU6DZpawDyHH8A
         muMnajki3znZzVoqTPCoBpCHpfhzyaCoKQ1hjbGKfVDVOF8OLtb9llXmCFhhrVsRZuAH
         7+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXEwudsvE/tSNrcUbnFMLJpE+8P9PPqA9vo5eOGcMwp1FFG9ZpwqnEU2Peji6n6hRsjNSZmA0941gSOvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvGFeSC9KINTgUPp31DoRzAf5uiPd78pcnnLq6LM38Q3IxuCg+
	UH86oOZBCffPyuJu6PtE7vYYcybkgvp2x3pUJswHZ6NXOuWMPSRvKc6WjDYxQS4A/hyK9hQD0wG
	+lYKxPsrNGAQioja5DN7HB40oUogeXqHe1tU3tXRzNjdOe57BBgGjPwOfgH0=
X-Google-Smtp-Source: AGHT+IEWiMhv4z+y4mOvwDxT8I8T07EbqKF1ZqN7fiGc7selz2EIw9tnvYUA+QJJmi/9xI+xfSvs2LLDvozk+Gmwa6K0RH0fPVX5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:6a8e:b0:85b:3f06:1fd4 with SMTP id
 ca18e2360f4ac-879c08aa6d9mr89064939f.9.1752609004301; Tue, 15 Jul 2025
 12:50:04 -0700 (PDT)
Date: Tue, 15 Jul 2025 12:50:04 -0700
In-Reply-To: <8bec1698-5008-428f-8e71-ec002def0c54@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6876b0ec.a70a0220.693ce.0019.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
UBSAN: shift-out-of-bounds in s32ton

microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
hid: s32ton: n 0 val 0 size 0x0
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
shift exponent 4294967295 is too large for 32-bit type '__s32' (aka 'int')
CPU: 0 UID: 0 PID: 5987 Comm: kworker/0:4 Not tainted 6.15.0-syzkaller-11339-gc2ca42f190b6-dirty #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 ubsan_epilogue+0xa/0x40 lib/ubsan.c:233
 __ubsan_handle_shift_out_of_bounds+0x386/0x410 lib/ubsan.c:494
 s32ton+0xde/0x140 drivers/hid/hid-core.c:69
 hid_output_field drivers/hid/hid-core.c:1845 [inline]
 hid_output_report+0x3a2/0x5c0 drivers/hid/hid-core.c:1877
 __hid_request+0x14a/0x420 drivers/hid/hid-core.c:2000
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x218a/0x3030 drivers/hid/hid-input.c:2327
 hid_connect+0x499/0x1980 drivers/hid/hid-core.c:2251
 hid_hw_start+0xa8/0x120 drivers/hid/hid-core.c:2366
 ms_probe+0x180/0x430 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2736 [inline]
 hid_device_probe+0x3a0/0x710 drivers/hid/hid-core.c:2773
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2919
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x644/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=152e098c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13b6098c580000


