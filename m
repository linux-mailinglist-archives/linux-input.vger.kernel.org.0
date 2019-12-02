Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE9610E430
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2019 02:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfLBBXL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Dec 2019 20:23:11 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33913 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727266AbfLBBXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Dec 2019 20:23:11 -0500
Received: by mail-pg1-f193.google.com with SMTP id r11so528481pgf.1;
        Sun, 01 Dec 2019 17:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dMdDU7QPfqkfhU93NmKAKuY/iBXJ4ghiOz+NSAn8CiY=;
        b=JbwPnDI8OxxpXKPY1ygxBWujZyN2RpsTQ4WphYMfy+RsO5+9/B5KEYI7tvMiPmvRoh
         K8rM/5WWnjy0S9xHOyDt850wsZw4agJ1RSiKyK++A/Fe2X8dazhB32XSD2hZvZNPbsf7
         tmQNwmYpr9cAECsTS0eYRa0I8edk9D8n9Jas3PVNV8OTGGzy25YtMfKcBrLFUyr5wy0X
         5YcgUqAWgcXICJ8hfgDnj9FTYud0UYfbx5LGYAAXUfYbiFtE/CLOxlQgxmzVBDm52whl
         x4auD4RoWMU3c6Bx8QinYLzkP94/kUPuqU7F5hQ23XTOYLPtgbrNSD5qJMXCNPt6es8z
         AVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dMdDU7QPfqkfhU93NmKAKuY/iBXJ4ghiOz+NSAn8CiY=;
        b=IMML6iTX5BmlS6NAbXrSV1QRu8GaviA1Jwo93zMxx3CT308wFz2E/sx640iSMI594s
         HCLe1hJINYh78hSXzlRuEILrrODiQ2mFw9vm4hjXngaWAX7JkNPIOYgQC9fAmDH1tZU7
         Rgb7rLKKLJxeonLH9OthzrQOH7jbWFbzpRIHqKBjeobunm47oSsJr9GNYoCXKzyXujf0
         re8rEZSX/KAm7OkFdm+Rv/K5En2PnEg65vgiVdZ0PPvIc0303Twg+FuXUXcnLIiFH8I3
         MuBvpzOr8y0EMX7XmJ6qenI+gi2rnpfQKsidFoMuscLHo/oe0Xge4wcyn2BO0Qr5rBpr
         5VMA==
X-Gm-Message-State: APjAAAXZUy6NV9OpX7BVPzr/MGSwaTpwWzM/ZJMiqaanlQbxP7iswwxd
        ex0xUOAHWbqFSynBt1+LzMk=
X-Google-Smtp-Source: APXvYqwxTVM2SJdf0fAcJ9eL46EQoaRI/xaWiLcdiJWwmOu/TEFvTCc4nbiWPVWt3IL/a9UwEwuJsQ==
X-Received: by 2002:a63:1b1b:: with SMTP id b27mr26614665pgb.402.1575249788764;
        Sun, 01 Dec 2019 17:23:08 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y3sm10277577pfe.183.2019.12.01.17.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2019 17:23:08 -0800 (PST)
Date:   Sun, 1 Dec 2019 17:23:05 -0800
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
Message-ID: <20191202012305.GQ248138@dtor-ws>
References: <20191127185139.65048-1-abhishekpandit@chromium.org>
 <20191201145357.ybq5gfty4ulnfasq@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191201145357.ybq5gfty4ulnfasq@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pali,

On Sun, Dec 01, 2019 at 03:53:57PM +0100, Pali Rohár wrote:
> Hello!
> 
> On Wednesday 27 November 2019 10:51:39 Abhishek Pandit-Subedi wrote:
> > Support setting the uniq attribute of the input device. The uniq
> > attribute is used as a unique identifier for the connected device.
> > 
> > For example, uinput devices created by BlueZ will store the address of
> > the connected device as the uniq property.
> > 
> > Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> 
> ...
> 
> > diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> > index c9e677e3af1d..d5b7767c1b02 100644
> > --- a/include/uapi/linux/uinput.h
> > +++ b/include/uapi/linux/uinput.h
> > @@ -145,6 +145,7 @@ struct uinput_abs_setup {
> >  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> >  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
> >  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> > +#define UI_SET_UNIQ		_IOW(UINPUT_IOCTL_BASE, 111, char*)
> 
> I think that usage of char* as type in _IOW would cause compatibility
> problems like it is for UI_SET_PHYS (there is UI_SET_PHYS_COMPAT). Size
> of char* pointer depends on userspace (32 vs 64bit), so 32bit process on
> 64bit kernel would not be able to call this new UI_SET_UNIQ ioctl.
> 
> I would suggest to define this ioctl as e.g.:
> 
>   #define UI_SET_UNIQ		_IOW(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, 0)
> 
> And then in uinput.c code handle it as:
> 
>   case UI_SET_UNIQ & ~IOCSIZE_MASK:
> 
> as part of section /* Now check variable-length commands */

If we did not have UI_SET_PHYS in its current form, I'd agree with you,
but I think there is benefit in having UI_SET_UNIQ be similar to
UI_SET_PHYS.

But you are absolutely correct that in current form the patch is
deficient on 64/32 systems, and the compat handling needs to be added
before it can be accepted.

Thanks.

-- 
Dmitry
