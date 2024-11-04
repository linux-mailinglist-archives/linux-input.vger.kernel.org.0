Return-Path: <linux-input+bounces-7847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B909BAEE3
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 09:59:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E1D61F22C19
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 08:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5C91ABEBD;
	Mon,  4 Nov 2024 08:58:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85911AB530
	for <linux-input@vger.kernel.org>; Mon,  4 Nov 2024 08:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710709; cv=none; b=cQLHLHdpBsl1+qob5O06MQVWAozCkHcjLCou0mnZYhOe7ZpjeEOoRHp7f4XIQ7ZXd+HrGBVrN6RotndiJEi3OINchmN86Cxi8fijmQwNMpfC4bHUPowgRFjPgSMpYM98MiSF0MctLX2jAOxvdk4Z9L2UJzPeso2J82Z+fvnxqDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710709; c=relaxed/simple;
	bh=Bz3gOFRwGOaGKGNUBdbVzgTjpVn87zTso3nM3mFe2gQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HesZKUV9l3nuHOEwPdTOXy91CSpdODR5PZs1niWHHP+SUn80qWe6dQsELEmeo0Syba4zaAtuX5A9gLLhWUEczsjZUiJ0EAAdMDU9nSL3h9jF0wyKZFUbf+j0NAW2u70uQmcLhpsnF0C1fVYUK75yGSLr7do2/qEuRn5UF5KVHiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-83abd63a132so259664639f.1
        for <linux-input@vger.kernel.org>; Mon, 04 Nov 2024 00:58:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730710707; x=1731315507;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVb40T/AVpO0uKAlqE9ez6S0gGsek0gAtixUwc7L6RA=;
        b=fyNQHC0e9qxb4rcTRaZeE+QioasfcPyX71MgDkGN9+LWWsG6ri4ttTYoK54OgnBlzq
         x1MQgXq+++ViLGDJSz0gu1x1SU/SaOqH/bZez5MycuEgWsEUkobq87z3Tef9v8+wb8F2
         ezjwUoUE8+iLNKPq2MlM+yGXXFnzfCLzSsvNc0k9faDgYO3uzr5SLJKzOwmuAXz+pUpk
         XCX5eDCH+bjHSdBOzHliT3f0wK9W+VBH6Bap89DMUGwvyHVRS9smkHFsZePx1rbVDMPv
         X5Oc7c1Is07Ggc2DvaThxbN26pOAuyTYmwoHkdsNxZWQpk6/gRKpPLlOnUseU6eAvvmN
         Gm4g==
X-Gm-Message-State: AOJu0YyvRU9b2vRLoNLEoQg+I3BHejM7WFV95xoWs1XmBm/UZM3RTGRc
	WMqUiZ78O8Wmf1V0p85TgGuBDKFTXHTl5pdZpp600yUCWO1zVVma5a6PNg2mViQSuOPddCD6v63
	YeCszEgkkwGhiNtx267Utcj5aFhEwEOfJyDenTVPejGSmBQPhSZdGHE4=
X-Google-Smtp-Source: AGHT+IERGTlo4BvIQn7dZ5nYAHAAEQi86wteBIux90QdH4eK8k1K2PdZddSMkkx2s774SG43BsGNvvwkjXPP4OIeB978k8dZPTSq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d10e:0:b0:3a6:bafd:5650 with SMTP id
 e9e14a558f8ab-3a6bafd5803mr65688645ab.10.1730710706976; Mon, 04 Nov 2024
 00:58:26 -0800 (PST)
Date: Mon, 04 Nov 2024 00:58:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67288cb2.050a0220.35b515.01b8.GAE@google.com>
Subject: [syzbot] Monthly input report (Nov 2024)
From: syzbot <syzbot+list87d286d50504b1bfb087@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 4 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 57 have been fixed so far.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  817     No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2>  470     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<3>  394     Yes   INFO: task hung in uhid_char_release
                   https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<4>  126     No    possible deadlock in __input_unregister_device
                   https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<5>  115     Yes   INFO: rcu detected stall in x64_sys_call
                   https://syzkaller.appspot.com/bug?extid=65203730e781d98f23a0
<6>  54      Yes   INFO: rcu detected stall in sys_pselect6 (2)
                   https://syzkaller.appspot.com/bug?extid=310c88228172bcf54bef
<7>  27      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<8>  21      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<9>  18      Yes   INFO: rcu detected stall in do_syscall_64
                   https://syzkaller.appspot.com/bug?extid=a3bc6ce74afdd295fe4b
<10> 8       Yes   INFO: rcu detected stall in sys_rt_sigprocmask (2)
                   https://syzkaller.appspot.com/bug?extid=702ae87d7174a3a4d759

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

