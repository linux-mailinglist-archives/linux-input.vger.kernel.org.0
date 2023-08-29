Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAF3378CB45
	for <lists+linux-input@lfdr.de>; Tue, 29 Aug 2023 19:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237713AbjH2Rad (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Aug 2023 13:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237912AbjH2RaP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Aug 2023 13:30:15 -0400
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2CB1B3
        for <linux-input@vger.kernel.org>; Tue, 29 Aug 2023 10:29:44 -0700 (PDT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1bf6e47b5efso47915645ad.2
        for <linux-input@vger.kernel.org>; Tue, 29 Aug 2023 10:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693330105; x=1693934905;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUCzNcqELyYZpjVuIL+b142F4z8AIUx6kMc8IJwMClE=;
        b=M7OtL3BglsJezMVLlOdQDhJri2gkYjLAYbLHdWfk0+/ww85AihzmZoyUW+KR3vaRwc
         AC1SoiX0fDjztQyO47JwtdwpTXP9miUd6yDYfKjxdLKuGa6a6uB9gttaWqVB87UpaJnU
         lMzzpqA9oETAlo2/bzbdkHJjXOpuHpT08/aZj9XdRZgGZ/EcLVMttpWwexDfJwmZrsWR
         BHBzttXyYigXaD2FWHKIVGKpLrrOvHuXYYHuhgiwrK7FwO7li6jgT32VTefM796hnNRg
         7/z/P0Z7zrNuW+9Wgz7yHA070wCblnwbrPHo9U0dX9iejhxRFtXkDvVCjYzySlbPVG8G
         YNOA==
X-Gm-Message-State: AOJu0Yy8wGhElcD7xF0RJ9ey9p+aYFzzQGJeta23xds0MFWhyJw9CyOP
        eXy4wO4nenCasIEHCFVyyIBKz2pZ/DiWbexk3OQdIMGbYwMS
X-Google-Smtp-Source: AGHT+IF1/hCSfQfodVtXb8zKn8Kpjt6GZWqcrlbm+l6JvWJTL1C8JmfHHuXYfw95FdrNR+Nkr3vh8iphOEem0N1y2sDyweQVqFV6
MIME-Version: 1.0
X-Received: by 2002:a17:902:e550:b0:1c2:584:51ce with SMTP id
 n16-20020a170902e55000b001c2058451cemr460387plf.7.1693330105183; Tue, 29 Aug
 2023 10:28:25 -0700 (PDT)
Date:   Tue, 29 Aug 2023 10:28:25 -0700
In-Reply-To: <000000000000c329d505fed78c74@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000068345606041323fc@google.com>
Subject: Re: [syzbot] [input?] INFO: task hung in uhid_char_release
From:   syzbot <syzbot+8fe2d362af0e1cba8735@syzkaller.appspotmail.com>
To:     agordeev@linux.ibm.com, akrowiak@linux.ibm.com,
        benjamin.tissoires@redhat.com, clg@redhat.com, davem@davemloft.net,
        david.rheinsberg@gmail.com, edumazet@google.com, jikos@kernel.org,
        kuba@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, mjrosato@linux.ibm.com,
        netdev@vger.kernel.org, pabeni@redhat.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,FROM_LOCAL_HEX,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has bisected this issue to:

commit bf48961f6f48e3b7eb80c3e179207e9f4e4cd660
Author: Tony Krowiak <akrowiak@linux.ibm.com>
Date:   Tue May 30 22:35:37 2023 +0000

    s390/vfio-ap: realize the VFIO_DEVICE_SET_IRQS ioctl

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=155eba2fa80000
start commit:   bde7f150276b Merge tag 'pm-6.5-rc2' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=175eba2fa80000
console output: https://syzkaller.appspot.com/x/log.txt?x=135eba2fa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d0f369ef5fb88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=8fe2d362af0e1cba8735
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=124711b6a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178c5a92a80000

Reported-by: syzbot+8fe2d362af0e1cba8735@syzkaller.appspotmail.com
Fixes: bf48961f6f48 ("s390/vfio-ap: realize the VFIO_DEVICE_SET_IRQS ioctl")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
