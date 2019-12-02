Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDBF10F0A5
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 20:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbfLBTge (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 14:36:34 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33079 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727963AbfLBTgd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 14:36:33 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so382120plb.0;
        Mon, 02 Dec 2019 11:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pdfc+rZduUiwSB+hLUklEXg5tzcpX2agFPZ43Mj83Pw=;
        b=a/iGU497VO3o9GbPQcv1du3WfXjgNF8T/f6C93gPXW+nwOGrUkeHLVnyZGm4MlqgZF
         3M9OvDX/U0ClT+ktjl/cPEqSKD+ZRey7r27rXnji1Oo+Vx/7iaUp/3c1kwVWnlnfq73R
         +WZiz+eWzzVvR0c7RMHrJZbu05DZClLWlb3GKI/Js9YG9I0Uvx6rOO64RYc9/6DbY33v
         +XaqcedJf19w7JE5dfMhbwA+vSf3wHqqT/dJ9LSYBvntG81niygqwvBrO/Ji+Fc8ZU8D
         GiWjrqvXvUmAx7dZHVmjLwIDTVcaKwQ3VI64XbWbebt9O1z6xLB164ET6AjPwqOhymQn
         uBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pdfc+rZduUiwSB+hLUklEXg5tzcpX2agFPZ43Mj83Pw=;
        b=o7m9mODSTfvK7C+usZmc6Q5vgSGwhSUbjKnexyeSCRmHB+MF/uwqNuK9QOtHbtrFeW
         JHG8h2OWug0JxI5A6bnPGiIUCWjDyvq+uLVbDLE4ReyIuHizGVW7ICI68694nZ0a3iim
         O/DLh0TyMshpgDUYPO8sTq3UGndKcRORGnCWZ0FpbVXcqy7wF3FaFsDUlZQWod9RxQ7l
         KduGbTfnvw3RaarycvxQ4YEv5gvJX1JDp21vGUhbdQ3qVHAh1PFjb0sFkRvP+BRvjvYb
         253neVGGHxjJAvlLBLxyllVVNyXTiR8VLCjz1ZYkfGtscPUhF5XXGbCBKbp/5p5SxHeK
         PVUA==
X-Gm-Message-State: APjAAAUqUtB40eu1vGkaiD0iyqxxc/6i9rbvjeXdSVWlTU0IfOKixuWW
        E/9hBWzYeMzr8C3EDW23osko40+R
X-Google-Smtp-Source: APXvYqz/392QaA/ac+vElrjABvPFdGuEYW5KtuHebo3x1Ih5pWRRgVx4968pH4cf+AsT0ilcrB/H5g==
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr776483pjt.125.1575315391887;
        Mon, 02 Dec 2019 11:36:31 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 9sm256525pfx.177.2019.12.02.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 11:36:30 -0800 (PST)
Date:   Mon, 2 Dec 2019 11:36:28 -0800
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
Message-ID: <20191202193628.GI50317@dtor-ws>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
 <20191202084750.k7lafzzrf3yq2tqs@pali>
 <20191202175440.GA50317@dtor-ws>
 <20191202185340.nae4lljten5jqp3y@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191202185340.nae4lljten5jqp3y@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 02, 2019 at 07:53:40PM +0100, Pali Rohár wrote:
> On Monday 02 December 2019 09:54:40 Dmitry Torokhov wrote:
> > On Mon, Dec 02, 2019 at 09:47:50AM +0100, Pali Rohár wrote:
> > > On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> > > > Hi Pali,
> > > > 
> > > > On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> > > > > Hello!
> > > > > 
> > > > > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > > > > Support setting the uniq attribute of the input device. The uniq
> > > > > > attribute is used as a unique identifier for the connected device.
> > > > > > 
> > > > > > For example, uinput devices created by BlueZ will store the address of
> > > > > > the connected device as the uniq property.
> > > > > > 
> > > > > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > > > > 
> > > > > ...
> > > > > 
> > > > > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > > > > > index c9e677e3af1d..d5b7767c1b02 100644
> > > > > > --- a/include/uapi/linux/uinput.h
> > > > > > +++ b/include/uapi/linux/uinput.h
> > > > > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > > > > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > > > > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > > > > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > > > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > > > > 
> > > > > I think that usage of char* as type in _IOW would cause compatibility
> > > > > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> > > > > of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> > > > > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > > > > 
> > > > > I would suggest to define this ioctl as e.g.:
> > > > > 
> > > > >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > > > > 
> > > > > And then in uinput.c code handle it as:
> > > > > 
> > > > >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > > > > 
> > > > > as part of section /* Now check variable-length commands */
> > > > 
> > > > If we did not have UI_SET_PHYS in its current form, I'd agree with you,
> > > > but I think there is benefit in having UI_SET_UNIQ be similar to
> > > > UI_SET_PHYS.
> > > 
> > > I thought that ioctl is just number, so we can define it as we want. And
> > > because uinput.c has already switch for variable-length commands it
> > > would be easy to use it. Final handling can be in separate function like
> > > for UI_SET_PHYS which can look like same.
> > 
> > Yes, we can define ioctl number as whatever we want. What I was trying
> > to say, right now users do this:
> > 
> > 	rc = ioctl(fd, UI_SET_PHYS, "whatever");
> > 	...
> > 
> > and with UI_SET_UNIQ they expect the following to work:
> > 
> > 	rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> > 	...
> 
> And would not following definition
> 
>   #define UI_SET_UNIQ _IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> 
> allow userspace to call
> 
>   rc = ioctl(fd, UI_SET_UNIQ, "whatever");
> 
> as you want?

OK, so what you are saying is that we can have whatever in the size
portion of ioctl number and simply ignore it in the driver (and I do not
think we need to do any of "UI_SET_UNIQ & ~IOCSIZE_MASK" really).
While this would work, I am not sure it is the best option as I think
we'd have to comment extensively why we have arbitrary number in place
of the size.

And we still do not really save anything, as we still have to go through
compat ioctl handler (since we have it already) and it is very simple to
add a case for UI_SET_UNIQ there...

Thanks.

-- 
Dmitry
