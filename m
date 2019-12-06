Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58D121156A4
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 18:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbfLFRkw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Dec 2019 12:40:52 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34794 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfLFRkw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 Dec 2019 12:40:52 -0500
Received: by mail-pg1-f194.google.com with SMTP id r11so3658080pgf.1;
        Fri, 06 Dec 2019 09:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+2Kd3u9ZCRQmJ0yZxOtbBqHwMpMNJYaBIoDfTDCksnk=;
        b=BRuym3GTFQp0by1/VZOYv+KEav0DIiMIV2I0QdwPyvoZOatuv4y5d+0ruFbOjO6HZy
         rZuCbPKet0lcwuAYsDAOCUsaKmVPd3C9qYSAEivtKBV9nqFJYJ1Pqc7vnXHNO30a8mR4
         o3FZzrGAmTjFyyt4KoSrdEMGre5zvj2lJDCRbF/SJobqQknKJPZYOpMh2/CJySFchjdr
         UZtUne0va+gh76gMWPU0JIiwlNWPPCdRiZsm/ZSGk+8qHm7jgWzwWxa6pvfW4Ubnumnf
         DIZx16YV4oD1Hx+miLdov9tTrq8QFPE0tBuamj2W7hryPP7OtujB/XTj5P1fwBZw1SDS
         eA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+2Kd3u9ZCRQmJ0yZxOtbBqHwMpMNJYaBIoDfTDCksnk=;
        b=XGKHdMeYdRMnARki80ZWExWQ47PaP0BprHIMwdEEga6BIwCgnrg29Zb+1KoQ79pjUp
         jntYpSXkJSil1+hEFn6qDcOEwc9gpOEKDQsI+thQxeELDM9rUnZPrY5tEyPGrGS1U1hy
         TyRKJXHLU0KdNQC8CrQofYHkQ7OcOzTaTFVzGYrBKZM1ru4lllBj3EZNbq8wDGZWgh4O
         61PC3rf+qIvmGzc9Hy7B7q8hJk17Z777Zii07tWVo1+IQuXjOrLjvcSn4KETJsz/QoAw
         EW0mcAEFOb/dkfHz2jFr9snTM+XWTeScvVxB9lRa7uvK4lF6EOeWt4WJLQgjwA1DTDOm
         LGBA==
X-Gm-Message-State: APjAAAXP3+gmNmIG4SHAALgDGmLUB9XSVHA5WqR4cZDNFbD7D/nZBDIW
        e6ZFUxJLmnjqCeVowbEDpgA=
X-Google-Smtp-Source: APXvYqyrYKLK7LPSKFdY3yHQtWj3S+Wag4FnDRIgb1yF9iJodS/9Tfh4MEf7HgympDt8iAnoZfrjLQ==
X-Received: by 2002:a63:d017:: with SMTP id z23mr4805276pgf.110.1575654051252;
        Fri, 06 Dec 2019 09:40:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v16sm16461958pfn.77.2019.12.06.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 09:40:50 -0800 (PST)
Date:   Fri, 6 Dec 2019 09:40:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
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
Message-ID: <20191206174048.GQ50317@dtor-ws>
References: <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
 <20191202193628.GI50317@dtor-ws>
 <20191202230947.ld5ibnczdpkekfcm@pali>
 <20191203173821.4u6uzxeaqnt3gyz3@pali>
 <20191203191112.GJ50317@dtor-ws>
 <20191205105206.slibwytrcteicx6y@pali>
 <CANFp7mXyaqoMDBs4m_Dfm9+4U88g9WoJVcV1g_4KM4xzFhiGXQ@mail.gmail.com>
 <20191206091114.kh255jrmerruumnq@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206091114.kh255jrmerruumnq@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 06, 2019 at 10:11:14AM +0100, Pali Rohár wrote:
