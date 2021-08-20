Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE6343F2422
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 02:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235024AbhHTAkp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 20:40:45 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:47735 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233644AbhHTAkp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 20:40:45 -0400
Received: by mail-io1-f71.google.com with SMTP id f1-20020a5edf01000000b005b85593f933so4364429ioq.14
        for <linux-input@vger.kernel.org>; Thu, 19 Aug 2021 17:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=GropDxqf+CptwvOKGVu50IkRe2l+vNSfWE61IL/QJM0=;
        b=Hhh2O78Qd2MDPMN4OuVxyYTiiP6vHnsgotnflXziT7Ukdp95EqTaWOAL/XbQ2OXKmN
         khwOOd9WG7p1QnibW72UDf9/8Oi3Pgn7JIWewB9VBZZdIhEeA4k5YliXgBxshMPIsa4v
         n007wFV7S2NQTbGSyrd/3itMxXmc9Qk468Xh8B6RCwZRsles3NUFJ2pbfJqgwZJBGIY0
         0Yc0pOvuJgr9y9fk+eEOVuiref0rbxmzle9ynwFi4QZjPJ+VSw1sRio4CTEduNh8EL2P
         NLPxRzz0bfRcHyOzzyU9jQfdWke2vmwxykuSMD6iwnLcVJqWbAc+zGOYDpz3w7cbx9rY
         vyoA==
X-Gm-Message-State: AOAM530VdzVY6mb3+bVaHBPakCxDdAEf+RiZLvR0gKqoTYMe/jnj4vUT
        U8EaEDExjJtY6CS/1Nl0GSAeUnegwBOPND7MIj4VrIEZp5g7
X-Google-Smtp-Source: ABdhPJzkNzvPryhTmpMtYws/Z3kk/RN/BNefgUkDRA/53dPPU6iCfwk+gB4EEQakdAPwZKcApZCOSV5zO6LtsvAlnIaFZlWC1D5U
MIME-Version: 1.0
X-Received: by 2002:a5d:9486:: with SMTP id v6mr14019457ioj.163.1629420007923;
 Thu, 19 Aug 2021 17:40:07 -0700 (PDT)
Date:   Thu, 19 Aug 2021 17:40:07 -0700
In-Reply-To: <20210819195300.GA8613@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c322ab05c9f2e880@google.com>
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
From:   syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com

Tested on:

commit:         794c7931 Merge branch 'linus' of git://git.kernel.org/..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=9b57a46bf1801ce2a2ca
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
patch:          https://syzkaller.appspot.com/x/patch.diff?x=119cfb31300000

Note: testing is done by a robot and is best-effort only.
