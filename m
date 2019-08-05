Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F158F81F8B
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 16:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbfHEOxC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 10:53:02 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:50414 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbfHEOxB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 10:53:01 -0400
Received: by mail-io1-f71.google.com with SMTP id m26so92509802ioh.17
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 07:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=I+1sIbfUtHJgkKhSnG71S5jcv7eelCXyj+9A5OXu8vc=;
        b=mAPgex/oAo96V4Gj0Ml2yiE4UDkWLP1xxf8jRCJ5aKQ9F17ileX8YVZ4SSaIImKdBR
         b/31UGGdL7GbSkgu+7FwPXxWIbNqNDm8EMaymgOn45A0+/hBr307bMM6W71P8Eyicuci
         +k5bVpuGwbL+TAvhr2pKsA7RABkd6DNsypkXbbcoFCm5SyswHrmu9ZQ9nBlpDnewmvbC
         HM8gok3wJNEdt5XDt/7+7sKxJ19gclNYApxPzwFpHNlXiOIvl+PH1PXhTEydJ4MEO9Cl
         FYY9ILSQLT8hqQkLfk+nGa98S05U261VU46Mya3au++mQNfeg6xfPRgDLVrV8l8Cmruw
         futA==
X-Gm-Message-State: APjAAAUjeP5CpgRmLPiCzjl5NK1dMaMF1zQW/dd3oGH+SaUd3ealtw5a
        tqMhr+MIN2H0yjdRmT7pQVEwJfEk+0GzXLLwE2UFyBKY4J8z
X-Google-Smtp-Source: APXvYqwe3bsIWbt14+rj/PUqPKqw+YQyLOTkzq6n7D8gIFgILR1OgK0qfJ96sZyW19hZqdYkaUkDtqOOtfzjd2svYlNYKbKleNKC
MIME-Version: 1.0
X-Received: by 2002:a6b:5b01:: with SMTP id v1mr34488011ioh.120.1565016780616;
 Mon, 05 Aug 2019 07:53:00 -0700 (PDT)
Date:   Mon, 05 Aug 2019 07:53:00 -0700
In-Reply-To: <1565014816.3375.1.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000046bcef058f5fddc4@google.com>
Subject: Re: KASAN: slab-out-of-bounds Write in lg4ff_init
From:   syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
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
syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16318b3a600000

Note: testing is done by a robot and is best-effort only.
