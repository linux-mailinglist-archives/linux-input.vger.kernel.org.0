Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CECFE1104CB
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2019 20:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLCTLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Dec 2019 14:11:18 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:34920 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfLCTLS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Dec 2019 14:11:18 -0500
Received: by mail-pj1-f66.google.com with SMTP id w23so810586pjd.2;
        Tue, 03 Dec 2019 11:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dOlA7Q7cjz+4uWU+vriWQ0l226VuxCYwXNikUFXDWXs=;
        b=Efd0mVPJ0EMI41uhjyDkK5uwqpBcVVJKX10KhlpU8ru0VKWU8jMnCBv123RjpO/P1E
         GMw2/FFTN1ijeTjfgy2BybpgSJr3EgSgipkMrejv6WbGD5+j8Fx5V2QSOlgujpWWlIPf
         zuZaPjoFCIAkoxtT1K/U4rS7Tanh6F9NNsbvHlX+38itDkXk4COdzT3W7jb6mNVczl20
         bwj0+9j7yyDNeO8BZ3AZm7n+Eh+ciFgNnUgFk2M6HrUg3fQAmogByu2NW19XBDphKd+1
         txS9gAXc2NCVgCTjVZsgLiDT07hp5lyAiCDH7WUu7Hlu/LDCuVUBI8JOe9ZDa29GJYq7
         Ni1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dOlA7Q7cjz+4uWU+vriWQ0l226VuxCYwXNikUFXDWXs=;
        b=NyukWdQwDo8wzYK/1PNk43b22hwBE/Z506U6IRleGhf78xy/uBhUoh2AZtCdMm1bLl
         RkSELzHw2qqT8SNY3GX5RWAv0Q5TC/eeXDljaUWKsevuvPTr7MpIt/YFG9w6WDUFWroV
         e00HDZ7Cn3bCu18+28M//qDAeuFTUNhBhI5isC8Qx88V9NaBbUi6YjFRBwPFHOxeVUSj
         uAXSoMs/52EEksjrkBL/5za11QN042Qem/cng5XzudVMM90R//k0Ht0N/6VualG5Ic7X
         xh3N8zxCqkHZtPu1E53bE8narpe9OlnAIUNmT2zUeQBr0Uc0ToiZvQHpwqVqjWh66Egy
         XuDw==
X-Gm-Message-State: APjAAAXygLnRwsI4g4diOekol07UW4sfZXrMbhmWqzg9szVoArX8maIg
        7mHsu2NjpAfhgeylX+y0W0U=
X-Google-Smtp-Source: APXvYqxg5I/232s9M6fuqXj1Nh1yLhqR3/uHaLVIO2qEz4LALh50Ok21BxzpDvrq39A6KABOI5I9kQ==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id iq15mr7281160pjb.86.1575400276535;
        Tue, 03 Dec 2019 11:11:16 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i9sm4793658pfk.24.2019.12.03.11.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2019 11:11:14 -0800 (PST)
Date:   Tue, 3 Dec 2019 11:11:12 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-input@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191203191112.GJ50317@dtor-ws>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali>
 <20191203173821.4u6uzxeaqnt3gyz3@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191203173821.4u6uzxeaqnt3gyz3@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Rohár wrote:
