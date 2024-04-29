Return-Path: <linux-input+bounces-3295-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1CE8B58A5
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 14:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B8071C23100
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2024 12:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A9510A1B;
	Mon, 29 Apr 2024 12:34:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECE2BE49
	for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394066; cv=none; b=KfsObuX1wh/i6D/MVDzwKRZwAKoAFr6rI3giC5lIIM0YwLpg6zc2bCssl+siCKgBHHUNRtJQy4TQ16RF8IsS9LMTeOe55xcZEz5kuumzzmwDIuGmNgZvxm8XL5jEGWKnlaz1p4NAPTXyCMfYFfbmeqBle5VQmNIShQGyprf+J40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394066; c=relaxed/simple;
	bh=iDqqQhIJJnghXktLHoDz5uJiq6Ni9j8TH6rY7fM7sqg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bqocu31HsVl5Qeyk3qp59a5u7dqdHlccYQoAux7m9Oc9hapgvUnsdpUaXLUtNOido9ryIY+m9ZC+n4vJhsSOh3q+XUuOeNAYxcL1/3kNjE5xCMMRtky6CvJv2WocSY+RZIA1rRNMsK5G3oJ5FJjLXFcE2AFL4pnbrqfgfAq71IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-7da42114485so511671339f.2
        for <linux-input@vger.kernel.org>; Mon, 29 Apr 2024 05:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714394064; x=1714998864;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4OW9VaedrxWnfIaTNBG4Xp+9p47YfTdxxPG8bMoDoY8=;
        b=vpu3oBPtcZEOehro1sI1RQa4j3/sVAjz/abNvaA3mnenWH8Phb/v2ikEOip36lR6jL
         BPIMprMfP+eiqfGYBLa3e646cXrCDWoQZlcv9zFFKvM84UCFVPF9w0tPtxRyZDdB6YFa
         DIb1aWENLL6QoupDXhTaI7wW3aNNjuOPwsRGhRHPVqLmd+l1e4OQ3oSDMMpd6UOJPwPU
         eq14uwpnRcFV3TxfEnZF9LSWQcaBlU1tK9f9o75awiUhcAnp9VeqRJ++fieqliVyQtEf
         2hp3yaxJCOySdZvjjAr9f3lp396IQJa1sxDnO9GxrOB2JLyNELN/s8B0ILE/2o2iQcNG
         SoNQ==
X-Gm-Message-State: AOJu0YwrJHgPxMiZjt5H7WebaK17YJJWWyf+xlNHCt0s3b3wMo6c5hj5
	wMJNN1yQrTfrs2VorDsgaKE/GkzwOddj8zFqPHP9sHf/d5wC7zjXLNhQ2GXx2+PTIl1p2ltHdHf
	Ik6/FSHxqfOUe0doS9Ldrt1JpDlMT9yRhmKbV5bNg4efUNkWrsV9UiW4=
X-Google-Smtp-Source: AGHT+IGBj0PlrFBsMOATgy205RTj1TTdMNJYO3IUfPR3uqHlDBSkOEUUw2ycJCjIpx4mpIAw5rr5MpXO2b4XdFBa+O02VqULWTt3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2b82:b0:7da:bccd:c3e3 with SMTP id
 r2-20020a0566022b8200b007dabccdc3e3mr196996iov.1.1714394064489; Mon, 29 Apr
 2024 05:34:24 -0700 (PDT)
Date: Mon, 29 Apr 2024 05:34:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000381ef106173b790d@google.com>
Subject: [syzbot] Monthly input report (Apr 2024)
From: syzbot <syzbot+listc1af72bbe1a564d080e9@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 0 were fixed.
In total, 20 issues are still open and 52 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 8456    Yes   WARNING in input_mt_init_slots
                  https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
<2> 952     Yes   WARNING in implement
                  https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
<3> 553     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<4> 375     Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<5> 250     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<6> 1       Yes   WARNING in bcm5974_start_traffic/usb_submit_urb (2)
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

