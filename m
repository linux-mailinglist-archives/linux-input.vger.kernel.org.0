Return-Path: <linux-input+bounces-8955-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534EA02262
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 11:01:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FC983A18F6
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 10:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5401D9A56;
	Mon,  6 Jan 2025 10:01:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E6E1D959E
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736157689; cv=none; b=Cx5i1qR63CNoiZdu+wIDBKJntbn5D7fxu5CVDa8m4iQ3z1W7NlvwytT7DYZDgmQXvdepURRgR95JmoRR8+SlBwO8lfOPPLQrwPZkNUaFLFH+J4mvO3BZkDHO1T1+Dw4+aEer2bVKN5NpIic4pXatQPMaIdGZlyzmvEOMjrP9cas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736157689; c=relaxed/simple;
	bh=Mt6sTIoUdws1y1DNXVja8JxWRhvJUNvwZdoHuQrXUP4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=fDVN89fqyvoPcUL8iK2UH8e1jnAGDKdAXxVPCble+q6o1o5H6U2hM9uXch38X8K0e9+jAXAVd3gcuwFFmz/tGVpGOSkO8bQwV7mHiXMCTPdy1uG5yAgY6KJo5eZ+3FR7OI4LILp2hjcWuX+kPxGrRAQnjAr7Ctr6c+Jne9fpmmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a7e39b48a2so303341935ab.0
        for <linux-input@vger.kernel.org>; Mon, 06 Jan 2025 02:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736157686; x=1736762486;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBJssNodonZTEsMQoC+/gLpqYI8gvX4B1OqfpT9YvjY=;
        b=hJt5vuCsDvOWqLkZbwpqwHDMalXlb0FtgoaYqG2xVpykcHLh6qD75tZUlY+YkUUDfB
         n/eTPtjetOukdwzFhCVZFZICBE8nw7mSwFTqqx+RibO55wfMZ4uLlXypkONgJlm5wtrw
         KuK7ny2iPasl+tBw5ORJRt14P73tbE9iUhOG+EdCchOFI81zMsi/xI0TaeIuFJp4f8vX
         DT0D0vAyGyl32B3fa1B9cJF9Js1y9iFQs0fZD0G5eie8hCrCNVjLDOi+dWibTJOnVTbl
         aOscxGB4IrVBe0/VBxfcigBzJ6GbfQjfTRYBwC6a0ZOmv4HopMtwJw3DdAPI/GQoudSN
         zHjA==
X-Gm-Message-State: AOJu0YyMWWo1wL8rzUh2jK91fFeMBO9zPqfxKmo6mHAtJgf06Ua98oN0
	ioFcwfn+Xwn/7gDKk3cSpdNqfbcac0zgpTiv4OFvSoRaJf9qIKdfyv+XyS6f5XED4y2KPKRExFx
	5nkS9uuMOMGPEbzBzU8vbnqK5eNCkC2pDvr3UrJeYtPq/cBVAeQdU3FU=
X-Google-Smtp-Source: AGHT+IH5aritBMqMgQXrCmILFC86Sq4MxxRLX4eTG8TAguKdk9J/T2AQ9Wu6W9afCjD2ASuVI9vhfHEdTgVb3iA3+dMeYWfoJDam
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19cc:b0:3a7:6e97:9877 with SMTP id
 e9e14a558f8ab-3c2d5a27dd7mr447349845ab.24.1736157686319; Mon, 06 Jan 2025
 02:01:26 -0800 (PST)
Date: Mon, 06 Jan 2025 02:01:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677ba9f6.050a0220.a40f5.0005.GAE@google.com>
Subject: [syzbot] Monthly input report (Jan 2025)
From: syzbot <syzbot+list6f3fadf29c3f8e9d9e11@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 2 new issues were detected and 0 were fixed.
In total, 26 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  995     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  957     No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3>  427     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<4>  403     Yes   INFO: task hung in uhid_char_release
                   https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<5>  237     No    possible deadlock in __input_unregister_device
                   https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<6>  190     Yes   INFO: rcu detected stall in x64_sys_call
                   https://syzkaller.appspot.com/bug?extid=65203730e781d98f23a0
<7>  163     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                   https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<8>  38      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<9>  30      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<10> 28      Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

