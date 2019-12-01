Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D976A10E032
	for <lists+linux-input@lfdr.de>; Sun,  1 Dec 2019 04:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbfLADNC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Nov 2019 22:13:02 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40273 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLADNB (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Sat, 30 Nov 2019 22:13:01 -0500
Received: by mail-pf1-f195.google.com with SMTP id q8so768120pfh.7
        for <Linux-input@vger.kernel.org>; Sat, 30 Nov 2019 19:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KzoHHv5O2Do4l09ujEPVKpALRiLvNUHFHBHlLQUKOcw=;
        b=SLp7P4zhyg6Dx+/vI12FJkELTgZj7t+XuLm0plTNp9obnPe0eUR+sJ/kZDN4GYSQhM
         uRz/Iwp0hNPugdTAA7TRmZ+aXOwX+sPi1OEDHBs7a+6jphhevn67qmw0wkZcoTUFqcI3
         0NmfaaL27ZrDutf2QkHudZi4N9sGUFpJjokaFPMqWTPy8YbmHEFhZ2mm0q8NtGAq86AW
         gdGjffgYhpTHT/QvG9lHUSCbbAfApANWe4sfB7VLwXx7xAIU07/eoGWF69qmfchV/5Fk
         zU3WwYnFgTsCZGyYy0sCVgzlLbyu1GZEMII2WSW12JhNQB1BjUj/m5qrqY0BHi+SfVcH
         SJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KzoHHv5O2Do4l09ujEPVKpALRiLvNUHFHBHlLQUKOcw=;
        b=WZ3Ku978l08ASsi58Df6o4Z3kjd2MifVDsEWeO7iLwXDuystuEkha9DpA26YzE1b+D
         jMcBq1IIRKp/EJw4tkW7s1t/L4gsSIfmdbFxBXtK/nFVDDzFU9WREPsotvl/q407c2yu
         rW1IXiBx7RSTtkXH+qEeXjWDLK6v8A9XIdYij6eJRVi/aOXN8+uzmeHGU++MvaS+8VTD
         TsvvhPEa5daQ5l1r/67UswwgwezRS5jUsh7VxnbQppJ8wZef6B138XMZkBGI70Vs1EcX
         XC6CB0dez0sJ6FAnWizvJY7Kk+RrEC2yV/83376+k4Z4iXgFUYFI0PnY0EXBRV2SABfc
         eRjw==
X-Gm-Message-State: APjAAAXHAdZA3icccQmwTyKVejeU0kPffn7dKcL6x6+IyOcK667O/3at
        xVw/qJvQcffSbm48R2pIID9aK5th
X-Google-Smtp-Source: APXvYqyAdWTbl+uHn4ChaYcz5NA+kQ2/led5JURFpSc2NF8X0Aze7SzK1Mnw7p8naBm6JxjwGvKT2g==
X-Received: by 2002:a62:2a14:: with SMTP id q20mr64790514pfq.148.1575169980833;
        Sat, 30 Nov 2019 19:13:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o23sm29583022pgj.90.2019.11.30.19.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2019 19:13:00 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <Dmitry.torokhov@gmail.com>
Date:   Sat, 30 Nov 2019 19:12:57 -0800
To:     admin@kryma.net
Cc:     Linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH] Add an I2C HID quirk for incorrect input length.
Message-ID: <20191201031257.GN248138@dtor-ws>
References: <20191127032329.8406-1-admin@kryma.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191127032329.8406-1-admin@kryma.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 27, 2019 at 03:23:29AM +0000, admin@kryma.net wrote:
> From: Pavel Balan <admin@kryma.net>
> 
> Apply it to the Lenovo Y720 gaming laptop I2C peripheral then.
> 
> This fixes dmesg being flooded with errors visible on un-suspend
> in Linux Mint 19 Cinnamon.
> 
> Example of error log:
> 
> <...>
> [    4.326588] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
> [    4.326845] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
> [    4.327095] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
> [    4.327341] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
> [    4.327609] i2c_hid i2c-ITE33D1:00: i2c_hid_get_input: incomplete report (2/4)
> <...>
> 
> Example of fixed log (debug on)
> 
> <...>
> [ 3731.333183] i2c_hid i2c-ITE33D1:00: input: 02 00
> [ 3731.333581] i2c_hid i2c-ITE33D1:00: input: 02 00
> [ 3731.333842] i2c_hid i2c-ITE33D1:00: input: 02 00
> [ 3731.334107] i2c_hid i2c-ITE33D1:00: input: 02 00
> [ 3731.334367] i2c_hid i2c-ITE33D1:00: input: 02 00
> <...>

This should go to Jiri/Benjamin (CCed).

> 
> Signed-off-by: Pavel Balan <admin@kryma.net>
> ---
>  drivers/hid/hid-ids.h              |  1 +
>  drivers/hid/i2c-hid/i2c-hid-core.c | 15 ++++++++++++---
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 76969a22b0f2..ea518daf7435 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -628,6 +628,7 @@
>  #define USB_VENDOR_ID_ITE               0x048d
>  #define USB_DEVICE_ID_ITE_LENOVO_YOGA   0x8386
>  #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
> +#define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
>  #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
>  #define USB_DEVICE_ID_ITE8595		0x8595
>  
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 2a7c6e33bb1c..14d964700a7c 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -51,6 +51,7 @@
>  #define I2C_HID_QUIRK_NO_RUNTIME_PM		BIT(2)
>  #define I2C_HID_QUIRK_DELAY_AFTER_SLEEP		BIT(3)
>  #define I2C_HID_QUIRK_BOGUS_IRQ			BIT(4)
> +#define I2C_HID_QUIRK_BAD_INPUT_SIZE		BIT(5)
>  
>  /* flags */
>  #define I2C_HID_STARTED		0
> @@ -182,6 +183,8 @@ static const struct i2c_hid_quirks {
>  		I2C_HID_QUIRK_NO_RUNTIME_PM },
>  	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
>  		 I2C_HID_QUIRK_BOGUS_IRQ },
> +	{ USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720,
> +		I2C_HID_QUIRK_BAD_INPUT_SIZE },
>  	{ 0, 0 }
>  };
>  
> @@ -513,9 +516,15 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
>  	}
>  
>  	if ((ret_size > size) || (ret_size < 2)) {
> -		dev_err(&ihid->client->dev, "%s: incomplete report (%d/%d)\n",
> -			__func__, size, ret_size);
> -		return;
> +		if (ihid->quirks & I2C_HID_QUIRK_BAD_INPUT_SIZE) {
> +			ihid->inbuf[0] = size & 0xff;
> +			ihid->inbuf[1] = size >> 8;
> +			ret_size = size;
> +		} else {
> +			dev_err(&ihid->client->dev, "%s: incomplete report (%d/%d)\n",
> +				__func__, size, ret_size);
> +			return;
> +		}
>  	}
>  
>  	i2c_hid_dbg(ihid, "input: %*ph\n", ret_size, ihid->inbuf);
> -- 
> 2.17.1
> 

-- 
Dmitry
