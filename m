Return-Path: <linux-input+bounces-15510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D0BE22B9
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 10:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C2FA35298B
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 08:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB116304BDF;
	Thu, 16 Oct 2025 08:36:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C82FF14D
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760603787; cv=none; b=RT4obzVi0VhJTMFaT8QJVbLP0PfnzCmXr7MrMw5w9T9MsY8A9wUIk62M9AV7F3UKsn2coPnH1bWUkohPDxVyrEcBToGvbfjJrCw8nhnHhBuRvOpARDYet2cK8vbNhchTB9ookCPiYWPmdOCC1TE0NpzpT39qGslHJ94QHaiAqIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760603787; c=relaxed/simple;
	bh=PCyDlCUfCq0Agt1oPeF5drU1awIBbIWG264BrykFgYQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VledPyZLU/ggteO+v8bunhgQDqiHiElAA40tHZWNSSOpOalPNCRzy/r86yzaj+fWyc08BpXu8eTv+2f3S+Pe2UDqtm9JJn9WpdJwhaI4wd86g1LPJY92lutX7edxGVOAKgtFifTC8niYMWld4cmU2a2H9DkQQCxUI2GZ0KP4b1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-42955823202so21085225ab.0
        for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 01:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760603785; x=1761208585;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KpmHc0uOkkob1Q69uXBxTpjAuoIetwsjVGhE+E6NTuw=;
        b=xL10JbPRL4BLq9WNx02YLX+N2Bs5Ih5zBKEaIwku5OyzgejmaM6RwInmacmgFMe8Pd
         uFqJQr8pgsqs+J324c3isl26fZ/BnYFSg6kTxFXWsLC36SJU9kSgjEY2ZIoP4vyefvG6
         njywryutqxMjTqH3FC3EL7739qipuXXwXZjQVgp2vEEWPU1/+VSVzM4eFZUHYhX/Zyd8
         HDOBbhpAfx3+/BEEt0wPP0Z+T9sisLBYQk6AVp9PINRX72NWAg2TSMLjv2n7FevdhuJA
         PGR45s3ugaMsvKs32O4MAo8NPXzjbxwB3udeRJGyy9laI/UfpU8W1YHZ8iVjoZyep0t9
         VhtA==
X-Gm-Message-State: AOJu0YweCTs+vLlAwC0LMiPwLXqiLuS/ARQ1aNUMhJ5iUNs0d+tMvXi1
	I8dQEAGA5+MHSRYuwfh93VsdyK7jZG8corMkU76jRqDEDTiRSRHFL/+xixjO9H4S4Kg6iPhSMfA
	NT2hgpos9ofvB0EFFEiCrGvEhoMT950EDj8s5j+LxSFl8Z8XGHZAK7F6gRfc=
X-Google-Smtp-Source: AGHT+IFpcOyJyf7OezUeUoOAgv05R5w68VCdIsHbocnFHrIUYmaD8IAyNxslwMW+QuZc5U+VQxc3BnUpMbjPHNBPq9qC6DfltUJd
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170b:b0:425:7788:871 with SMTP id
 e9e14a558f8ab-430b437e76dmr45661655ab.12.1760603785371; Thu, 16 Oct 2025
 01:36:25 -0700 (PDT)
Date: Thu, 16 Oct 2025 01:36:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68f0ae89.050a0220.91a22.03e1.GAE@google.com>
Subject: [syzbot] Monthly input report (Oct 2025)
From: syzbot <syzbot+listf6f192aed14fe19392d1@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 2 new issues were detected and 0 were fixed.
In total, 21 issues are still open and 62 have already been fixed.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 2969    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2> 1436    No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3> 964     Yes   WARNING in enable_work
                  https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<4> 99      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<5> 64      Yes   possible deadlock in uinput_request_submit
                  https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<6> 55      Yes   INFO: rcu detected stall in sys_pselect6 (2)
                  https://syzkaller.appspot.com/bug?extid=310c88228172bcf54bef
<7> 32      No    KASAN: slab-use-after-free Read in report_descriptor_read
                  https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
<8> 10      Yes   INFO: task hung in console_callback (6)
                  https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d
<9> 3       Yes   possible deadlock in input_ff_flush
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