> On Tuesday 03 December 2019 00:09:47 Pali Rohár wrote:
> > On Monday 02 December 2019 11:36:28 Dmitry Torokhov wrote:
> > > On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Rohár wrote:
> > > > On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > > > > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Rohár wrote:
> > > > > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > > > > Hi Pali,
> > > > > > > 
> > > > > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> > > > > > > > Hello!
> > > > > > > > 
> > > > > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > > > > > > > Support setting the uniq attribute of the input device. The uniq
> > > > > > > > > attribute is used as a unique identifier for the connected device.
> > > > > > > > > 
> > > > > > > > > For example, uinput devices created by BlueZ will store the address of
> > > > > > > > > the connected device as the uniq property.
> > > > > > > > > 
> > > > > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > > > > 
> > > > > > > > ...
> > > > > > > > 
> > > > > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > > > > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > > > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > > > > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > > > > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > > > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > > > > > > 
> > > > > > > > I think that usage of char* as type in _IOW would cause compatibility
> > > > > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> > > > > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> > > > > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > > > > > > > 
> > > > > > > > I would suggest to define this ioctl as e.g.:
> > > > > > > > 
> > > > > > > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > > > > > 
> > > > > > > > And then in uinput.c code handle it as:
> > > > > > > > 
> > > > > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > > > > 
> > > > > > > > as part of section /* Now check variable-length commands */
> > > > > > > 
> > > > > > > If we did not have UI_SET_PHYS in its current form, I'd agree with you,
> > > > > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > > > > UI_SET_PHYS.
> > > > > > 
> > > > > > I thought that ioctl is just number, so we can define it as we want. And
> > > > > > because uinput.c has already switch for variable-length commands it
> > > > > > would be easy to use it. Final handling can be in separate function like
> > > > > > for UI_SET_PHYS which can look like same.
> > > > > 
> > > > > Yes, we can define ioctl number as whatever we want. What I was trying
> > > > > to say, right now users do this:
> > > > > 
> > > > > 	rc = ioctl(fd, UI_SET_PHYS, "whatever");
> > > > > 	...
> > > > > 
> > > > > and with UI_SET_UNIQ they expect the following to work:
> > > > > 
> > > > > 	rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > > 	...
> > > > 
> > > > And would not following definition
> > > > 
> > > >   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > 
> > > > allow userspace to call
> > > > 
> > > >   rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> > > > 
> > > > as you want?
> > > 
> > > OK, so what you are saying is that we can have whatever in the size
> > > portion of ioctl number and simply ignore it in the driver
> > 
> > Yes.
> > 
> > > (and I do not
> > > think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
> > 
> > You are right, we do not need to clear any IOCSIZE_MASK. As ioctl number
> > would be always sam constant number. So it would be really simple. So
> > original patch would work if UI_SET_UNIQ define would be changed to
> > above with _IOW() macro.
> > 
> > > While this would work, I am not sure it is the best option as I think
> > > we'd have to comment extensively why we have arbitrary number in place
> > > of the size.
> > 
> > Comment can be added. But this is as ioctl is going to accept variable
> > length array (not fixed array), zero value make sense for me (zero as we
> > do not know exact size).
> > 
> > > And we still do not really save anything, as we still have to go through
> > > compat ioctl handler (since we have it already) and it is very simple to
> > > add a case for UI_SET_UNIQ there...
> > 
> > Yes, compat ioctl is still used. But my proposed solution does not
> > involve to define a new compact ioctl number just for sizeof(char *).
> > 
> > I'm looking at this particular problem from side, that there is no
> > reason to define two new ioctl numbers for UI_SET_UNIQ (one normal
> > number and one compat number), when one number is enough. It is one new
> > ioctl call, so one ioctl number should be enough.
> > 
> > And also with my proposed solution with ioctl size=0 it simplify
> > implementation of UI_SET_UNIQ as it is not needed to implement also
> > UI_SET_UNIQ_COMPAT ioctl nor touch compat ioct code path. Basically
> > original patch (with changed UI_SET_UNIQ macro) is enough.
> > 
> > But of of course, this is my view of this problem and I would not be
> > against your decision from maintainer position. Both solutions would
> > work correctly and bring same behavior for userspace applications.
> 
> 
> Hi Dmitry!
> 
> I was looking again at those _IOW defines for ioctl calls and I have
> another argument why not specify 'char *' in _IOW:
> 
> All ioctls in _IOW() specify as a third macro argument type which is
> passed as pointer to the third argument for ioctl() syscall.
> 
> So e.g.:
> 
>   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> 
> is called from userspace as:
> 
>   int val;
>   ioctl(fd, EVIOCSCLOCKID, &val);
> 
> Or
> 
>   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> 
> is called as:
> 
>   struct input_mask val;
>   ioctl(fd, EVIOCSMASK, &val);
> 
> So basically third argument for _IOW specify size of byte buffer passed
> as third argument for ioctl(). In _IOW is not specified pointer to
> struct input_mask, but struct input_mask itself.
> 
> And in case you define
> 
>   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> 
> then you by above usage you should pass data as:
> 
>   char *val = "DATA";
>   ioctl(fd, MY_NEW_IOCTL, &val);
> 
> Which is not same as just:
> 
>   ioctl(fd, MY_NEW_IOCTL, "DATA");
> 
> As in former case you passed pointer to pointer to data and in later
> case you passed only pointer to data.
> 
> It just mean that UI_SET_PHYS is already defined inconsistently which is
> also reason why compat ioctl for it was introduced.

Yes, you are right. UI_SET_PHYS is messed up. I guess the question is
what to do with all of this...

Maybe we should define

#define UI_SET_PHYS_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, len)
#define UI_SET_UNIQ_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, len)

and mark UI_SET_PHYS as deprecated/wrong? This will allow us to specify
exactly how much data kernel is supposed to fetch from userspace instead
of trying to rely on a null-terminated string.

It would also be very helpful if BlueZ did not accept changes that use
this brand new ioctl until after we agreed on how it should look like.
Luiz, can it be reverted for now please?

Thanks.

-- 
Dmitry
