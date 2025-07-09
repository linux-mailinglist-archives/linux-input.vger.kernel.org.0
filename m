Return-Path: <linux-input+bounces-13443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B035AFEE38
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 17:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8E21C42276
	for <lists+linux-input@lfdr.de>; Wed,  9 Jul 2025 15:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CB22E5B21;
	Wed,  9 Jul 2025 15:56:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5228EBFE
	for <linux-input@vger.kernel.org>; Wed,  9 Jul 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752076565; cv=none; b=VgB03b3FKAl/S5FZ8XkjYtvWrMMh7lsBM74tuqPVrWcqitzMN3SnHIDq3rFOkvp8F+Am0jzu2JdLN1IacikpdyQH9KdUbChCL6SmiTc/I+aWpFGC7Go9hgpkow2kCWWS02OGD5LnYGhLU/4nn7Cy1pyDslqGESOJhHuWUWOsUfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752076565; c=relaxed/simple;
	bh=Klhcqa0zXjE1jMAuczJtOID00nhS1/VKgAh4s0ac6qY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fnb5iPemzy/11RVlbDoZ/DifXeW58lvVSUcc7y6hjQewg6+LEU3hgI6fo5Jnddvy2iqP1BYFKgfVmIGfy10C4xjq2GA3kyKMxw1jC5/haY677xNNQBkDTBIVLX+mX/28lXVNCN35vEEDQssg6BxrOhHrN+zUE08k6t4P3s0NQWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-86463467dddso8656939f.3
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 08:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752076563; x=1752681363;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZA6788H/o3UPwVHElcOp7R8jW6eULSWFdSmHy0kTRYk=;
        b=Q3iX17EbOWD9G9s8FQUr4EEWXzEMrzFTgdrPmBr7nqKFopp23m5Ola4I5S0F7WOx8K
         +YyW1F+Ajs6XTR83JrJCTSyey1KjsaBOy4LI9lCbYPAE0Z0WxP93Ia1ZPFx8wqlDnpcg
         5ah/G8WdRpRtPEpn+l8YoH/WywJBnN0wLxOvlHpqWMGoOEGC6mIuqSebz/ZCh/BDSQVM
         c033TPGFNiDTjlUt87azXmUwSvHg9ouobe/+lp3hiE31vXV9M6B/R2G/Aav7nVT+Ttim
         wzCkP0v4mNQJOM+5xY8frbgFZWlWUhuNruK5rRgRJD3oivh5lfay3Y3BwWaNfef3ZCaa
         FIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIjmcdJYso3TI7eXDnEX7aFPWY3aI5TPmNE8BINnolVvmSDasFJZjUqpcWyRJy6S87mjJUj+GI2oy6pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMi5NyWAX7CP3q2XdEzYUYufY+/N1rmJ0L9NUgoeJVyuJLvKdM
	sfJlcucC36Q3u93y+XLdWHqeBbrD1UGvsGT/Y+pRXIOm6mx31jhcEVFSWKz/KtN2x65UVW/6svG
	iZakmLfjWwyBjy0KrdAMkxmIXdWsaZvTjABOSjO4ZNid5zwrPnBKTxDLSaaw=
X-Google-Smtp-Source: AGHT+IHMYgVqoKgL7WaXTj2pN1Mdf52GVHjXjp6h7wMS57lXGHBOyXymkA/DWtdO3E5Hq+lBFpPsgwQ04QJsgHUr9H+vfOMSG0RG
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2dd0:b0:86d:d6:5687 with SMTP id
 ca18e2360f4ac-8795b0c7254mr416874739f.6.1752076563029; Wed, 09 Jul 2025
 08:56:03 -0700 (PDT)
Date: Wed, 09 Jul 2025 08:56:03 -0700
In-Reply-To: <5644bdbc-8449-407c-8e0c-e725e10a40f1@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686e9113.050a0220.385921.0008.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_copy_to_buff
From: syzbot <syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com
Tested-by: syzbot+8258d5439c49d4c35f43@syzkaller.appspotmail.com

Tested on:

commit:         d7b8f8e2 Linux 6.16-rc5
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
console output: https://syzkaller.appspot.com/x/log.txt?x=1155ebd4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f51185bd4f40ad44
dashboard link: https://syzkaller.appspot.com/bug?extid=8258d5439c49d4c35f43
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1113ff70580000

Note: testing is done by a robot and is best-effort only.

