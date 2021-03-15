Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8A433ABDC
	for <lists+linux-input@lfdr.de>; Mon, 15 Mar 2021 07:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbhCOG7E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Mar 2021 02:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhCOG6s (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Mar 2021 02:58:48 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CA5C061574
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 23:58:48 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id m1so6437226ote.10
        for <linux-input@vger.kernel.org>; Sun, 14 Mar 2021 23:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MPDnjuDNv3IaZ4E624oq+RFwVd9AahoYlcez7UOKcfI=;
        b=Kvx8xTLhfMAz//a9HuAcjMjRIWZmbTArc4em0Inhts+pEUcSaxjjhSoBh0/da00HW+
         /rXdaMu13vOn3Dj1vWJBc4lqj4qa3jS4OoH+ETSvHGqUranPnOWWxCNlTrWvMCeGsND5
         +cSWnwsV91tXvNBsMFZ1LGICtBBP60BLbiJ4tCZac6uwumTlqU8keoJ5D9AFMmrLh4kb
         zPpS9nPOO+HrSI3TxX5CxYzwGxmXGTh+TkRWmwowmTt0KNoV1fJFDXu/9hoHdmNU3rPX
         FoOn65x78jlzeVMumdgNZP22PWsEpwnb1HWNiYdwDf3OoP3fy8f8q9DQYfXtrv/hiDtK
         3Utw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MPDnjuDNv3IaZ4E624oq+RFwVd9AahoYlcez7UOKcfI=;
        b=RBwCRsp9wkteyPPsH3BZuPe/wmSzQqSXzZPGUq6CU98DWfVB3EhGsBaTtBroq0YPiV
         kCu2ufl4igkOGgFgG08FQgQN9bvE7hiPgXsYuWO8lfC3M2/DB7meueYlxvU98h9mJqro
         l3DdkW4x6Aqi3/w170y95zwJ+UDxEUdrXff/4a7qujVTmEdPQLdE035tx4G/8CHpv1ap
         Sp0ymal0oO1ijH4KJbTsVwM/ufft8m1xZo4/XS3RdHn089bVs9wf9dVZi2zNofFZCbFF
         +f2Ypk8xlIp6LDXCnogdqIUm5AMAocZaHuXF0qe8P49Gfdqsl9aI6LPh7T1EWEdc+tNS
         yTUw==
X-Gm-Message-State: AOAM530mdiQJYXltZjJm0RO7WpXGEPQlCK/hBjEbHCAMOhzJYRFwm7au
        TOuZ0vSouAGf6iTm97+sRgV9P/yBNeiCdxmXzkg=
X-Google-Smtp-Source: ABdhPJxqW0HBUlVir4kLigJsPI8spKkkdCKlMdiY6DnTHpupfy04WGLkNaPdbmpYkCFkt7TRp2RRweAg3UxX+ZZ5+Rg=
X-Received: by 2002:a05:6830:18c6:: with SMTP id v6mr13060752ote.120.1615791527647;
 Sun, 14 Mar 2021 23:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAnY7J2yYdsLMG=07u6QPf5SKN6ba=D+v=SE1vSMxWgP4A05pQ@mail.gmail.com>
 <YEy5Ki/lF2cbQxCH@kroah.com>
In-Reply-To: <YEy5Ki/lF2cbQxCH@kroah.com>
From:   Zhai Zhaoxuan <kxuanobj@gmail.com>
Date:   Mon, 15 Mar 2021 14:58:11 +0800
Message-ID: <CAAnY7J3KDb094ZDZ7QEUQ9biUBBSVr=ru0x7cWPSGsCi-=9quw@mail.gmail.com>
Subject: Re: [BUG]an input device can not support more than 568 keys due to
 uevent buffer too small
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Markus Rechberger <kontakt@sundtek.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 13, 2021 at 9:07 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 13, 2021 at 02:32:46PM +0800, Zhai Zhaoxuan wrote:
> > Hi Dmitry and Greg,
> >
> > I recently started making a keyboard utility. It basically helps the
> > user press some keys based on a user script.
> > So I tried to use the "uinput" driver to help me send keys to the kerne=
l.
> >
> > Due to any key and combination can be requested by the user script, I
> > tried to enable all KEYBIT on the uinput device. But it fails.
> > And more accurate, using a binary search, it seems that I am unable to
> > enable more than 568 keys.
>
> As that's not a "real" device, that makes sense :)
>
> > The KEY_MAX (defined in linux/input-event-codes.h) is 0x2ff. So it
> > should be ok to enable 767 keys. The uinput device should not fail
> > with only 568 keys.
> >
> > I read system logs. The log shows that the new input device fails due
> > to systemd-udevd trying to read
> > `/sys/devices/virtual/input/input4/uevent`, but this file is empty
> > unexpectedly.
> >
> > Then ,I searched on the web about this and found a bug opened in
> > 2016-05-24 by Markus:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D118861
> > The status of this bug is still NEW.
> >
> > I tried to debug the kernel. And I got something that may be useful.
> > The "uevent" shows empty, because a -ENOMEM error returns by
> > `input_add_uevent_modalias_var`.
> > And this function returns -ENOMEM, because the `buf` on `struct
> > kobj_uevent_env` is not enough.
> >
> > The size of `buf` is 2048 (UEVENT_BUFFER_SIZE). According to the
> > MODALIAS encoding algorithm (input_print_modalias_bits), if we allow
> > all 0x2ff keys to be enabled on the
> > uinput device, the buffer should have at least 2477 bytes. (2477 =3D  3
> > * (0xff - 0x71 + 1) + 4 * 0x200)
> > 2048 is smaller than 2477, so it fails.
> >
> > I have tried to set UEVENT_BUFFER_SIZE to 4096. After that,
> > everythings seems ok. The `/sys/devices/virtual/input/input4/uevent`
> > can show its content correctly. (See the attachment uevent.txt)
> >
> > Since this change is related to the core feature kobject which is used
> > everywhere in the kernel, I don't know if doubling the
> > UEVENT_BUFFER_SIZE is the best way to fix it, or if it will cause
> > other serious problems.
> > Or maybe we can use a dynamic buffer size in `struct kobj_uevent_env`.
> >
> >
> > Thank you,
> > Zhai Zhaoxuan
>
> > PRODUCT=3D3/1234/5678/0
> > NAME=3D"Example device"
> > PROP=3D0
> > EV=3D3
> > KEY=3D7fffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffff=
ff ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff ffff=
ffffffffffff ffffffffffffffff ffffffffffffffff fffffffffffffffe
> > MODALIAS=3Dinput:b0003v1234p5678e0000-e0,1,k71,72,73,74,75,76,77,78,79,=
7A,7B,7C,7D,7E,7F,80,81,82,83,84,85,86,87,88,89,8A,8B,8C,8D,8E,8F,90,91,92,=
93,94,95,96,97,98,99,9A,9B,9C,9D,9E,9F,A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,AA,AB,=
AC,AD,AE,AF,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,BA,BB,BC,BD,BE,BF,C0,C1,C2,C3,C4,=
C5,C6,C7,C8,C9,CA,CB,CC,CD,CE,CF,D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,DA,DB,DC,DD,=
DE,DF,E0,E1,E2,E3,E4,E5,E6,E7,E8,E9,EA,EB,EC,ED,EE,EF,F0,F1,F2,F3,F4,F5,F6,=
F7,F8,F9,FA,FB,FC,FD,FE,FF,100,101,102,103,104,105,106,107,108,109,10A,10B,=
10C,10D,10E,10F,110,111,112,113,114,115,116,117,118,119,11A,11B,11C,11D,11E=
,11F,120,121,122,123,124,125,126,127,128,129,12A,12B,12C,12D,12E,12F,130,13=
1,132,133,134,135,136,137,138,139,13A,13B,13C,13D,13E,13F,140,141,142,143,1=
44,145,146,147,148,149,14A,14B,14C,14D,14E,14F,150,151,152,153,154,155,156,=
157,158,159,15A,15B,15C,15D,15E,15F,160,161,162,163,164,165,166,167,168,169=
,16A,16B,16C,16D,16E,16F,170,171,172,173,174,175,176,177,178,179,17A,17B,17=
C,17D,17E,17F,180,181,182,183,184,185,186,187,188,189,18A,18B,18C,18D,18E,1=
8F,190,191,192,193,194,195,196,197,198,199,19A,19B,19C,19D,19E,19F,1A0,1A1,=
1A2,1A3,1A4,1A5,1A6,1A7,1A8,1A9,1AA,1AB,1AC,1AD,1AE,1AF,1B0,1B1,1B2,1B3,1B4=
,1B5,1B6,1B7,1B8,1B9,1BA,1BB,1BC,1BD,1BE,1BF,1C0,1C1,1C2,1C3,1C4,1C5,1C6,1C=
7,1C8,1C9,1CA,1CB,1CC,1CD,1CE,1CF,1D0,1D1,1D2,1D3,1D4,1D5,1D6,1D7,1D8,1D9,1=
DA,1DB,1DC,1DD,1DE,1DF,1E0,1E1,1E2,1E3,1E4,1E5,1E6,1E7,1E8,1E9,1EA,1EB,1EC,=
1ED,1EE,1EF,1F0,1F1,1F2,1F3,1F4,1F5,1F6,1F7,1F8,1F9,1FA,1FB,1FC,1FD,1FE,1FF=
,200,201,202,203,204,205,206,207,208,209,20A,20B,20C,20D,20E,20F,210,211,21=
2,213,214,215,216,217,218,219,21A,21B,21C,21D,21E,21F,220,221,222,223,224,2=
25,226,227,228,229,22A,22B,22C,22D,22E,22F,230,231,232,233,234,235,236,237,=
238,239,23A,23B,23C,23D,23E,23F,240,241,242,243,244,245,246,247,248,249,24A=
,24B,24C,24D,24E,24F,250,251,252,253,254,255,256,257,258,259,25A,25B,25C,25=
D,25E,25F,260,261,262,263,264,265,266,267,268,269,26A,26B,26C,26D,26E,26F,2=
70,271,272,273,274,275,276,277,278,279,27A,27B,27C,27D,27E,27F,280,281,282,=
283,284,285,286,287,288,289,28A,28B,28C,28D,28E,28F,290,291,292,293,294,295=
,296,297,298,299,29A,29B,29C,29D,29E,29F,2A0,2A1,2A2,2A3,2A4,2A5,2A6,2A7,2A=
8,2A9,2AA,2AB,2AC,2AD,2AE,2AF,2B0,2B1,2B2,2B3,2B4,2B5,2B6,2B7,2B8,2B9,2BA,2=
BB,2BC,2BD,2BE,2BF,2C0,2C1,2C2,2C3,2C4,2C5,2C6,2C7,2C8,2C9,2CA,2CB,2CC,2CD,=
2CE,2CF,2D0,2D1,2D2,2D3,2D4,2D5,2D6,2D7,2D8,2D9,2DA,2DB,2DC,2DD,2DE,2DF,2E0=
,2E1,2E2,2E3,2E4,2E5,2E6,2E7,2E8,2E9,2EA,2EB,2EC,2ED,2EE,2EF,2F0,2F1,2F2,2F=
3,2F4,2F5,2F6,2F7,2F8,2F9,2FA,2FB,2FC,2FD,2FE,ramlsfw
> >
>
> What about encoding the keys as ranges instead of individual ones, would
> that make more sense?

I think this solution is ok in most cases.


But, just a notice, MODALIAS may be used in user code (such as hwdb in
/lib/udev/hwdb.d). For example, the user may have a pattern "k*74*" in
hwdb to match the new input device which has a POWER button (0x74 is
the key code of power button). Then, the user could use udev to run
some programs, when an input device with power button has been added.

If we use a "range" to describe the keys, the user may be unable to
detect the power button with only hwdb. They have to move the matching
code into their own programs.


And what do you think, Dmitry?


>
> thanks,
>
> greg k-h

Thank you,
Zhai Zhaoxuan
