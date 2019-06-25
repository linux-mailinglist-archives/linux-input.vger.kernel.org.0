Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E445E552FD
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2019 17:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731769AbfFYPNp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jun 2019 11:13:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:50030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730607AbfFYPNo (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jun 2019 11:13:44 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 132B82133F;
        Tue, 25 Jun 2019 15:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561475623;
        bh=IdTMUbzxu92KlqxPNeLITs9qO/4J8cfxiQJ4/KB9dUg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Yc+qjtc+ebt/UHzRAg2e497a7Ma3lYH0KzDxGa1E6D+rGdbtFlSawLMDbfbk003Jl
         Ozx/WF183zxS9XhQ69lcreGa0wcJ66xDb0DbMya1QO/yogkvFKMNTZlO8sHDklJZM8
         X5fttJopAzjtCjbO1B97Q3txSxn/Hfq8JUaH+a1c=
Date:   Tue, 25 Jun 2019 17:13:41 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2] HID: sb0540: add support for Creative SB0540 IR
 receivers
In-Reply-To: <bab94702a142c9f1dff291806b6f5beef99437d0.camel@hadess.net>
Message-ID: <nycvar.YFH.7.76.1906251710290.27227@cbobk.fhfr.pm>
References: <bab94702a142c9f1dff291806b6f5beef99437d0.camel@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 25 Jun 2019, Bastien Nocera wrote:

> With initial reviews from Benjamin Tissoires.

I guess this is not the final version of the patch then, and proper 
changelog will be inserted here :)

> Signed-off-by: Bastien Nocera <hadess@hadess.net>

[ ... snip ... ]

> +config HID_CREATIVE_SB0540
> +	tristate "Creative SB0540 infrared receiver"
> +	depends on (USB_HID)

Could you please remove the superfluous parenthesis?

> +	---help---
> +	Support for Creative infrared SB0540-compatible remote controls, such
> +	as the RM-1500 and RM-1800 remotes.
> +
> +	Say Y here if you want support for Creative SB0540 infrared receiver.
> +
>  config HID_CYPRESS
>  	tristate "Cypress mouse and barcode readers"
>  	depends on HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index cc5d827c9164..1ad662fe37b6 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_HID_ALPS)		+= hid-alps.o
>  obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
>  obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
>  obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
> +obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.c
>  obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
>  obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
>  obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
> diff --git a/drivers/hid/hid-creative-sb0540.c b/drivers/hid/hid-creative-sb0540.c
> new file mode 100644
> index 000000000000..a94542cbdd33
> --- /dev/null
> +++ b/drivers/hid/hid-creative-sb0540.c
> @@ -0,0 +1,254 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * HID driver for the Creative SB0540 receiver
> + *
> + * Copyright (C) 2019 Red Hat Inc. All Rights Reserved

Given the fact you're claiming RH copyright, the patch should better be 
signed off by from a redhat.com address I believe.

Thanks,

-- 
Jiri Kosina
SUSE Labs

