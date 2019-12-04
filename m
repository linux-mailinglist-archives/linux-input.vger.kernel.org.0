Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59437112ADF
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 13:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfLDMCv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 07:02:51 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46218 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfLDMCu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 07:02:50 -0500
Received: by mail-oi1-f193.google.com with SMTP id a124so6548618oii.13;
        Wed, 04 Dec 2019 04:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I/wNnqfcW4ZqavTcDtDeP4DdimYQ/CbMfwcHPxLORcU=;
        b=IYB+fl6oiS7WVYNm6UizdS/dbsz6W9GVR4XYnydRvQ0ZlHII7Px4LdYgywQOB7vWvr
         8LgFbx4H2Upl7Cn9wsk0BHhVEh1Q/cgrRij2gzwLTmzkIc9toHHkqw7mgPHAJ5wzwkgy
         DwsZ+dczIx3jBNYYnN70fdv25xRJxjWdo/qTrfvVGpETJCusxh0mAaLaJBgCs32EAqPk
         Ubf/BOrPJJ0QAiAGFIQ6NFaM2V+hA8+K/LavEYQ0uW/MguPRaiwWOEjuwvFNuY93nvjx
         5LYlmty4nWyvV4xnjMg8bikOzKzL3jaBbzmPewXdp7sErAU++naAQ1JZucY/RmrsaZrQ
         Dtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I/wNnqfcW4ZqavTcDtDeP4DdimYQ/CbMfwcHPxLORcU=;
        b=bQeg+ba/gA6J0nD5BJMJtdftG8JpD5hrvU/oHUIrUIvFlKl8UCksATxomAhhXdWgiD
         tNurA0bAIhe/PxcQmA8XAi7lY7nhA/SALlqUcSSAplttwMBPDWNiMD7SUTJgE2k0Dtg3
         G+RGy+XREgSHsRdBZPy3U+F10D20+BNqzi0uu73s9bF3NflEKg2qHoIoAgl/r0mpR5k+
         of8+SOc87rCdabAAIShHmlxgpXGLDpcqgZa2HAaaxEcXkfvX6lai1/XyWOqrSXEKmeMr
         xXrp9gPtH9Pxm+2MPUbwrdO+ZdT8BdWN2Y6umZ0WCFS8l3jdi5l2YmwHFy9grcbN6MKq
         Kv/A==
X-Gm-Message-State: APjAAAWd5iLE/czO24TW0K/KcfOEW1re0p/QTUEREeRlqaSbRC4utfvx
        OMYMLUNTzgWe2DWihUuQ9D518L0eUiudwIQs6kM=
X-Google-Smtp-Source: APXvYqys2hbbLQs/l6VGOlnshpcn40iqrNce0dKse5iFNBHnievNd7zQLIm4YS8hOeNTRMeuOpALpmLfw+cBz1JpNdg=
X-Received: by 2002:aca:b805:: with SMTP id i5mr2248499oif.110.1575460968940;
 Wed, 04 Dec 2019 04:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali> <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali> <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali> <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali> <20191203173821.4u6uzxeaqnt3gyz3@pali> <20191203191112.GJ50317@dtor-ws>
In-Reply-To: <20191203191112.GJ50317@dtor-ws>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Wed, 4 Dec 2019 14:02:36 +0200
Message-ID: <CABBYNZ+D8E1BA--T+dQfWTH31G2zHYvc1mxicm+p7WwA2O-THw@mail.gmail.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-input@vger.kernel.org,
        "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Dmitry,

On Tue, Dec 3, 2019 at 9:11 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Roh=C3=A1r wrote:
> > On Tuesday 03 December 2019 00:09:47 Pali Roh=C3=A1r wrote:
> > > On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> > > > On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Roh=C3=A1r wrote:
> > > > > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > > > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wrote=
:
> > > > > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > > > > Hi Pali,
> > > > > > > >
> > > > > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r w=
rote:
> > > > > > > > > Hello!
> > > > > > > > >
> > > > > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Su=
bedi wrote:
> > > > > > > > > > Support setting the uniq attribute of the input device.=
 The uniq
> > > > > > > > > > attribute is used as a unique identifier for the connec=
ted device.
> > > > > > > > > >
> > > > > > > > > > For example, uinput devices created by BlueZ will store=
 the address of
> > > > > > > > > > the connected device as the uniq property.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@c=
hromium.org>
> > > > > > > > >
> > > > > > > > > ...
> > > > > > > > >
> > > > > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi=
/linux/uinput.h
> > > > > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > > > > >  #define UI_SET_PHYS          _IOW(UINPUT_IOCTL_BASE, 1=
08, char*)
> > > > > > > > > >  #define UI_SET_SWBIT         _IOW(UINPUT_IOCTL_BASE, 1=
09, int)
> > > > > > > > > >  #define UI_SET_PROPBIT               _IOW(UINPUT_IOCTL=
_BASE, 110, int)
> > > > > > > > > > +#define UI_SET_UNIQ          _IOW(UINPUT_IOCTL_BASE, 1=
11, char*)
> > > > > > > > >
> > > > > > > > > I think that usage of char* as type in _IOW would cause c=
ompatibility
> > > > > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS=
_COMPAT). Size
> > > > > > > > > of char* pointer depends on userspace (32 vs 64bit), so 3=
2bit process on
> > > > > > > > > 64bit kernel would not be able to call this new UI_SET_UN=
IQ ioctl.
> > > > > > > > >
> > > > > > > > > I would suggest to define this ioctl as e.g.:
> > > > > > > > >
> > > > > > > > >   #define UI_SET_UNIQ           _IOW(_IOC_WRITE, UINPUT_I=
OCTL_BASE, 111, 0)
> > > > > > > > >
> > > > > > > > > And then in uinput.c code handle it as:
> > > > > > > > >
> > > > > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > > > > >
> > > > > > > > > as part of section /* Now check variable-length commands =
*/
> > > > > > > >
> > > > > > > > If we did not have UI_SET_PHYS in its current form, I'd agr=
ee with you,
> > > > > > > > but I think there is benefit in having UI_SET_UNIQ be simil=
ar to
> > > > > > > > UI_SET_PHYS.
> > > > > > >
> > > > > > > I thought that ioctl is just number, so we can define it as w=
e want. And
> > > > > > > because uinput.c has already switch for variable-length comma=
nds it
> > > > > > > would be easy to use it. Final handling can be in separate fu=
nction like
> > > > > > > for UI_SET_PHYS which can look like same.
> > > > > >
> > > > > > Yes, we can define ioctl number as whatever we want. What I was=
 trying
