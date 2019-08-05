Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5648156E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 11:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfHEJ1Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 05:27:25 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:44738 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEJ1Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 05:27:25 -0400
Received: by mail-qk1-f194.google.com with SMTP id d79so59474252qke.11
        for <linux-input@vger.kernel.org>; Mon, 05 Aug 2019 02:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q6HFt7/ogxvWwkBGiqBB2NtK9/Gsq8ZSmOkSTfTrSYA=;
        b=V8D++ekfd6YG8ET5Y9Eh5dvkPXj6F5eljSgqTzn7QPdYXTp79OT5hSbIVaLWMJucVP
         gB7IZEXPX4BAfNno/pScydYVAd1N6jU06zmfSescG1eMzi8E6PUGKJeEuVPXizL87ZkN
         BYNgoKRZ2HjQEDWjfDc6gwcC8f4MZQZr70c50Nit/TosJi9vyEYEPnkiKTVz2PyCV84/
         bTN2pbFfNCdJlprmxLttHcWhqX2zsqv/65SGdRE0LbFe0MQgH/Hys1CO1TJZdtn4Dxd7
         gp/H5KbCb9/PEE88tdzFO3zHnLcdM6nlxVoFPwRtZem5QKdkQhRzHs9fEGyJxXt/6O+C
         t0KQ==
X-Gm-Message-State: APjAAAVDFLR83lq4d6IkmD5pcpxe/c0ntHU1Dv/et0l9okSuCNL1USSZ
        JtQn6T1qXA/ZbJb+UT3l+j4FakkPSG+BAUdBS4oxDQ==
X-Google-Smtp-Source: APXvYqxqFujP0fyuTrXmLkK2GtWmNxOQfQxffpWW5LxviarCAcn3TPM1FuK26yNLsh8Tr3sHXvlT55jiyB/3Pwdu2GE=
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr53456085qki.169.1564997243999;
 Mon, 05 Aug 2019 02:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190725145719.8344-1-yuehaibing@huawei.com> <20190731105927.GA5092@dell5510>
 <20190731110629.GB5092@dell5510> <3e9bda5b-68dc-15b9-ca79-2e73567ea0a5@redhat.com>
 <nycvar.YFH.7.76.1908051051080.5899@cbobk.fhfr.pm> <7988688e-8020-3d03-63cd-d844c01e5bf6@redhat.com>
In-Reply-To: <7988688e-8020-3d03-63cd-d844c01e5bf6@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 5 Aug 2019 11:27:12 +0200
Message-ID: <CAO-hwJLstTVmr7+sTXYAjO8H4K00emBdUhRgU1FWD6TpBOSUrg@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: Fix check of logi_dj_recv_query_paired_devices()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Petr Vorel <pvorel@suse.cz>,
        YueHaibing <yuehaibing@huawei.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

On Mon, Aug 5, 2019 at 10:55 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jiri,
>
> On 05-08-19 10:51, Jiri Kosina wrote:
> > On Wed, 31 Jul 2019, Hans de Goede wrote:
> >
> >>>>> In delayedwork_callback(), logi_dj_recv_query_paired_devices
> >>>>> may return positive value while success now, so check it
> >>>>> correctly.
> >>>
> >>>>> Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of
> >>>>> Fixes: logi_dj_recv_query_hidpp_devices")
> >>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> >>>> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> >>> OK, not only it didn't fix problems with logitech mouse (see below),
> >>> but removing mouses USB dongle effectively crashes kernel, so this one
> >>> probably
> >>> shouldn't be applied :).
> >>>
> >>> [  330.721629] logitech-djreceiver: probe of 0003:046D:C52F.0013 failed with
> >>> error 7
> >>> [  331.462335] hid 0003:046D:C52F.0013: delayedwork_callback:
> >>> logi_dj_recv_query_paired_devices error: 7
> >>
> >> Please test my patch titled: "HID: logitech-dj: Really fix return value of
> >> logi_dj_recv_query_hidpp_devices"
> >> which should fix this.
> >
> > Hans, have I been CCed on that patch? I don't seem to see it in in inbox.
>
> I have "Jiri Kosina <jikos@kernel.org>" in the To: for the patch in the
> copy in my Inbox (I always Cc myself).
>
> Anyways, you can grab it here:
>
> https://patchwork.kernel.org/patch/11064087/
>
> It has gathered 2 Tested-by-s and 2 Reviewed-by-s since posting, so
> assuming you like it too, this is ready for merging.
>

Sorry for being silent on the mailing list.

I have been 2 weeks on PTO, and when I came back, my server that shown
a few corruptions here and there was completely broken.
I spent the last week trying to revive it until I realized that I have
a bad memory chip on it, which introduced random errors.

Anyway, I think Hans' patch should go in, but I am not fully
operational given that my test box is still recovering :(

Cheers,
Benjamin
