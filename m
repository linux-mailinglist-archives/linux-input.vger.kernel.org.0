Return-Path: <linux-input+bounces-13584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A56B090E3
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 17:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066F9A40B9F
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 15:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BF82F94B2;
	Thu, 17 Jul 2025 15:49:06 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312362F8C45
	for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767346; cv=none; b=CS0Sb3XTnWo34775LnXu4XbIxr4XojJWDzb0XH/+xwrFkpj/Zp3rwtglsAkCt8jfcFmXbGUxklug1E7vNOkncXTc/ptzyZZ+3BgPBUsB5qn+uu7/DVH85zQFYv4Pi8kyy7tS7U9BDsb2p0IikhJyCHaAecK1LRQTZE9+rVxqycE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767346; c=relaxed/simple;
	bh=uwUycdhfPj6CaQoQpADVkvyXsmH6Btz4yJ0id2qySG0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WikNRPEQoXMUWZX+zxjHv2Azp9OWZChuAovFFdFV6UQlpk1fzUJQiM8jn6C3joW9SlhjU1FAn8Y+go754dC1GzzwIVVj3jG7mNQvbJoPvSPsI8EYfVvBNe/yI7vinGhDi/00WTvXy0aZTcpjGBHaN5G7BONxxGrFUSs1lyHimsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86d1218df67so109698039f.1
        for <linux-input@vger.kernel.org>; Thu, 17 Jul 2025 08:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752767343; x=1753372143;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DkcvYYZYbeS9YyBNkSiQOuihRa5i8q/41A08t0STM0=;
        b=S9k02B6Y8FykE5U79y3SBiiyDNGMF+O32OkDc5pNzUiQLuZxNRtC4GTqL4FGO0WcO2
         HEuofWy8mBlCXK2/XBK7QvErN0LhFnN0XP9fevPgS3XZt9od1k/4oafMJK/NRhhZ86vP
         Ey6/VDXn0LoEYL0tCzqlvQGTeZ5XwLLdwcf9FODdiS8gUjHQbw/2IMsYyYOtLqAcDKFl
         ceaXQJBUhqM1AbBbdd3z3OzUy4Aacsf6zur2AG0db0Ztiuk5xqyYVyQLFbsbYqb3W7xK
         rHOgmxSCPIqQIzpIEmskju7mSQMGoH3m97WWH+GGkgfnjVOtj5RWFd3/BrOckDIKAz2h
         b/Zg==
X-Forwarded-Encrypted: i=1; AJvYcCUzLJgxoG57xpsdmLjaMyNpQbGUaM2riyCbgYJEPKBfzEW8bvDrenh0Sb2iNCpvwU+Yy7bLTtNWSpB2xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyftMhaVD3J/B2dUwMuKLrR7PDE+HNYHybb5s7FCwcHEZxvW/ed
	rzUJp2VJyOffAZdHessAkHtR53eJrXx4rMe16LqMqrb3TCoFXK4hQWtfd2wwNl8/9zD2Cp8bdoi
	dIb+0UCuuqokHMBquFaycl1FpmistEmeQK/cLgk1/eKCVcEvO+hSGg+Tm0lo=
X-Google-Smtp-Source: AGHT+IEf4fyoxXity4Kr6+dzWapHEvcoVCaE3mpTKdMN7UYWTnoIPlTPex69DChCvZAIqhHVq3jwH0inF1qmM/cRIz94nhSUN0lN
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a5e:8801:0:b0:875:ba1e:4d7e with SMTP id
 ca18e2360f4ac-879c28a63bfmr745475839f.6.1752767343310; Thu, 17 Jul 2025
 08:49:03 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:49:03 -0700
In-Reply-To: <15723551-960b-4257-bfbd-073e136deaa2@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68791b6f.a70a0220.693ce.004b.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com
Tested-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com

Tested on:

commit:         c2ca42f1 HID: core: do not bypass hid_hw_raw_request
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
console output: https://syzkaller.appspot.com/x/log.txt?x=148b258c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ec692dfd475747ff
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14dd1382580000

Note: testing is done by a robot and is best-effort only.

