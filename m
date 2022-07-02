Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC30564310
	for <lists+linux-input@lfdr.de>; Sun,  3 Jul 2022 00:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbiGBWQK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jul 2022 18:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiGBWQI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jul 2022 18:16:08 -0400
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A07BC30
        for <linux-input@vger.kernel.org>; Sat,  2 Jul 2022 15:16:07 -0700 (PDT)
Received: by mail-io1-f69.google.com with SMTP id h73-20020a6bb74c000000b0067275998ba8so3296700iof.2
        for <linux-input@vger.kernel.org>; Sat, 02 Jul 2022 15:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=M98UdBzRCd+0BXICitMF/rM+Sf8iZdHszQuTgRzs2AE=;
        b=hRnc6qezgc4twy9dPUsi82v8Lqcg1af7ZaC22JXnlVp4ffbCE5guejcsKznOTX/AkA
         5YLq6d+xTtkmHUqHmJqGSw0dC4vOzNcy6pr+h4I7Nwxu9AfSIaKZwLPcbOyay06QQvvw
         dlR5fLXALdVlmUWUTQIuisWMpAOuYOgvvqC8VT0/OnItbK3JX02VDClIO5iYmEPGoZv7
         KXepvGstLjEQ9fQ8WzdBrrWgfv0OB7n2V0giDVE09unjbDt2A5NDx5PcJr0w/r0LLrxy
         ovqaFE+u7AQ6DIhKQ9Kq2U1extt95ky7Ly4qP9MuptHjqCElsL1UYiAdB/CKk0IjIkLg
         6m/A==
X-Gm-Message-State: AJIora8HzlS90lvzviyEjg48cGvHozkV4LlrmPibKWDDtZRGwukrTtOq
        +OJbpfo2/s9CTex+F3nhVyeBXskj4kyE00IVp3PIYIiRSj+S
X-Google-Smtp-Source: AGRyM1vGFPa0EDmhSGdCmfNIPNkmjMBuqzee53YhAjeeRI2mSbyPaaZeeNM43jHkn580f9WKpXvANPtC82iuhPk39bKfAVM46MWs
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id
 h7-20020a056638338700b0033c9f9e5a17mr13107546jav.12.1656800166927; Sat, 02
 Jul 2022 15:16:06 -0700 (PDT)
Date:   Sat, 02 Jul 2022 15:16:06 -0700
In-Reply-To: <000000000000ed47a705e2cbd347@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000069e4ad05e2d9d9e2@google.com>
Subject: Re: [syzbot] INFO: task hung in __input_unregister_device (4)
From:   syzbot <syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, johan@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, rydberg@bitmath.org,
        syzkaller-bugs@googlegroups.com
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

syzbot has bisected this issue to:

commit 744d0090a5f6dfa4c81b53402ccdf08313100429
Author: Johan Hovold <johan@kernel.org>
Date:   Wed Nov 10 06:58:01 2021 +0000

    Input: iforce - fix control-message timeout

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1603376c080000
start commit:   089866061428 Merge tag 'libnvdimm-fixes-5.19-rc5' of git:/..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1503376c080000
console output: https://syzkaller.appspot.com/x/log.txt?x=1103376c080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=833001d0819ddbc9
dashboard link: https://syzkaller.appspot.com/bug?extid=deb6abc36aad4008f407
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158619f0080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1072b5f4080000

Reported-by: syzbot+deb6abc36aad4008f407@syzkaller.appspotmail.com
Fixes: 744d0090a5f6 ("Input: iforce - fix control-message timeout")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
