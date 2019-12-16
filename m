Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8CF1121C3E
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2019 22:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfLPV5h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Dec 2019 16:57:37 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:32791 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727404AbfLPV5c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Dec 2019 16:57:32 -0500
Received: by mail-vs1-f68.google.com with SMTP id n27so5188197vsa.0
        for <linux-input@vger.kernel.org>; Mon, 16 Dec 2019 13:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DFPpNng3KoPqtg8NdN2SpyoGmm5E5m0rky9u0AsyxLk=;
        b=nOaUKB8O/lLoPcm34GbcXeaAetd9TsZSmTrUu2nEBnBwoIurEZRZGA+EjyDHs9ahas
         mZ72Fu15WqdrDZf5opeovzT/LYUYrT8uK0u70I4hk8q8U26bpxVaTuTHFFRAhs5PaD4v
         Xx32wem5YmdhKnIA7pj9RACkakMtPlgZ9ce9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DFPpNng3KoPqtg8NdN2SpyoGmm5E5m0rky9u0AsyxLk=;
        b=kRpVy3IC+FlqYUZWuqHyxvY2KCmQfbKHCfdoxajCu/mVXDAqfv1QyrFpEbbiNouwex
         8vtmAIsvuswrB2DkaUh+XPRqc0264GXN2fdVNK6lK4lL4UuKZgaWQ4ZFogzdhSPbV5IA
         HdeFlH33bHkjfey9NwGT2IWdfYAL4RT5xWFpr6Qj/tcl9ZTUIBB+E963vMNqk8zOLutG
         RKFUFycZEhm2NVDaJ4R3bMLd+tnvEtrZjofXf389mkV8sas0+c0ivu+mN+TCmHvHQkNb
         rssTE9JnQ5IDhXhtAXNKmAxPyXFmDrivqcE67IG3U2ItTxuc39YVXtr+BmMINVgFfLTM
         19dA==
X-Gm-Message-State: APjAAAWKwgDSrPEzUHft+MOqeN1y9pgYkOmsxRC5xJKAoR3M+3T6BPDY
        7yZcOQydh25+o3fBESGZHlw8Z7i/7UZEKDV0Ye5xJw==
X-Google-Smtp-Source: APXvYqyK1F6gGCRuxEz8GZK1mdTsTU3OEQl91lSUWV7Cjfrgcb+iTWic/oW/rvOgipPfFAyWFbF1nTFONGWvRzCBwSA=
X-Received: by 2002:a05:6102:81:: with SMTP id t1mr916905vsp.86.1576533450826;
 Mon, 16 Dec 2019 13:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20191202084750.k7lafzzrf3yq2tqs@pali> <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali> <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali> <20191203173821.4u6uzxeaqnt3gyz3@pali>
 <20191203191112.GJ50317@dtor-ws> <20191205105206.slibwytrcteicx6y@pali>
 <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
 <20191206091114.kh255jrmerruumnq@pali> <20191206174048.GQ50317@dtor-ws>
In-Reply-To: <20191206174048.GQ50317@dtor-ws>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Mon, 16 Dec 2019 13:57:19 -0800
Message-ID: <CANFp7mVStzfjBT6SxQp+BGytat-Pnb8ntzZe8xMgPpB7x59zCg@mail.gmail.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        linux-input@vger.kernel.org,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Since there hasn't been further activity on this thread, I assume that
we're agreed that requiring the size in the IOCTL is ok (i.e.
UI_SET_PHYS_STR(18)).

Dmitry, could you please review -- [PATCH v4] Input: uinput - Add
UI_SET_PHYS_STR and UI_SET_UNIQ_STR -- from December 4 for merge?

Thanks
Abhishek

On Fri, Dec 6, 2019 at 9:40 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Fri, Dec 06, 2019 at 10:11:14AM +0100, Pali Roh=C3=A1r wrote:
> > On Thursday 05 December 2019 12:03:05 Abhishek Pandit-Subedi wrote:
> > > On Thu, Dec 5, 2019 at 2:52 AM Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> > > >
> > > > On Tuesday 03 December 2019 11:11:12 Dmitry Torokhov wrote:
> > > > > On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > On Tuesday 03 December 2019 00:09:47 Pali Roh=C3=A1r wrote:
> > > > > >
> > > > > > Hi Dmitry!
> > > > > >
> > > > > > I was looking again at those _IOW defines for ioctl calls and I=
 have
