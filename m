Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6276329EFAD
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 16:25:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgJ2PZr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 11:25:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:44306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728007AbgJ2PZr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 11:25:47 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 595B32076E;
        Thu, 29 Oct 2020 15:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603985146;
        bh=GR36ZrUzjpmFD6uIuhJkcH+5OSGt9TAiu3iuLPy0ltE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=uLI3sLE9qtpnG4cux2EQDbHtu33t/7qrj/IglIjQBQhNyXVnYKXJet+m8u675hTwb
         OQK8rq4BGXF+SpiA7zKbL7Q4k2IGIJJNwKYOCS68vzBkPBwtNJ02yFeYBRmLNmYTYT
         EUy9mn9d5K6L15AMlJBpwvGdJxhX1ZyP6nvOMGLY=
Date:   Thu, 29 Oct 2020 16:25:43 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal Giard <pascal.giard@etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sanjay Govind <sanjay.govind9@gmail.com>
Subject: Re: [PATCH] HID: ghlive: support for ghlive ps3/wii u dongles
In-Reply-To: <20201009022722.123943-1-pascal.giard@etsmtl.ca>
Message-ID: <nycvar.YFH.7.76.2010291622380.18859@cbobk.fhfr.pm>
References: <20201009022722.123943-1-pascal.giard@etsmtl.ca>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 8 Oct 2020, Pascal Giard wrote:

> This commit introduces the Guitar Hero Live driver which adds support
> for the PS3 and Wii U dongles.

Pascal,

thanks for the patch.

[ ... snip ... ]

> ---
>  drivers/hid/Kconfig      |   6 ++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ghlive.c | 220 +++++++++++++++++++++++++++++++++++++++

Would it make more sense (with respect to how we are structuring/naming 
the hid drivers) to incorporate this into hid-sony (irrespective of 
currently ongoing discussions about actually splitting that driver :) )?

> +static void ghl_magic_poke(struct timer_list *t)
> +{
> +	struct ghlive_sc *sc = from_timer(sc, t, poke_timer);
> +
> +	int ret;
> +	unsigned int pipe;
> +	struct urb *urb;
> +	struct usb_ctrlrequest *cr;
> +	const u16 poke_size =
> +		ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> +	u8 *databuf;
> +
> +	pipe = usb_sndctrlpipe(sc->usbdev, 0);
> +
> +	cr = kzalloc(sizeof(*cr), GFP_ATOMIC);
> +	if (!cr)
> +		goto resched;
> +
> +	databuf = kzalloc(poke_size, GFP_ATOMIC);
> +	if (!databuf) {
> +		kfree(cr);
> +		goto resched;
> +	}
> +
> +	urb = usb_alloc_urb(0, GFP_ATOMIC);
> +	if (!urb) {
> +		kfree(databuf);
> +		kfree(cr);
> +		goto resched;


So if one of the allocations above succeeds and a subsequent one fails, 
you're going to try re-allocate all of them next time again, leaking the 
ones that previously succeeded, right?

Thanks,

-- 
Jiri Kosina
SUSE Labs

