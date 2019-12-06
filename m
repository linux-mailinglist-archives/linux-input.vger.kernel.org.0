Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17F9D114E06
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 10:11:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbfLFJLU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Dec 2019 04:11:20 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43662 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfLFJLU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Dec 2019 04:11:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id d16so6869316wre.10;
        Fri, 06 Dec 2019 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ICnCLQJEcZVaNESgjm6cIy6sqQ3eNkpx+iDd/M6Htno=;
        b=FtvwX1Soh2c9BFGQO3+CR96nyxGbj8MJDSH4p0f/bAcaodcSJLYeVihjBsqzDEUSog
         vnsB88eRjK8Gic14sAw8VngTHXSvdpOdlvV2yrozXs/yJZcG+hmI4umza7pLuljWAbyj
         NkfgVtDNMOvfjxWCHndi61CyPoUoI2dw8xgNDrG43nG0mjHtRxDx4Nhvgumhw+1aWAdC
         q0hdnbWoVcgoLCoOyplvODMuPXbqxRUq1zh42jSbjW8aWvkXuohkqraTCUdRKFZyQndJ
         m1z07RvmZuAjqNv/zyRHaGNnOU9EpAOMDN5JaKej+IBB1vJqE4rdS5EE7eV6M2BfwUke
         V7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ICnCLQJEcZVaNESgjm6cIy6sqQ3eNkpx+iDd/M6Htno=;
        b=o5Xv2LxB4cP7c0dQ2pFZzVh63XXBrRTJ3k6wyBhnZcO+0Osxl53b5sjkzOjxxWu3M5
         pCEh+DVIFkWB11kV4sjQzjy3u7UFsdaOJ/cl/PEFAG6nabyqWED8t3TJMQcU2jg5mF7d
         EOZAmOm0FOZboLOFh4IT9632ougK3p6he0Mul2x3ZtuuDNP80y76SszZbQ3+SGPPACAl
         rthstOuRmJVGIakHcYkB64r1/T5SmB0Q7QgIuK+k0OKxvWx/8XPL21pJnrkHg9pLs4Nh
         9r381O/xnoV34pQCYkmz7rCXxNcygCYvZIJVqIQnVV4HWeOxTAeb/1gSrcf24vsdhk2L
         wqMg==
X-Gm-Message-State: APjAAAVKqxWymy/FczQmNs5Pj7JFj7mIB5aOIC+bGqzzt/1jg4S0qA9n
        JFa31VdmeMFaS+GzVlZNpdc=
X-Google-Smtp-Source: APXvYqyqYQWbYi4Wx/WRJv764bGFVZc1LaWoP5u6aGVIPLNCZgK5Oycpq83AoHwG8mESWZG4r9nVaA==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr13910568wrr.309.1575623476456;
        Fri, 06 Dec 2019 01:11:16 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id o15sm16442925wra.83.2019.12.06.01.11.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2019 01:11:15 -0800 (PST)
Date:   Fri, 6 Dec 2019 10:11:14 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
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
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191206091114.kh255jrmerruumnq@pali>
References: <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali>
 <20191203173821.4u6uzxeaqnt3gyz3@pali>
 <20191203191112.GJ50317@dtor-ws>
 <20191205105206.slibwytrcteicx6y@pali>
 <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday 05 December 2019 12:03:05 Abhishek Pandit-Subedi wrote:
