Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D87B7B62BE
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2019 14:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729783AbfIRMHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Sep 2019 08:07:01 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:41439 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfIRMHB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Sep 2019 08:07:01 -0400
Received: by mail-io1-f72.google.com with SMTP id e6so10721497ios.8
        for <linux-input@vger.kernel.org>; Wed, 18 Sep 2019 05:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=FSF2twrGv8C9R/LR+gpcvgwHJvITBl5yE80ajwcfqc8=;
        b=cLi+Rdi1cJCmnzbGUikkcu+96vm9bTRBKGpgi0HIJfWP71gZXiZEuO8jWdJuywi8v3
         qUkzZpC+I/cv50TJqF+3qBugD+Ss4rHYFKjkOT/L0q+pkeQAPlrL3DXRWiUxf+CxSukC
         f7l3btB2O41HJxBF+ILADAeA/XfRiJOKVSjeiNSJgwYQmv8SHLv3sxpYxhmgYyLH/zAF
         r0ngYNJkNI2R5Td97YbQWemW1+r5MzZswlrXPSpdxgDYJHIWY4f4pzhTujc1KpcVpUo1
         IaozjXzekLO8I70pqXcgS9tFcZE2JhmNGC0PBrpdilQs+shmNFv2mh2cxpk2tKJt9JyH
         hcDw==
X-Gm-Message-State: APjAAAXqjDdgAYhvm6P5uHOLvgGn0e6KfZjTzBsy1FI6Hl/V2d9tn2RV
        VgRosHnzZGdzNos4pIIhCkQE5sVHoqs1vr3jU1LGuAcAlGyc
X-Google-Smtp-Source: APXvYqzES4YyS8y/saMw3rpqBpSMCMeoqohImRV7AUnMLaeFyiNo0H/N/+OnqsOmNVhxdEBios6/bgoM8zTK3A3v+hOUj2vp5oOi
MIME-Version: 1.0
X-Received: by 2002:a5d:9dd4:: with SMTP id 20mr4838250ioo.1.1568808420767;
 Wed, 18 Sep 2019 05:07:00 -0700 (PDT)
Date:   Wed, 18 Sep 2019 05:07:00 -0700
In-Reply-To: <CAAeHK+xJgJoR9rODcRH74knaRKmEq+DDVarNNwDMT_Vtg+gV2Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a400c60592d2ac8f@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in ga_probe
From:   syzbot <syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com

Tested on:

commit:         f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=131651c9600000

Note: testing is done by a robot and is best-effort only.
