Return-Path: <linux-input+bounces-5122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70706939931
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 07:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 193B41F227FD
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 05:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF38013A24A;
	Tue, 23 Jul 2024 05:33:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639F13CFB6
	for <linux-input@vger.kernel.org>; Tue, 23 Jul 2024 05:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721712785; cv=none; b=ai2xSHVkhvadc2BAUexK6eiZBtLRTzMrwLa1fTQ8vYiuJHESIMYlzCuxL1U74rEn0hoZ7ohlzyHvy39bKPBWBNNr/4cx8QTH+S+pf/D/U+hdGyh/GqWnsOVr/5XiK1Muy+ZjPzqY8LGBTlKelJ0Mu8aA6QhI7lILckPEGND7q+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721712785; c=relaxed/simple;
	bh=Xz44m3j+L46P7S2MMO91l6CGoQ99zGgAJVWIu+b0MzA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Yewny3XqIPpdxTY9aoUAYvscrY7OR9zvxLAaUL8kQlB3oMikfrWJ0Zusr7/RvRDTrEP461qCcjsLH4eM2+U895pyvFvBaHRqkBeaiIKW9Vr9Dn3gqvHaONGtF4NXmpEoWLon40sDoiZ9mWuaQzWddO+O3PQrzr7y5pfJOFgk+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-806199616d0so824449439f.2
        for <linux-input@vger.kernel.org>; Mon, 22 Jul 2024 22:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721712783; x=1722317583;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=07mMm2HTl+CxW+FUdHtY4cD8npz62x8KwHeALxluW4s=;
        b=ctgL6yqhPPpX1hk5MWS974Bjj32vRldytGHe/g3CLz6SLq0iySn91bnSa6UvmvltS8
         HbD7GrHYLRs6bodUs8LI/wOb4vexf7otMznpz2usvzeEdffbYBNop3zp9fB1TB9Hhc66
         WpSK5IEzYJz3jabK5UB/lfmMS8ljrr9VaH9FB8HAJhbhz1l5JaE324Z6PrpML6dl0Cq7
         skb7V0lkb1RIroPrPQndeHZDbOKMiG2QuDDZBeanlNlYRPNzbXhEQBUvoKg1rib+mR/f
         t+YX/uLyTOlj3Y0Rnl/7+/yNQJtBYGTQLS4e8H1kWgbfgDyUfjEpFjGofVu7KV4NKe8I
         11YA==
X-Forwarded-Encrypted: i=1; AJvYcCWeYqsj9x3+CV2I1ORepqKXYIDXSnWgHdBcVowwQGNcr80jfEATpqH8z2CZ48MEGtNe12WYFXe3XX9Bhfzw2/xlcxw/kSsrxf9MqeI=
X-Gm-Message-State: AOJu0Yykyvjut8WB4HjUU+uRrBVPOEXVrzhansHgToHe4gkh8rtH7da9
	Ubzex9gmYauPlceEuflqwgPweHq28dD2S6/RgVnJwsCt+GsozgEuBvEqmVkaFO5PvhyUDGKtpUb
	vpJDr1iYLkUO0WERqPdPqwlxMB5YYtE00yJ43svElxGIB512nbQXpRQM=
X-Google-Smtp-Source: AGHT+IHGUsJC9VmsmU3cOOtHllIAk7yjZD1XGw3IEHkz1rRt8RwHdENbZCLzfNxhapQPT1mMfdgZ1LUMZ9nXHianD+oLMY/bU37b
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:2187:b0:4bb:624c:5a7f with SMTP id
 8926c6da1cb9f-4c23fcbd7b6mr437637173.1.1721712783378; Mon, 22 Jul 2024
 22:33:03 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:33:03 -0700
In-Reply-To: <0000000000004b841a060e876595@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dbdb25061de37eda@google.com>
Subject: Re: [syzbot] [input?] [usb?] WARNING in input_unregister_device (2)
From: syzbot <syzbot+617f4ccb03b9869f6494@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, eadavis@qq.com, gregkh@linuxfoundation.org, 
	jandryuk@gmail.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, peter.hutterer@who-t.net, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 0774d19038c496f0c3602fb505c43e1b2d8eed85
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon Apr 29 21:50:41 2024 +0000

    Input: try trimming too long modalias strings

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c0adc3980000
start commit:   1c892cdd8fe0 Merge tag 'vfs-6.8-rc6.fixes' of git://git.ke..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=eff9f3183d0a20dd
dashboard link: https://syzkaller.appspot.com/bug?extid=617f4ccb03b9869f6494
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17985b34180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16d8d43c180000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: Input: try trimming too long modalias strings

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

