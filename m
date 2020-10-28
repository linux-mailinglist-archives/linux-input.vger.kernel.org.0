Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBB329D2D9
	for <lists+linux-input@lfdr.de>; Wed, 28 Oct 2020 22:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgJ1VhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 17:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24332 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726854AbgJ1VhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 17:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603921021;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3PN8li90MQEODpG7uKAlxNFFjh3wZGx6qB1VA0YAdTY=;
        b=STLAEU3XcaJALN5ShQPxpH6YHzJS44qfrjxl+4nEqf4KfTjKak7XAzSwRYuwM1v3B3PS8W
        C+ULVCK2eJkh1CA1G92v5v1urHJZ0KNs0WmaLHwpEm96JmyNXFGtg/dKfAdgOv4cT45RDR
        XHsDdq76tMtocVM2z9m4SISQZRaYeFA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-T-myF9EPOcy8M6kEjWyyog-1; Wed, 28 Oct 2020 16:35:13 -0400
X-MC-Unique: T-myF9EPOcy8M6kEjWyyog-1
Received: by mail-ed1-f72.google.com with SMTP id m1so281061edr.8
        for <linux-input@vger.kernel.org>; Wed, 28 Oct 2020 13:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3PN8li90MQEODpG7uKAlxNFFjh3wZGx6qB1VA0YAdTY=;
        b=PgTc7LgXkIXXm6VYUEpSEUAWhTKF2Ld0YzivtU9uRxUFCEMzsTa+CPX8X5JoWTzPeo
         hofn+NUC7Inslp+YmGUg4w6ej7juYWkdgFf8NeGTNgZLBUEEfFvDUN/5hvOfXMjDV55z
         CTIpu/m3+eIWs7zQ6CLSw/DyDtbQkaBxG5TMvcfTfXIY4O+k1CbUPNMNffBHDnfh9QjD
         auhTkVxP8iqWeUPHyuD4OCHc50w1A9Cd+zVcvl+/vB69hb/L1K1NVz0WcKuo4eZOtX4R
         tYlPsDB4bKrDorewiNXTXn+Jpx/0E8Ml/CnO5I1tNLRu3jIpAeOoFcCCFnUKmCcHaIaD
         1BYQ==
X-Gm-Message-State: AOAM532fCRtCWxy+1GpR3BmCKTXl2DGLk/385TirDT3XcNXWew1uDMy1
        A7gED8UMKK1B4bWi3Jnlnh0BETzeW1I9Znls1T+Bfcw/1DRUCOyZFzK70IgwJt9ir+Lsmc2C6eL
        fGbsmJFWoBGPr/vwJ3bYfawE=
X-Received: by 2002:a50:fd17:: with SMTP id i23mr727357eds.50.1603917312284;
        Wed, 28 Oct 2020 13:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQpVmMC85/uYP4ywhmAg3+8R38d2cO03kqeV9fRLbZDvJODVlNFcG/q/XwN/ngYqbeqRwSnQ==
X-Received: by 2002:a50:fd17:: with SMTP id i23mr727328eds.50.1603917311967;
        Wed, 28 Oct 2020 13:35:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id a1sm421062edk.52.2020.10.28.13.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2020 13:35:11 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Raul E Rangel <rrangel@chromium.org>, linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, Shirish.S@amd.com,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <00524d2b-b734-ffd4-0d99-e8cbda8510b3@redhat.com>
Date:   Wed, 28 Oct 2020 21:35:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827144112.v2.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Quick self intro: I have take over drivers/platform/x86
maintainership from Andy; and I'm working my way through
the backlog of old patches in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

