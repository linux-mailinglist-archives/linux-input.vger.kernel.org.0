Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 843E210EECB
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 18:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLBRyp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 12:54:45 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37562 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfLBRyp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 12:54:45 -0500
Received: by mail-pf1-f195.google.com with SMTP id s18so21381pfm.4;
        Mon, 02 Dec 2019 09:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qiujuAi1riVo8klnEP4qdEE/TOBe0O4bFb1tD08EBXY=;
        b=XfAUie+ABFBr1n4Fr9d871P83rSuILi6F6dhe0peXxcSI74PdIRM1cha4BQjnMJ3cr
         4SRHPHbdHI1gpXeEAdrhd0u4e6z3HLcoBZqS8jFaklkzfe8Lz9STfOL9WOgQ2TkzyD0v
         7ePPlxyZMuhSUKYkCgD5/RjIP7dJG1EQozc73l9MNuvEezyMeMnHhD4GFYlGvTQBJJfW
         bzPmPT8HHMUm4XbG/GCTKqj5noNt/iRkZ0vErSPIy1iwwUaUYIffddKcd0S3fFSYOF3P
         Vc7x15dnEUv2yuaNmcqTmtIrX9YyjDSk7BPxruWNbKhADxuvTUUWCnRbcG5CZ7XBOQqz
         t4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qiujuAi1riVo8klnEP4qdEE/TOBe0O4bFb1tD08EBXY=;
        b=UocJCndIIZ9aL8z2OlQD2PqMDRGWNV9Dz31IidzKp4MQRJHmlEu15EibyhNi05kteC
         4M9wslNAULyrf/0Jbbm8i8Jxww5o0pyZWWVl2SLByBPBS1WRrL4teH6Lm+yun9Burrqk
         InVn2zWOH5OOk0tBd8U+Dj2u+YCO2/1XGbdqcg+UGtNjFp4c9fzYKo/SgoRsh7kl2tgF
         T7nvYVJVrdRWr3IkCegbG/hioqYZRZCsoDub0oRQtMaODBsCotPY+P943Pc+y1bJfd7W
         8LHZZKoBQ4tONiW8K3fbw/P3jpijNy3eSzW/R5apj8LVBQXZoHUNmqllbcbisK1VzA5Y
         SKhA==
X-Gm-Message-State: APjAAAWwzlA6oJeWR9xdcjTTlOYPc4LfUgpfWVhlebn4UxqI/uwZLQ1R
        dRrpgRSLYRo9m4INITuI4O0=
X-Google-Smtp-Source: APXvYqw+gLzaW8HjWseoNCUamJPIy95r6IqJIJaDoP4ERqtPvzN8dBJNAumdCnwFHx3n1LnW+J3vRw==
X-Received: by 2002:a63:f355:: with SMTP id t21mr197357pgj.443.1575309283918;
        Mon, 02 Dec 2019 09:54:43 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q4sm195991pgv.83.2019.12.02.09.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 09:54:42 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:54:40 -0800
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
Message-ID: <20191202175440.GA50317@dtor-ws>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191202084750.k7lafzzrf3yq2tqs@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Rohár wrote:
> On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > Hi Pali,
> > 
> > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> > > Hello!
> > > 
> > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > > Support setting the uniq attribute of the input device. The uniq
> > > > attribute is used as a unique identifier for the connected device.
> > > > 
> > > > For example, uinput devices created by BlueZ will store the address of
> > > > the connected device as the uniq property.
> > > > 
> > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > 
> > > ...
> > > 
> > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > --- a/include/uapi/linux/uinput.h
> > > > +++ b/include/uapi/linux/uinput.h
> > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > 
> > > I think that usage of char* as type in _IOW would cause compatibility
> > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> > > of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > > 
> > > I would suggest to define this ioctl as e.g.:
> > > 
> > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > 
> > > And then in uinput.c code handle it as:
> > > 
> > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > 
> > > as part of section /* Now check variable-length commands */
> > 
> > If we did not have UI_SET_PHYS in its current form, I'd agree with you,
> > but I think there is benefit in having UI_SET_UNIQ be similar to
> > UI_SET_PHYS.
> 
> I thought that ioctl is just number, so we can define it as we want. And
> because uinput.c has already switch for variable-length commands it
> would be easy to use it. Final handling can be in separate function like
> for UI_SET_PHYS which can look like same.

Yes, we can define ioctl number as whatever we want. What I was trying
to say, right now users do this:

	rc = ioctl(fd, UI_SET_PHYS, "whatever");
	...

and with UI_SET_UNIQ they expect the following to work:

	rc = ioctl(fd, UI_SET_UNIQ, "whatever");
	...

They would not expect a variable length IOCTL here, or expect a
fixed-size string, nor do they expect to cast pointer to u64. So keeping
the spirit of UI_SET_PHYS, even if it is not great from 64/32 bit point
of view is beneficial here.

> 
> > But you are absolutely correct that in current form the patch is
> > deficient on 64/32 systems, and the compat handling needs to be added
> > before it can be accepted.
> 
> Is not better to avoid usage of compat ioctl? Or it is OK to use compat
> ioctl also for new features? I do not know if there are some kernel
> rules for it or not... But for me it sounds like "compatibility layer
> for older code".

Yes, if uinput driver did not have any compat code in it, we would not
want to add it. But alas! we already need to handle compat cases for
expsting API, so consistency is more important than purity (in my
opinion) here.

Thanks.

-- 
Dmitry
