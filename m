Return-Path: <linux-input+bounces-13690-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7EFB12CE0
	for <lists+linux-input@lfdr.de>; Sun, 27 Jul 2025 00:03:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C19617A426
	for <lists+linux-input@lfdr.de>; Sat, 26 Jul 2025 22:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E443E1F1505;
	Sat, 26 Jul 2025 22:03:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7041D9A5F
	for <linux-input@vger.kernel.org>; Sat, 26 Jul 2025 22:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753567384; cv=none; b=DfwHyHfYRHAe/1msWSGvrRhfoV2QKSU/KlnHuAFbRLvN077N+HkAM67gQ67Qf3MYTKpj9qKkl77JXSFd0B7fXMgiEdVIOEMYd2Yuk5txyl6Zd6PccuPVm3FspSMDQ8Bj52KyTAp9LhpBjAHZNtys+yFDQRjr5Lwq6XWy+w0sRJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753567384; c=relaxed/simple;
	bh=hAIQEa9/wMDIbPrtWnPtN/2kEFN1fDZrN7n44Sn3QZ8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PjMsTwCpt9txtuofUmjJUyBdNxcnJ4d4icjlPgQFnGhlK6pCkBLGAUL5QRSrUvEFOuuv/HjXWA1k80SqNMXDbgvIPu+bXdQosxZ/waaYwLpicqE1T0Pil3QXbjPsDIH7ujgDaFSi9GEGcIDGRQ8Fk8YA1xI8rnrphZZcwfeYoXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-87c0e531fc4so770988039f.2
        for <linux-input@vger.kernel.org>; Sat, 26 Jul 2025 15:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753567382; x=1754172182;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RK7wGz2vWGFPMqUZLIN/3luuaxzEK1Gxjaz5YHOQ2g=;
        b=Rw7bP6H2ox1Ax6ol4flCcTJw+I8gT1F+2fET4inaJM4wlJBD3ukCG+70IzJHAaaB2q
         Mp+SOJ4Bqk7zuiLUtvFajTvAXQLWl8fCmEhVWmFEhv/U5n43H/wWPrWUENAdnvGNQmI8
         Csj/TD5Mi32FgK6RiyAP4SdafeNkbit5+XC8SQExhiZI5gCV/LkminvuT8ScF0dfVuBi
         9mTu+vNRT6ZdKVMB52LFUyQkFcn7sgP8AwI7twJyKEWXHfoC0uxPXb+1ZB3HOV/DUCsU
         deMZ9fYub3jOxWy/VVpQ9fRr0mamoh8nLmE3XnkZ+LBCmcTCQ/+wby1NOXKFtZawQj7G
         1g1A==
X-Forwarded-Encrypted: i=1; AJvYcCUCYzOsdwjQ9TXWUCSzXotKkCxjCdC41AlYjzckCk0pd3tcdaxYoqpd9X0KNnbop9Onc584rJJJby9UGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpT+ci0Wf73B1Io5jIYYuwxioM+OcLHyA9/HW1r+DN6uKuyk+b
	ART9lbmqHA9eNrR5Zm584nLmWMAO0XeCYQQkIBgHe1HqcJyVknQ8TPie+YbbBmSJhwSy/6etN/8
	0UX0s8kjC77WstUQNrS/cQmphHprucSRv6OU7xncf66oCbDJqdSuQavSQ7tM=
X-Google-Smtp-Source: AGHT+IGZJC+VY48tFT/D0XvvvPAc0mmUr5HSv8HwlFMtkySwxIdOR6wdI6eArVetLqp+iaWLw0Ee/+zNfWqSm2UgqEfcTk+iLg9R
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12ec:b0:3dd:b808:be74 with SMTP id
 e9e14a558f8ab-3e3c52e6cd9mr103088085ab.13.1753567382583; Sat, 26 Jul 2025
 15:03:02 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:03:02 -0700
In-Reply-To: <20250726204144.107432-1-contact@arnaud-lcm.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68855096.a00a0220.b12ec.0033.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] KASAN: slab-out-of-bounds Read in mcp2221_raw_event
From: syzbot <syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com>
To: contact@arnaud-lcm.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com
Tested-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com

Tested on:

commit:         51d4b0a4 usb: musb: omap2430: clean up probe error han..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=103028a2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b3af2d4b01cd6138
dashboard link: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16574034580000

Note: testing is done by a robot and is best-effort only.

