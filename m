Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0121CE071
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 18:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730712AbgEKQ3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 12:29:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:39608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730711AbgEKQ3k (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 12:29:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 089D920714;
        Mon, 11 May 2020 16:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589214579;
        bh=8csVDA0D9z9jtZUTy5qoiG/d2QehN3l9NvwT7lCR40Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zm47HiMNNv65glLD4nueb3/VG5CUosakOhKxvFx4sUg6tyM/atlR/0wnYx7gGPcZj
         r6bH9W4hFmNIH0BPj7lu/TrQ825Uy8OAryo4G2R1go8xNiS1LfESbdlGPxEX3ZGZOL
         AdJUG886ti5hwpI2mUYQOxJTpaKzdVaKGsCtQ0sI=
Date:   Mon, 11 May 2020 18:18:01 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        kernel@collabora.com
Subject: Re: [PATCH 3/6] tty/sysrq: Allow configurable SysRq key
Message-ID: <20200511161801.GA2221063@kroah.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-4-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511135918.8203-4-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 11, 2020 at 03:59:15PM +0200, Andrzej Pietrasiewicz wrote:
> There are existing machines which don't have SysRq key, e.g. chromebooks.
> This patch allows configuring which key acts as SysRq. The value is passed
> with sysrq's module parameter.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/tty/sysrq.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
> index 93202fc24308..ebad9799fdc0 100644
> --- a/drivers/tty/sysrq.c
> +++ b/drivers/tty/sysrq.c
> @@ -604,6 +604,7 @@ EXPORT_SYMBOL(handle_sysrq);
>  
>  #ifdef CONFIG_INPUT
>  static int sysrq_reset_downtime_ms;
> +static unsigned short sysrq_key = KEY_SYSRQ;
>  
>  /* Simple translation table for the SysRq keys */
>  static const unsigned char sysrq_xlate[KEY_CNT] =
> @@ -735,10 +736,10 @@ static void sysrq_reinject_alt_sysrq(struct work_struct *work)
>  
>  		/* Simulate press and release of Alt + SysRq */
>  		input_inject_event(handle, EV_KEY, alt_code, 1);
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 1);
> +		input_inject_event(handle, EV_KEY, sysrq_key, 1);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>  
> -		input_inject_event(handle, EV_KEY, KEY_SYSRQ, 0);
> +		input_inject_event(handle, EV_KEY, sysrq_key, 0);
>  		input_inject_event(handle, EV_KEY, alt_code, 0);
>  		input_inject_event(handle, EV_SYN, SYN_REPORT, 1);
>  
> @@ -770,6 +771,7 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>  		}
>  		break;
>  
> +key_sysrq:
>  	case KEY_SYSRQ:
>  		if (value == 1 && sysrq->alt != KEY_RESERVED) {
>  			sysrq->active = true;
> @@ -790,11 +792,15 @@ static bool sysrq_handle_keypress(struct sysrq_state *sysrq,
>  		 * triggering print screen function.
>  		 */
>  		if (sysrq->active)
> -			clear_bit(KEY_SYSRQ, sysrq->handle.dev->key);
> +			clear_bit(sysrq_key, sysrq->handle.dev->key);
>  
>  		break;
>  
>  	default:
> +		/* handle non-default sysrq key */
> +		if (code == sysrq_key)
> +			goto key_sysrq;
> +
>  		if (sysrq->active && value && value != 2) {
>  			sysrq->need_reinject = false;
>  			__handle_sysrq(sysrq_xlate[code], true);
> @@ -995,6 +1001,8 @@ module_param_array_named(reset_seq, sysrq_reset_seq, sysrq_reset_seq,
>  
>  module_param_named(sysrq_downtime_ms, sysrq_reset_downtime_ms, int, 0644);
>  
> +module_param(sysrq_key, ushort, 0644);

No documentation of this new module parameter?

:(

