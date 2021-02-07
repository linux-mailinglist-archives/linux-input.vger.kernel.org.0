Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A40A53121EF
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 07:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhBGGGe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 01:06:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbhBGGG1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 01:06:27 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A659C061756
        for <linux-input@vger.kernel.org>; Sat,  6 Feb 2021 22:05:47 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id w11so5539452qvz.12
        for <linux-input@vger.kernel.org>; Sat, 06 Feb 2021 22:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Iss+N32KFNjVdSLKy1lt/kkAK+n9VYPqtD+MolB/mHU=;
        b=lB9IwFzuYmlRMkyyMzpevGHff/aE36SQ7msFZBlhWSpM3asl+sJju1MrZ9bRu1Rekw
         Nuij729ELEhn/qiM0+fMjKCRJ6233IBOHStWd3Rioxbw3Rt+To5Njfw38a9haZ4uCJmm
         kpLuxqUos3JxBsiYiZDP1mQ0iMl1/86UgDwmr7SogljZlBHMWMSX0VBMVdVet8yYTcmH
         0ViNHhIBHEq4fkBi0CmGoMw1kvT52jVl2fMUCO1m03LBm8W/lV543Vt/lcackUImw8sX
         QcS+422hpuJeyYe1NB4sRhNGBJdJxbe5CN7mZa4OogVcRsW4OP82ukYW+SsNHEG9TkzF
         JF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Iss+N32KFNjVdSLKy1lt/kkAK+n9VYPqtD+MolB/mHU=;
        b=HcLdXnW0EcyWxJMXp3BKe37HYix4xpHF0GkhcgkpNUSXCNmKAv5+ZQpIQjAvrvXPYi
         6OLk9JfYYsH3I/iyiTSInlXyLsSZl4ulQr0zBBaw0T+972LI/jmM/w9YE9IGWyJ6EDh5
         ck5kZADZyjL8k1eh+MyH+0Ejy8FXMbi+X06vCJQ9ogxA5W9V7VehgdyChmj/1A9yK8zd
         dUBx3EVyj9pucK6zPB7hzxXPURvxb83EU5eFJXHgaCR4Zt8J/wLzDdTs9notnF0CxwEP
         OfsXhredk8JCKInq9Uwvu+4WDdVNZEdE0UJqf6GI5wXsgGf8dTGaQ11xWTOADBqa7V4b
         7bYA==
X-Gm-Message-State: AOAM531nXVs3l5zeuyAe8IGiidgTz0C8+iRZLa16sblxgm2kWBvVLlNZ
        nhpauplb0JYrYr6qdFZcuUluQJ+3q13aUWdW25CgiA==
X-Google-Smtp-Source: ABdhPJxQKarqyHiexqQMfqJefnsMnHJMQ6DOvVD7tXGuZheFhGd7SIfOXWFWqqUGLrR8i2/lC1xMwyW1ouEAvGLXPCQ=
X-Received: by 2002:a0c:f582:: with SMTP id k2mr11188768qvm.55.1612677946496;
 Sat, 06 Feb 2021 22:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20210128172657.24516-1-roderick@gaikai.com> <CAO-hwJLi+twcmSFkbPHHJ23CpF5P=EORsVauyhwvGt9dGoq++A@mail.gmail.com>
 <BSS2VIzUg6n3H_LHkC8vJVbSUi11kOgWTAPdurpx1i13T2qL1vJZg_rZIoX5ChX17cu3xu5k33VcKG52xWWTlDfFjyM_YcsTgitebXIsB8I=@protonmail.com>
In-Reply-To: <BSS2VIzUg6n3H_LHkC8vJVbSUi11kOgWTAPdurpx1i13T2qL1vJZg_rZIoX5ChX17cu3xu5k33VcKG52xWWTlDfFjyM_YcsTgitebXIsB8I=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sat, 6 Feb 2021 22:05:35 -0800
Message-ID: <CANndSKn5dPXdujHKpr6zQ05=dtNGiaPKmF7LKD2kONy=urmkOA@mail.gmail.com>
Subject: Re: [PATCH v5 00/13] HID: new driver for PS5 'DualSense' controller
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>,
        =?UTF-8?Q?Florian_M=C3=A4rkl?= <linux@florianmaerkl.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s and Benjamin,

On Fri, Feb 5, 2021 at 8:03 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.c=
om> wrote:
>
> Hi
>
>
> 2021. febru=C3=A1r 5., p=C3=A9ntek 18:01 keltez=C3=A9ssel, Benjamin Tisso=
ires =C3=ADrta:
>
> > Hi,
> >
> > On Thu, Jan 28, 2021 at 6:27 PM Roderick Colenbrander
> > roderick@gaikai.com wrote:
> >
> > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > Hi,
> > > This is hopefully the final revision of this patch series. Patch v4 h=
ad
> > > a rebase issue of a part of the sensors patch for which a part had mo=
ved
> > > to the end of the series. This has been fixed. I have double, no trip=
le
> > > checked the patches. Made sure they build using a 'rebase -x' script
> > > and also ran the hid-tools tests on the final driver.
> > > Thanks to everyone who provided feedback through the mailing list or =
privately.
> > > As suggested by Benjamin on the 'v4' version of this email, if you we=
re
> > > involed in the review or testing of this series and would like some c=
redit,
> > > please provide a reviewed-by or tested-by tag.
> > > Changes since v4:
> > >
> > > -   Fixed bad rebase of ps_sensors_create, moved it to appropriate pa=
tch.
> >
> > Barnab=C3=A1s, any comments on this version?
> >
> > As soon as I get your rev-by, we can apply the series, just in time for=
 5.12.
> >
>
> Sorry for not responding earlier, I have been relatively busy lately. I h=
ave taken
> another look at the final source file. I have a couple comments for Roder=
ick:
>
>  - `player_ids` array should be `static const` as far as I can see;
>  - there are a couple devm_kasprintf() calls which are not checked;
>  - power_supply_powers() call is not checked - I think either a comment
>    should mention that it's not considered a fatal error, or checked
>
> There are also other more minor things, formatting inconsistencies, but I
> cannot see anything else, so with the aforementioned things fixed, if you=
 want:
>
> Reviewed-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
>

Thanks for the additional feedback. I fixed a few additional checkpath
warnings and also included these other fixes. I will send out a v6
series tomorrow morning when I'm fresh :)

Thanks,
Roderick
