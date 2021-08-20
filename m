Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C3E3F2BEF
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 14:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240522AbhHTMVu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 08:21:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240526AbhHTMVq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 08:21:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80C2860FE6;
        Fri, 20 Aug 2021 12:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629462068;
        bh=XokPNaEZzCBVxZsGy8OxFfqbu3eCtU/5yezA3ayFAVE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=fuaiNjmrqEGqEyZ0Td9kJzBEOFdZR1XtiyRqYRBAUQ6cgnwHen8DbRX1WbhDLK4sp
         fg6t0e/X0bIo6ghCAbHQ4q9OnJheCUDkzcUXuEFzkjQbx7hyOFhjM3lw9N6R5DZwwS
         RyuV/ZootL/25yfGBgx2+OonSLAzV6yuay+Z3AVYD4HFCoa52ip+zot/jdv5hL4C7p
         dOGRUroa2bfHf/xlXOQ8bsqpH9YjwyfQh+vNORkDGJKXNiUGtcf6gH/+MOD7xXJ3LJ
         glioz7ThqLAz2ypXdFWdGdlgCir6VygZ51YKIjoDkcFcvv0Hb+X7dpqXcSR+4mkVDj
         TO2qcKyKmczKQ==
Date:   Fri, 20 Aug 2021 14:21:05 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Use 'atomic_inc_return' instead of
 hand-writing it
In-Reply-To: <1091bc38881086be28d561adca042caba234f3f2.1627054657.git.christophe.jaillet@wanadoo.fr>
Message-ID: <nycvar.YFH.7.76.2108201420570.15313@cbobk.fhfr.pm>
References: <1091bc38881086be28d561adca042caba234f3f2.1627054657.git.christophe.jaillet@wanadoo.fr>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 23 Jul 2021, Christophe JAILLET wrote:

> This function logs a warning if the workqueue gets too big.
> In order to save a few cycles, use 'atomic_inc_return()' instead of an
> 'atomic_inc()/atomic_read()' sequence.
> 
> This axes a line of code and saves a 'atomic_read()' call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 61635e629469..a7fa35245c2e 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -2240,11 +2240,10 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
>  	wd->size = size;
>  	memcpy(wd->params, params, size);
>  
> -	atomic_inc(&data->workqueue_size);
> +	s = atomic_inc_return(&data->workqueue_size);
>  	queue_work(data->wq, &wd->work);
>  
>  	/* warn about excessive queue size */
> -	s = atomic_read(&data->workqueue_size);
>  	if (s >= 20 && s % 20 == 0)
>  		hid_warn(data->hidpp->hid_dev, "Force feedback command queue contains %d commands, causing substantial delays!", s);

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

