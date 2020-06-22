Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F38F4203972
	for <lists+linux-input@lfdr.de>; Mon, 22 Jun 2020 16:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729218AbgFVO2M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jun 2020 10:28:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:45842 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729284AbgFVO0Z (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jun 2020 10:26:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 5F4AEC1AE;
        Mon, 22 Jun 2020 14:26:21 +0000 (UTC)
Subject: Re: [PATCH] tty/sysrq: Add alternative SysRq key
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@collabora.com
References: <20200511180145.GU89269@dtor-ws>
 <20200619162819.715-1-andrzej.p@collabora.com>
From:   Jiri Slaby <jslaby@suse.com>
Autocrypt: addr=jslaby@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7c61ac4d-959f-0069-d1db-7e1ba646ac64@suse.com>
Date:   Mon, 22 Jun 2020 08:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619162819.715-1-andrzej.p@collabora.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19. 06. 20, 18:28, Andrzej Pietrasiewicz wrote:
> There exist machines which don't have SysRq key at all, e.g. chromebooks.
> 
> This patch allows configuring an alternative key to act as SysRq. Devices
> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
> but other devices use the alternative SysRq key instead, by default F10.
> Which key is actually used can be modified with sysrq's module parameter.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/tty/sysrq.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 0dc3878794fd..e1d271c84746 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
>  
>  #ifdef CONFIG_INPUT
>  static int sysrq_reset_downtime_ms;
> +static unsigned short alternative_sysrq_key = KEY_F10;

I would go for sysrq_alternative_key to preserve the namespace naming.

> @@ -825,11 +828,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
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
>  			sysrq->need_reinject = false;
>  			__handle_sysrq(sysrq_xlate[code], true);
> @@ -924,6 +931,14 @@ static int sysrq_connect(struct input_handler *handler,
>  	sysrq->handle.private = sysrq;
>  	timer_setup(&sysrq->keyreset_timer, sysrq_do_reset, 0);
>  
> +	if (test_bit(KEY_SYSRQ, dev->keybit)) {
> +		sysrq->sysrq_key = KEY_SYSRQ;
> +		pr_info("%s: using default sysrq key [%x]\n", dev->name, KEY_SYSRQ);
> +	} else {
> +		sysrq->sysrq_key = alternative_sysrq_key;
> +		pr_info("%s: Using alternative sysrq key: [%x]\n", dev->name, sysrq->sysrq_key);

Capital U, lowercase u above. Do we want to print the info in the
default case, actually?

> +	}
> +
>  	error = input_register_handle(&sysrq->handle);
>  	if (error) {
>  		pr_err("Failed to register input sysrq handler, error %d\n",
> @@ -1032,6 +1047,13 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
>  
>  module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>  
> +module_param(alternative_sysrq_key, ushort, 0644);
> +MODULE_PARM_DESC(alternative_sysrq_key,
> +	"Alternative SysRq key for input devices that don't have SysRq key. F10 by default.\n"

If you line-break here, I suggest adding a \t or two to the beginning of
the following lines:

> +	"Example\n"
> +	"Using F9 as SysRq:\n"
> +	"sysrq.alternative_sysrq_key=0x43\n");

The last \n is superfluous, there would be an empty line.

Looking at emulate_raw in drivers/tty/vt/keyboard.c, you seem you need
to update that one as well. Otherwise raw keyboard mode won't send sysrq
sequence, when you press it, right?

thanks,
-- 
js
suse labs
