Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC600326664
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 18:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhBZRku convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 26 Feb 2021 12:40:50 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:33643 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhBZRkq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 12:40:46 -0500
Received: by mail-il1-f199.google.com with SMTP id k5so7672751ilu.0
        for <linux-input@vger.kernel.org>; Fri, 26 Feb 2021 09:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:content-transfer-encoding;
        bh=PQUkYOPypd5QA7wH0ZiOCBAtaTuHt1m0uYa+QbCHJ6U=;
        b=q3i95mZ4/mpmeNGNvGK+LtD5Jh+fPv+edtwg7eUZdNZ2hCRJpNLWGNAL+uJ86QOeXk
         J27O6zW2RhGQhp9fRIZxUolWS9bP402mIUfYuqPBJKKAUVWlIAXDbGyee3D3v7da/dHz
         qlM0v9Aa6cWefa/HMzwbt19jbmRZgINkOIFTWrRmf498kgW8Fkosal/haer2I4kRkdO5
         EqOJPUvRH0wSGKlpQThqkpbcr7HHh1c1kLA4BVK8B5dSRU2fu2lU3mhDtDJWOB10hb/K
         w369BVrGJJbEllP2yQmSMToG51MgUtuDDgdavzDSavjImiNn3cw9xWje1YAstC1bpCYz
         UBlw==
X-Gm-Message-State: AOAM530dEmbjk59j5GcFpgJH30WLj3mR6gSNXUKGO32xWQ5ZJIqkuc/M
        beome5dK8esqmnUK2bEy1QHcGMZX43TXk/A1EFsCEJq8e3nB
X-Google-Smtp-Source: ABdhPJwjcrDY3M3NySdVXsyY9Thnn/YytagkgN3LVwDBc1JZluRM0uR02sC/B0mrZ5cqBEHumS98eeNLfegZzpqZCSWbSUsV2Gd/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:f06:: with SMTP id x6mr3067247ilj.287.1614361205201;
 Fri, 26 Feb 2021 09:40:05 -0800 (PST)
Date:   Fri, 26 Feb 2021 09:40:05 -0800
In-Reply-To: <000000000000b2d35705b7f31599@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002ce0d905bc40c2df@google.com>
Subject: Re: INFO: task hung in virtio_cleanup
From:   syzbot <syzbot+1db88381b64aaa929ef6@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org, hdanton@sina.com,
        herbert@gondor.apana.org.au, jikos@kernel.org, jkosina@suse.cz,
        linux-crypto@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mpm@selenic.com, mst@redhat.com, rafael@kernel.org,
        rikard.falkeborn@gmail.com, sammko@sammserver.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has bisected this issue to:

commit 77a36a3ab4ff17fad23831192e3694a3c5a1750d
Author: Samuel Čavoj <sammko@sammserver.com>
Date:   Fri Mar 13 02:12:38 2020 +0000

    HID: Add driver fixing Glorious PC Gaming Race mouse report descriptor

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=129959ccd00000
start commit:   f40ddce8 Linux 5.11
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=119959ccd00000
console output: https://syzkaller.appspot.com/x/log.txt?x=169959ccd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e53d04227c52a0df
dashboard link: https://syzkaller.appspot.com/bug?extid=1db88381b64aaa929ef6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12277728d00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1135e198d00000

Reported-by: syzbot+1db88381b64aaa929ef6@syzkaller.appspotmail.com
Fixes: 77a36a3ab4ff ("HID: Add driver fixing Glorious PC Gaming Race mouse report descriptor")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
