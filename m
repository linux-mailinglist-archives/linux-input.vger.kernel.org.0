Return-Path: <linux-input+bounces-4755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471A291DC95
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 12:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B66288578
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 10:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3FA156F2E;
	Mon,  1 Jul 2024 10:27:21 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA06155A43
	for <linux-input@vger.kernel.org>; Mon,  1 Jul 2024 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719829641; cv=none; b=ZJZclm0vq+U1HJHci74nCq/UCAjVUCTlP4cSoxj7xatFHp6/wPjAr3pezxcs/azlEOifqlt77gdY6Ui73lPCHC2ZD9b1yUXpxtou88RuBKaG/OJ0/D7QstsvwKRnjw37syeCcrA/FfYEWL5iTGVEhEEVoAi4AmukasG9tqkFt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719829641; c=relaxed/simple;
	bh=1HP887e6Ea4WDAE35px35VdpUyXaiLd1atsEL35N0oc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ByVQhkK09PrWmK7FsEZrcgHi9aCV5sUgtrrA3hhGCr3z2U7/QsSKaT9jYjsrSCt4vRcbHFQIxODrX6RKiuc0o1maV/YG4mhujt+xLWh/kTn4XfTXfed4sQXHeoeuBYqJ3inWEixcycsLXmHGLgzxSSWRcULAY6JQQpXF3nuUEgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7f38c10cab9so310414439f.2
        for <linux-input@vger.kernel.org>; Mon, 01 Jul 2024 03:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719829639; x=1720434439;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A47/TizqhE+pZZ3v7ifvB6Z3SgqMGF8RAQxtsDMwcH8=;
        b=CdOmIwCQXN00LnEOz6Y1iPNcWUEQMtvk3awBc/1RfBCpXIrXRQqkQ6niV0hw5936CK
         p3D2Xa9JSsJ3qoNa8b14l5PamHd2/2/gJRUr1U2EPeUJBhef0lgn8Q3vR1d/N7sxjUWL
         wEaMZQMvObFKs9DFbayYsY0ByJ1IKaNyAl1zPm3k+8ShdNCzooE7WWALN4YwM1IxPw/J
         3/oSGx3PBMKtsWPpFWO9yaRaFZQmhQ/eA548/lEvzZ35W5gKQANW0lfKnE/iPem3leLt
         s2/YSurdeuoKW7QZXKfAPnbUTfc3lrdVzfYEJ/e2YPgPrZxLpykY521adVtALfON2Dmz
         4+dQ==
X-Gm-Message-State: AOJu0Ywc3OGA2TMbc+VB2X9EAaaxuuWlyCI1f6Pur0TRq6oXiDXqXJCU
	LlWGuLzBqgyO6QiyZFWBB2L7DeQGesb7WgQ5BfFyM6DXv/DPPuQrx3oSEgHYOc7EhD74YY6tOD6
	d8L+uCAS6evTiy2HeIQ8FHFyVgcZQnMOlQhFv5fYehgvSm6o1FQQwrcM=
X-Google-Smtp-Source: AGHT+IEyHvl/XKfFDgtbN6kOczny0AyW/l3JzsNiMFCdxRyGlYMUd1IPHrmxYnVnkcGvOMV8XU26ZmQnGNxGjkxlytVxjgCydULw
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:9806:b0:4b9:6637:4913 with SMTP id
 8926c6da1cb9f-4bbb6e52facmr258839173.3.1719829638906; Mon, 01 Jul 2024
 03:27:18 -0700 (PDT)
Date: Mon, 01 Jul 2024 03:27:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b38d84061c2d0a58@google.com>
Subject: [syzbot] Monthly input report (Jul 2024)
From: syzbot <syzbot+list0328d7a3dda088d6481f@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 0 new issues were detected and 1 were fixed.
In total, 21 issues are still open and 54 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 671     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2> 386     Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<3> 318     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<4> 19      Yes   possible deadlock in uinput_request_submit
                  https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<5> 8       Yes   INFO: rcu detected stall in sys_syslog (2)
                  https://syzkaller.appspot.com/bug?extid=269f9ad9bc32451d5fb5
<6> 6       Yes   INFO: rcu detected stall in sendmsg (4)
                  https://syzkaller.appspot.com/bug?extid=9c0539eda655673bdaa4

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

