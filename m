Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2AAF10E706
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 09:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfLBIrz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Dec 2019 03:47:55 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51657 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfLBIrz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Dec 2019 03:47:55 -0500
Received: by mail-wm1-f68.google.com with SMTP id g206so20807562wme.1;
        Mon, 02 Dec 2019 00:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zyOKweXKHOPtqk+48O/QHHMQCCOb/ibIpSzxHuzne4E=;
        b=pGVkQKfZstToZiwqGP39z4Wy9KIhn5MnEXy6JSxCglui3LGSJZ/unwHs3izmEj0w9u
         LHVsZCJH9ZQ+CIsdzkZ1m38wwkYKx560rta1CAzquV/qW7IdGvyLG6W9jEABLuF+zpqy
         3eQ6+hbSW0uLQVb351xC6/IiXlFMFOQW8sMpToM1i7JiN8wpTxabXrr/cFgtQxjjUaz4
         P0ijV+6XFt3Vy5QFrrXPXLNhO//G1kYDPEP8czX4NmVCBPi61hBeSBQIctjM2TS15fCP
         k3VPMklRw6PnpedXaiNk/WDHFfG8sWzf3BCdE+M3MIEYlcfVPQATaP0yT31WWwDQVdFz
         O6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zyOKweXKHOPtqk+48O/QHHMQCCOb/ibIpSzxHuzne4E=;
        b=kW9dHI+gty4Znzz/HcgYS14ejbStwPal+S8MFbD7NdWB5YzsGYMVCRDzQQGTZMgUks
         5EhaTPXrDbSuCqCcJdbNz/BkjUFi8GLEusVr+z4lMDuXrNljI7jLei3ACY2NAPd3wrjd
         yyBFtPIf56GhDC9eoccC3IrSVPbXgT3a97jFoMSut4dGm62W7yA86227ZD/0a+VforQz
         ZED3JJLyk5faW3yW0j9pBlR/J5kMLKLTgELJHkHarh14aacWdEORXnoxnIVhVn5UGoTD
         /G4hq+6H3gzRKuukzgjbFXY2LDu3lDfJTKS3afqOBS7WZm9xycX+EgFqg6DivN0kTsN6
         U+Og==
X-Gm-Message-State: APjAAAWjB3wISBYomwT+rJfyZsvRrfIRKUgalvF8CpgjgvRFcRkXxpR6
        GjykQzDeLwE2mDVpaYgPC/o=
X-Google-Smtp-Source: APXvYqz5uCyAD5CSXVQpElDuIk/VKSs+/hEVEVHXQgAf1sWm3bXsklsVGYc8ngStuhcDka3q39loqQ==
X-Received: by 2002:a1c:6707:: with SMTP id b7mr23290086wmc.54.1575276473006;
        Mon, 02 Dec 2019 00:47:53 -0800 (PST)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id h124sm23837188wme.30.2019.12.02.00.47.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 00:47:52 -0800 (PST)
Date:   Mon, 2 Dec 2019 09:47:50 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        linux-input@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH] Input: uinput - Add UI_SET_UNIQ ioctl handler
Message-ID: <20191202084750.k7lafzzrf3yq2tqs@pali>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
 <20191202012305.GQ248138@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191202012305.GQ248138@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sunday 01 December 2019 17:23:05 Dmitry Torokhov wrote:
> Hi Pali,
> 
> On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> > Hello!
> > 
> > On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > > Support setting the uniq attribute of the input device. The uniq
> > > attribute is used as a unique identifier for the connected device.
> > > 
> > > For example, uinput devices created by BlueZ will store the address of
> > > the connected device as the uniq property.
> > > 
> > > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> > 
> > ...
> > 
> > > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > > index c9e677e3af1d..d5b7767c1b02 100644
> > > --- a/include/uapi/linux/uinput.h
> > > +++ b/include/uapi/linux/uinput.h
> > > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> > >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> > >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> > >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> > 
> > I think that usage of char* as type in _IOW would cause compatibility
> > problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> > of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> > 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> > 
> > I would suggest to define this ioctl as e.g.:
> > 
> >   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> > 
> > And then in uinput.c code handle it as:
> > 
> >   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> > 
> > as part of section /* Now check variable-length commands */
> 
> If we did not have UI_SET_PHYS in its current form, I'd agree with you,
> but I think there is benefit in having UI_SET_UNIQ be similar to
> UI_SET_PHYS.

I thought that ioctl is just number, so we can define it as we want. And
because uinput.c has already switch for variable-length commands it
would be easy to use it. Final handling can be in separate function like
for UI_SET_PHYS which can look like same.

> But you are absolutely correct that in current form the patch is
> deficient on 64/32 systems, and the compat handling needs to be added
> before it can be accepted.

Is not better to avoid usage of compat ioctl? Or it is OK to use compat
ioctl also for new features? I do not know if there are some kernel
rules for it or not... But for me it sounds like "compatibility layer
for older code".

-- 
Pali Rohár
pali.rohar@gmail.com
