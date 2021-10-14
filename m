Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3AF642D3C7
	for <lists+linux-input@lfdr.de>; Thu, 14 Oct 2021 09:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhJNHhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 03:37:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:37088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230026AbhJNHhF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 03:37:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76BCA60F93;
        Thu, 14 Oct 2021 07:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634196900;
        bh=oQYRq6otNbl+pOseJlLOW0EoO/tiF5Z5gQ/DMellTek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w56NIqMRM2sMbM3hL4hjoZDN7D4RyASxzzNrrap4wdm8VKs3zGrOF6+qgpKfsWGGa
         JDSpXnbliyPYgCtfuRlGdztqFKUFsqhbjCnlOrjQqT4/MO/MsbKDoKdYxHnmm/LpRB
         wOMDlIm5tj7z2+is/xqlUQzz+cfxxgJyw/gu4HL0=
Date:   Thu, 14 Oct 2021 09:34:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWfdohi8E2bfevPF@kroah.com>
References: <20211014071627.23256-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014071627.23256-1-changlianzhi@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 14, 2021 at 03:16:27PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
>  drivers/input/input.c     |  7 ++++++-
>  drivers/tty/vt/keyboard.c | 30 +++++++++++++++++++++++++++++-
>  include/linux/kbd_kern.h  |  2 ++
>  3 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/input.c b/drivers/input/input.c
> index ccaeb2426385..43c09700bf68 100644
> --- a/drivers/input/input.c
> +++ b/drivers/input/input.c
> @@ -25,6 +25,7 @@
>  #include <linux/rcupdate.h>
>  #include "input-compat.h"
>  #include "input-poller.h"
> +#include <linux/kbd_kern.h>
>  
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
>  MODULE_DESCRIPTION("Input core");
> @@ -472,8 +473,12 @@ void input_inject_event(struct input_handle *handle,
>  
>  		rcu_read_lock();
>  		grab = rcu_dereference(dev->grab);
> -		if (!grab || grab == handle)
> +		if (!grab || grab == handle) {
>  			input_handle_event(dev, type, code, value);
> +
> +			if (type == EV_LED && code < LED_SCROLLL)
> +				update_value_ledstate(code, value);
> +		}
>  		rcu_read_unlock();
>  
>  		spin_unlock_irqrestore(&dev->event_lock, flags);
> diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
> index c7fbbcdcc346..f612ed5c647f 100644
> --- a/drivers/tty/vt/keyboard.c
> +++ b/drivers/tty/vt/keyboard.c
> @@ -1140,6 +1140,31 @@ static unsigned char getledstate(void)
>  	return ledstate & 0xff;
>  }
>  
> +void update_value_ledstate(unsigned int flag, unsigned int value)
> +{
> +	unsigned int bit;
> +
> +	switch (flag) {
> +	case LED_NUML:
> +		bit = VC_NUMLOCK;
> +		break;
> +	case LED_CAPSL:
> +		bit = VC_CAPSLOCK;
> +		break;
> +	case LED_SCROLLL:
> +		bit = VC_SCROLLOCK;
> +		break;
> +	default:
> +		WARN_ON_ONCE(1);
> +		return;
> +	}
> +
> +	if (value)
> +		ledstate |= BIT(bit);
> +	else
> +		ledstate &= ~BIT(BIT);
> +}
> +
>  void setledstate(struct kbd_struct *kb, unsigned int led)
>  {
>          unsigned long flags;
> @@ -1249,6 +1274,10 @@ static void kbd_bh(struct tasklet_struct *unused)
>  {
>  	unsigned int leds;
>  	unsigned long flags;
> +	struct kbd_struct *kb = kbd_table + fg_console;
> +
> +	if (kb->kbdmode == VC_OFF)
> +		return;
>  
>  	spin_lock_irqsave(&led_lock, flags);
>  	leds = getleds();
> @@ -1257,7 +1286,6 @@ static void kbd_bh(struct tasklet_struct *unused)
>  
>  	if (leds != ledstate) {
>  		kbd_propagate_led_state(ledstate, leds);
> -		ledstate = leds;
>  	}
>  }
>  
> diff --git a/include/linux/kbd_kern.h b/include/linux/kbd_kern.h
> index c40811d79769..36a3402658e6 100644
> --- a/include/linux/kbd_kern.h
> +++ b/include/linux/kbd_kern.h
> @@ -62,6 +62,8 @@ extern int kbd_init(void);
>  
>  extern void setledstate(struct kbd_struct *kbd, unsigned int led);
>  
> +extern void update_value_ledstate(int flag, int value);
> +
>  extern int do_poke_blanked_console;
>  
>  extern void (*kbd_ledfunc)(unsigned int led);
> -- 
> 2.20.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
