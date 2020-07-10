Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCEB121BEEB
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 23:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgGJVCI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 17:02:08 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:51428 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726409AbgGJVCI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 17:02:08 -0400
Received: by mail-io1-f71.google.com with SMTP id l1so4369167ioh.18
        for <linux-input@vger.kernel.org>; Fri, 10 Jul 2020 14:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=EcX2YoSI4hSwdGD5PhGCWpYPH2pi2umYsQ04cJa1lWU=;
        b=Tp27BNhWWEAo0cYej+XqZCDOhJR12mB9XNbs4NsGUNO17Cj4waElQCPsRhApoGQ23R
         c7MxYIVL+Vkp8YTxlyCGRJ7FE4cVfBUSdsysR4ti2I8yveicuSDrrZxw0O4urjSqeZfA
         tYuRRCyTF4iTjWOgc4iWiOBbn+ORty1og4YGCmKGXoXjcbjM5YWuaK02wMjXyHZ1FZ6f
         VdaHsoRslZKEAi+mq+bkuiF4KziepJ3psQs6vEFgLpmV4C9bqRl9uFDDWQ2WJKhKY/To
         TYVCzHb/83n52egl5nhVQ4ghd7hNLiygn8hFRKGVnk662+d3I/9UwdigVGs7RkO0Cj0K
         xI2w==
X-Gm-Message-State: AOAM533Rzz20Bq0j5TIO854yXH2+vctTLab+blsxQUJ4xX1QJfGjO6r+
        MLcD2g9xpcGJxKFLwagLCVaR2kqlvSVLNoBDLt1ppx9otyJ5
X-Google-Smtp-Source: ABdhPJyEq9NElE2CSRzXLsV2eA/q4ph+H8ODuNt0JPwMVMptXa9fHTlPXbqtll4w0/ey3EQ8Hk51+Rr2HK3XNMuFsi5+FTKc0c7b
MIME-Version: 1.0
X-Received: by 2002:a6b:7610:: with SMTP id g16mr44556439iom.115.1594414927282;
 Fri, 10 Jul 2020 14:02:07 -0700 (PDT)
Date:   Fri, 10 Jul 2020 14:02:07 -0700
In-Reply-To: <000000000000b9c33505a63f2fea@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005d881b05aa1ca788@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in mark_lock
From:   syzbot <syzbot+31610284091be1bf04f4@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, balbi@kernel.org,
        christophe.jaillet@wanadoo.fr, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org, gustavo@embeddedor.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot suspects this bug was fixed by commit:

commit c154703bc8dd2231ae81aafef5589b795b2b7e09
Author: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date:   Sun Apr 19 04:18:07 2020 +0000

    Input: tca6416-keypad - fix a typo in MODULE_DESCRIPTION

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=151c0000900000
start commit:   d2f8825a Merge tag 'for_linus' of git://git.kernel.org/pub..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c33c7f7c5471fd39
dashboard link: https://syzkaller.appspot.com/bug?extid=31610284091be1bf04f4
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14797b81100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f86d6e100000

If the result looks correct, please mark the bug fixed by replying with:

#syz fix: Input: tca6416-keypad - fix a typo in MODULE_DESCRIPTION

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