On 8/27/20 10:41 PM, Raul E Rangel wrote:
> The i8042_mutex must be held by writers of the AUX and KBD ports, as
> well as users of i8042_command. There were a lot of users of
> i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> This resulted in i8042_commands being issues in between PS/2
> transactions.
> 
> This change moves the mutex lock into i8042_command and removes the
> burden of locking the mutex from the callers.
> 
> It is expected that the i8042_mutex is locked before calling
> i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> layer via ps2_begin_command and ps2_end_command. Other modules
> (serio_raw) do not currently lock the mutex, so there is still a
> possibility for intermixed commands.
> 
> Link: https://lore.kernel.org/linux-input/CAHQZ30ANTeM-pgdYZ4AbgxsnevBJnJgKZ1Kg+Uy8oSXZUvz=og@mail.gmail.com
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>

Patch looks good to me, you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

(for both the drivers/platform/x86 bits and in general).

Dmitry, feel free to merge this through the input tree, I don't
expect the touched pdx86 parts to see any changes this cycle.

Regards,

Hans





> ---
> Tested this on a device with only a PS/2 keyboard. I was able to do
> 1200+ suspend/resume cycles.
> 
> Also tested this on a device with a PS/2 keyboard and a PS/2 mouse.
> I was able to do 250+ iterations with out problems.
> 
> Changes in v2:
> - Fixed bad indent
> - Added Link: tag
> - Removed left over rc variable
> 
>  drivers/input/serio/i8042.c         | 29 ++++++++++++++---------------
>  drivers/leds/leds-clevo-mail.c      |  9 ---------
>  drivers/platform/x86/acer-wmi.c     |  2 --
>  drivers/platform/x86/amilo-rfkill.c |  6 +-----
>  include/linux/i8042.h               | 10 ----------
>  5 files changed, 15 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
> index 0dddf273afd94..65ca6b47f41e8 100644
> --- a/drivers/input/serio/i8042.c
> +++ b/drivers/input/serio/i8042.c
> @@ -137,8 +137,7 @@ static DEFINE_SPINLOCK(i8042_lock);
>  
>  /*
>   * Writers to AUX and KBD ports as well as users issuing i8042_command
> - * directly should acquire i8042_mutex (by means of calling
> - * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
> + * directly should acquire i8042_mutex to ensure that
>   * they do not disturb each other (unfortunately in many i8042
>   * implementations write to one of the ports will immediately abort
>   * command that is being processed by another port).
> @@ -173,18 +172,6 @@ static irqreturn_t i8042_interrupt(int irq, void *dev_id);
>  static bool (*i8042_platform_filter)(unsigned char data, unsigned char str,
>  				     struct serio *serio);
>  
> -void i8042_lock_chip(void)
> -{
> -	mutex_lock(&i8042_mutex);
> -}
> -EXPORT_SYMBOL(i8042_lock_chip);
> -
> -void i8042_unlock_chip(void)
> -{
> -	mutex_unlock(&i8042_mutex);
> -}
> -EXPORT_SYMBOL(i8042_unlock_chip);
> -
>  int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char str,
>  					struct serio *serio))
>  {
> @@ -343,10 +330,14 @@ int i8042_command(unsigned char *param, int command)
>  	unsigned long flags;
>  	int retval;
>  
> +	mutex_lock(&i8042_mutex);
> +
>  	spin_lock_irqsave(&i8042_lock, flags);
>  	retval = __i8042_command(param, command);
>  	spin_unlock_irqrestore(&i8042_lock, flags);
>  
> +	mutex_unlock(&i8042_mutex);
> +
>  	return retval;
>  }
>  EXPORT_SYMBOL(i8042_command);
> @@ -379,10 +370,18 @@ static int i8042_kbd_write(struct serio *port, unsigned char c)
>  static int i8042_aux_write(struct serio *serio, unsigned char c)
>  {
>  	struct i8042_port *port = serio->port_data;
> +	unsigned long flags;
> +	int retval = 0;
> +
> +	spin_lock_irqsave(&i8042_lock, flags);
>  
> -	return i8042_command(&c, port->mux == -1 ?
> +	retval = __i8042_command(&c, port->mux == -1 ?
>  					I8042_CMD_AUX_SEND :
>  					I8042_CMD_MUX_SEND + port->mux);
> +
> +	spin_unlock_irqrestore(&i8042_lock, flags);
> +
> +	return retval;
>  }
>  
>  
> diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-mail.c
> index f512e99b976b1..6c3d7e54f95cf 100644
> --- a/drivers/leds/leds-clevo-mail.c
> +++ b/drivers/leds/leds-clevo-mail.c
> @@ -95,17 +95,12 @@ MODULE_DEVICE_TABLE(dmi, clevo_mail_led_dmi_table);
>  static void clevo_mail_led_set(struct led_classdev *led_cdev,
>  				enum led_brightness value)
>  {
> -	i8042_lock_chip();
> -
>  	if (value == LED_OFF)
>  		i8042_command(NULL, CLEVO_MAIL_LED_OFF);
>  	else if (value <= LED_HALF)
>  		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
>  	else
>  		i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> -
> -	i8042_unlock_chip();
> -
>  }
>  
>  static int clevo_mail_led_blink(struct led_classdev *led_cdev,
> @@ -114,8 +109,6 @@ static int clevo_mail_led_blink(struct led_classdev *led_cdev,
>  {
>  	int status = -EINVAL;
>  
> -	i8042_lock_chip();
> -
>  	if (*delay_on == 0 /* ms */ && *delay_off == 0 /* ms */) {
>  		/* Special case: the leds subsystem requested us to
>  		 * chose one user friendly blinking of the LED, and
> @@ -142,8 +135,6 @@ static int clevo_mail_led_blink(struct led_classdev *led_cdev,
>  		       *delay_on, *delay_off);
>  	}
>  
> -	i8042_unlock_chip();
> -
>  	return status;
>  }
>  
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index 60c18f21588dd..6cb6f800503b2 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1044,9 +1044,7 @@ static acpi_status WMID_set_u32(u32 value, u32 cap)
>  			return AE_BAD_PARAMETER;
>  		if (quirks->mailled == 1) {
>  			param = value ? 0x92 : 0x93;
> -			i8042_lock_chip();
>  			i8042_command(&param, 0x1059);
> -			i8042_unlock_chip();
>  			return 0;
>  		}
>  		break;
> diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/amilo-rfkill.c
> index 493e169c8f615..c981c6e07ff94 100644
> --- a/drivers/platform/x86/amilo-rfkill.c
> +++ b/drivers/platform/x86/amilo-rfkill.c
> @@ -28,12 +28,8 @@
>  static int amilo_a1655_rfkill_set_block(void *data, bool blocked)
>  {
>  	u8 param = blocked ? A1655_WIFI_OFF : A1655_WIFI_ON;
> -	int rc;
>  
> -	i8042_lock_chip();
> -	rc = i8042_command(&param, A1655_WIFI_COMMAND);
> -	i8042_unlock_chip();
> -	return rc;
> +	return i8042_command(&param, A1655_WIFI_COMMAND);
>  }
>  
>  static const struct rfkill_ops amilo_a1655_rfkill_ops = {
> diff --git a/include/linux/i8042.h b/include/linux/i8042.h
> index 0261e2fb36364..1c081081c161d 100644
> --- a/include/linux/i8042.h
> +++ b/include/linux/i8042.h
> @@ -55,8 +55,6 @@ struct serio;
>  
>  #if defined(CONFIG_SERIO_I8042) || defined(CONFIG_SERIO_I8042_MODULE)
>  
> -void i8042_lock_chip(void);
> -void i8042_unlock_chip(void);
>  int i8042_command(unsigned char *param, int command);
>  int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char str,
>  					struct serio *serio));
> @@ -65,14 +63,6 @@ int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned char str,
>  
>  #else
>  
> -static inline void i8042_lock_chip(void)
> -{
> -}
> -
> -static inline void i8042_unlock_chip(void)
> -{
> -}
> -
>  static inline int i8042_command(unsigned char *param, int command)
>  {
>  	return -ENODEV;
> 

