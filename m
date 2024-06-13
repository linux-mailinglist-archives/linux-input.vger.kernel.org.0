Return-Path: <linux-input+bounces-4338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BF5906A8A
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 12:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 742DB1F24CE5
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2024 10:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350B11428EC;
	Thu, 13 Jun 2024 10:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="kNWiB2Mg"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3923DDB1;
	Thu, 13 Jun 2024 10:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718276225; cv=none; b=WQ6ReaxENkJ2zzp3cz9IBhFI4tmCMKdnHVpaX4BguL63j02Sim6edxdOAmx1fT5z1Xb+WVNovyeze90bAWnTmj7pJ6gyFr3bv3s6O85a5492KJQr88Kb6MqVnrNaLdY7bg7lO6sRbOtdbqVxbv1Qpm03r0YrJagfCUkuhRr5Y3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718276225; c=relaxed/simple;
	bh=k2Ywj6S/aj3jQl2/FwtOonbWt/mPoRiF349h2px3ZHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTPymj0I5s38VWP8lUZsPU7lJS0iZKPF+Qx3hupUoP9e7m3l9ZTUNPuJfA3D+q54E6zp8fc3N7EbuXOFUyMTONtaigNMqhzEspTOthDQ0vVhiV2pzFAbyC7yKzmr47b/6PDSDV3NP9od3pFsSPaIUQxgx/aIbYejHRfFq5jibn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=kNWiB2Mg; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1718276219; bh=k2Ywj6S/aj3jQl2/FwtOonbWt/mPoRiF349h2px3ZHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNWiB2MgXS5oqh0omzHtXljggate1ANe/pYoqNHtmgQky1JjtpDSVyGzq43PnVDFi
	 3FysTeQYLJWyRc5kjvADTbh+igXkT17n22sQLQ2/Wc/E8dwa/Uwn0+W4MiV6qly2gP
	 sebS1XCYc2ppMwwJu6LRGrNZhHkt0BnjxMdDcCs0=
Date: Thu, 13 Jun 2024 12:56:59 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, dianders@chromium.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <a6f557c6-4ebc-4c47-af32-5d8d695681ce@t-8ch.de>
References: <20240607133709.3518-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607133709.3518-1-charles.goodix@gmail.com>

On 2024-06-07 21:36:02+0000, Charles Wang wrote:

<snip>

> diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
> new file mode 100644
> index 000000000..7ba7016e1
> --- /dev/null
> +++ b/drivers/hid/hid-goodix-spi.c
> @@ -0,0 +1,687 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Goodix GT7986U SPI Driver Code for HID.
> + *
> + * Copyright (C) 2024 Godix, Inc.

Goodix, Inc

> + */
> +#include <asm/unaligned.h>
> +#include <linux/delay.h>
> +#include <linux/hid.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/sizes.h>
> +#include <linux/spi/spi.h>

<snip>

> +static struct hid_ll_driver goodix_hid_ll_driver = {

const

> +	.parse = goodix_hid_parse,
> +	.start = goodix_hid_start,
> +	.stop = goodix_hid_stop,
> +	.open = goodix_hid_open,
> +	.close = goodix_hid_close,
> +	.raw_request = goodix_hid_raw_request

comma

> +};

<snip>

