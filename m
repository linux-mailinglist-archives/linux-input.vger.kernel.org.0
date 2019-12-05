Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD231147E9
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 21:03:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfLEUDS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 15:03:18 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38525 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbfLEUDR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Dec 2019 15:03:17 -0500
Received: by mail-qk1-f194.google.com with SMTP id k6so4463590qki.5
        for <linux-input@vger.kernel.org>; Thu, 05 Dec 2019 12:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TBiv4nPbrGmaDqcfwGsd80bH2zK3bD+1nOLL62W2Qyw=;
        b=MBYsKYOKB4r9tdW+VvB/DjrVB26qTzDFihxkTUQNX+skyZK0UfrIXarweDJbmioxpJ
         GCvXtap50GEX+KmryrGSrPZsZz8jpJXKpsL7llFnJqyoEg/7HjJ7RNcULlEiTv3hlU9A
         iG6FpCYvfn+pDQLmzLauli32SDyORKNlKMnX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TBiv4nPbrGmaDqcfwGsd80bH2zK3bD+1nOLL62W2Qyw=;
        b=KKO/KHIPbOR14WdjxNvwGGSa3ZxBCMNp6D7FcSkRXkNwH409+qXztaaYe3DmK218lc
         uy60y8b/UfzMUIJDr1xZxip3OfcYnT41DybsuI58oxBv1s6UoppdU4W+BYn3WfCfraP6
         YykJ7a5q88w2zTqM8wc2fNGvQvqZYI2Lo0ddN0iBG5Oyp6pmyMrpLWbplvMOJoHbhlHO
         LQTmu627nAmfyfugvs+MkxUBtLoxN5nisFMBVTEaDu4H6raio7TKxPcGhcWK736mKNsu
         meb4lvyeo8hs0dUC7Wi9gGYLFHn0NmHprNS/rGauUK6VPPXR4sj8liG8LL/vGuxGbw6z
         WVJA==
X-Gm-Message-State: APjAAAWs0PeDwhtSzD5f/mYUU/6VwJ1wsg4uwxjrx/NTU3DBV5U4sxyF
        s6A8iLoQ2FJPFQLGyWAkFSRdjPCu3IUvLrhiVLRDQw==
X-Google-Smtp-Source: APXvYqzBkiKi2lRXSJjyQxFRLev60N/jqicAagry3bcezBfQgp4hV4mJaGk4NfEgl57q0bVocZvcqAoMvD94RE8q9VM=
X-Received: by 2002:a05:620a:796:: with SMTP id 22mr3676166qka.419.1575576196444;
 Thu, 05 Dec 2019 12:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali> <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali> <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali> <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali> <20191203173821.4u6uzxeaqnt3gyz3@pali>
 <20191203191112.GJ50317@dtor-ws> <20191205105206.slibwytrcteicx6y@pali>
In-Reply-To: <20191205105206.slibwytrcteicx6y@pali>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 5 Dec 2019 12:03:05 -0800
Message-ID: <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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

On Thu, Dec 5, 2019 at 2:52 AM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrote=
:
>
> On Tuesday 03 December 2019 11:11:12 Dmitry Torokhov wrote:
> > On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Roh=C3=A1r wrote:
> > > On Tuesday 03 December 2019 00:09:47 Pali Roh=C3=A1r wrote:
> > > > On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> > > > > On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Roh=C3=A1r wrote:
> > > > > > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > > > > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Roh=C3=A1r wro=
te:
> > > > > > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > > > > > Hi Pali,
> > > > > > > > >
> > > > > > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Roh=C3=A1r=
 wrote:
