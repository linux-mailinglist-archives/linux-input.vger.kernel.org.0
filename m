Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71D9C4B2F6F
	for <lists+linux-input@lfdr.de>; Fri, 11 Feb 2022 22:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353739AbiBKVgL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Feb 2022 16:36:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242318AbiBKVgK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Feb 2022 16:36:10 -0500
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B44C62
        for <linux-input@vger.kernel.org>; Fri, 11 Feb 2022 13:36:09 -0800 (PST)
Received: by mail-io1-f70.google.com with SMTP id x6-20020a056602160600b00637be03f7b8so7240441iow.17
        for <linux-input@vger.kernel.org>; Fri, 11 Feb 2022 13:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=uZFH8v5hdkuD13HWKXbwlKXOFU1tLj/1KgXaqFsCP+w=;
        b=NVKnV4DuqUUX9/pLqUjTcYnazkU8PYeic/MraPC+ZxmVmCFerclx9Ckfsw6UUy9cYr
         942QueF/d2aQaZ+c3OAqtqxtmZzGsFyMgC5MSH+dXtV6p6ljWFBLucYOEIzq9CEBl0t2
         9xTNFG+PWuOI5hiTMwSYlx7ijA/TABk5llf3zcAaUW/zSp+9Gfe7aA0BzKIOrCR1l77T
         oWqfLYcE/q35i/qvS+diD3si0RbxducbRZ8OJKXS58Nzu0O26GMiXMFg8IrUIs30BuDI
         bLHkt0OONxyz2BWXS1Rj0GeyFFzRWmhJCTSaKlxZ7elYkT1Ysjsvw70xq4ex8r5lXkje
         hKZg==
X-Gm-Message-State: AOAM533hjrb8nVmuipWPulFB1HQbtgEpiMnp+JCuvIQFM4KDKZd1oPEf
        ODx0hPzolwxBqqjXVy1bwJk3kLLJL8x1Wfh4GvxRX6yvnRMF
X-Google-Smtp-Source: ABdhPJxIMl3Dj6whKaFjTGnZrRnkr5JcDWjIWAL80oKZ7CA90a6/GGlca6MO6Yn7/LWch5SH1DLI8BFkEEZ5aN7OR35Og6xECnE3
MIME-Version: 1.0
X-Received: by 2002:a05:6638:164f:: with SMTP id a15mr1964678jat.272.1644615368382;
 Fri, 11 Feb 2022 13:36:08 -0800 (PST)
Date:   Fri, 11 Feb 2022 13:36:08 -0800
In-Reply-To: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d31cac05d7c4da7e@google.com>
Subject: Re: [syzbot] memory leak in hub_event (3)
From:   syzbot <syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, noralf@tronnes.org,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-and-tested-by: syzbot+8caaaec4e7a55d75e243@syzkaller.appspotmail.com

Tested on:

commit:         dfd42fac Linux 5.17-rc3
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ v5.17-rc3
kernel config:  https://syzkaller.appspot.com/x/.config?x=48b71604a367da6e
dashboard link: https://syzkaller.appspot.com/bug?extid=8caaaec4e7a55d75e243
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=121f0f78700000

Note: testing is done by a robot and is best-effort only.
