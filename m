Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 389A997FC4
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 18:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728507AbfHUQNB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 12:13:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:39924 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfHUQNB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 12:13:01 -0400
Received: by mail-io1-f70.google.com with SMTP id g12so3105100iok.6
        for <linux-input@vger.kernel.org>; Wed, 21 Aug 2019 09:13:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=Yd53F92BJf3zn8wGZ0U/s186p5/9JYi4U18PT1EI33k=;
        b=nn9r8smXsxzmVzaK1UWiVZHteudDIUxZ53o1ItSh8Ofp2lhIvZ9Jj6cfct40qMw3J7
         BFm2x4wxYv+GjolHoF8+3c81DTiANGJ1KelyhmPCudG38DQBVLZrC+PH7H1rqHClTCBb
         7pTWNjNPsPmMT53Wp0CwKzVuehCOYeS1QzO+Hl/tgV1FMi9K5i5QdwbKm3gNKgjNuyPQ
         nB/OWRTnZNDAWFCBIj3TOsrV3ozQSjvUPW9bfuJFIjOwuEwModjL8thmZ8IeZqMECC7U
         55haIINlNfSZbEUeWPYL84WimDrHuZfo4oVq3SzU/iGo49AUt/7DVsGOagEdz7PRUkDW
         EWlw==
X-Gm-Message-State: APjAAAUjXav5Wx97wyJnaQ6l0AEOlvH84BfQ9gGkrcNHuaHBK1Kkvntv
        765y+6TbxhLUyLjWstcDv/nd26G/EjmqnqOQx9fCJcN7ueTF
X-Google-Smtp-Source: APXvYqxcWw4L/Vqh6e7csZoUh1Wfmtb8A9sqnIV6jLU54MAVbBAkuO9AjSyCECyy2tXi/H0bOGqXzMrcgTX9GXvsiDZcYJ+jvrY/
MIME-Version: 1.0
X-Received: by 2002:a5d:9681:: with SMTP id m1mr6432416ion.291.1566403980448;
 Wed, 21 Aug 2019 09:13:00 -0700 (PDT)
Date:   Wed, 21 Aug 2019 09:13:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1908211152230.1816-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d45a4c0590a2d8bd@google.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
From:   syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>
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
syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com

Tested on:

commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13dca42e600000

Note: testing is done by a robot and is best-effort only.
