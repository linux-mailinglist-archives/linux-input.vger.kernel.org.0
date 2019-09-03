Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AEBA73E6
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 21:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfICTqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 15:46:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:51265 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbfICTqB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 15:46:01 -0400
Received: by mail-io1-f70.google.com with SMTP id a13so24183730ioh.18
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 12:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=kXCvpHAYN0cOVaTNuIIyT705Bu5FecEadrVziKUxy6Q=;
        b=lPCRb3dTb119ke2RFdX4mxpjGFhg8Ots49wM5GMPp3OmTPfKZROW9wTTvjDR8hIOeF
         rye6+OOQgHmDnthhFXQCCSbOJdcscP0Xcc6h4csx6e2ZBKDeLylTqJI1x1Ng9RIEFZfP
         GNVHWgp5JP0LrFo9mbMthUKiyE63ST+ymvAe6K1haqXX0s6FEutpZJkJuEZvsbZcTfYM
         vedxqXbI3e/g6u12nFVmHZMAMfdgvenMh1RtRDLe7uy2A0KdtNfLm0ZNfYdsI5WklPZ/
         Bnnb/SI+k3Me9hrhJ50/OMxvL15H4HsFhHqpKPmbJqHreU63BU8+XcEUXgSbe+RAl+kU
         bCqw==
X-Gm-Message-State: APjAAAWgVqlFiZ2Qo1sZaU0ViJs+9g1s9+TV2oiJNfXRDiq+5qUF4sT7
        6KRkvNDY2GWCDSDmTtdv93Gg+4zRNnEDxIAZJepdrmghrmOX
X-Google-Smtp-Source: APXvYqxfj1sQQ3xKi9kgOKoFd/RTuW+Eik1p8S9uObwW6Wr/ZjuS6oTW/EALOyvbQSKtDYelMARQ70pjhIclDjrjwQY7vKbsWorC
MIME-Version: 1.0
X-Received: by 2002:a5d:80c8:: with SMTP id h8mr10417001ior.188.1567539960460;
 Tue, 03 Sep 2019 12:46:00 -0700 (PDT)
Date:   Tue, 03 Sep 2019 12:46:00 -0700
In-Reply-To: <Pine.LNX.4.44L0.1909031516520.1859-100000@iolanthe.rowland.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000083be0c0591ab561e@google.com>
Subject: Re: general protection fault in pk_probe
From:   syzbot <syzbot+1088533649dafa1c9004@syzkaller.appspotmail.com>
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
syzbot+1088533649dafa1c9004@syzkaller.appspotmail.com

Tested on:

commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=1088533649dafa1c9004
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=139bc892600000

Note: testing is done by a robot and is best-effort only.
