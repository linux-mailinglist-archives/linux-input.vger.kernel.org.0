Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2663AA150
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 13:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732739AbfIEL1B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 07:27:01 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:36197 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732049AbfIEL1B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Sep 2019 07:27:01 -0400
Received: by mail-io1-f70.google.com with SMTP id g126so2836117iof.3
        for <linux-input@vger.kernel.org>; Thu, 05 Sep 2019 04:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=7woNlVISujRJGF9f7Yv9hP0vcjuDeQlRJErmR/nep/s=;
        b=O6KOq0KBjMjZAOGcb7TuimfuyLGFtJJFC8MSweb8N4L/IbPa7ulZo6kZyQoSe3B9km
         pSt6E6JfFv6xCcVIrt6aSYdW+Rpg1Rhm7Wc+0OxtK0EVAGnI1WdSTMWVsy85+E4SB+nH
         mKtW38YbCgPjdeqmeK/5c5gIAZCqNOROdqTBiNNSb9IFDaGxoYTKlh/80WT1GWesWPEO
         a79TEO8sgsDXLU/hrVd5+/AfoQK5K6sGZz4kCgY+KR6Bvc1XChV9lJTZ8bFgzVfwQuyY
         XeTK4E8Esf6H5RXlXEB8ozhEAOYNxULU2VsEOM7o+ZWyrpfTMy/ILhyIoRI6gHQVi/KH
         A0NA==
X-Gm-Message-State: APjAAAUo7+OmrM8CGVaNQBzR3qAJzjk7U0pVTcgVuyCWgzinpsae60VM
        zwf/DQl+xa3NM/oHsZBKpiABXTyNwEMDNjlmsPtS4uDSpVTP
X-Google-Smtp-Source: APXvYqzrPWl90MY6xFLW6kE5r7FYbX5PnvVkgsNXXwiFcVSlOrXw4c1TUHRlr2M/2Ww7NwqWIs7UZ4UFqMX/6zQlqsJJFcJYxnZm
MIME-Version: 1.0
X-Received: by 2002:a02:9a12:: with SMTP id b18mr3575178jal.70.1567682820439;
 Thu, 05 Sep 2019 04:27:00 -0700 (PDT)
Date:   Thu, 05 Sep 2019 04:27:00 -0700
In-Reply-To: <CAAeHK+xJrv1hCbO5qOGTBu=c8STo+-obatOGZ4cHkbuhqmEvrg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a2044d0591cc99b2@google.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_disconnect (2)
From:   syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>
To:     Roderick.Colenbrander@sony.com, andreyknvl@google.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, stern@rowland.harvard.edu,
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
syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com

Tested on:

commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b6944e600000

Note: testing is done by a robot and is best-effort only.
