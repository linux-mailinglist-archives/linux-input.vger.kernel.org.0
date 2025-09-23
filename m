Return-Path: <linux-input+bounces-15001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB4B95B79
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 13:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B394160DFB
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 11:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDEF32126D;
	Tue, 23 Sep 2025 11:44:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9829212D7C
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627845; cv=none; b=M4e4rygf2KYSoQD3+90q2CDNfnjJWB0DD7jL9DRokikoAJdyiOUObZbmfTmIizYBIYiEUn1KXYW1UfEa7wa3s9TcSUlKcsW40HdiuwE48/5ix1INarUWf72Zv0H+XNrBwYTAWFONXBprA4O5SZnvZLscHtwWyHa3ZyuYIshMWug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627845; c=relaxed/simple;
	bh=MjgUiv1hiBVmGYAWbKukWHwYzxXC3U5WUKEUQFe8mHw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Lb1VGSOsolRLamNV+Oo12eSfPNvQB3DRTkLm2iBTYO8qnWcYPF8wEh7ji9EXBogaFU9jTOeb4lWfUorD5SxkIraLJmEMjhnDdRVi3ecoF8Iio6ZBymYNMGNGpgpMjzQ+lLeDyy6zERNbDxfS8hU9WfBXIxvo0snHX7jU2/vRtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-42574804553so66628805ab.0
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 04:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758627843; x=1759232643;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQVvBj5uZq6uuQ1nu4UWRVsR/gDk+9EG2enfLEYGBRo=;
        b=TUF5zKzuhg5F11Pl0xjIBZznc7n4bwG3PQczUaU76pESW+8a1pLV27Cg/Oqb7E0ht8
         M94mBYx6wwoe6rjGoZOUyIa8iebHrYSdtjgRn2rlUxG6buKc2XIeK1IkpHlMHeqdRRC9
         /8bsd8eGTlzvjpSy9CyC4eyaEjC7JlCF6RZouAkNk4OBODBBbTOLyZ8NmZzlcg06N0Nh
         GyLDuAaod6vR8oLGZHvgS7nYPQs5Yqg1PjQ0g+N/mBGnHDjvbkI8G75SedAsJHoaSKCD
         d4JqD7IOAsrQSBT16lbFzGJDijm8fofMnmF1iMPjkEf3eeAF7HaoiyIVu6mmHs15nhP1
         Zjrw==
X-Forwarded-Encrypted: i=1; AJvYcCXL7inIYJDVhaD7XX52QBaBwLd2OXT5nzX1W0n0xD2DRMIRZ7H9RCjjY2MXTcAaFZU8Ou3f1YmMW82LSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpjVV8twBuzFKqQ3U29/rvOqk/e99s+q9XqBvUk4C8eYY8Pfyg
	6C8k1TUrX9SUUY1qDBjNFT87IpHdakHOu0bWKJ9CJI5+T8FuKm5/tQuyR3wHs+h4I36Dk4/bXAE
	71on1D8OLvt2eDQToZW2Sspr8GB2UxzcUiycNxPltjVSMQ7IsRAgrSTUqY+4=
X-Google-Smtp-Source: AGHT+IFvOJRcG5WosHB0HMKe1uFAe6PQYbdY3i4QCDRSAtKAc7Sh8RXeNxUbnOUCvmi0umdlPKZnG7LEi2yQoCd/aYVeiM8/3Lnq
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c23:b0:424:7d35:bce8 with SMTP id
 e9e14a558f8ab-42581eae244mr39857525ab.25.1758627843063; Tue, 23 Sep 2025
 04:44:03 -0700 (PDT)
Date: Tue, 23 Sep 2025 04:44:03 -0700
In-Reply-To: <67d30ef2.050a0220.14e108.003a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68d28803.a70a0220.4f78.0006.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING in hanwang_open/usb_submit_urb
From: syzbot <syzbot+9fe8f6caeb5661802ca2@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, oneukum@suse.com, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 503bbde34cc3dd2acd231f277ba70c3f9ed22e59
Author: Oliver Neukum <oneukum@suse.com>
Date:   Thu Jun 12 12:20:25 2025 +0000

    usb: core: usb_submit_urb: downgrade type check

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1066627c580000
start commit:   038d61fd6422 Linux 6.16
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=515ec0b49771bcd1
dashboard link: https://syzkaller.appspot.com/bug?extid=9fe8f6caeb5661802ca2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=109ab1a2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=136cf2f0580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: usb: core: usb_submit_urb: downgrade type check

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

