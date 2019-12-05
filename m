Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C0D113961
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2019 02:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfLEBjJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 20:39:09 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33493 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728098AbfLEBjI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Dec 2019 20:39:08 -0500
Received: by mail-pf1-f196.google.com with SMTP id y206so785334pfb.0;
        Wed, 04 Dec 2019 17:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y5OyeMAaXxgAsXOOHmvpW7WsRUDMj2ghMVP9WbA7dSs=;
        b=j1PtrmYci3d/o0TYIkz5oe2dZc+fncrSlHwG2Cz/22uIuV0HbESTZVKJobQqM7O8yD
         23nbMjdwKw7DZ56b0WhciP4cHHohnyGHiSya9Pgz5nHSeqALQ7Uwret3AbSUICgdzQD2
         bF+0xHH4NKKjThpBQg0xhwS/PkbBbXds6Ittdhj1YACepzB75Smsr+0zXANEJ7nttC+F
         1nf6fyG0F5Jjgtxod5j7EKhYgYETqMntBdAxxjfaLJy17IA4kbTWk81y6Hq5Di++hY4b
         IlLjXk9RcR5Q02NWXwHPSpD7KnwVQcelpcvnMorufOeFqcggXw4HbwCC7ZEGH1OFHdaK
         4lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y5OyeMAaXxgAsXOOHmvpW7WsRUDMj2ghMVP9WbA7dSs=;
        b=e7QtGRjrnuO1K/6hD+otlQqtNwT54tqUwukx5ohdplaBBlCMFevptVclbz8Ep+Q/vl
         2e/H7cqErz+TkmXVN8FAK+XteKkJExhETPKxJC+eeLSvNCSh0GCwkKqMa99/gX0wRUef
         R/Wx/BelocqAAWObisawqaut4OfbzdWW3QWUKBjOpZWdlbXCy0jQx8xo6sqL7IzJNTzH
         VQSlvOctpnbUXqeQxcwdPuVfIWSv6rUnGLxM/AbnsW1BAeZiPoaXC+gZeN/OFIdp01V8
         a3ZIjojfpybxjVfSaEN90X345ULU8lKqDzg4Pt8EnEUCLbmPmP32j5aGHJBxmNy7xofg
         fRrQ==
X-Gm-Message-State: APjAAAXv2wSDzG78BlfobubSo5RmleiEHNoH1OOFi2z0w7/9hMpu3RWO
        T4EYZptCslnz/LRtVPitjO5gh61X
X-Google-Smtp-Source: APXvYqwFqAwj3MS1h2cksEMfVvAy936l/QbzPKm8apLobvEv6uBGeDB7j98JanOCdwvnbayc54gGhg==
X-Received: by 2002:a63:e0c:: with SMTP id d12mr6455249pgl.3.1575509947770;
        Wed, 04 Dec 2019 17:39:07 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j17sm9319208pfr.2.2019.12.04.17.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2019 17:39:07 -0800 (PST)
Date:   Wed, 4 Dec 2019 17:39:04 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-input@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Logan Gunthorpe <logang@deltatee.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Kirill Smelkov <kirr@nexedi.com>
Subject: Re: [PATCH v3] Input: uinput - Add UI_SET_PHYS_STR and
 UI_SET_UNIQ_STR