> > > > > > > > > > Hello!
> > > > > > > > > >
> > > > > > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-=
Subedi wrote:
> > > > > > > > > > > Support setting the uniq attribute of the input devic=
e. The uniq
> > > > > > > > > > > attribute is used as a unique identifier for the conn=
ected device.
> > > > > > > > > > >
> > > > > > > > > > > For example, uinput devices created by BlueZ will sto=
re the address of
> > > > > > > > > > > the connected device as the uniq property.
> > > > > > > > > > >
> > > > > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit=
@chromium.org>
> > > > > > > > > >
> > > > > > > > > > ...
> > > > > > > > > >
> > > > > > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/ua=
pi/linux/uinput.h
> > > > > > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > > > > > >  #define UI_SET_PHYS                _IOW(UINPUT_IOCTL=
_BASE, 108, char*)
> > > > > > > > > > >  #define UI_SET_SWBIT               _IOW(UINPUT_IOCTL=
_BASE, 109, int)
> > > > > > > > > > >  #define UI_SET_PROPBIT             _IOW(UINPUT_IOCTL=
_BASE, 110, int)
> > > > > > > > > > > +#define UI_SET_UNIQ                _IOW(UINPUT_IOCTL=
_BASE, 111, char*)
> > > > > > > > > >
> > > > > > > > > > I think that usage of char* as type in _IOW would cause=
 compatibility
> > > > > > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PH=
YS_COMPAT). Size
> > > > > > > > > > of char* pointer depends on userspace (32 vs 64bit), so=
 32bit process on
> > > > > > > > > > 64bit kernel would not be able to call this new UI_SET_=
UNIQ ioctl.
> > > > > > > > > >
> > > > > > > > > > I would suggest to define this ioctl as e.g.:
> > > > > > > > > >
> > > > > > > > > >   #define UI_SET_UNIQ         _IOW(_IOC_WRITE, UINPUT_I=
OCTL_BASE, 111, 0)
> > > > > > > > > >
> > > > > > > > > > And then in uinput.c code handle it as:
> > > > > > > > > >
> > > > > > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > > > > > >
> > > > > > > > > > as part of section /* Now check variable-length command=
s */
> > > > > > > > >
> > > > > > > > > If we did not have UI_SET_PHYS in its current form, I'd a=
gree with you,
> > > > > > > > > but I think there is benefit in having UI_SET_UNIQ be sim=
ilar to
> > > > > > > > > UI_SET_PHYS.
> > > > > > > >
> > > > > > > > I thought that ioctl is just number, so we can define it as=
 we want. And
> > > > > > > > because uinput.c has already switch for variable-length com=
mands it
> > > > > > > > would be easy to use it. Final handling can be in separate =
function like
> > > > > > > > for UI_SET_PHYS which can look like same.
> > > > > > >
> > > > > > > Yes, we can define ioctl number as whatever we want. What I w=
as trying
> > > > > > > to say, right now users do this:
> > > > > > >
> > > > > > >     rc =3D ioctl(fd, UI_SET_PHYS, "whatever");
> > > > > > >     ...
> > > > > > >
> > > > > > > and with UI_SET_UNIQ they expect the following to work:
> > > > > > >
> > > > > > >     rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > > >     ...
> > > > > >
> > > > > > And would not following definition
> > > > > >
> > > > > >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, =
0)
> > > > > >
> > > > > > allow userspace to call
> > > > > >
> > > > > >   rc =3D ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > >
> > > > > > as you want?
> > > > >
> > > > > OK, so what you are saying is that we can have whatever in the si=
ze
> > > > > portion of ioctl number and simply ignore it in the driver
> > > >
> > > > Yes.
> > > >
> > > > > (and I do not
> > > > > think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
> > > >
> > > > You are right, we do not need to clear any IOCSIZE_MASK. As ioctl n=
umber
> > > > would be always sam constant number. So it would be really simple. =
So
> > > > original patch would work if UI_SET_UNIQ define would be changed to
> > > > above with _IOW() macro.
> > > >
> > > > > While this would work, I am not sure it is the best option as I t=
hink
> > > > > we'd have to comment extensively why we have arbitrary number in =
place
> > > > > of the size.
> > > >
> > > > Comment can be added. But this is as ioctl is going to accept varia=
ble
> > > > length array (not fixed array), zero value make sense for me (zero =
as we
> > > > do not know exact size).
> > > >
> > > > > And we still do not really save anything, as we still have to go =
through
> > > > > compat ioctl handler (since we have it already) and it is very si=
mple to
> > > > > add a case for UI_SET_UNIQ there...
> > > >
> > > > Yes, compat ioctl is still used. But my proposed solution does not
> > > > involve to define a new compact ioctl number just for sizeof(char *=
).
> > > >
> > > > I'm looking at this particular problem from side, that there is no
> > > > reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
> > > > number and one compat number), when one number is enough. It is one=
 new
