Return-Path: <linux-input+bounces-14941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5154B8CAB0
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 16:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED08A7A9F81
	for <lists+linux-input@lfdr.de>; Sat, 20 Sep 2025 14:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6974A230268;
	Sat, 20 Sep 2025 14:49:05 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94E213237
	for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 14:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758379745; cv=none; b=aWwj2GArWKcqyzsrSod+SO7thh7dRc30Mg+nEb69jlFgPXiYa78yO5GPl5hL4yAR6jKyLAp3z3kfHtrxNUTBa8EqZpYYn/fansC0dQs0d+AMFXWNoVSpwGcODB9sO8SQvHWSDhiZfYMFv37RhhQmMnf26S+/RqJ7735EDoR5wjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758379745; c=relaxed/simple;
	bh=py5/X+AXsn/PIbThVFg9G5uJ79Hgd8prIN39YDpJVR8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cR+SsIdPjhHM7m881vIASIFBaiHCDc1p0+TitY1PuH8X0QR8djuEorPNBKPoRCkitnQ1BhKoCg6Fqdgr9M9KwqQptDP8HZGkM1b20DIVNVnBWv6KAn62f0EjdJL3LLGk+E3ESzLg3DDeFnNh96Ouk9RNyCTQpcCNRnMnTpqsYa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4256f0b0efdso6042805ab.3
        for <linux-input@vger.kernel.org>; Sat, 20 Sep 2025 07:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758379743; x=1758984543;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Op4wMv0a4zsQn3ohVvJ3vaJLGLY9/uII5+oXVI6nU5U=;
        b=fGOUvdgdCiWYQuvk3QP0GmR1urv09gBknaRbpwQPyJ9hbhOAcPH3WYrEYOsRRmZ+Sc
         yx32VeDNEscTBw4muW/jx8SM73wTvfG8PwL6CeJxy+BWj0cFhctkHlFInxNlzJPuR7Gn
         79dXgrZYTgTx85DA2hp4ClHbcB0BJJeXtmsYd58xrMUQBcRiyim+Nf/z+tcYLKIc5C8u
         8MQiPrJfASWheJF/gf4z1Kan7kQALWJeisfyGRrZWq7R4X7VTKUU3959Sirj7Dik+6Z8
         0jQ1y1wGsUkWVsFv/wRX/U3eXrhcx1kghfT6e3rH95YPKdkqwjrD/ktvB/vr7kG3FZAC
         nGUw==
X-Forwarded-Encrypted: i=1; AJvYcCU7PxxrwBd8Tb5izkCy8XWllxnkquhmVAVvo6H0fiy2jBM+id9rJq4L1+QRsgt6SRcW6VUQy00ZOFYEAw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtd5mSHQw+vRFIo+lrZwKaqkJbUGwDeiTuMG72Tl0HqP2n3tbd
	Urdl5EDsgkCmcVVn+qjE/zq9bg3oq0cb8VdVMQ4wAkmBvjzQeH02FsQiLwJp8ulusyIKNunwhez
	+ScHubos2xrA90FO73yNHaavzyeRvW6WSBUXfllulDq3A6I6FUVzrejuj07s=
X-Google-Smtp-Source: AGHT+IFgyLiqZ5vxf2NRc7awgzRJ3gTfgIa75hCA5poxEMAjtksUWSNyk0MLOqXZSFnvr6kPEZ3wkaUmrC4eQ0WKQDX9j/xfuQnV
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1707:b0:424:2357:d57 with SMTP id
 e9e14a558f8ab-4248198438fmr122069485ab.25.1758379742868; Sat, 20 Sep 2025
 07:49:02 -0700 (PDT)
Date: Sat, 20 Sep 2025 07:49:02 -0700
In-Reply-To: <688aa543.a00a0220.26d0e1.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68cebede.a00a0220.37dadf.002d.GAE@google.com>
Subject: Re: [syzbot] [kernel?] INFO: task hung in hidp_session_remove
From: syzbot <syzbot+234fdcc5f6633833a35c@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, bentiss@kernel.org, chenl311@chinatelecom.cn, 
	frederic@kernel.org, jikos@kernel.org, jkosina@suse.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

syzbot suspects this issue was fixed by commit:

commit 4051ead99888f101be92c7ce90d2de09aac6fd1c
Author: Li Chen <chenl311@chinatelecom.cn>
Date:   Fri Jun 20 12:02:31 2025 +0000

    HID: rate-limit hid_warn to prevent log flooding

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1128a712580000
start commit:   afd8c2c9e2e2 Merge branch 'ipv6-f6i-fib6_siblings-and-rt-f..
git tree:       net
kernel config:  https://syzkaller.appspot.com/x/.config?x=a4bcc0a11b3192be
dashboard link: https://syzkaller.appspot.com/bug?extid=234fdcc5f6633833a35c
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15f458a2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1796c782580000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: rate-limit hid_warn to prevent log flooding

For information about bisection process see: https://goo.gl/tpsmEJ#bisection

