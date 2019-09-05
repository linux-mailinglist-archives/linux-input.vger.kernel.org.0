Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84089AA162
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2019 13:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732970AbfIEL3J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Sep 2019 07:29:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44651 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731421AbfIEL3J (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Sep 2019 07:29:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id q21so1541405pfn.11
        for <linux-input@vger.kernel.org>; Thu, 05 Sep 2019 04:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dwvIUziP4fafPY2JOrWPat/xl7RaGutjpB8YJJC4H/U=;
        b=Rd8SyujrfWfPhmweQ/RJpVjX7e1PVKJ0VbLka9+S335G3HYRFRoBxdeY1BkSk7d56l
         CpSzg4J/QPMDvXevEgvsbeIm2Zcw4AK9XCKCvTQoszi1k2GHkvtc2ZaKSgceUELVOMSO
         HiNAdx2jqp0qcdFzYitX2LA7VBvHqTP/cLYzAC+xSvOXDt6CzB/wXIUbu8/tKHVtWAeu
         qndhi9r7KxCR6gq/NoBh1NftR0yqbfYgluIX/MAqTmdNIZ0iQ2WzgioJ4ktpk61A8e3C
         fIreFqJnN3harixIOCjxhHoUwnSUa5GY/AoTZlkYJnKPw/1Ct29Lw3fYX+uMIqvTD9Y/
         4CMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dwvIUziP4fafPY2JOrWPat/xl7RaGutjpB8YJJC4H/U=;
        b=fwB9J3F3THBLT1fUu54C7x0ZKAldzr1w/2JSORr48kSVF1y5J8oPhDIwrqPueV5X4o
         4tj7LDKwZO7g6SNT6TIw26WhKXH7Y+57yDeSiK7N6Z+h3ok26CWcc2+ItTW6+NfI8P1n
         p2IvNXsEZc8xmeV2biKQJo1Yn+M5E/EPN6RM9iGZifY+wmO3ki7AlBsY119F9yO+dUHb
         g82S0uEhRmUTBG8jAkH5iIWoNnJAZkotnoJzLV819RJFNnNeomhxLsZWfsq+SJ+6xFdq
         csFDtAAnh9+zV11jsnjyxUIn1uPwVyKPc5io0qlkUSGCr3gqmTJJ5F1lgIZG5LsXBQL/
         8QeQ==
X-Gm-Message-State: APjAAAXF2zxVfQi5o1/Pga+rbw0Wj7HVGpVBbCCbtWVv939way2A1+UQ
        DKxAZJlilxKPiw88VhDy6OSbJZEe2tQSGtoifyfCzQ==
X-Google-Smtp-Source: APXvYqwnHdnf6mymYYDnuovI2OIh+2HMDn+StpZViGrapDrf3a2ZOlbCfC6vrMHEwUlGjl1xvu5Ub0MThTVq0k0Lh94=
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr2697306pgq.130.1567682948307;
 Thu, 05 Sep 2019 04:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xJrv1hCbO5qOGTBu=c8STo+-obatOGZ4cHkbuhqmEvrg@mail.gmail.com>
 <000000000000a2044d0591cc99b2@google.com>
In-Reply-To: <000000000000a2044d0591cc99b2@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 5 Sep 2019 13:28:57 +0200
Message-ID: <CAAeHK+xVqvBGJ9dXTijuHusJr6vq85DVnKZbHsdyE8-pbWf-9Q@mail.gmail.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_disconnect (2)
To:     syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>
Cc:     Roderick.Colenbrander@sony.com,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 5, 2019 at 1:27 PM syzbot
<syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         eea39f24 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
> dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b6944e600000
>
> Note: testing is done by a robot and is best-effort only.

Nice! Let's mark this one as fixed:

#syz fix: HID: sony: Fix memory corruption issue on cleanup.
