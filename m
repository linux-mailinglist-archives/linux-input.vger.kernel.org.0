Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC897262E3
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 13:19:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729269AbfEVLTe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 07:19:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34948 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728690AbfEVLTd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 07:19:33 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 11D43217F9;
        Wed, 22 May 2019 11:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558523973;
        bh=qwtW/C0ND279cga+/JzpAwdoziP7mcxRZFf1CtvPlWc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=p/3qZGEJQm3OLjdeNppLFjp73LTflIQtPcEpbT174J/9IPQB/U2d8Xn+K1Vzt1DK9
         5YuZYVBgoiH59Sm+8D/BC0GQJAAKJoSjA5xNeWcbw7gBWTjwq942vzfTCI3LXDJtLl
         D/lT8EyOCIKOj7jSfRssYrbHhKLdagwp/bhkAxLI=
Date:   Wed, 22 May 2019 13:19:30 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Colin King <colin.king@canonical.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: HID: make const array consumer_rdesc_start
 static
In-Reply-To: <20190510131722.5023-1-colin.king@canonical.com>
Message-ID: <nycvar.YFH.7.76.1905221319220.1962@cbobk.fhfr.pm>
References: <20190510131722.5023-1-colin.king@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 May 2019, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array consumer_rdesc_start on the stack but instead
> make it static. Makes the object code smaller by 88 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   59155	   9840	    448	  69443	  10f43	drivers/hid/hid-logitech-hidpp.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   59003	   9904	    448	  69355	  10eeb	drivers/hid/hid-logitech-hidpp.o
> 
> (gcc version 8.3.0, amd64)
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 72fc9c0566db..df960491e473 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -2862,7 +2862,7 @@ static u8 *hidpp10_consumer_keys_report_fixup(struct hidpp_device *hidpp,
>  					      u8 *_rdesc, unsigned int *rsize)
>  {
>  	/* Note 0 terminated so we can use strnstr to search for this. */
> -	const char consumer_rdesc_start[] = {
> +	static const char consumer_rdesc_start[] = {
>  		0x05, 0x0C,	/* USAGE_PAGE (Consumer Devices)       */
>  		0x09, 0x01,	/* USAGE (Consumer Control)            */
>  		0xA1, 0x01,	/* COLLECTION (Application)            */

Applied, thanks Colin.

-- 
Jiri Kosina
SUSE Labs

