Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF78EBD8DD
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 09:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405152AbfIYHQM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Sep 2019 03:16:12 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46790 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405047AbfIYHQM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 03:16:12 -0400
Received: by mail-lf1-f66.google.com with SMTP id t8so3346113lfc.13;
        Wed, 25 Sep 2019 00:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v3IxuuxS4/IRcbugvvfMOWxS50zKTmcgONQh2kY5N1s=;
        b=QllyeOiuDQFUSf2fEbOerzoGI1UD4cKo3zCoQXphCjwGoL2cDreCUnX94D1upbk62Y
         YsizzI46hTMF6G/beYJYaHSVvmvwvjkS3jro2aGTrHYHOgCwVLwgYN1AZGWsnhNZfMCo
         LW4IHOymvf8oMkW7XRlC1KAQGBlcb9BFe4ymiXOfifXmJLBIJ2w1t1J5Xvn4OYyezcST
         h6Kvcko3Lq7o4rEOZ5GozS9x6rKlhJ0kIWpk8BSd9dI3Ur7ugiZPQf/S3lEBd4mSUVd7
         noFZqi50dIaW048zIQl7g6xWm2rRF67nCVSMTo7ebnFa1Cm57edhoz5YVGxyQKa7Kf5t
         TqYA==
X-Gm-Message-State: APjAAAWNNPuHRGekhPA8wtCrl8ZqcfrD1yfvCnrrDS1XDmkynBz3mYmh
        NuXfsoz07bttDLtanV/SQUM=
X-Google-Smtp-Source: APXvYqxK9KlRnUB5BCuCdHzDSyVWaKW57vgtVOZwe0WEPa0Hk1fxHthoUKNNsO1eBuospP4ZWxVEsw==
X-Received: by 2002:a05:6512:304:: with SMTP id t4mr4739714lfp.15.1569395769975;
        Wed, 25 Sep 2019 00:16:09 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id b67sm1046757ljf.5.2019.09.25.00.16.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2019 00:16:09 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iD1X4-0003kO-7z; Wed, 25 Sep 2019 09:16:14 +0200
Date:   Wed, 25 Sep 2019 09:16:14 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        syzbot <syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Ramses =?iso-8859-1?Q?Ram=EDrez?= <ramzeto@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        Cameron Gutman <aicommander@gmail.com>,
        Tom Panfil <tom@steelseries.com>, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: KASAN: use-after-free Read in usb_anchor_resume_wakeups
Message-ID: <20190925071614.GA14159@localhost>
References: <000000000000e9312b058d3eadb8@google.com>
 <CAAeHK+yPewmT9J0mAYL0P2Wz55asVFD0DbQnwkBS7zdRTkyN2A@mail.gmail.com>
 <CAL411-o09wBhiPtRixFo4=6pB1rAmUsTKc2sBQmn4MjQcPBy2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL411-o09wBhiPtRixFo4=6pB1rAmUsTKc2sBQmn4MjQcPBy2A@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 23, 2019 at 05:41:54PM +0800, Peter Chen wrote:
> > On Tue, Jul 9, 2019 at 2:27 PM syzbot
> > <syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=118d136da00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=58e201002fe1e775e1ae
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > >
> > > Unfortunately, I don't have any reproducer for this crash yet.
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > > Reported-by: syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com
> > >
> > > dummy_hcd dummy_hcd.5: no ep configured for urb 00000000c6093b7b
> > > xpad 6-1:0.169: xpad_irq_out - usb_submit_urb failed with result -19
> > > ==================================================================
> > > BUG: KASAN: use-after-free in debug_spin_lock_before
> > > kernel/locking/spinlock_debug.c:83 [inline]
> > > BUG: KASAN: use-after-free in do_raw_spin_lock+0x24d/0x280
> > > kernel/locking/spinlock_debug.c:112
> > > Read of size 4 at addr ffff8881d0e584dc by task kworker/1:4/2786
> > >
> 
> It should due to URB is freed at xpad_disconnect, but xpad_irq_out
> still tries to access
> freed URB.
> 
> Peter
> 
> #syz test: https://github.com/google/kasan.git 7829a896
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 6b40a1c68f9f..32b7a199b580 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1850,6 +1850,7 @@ static void xpad_disconnect(struct usb_interface *intf)
> 
>         xpad_deinit_input(xpad);
> 
> +       usb_kill_urb(xpad->irq_out);

I'm not sure this is the right fix. The interrupt-urb should have been
stopped by xpad_stop_output() just above. Perhaps the type test in that
function is broken, or we may have a race where another thread is
submitting the URB after we tried to stop it which we fail to handle.

Didn't check that closely, though.

Johan
