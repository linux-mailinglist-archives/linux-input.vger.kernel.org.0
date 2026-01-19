Return-Path: <linux-input+bounces-17192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82477D3A191
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 09:27:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 724E43076764
	for <lists+linux-input@lfdr.de>; Mon, 19 Jan 2026 08:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F13A533CEA9;
	Mon, 19 Jan 2026 08:22:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937833B96B
	for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810947; cv=none; b=OyTpEozecjN7A8NEAqPs6NnQo2FzlNJB8E+F2sqLGp0YAMPpNpaQhbYooIzybK4ZEQAJUJmOPiHygJYUACvggBhob/QHqLkp0anw7oldwCl6GzkeBNTBbeA5hd729pOjcDqdm/iK4oMiHzwpE88U0E5QMRYmkMgCiK3CpXDIDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810947; c=relaxed/simple;
	bh=RnvzJ3DFSSCgcFsWSZd3ikqTefYoR6jCU1TjSFjp4cs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=saHH6upZwFidm/eSwyqyrFjT11RVySgsU6yPPAe568hZRlw4RAw9B8cIrNZ1DAlxjMhpSOSNF0cX7XUso54KbIF7xyU6TypRo10N3BrGV2Sq21y4+nNJRKWXVH3elgz24n35+V6OKyCiHrtr7G3vE2NmuboFS08T6ZMhfObO4sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfd0f67288so7965100a34.3
        for <linux-input@vger.kernel.org>; Mon, 19 Jan 2026 00:22:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810945; x=1769415745;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6xtL7UlgrRGdxw/w+6b6KPtzatE6Xdn9sP/nPwle0dE=;
        b=xMnMlUqe5yaY14NcYqyYjg0rRXQAnoqSVRFxOZ0vNjtLmCdzCxFiO6HDI/9dJb2wZr
         CyoJLiEpiBhhmABKQZmaNUiuD8OFw88cpsGVSET0d33VR2jrP/k155xSFkHGxiq5UtUe
         VxOz12istULLNGSGaNmM2+YDZitJZRkfHWh/IRFAbekzRUaS/XIekvEvYgxlK1oxrK/f
         awHFzjhPwQq6ydEij8SCTRlFUIPF2HyWC9pFNn+0FkX8sWZDg+AdCUajHgK3ocAwNql9
         GIssadb4DC2YWMzb2lrS20emJLIsRkLkQF1MoBE8DuQwwQutZXNpHIorEXqMy/ygQluO
         cchg==
X-Gm-Message-State: AOJu0Yy5kYjlVvRlttZTwDm/1CV4Kt87Ccprl8xkOmDfcA4e3bG1j5H5
	yYH0t5ApqR+GPiS/jmlLPNRHfiNj0p20kswxD6WzcKnDQdris53O/cTR8Ye+yw6thfOMFCvJD5R
	RRG6RLSEop/VpDXFWpxce31bYBv9S5Z63SKMsBi7pWXQwEJj033alktXA7Xk=
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2019:b0:65f:7470:38bd with SMTP id
 006d021491bc7-6611896c5ddmr4269439eaf.58.1768810945556; Mon, 19 Jan 2026
 00:22:25 -0800 (PST)
Date: Mon, 19 Jan 2026 00:22:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <696de9c1.050a0220.3390f1.0041.GAE@google.com>
Subject: [syzbot] Monthly input report (Jan 2026)
From: syzbot <syzbot+list64baa1bb3e01fb231b6e@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 0 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 63 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3381    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  1659    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3>  330     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event (2)
                   https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
<4>  166     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                   https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<5>  112     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<6>  84      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<7>  55      No    KASAN: slab-use-after-free Read in report_descriptor_read
                   https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
<8>  19      Yes   INFO: task hung in __input_unregister_device (5)
                   https://syzkaller.appspot.com/bug?extid=78e2288f58b881ed3c45
<9>  13      Yes   INFO: task hung in console_callback (6)
                   https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d
<10> 5       Yes   possible deadlock in input_ff_flush
                   https://syzkaller.appspot.com/bug?extid=ed7c6209f62eba1565aa

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

