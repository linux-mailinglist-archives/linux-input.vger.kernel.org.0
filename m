Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FC928451E
	for <lists+linux-input@lfdr.de>; Tue,  6 Oct 2020 06:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726680AbgJFEyK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 00:54:10 -0400
Received: from mail-il1-f207.google.com ([209.85.166.207]:37807 "EHLO
        mail-il1-f207.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgJFEyH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Oct 2020 00:54:07 -0400
Received: by mail-il1-f207.google.com with SMTP id c66so9136808ilf.4
        for <linux-input@vger.kernel.org>; Mon, 05 Oct 2020 21:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=vbGvYHn+W+IaG2xSdpQ2NL9k7oeMNtTHRnseDsfQub8=;
        b=Utqr6FBJLhkE1MrKAlMlt0WLX1hooeY+kChIBSqBPiPC75YlkgOkdQ9uUSvV8HdgKl
         ImwNMO19AQdXlYWNivnY1FvYbso5MFsxpSaLazF2tQcxO+lphjwu6SBlSry0+vffc49w
         edDuuJHk4ZcCrJsJYFdJyeFEkadnoLKd7CF8HKmPcPw1UG13SPMpsiioZsuIKiWieKhs
         8HdjnuXAehP79pb4IOyXuUGrcyshbsoVlIQdvCa8RKOvVUbhVjx71vfM28wKNaXVJEwF
         G9SM0uE4+685w2Q2CO4Vn6Y7xt5/Dcd/RifUZHNcEuFtJyRIP1Z0fvu5whEy0Zs6AYPY
         Vbag==
X-Gm-Message-State: AOAM53201GK8Dq85bml83iKAoYMfFQUSA6tlbfabmWdYw0jn+ocT/9G2
        xa7YUUDSXPswIZQMBjXaobFsQi2ygiiX9NvJgmTYCKupTBgB
X-Google-Smtp-Source: ABdhPJyE8Iq2isWFmFTh8P9W0W6jrxjBi3DqXEcgnkgexuwpGIwXcLMRIJj5V3OQuJTBceUV8hAxFrb3GFVoXhtt8mqf10W+pd0/
MIME-Version: 1.0
X-Received: by 2002:a92:c50d:: with SMTP id r13mr2291142ilg.264.1601960045445;
 Mon, 05 Oct 2020 21:54:05 -0700 (PDT)
Date:   Mon, 05 Oct 2020 21:54:05 -0700
In-Reply-To: <00000000000054c0d105a0328487@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000074076405b0f9632a@google.com>
Subject: Re: INFO: trying to register non-static key in uhid_dev_destroy
From:   syzbot <syzbot+0c601d7fbb8122d39093@syzkaller.appspotmail.com>
To:     benjamin.tissoires@gmail.com, benjamin.tissoires@redhat.com,
        brookebasile@gmail.com, dh.herrmann@googlemail.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, maz@kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot suspects this issue was fixed by commit:

commit bce1305c0ece3dc549663605e567655dd701752c
Author: Marc Zyngier <maz@kernel.org>
Date:   Sat Aug 29 11:26:01 2020 +0000

    HID: core: Correctly handle ReportSize being zero

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10b82f50500000
start commit:   152036d1 Merge tag 'nfsd-5.7-rc-2' of git://git.linux-nfs...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=efdde85c3af536b5
dashboard link: https://syzkaller.appspot.com/bug?extid=0c601d7fbb8122d39093
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ebad0c100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14d6c21c100000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: HID: core: Correctly handle ReportSize being zero

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