> > > > > > another argument why not specify 'char *' in _IOW:
> > > > > >
> > > > > > All ioctls in _IOW() specify as a third macro argument type whi=
ch is
> > > > > > passed as pointer to the third argument for ioctl() syscall.
> > > > > >
> > > > > > So e.g.:
> > > > > >
> > > > > >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> > > > > >
> > > > > > is called from userspace as:
> > > > > >
> > > > > >   int val;
> > > > > >   ioctl(fd, EVIOCSCLOCKID, &val);
> > > > > >
> > > > > > Or
> > > > > >
> > > > > >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> > > > > >
> > > > > > is called as:
> > > > > >
> > > > > >   struct input_mask val;
> > > > > >   ioctl(fd, EVIOCSMASK, &val);
> > > > > >
> > > > > > So basically third argument for _IOW specify size of byte buffe=
r passed
> > > > > > as third argument for ioctl(). In _IOW is not specified pointer=
 to
> > > > > > struct input_mask, but struct input_mask itself.
> > > > > >
> > > > > > And in case you define
> > > > > >
> > > > > >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> > > > > >
> > > > > > then you by above usage you should pass data as:
> > > > > >
> > > > > >   char *val =3D "DATA";
> > > > > >   ioctl(fd, MY_NEW_IOCTL, &val);
> > > > > >
> > > > > > Which is not same as just:
> > > > > >
> > > > > >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> > > > > >
> > > > > > As in former case you passed pointer to pointer to data and in =
later
> > > > > > case you passed only pointer to data.
> > > > > >
> > > > > > It just mean that UI_SET_PHYS is already defined inconsistently=
 which is
> > > > > > also reason why compat ioctl for it was introduced.
> > > > >
> > > > > Yes, you are right. UI_SET_PHYS is messed up. I guess the questio=
n is
> > > > > what to do with all of this...
> > > > >
> > > > > Maybe we should define
> > > > >
> > > > > #define UI_SET_PHYS_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE,=
 111, len)
> > > > > #define UI_SET_UNIQ_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE,=
 112, len)
> > > >
> > > > I'm not sure if this is ideal. Normally in C strings are nul-termin=
ed,
> > > > so functions/macros do not take buffer length.
> > > Except strncpy, strndup, snprintf, etc. all expect a buffer length. A=
t
> >
> > This is something different as for these functions you pass buffer and
> > length of buffer which is used in write mode -- not for read mode.
> >
> > > the user to kernel boundary of ioctl, I think we should require size
> > > of the user buffer regardless of the data type.
> > >
> > > > _STR therefore in names looks inconsistent.
> > > The _STR suffix is odd (what to name UI_SET_PHYS_STR then??) but
> > > requiring the length seems to be common across various ioctls.
> > > * input.h requires a length when requesting the phys and uniq
> > > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/include/uapi/linux/input.h#n138)
> > > * Same with HIDRAW when setting and getting features:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/uapi/linux/hidraw.h#n40,
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/samples/hidraw/hid-example.c#n88
> >
> > All these ioctls where is passed length are in opposite direction
> > (_IOC_READ) as our PHYS and UNIQ (_IOC_WRITE).
> >
> > I fully agree that when you need to read something from kernel
> > (_IOC_READ) and then writing it to userspace, you need to specify lengt=
h
> > of userspace buffer. Exactly same as with userspace functions like
> > memcpy, snprintf, etc... as you pointed. Otherwise you get buffer
> > overflow as callee does not know length of buffer.
> >
> > But here we we have there quite different problem, we need to write
> > something to kernel from userspace (_IOC_WRITE) and we are passing
> > nul-term string. So in this case specifying size is not required as it
> > is implicitly specified as part of passed string.
>
> With the new IOCTL definitions it does not need to be a NULL-terminated
> string. It can be a buffer of characters with given length, and kernel
> will NULL-terminate as this it what it wants, not what the caller has to
> give.
>
> Thanks.
>
> --
> Dmitry
