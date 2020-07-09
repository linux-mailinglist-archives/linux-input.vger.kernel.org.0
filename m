Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF8C2197AB
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 07:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGIFFm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Jul 2020 01:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgGIFFm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Jul 2020 01:05:42 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED565C061A0B;
        Wed,  8 Jul 2020 22:05:41 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l63so433436pge.12;
        Wed, 08 Jul 2020 22:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RSBiaRWNpmnnYIrnRBkb/QFIFR/vxAHmvDKcfnM0bFI=;
        b=nAlyMyHWRf4tDQC75hrWlWsZnL/Oi0AcfVoKCz0bhz0sQm9swAnupmKor1Qlv55Z8a
         oBOYpMmGgeI8RnziEHCXrQWM+DUEzlBmOzUkFkhtwA3A8SrkWT2d9MNBkgIekINNCZ+k
         dGY0Q6+fF2Darxv9LEJ4hblJ6YoKaVU8JbkveqWEGYPi9TK9w8r94yEt4SNlDw+3FOFy
         qzjj6coj2WffA1oM2fi46+toplNJRK7NnsLvO7hyl17HGh/1UV8dgoW1qblfYjUXWaJ9
         zSPI8zWChjxF+pXRpkauL81J9noQrAfg6B6kAJoXQZJD7eAG+jKhz9UbiORPW7i1AQ4H
         wB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RSBiaRWNpmnnYIrnRBkb/QFIFR/vxAHmvDKcfnM0bFI=;
        b=AYXBVjsE0tm1YOW1wZKaCQWEL7xutRRSry7qm7RmK5K50/RUm3EL2z8aCSIWIqJQWs
         WNro40RQu3se/uj6hn7CpmJ09gWu/d835zRCAFC/yPwL6pXzyNelLBHrHPkrY1/tl4Mr
         7fo3KafLkSWGmKsqqML9PeCcHxkMda5YkRLT8gx1GKYe5OEca4t/ED/SUlWy1d4F9hm0
         CG4BIIJpG2lLC2Z7QcvgJe8ryeHHb4kMLyFi1iPNILxo2j87YYHubGc9nALNmbvMjet1
         pq8a+cQ+NR61aY0LzoJaHj/UholKk5tq4drM708KyIcQOxE0m+eYOj4FuHOaF1TzfB/g
         wj5A==
X-Gm-Message-State: AOAM532COL1S8AELABDNKc3ZW3hBs97Jk9Dk+WgQxbmsHS6fytD7TOJs
        OoDQuDcp6EWIEvJUESv1YEs=
X-Google-Smtp-Source: ABdhPJw+YF+kg37uFFk1C/u6r7a1/mIM/ogrloAYiYtQIsilv32ckIyqTlYzgTqcDPTnSGg9O4lXZg==
X-Received: by 2002:a62:7c97:: with SMTP id x145mr58034570pfc.80.1594271140905;
        Wed, 08 Jul 2020 22:05:40 -0700 (PDT)
Received: from dtor-ws ([100.99.132.186])
        by smtp.gmail.com with ESMTPSA id c71sm1084598pje.32.2020.07.08.22.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:05:40 -0700 (PDT)
Date:   Wed, 8 Jul 2020 22:05:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
Subject: Re: [PATCH] tty/sysrq: Add alternative SysRq key
Message-ID: <20200709050538.GG3273837@dtor-ws>
References: <20200511180145.GU89269@dtor-ws>
 <20200619162819.715-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619162819.715-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrzej,

On Fri, Jun 19, 2020 at 06:28:19PM +0200, Andrzej Pietrasiewicz wrote:
> There exist machines which don't have SysRq key at all, e.g. chromebooks.
> 
> This patch allows configuring an alternative key to act as SysRq. Devices
> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
> but other devices use the alternative SysRq key instead, by default F10.
> Which key is actually used can be modified with sysrq's module parameter.

I guess you will be removing KEY_SYSRQ form all Chrome OS internal AT
keyboards and external USB keyboard with Chrome OS layouts as well? Via
udev keymap? I suppose this could work... Or have a per device setting
as we allocate a separate handle for each input device attached to the
SysRq handler.

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
>  
>  /* Simple translation table for the SysRq keys */
>  static const unsigned char sysrq_xlate[KEY_CNT] =
> @@ -621,6 +622,7 @@ struct sysrq_state {
>  	unsigned long key_down[BITS_TO_LONGS(KEY_CNT)];
>  	unsigned int alt;
>  	unsigned int alt_use;
> +	unsigned short sysrq_key;
>  	bool active;
>  	bool need_reinject;
>  	bool reinjecting;
> @@ -770,10 +772,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
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
> @@ -805,6 +807,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>  		}
>  		break;
>  
> +key_sysrq:
>  	case KEY_SYSRQ:
>  		if (value == 1 && sysrq->alt != KEY_RESERVED) {
>  			sysrq->active = true;
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
> +	}

This is way too noisy IMO.

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
> +	"Example\n"
> +	"Using F9 as SysRq:\n"
> +	"sysrq.alternative_sysrq_key=0x43\n");
> +
>  #else
>  
>  static inline void sysrq_register_handler(void)
> 
> base-commit: 3d77e6a8804abcc0504c904bd6e5cdf3a5cf8162
> -- 
> 2.17.1
> 

-- 
Dmitry
