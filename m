Return-Path: <linux-input+bounces-16614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EECD3CC7C8F
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 14:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F6273009418
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 13:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177E8361DA7;
	Wed, 17 Dec 2025 13:12:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4C8361DA6
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 13:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977154; cv=none; b=uj4m0HXgJg3Cb1VpYxMMEUfvpUcWkh/7hf6dE19FmQNjClBnQQ/ZOnYvPnbpvjq1VVEd853Jfy74PZ6g2uUPTKv4Ts5578s4ikc6Mz+UhXxHZUzFjko9JaqLeV0ka1qN9dU3j+YO9yPmwImG62XROnWc7VmUGIQvTs72Dv8x/bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977154; c=relaxed/simple;
	bh=ZVYry4Umrf3PyaqRnyfKdOEZMDbwt+TNVpjJqGhhh7A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IMik0ReTBm2ys/NWSnT2+dFYX4wEc0msk8fSAuQDnBFQvsBr/8iWbUz5vzpguhtF9s0+tYFSi4DLYHuVcoqcg217cfiKhbJ54gU6fpE/nt6mBxD0IA9LmQEL21wZ1by5djr6pZhGwQ9zXutxFuUsWYJhlFw++OcBWs32II2wvXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-65bcccf601fso2806521eaf.3
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 05:12:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977151; x=1766581951;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DSt1bia3aWUVXuvtwBRYIYeTarFh+EvdggfmlKsb08A=;
        b=t2t0rOM/5ICXtZtNJ4CROL9xwSNpVL/s4i9+MPmGSqZCpnS1uClXB/OAlWBGQFrDy8
         VrrZQhrYDxMfux7Kfy7e4+yHQeLiKVULOGF0rlCbP+dORAsZsfZZX3waqjqfjQHmK9QR
         4+OtUoGP6SjTJWdsC06oV3jJFUohHEy2IptqbC/AmdRzCIyvnozdmp4p44/6D7L39/Pm
         GOxKd2pbAUujlDGijInHS958nKV/aPY4SuAZci6p1N0OC3EPFBgIoLATWRrN0SutfzK1
         vx9Hx4db/7xuMrjNWADQzQ8XmOLYo5/LqaXqq8VkXXmRve4q6RkTxcNZblm/ocrtWdAe
         riNw==
X-Gm-Message-State: AOJu0YyNJAtd+g3OY8WHcsJo247uBgQce85WG1xnRkl9w2loiiLMGlSd
	+GBmsoPytZDMIve3Cs//7x7Cr6U9Fmu8tMWJJOe4kJddJ5vP0Wq7/MbIAzNB9O7SNIH/cbkdizN
	RVgLIcOl6IDthnCF8isymsc8iv2BKUgD64F4Kb9g32ItmXPVdS/PiPhQbtn4=
X-Google-Smtp-Source: AGHT+IGgGWxlJdHNgSK15JwFy+TkLncxSs3YHkZbEjZBw+X6JsIXakP8CyJtmUWEhpzRcGAkDuBbtajUqgF4DWL9USawCNom8Kl5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:60c:b0:659:9a49:8ebe with SMTP id
 006d021491bc7-65b4527f9ecmr8540069eaf.66.1765977151374; Wed, 17 Dec 2025
 05:12:31 -0800 (PST)
Date: Wed, 17 Dec 2025 05:12:31 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6942ac3f.a70a0220.25eec0.001b.GAE@google.com>
Subject: [syzbot] Monthly input report (Dec 2025)
From: syzbot <syzbot+list0d551e5d339087b02536@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 22 issues are still open and 63 have already been fixed.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  3202    Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                   https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<2>  1621    No    possible deadlock in evdev_pass_values (2)
                   https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<3>  241     Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event (2)
                   https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
<4>  107     Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                   https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<5>  74      Yes   possible deadlock in uinput_request_submit
                   https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<6>  47      No    KASAN: slab-use-after-free Read in report_descriptor_read
                   https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
<7>  46      Yes   WARNING in cm109_urb_irq_callback
                   https://syzkaller.appspot.com/bug?extid=c708736c2ec142a386fd
<8>  13      Yes   INFO: task hung in console_callback (6)
                   https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d
<9>  3       No    WARNING in cm109_input_open
                   https://syzkaller.appspot.com/bug?extid=fed3fab8533934671abc
<10> 2       No    possible deadlock in tasklet_action_common
                   https://syzkaller.appspot.com/bug?extid=16c5be44e508252dc97a

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