> > > > > > to say, right now users do this:
> > > > > >
> > > > > >       rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> > > > > >       ...
> > > > > >
> > > > > > and with UI_SET_UNIQ they expect the following to work:
> > > > > >
> > > > > >       rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > >       ...
> > > > >
> > > > > And would not following definition
> > > > >
> > > > >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > >
> > > > > allow userspace to call
> > > > >
> > > > >   rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > >
> > > > > as you want?
> > > >
> > > > OK, so what you are saying is that we can have whatever in the size
> > > > portion of ioctl number and simply ignore it in the driver
> > >
> > > Yes.
> > >
> > > > (and I do not
> > > > think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
> > >
> > > You are right, we do not need to clear any IOCSIZE_MASK. As ioctl num=
ber
> > > would be always sam constant number. So it would be really simple. So
> > > original patch would work if UI_SET_UNIQ define would be changed to
> > > above with _IOW() macro.
> > >
> > > > While this would work, I am not sure it is the best option as I thi=
nk
> > > > we'd have to comment extensively why we have arbitrary number in pl=
ace
> > > > of the size.
> > >
> > > Comment can be added. But this is as ioctl is going to accept variabl=
e
> > > length array (not fixed array), zero value make sense for me (zero as=
 we
> > > do not know exact size).
> > >
> > > > And we still do not really save anything, as we still have to go th=
rough
> > > > compat ioctl handler (since we have it already) and it is very simp=
le to
> > > > add a case for UI_SET_UNIQ there...
> > >
> > > Yes, compat ioctl is still used. But my proposed solution does not
> > > involve to define a new compact ioctl number just for sizeof(char *).
> > >
> > > I'm looking at this particular problem from side, that there is no
> > > reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
> > > number and one compat number), when one number is enough. It is one n=
ew
> > > ioctl call, so one ioctl number should be enough.
> > >
> > > And also with my proposed solution with ioctl size=3D0 it simplify
> > > implementation of UI_SET_UNIQ as it is not needed to implement also
> > > UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
> > > original patch (with changed UI_SET_UNIQ macro) is enough.
> > >
> > > But of of course, this is my view of this problem and I would not be
> > > against your decision from maintainer position. Both solutions would
> > > work correctly and bring same behavior for userspace applications.
> >
> >
> > Hi Dmitry!
> >
> > I was looking again at those _IOW defines for ioctl calls and I have
> > another argument why not specify 'char *' in _IOW:
> >
> > All ioctls in _IOW() specify as a third macro argument type which is
> > passed as pointer to the third argument for ioctl() syscall.
> >
> > So e.g.:
> >
> >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> >
> > is called from userspace as:
> >
> >   int val;
> >   ioctl(fd, EVIOCSCLOCKID, &val);
> >
> > Or
> >
> >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> >
> > is called as:
> >
> >   struct input_mask val;
> >   ioctl(fd, EVIOCSMASK, &val);
> >
> > So basically third argument for _IOW specify size of byte buffer passed
> > as third argument for ioctl(). In _IOW is not specified pointer to
> > struct input_mask, but struct input_mask itself.
> >
> > And in case you define
> >
> >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> >
> > then you by above usage you should pass data as:
> >
> >   char *val =3D "DATA";
> >   ioctl(fd, MY_NEW_IOCTL, &val);
> >
> > Which is not same as just:
> >
> >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> >
> > As in former case you passed pointer to pointer to data and in later
> > case you passed only pointer to data.
> >
> > It just mean that UI_SET_PHYS is already defined inconsistently which i=
s
> > also reason why compat ioctl for it was introduced.
>
> Yes, you are right. UI_SET_PHYS is messed up. I guess the question is
> what to do with all of this...
>
> Maybe we should define
>
> #define UI_SET_PHYS_STR(len)    _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, =
len)
> #define UI_SET_UNIQ_STR(len)    _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, =
len)
>
> and mark UI_SET_PHYS as deprecated/wrong? This will allow us to specify
> exactly how much data kernel is supposed to fetch from userspace instead
> of trying to rely on a null-terminated string.
>
> It would also be very helpful if BlueZ did not accept changes that use
> this brand new ioctl until after we agreed on how it should look like.
> Luiz, can it be reverted for now please?

Sure, it has been reverted, I guess we will have to settle on the
kernel changes first before we do any changes to userspace.

--=20
Luiz Augusto von Dentz
