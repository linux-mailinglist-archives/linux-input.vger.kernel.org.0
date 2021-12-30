Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55298481C8B
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 14:33:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235613AbhL3NdQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Dec 2021 08:33:16 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:35407 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235448AbhL3NdP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Dec 2021 08:33:15 -0500
Received: by mail-il1-f200.google.com with SMTP id z17-20020a926511000000b002b43c84f5d3so14484294ilb.2
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 05:33:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=3yJ3X0BiJyv0kz2MWYXA2X/7Iy5TYPDdnQ01QGsY6PU=;
        b=JTo4EpIMJUjrxfJAeEKNoEGMGQ/SxfdrwlVZq7OR/KyeWx9M8b7e3h6IT/O/Wi88lM
         y0U1WZV1tsrC45ZcnEqZFq/XjxxuPk7JwPgTvcgP7mEVmKU3EKLQzxS+u66hf62xmrHv
         qNZgM5V/hApur2hOMtUcFvWu94NhZeBavlVzP+nLK4In8IPsg+XVIqihiUR22gCnwkrG
         kfGstF0i9fgz8kDn+JpXPOVwLlXn8K7NO+nZJtIQIfZiiXNAl9yqjtn+f1Uq0xRgC3TJ
         noNu2XjW+7ctfEX1dzyI/5f8zwEowJGaqYk2nERIyv1q0NxebES9x+6zWK5rSor27YYs
         tK7A==
X-Gm-Message-State: AOAM533XFfKyRuG3Guzwt1t/WkURrgAxinO1YwBqT5332WbsFhOPQDJs
        ESqTWgO4vhGV4JQN2kYKK7ScPVwMGy4kwTnd1I1n91Bhmg11
X-Google-Smtp-Source: ABdhPJyYOgbsNKZKuabNPhUswR2qkpMvmq0/m7c0Yaw4iZ5MWbMrsMwdIpM4xE7cBjsgD+qxmm9FLy7sX6Ei3apJkJsW6wIGwywp
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16cb:: with SMTP id 11mr14695084ilx.59.1640871194900;
 Thu, 30 Dec 2021 05:33:14 -0800 (PST)
Date:   Thu, 30 Dec 2021 05:33:14 -0800
In-Reply-To: <cb0cbd54-2b26-1c10-eb30-3b97870904d9@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b1bc5305d45d184c@google.com>
Subject: Re: [syzbot] WARNING in atp_close (3)
From:   syzbot <syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, paskripkin@gmail.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+b88c5eae27386b252bbd@syzkaller.appspotmail.com

Tested on:

commit:         eec4df26 Merge tag 's390-5.16-6' of git://git.kernel.o..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=123612d4aeafb54e
dashboard link: https://syzkaller.appspot.com/bug?extid=b88c5eae27386b252bbd
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1217f2fbb00000

Note: testing is done by a robot and is best-effort only.