> > > > ioctl call, so one ioctl number should be enough.
> > > >
> > > > And also with my proposed solution with ioctl size=3D0 it simplify
> > > > implementation of UI_SET_UNIQ as it is not needed to implement also
> > > > UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
> > > > original patch (with changed UI_SET_UNIQ macro) is enough.
> > > >
> > > > But of of course, this is my view of this problem and I would not b=
e
> > > > against your decision from maintainer position. Both solutions woul=
d
> > > > work correctly and bring same behavior for userspace applications.
> > >
> > >
> > > Hi Dmitry!
> > >
> > > I was looking again at those _IOW defines for ioctl calls and I have
> > > another argument why not specify 'char *' in _IOW:
> > >
> > > All ioctls in _IOW() specify as a third macro argument type which is
> > > passed as pointer to the third argument for ioctl() syscall.
> > >
> > > So e.g.:
> > >
> > >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> > >
> > > is called from userspace as:
> > >
> > >   int val;
> > >   ioctl(fd, EVIOCSCLOCKID, &val);
> > >
> > > Or
> > >
> > >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> > >
> > > is called as:
> > >
> > >   struct input_mask val;
> > >   ioctl(fd, EVIOCSMASK, &val);
> > >
> > > So basically third argument for _IOW specify size of byte buffer pass=
ed
> > > as third argument for ioctl(). In _IOW is not specified pointer to
> > > struct input_mask, but struct input_mask itself.
> > >
> > > And in case you define
> > >
> > >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> > >
> > > then you by above usage you should pass data as:
> > >
> > >   char *val =3D "DATA";
> > >   ioctl(fd, MY_NEW_IOCTL, &val);
> > >
> > > Which is not same as just:
> > >
> > >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> > >
> > > As in former case you passed pointer to pointer to data and in later
> > > case you passed only pointer to data.
> > >
> > > It just mean that UI_SET_PHYS is already defined inconsistently which=
 is
> > > also reason why compat ioctl for it was introduced.
> >
> > Yes, you are right. UI_SET_PHYS is messed up. I guess the question is
> > what to do with all of this...
> >
> > Maybe we should define
> >
> > #define UI_SET_PHYS_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, =
len)
> > #define UI_SET_UNIQ_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, =
len)
>
> I'm not sure if this is ideal. Normally in C strings are nul-termined,
> so functions/macros do not take buffer length.
Except strncpy, strndup, snprintf, etc. all expect a buffer length. At
the user to kernel boundary of ioctl, I think we should require size
of the user buffer regardless of the data type.

> _STR therefore in names looks inconsistent.
The _STR suffix is odd (what to name UI_SET_PHYS_STR then??) but
requiring the length seems to be common across various ioctls.
* input.h requires a length when requesting the phys and uniq
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/in=
clude/uapi/linux/input.h#n138)
* Same with HIDRAW when setting and getting features:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/inc=
lude/uapi/linux/hidraw.h#n40,
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sam=
ples/hidraw/hid-example.c#n88

>
> Maybe this is something which should be handled and unified at global
> scope of linux include files. Or al least make consensus how should be
> new ioctls for linux written.
>
> Otherwise each API would use different ioctl schema and mess would be
> still there. Which means that defining a new ioctl UI_SET_PHYS_STR for
> existing one UI_SET_PHYS does not fix anything -- but rather make mess a
> big larger.
>
> Or is there already some discussion on LKML about this ioctl problem?
I found this fairly old email (couldn't find something more recent):
http://lkml.iu.edu/hypermail/linux/kernel/9903.3/0325.html
I think the intent is for userspace to provide the size of the string
they're passing in (or at least the size of the allocated buffer that
has the string).

>
> > and mark UI_SET_PHYS as deprecated/wrong? This will allow us to specify
> > exactly how much data kernel is supposed to fetch from userspace instea=
d
> > of trying to rely on a null-terminated string.
> >
> > It would also be very helpful if BlueZ did not accept changes that use
> > this brand new ioctl until after we agreed on how it should look like.
> > Luiz, can it be reverted for now please?
> >
> > Thanks.
> >
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com


Abhishek
