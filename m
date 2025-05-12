Return-Path: <linux-input+bounces-12300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08AAB395B
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 15:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44B56175F8D
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 13:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DFB294A11;
	Mon, 12 May 2025 13:34:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BCB294A1C
	for <linux-input@vger.kernel.org>; Mon, 12 May 2025 13:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056870; cv=none; b=DKPR/djqNEuVN95aUSRVEAtae9eQ/RHcZG9xYNcLFixWBblFkm2JoiZJ4lG74qyeoaa+m2MQCHp4SMhmq3rI3G66P/OoiY5zeENFi4AzrjIkUzEmaX51Zk/rQJXGCV3zVwG9LolhamQVf9zKt84lhtg/dQreAqaCnRtcWwDgSss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056870; c=relaxed/simple;
	bh=9LaT8jpMDsO0x/0Nqzjg5EOM711aSAdddO9qszVV5k8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kF8MnKHgPSwV97cjmPvnvbBWAwh+fTEwJXdsUbfvtzmqpAuahC04fBZOUAITe49N90gjlX7TSE2hAPVDuqAZyF7wDq4DID8qz0jKgSbw++V/CA9HS19rQ6p+tNf8/S87GwMvgMJ6Ef3ofwlSjRqnq84R6oyh4LBElDDUGX3JP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3da779063a3so48768095ab.3
        for <linux-input@vger.kernel.org>; Mon, 12 May 2025 06:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056868; x=1747661668;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5Jsy2OEKlJIXsAudq58rYcIWaWdiHscV+wnkzGpNzo=;
        b=e35K5qPwvGbjJ3ib2IpKgCDKXEOdNZjuSaIWQXanK1XamEqUoWMJTRjE+NyVqfM6Ls
         Hit4yeW6TlK4tr25G/oR+7SPekKIO2QRT5WOeBubXAeKRatBVjac1ZmjzSJQTEdWmg8Z
         A7j8a3y0fJIPAjnuRd6e16tHGiBIRgnG4e7PuEevoDdAB5NET5eMfkEf6EHBYcvv/yg7
         JYPD9/5tVJh5YtyU7ZgxhN36MuToeVAW6HOGbujmwzhyjAkqUAQXVrNDv52QJNi91Wd6
         nxxpiYSg0NM1XFHpEvWTkfWNeRW88iNR/RKN0pS/Blhp2dThaOvjSdy6bdYkKan/xIKS
         4+Tg==
X-Gm-Message-State: AOJu0YyAa6B5jgrBj8n17+n0a3lsKN7ltEGwqboP2Q1F26yDWDqbK2Sc
	SCDQ17bJXdDBp7HNCp4XaRgcwPht+ve89NMeG+NKffO58SfwJhiCW2FClAMc0Kr1fSMKP4kTAnv
	QFzNGwZ6yWLRJAWBlNYaxAD7kEoKFk7R8rv7L2J78f5yN8ba2WVdxbew=
X-Google-Smtp-Source: AGHT+IECV7osDVIrJ+ZByHa1VnrQa26YYhTwEGq12zIt0CegPoH35EnLWtvqfi5x5AfsOhWU4F7+jPdHKuocSKMakLBIPc327aLY
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a06:b0:3d9:39ae:b23c with SMTP id
 e9e14a558f8ab-3da7e21751dmr157403935ab.20.1747056867911; Mon, 12 May 2025
 06:34:27 -0700 (PDT)
Date: Mon, 12 May 2025 06:34:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6821f8e3.050a0220.f2294.0061.GAE@google.com>
Subject: [syzbot] Monthly input report (May 2025)
From: syzbot <syzbot+listce35d07e50216cd75a3a@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 1 new issues were detected and 0 were fixed.
In total, 27 issues are still open and 58 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  24829   Yes   UBSAN: shift-out-of-bounds in __kfifo_alloc
                   https://syzkaller.appspot.com/bug?extid=d5204cbbdd921f1f7cad
<2>  1915    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<3>  1120    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<4>  731     Yes   WARNING in enable_work
                   https://syzkaller.appspot.com/bug?extid=7053fbd8757fecbbe492
<5>  396     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event
                   https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
<6>  54      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<7>  38      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<8>  21      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                   https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1
<9>  18      Yes   INFO: rcu detected stall in console_callback
                   https://syzkaller.appspot.com/bug?extid=32af18ae7b894a681f2d
<10> 4       Yes   INFO: rcu detected stall in call_timer_fn (5)
                   https://syzkaller.appspot.com/bug?extid=03dd0f0cbfcf5c5c24f1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

