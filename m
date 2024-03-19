Return-Path: <linux-input+bounces-2428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C8C87FDC7
	for <lists+linux-input@lfdr.de>; Tue, 19 Mar 2024 13:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78B411F21830
	for <lists+linux-input@lfdr.de>; Tue, 19 Mar 2024 12:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCE37FBD9;
	Tue, 19 Mar 2024 12:48:45 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7950C80601
	for <linux-input@vger.kernel.org>; Tue, 19 Mar 2024 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710852524; cv=none; b=OGXvNd8Vxq3llsD5jHFajPlHy46TY7liKvNaVdiX3SUbe8vvH+Z6CgragtShcltlvCVKeZg693I9ZvGaGtoezhcs1WCNtv+elVnpjBEonPfyM8Qo1+zd59TYeXnR5LDCuzC3Q2V+/uzq19ZCJlGTylszGJ1V3JyS+9Yabpyl4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710852524; c=relaxed/simple;
	bh=Y6LPOARZv6WMKc8GrR/5roQF7A4U3axLXMt0DuN3/Bk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=kAeEfo2SvR+SVmO6M+fL94PgvbUtMixF6xpVjWJhGnvtuYSaZpSvPvhlAX0HOzZZimgByk1D22Am894Kyj49Xb4uZ2AMXe52t2SxhVKenQHhDoawqersd4C5ivm6WsCyZ+vm2wyAESX0k1HleDSrkLefHlgAqLGdGQxRLazBAik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-7cb806fc9f7so541293439f.2
        for <linux-input@vger.kernel.org>; Tue, 19 Mar 2024 05:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710852504; x=1711457304;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6fy4P1aZSyUUNvRv02sBgKzOYoAXr7SlJGAokWQeik=;
        b=MItgFHaeckplatKWLKD3ekY77vOAKI6ANW6TEtepTML1NcbSWREocUxXZ2KmMUeCaZ
         bbHgCQFbwsmgfXds7hy9n0YiM5l15QJ6QbejHAgeubI3dJ1XnSUlByskQ8mM5ElxkDpD
         MlBX/w/mCoLO9Rp0MFIYf+4UXNhO8MiPYpg7c+7QcmDRFXuBabqHDknF55r910UCG3pn
         a6IAiKYPjrKLsOF2AYmhgNlKMpcZytx2m3SHqnXpUJMJZ/IyOcCZGKdRtufpy9LQcrX3
         /1/qEa1wj0eQ44D2Bvk6gSiagS9Rtikk7rS62q3FkYj9SSal7UD4B2hsvL80FG7Hw+jP
         4lQA==
X-Gm-Message-State: AOJu0YyA+4p9193suhAbbDwIPYiMFWDPAaxGbt7Shc/ORZrYSNCC1KSf
	58RBMPdmkpc19nwIM468IU2DEakwErEu+tIsVqQlitfuvAyUlbUa1MyjvpA6KJNhuFMVHJ7hiuI
	sdeI8XDSvGnP4TJ3SryIcMsjBxPCEOrsuvzcOIjuAegwfBmI5h+I0KtMAoQ==
X-Google-Smtp-Source: AGHT+IF/ILp4C+BsiS38oKgAOXmQ+mU8zqK/MQqgsIGFBg3XWXLdpEB90k5eJ4Mgd2FeYirmoo44bc5dQjGv7yEaZwAyqHeXvZnw
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2710:b0:476:fdd3:7bf6 with SMTP id
 m16-20020a056638271000b00476fdd37bf6mr118712jav.3.1710852504752; Tue, 19 Mar
 2024 05:48:24 -0700 (PDT)
Date: Tue, 19 Mar 2024 05:48:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cf3aae061402e3f0@google.com>
Subject: [syzbot] Monthly input report (Mar 2024)
From: syzbot <syzbot+listcb0f0391866add338d69@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 2 new issues were detected and 0 were fixed.
In total, 16 issues are still open and 52 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4654    Yes   WARNING in input_mt_init_slots
                  https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
<2> 454     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3> 312     Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<4> 163     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<5> 156     Yes   KASAN: stack-out-of-bounds Read in sched_show_task
                  https://syzkaller.appspot.com/bug?extid=8d2757d62d403b2d9275
<6> 4       Yes   WARNING in __input_unregister_device
                  https://syzkaller.appspot.com/bug?extid=b03b0fc32e288051502d
<7> 4       Yes   WARNING in input_unregister_device (2)
                  https://syzkaller.appspot.com/bug?extid=617f4ccb03b9869f6494

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

