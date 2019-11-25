Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF13108DAF
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 13:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727547AbfKYMPC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 07:15:02 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:39731 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbfKYMPC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 07:15:02 -0500
Received: by mail-io1-f72.google.com with SMTP id u13so8324767iol.6
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 04:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=jITXxrgjoInRktckRg5MiJg12GhimBajKoz0PrSCnvg=;
        b=az5luD8XxciBWRpwC74NxgtN5qID5F9yPGlpvrGFEwhibY5IRBILccQYeUnahQuIP4
         Ru3BU1VK5cf3d8jYFeghQCiH/QhoePtBYIlfkb2Fq/+1QfNYwPKvmAIaaNT1BC9bwfde
         4+3HPes96/7cCh0WaN2YUh1xwsDlKiNN0mQV5fbA/o7Ib6/SI4uC1TYRtNRon++pvQhG
         4U7mm+2KZHQJYUeCCpDtauCH74OKQ+3/kkQkGpnAsBcigpNM9WI3I8KPefC7/751nroq
         360kn9yr/kDKztC885D1YsW2evHdk2nSPVxeOr641z7ycRHtXK3XrqUmrmzQgvuMzfsG
         gfBQ==
X-Gm-Message-State: APjAAAVThECcSxek4ml7ZsJUAkhkyh9PVeLf+cawK/vRh3KlMJ3RWkvP
        7Zbh7YCLScC3sdA5xIeHFQkuvZ+aN48Nlf0YbaLU1CABOLaY
X-Google-Smtp-Source: APXvYqytxmBqTzxizQgvYzjWh0aeEOxa1I9xely09r7l/Ai4MyXcYekdIJPhLUEbto69BSj3w6vEBvOgUIpa+xIav/JGQfvdepWq
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2491:: with SMTP id g17mr23420075ioe.160.1574684101188;
 Mon, 25 Nov 2019 04:15:01 -0800 (PST)
Date:   Mon, 25 Nov 2019 04:15:01 -0800
In-Reply-To: <CAO-hwJL_P92-PvyDO2gEPovAQ3vmoH4jpQd-9w5G2ug1UPjc7A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007c225e05982ab601@google.com>
Subject: Re: KMSAN: uninit-value in lg4ff_set_autocenter_default
From:   syzbot <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, glider@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com

Tested on:

commit:         4a1d41e3 net: kasan: kmsan: support CONFIG_GENERIC_CSUM on..
git tree:       https://github.com/google/kmsan.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=a8247e2b2298af08
dashboard link: https://syzkaller.appspot.com/bug?extid=1234691fec1b8ceba8b1
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

Note: testing is done by a robot and is best-effort only.
