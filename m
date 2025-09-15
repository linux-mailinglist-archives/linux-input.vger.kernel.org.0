Return-Path: <linux-input+bounces-14728-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29373B570A5
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 08:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A31311899675
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 06:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BC1214236;
	Mon, 15 Sep 2025 06:53:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2412C028F
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757919209; cv=none; b=puOfj5jUWpIswZ4rE1+GHNaFIHnr+Vuzjumv1MiyhEmLIxSaMjpLtUaWLcpyBBhC00ZKM7PCPRQvil80b2VKbh/kjaR842r8iUoIJps61AI8KY1eRgEPtQd3fOZXL9CwJ5vwXoudfh5RA0Dg1mkHJK7MNBkWah8eTsz6AUYkc1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757919209; c=relaxed/simple;
	bh=nSsCs6TEzIhAnOz3JlLkssZexHWbTb577DseGI25km4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qdIINrFSPNGyI6XEnOaUhbgkAceUpApSEuz1hKsgUBxVgLEuv4N7VJCuxo30CMXqtoERzw9W1RMo/YPY9KHeeX+RCxAJYipkIo1ydM3BWxtsvRrpiIoVqJiJMJSJhgXzyKeFNkc7PaHYxC38dx0j1RYA54EwU8MFKocFzT4EUrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-424019a3dfaso8115475ab.2
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 23:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757919207; x=1758524007;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jBy8RrbeqjzTb2WDPBZ8sroE/2cV1mjofyaNZ7rU6Vc=;
        b=trJ4sdUFB4fZdaXtH+l8ujTW8vyGRJz9kyYXA4MvbC7uehotEp2RM6//YLm1Fw2sqc
         o5Q+bxRZzggZpPFKm4DlLHz0loeMKzCffKqUDw520yzCabUEouVHraX2Al/8awJjGoSF
         cb9D9VKp5h9xgsoJvNyo4sTZtZrVMRzO1L3lXb5NoWLKeSK1S6EZ2pQlSJ3/q682k4O+
         Sxd4lkzUuQ5vs7u5M1yTpqBesU8bTHBCEYeN5/f2SdONmErjzzD2f5kVChehhLH+D96E
         G0JAwsgUT/aIVOO8nORhNKRXX/2Q9Ah1HDwiuiHhVHQCOiCktKNQj4MBh33xCqPW1OgN
         OtsQ==
X-Gm-Message-State: AOJu0Yx0ddGhwSQ+wIQ1GxC881rP1d2EuzWaalDhxD9aoDt8NbnXF4DL
	cy7jAF7Olyfpdh9UYpedC34UyRwt1TilBmf5kiL8nv2YUNjl+FDMJ5CqpJlP9m4HPy+gq13o17J
	VrjFzWrb2uh0kYVd3gAfdL82FmkFyVyjYNihGLRC9cMcw50dKI8slZQB+Uvc=
X-Google-Smtp-Source: AGHT+IEkr/1wq8cGVH8F4JtQKAwxIMr6dWN40WGiEwJ4qk9AFiqN/dh6wzAJ6Hpqi3XAY9xozNewdZN6c6BxiGToRj8MJaR0n0T6
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1568:b0:41a:6194:c251 with SMTP id
 e9e14a558f8ab-4209d31a3e1mr123921935ab.3.1757919206951; Sun, 14 Sep 2025
 23:53:26 -0700 (PDT)
Date: Sun, 14 Sep 2025 23:53:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c7b7e6.050a0220.2ff435.038b.GAE@google.com>
Subject: [syzbot] Monthly input report (Sep 2025)
From: syzbot <syzbot+list70c5e712121cd45eb183@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 0 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 62 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  2779    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  1394    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3>  932     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<4>  166     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                   https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<5>  85      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<6>  57      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<7>  27      No    KASAN: slab-use-after-free Read in report_descriptor_read
                   https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
<8>  18      Yes   INFO: rcu detected stall in console_callback
                   https://syzkaller.appspot.com/bug?extid=32af18ae7b894a681f2d
<9>  18      Yes   INFO: task hung in __input_unregister_device (5)
                   https://syzkaller.appspot.com/bug?extid=78e2288f58b881ed3c45
<10> 7       Yes   INFO: task hung in console_callback (6)
                   https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