> On Thursday 05 December 2019 12:03:05 Abhishek Pandit-Subedi wrote:
> > On Thu, Dec 5, 2019 at 2:52 AM Pali Rohár <pali.rohar@gmail.com> wrote:
> > >
> > > On Tuesday 03 December 2019 11:11:12 Dmitry Torokhov wrote:
> > > > On Tue, Dec 03, 2019 at 06:38:21PM +0100, Pali Rohár wrote:
> > > > > On Tuesday 03 December 2019 00:09:47 Pali Rohár wrote:
> > > > >
> > > > > Hi Dmitry!
> > > > >
> > > > > I was looking again at those _IOW defines for ioctl calls and I have
> > > > > another argument why not specify 'char *' in _IOW:
> > > > >
> > > > > All ioctls in _IOW() specify as a third macro argument type which is
> > > > > passed as pointer to the third argument for ioctl() syscall.
> > > > >
> > > > > So e.g.:
> > > > >
> > > > >   #define EVIOCSCLOCKID _IOW('E', 0xa0, int)
> > > > >
> > > > > is called from userspace as:
> > > > >
> > > > >   int val;
> > > > >   ioctl(fd, EVIOCSCLOCKID, &val);
> > > > >
> > > > > Or
> > > > >
> > > > >   #define EVIOCSMASK _IOW('E', 0x93, struct input_mask)
> > > > >
> > > > > is called as:
> > > > >
> > > > >   struct input_mask val;
> > > > >   ioctl(fd, EVIOCSMASK, &val);
> > > > >
> > > > > So basically third argument for _IOW specify size of byte buffer passed
> > > > > as third argument for ioctl(). In _IOW is not specified pointer to
> > > > > struct input_mask, but struct input_mask itself.
> > > > >
> > > > > And in case you define
> > > > >
> > > > >   #define MY_NEW_IOCTL _IOW(UINPUT_IOCTL_BASE, 200, char*)
> > > > >
> > > > > then you by above usage you should pass data as:
> > > > >
> > > > >   char *val = "DATA";
> > > > >   ioctl(fd, MY_NEW_IOCTL, &val);
> > > > >
> > > > > Which is not same as just:
> > > > >
> > > > >   ioctl(fd, MY_NEW_IOCTL, "DATA");
> > > > >
> > > > > As in former case you passed pointer to pointer to data and in later
> > > > > case you passed only pointer to data.
> > > > >
> > > > > It just mean that UI_SET_PHYS is already defined inconsistently which is
> > > > > also reason why compat ioctl for it was introduced.
> > > >
> > > > Yes, you are right. UI_SET_PHYS is messed up. I guess the question is
> > > > what to do with all of this...
> > > >
> > > > Maybe we should define
> > > >
> > > > #define UI_SET_PHYS_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, len)
> > > > #define UI_SET_UNIQ_STR(len)  _IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, len)
> > >
> > > I'm not sure if this is ideal. Normally in C strings are nul-termined,
> > > so functions/macros do not take buffer length.
> > Except strncpy, strndup, snprintf, etc. all expect a buffer length. At
> 
> This is something different as for these functions you pass buffer and
> length of buffer which is used in write mode -- not for read mode.
> 
> > the user to kernel boundary of ioctl, I think we should require size
> > of the user buffer regardless of the data type.
> > 
> > > _STR therefore in names looks inconsistent.
> > The _STR suffix is odd (what to name UI_SET_PHYS_STR then??) but
> > requiring the length seems to be common across various ioctls.
> > * input.h requires a length when requesting the phys and uniq
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/input.h#n138)
> > * Same with HIDRAW when setting and getting features:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/hidraw.h#n40,
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/hidraw/hid-example.c#n88
> 
> All these ioctls where is passed length are in opposite direction
> (_IOC_READ) as our PHYS and UNIQ (_IOC_WRITE).
> 
> I fully agree that when you need to read something from kernel
> (_IOC_READ) and then writing it to userspace, you need to specify length
> of userspace buffer. Exactly same as with userspace functions like
> memcpy, snprintf, etc... as you pointed. Otherwise you get buffer
> overflow as callee does not know length of buffer.
> 
> But here we we have there quite different problem, we need to write
> something to kernel from userspace (_IOC_WRITE) and we are passing
> nul-term string. So in this case specifying size is not required as it
> is implicitly specified as part of passed string.

With the new IOCTL definitions it does not need to be a NULL-terminated
string. It can be a buffer of characters with given length, and kernel
will NULL-terminate as this it what it wants, not what the caller has to
give.

Thanks.

-- 
Dmitry