> On Thu, Dec 5, 2019 at 2:52 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> >
> > On Tuesday 03 December 2019 11:11:12 Dmitry Torokhov wrote:
> > > On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Rohár wrote:
> > > > On Tuesday 03 December 2019 00:09:47 Pali Rohár wrote:
> > > > > On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> > > > > > On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Rohár wrote:
> > > > > > > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > > > > > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Rohár wrote:
> > > > > > > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > > > > > > Hi Pali,
> > > > > > > > > >
> > > > > > > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> > > > > > > > > > > Hello!
> > > > > > > > > > >
> > > > > > > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > > > > > > > > > > Support setting the uniq attribute of the input device. The uniq
> > > > > > > > > > > > attribute is used as a unique identifier for the connected device.
> > > > > > > > > > > >
> > > > > > > > > > > > For example, uinput devices created by BlueZ will store the address of
> > > > > > > > > > > > the connected device as the uniq property.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > > > > >
> > > > > > > > > > > ...
> > > > > > > > > > >
> > > > > > > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > > > > > > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > > > > > > >  #define UI_SET_PHYS                _IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > > > > > > > > >  #define UI_SET_SWBIT               _IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > > > > > > > > >  #define UI_SET_PROPBIT             _IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > > > > > > > > +#define UI_SET_UNIQ                _IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > > > > > > > > >
> > > > > > > > > > > I think that usage of char* as type in _IOW would cause compatibility
> > > > > > > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> > > > > > > > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> > > > > > > > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > > > > > > > > > >
> > > > > > > > > > > I would suggest to define this ioctl as e.g.:
> > > > > > > > > > >
> > > > > > > > > > >   #define UI_SET_UNIQ         _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > > > > > > > >
> > > > > > > > > > > And then in uinput.c code handle it as:
> > > > > > > > > > >
> > > > > > > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > > > > > > >
> > > > > > > > > > > as part of section /* Now check variable-length commands */
> > > > > > > > > >
> > > > > > > > > > If we did not have UI_SET_PHYS in its current form, I'd agree with you,
> > > > > > > > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > > > > > > > UI_SET_PHYS.
> > > > > > > > >
> > > > > > > > > I thought that ioctl is just number, so we can define it as we want. And
> > > > > > > > > because uinput.c has already switch for variable-length commands it
> > > > > > > > > would be easy to use it. Final handling can be in separate function like
> > > > > > > > > for UI_SET_PHYS which can look like same.
> > > > > > > >
> > > > > > > > Yes, we can define ioctl number as whatever we want. What I was trying
> > > > > > > > to say, right now users do this:
> > > > > > > >
> > > > > > > >     rc = ioctl(fd, UI_SET_PHYS, "whatever");
> > > > > > > >     ...
> > > > > > > >
> > > > > > > > and with UI_SET_UNIQ they expect the following to work:
> > > > > > > >
> > > > > > > >     rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > > > >     ...
> > > > > > >
> > > > > > > And would not following definition
> > > > > > >
> > > > > > >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > > > >
> > > > > > > allow userspace to call
> > > > > > >
> > > > > > >   rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > > >
> > > > > > > as you want?
> > > > > >
> > > > > > OK, so what you are saying is that we can have whatever in the size
> > > > > > portion of ioctl number and simply ignore it in the driver
> > > > >
> > > > > Yes.
> > > > >
> > > > > > (and I do not
> > > > > > think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
> > > > >
> > > > > You are right, we do not need to clear any IOCSIZE_MASK. As ioctl number
> > > > > would be always sam constant number. So it would be really simple. So
> > > > > original patch would work if UI_SET_UNIQ define would be changed to
> > > > > above with _IOW() macro.
> > > > >
> > > > > > While this would work, I am not sure it is the best option as I think
> > > > > > we'd have to comment extensively why we have arbitrary number in place
> > > > > > of the size.
> > > > >
> > > > > Comment can be added. But this is as ioctl is going to accept variable
> > > > > length array (not fixed array), zero value make sense for me (zero as we
> > > > > do not know exact size).
> > > > >
> > > > > > And we still do not really save anything, as we still have to go through
> > > > > > compat ioctl handler (since we have it already) and it is very simple to
> > > > > > add a case for UI_SET_UNIQ there...
> > > > >
> > > > > Yes, compat ioctl is still used. But my proposed solution does not
> > > > > involve to define a new compact ioctl number just for sizeof(char *).
> > > > >
> > > > > I'm looking at this particular problem from side, that there is no
> > > > > reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
> > > > > number and one compat number), when one number is enough. It is one new
> > > > > ioctl call, so one ioctl number should be enough.
> > > > >
> > > > > And also with my proposed solution with ioctl size=0 it simplify
> > > > > implementation of UI_SET_UNIQ as it is not needed to implement also
> > > > > UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
> > > > > original patch (with changed UI_SET_UNIQ macro) is enough.
> > > > >
> > > > > But of of course, this is my view of this problem and I would not be
> > > > > against your decision from maintainer position. Both solutions would
> > > > > work correctly and bring same behavior for userspace applications.
> > > >
> > > >
> > > > Hi Dmitry!
> > > >
> > > > I was looking again at those _IOW defines for ioctl calls and I have
> > > > another argument why not specify 'char *' in _IOW:
> > > >
> > > > All ioctls in _IOW() specify as a third macro argument type which is
> > > > passed as pointer to the third argument for ioctl() syscall.
> > > >
> > > > So e.g.:
> > > >
> > > >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> > > >
> > > > is called from userspace as:
> > > >
> > > >   int val;
> > > >   ioctl(fd, EVIOCSCLOCKID, &val);
> > > >
> > > > Or
> > > >
> > > >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> > > >
> > > > is called as:
> > > >
> > > >   struct input_mask val;
> > > >   ioctl(fd, EVIOCSMASK, &val);
> > > >
> > > > So basically third argument for _IOW specify size of byte buffer passed
> > > > as third argument for ioctl(). In _IOW is not specified pointer to
> > > > struct input_mask, but struct input_mask itself.
> > > >
> > > > And in case you define
> > > >
> > > >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> > > >
> > > > then you by above usage you should pass data as:
> > > >
> > > >   char *val = "DATA";
> > > >   ioctl(fd, MY_NEW_IOCTL, &val);
> > > >
> > > > Which is not same as just:
> > > >
> > > >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> > > >
> > > > As in former case you passed pointer to pointer to data and in later
> > > > case you passed only pointer to data.
> > > >
> > > > It just mean that UI_SET_PHYS is already defined inconsistently which is
> > > > also reason why compat ioctl for it was introduced.
> > >
> > > Yes, you are right. UI_SET_PHYS is messed up. I guess the question is
> > > what to do with all of this...
> > >
> > > Maybe we should define
> > >
> > > #define UI_SET_PHYS_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, len)
> > > #define UI_SET_UNIQ_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, len)
> >
> > I'm not sure if this is ideal. Normally in C strings are nul-termined,
> > so functions/macros do not take buffer length.
> Except strncpy, strndup, snprintf, etc. all expect a buffer length. At

