Return-Path: <linux-input+bounces-14672-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D81B55EAF
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 07:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCF0D5A5E0C
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 05:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7BB2D877C;
	Sat, 13 Sep 2025 05:52:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C57C15A8
	for <linux-input@vger.kernel.org>; Sat, 13 Sep 2025 05:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757742724; cv=none; b=HaGL+NqtFI4eIXNN9VxmPuVtIzek36nXAvnK6YFQyF5ox3cjvQRNltFZenHMc+Io1yvJkEA1gL1OSoNy/AzK837vc9JD5+SqWQaitHVAzD6FQ3MbDcufqTwiLeZmV2jnX84hMG2Ejh6MzVJLf12TnlMlKMXsrklguoKMWLal/Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757742724; c=relaxed/simple;
	bh=xGPegRzuNLv3LRNKDrzS2ewnzTSM2mX5OE4KUOhzgPQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O6skrdm9iBWDKtqZC2FWwj9TzvKZkbHKdNTNbKqzHZ9KlAnqLThkLtpeCXFUev5f/lH1ERqWV5kFdMGW97AqUaDRz2cogUNV5Y8m3xV+sq7i5Cl4yAXj/XOYTAqsVLTfSJ+w3RBFtpdfH41KPRsFNaArU1PqZtYlaxKDLWDKPPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3f31ac5bd9cso35254015ab.3
        for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 22:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757742722; x=1758347522;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q4GDTDTfVbRvI3gWdPHWafppZWRiyes43kmSXWWR0Y=;
        b=LMPgWttmNRZABFmz09+5wTyIOeOAe51nCYPm0cZ3kaO6AR4+i+Qn38Y60QUn1YOaLt
         xOO0Q/FBjhwuM/1AxRij9jQzKrGZT8dGeaQG0igTvYmp11bJ+3UXpmISH8djiyY0lWWB
         yoOHRJbdoOTJRivRUkwcoNcAnFHRSOOhyeVsTktvKDMCBUBmg7WpM/2H+TF6bBK+KNXy
         nUrZXURHFkWqQmUvOUBD+3vfRJR3H+ZJcXCH5XqFa4VE91rI5As7OC9MfzkNnhIXsR4x
         N2om5KOrBHpL7SAngT7v7Ldu5zsmunKXd35zOFNs5Wz/dcwqlF8nXr8jVujPhC3TrJUg
         POxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhDqfh9WecVWJ/VGXGeOvxAxyWvmmaWwqIQfl4U2qbNbTddnDV2Az8Q13mxGVOVT7cZAWH8tWiKN7yaQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPp/6BK9kLGD8cegKr2IjoaJUXAEOn0UCraEiWGWTGdQfrwk0B
	dJA0N5tEYja1sBznIPAiOYzAzJovak+q79OcXyID+cXXaRmoZOwXvfFAUKQyLyRZSjVrd6S7Jcb
	qCdOyNy317jgFVGolY6SxTL5jXNuPzP+L0ZjPuNyR0swLleSQTh0wxUKZJfQ=
X-Google-Smtp-Source: AGHT+IH75E6b9SBa8LhFDw80zMp/sVQyJhrQJ58ghpl6NDTYgceCwekJEwE/vEy7D+gF3MhvzY5EAEzAw6NXmtYe2GbT3nXJsMIj
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1527:b0:419:b24f:30b with SMTP id
 e9e14a558f8ab-4209e64b589mr73259745ab.9.1757742722379; Fri, 12 Sep 2025
 22:52:02 -0700 (PDT)
Date: Fri, 12 Sep 2025 22:52:02 -0700
In-Reply-To: <0000000000008acb1e061618e68e@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68c50682.050a0220.2ff435.036c.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING in bcm5974_start_traffic/usb_submit_urb
 (2)
From: syzbot <syzbot+b064b5599f18f7ebb1e1@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, 
	javier.carrasco@wolfvision.net, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mukattreyee@gmail.com, oneukum@suse.com, rydberg@bitmath.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 503bbde34cc3dd2acd231f277ba70c3f9ed22e59
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu Jun 12 12:20:25 2025 +0000

    usb: core: usb_submit_urb: downgrade type check

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16c6eb62580000
start commit:   e8ab83e34bdc Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=a9a25b7a36123454
dashboard link: https://syzkaller.appspot.com/bug?extid=b064b5599f18f7ebb1e1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1514f0f4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11699a70580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usb: core: usb_submit_urb: downgrade type check

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

