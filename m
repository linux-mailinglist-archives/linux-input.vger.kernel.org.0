Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF0F445156
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 10:52:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230123AbhKDJzP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 05:55:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhKDJzO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Nov 2021 05:55:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BA86611C1;
        Thu,  4 Nov 2021 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1636019554;
        bh=AEuR/DUAmVP340z69z3ymX1PeHJqAQhALhGL9ilDHAE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MmSllCko9D1xyA8BHmTm+mT4OpcSoo26rCNbR5/OEFYSs1MdT6ROtpiBamvKHBN8C
         KG7YT9v/Ckrngm/UQgSnrPN4OcarVMHHDhCDokAYMyw925HFRHb+aUkmvYGnz3Vm0e
         u3sjcTpn0VmOGHP+7fFDjtufXLRIiBsqmb4Ibcm0=
Date:   Thu, 4 Nov 2021 10:52:32 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
Message-ID: <YYOtYDMhTLJHfv1V@kroah.com>
References: <b4dfb305-38d9-9a92-df76-90b72b93705a@infradead.org>
 <20211104093429.16096-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211104093429.16096-1-andrzej.p@collabora.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 04, 2021 at 10:34:29AM +0100, Andrzej Pietrasiewicz wrote:
> There exist machines which don't have SysRq key at all, e.g. chromebooks.
> 
> This patch allows configuring an alternative key to act as SysRq. Devices
> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
> but other devices use the alternative SysRq key instead, by default F10.
> Which key is actually used can be modified with sysrq's module parameter.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> 
> 
> A corrected version with completed conflict resolution.
> 
> 
> 
>  drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index c911196ac893..fb59745b23c9 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -634,6 +634,7 @@ EXPORT_SYMBOL(handle_sysrq);
>  
>  #ifdef CONFIG_INPUT
>  static int sysrq_reset_downtime_ms;
> +static unsigned short alternative_sysrq_key = KEY_F10;
>  
>  /* Simple translation table for the SysRq keys */
>  static const unsigned char sysrq_xlate[KEY_CNT] =
> @@ -653,6 +654,7 @@ struct sysrq_state {
>  	unsigned int alt_use;
>  	unsigned int shift;
>  	unsigned int shift_use;
> +	unsigned short sysrq_key;
>  	bool active;
>  	bool need_reinject;
>  	bool reinjecting;
> @@ -802,10 +804,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>  
>  		/* Simulate press and release of Alt + SysRq */
>  		input_inject_event(handle, EV_KEY, alt_code, 1);
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
> +		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 1);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>  
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
> +		input_inject_event(handle, EV_KEY, sysrq->sysrq_key, 0);
>  		input_inject_event(handle, EV_KEY, alt_code, 0);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>  
> @@ -845,6 +847,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>  			sysrq->shift = code;
>  		break;
>  
> +key_sysrq:
>  	case KEY_SYSRQ:
>  		if (value == 1 && sysrq->alt != KEY_RESERVED) {
>  			sysrq->active = true;
> @@ -867,11 +870,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>  		 * triggering print screen function.
>  		 */
>  		if (sysrq->active)
> -			clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
> +			clear_bit(sysrq->sysrq_key, sysrq->handle.dev->key);
>  
>  		break;
>  
>  	default:
> +		/* handle non-default sysrq key */
> +		if (code == sysrq->sysrq_key)
> +			goto key_sysrq;
> +
>  		if (sysrq->active && value && value != 2) {
>  			unsigned char c = sysrq_xlate[code];
>  
> @@ -970,6 +977,14 @@ static int sysrq_connect(struct input_handler *handler,
>  	sysrq->handle.private = sysrq;
>  	timer_setup(&sysrq->keyreset_timer, sysrq_do_reset, 0);
>  
> +	if (test_bit(KEY_SYSRQ, dev->keybit)) {
> +		sysrq->sysrq_key = KEY_SYSRQ;
> +		pr_info("%s: using default sysrq key [%x]\n", dev->name, KEY_SYSRQ);
> +	} else {
> +		sysrq->sysrq_key = alternative_sysrq_key;
> +		pr_info("%s: Using alternative sysrq key: [%x]\n", dev->name, sysrq->sysrq_key);
> +	}
> +
>  	error = input_register_handle(&sysrq->handle);
>  	if (error) {
>  		pr_err("Failed to register input sysrq handler, error %d\n",
> @@ -1078,6 +1093,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
>  
>  module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>  
> +module_param(alternative_sysrq_key, ushort, 0644);
> +MODULE_PARM_DESC(alternative_sysrq_key,
> +	"Alternative SysRq key for input devices that don't have SysRq key. F10 by default.\n"
> +	"Example\n"
> +	"Using F9 as SysRq:\n"
> +	"sysrq.alternative_sysrq_key=0x43\n");
> +
>  #else
>  
>  static inline void sysrq_register_handler(void)
> -- 
> 2.17.1
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
