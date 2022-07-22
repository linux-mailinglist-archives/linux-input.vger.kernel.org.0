Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDFBC57E29C
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 15:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233801AbiGVNxQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 09:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231603AbiGVNxP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 09:53:15 -0400
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BAC8321E
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 06:53:14 -0700 (PDT)
Received: by mail-il1-f198.google.com with SMTP id d12-20020a056e02214c00b002dd143bee38so2757016ilv.7
        for <linux-input@vger.kernel.org>; Fri, 22 Jul 2022 06:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=e9QsGOMfJtRjs9xn7OnAMOPYeDLRMxg6fBr0BlAh6yA=;
        b=hXfM0q72w94j1Eh/6AX9p82lneclO4pfueuJZMkQ/4b9jQRBz39rYXcRshOT8GxoHM
         JYC4cH9kMDZ0GzYZ5ioo4R8n0Bk7DspSdKzbkzlKDAudbPNbFytZr/Rc6akHCjYY3kDB
         3dbrKIICeXEv9CrXgUCKVgpx23ieVqlR+4/aX9EYp/PjHCTCO9f4aB7a8m60HSN9jgxq
         SaNtqoEIFMP7c8pbKH/kiwqEy54yJeuQhMjHBrZHrbNVruF9lULvjwQu35kpzc1xUYJ6
         T/FQI8atxItWFj7VDcoEb/YisiMveZk/s9LL1ShL4+UYzd9lni7hsfgGR+uSD1IlhLlb
         g/zA==
X-Gm-Message-State: AJIora8x8o+KbeNU1rm724DlgBl+LwGa4eM3fZPkCZqkliV5FqcK5cox
        7p0WYHTu5Wp/d2uyF1NPRozqTKst0vb+VZxafnErNLB3hqwv
X-Google-Smtp-Source: AGRyM1vnMFC2YTSrBmwzM/i9nVw8aEOIrMrKgsN8YNh4zNF01tNWEEugq2MEE+uAN0TAHNE5NcuXctAbSAsdWJkv72ECuIX+hqJv
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1513:b0:33f:6c7c:5cd4 with SMTP id
 b19-20020a056638151300b0033f6c7c5cd4mr47032jat.279.1658497993592; Fri, 22 Jul
 2022 06:53:13 -0700 (PDT)
Date:   Fri, 22 Jul 2022 06:53:13 -0700
In-Reply-To: <5843755.lOV4Wx5bFT@opensuse>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c4d6ac05e465277a@google.com>
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
From:   syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, fmdefrancesco@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, penguin-kernel@i-love.sakura.ne.jp,
        rydberg@bitmath.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com

Tested on:

commit:         32f02a21 Revert "platform/chrome: Add Type-C mux set c..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=120269d6080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8be12c1e07a193d9
dashboard link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1141355e080000

Note: testing is done by a robot and is best-effort only.
