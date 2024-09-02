Return-Path: <linux-input+bounces-6044-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFAC968180
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 10:17:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EE228189B
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 08:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AF614F132;
	Mon,  2 Sep 2024 08:17:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A768460
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725265043; cv=none; b=mbjRynNhCiWBjX1U9PpT7Hf9UVhROama0RImVamhwKpkXaC7h3slaFft69ditf7m6a8TPlLq+XuocovNAPHfI2mOPlbILIKWkkJ/1xWynEoF8SJofddP4lBbRMqpShXOS9GYEdRutMobqPfEHqcZkuge0nTkvNANB2i9duZbxW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725265043; c=relaxed/simple;
	bh=IRTJHVYUzlZ9RvtWow2fn+GIAETMjVyYAVFQqMO2Jgk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=e11cRf6yEhttZXrztyAVZRviE+ADL2HzB/KBcLW++8Bx2GnCpyAmcJ+UMybSd1IYc2RD4kxc/xe04GI08YhKLNiHmktRTcVxHTQcFh7V81M2b3Z0ZC3iFn3R1dwNsNHPpcJ78JrOr4WyGzYGzr2P3gw+fICg9nGQVUHI2y77Opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-82a1c57f4dcso499229439f.2
        for <linux-input@vger.kernel.org>; Mon, 02 Sep 2024 01:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725265041; x=1725869841;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2sns7FwWpwK54OmxtXlX+1DBcBpWQtZaZin2PDIL4+0=;
        b=U6O6Eu+sXwKDobqxKfuthhnjFeVlXNDWIkhaQ7UYb1bRMbqU4H+Xh0lKaZste0pcmR
         1w6if/kE5/rAnVqdSqM32giNNlWVTOOS3uyt8hl0Nk8AMl9OQ2CzIcvAhXGLpwJZjlql
         xYQLelSNtmUxi+huZHv7Gvtpe47kw9Q99VJuln0iaFWGBEG2dBoAkoyqQlD61YnjZQQY
         DMb3MgsbEsaLmSa4vZNI1FB904FHQ6SuD3IWcHmqqcPQ7fX9BQXfU5gLTCXp/M7eAlFB
         OVTBoAtFoRoF198lepJdc1rxNKQdH2BPNrZrosvIejG90zhFlYlcFFbQ4aFZJUNdveM8
         rTbw==
X-Gm-Message-State: AOJu0YwCMEY6FYKjPKkQVxdpC1yT90rxgEaKYpuK1xxmBk0JNr4by4S6
	F2epvrgyERsITed+MiOtbohzmu321M5j9xLzLN9ye/tputIp/BgzjyWyRDTEU/fuP9wFfaYIlIc
	yzjVEQKKAc+MlPWkgGJgDCkkQXclhdMuWZ7ZtmusglhuyCDgBXozhawM=
X-Google-Smtp-Source: AGHT+IGbwOCsNT+/J0+VefbIlcQy4+aRzLa3+CQCPb/6igbcthkuqiPhcsqwpBWr6e16Rf1yZ4MtiBXaLjNbXVhny5tNaffBanRZ
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e09:b0:39d:637f:97cf with SMTP id
 e9e14a558f8ab-39f40ef46b7mr6736105ab.1.1725265040927; Mon, 02 Sep 2024
 01:17:20 -0700 (PDT)
Date: Mon, 02 Sep 2024 01:17:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e882a306211e9197@google.com>
Subject: [syzbot] Monthly input report (Sep 2024)
From: syzbot <syzbot+list404de26cc86aa8de7c97@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 18 issues are still open and 57 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 702     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<2> 392     Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<3> 353     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<4> 23      Yes   WARNING in cm109_input_open/usb_submit_urb (3)
                  https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
<5> 21      Yes   possible deadlock in uinput_request_submit
                  https://syzkaller.appspot.com/bug?extid=159077b1355b8cd72757
<6> 19      No    possible deadlock in __input_unregister_device
                  https://syzkaller.appspot.com/bug?extid=3f4bf5c599ee9b16d704
<7> 10      Yes   INFO: rcu detected stall in sendmsg (4)
                  https://syzkaller.appspot.com/bug?extid=9c0539eda655673bdaa4
<8> 9       No    possible deadlock in hid_hw_open
                  https://syzkaller.appspot.com/bug?extid=2313ca2498b9554beeba
<9> 3       Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
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

