Return-Path: <linux-input+bounces-16143-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DF6C62CD1
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 08:51:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD00F34CE8C
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 07:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D9331BC8B;
	Mon, 17 Nov 2025 07:50:32 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20C43191C2
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 07:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763365831; cv=none; b=utvijzqAK9d/KFOtXRc3eQxD2f38Ec5jviXU8ib+F4UG6ZCtH99cfW+fYQ1QEMvV7x8hkl5Ruys1qKBRLkqH36JytdJncfPed+c+Y+t7puK7Ad0Y3rLvg1I089H0PMm8YCn/R4bkPDFpQRYz0fdAzh0Jw/pjeH/1sg2z3f8P5BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763365831; c=relaxed/simple;
	bh=XgD/QnBeBXKPXU+Cl0j9O+XryGybEx2w5J+s++UWHOY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=M7Mzq1EWRlk/8AK7dMBMW4/xmxg1r+mQoJh4JylRKSY5qzy2sjnvnYHQo96o78jtiff0xME8qe9lqSdFaJwMGcdrAiF908b5eg4LONJ3rwmU/QKXkAKlMh9c/d7GqV5ky6KyVsnAUcUsD3vj26WTd7Ax2HMe3cPRIrXYbVi/Woo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-43329b607e0so45733795ab.2
        for <linux-input@vger.kernel.org>; Sun, 16 Nov 2025 23:50:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763365829; x=1763970629;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czEI1asxUMf8MNshYOwl6fq94kgwpHiMOqq8nqKr0nQ=;
        b=WY/eYmaI+dFS7/6jqZQ41OHOzyEcPbVITCZKQVapnxVCMlE0hOJZES3Z97ZgcowRHR
         qiXdea9yYKEtX4n+dncWdoOmVgRbXIfuHCfka38bdiriggllkAd8xOvXXa4srEgoqi8w
         kexl7czCldpcU4tdxyW0m2s/YoieGDe11Gg9rYVmjuFwB48ny1vnkpBXW5rZxJAfA6qd
         YCyPfw+YHH3vXR8QezUQNKPSTxBK+UOnaQCGHo8pDcj4Kf2ecdmJitizSj8E0eXGTu8n
         33YX7rV89oEAoE+iCuiXNZHsVg6FYSqOrM7FodmLuMH5NYR3t+498QYinrRZhIsZeCWz
         h93w==
X-Gm-Message-State: AOJu0YzY5NzrxdLaSFQF1vR4fsKg055RWkJXRWYj5JQFbIVDDsb1T+iO
	SK8ZmqSCSydzIXsOe+1d6PxRHN6Xc9vNNJKRpjjJlhfracs4smIFRrd2D8LtLyeTG3czOtA+7Vz
	sXkUzoFsOqGxXm2HrJlAnPgddNJYjhpbgGooI6lx/XIDUbn5QEZmQNCBxqSI=
X-Google-Smtp-Source: AGHT+IE2UU5Vp39wBsbk+n6/8TXqwwZuOHGzAWM+UK16JXIB0Onti14KEH1NUr0IoZlXzrvf6IiTTq0Hdm5oSxmEx6b+6RAILW0m
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:339b:b0:433:771e:3dfb with SMTP id
 e9e14a558f8ab-4348c8503f9mr154394195ab.3.1763365829026; Sun, 16 Nov 2025
 23:50:29 -0800 (PST)
Date: Sun, 16 Nov 2025 23:50:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691ad3c5.a70a0220.f6df1.0008.GAE@google.com>
Subject: [syzbot] Monthly input report (Nov 2025)
From: syzbot <syzbot+list57f5cb95b97783ae7a2e@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 2 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 63 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 3110    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2> 1501    No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3> 1047    Yes   WARNING in enable_work
                  https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<4> 102     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<5> 72      Yes   possible deadlock in uinput_request_submit
                  https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<6> 39      No    KASAN: slab-use-after-free Read in report_descriptor_read
                  https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
<7> 13      Yes   INFO: task hung in console_callback (6)
                  https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d
<8> 2       Yes   INFO: rcu detected stall in sys_symlink (6)
                  https://syzkaller.appspot.com/bug?extid=e538d3da32f1c0337b01

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