This is something different as for these functions you pass buffer and
length of buffer which is used in write mode -- not for read mode.

> the user to kernel boundary of ioctl, I think we should require size
> of the user buffer regardless of the data type.
> 
> > _STR therefore in names looks inconsistent.
> The _STR suffix is odd (what to name UI_SET_PHYS_STR then??) but
> requiring the length seems to be common across various ioctls.
> * input.h requires a length when requesting the phys and uniq
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/input.h#n138)
> * Same with HIDRAW when setting and getting features:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/hidraw.h#n40,
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/hidraw/hid-example.c#n88

All these ioctls where is passed length are in opposite direction
(_IOC_READ) as our PHYS and UNIQ (_IOC_WRITE).

I fully agree that when you need to read something from kernel
(_IOC_READ) and then writing it to userspace, you need to specify length
of userspace buffer. Exactly same as with userspace functions like
memcpy, snprintf, etc... as you pointed. Otherwise you get buffer
overflow as callee does not know length of buffer.

But here we we have there quite different problem, we need to write
something to kernel from userspace (_IOC_WRITE) and we are passing
nul-term string. So in this case specifying size is not required as it
is implicitly specified as part of passed string.

> >
> > Maybe this is something which should be handled and unified at global
> > scope of linux include files. Or al least make consensus how should be
> > new ioctls for linux written.
> >
> > Otherwise each API would use different ioctl schema and mess would be
> > still there. Which means that defining a new ioctl UI_SET_PHYS_STR for
> > existing one UI_SET_PHYS does not fix anything -- but rather make mess a
> > big larger.
> >
> > Or is there already some discussion on LKML about this ioctl problem?
> I found this fairly old email (couldn't find something more recent):
> http://lkml.iu.edu/hypermail/linux/kernel/9903.3/0325.html
> I think the intent is for userspace to provide the size of the string
> they're passing in (or at least the size of the allocated buffer that
> has the string).

Yes, but this is again opposite direction _IOC_READ. As wrote above I
agree that specifying size of buffer for filling data is required.

> >
> > > and mark UI_SET_PHYS as deprecated/wrong? This will allow us to specify
> > > exactly how much data kernel is supposed to fetch from userspace instead
> > > of trying to rely on a null-terminated string.
> > >
> > > It would also be very helpful if BlueZ did not accept changes that use
> > > this brand new ioctl until after we agreed on how it should look like.
> > > Luiz, can it be reverted for now please?
> > >
> > > Thanks.
> > >
> >
> > --
> > Pali Rohár
> > pali.rohar@gmail.com
> 
> 
> Abhishek

-- 
Pali Rohár
pali.rohar@gmail.com
