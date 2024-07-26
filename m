Return-Path: <linux-input+bounces-5169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 980FE93DADF
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2024 00:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16BDCB21B7B
	for <lists+linux-input@lfdr.de>; Fri, 26 Jul 2024 22:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F7F14F10E;
	Fri, 26 Jul 2024 22:57:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887BE14E2E2
	for <linux-input@vger.kernel.org>; Fri, 26 Jul 2024 22:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722034626; cv=none; b=jMPBbzfJuXFvEMn++zHqh0J0Qsmem7/mgYP2vi44fiQry4G2vnXBH6A8NdZ3nP3uGHPlRRX0vrknLhThsiMSTn9ewHbQvSwv3t9hLg4YSCggTZ7Tgel2/X5q/avNiUEUSwHyuSQQArbwS1ucjAY1mNafM4IeoJAGwqjoU874VLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722034626; c=relaxed/simple;
	bh=UhWI7TcLxejpJoI+IfqhEmkIioV4bu09QRF+kzi+Euk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Bq0jeNdm+sRGQyqRnhv+A+HwdjgYcod+SzEJYXv3GXKK2QAl5yQy7lqTeI56nTWz5Ix6glPKMxV+SgxKu7e4mkxyFYmlLuJplV7yo/Ez81GaZgaXwtKCjnva2icVpRN8bkY+Uaf0QOviQeJmanpDuqqeppp0EXZCHA9Qnudf0b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-39915b8e08dso38098965ab.0
        for <linux-input@vger.kernel.org>; Fri, 26 Jul 2024 15:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722034624; x=1722639424;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfHEsQdhoJOdt0CYCZsm++AlvwlAzWoJHsIj6s9Xdbc=;
        b=OYmKR/wRhW84hNHI4CjuS0DjtRUScCCz6++70Wz1I+IQoeCVRaQ1sj3QhvH63lIEGV
         8q6gCsxuV7nLKYqd3jmU8kzdzHDKfAiDQPJouggfkF8OkkjtZZYhJJAepTaHWxN6aIpD
         /aWTSd+qyzhw94uO3OKPujRnwkuJVhIlyl0MmErYOc5c6+SmpikTKwQOpXE9bh9Ufjy4
         DnNiuOIwsYZDno0FmjFLmeFMpMdCgQbW0p90j2HVdlikUmmZS2xV52vf8/b9MdI/b40b
         PTlVY+xkH+JGmqT4o/s2jW0XGQe24QsRpvkSv4xS1JDk6JCRqBml4aQOUSmWEag6DJcj
         gaeA==
X-Forwarded-Encrypted: i=1; AJvYcCVMnz63fmnIJK16FHBVDyYoFnft7oO0weaMuonYhYKwqBpYhdyEHtaBwB+SBXkEPtf//Vb4GJbz6RT6Im5dhzEEqF8xcxohRdQg70s=
X-Gm-Message-State: AOJu0Yzbma1q4Ij7ScUYyvM/5z071TG7xERR8wW4IuWi5UWZqcgpuvhs
	A9TMcxSgV/pzBYajrbp4YDWLxguG9BuypDxoneR+Nd6DNOtiO7EPSMI37wotT+q4AEYGv9DobeN
	G9+/yhlGDIgCgvxA9UT2Dzx4Z7l9ZRrPihsl7GkOx3/slCQoeDrKd0NQ=
X-Google-Smtp-Source: AGHT+IH1IGReWJjnZICMOV9b++BLUObuYL6w4gT4mDFAVD0lxxD2JZLW2qTvQ0IOykja3TBds2LleQamC0YuWT65jexcIA8WcgEY
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d1d:b0:397:95c7:6f72 with SMTP id
 e9e14a558f8ab-39aec448e1cmr647105ab.6.1722034623729; Fri, 26 Jul 2024
 15:57:03 -0700 (PDT)
Date: Fri, 26 Jul 2024 15:57:03 -0700
In-Reply-To: <0000000000002b27c60592b00f38@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000009e19c061e2e6e93@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING in implement
From: syzbot <syzbot+38e7237add3712479d65@syzkaller.appspotmail.com>
To: andreyknvl@google.com, benjamin.tissoires@redhat.com, bentiss@kernel.org, 
	jikos@kernel.org, jkosina@suse.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	n.zhandarovich@fintech.ru, rientjes@google.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4aa2dcfbad538adf7becd0034a3754e1bd01b2b5
Author: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Date:   Fri May 17 14:19:14 2024 +0000

    HID: core: remove unnecessary WARN_ON() in implement()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=13a010d3980000
start commit:   b9ddbb0cde2a Merge tag 'parisc-for-6.6-rc5' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=b89b61abf7449972
dashboard link: https://syzkaller.appspot.com/bug?extid=38e7237add3712479d65
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15eebef1680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1375f9ce680000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: core: remove unnecessary WARN_ON() in implement()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

