Return-Path: <linux-input+bounces-8408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA88F9E5087
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 10:04:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59C1018825B2
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 09:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186D61D5150;
	Thu,  5 Dec 2024 09:04:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B5192D8B
	for <linux-input@vger.kernel.org>; Thu,  5 Dec 2024 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389469; cv=none; b=nl0XPZuNh+PhwbEQWh7G4yeszSeegNV8caWovcBkhTRXHj9vKRGl68gL0w1ItxNrBMuOTawK/8GQpVRSLNXjUSf2CdFGWa1sgT2i3wdvDNeHhIYpmJEQ2BpTBKvNZJuPixdZ+b00JlqP92p1fd+ciw4FuUNxuVgaf/IOLcGLH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389469; c=relaxed/simple;
	bh=EQhb6TGrZfYkcOpRdqn/lxXol9nmxg+0ajmsWIkzyuM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=I6nMcvA7I0EttqU/+1dHuhfFPsz4OOqO5ZWvT9pnpimVOuScE3ivKYU4ttEnLMhi8tjFcE6ws4/j/H4gOwDU4Xuv/5+wlhSy2vQwtiTGeMebW7NzCA2KYV6bO1EoObb+CB/m9YRh3ck/qV2DY1oPCL2E1rWAiixaiiiNAalq5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a77fad574cso9600685ab.2
        for <linux-input@vger.kernel.org>; Thu, 05 Dec 2024 01:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733389466; x=1733994266;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHXZaowWSdlvsGcGTREz+UJbqIy1FIWlv6vHNKmb8UE=;
        b=fPpI9sAlnWZ2Zcq8gD+OgddICroVEYo6gmdPRErZUnpGtWYNs53cE2groXJ/XeK9vL
         VPjXwlZQAwqE6zdiCtrBLG0LR/aPbVtNhD/MR4sAccdkqCVeARuR4D0Sd/iy+/kohn3v
         QPslKMbuCMp2VIzyxzgTgW1jXpj9GJEcp15y1VPEy7+ginLWd2+e/g8DZ53Ffl3uWcMq
         MC8XphSFh3PGTFX9RnnosfH7ubkfq6c3nJZowvCdocCnxwdgZnrFxPefoBWXtC4fx0ga
         3q6w2sF1nSvrE8PHbnituykax0RzwGizcLm7fH3cC3BIlR0WeiEEllygHt2ajGeafgyo
         rUKg==
X-Gm-Message-State: AOJu0Yy6V0wZU+oCxQPs9XhRSBCWlXQVfh8DvdTaQDDnTXW/Ef/GMzUc
	gsofzcTf9KV9TL8jzhbEy3h75rzTqPhAUF9SSp9vvOzy6R24TZ6JMdlJU1z0LgwOax+zIlx9aWg
	DuZXAaKZnYYXXVNg0TnD8r/+c+SUuZEbCzpD7SPB8XyW1fOZ3aZk96F8=
X-Google-Smtp-Source: AGHT+IFhAKlhuZu7yThWGfVrufIBKwl6bloyeYgsdPkO+TTRBg0M1WWgpSf1r0/z5/FRHVxBFdVUxnW5OZsuyJQqWcFvIOcRYShE
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c0e:b0:3a7:159d:2dd8 with SMTP id
 e9e14a558f8ab-3a7f9a3b435mr114740365ab.7.1733389466600; Thu, 05 Dec 2024
 01:04:26 -0800 (PST)
Date: Thu, 05 Dec 2024 01:04:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67516c9a.050a0220.17bd51.008e.GAE@google.com>
Subject: [syzbot] Monthly input report (Dec 2024)
From: syzbot <syzbot+list8cb80ffc769f03e3d563@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 1 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 57 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  917     No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2>  677     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<3>  400     Yes   INFO: task hung in uhid_char_release
                   https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<4>  183     No    possible deadlock in __input_unregister_device
                   https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<5>  160     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                   https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<6>  157     Yes   INFO: rcu detected stall in x64_sys_call
                   https://syzkaller.appspot.com/bug?extid=65203730e781d98f23a0
<7>  49      No    possible deadlock in hid_hw_open
                   https://syzkaller.appspot.com/bug?extid=2313ca2498b9554beeba
<8>  22      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<9>  5       Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                   https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1
<10> 4       No    UBSAN: shift-out-of-bounds in s32ton
                   https://syzkaller.appspot.com/bug?extid=3fa2af55f15bd21cada9

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