Message-ID: <20191205013904.GP50317@dtor-ws>
References: <20191204135434.v3.1.Ib53f70556ffe94d9a1903632ee9b0dc929f94557@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191204135434.v3.1.Ib53f70556ffe94d9a1903632ee9b0dc929f94557@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 04, 2019 at 01:55:35PM -0800, Abhishek Pandit-Subedi wrote:
> The ioctl definition for UI_SET_PHYS is ambiguous because it is defined
> with size = sizeof(char*) but is expected to be given a variable length
> string. Add a deprecation notice for UI_SET_PHYS and provide
> UI_SET_PHYS_STR(len) which expects a size from the user.
> 
> Also support setting the uniq attribute of the input device. The uniq
> attribute is used as a unique identifier for the connected device.
> 
> For example, uinput devices created by BlueZ will store the address of
> the connected device as the uniq property.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> Hi input maintainers,
> 
> Here is an updated patch that refactors the ioctl handlers (properly
> allowing the size to be set from userspace). When calling the new
> ioctls, the call signature will look like this:
> 
> ```
> ioctl(fd, UI_SET_PHYS_STR(18), "00:11:22:33:44:55");
> ```
> 
> I've tested this on a Chromebook running kernel v4.19 with a sample
> program compiled for both 32-bit (i.e. gcc -m32 test.c) and 64-bit.
> 
> The final uinput device looks like this:
> 
> ```
> udevadm info -a -p /devices/virtual/input/input18
> 
> Udevadm info starts with the device specified by the devpath and then
> walks up the chain of parent devices. It prints for every device
> found, all possible attributes in the udev rules key format.
> A rule to match, can be composed by the attributes of the device
> and the attributes from one single parent device.
> 
>   looking at device '/devices/virtual/input/input18':
>     KERNEL=="input18"
>     SUBSYSTEM=="input"
>     DRIVER==""
>     ATTR{inhibited}=="0"
>     ATTR{name}=="Test"
>     ATTR{phys}=="00:00:00:33:44:55"
>     ATTR{properties}=="0"
>     ATTR{uniq}=="00:11:22:00:00:00"
> 
> ```
> 
> 
> Changes in v3:
> - Added UI_SET_PHYS_STR(len) and UI_SET_UNIQ_STR(len) and added
>   deprecation notice for UI_SET_PHYS
> 
> Changes in v2:
> - Added compat handling for UI_SET_UNIQ
> 
>  drivers/input/misc/uinput.c | 41 ++++++++++++++++++++++++++++++++++++-
>  include/uapi/linux/uinput.h |  5 +++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
> index 84051f20b18a..27a750896c71 100644
> --- a/drivers/input/misc/uinput.c
> +++ b/drivers/input/misc/uinput.c
> @@ -20,6 +20,7 @@
>   */
>  #include <uapi/linux/uinput.h>
>  #include <linux/poll.h>
> +#include <linux/printk.h>
>  #include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/module.h>
> @@ -280,7 +281,7 @@ static int uinput_dev_flush(struct input_dev *dev, struct file *file)
>  
>  static void uinput_destroy_device(struct uinput_device *udev)
>  {
> -	const char *name, *phys;
> +	const char *name, *phys, *uniq;
>  	struct input_dev *dev = udev->dev;
>  	enum uinput_state old_state = udev->state;
>  
> @@ -289,6 +290,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
>  	if (dev) {
>  		name = dev->name;
>  		phys = dev->phys;
> +		uniq = dev->uniq;
>  		if (old_state == UIST_CREATED) {
>  			uinput_flush_requests(udev);
>  			input_unregister_device(dev);
> @@ -297,6 +299,7 @@ static void uinput_destroy_device(struct uinput_device *udev)
>  		}
>  		kfree(name);
>  		kfree(phys);
> +		kfree(uniq);
>  		udev->dev = NULL;
>  	}
>  }
> @@ -840,6 +843,7 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
>  	struct uinput_ff_erase  ff_erase;
>  	struct uinput_request   *req;
>  	char			*phys;
> +	char			*uniq;
>  	const char		*name;
>  	unsigned int		size;
>  
> @@ -916,6 +920,8 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
>  		goto out;
>  
>  	case UI_SET_PHYS:
> +		pr_warn_once("uinput: UI_SET_PHYS is deprecated. Use UI_SET_PHYS_STR");
> +
>  		if (udev->state == UIST_CREATED) {
>  			retval = -EINVAL;
>  			goto out;
> @@ -1023,6 +1029,39 @@ static long uinput_ioctl_handler(struct file *file, unsigned int cmd,
>  	case UI_ABS_SETUP & ~IOCSIZE_MASK:
>  		retval = uinput_abs_setup(udev, p, size);
>  		goto out;
> +
> +	case UI_SET_PHYS_STR(0):
> +		if (udev->state == UIST_CREATED) {
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +
> +		phys = strndup_user(p, size);
> +		if (IS_ERR(phys)) {
> +			retval = PTR_ERR(phys);
> +			goto out;
> +		}
> +
> +		kfree(udev->dev->phys);
> +		udev->dev->phys = phys;

Could we maybe refactor this into uinput_get_user_str(udev,
&udev->dev->phys, p, size) ?

> +		goto out;
> +
> +	case UI_SET_UNIQ_STR(0):
> +		if (udev->state == UIST_CREATED) {
> +			retval = -EINVAL;
> +			goto out;
> +		}
> +
> +		uniq = strndup_user(p, size);
> +		if (IS_ERR(uniq)) {
> +			retval = PTR_ERR(uniq);
> +			goto out;
> +		}
> +
> +		kfree(udev->dev->uniq);
> +		udev->dev->uniq = uniq;
> +		goto out;
> +
>  	}
>  
>  	retval = -EINVAL;
> diff --git a/include/uapi/linux/uinput.h b/include/uapi/linux/uinput.h
> index c9e677e3af1d..84d4fa142830 100644
> --- a/include/uapi/linux/uinput.h
> +++ b/include/uapi/linux/uinput.h
> @@ -142,9 +142,14 @@ struct uinput_abs_setup {
>  #define UI_SET_LEDBIT		_IOW(UINPUT_IOCTL_BASE, 105, int)
>  #define UI_SET_SNDBIT		_IOW(UINPUT_IOCTL_BASE, 106, int)
>  #define UI_SET_FFBIT		_IOW(UINPUT_IOCTL_BASE, 107, int)
> +
> +/* DEPRECATED: Data size is ambiguous. Use UI_SET_PHYS_STR instead. */
>  #define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
> +
>  #define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
>  #define UI_SET_PROPBIT		_IOW(UINPUT_IOCTL_BASE, 110, int)
> +#define UI_SET_PHYS_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 111, len)
> +#define UI_SET_UNIQ_STR(len)	_IOC(_IOC_WRITE, UINPUT_IOCTL_BASE, 112, len)
>  
>  #define UI_BEGIN_FF_UPLOAD	_IOWR(UINPUT_IOCTL_BASE, 200, struct uinput_ff_upload)
>  #define UI_END_FF_UPLOAD	_IOW(UINPUT_IOCTL_BASE, 201, struct uinput_ff_upload)
> -- 
> 2.24.0.393.g34dc348eaf-goog
> 

-- 
Dmitry
