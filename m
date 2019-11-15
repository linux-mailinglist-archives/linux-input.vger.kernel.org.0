Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB49FD6CD
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2019 08:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbfKOHQB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Nov 2019 02:16:01 -0500
Received: from mail-io1-f72.google.com ([209.85.166.72]:38102 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfKOHQB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Nov 2019 02:16:01 -0500
Received: by mail-io1-f72.google.com with SMTP id q4so6384039ion.5
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2019 23:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=H6KZH6ReRCeo81QQ/gV0mVJ1PcfVuetQ7C4r7dOiHMc=;
        b=QoHXEfqf/XAEqOsauYWR/kU/TPQuvTf8jO8tnUhOcQcYhrMrUZCE2816wh5/kGFTTM
         3/GHYEzLnmukhh/bif3KRUgx0H+fNb15CHYms3YjXpiVgwlk7O4ZLOvqFuWek0LtndT0
         PRSEb8cCDXE7AYGXN82lmGeV/34DwNKb6Yvcxf8zYvL4qQMru7NGNMW/pkkLOn9+XSt3
         duvmF2cIhdG/afE9qzse7UkLlVjZlLqg7N+92cTYCkvf/WBTShxq6q9Lzbsb1CKji+cF
         BowFT6wa2dTYMDv55wW11vmDR1magCZc6ZNYQKZp/GUd0NIj1FLoWOWNC7q3EMSptteE
         8y1g==
X-Gm-Message-State: APjAAAXW/UpMkI2IOnIFNwnojBApFkZ1KeA/rSQaDBDThE3E+dy7cpN2
        1uc9KEobVu0hjZu4O725pX8UwrA1b+50+OzusOS8ddf+5Z91
X-Google-Smtp-Source: APXvYqxEFgRrGmZN5G1itaTNv92D1H3tBWtZLApFkC5r1LaLaePjg0oe/UMjPdYY3bktn2CSL/7Ek0Or6H4gQTrEenIjpPECTrWI
MIME-Version: 1.0
X-Received: by 2002:a92:dd8f:: with SMTP id g15mr14045121iln.145.1573802160251;
 Thu, 14 Nov 2019 23:16:00 -0800 (PST)
Date:   Thu, 14 Nov 2019 23:16:00 -0800
In-Reply-To: <1573726121.17351.3.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b56e8b05975d5e11@google.com>
Subject: Re: WARNING: ODEBUG bug in input_ff_destroy
From:   syzbot <syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, oneukum@suse.com,
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
syzbot+b6c55daa701fc389e286@syzkaller.appspotmail.com

Tested on:

commit:         3183c037 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
dashboard link: https://syzkaller.appspot.com/bug?extid=b6c55daa701fc389e286
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12c2e254e00000

Note: testing is done by a robot and is best-effort only.
