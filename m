Return-Path: <linux-input+bounces-10723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B624BA5D407
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 02:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F15717A9C7F
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 01:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A16F2C182;
	Wed, 12 Mar 2025 01:32:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CA11CBA
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 01:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741743125; cv=none; b=OXe/6xI9DIkKe94um903BlodhPQ1YNkw5WxPpzpvfXiwwu3MtjND/0MFnCRmxRdtl4CU8QzLjh7nJjibiQXDA7QKCsGCNmIpp+L7J8hlE55OtYW7Oz8MLbHf0h2ZGHknosYqKc/D3PtDnSBcGS4mZbh82XfUTNTD2lXU+YSr6O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741743125; c=relaxed/simple;
	bh=F4l7NZLB0Rm6adwPa4hHZJV6NQ9v9upadFqBynFDWg0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=UKAMAoZgw/1HdGhu0SYlvgggviBrnKEe7Gn7Tv7ms/1Oz78XuGfRgHFjo147xmLwiV2m1zUrP7wYSKxQyBMF2vptuIvbhYceXpDz7iH9SjTeGzOu4IjI2swXuO+o70cur8XcKou15Ev5JbiennQEE4plh/8OPKD5mvTRITaykI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-85dad593342so1011139f.1
        for <linux-input@vger.kernel.org>; Tue, 11 Mar 2025 18:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741743123; x=1742347923;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAb8u3Wz9Zo/YhLhIkXP826nMoU4uGw8wY7NG1Aw4u0=;
        b=aRnTSApWsMBDXRKiKplfszXyOUacAtVipVXRc6x7HK+3oDBoXJEBjYIzyA0bNEP2SO
         JHd/3vdJiYzcnJRAUe2KTpVyV5VY2KK8EOC9cvcX/Rj8buh0oCSghMRtsp+OW81hnnPQ
         7l/+CXIoYNCO1pgtBXv2aJ4DNPGfxeTixfgBe7DWQbJOm/Oile3Yt7prSPzv1unX6Tvq
         lXQiHK0mqpZ+9scjwo9N2vQXq0pb8L78qWAShBoDDx3+Xijx7vuFjV0+BYytq0sWnUqP
         qhwHcwozIwd26DHy2OXQqXGmmNX1+E1s5OfCgowzc3E1RfJ2hkwdmCJzmeJxYzI7D91S
         N/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVWRgYkDRFzD3+eqmBpXEvcKjhIFZFCDUJ7vJIht/fFzneYEndy7TVoYcptkN++2HHwF7Q5sfP1bIZZcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXzStX78+eQfF4RaPL5q+wqwNJFZ43LiiXeIaLsHlnkhrJqBDE
	tpL8vfAnsdtNqalDR3cPcc/AIaUnHJueHIsBMuHBKhggmS/W2E8kHd7VGWUgtJz9tLv5oh0R89L
	r9xS6tro0B4oBz19ZgN5GHaSl5ieamfvdEiYDFdYsl8eZd58o2lIIbbc=
X-Google-Smtp-Source: AGHT+IFVesQKcXqzbhSDZRVb3dMC47FpyAhRu+PzTx/pQcJli2sL7nUnmtuGIpcf1Zg9eOmXXDj12iJY4Jv6k1EUegT7+Z6OEBJa
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2142:b0:3cf:c7d3:e4b with SMTP id
 e9e14a558f8ab-3d441a12ceemr254723385ab.21.1741743122823; Tue, 11 Mar 2025
 18:32:02 -0700 (PDT)
Date: Tue, 11 Mar 2025 18:32:02 -0700
In-Reply-To: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67d0e412.050a0220.14e108.0020.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING: ODEBUG bug in devres_release_group
From: syzbot <syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com>
To: bentiss@kernel.org, gregkh@linuxfoundation.org, jikos@kernel.org, 
	jkosina@suse.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, lizhi.xu@windriver.com, rafael@kernel.org, 
	stuart.a.hayhurst@gmail.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 48e487b002891eb0aeaec704c9bed51f028deff1
Author: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Date:   Tue Jan 21 20:00:07 2025 +0000

    HID: corsair-void: Add missing delayed work cancel for headset status

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=16abd478580000
start commit:   c4b9570cfb63 Merge tag 'audit-pr-20250121' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d46425e33fe266e
dashboard link: https://syzkaller.appspot.com/bug?extid=cf5f2dd02bbd4d2d411c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1233c9f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=147eb618580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: corsair-void: Add missing delayed work cancel for headset status

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

