Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C89BCA66B9
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 12:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727639AbfICKq0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 06:46:26 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45995 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfICKq0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 06:46:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id 4so5367389pgm.12
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 03:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhIll50zBtRbSQXnPI2yzC/EvrC1KoXXdnGgqdqJO9A=;
        b=lrhKF9v6lRIovR3Fkujrfgr7gKSwlEJ7+i6IQTcO8eTPTBSgliXQ5zNf5v6ajv4S9W
         QWdWOXil3hVylbdAgmRLw1nI2LPBNYxRzAtBGkWCVNUHBgW9ilhpLiU46m/ER4E9iL3L
         tPuPZEG/cqYd7Igw/pwOgo7WG783sFr0aG7yvh/RB4IikEihwWKYMlrnmJY3uIXR8S7W
         CPZQyEUZdYm6rg2rxw6g4GAZJJGCicsK7YelDhesn3xb8Di725S1QSrq/GhkqUX+jPtb
         wA3JrbaT2HkdvQ0OFXo1/pZqwCoSKz+MBWx4vJZVDLLcLdDETd1F1g05NNk6XW7dq2B8
         JPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhIll50zBtRbSQXnPI2yzC/EvrC1KoXXdnGgqdqJO9A=;
        b=dYKmNJm5Nd/x3A/ueth/T8ZmW2O3MqSddeKd6uP+ChTsCBYxQNv+zvqYoiuLwTC1RG
         eauFqhBLnQvxPfxR4yLLnvLd7DygCkDcrx6F3Zwn3KR1Vojyy+puhptIP3dYwDtZSEIL
         u0R17hx1jCYgsPqoGHVbdueeCzWpNWL3qnD9ZK79EYjfaq+o/FYUpOMytM2v96Nm36HQ
         D8wBLG9Fao3Yj8+RJF0lOrZV1yBWSML8X2ChLm4Ct/W/0RZf9pA48hqhmoc18u5rxy8g
         L1U3Oh8fvWFDEqe4V8fD2mUEgOYCzKlLrNEu5k894zQ0Qg+cLy9l2xzUdYaU4ObCs933
         MTng==
X-Gm-Message-State: APjAAAU1fUc4beg9UMEUkhMGgAu2WzOYVoHUpt3U6499mKjlRfGJJu+3
        T9geVhlwwXB4+74yjC8piS6bFRJwhTcH3r4yjXd6WewJ/hQ6+i5p
X-Google-Smtp-Source: APXvYqyW6c2iTf3Cj4Rx0JLVeiYDRNlELp3HlgGAgqlk6g4GIqImK67Iia0aTMbZ+ipN516EjCRcBw+bJtrP6M6Aeus=
X-Received: by 2002:a17:90a:ff08:: with SMTP id ce8mr7671823pjb.123.1567507584882;
 Tue, 03 Sep 2019 03:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <Pine.LNX.4.44L0.1908221619370.1311-100000@iolanthe.rowland.org>
 <nycvar.YFH.7.76.1908231128260.27147@cbobk.fhfr.pm> <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>
In-Reply-To: <1DD62093774CEE42AFC16E785A108804ABFF456A@USCULXMSG13.am.sony.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 3 Sep 2019 12:46:13 +0200
Message-ID: <CAAeHK+yissGc22RXh6t3KZxnGL=6_+PdP7LoQ_dvfALJcdQk8g@mail.gmail.com>
Subject: Re: [PATCH] HID: USB: Fix general protection fault caused by Logitech driver
To:     Roderick.Colenbrander@sony.com
Cc:     Jiri Kosina <jikos@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hillf Danton <hdanton@sina.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        linux-input@vger.kernel.org, USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 24, 2019 at 2:41 AM <Roderick.Colenbrander@sony.com> wrote:
>
> On Thu, 22 Aug 2019, Alan Stern wrote:
>
> > > > > > I've ran the fuzzer with your patches applied overnight and noticed
> > > > > > another fallout of similar bugs. I think they are caused by a similar
> > > > > > issue in the sony HID driver. There's no hid_hw_stop() call in the "if
> > > > > > (!(hdev->claimed & HID_CLAIMED_INPUT))" case in sony_probe(). Does it
> > > > > > look like a bug to you?
> > > > >
> > > > > It looks like the relevant hid_hw_stop() call is the one at the end of
> > > > > sony_configure_input().  But I can't tell if doing that way is valid or
> > > > > not -- in practice the code would end up calling hid_disconnect() while
> > > > > hid_connect() was still running, which doesn't seem like a good idea.
> > > > >
> > > > > There's a comment about this near the end of sony_probe().  I suspect
> > > > > it would be better to call hid_hw_stop() in the conditional code
> > > > > following that comment rather than in sony_configure_input().
> > > > >
> > > > > Either way, these are all things Jiri should know about or check up on.
> > > > >
> > > > > Have you gotten any test results from syzbot exercising these pathways?
> > > > > You ought to be able to tell which HID driver is involved by looking
> > > > > through the console output.
> > > >
> > > > Yes, a typical crash is below, that's why I thought it's the sony
> > > > driver. Adding hid_hw_stop() in sony_probe() stops the issue from
> > > > happening, but I don't know whether it's the right fix.
> > >
> > > Probably you have to add hid_hw_stop() in sony_probe() and remove it
> > > from sony_configure_input().  But like I said above, Jiri should look
> > > into this.
>
> > It almost certainly is, thanks.
>
> > Adding Roderick to CC ... Roderick, will you be able to test and submit
> > a patch fixing that?
> >
> > --
> > Jiri Kosina
> > SUSE Labs
>
> Sure we will have a look and do some testing. Hopefully we can share a patch some time next week.

Hi Roderick,

I was wondering if you had a chance to look into this?

Once the Logitech fix is upstream, this similar Sony bug will start
producing a large number of similar syzbot reports since it causes a
major memory corruption and we'll need to triage them all again. It
would be nice to get the Sony fix merged together with the Logitech
one. Or at least to have it available so I can apply it manually until
it is merged.

Thanks!
