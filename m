Return-Path: <linux-input+bounces-5277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C655D9458AB
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 09:27:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70DC81F24498
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 07:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7DA1BF32F;
	Fri,  2 Aug 2024 07:26:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532CA1BF323
	for <linux-input@vger.kernel.org>; Fri,  2 Aug 2024 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722583589; cv=none; b=OXRCpr8hEIvWRE3AtTW83Dbt/mQtJzPqzqeIYI81x0QzvccBCVAkeAxdIFkWzqiIDM3srAyowZA2ug6OB8Lpngw+DK2q5X2dyBg4kkFJLFrDX4ppGgkW5hUbcgRzGboty2JSL9GGuECUAkMqSH5hffl50TLyfp5BNNPaSO9+/Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722583589; c=relaxed/simple;
	bh=Oxm/pfSsuLOgexnoccmfnLZAlQbLWyVX1uliw0z/UC8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cIAzK7ZdGQl3zTykfRdXwC9GIokVSmcFxnUA8O5PzKzJ5apwIhM5DAj8C6XTEnKgmlZbiygHTGy/I0OY6OAVaV86LFXUaHS5S9PaPTYzT6t/x+tXJ9CfYaZ05C5o2lKO4OFKnZTAIp2de+yF2yUq5z5r319q4p3sjvQSdOzWmIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39827d07ca7so136660565ab.3
        for <linux-input@vger.kernel.org>; Fri, 02 Aug 2024 00:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722583587; x=1723188387;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BCr9LnPSoHkIK4J/GpkYOT3P7xvLGVBQAKEbbV6/rSI=;
        b=BePXmf54exwhknKu+7IXepojdOXX64umayIJe8gMVUnuV7EzXSXBJkL4xDMASdrnkj
         MV8PZfFos8vfQt3ehHtSYRuf2HwjFxTWczRzdT4405tp0nVJjldh3HG6cCvc6XVrqYsA
         ZZyonZFUd/qL5DlGYlVZ7tU4+opDUpCcRSAzY3Bmsy0noEXQeFx59RxtIeFhhWV/RBTz
         brwtKxh4Ykj3xKV88Z5kKb02ioiI78gjIvScXbP6xX3KO5z08gvi0AFtLu6Ar95HsUZy
         8GvGFi6RqqbUnQwn4FD9dxL0NYt4sgF/MH/XtQzqSmOKM0yQGYOgBVqFv1+hep+hUOVD
         X0jA==
X-Gm-Message-State: AOJu0YzV/YFHRq+WAxM2wwmxNJwCJiURelcFdfI9VGt1JAIhT4jsaUIf
	+r0REaRo3e7ReuthDOlUTGOnfKzTtVtlTxy/maW7WPTNETiEpMWl8vjkRb53oXXMiEoU6y/4KXS
	Po9ypYkLgMxXeJN9LgO3FJhi6q8utQ+gq591oon5UqjVD5oxEvDwhIz4=
X-Google-Smtp-Source: AGHT+IG+3+ysEdazJDjhmIN2EU+CswIpTEaa+h2llnHNpHqurWiCjI9rJ+YFuw5B1Y44ucmrbPztL27jYkvUAfnLWzIG29UHgVFq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:214b:b0:39a:ea86:12f2 with SMTP id
 e9e14a558f8ab-39b1fca07c2mr2396255ab.6.1722583587405; Fri, 02 Aug 2024
 00:26:27 -0700 (PDT)
Date: Fri, 02 Aug 2024 00:26:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2ce01061eae3e22@google.com>
Subject: [syzbot] Monthly input report (Aug 2024)
From: syzbot <syzbot+list9ef74d105b31e667593b@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 1 new issues were detected and 1 were fixed.
In total, 19 issues are still open and 56 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 685     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2> 389     Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<3> 326     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<4> 21      Yes   possible deadlock in uinput_request_submit
                  https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<5> 19      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<6> 2       Yes   INFO: rcu detected stall in asm_exc_page_fault
                  https://syzkaller.appspot.com/bug?extid=360faf5c01a5be55581d
<7> 2       Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
                  https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

