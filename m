Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAE1F108B08
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 10:38:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfKYJiD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 04:38:03 -0500
Received: from mail-il1-f200.google.com ([209.85.166.200]:33366 "EHLO
        mail-il1-f200.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbfKYJiC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 04:38:02 -0500
Received: by mail-il1-f200.google.com with SMTP id s14so13218601ila.0
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 01:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=fG9KqHLE4B6rJrt8WSTq/ExbnesyYPEwEQQKonf+qKA=;
        b=nkfyQQBWsyd/4JwYCqRFv/AAdquYSS6icK2/PLL4mlPIJe0/bzaOhPm1N3A1jnBTH0
         /ALL6/JernT2NBF8TCnnXMl5I/dczY+L2jdY4Fy4q5gq25R/Gaj3ssWbQLXsOxsib2sC
         eGCyvf1k7yOPxwBOiQyQx91tES64Xr8CLdlbtb1CVfcZDPuo6MPnJ2ErXMyQnMgdJT4/
         xPGweicnDUTSk+SaVpqVi8bHB2riSXTTjo8IO6zwFFRCvCnJ6dK73QVmF05rZHAhs6ko
         K/oJVq0ezJkWr0AULOYHgTrZnVgfB2KgGuxwxvHShtgg0cONW3P2oEOJ14ZjwszVFZDQ
         WFbw==
X-Gm-Message-State: APjAAAW0fFQMf4d8rMvJPg0egg7qCUUO4ox/peHOpZOqUYo1YE6D6AK/
        s5iFdI3LQuGUTr4nbymzLYEHalhZfr2+zIiYnbiJlGlcpNoE
X-Google-Smtp-Source: APXvYqysEvhOU3FlrlkG6Qh8WLdk+WWWUZxt5N0WYkzf9xitUfAL1POuHUf1iCWn+W/dqDUNFjaqX/5F5jsOHUTMFd++GfEmClFL
MIME-Version: 1.0
X-Received: by 2002:a5d:9909:: with SMTP id x9mr9533544iol.93.1574674681278;
 Mon, 25 Nov 2019 01:38:01 -0800 (PST)
Date:   Mon, 25 Nov 2019 01:38:01 -0800
In-Reply-To: <Pine.LNX.4.44L0.1911241115410.26037-100000@netrider.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000003b7c305982885e3@google.com>
Subject: Re: INFO: rcu detected stall in hub_event
From:   syzbot <syzbot+ec5f884c4a135aa0dbb9@syzkaller.appspotmail.com>
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

syzbot has tested the proposed patch but the reproducer still triggered  
crash:
BUG: found invalid parent_idx

microsoft 0003:045E:07DA.0001: Field 0 ffff8881c0e00000 maxusage 4899
microsoft 0003:045E:07DA.0001: Usage 72 ffff8881c0e00730
microsoft 0003:045E:07DA.0001: collection 0 ffff8881d91be200 type 0 parent 0
microsoft 0003:045E:07DA.0001: BUG: found invalid parent_idx
microsoft 0003:045E:07DA.0001: Start report ffff8881cb82e000 maxfield 1
microsoft 0003:045E:07DA.0001: Field 0 ffff8881c0e00000 maxusage 4899
microsoft 0003:045E:07DA.0001: Usage 72 ffff8881c0e00730
microsoft 0003:045E:07DA.0001: collection 0 ffff8881d91be200 type 0 parent 0
microsoft 0003:045E:07DA.0001: BUG: found invalid parent_idx
microsoft 0003:045E:07DA.0001: No inputs registered, leaving
microsoft 0003:045E:07DA.0001: hidraw0: USB HID v0.00 Device [HID  
045e:07da] on usb-dummy_hcd.5-1/input0
microsoft 0003:045E:07DA.0001: no inputs found
microsoft 0003:045E:07DA.0001: could not initialize ff, continuing anyway
usb 6-1: USB disconnect, device number 3


Tested on:

commit:         46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
console output: https://syzkaller.appspot.com/x/log.txt?x=14bb93cee00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=ec5f884c4a135aa0dbb9
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11c28d5ee00000

