Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 825EF7A60D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2019 12:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfG3KbB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jul 2019 06:31:01 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69]:37359 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfG3KbB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jul 2019 06:31:01 -0400
Received: by mail-io1-f69.google.com with SMTP id v3so70960957ios.4
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2019 03:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=/JDLLKCVTgj6P4LINzTI5WdAL0FV1RdWWRyqarm+YLc=;
        b=h6NnzOaInI4Pi9J9T2EqTUBza+2A6qYQAM9U2YCZQHasXYeLVANCrh2yP+qZJcFVtP
         zEigBU7Q6lwMSV0+d7XvbB7vFBajhiTgPxM/pv1NPthxZsLRYCJ7SW9qKJERsMs2UJ+Q
         0hRz3fPEkA6b3/Ja+UQfJDxMVJnuRY3CHzugZhavtpaO6TUYXnzVwwVrcydA5yJUPVMn
         LgGll9UsC/yUlBJB6MkGL1jBgPQwQLJEbgE/eaRczqDfVVml44yPGrmw3pSZS+0Fm6vs
         pqFbe2oLqFKuK06wVPH5u3nh+BxxBQAE5ckscaq1zEzV9z8Y372HgJeDst6ER0BEOroC
         8Ijw==
X-Gm-Message-State: APjAAAUwleDpnHXVLizyWAvJPBY+1eYpJp+J+D8K8G6U7y+fHN4oDDg1
        kVlVMpNzrUNCQaCnmOh3/qS1iSYCadnBM0gmaHpbGCXWWFgG
X-Google-Smtp-Source: APXvYqy+U2um5Uxv6X2VsWwU+YOv0Pyg13yIK5HP9nRe3nmtx/LGqGu7XiWw03MqvAEgiJRAiP/ZZUTmTDN9J4NtbQVrkYnpWnZS
MIME-Version: 1.0
X-Received: by 2002:a02:ca19:: with SMTP id i25mr122464740jak.6.1564482660587;
 Tue, 30 Jul 2019 03:31:00 -0700 (PDT)
Date:   Tue, 30 Jul 2019 03:31:00 -0700
In-Reply-To: <1564481531.25582.22.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003de05e058ee38113@google.com>
Subject: Re: WARNING in usbtouch_open
From:   syzbot <syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com>
To:     allison@lohutok.net, andreyknvl@google.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        kstewart@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mpe@ellerman.id.au, oneukum@suse.com, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger  
crash:

Reported-and-tested-by:  
syzbot+199ea16c7f26418b4365@syzkaller.appspotmail.com

Tested on:

commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1347ab44600000

Note: testing is done by a robot and is best-effort only.
