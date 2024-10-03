Return-Path: <linux-input+bounces-7037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FA98EC05
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 11:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99FD5B21F46
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 09:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7405143725;
	Thu,  3 Oct 2024 09:03:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C1013D29A
	for <linux-input@vger.kernel.org>; Thu,  3 Oct 2024 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727946208; cv=none; b=SrutbuE/+udVjZvm9tRAH3R7Zt9Xv7Z45WLzvUxNKefCTqzxvb6PrSbyXtvezqW4WFpuZfYjZs8rWT0c/lOLOKmjs81YGJfbkKFEEk3VJLRX0z0FCsy3ME9AtiCp+l+rv0nGWyhkSg+hkDquV2/rO6Gba1XsHta9fVgi1qF1/aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727946208; c=relaxed/simple;
	bh=j3u4FyletQL+Yyd6KjMrILLSCEpxocmmgI0oJKLD0E8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=L9MNb0KKzsWRNqGqe9Ga2mQ7iEWnAOJb81VoSNtDFyzH8cvwWROTWnY/m5O2PgYV/qmvlqfMD1NTyhwDd7uacDnxE6rtQxQHe/UbNY/HVU69QKRkDmpXl/GcdN9PJgxjS9cNrfl2q+gjPT/Ny3tjxkLjfYWVKheUrx/9iFn9cqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3a345a02c23so7846535ab.1
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2024 02:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727946206; x=1728551006;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TwjSsD+IUQOfcjZkOO8GnS/mK9HpJJ+hy+XvYqYCfZg=;
        b=qabkR8oY6iILe/xrJw35rTputKzx7GcpACduGQcADTyiwXxO3s3+LpATpdWgdg80Jv
         0tYq6eoMu1u4GlqJVU/R2wKNIcJEGTlesiLHkbPICAvbSXAJ5zjlHwJNg/D992x1Ufp3
         vZ1wD6ur4gHBiV0Lpbj+61C6gYvxvpCjtrcNdfMyhURjX8v0/+FBvKrE7U+zsrRO8sBw
         oDA6xQq3tCcVP0M5e0PWkvtPKY1PZ7RMOBBDG0T5oeummIGxpgS70IV4fShZlLnzme3T
         ViGP1pcTVfBaL+Bo9jhplFuqz/HyxS8G4yAdhM4jylPlaI0tTxHKzNihNReqN6xzj7x5
         AO8w==
X-Gm-Message-State: AOJu0YweQS1WIE6zSPm+gSkGMLQYaeh0Hp1AI4PcRx/EAOyODIFCa2bp
	iZTOjz+QGQfQ7TV/jRT4fDCCsafUNuDuOVwYNMEvXOXlqiyVoqpAKZxU9eddrPoq+InsuO9MP5d
	QwqLUdkd+YSGaBxz6p1zaqxPAhCT4qqVYlAhfFOrB86yn1VsF5ADgmjQ=
X-Google-Smtp-Source: AGHT+IFwZEsKbEkqg3avwMoRR0EnwRbKR8OARiI43321egvMK9ojz4yn4O5v4SHTfIEULveP/9ioxLM4ubBrWeW6SX8wcSBHU9sx
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a07:b0:39f:5e18:239d with SMTP id
 e9e14a558f8ab-3a36592c1f0mr55058445ab.15.1727946206280; Thu, 03 Oct 2024
 02:03:26 -0700 (PDT)
Date: Thu, 03 Oct 2024 02:03:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66fe5dde.050a0220.9ec68.0036.GAE@google.com>
Subject: [syzbot] Monthly input report (Oct 2024)
From: syzbot <syzbot+list3a1c0e33707eafc15111@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 56 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  724     No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2>  394     Yes   INFO: task hung in uhid_char_release
                   https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<3>  386     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<4>  115     No    possible deadlock in input_inject_event
                   https://syzkaller.appspot.com/bug?extid=79c403850e6816dc39cf
<5>  94      No    possible deadlock in __input_unregister_device
                   https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<6>  25      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<7>  16      Yes   INFO: task hung in __input_unregister_device (5)
                   https://syzkaller.appspot.com/bug?extid=78e2288f58b881ed3c45
<8>  13      Yes   INFO: rcu detected stall in sendmsg (4)
                   https://syzkaller.appspot.com/bug?extid=9c0539eda655673bdaa4
<9>  9       Yes   INFO: rcu detected stall in sys_pselect6 (2)
                   https://syzkaller.appspot.com/bug?extid=310c88228172bcf54bef
<10> 4       Yes   INFO: rcu detected stall in kernfs_fop_read_iter (4)
                   https://syzkaller.appspot.com/bug?extid=c403e932e9c6662dd4f2

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

