Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6F43B7AA
	for <lists+linux-input@lfdr.de>; Tue, 26 Oct 2021 18:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236323AbhJZQ7R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Oct 2021 12:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236295AbhJZQ7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Oct 2021 12:59:17 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E863C061745;
        Tue, 26 Oct 2021 09:56:53 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id c4so56095pgv.11;
        Tue, 26 Oct 2021 09:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WgPoDLreotacKgSCxjssM8YVC++au175VVy5gQ/BSV8=;
        b=LQH2g30TyCkDqZpUSJtZ8Sb1hNOa0JFac2VOJkn5gw1JSXdNp9a6j1j4L9M7SAxT8m
         i/d7d2lE94vcPT3SJpaonNL+zbfAc3KzKEnbi5H/KvZWAAXKbc3201McS7YRbHigyhX0
         3Urf7fzqeIQNUb3mMDVy8ZR5WJ/LhTJe75DyNQ6QTCB+lilYbO3gYyvfPinkofj8LyXs
         98xORT4V3222+b/iW5FvuqZmJbC/fZtZSDO50KZ3rAOveID2Y0KJtBoMOnVVsmhNi/Xg
         SEET9SDM4dUtDqwvUP+Pynna5u7hifU3iv/eEqA72AaQqjtd2pa7/9fwvUIrhS3VPLiD
         MWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WgPoDLreotacKgSCxjssM8YVC++au175VVy5gQ/BSV8=;
        b=44wRY4iku6K3VzPD2JHbrPyhDHYx3+dOcfNo73Bif9i0Pzktgj09uuU6nSoMVxrrJr
         j3F0JK9T5t59hUpRrNunoLrQSxb/RhbJauLlXMsXs3GXdHW+WG5NUIUgsc1YPiutMZ5k
         9jWpxSXjnweIC9l/FzK9JPPEbpwh1yjotjwdRHxjkQXaW7lsY4agO7d+9HcrRw2HoPr1
         SM7dj5jl5MfSNg5PZBYPKophoVKx25O1Sixkw5Oni+B/buGnPF3OEUwgwsNhGJI4mh4P
         ZQncUyoD254gKujRT9X8XLT4DXzV9VKtxKDnaUA9cBwwa7SMvfA0buKoeBBh8X8vo1UJ
         1bfQ==
X-Gm-Message-State: AOAM533pd7b7D6zgg4ck843gwnQW+kH75DjE+9mbtz8knv1YZlDhG6lj
        VLeW7H0YkcTELXLxJnAEwRvA/GIy8qvm0IjHZtY=
X-Google-Smtp-Source: ABdhPJznb/7MirWrwZqR/FWHK5Qwogj97pHu5MaFdHytU2GTAOysA7S1ugsNpGsLmpreiuSAGyHcx1HLBotHqIpqKBA=
X-Received: by 2002:aa7:8b1a:0:b0:44d:37c7:dbb6 with SMTP id
 f26-20020aa78b1a000000b0044d37c7dbb6mr27340407pfd.11.1635267412857; Tue, 26
 Oct 2021 09:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125939.427-1-caihuoqing@baidu.com> <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm>
 <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com>
 <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com>
 <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com>
 <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com>
 <nycvar.YFH.7.76.2110181725050.12554@cbobk.fhfr.pm> <CANRwn3Q_LksYwX5x+dKw9OzPcYBQr_N5=5bLpZgNPtd88Zqpfg@mail.gmail.com>
In-Reply-To: <CANRwn3Q_LksYwX5x+dKw9OzPcYBQr_N5=5bLpZgNPtd88Zqpfg@mail.gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Tue, 26 Oct 2021 09:56:41 -0700
Message-ID: <CANRwn3TGkin=4aEKibUicmH-UtRz_SFz7+S6dAsTwXVxRzzi9g@mail.gmail.com>
Subject: Re: [PATCH] HID: wacom: Make use of the helper function devm_add_action_or_reset()
To:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>,
        Cai Huoqing <caihuoqing@baidu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 19, 2021 at 8:36 AM Jason Gerecke <killertofu@gmail.com> wrote:
>
> On Sun, Oct 17, 2021 at 9:53 PM Dmitry Torokhov <dmitry.torokhov@gmail.co=
m> wrote:
>>
>> I think this is OK, but I would prefer if assignments that alter the
>>
>> shared data (i.e. assignment to wacom_wac->shared->pen, etc) would
>> continue stay under mutex protection, so they need to be pulled up.
>
>
>
> On Mon, Oct 18, 2021 at 8:26 AM Jiri Kosina <jikos@kernel.org> wrote:
>>
>> I don't see any issue with that ordering, but I'd also prefer for clarit=
y
>> to keep updating the shared data structure under the mutex protection.
>>
>
> The data behind the "shared" struct (e.g. wacom_wac->shared->pen) is not =
currently under any mutex protection. I don't think mutex protection is nec=
essary, but we can take a look... I believe all of its members are either f=
lags (so already atomic) or initialized during probe and then just used as =
a handle with appropriate NULL checks (but maybe two threads could be simul=
taneously issuing events to the same device?).
>
> If a patch to add mutex protection to the shared struct is necessary, tha=
t's going to be a seperate patch that touches a lot more of the driver.

Following up on this. I took a second look at the shared struct, and
believe that things should work fine during initialization and
steady-state. There are, however, opportunities for e.g. one
device/thread to be removed and set e.g. `shared->touch =3D NULL` while
a second device/thread is attempting to send an event out of that
device. This is going to be very rare and only on disconnect, which is
probably why we've never received reports of real-world issues.

This shared issue is present with or without the changes by Cai and
myself. I would ask that these two patches be merged while we look at
introducing a new mutex to protect the contents of the shared pointer.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....
