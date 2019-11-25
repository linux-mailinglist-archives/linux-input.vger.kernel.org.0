Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCBF1090D1
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 16:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728172AbfKYPOu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 10:14:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27326 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728197AbfKYPOt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 10:14:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574694888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UsViNUF8R5vNPI8HMF3+qgqlgoEtqHxa8xpNMwJsggY=;
        b=ZKjk92IGUP/lBzEGVIwXhRfBtMC2RKe35P37bioHJsEiXmrB+84rEShVO+gnWkfZP3k2Ld
        D4ZqisvFegBwJpCXfOeUa4umhZyjVOxsteNdKOAr9HV4R/hPCTWwpFlh2yxsWafy0nt4pa
        15C0AasX6RcsORwUQZxYNmvUJDMTEsw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-rgZ5UeAeONOIwvxGsFLTOg-1; Mon, 25 Nov 2019 10:14:43 -0500
Received: by mail-qt1-f200.google.com with SMTP id e2so10418863qtq.11
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 07:14:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U8eb8wa21YsOeZ9EHNPAieCGqRK3RoFp6IWeODBsRdM=;
        b=Z41XFrlrk5OIBvR1XX1jrLtPWi8ka1r7GlzI/3cicffcK5BN96Vty7OpAFuEdvA+n4
         0MfSQySe02E74OaW45RXFHiHn2JsYLnPlpB2oNep8Avq+Hx7XlgXuC58cQ4sA9I7bMbU
         Umpa6xTxuHK1i1z9hRQSS1/DFwAT4RqMvTkZ8P2KXYolVVBXiGKRQf3oC7mHDTv3DjFm
         WZLJcVZI8FpLkansajZCzsi40tq/tMeec6p80S8c8yuKf9z+8qGnmhqLMp9FOg+cRkgy
         eNpkZYnX3pz3PzBe9Ks2WLmiOoXKSDBNfrUmlvinZmBB12x2iBDGs+dCaqj0zap+gOkl
         UlWQ==
X-Gm-Message-State: APjAAAXz8SZzJxZPm7ZiSh73VIc2qA0DdC4i/qqafXSWWPA0VnB0niGj
        Nnrh23hpVuKrKckHtgeP0A8Op1wxn+vYsq7sgqqkzL0cUmtUf9G74rFG0gN4QUzIvJrEwZQMQYP
        AlKSkn6jo2Fm7wksZT3c56jlXwy45yGhMGEEPJgg=
X-Received: by 2002:a0c:e085:: with SMTP id l5mr28250899qvk.138.1574694883180;
        Mon, 25 Nov 2019 07:14:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqz231nFYrEpCOtVtPCVvxtw8KqhWa9u2D2TL5w9YZ3DcpHEw3DlDKnUGv/FxcjKOG+Qo5fUmUbxnHwBsYq8Spw=
X-Received: by 2002:a0c:e085:: with SMTP id l5mr28250865qvk.138.1574694882877;
 Mon, 25 Nov 2019 07:14:42 -0800 (PST)
MIME-Version: 1.0
References: <20191105141807.27054-1-tranmanphong@gmail.com>
 <CAO-hwJ+cydMPQE_otc8-67=SDKmjac5RXsLs-9x6dH4YqA+DVQ@mail.gmail.com> <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
In-Reply-To: <0407e8bb-bbf5-ec64-cdac-ef266f1ab391@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Nov 2019 16:14:31 +0100
Message-ID: <CAO-hwJ+r+n4Dy+jqSuCk-vApfP-PR4o2oTzt4XWxH5jUQOeFwA@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-lg4ff: Fix uninit-value set_autocenter_default
To:     Phong Tran <tranmanphong@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org,
        syzbot <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com>
X-MC-Unique: rgZ5UeAeONOIwvxGsFLTOg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 19, 2019 at 2:30 PM Phong Tran <tranmanphong@gmail.com> wrote:
>
> On 11/18/19 4:43 PM, Benjamin Tissoires wrote:
> > On Tue, Nov 5, 2019 at 3:18 PM Phong Tran <tranmanphong@gmail.com> wrot=
e:
> >>
> >> syzbot found a problem using of uinit pointer in
> >> lg4ff_set_autocenter_default().
> >>
> >> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
> >>
> >> Tested by syzbot:
> >>
> >> https://groups.google.com/d/msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQA=
J
> >
> > This seems weird to me:
> >
> > the syzbot link above is about `hid_get_drvdata(hid)`, and, as I read
> > it, the possibility that hid might not have an initialized value.
> >
>
> In the dashboard [1] shows
> BUG: KMSAN: uninit-value in dev_get_drvdata include/linux/device.h:1388
> [inline]
> BUG: KMSAN: uninit-value in hid_get_drvdata include/linux/hid.h:628 [inli=
ne]
> BUG: KMSAN: uninit-value in lg4ff_set_autocenter_default+0x23a/0xa20
> drivers/hid/hid-lg4ff.c:477
> base on that I did the initialization the pointer in the patch.
>
> > Here you are changing the initialized values of value, entry and
> > drv_data, all 3 are never used before their first assignment.
> >
> > I have a feeling this particular syzbot check has already been fixed
> > upstream by d9d4b1e46d95 "HID: Fix assumption that devices have
> > inputs".
> >
>
> I think the commit d9d4b1 fixed this report [2] by syzbot.
>
> [1] https://syzkaller.appspot.com/bug?extid=3D1234691fec1b8ceba8b1
> [2] https://syzkaller.appspot.com/bug?extid=3D403741a091bf41d4ae79

As you can see in my long discussion with syzbot today, d9d4b1 also
fixed that one.

https://groups.google.com/forum/#!msg/syzkaller-bugs/ApnMLW6sfKE/Qq0bIHGEAQ=
AJ

Cheers,
Benjamin

>
> regards,
> Phong.
> > Cheers,
> > Benjamin
> >
> >>
> >> Signed-off-by: Phong Tran <tranmanphong@gmail.com>
> >> ---
> >>   drivers/hid/hid-lg4ff.c | 6 +++---
> >>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> >> index 5e6a0cef2a06..44dfd08b0c32 100644
> >> --- a/drivers/hid/hid-lg4ff.c
> >> +++ b/drivers/hid/hid-lg4ff.c
> >> @@ -468,10 +468,10 @@ static int lg4ff_play(struct input_dev *dev, voi=
d *data, struct ff_effect *effec
> >>   static void lg4ff_set_autocenter_default(struct input_dev *dev, u16 =
magnitude)
> >>   {
> >>          struct hid_device *hid =3D input_get_drvdata(dev);
> >> -       s32 *value;
> >> +       s32 *value =3D NULL;
> >>          u32 expand_a, expand_b;
> >> -       struct lg4ff_device_entry *entry;
> >> -       struct lg_drv_data *drv_data;
> >> +       struct lg4ff_device_entry *entry =3D NULL;
> >> +       struct lg_drv_data *drv_data =3D NULL;
> >>          unsigned long flags;
> >>
> >>          drv_data =3D hid_get_drvdata(hid);
> >> --
> >> 2.20.1
> >>
> >
>

