Return-Path: <linux-input+bounces-1290-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1C0830227
	for <lists+linux-input@lfdr.de>; Wed, 17 Jan 2024 10:21:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 764B31F251BB
	for <lists+linux-input@lfdr.de>; Wed, 17 Jan 2024 09:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4BF914013;
	Wed, 17 Jan 2024 09:21:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791A913ADD
	for <linux-input@vger.kernel.org>; Wed, 17 Jan 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705483282; cv=none; b=FT/MB8/Wz4KdhJlw0kjuUlwuv1aHMOOFl8oz2LeXDKAnN7T6fmxct9rxJP6BzPwOSkPesOQjz9Qxb1Ukx+y5GvOpk/rj7hFIV/QCzRdK1QOLr4USFILbDT/9Wj0ecz5VGmj0VR773VShLkStUbqtZagPYgSbqgOv2qQC3qhfSIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705483282; c=relaxed/simple;
	bh=s5vuN6JWkgaXfmqPxiqAmbI3bXzyrZtw626VB7EuW+c=;
	h=Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Google-Smtp-Source:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:
	 Message-ID:Subject:From:To:Content-Type; b=Q8sPwLnoR3crQq7mEF6NdgynElZNhobsXjOPDZ242pdSejv4QKgZrZH3lUMcLJBK69DVHezRcE597sTonLOxCGQ/245S4g+d7dd+EPIoZ6hILlrV3tto81RsJsTxCqfyXgpzNyRHGNncplveN7ptQgy8u932bhNon5kYOKCEBhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3618ed4a2f5so9968285ab.3
        for <linux-input@vger.kernel.org>; Wed, 17 Jan 2024 01:21:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483280; x=1706088080;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Up+jt1bihbVkBuUSBW+4TnpBfqZB9U3eKOg/evtGkN8=;
        b=mgQVNJMsc7CAKaD9XQTqvqVyyPWEPHPqVIUYBQn/8zLDZbrGw3NttbXXx0kTSNwVyC
         +LjEKndi6O+CRLOox0GhjP7Oz8orJ5iJF0g/m2om0Pn4aUqpz5poMC2LFM8FXFU54IQd
         v3hUb9AOGajG4CoiL6izs+XuOQIBQiruMm3bi5YAZHxYDGgv7jTSr7uIF7UXr0LeyYzo
         +e5vsvfr1HZXuwaECgACEtUD1ZLtu/iiMPrdOKxgrSHwAskXbHmAsB64RVNVwURbTYTW
         YESS5G8QS0j0y+1lRs4ftiwMitROQXh2khV+3XR4Zwqjk7JAEeLyLsUj3daQCoWRKGyJ
         3DNQ==
X-Gm-Message-State: AOJu0Yx1pawauZFmDiZvWEpAineezlKpyej7cGKoD7mt0BnLNqCKWPfE
	040BwNSaVR90zuIabYdg5yn8077zZ7R8XmPVSIKLLl1Bsgv2K6U=
X-Google-Smtp-Source: AGHT+IGj5Jz/cVztIRPm1xyeRL71jW9Gjid3kd57muWdi+IvewSnwCcswtoo81J75UUWRsb9pLwrUMeVpn/k2lEgyCspNgrP0743
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca5:b0:361:8d02:f37d with SMTP id
 x5-20020a056e021ca500b003618d02f37dmr266518ill.4.1705483280708; Wed, 17 Jan
 2024 01:21:20 -0800 (PST)
Date: Wed, 17 Jan 2024 01:21:20 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001df937060f20c585@google.com>
Subject: [syzbot] Monthly input report (Jan 2024)
From: syzbot <syzbot+listb3639229afd4dbbee8c1@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 0 new issues were detected and 0 were fixed.
In total, 12 issues are still open and 51 have been fixed so far.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4133    Yes   WARNING in input_mt_init_slots
                  https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
<2> 947     Yes   WARNING in implement
                  https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
<3> 353     No    possible deadlock in evdev_pass_values (2)
                  https://syzkaller.appspot.com/bug?extid=13d3cb2a3dc61e6092f5
<4> 149     Yes   WARNING in cm109_urb_irq_callback/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=2d6d691af5ab4b7e66df
<5> 90      Yes   INFO: task hung in uhid_char_release
                  https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
<6> 39      Yes   WARNING in bcm5974_start_traffic/usb_submit_urb
                  https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.

