Return-Path: <linux-input+bounces-5245-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEE0943192
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 15:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BACCB285A55
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 13:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C328D1B3722;
	Wed, 31 Jul 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YE/byaHt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A71B29CF;
	Wed, 31 Jul 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434369; cv=none; b=n0lyk09iIxlxeTjhr75H7fK/AzUDv7ENrfbnnQZf6PQoP832gil9Yr93XpwGuNaKyalaB2K7bD+mijvECkR9/d2PoV8Y8ZXgUvTqoqi+98R7e1/ibDIkglDnewnHUHJsSIfpXCKsF5ggMWDE/MlclY7WezurS9jArwb0dIDLRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434369; c=relaxed/simple;
	bh=38eH4sewTUypD+7B7wn9cp51XdNEcMKdka19KqwuSX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dTcRIjfrxcl6RHke6IrqzEkmdvsnv9LVBklSOxx+uMcZQuTgVbQk+fWAC3dStl3mgR10+5dZhOr35epoFFNJ2Mm8fq3IVwlJFkFFli8W7gNUBhO5Hp1U+LroQHAf0cWXBrX77jPoVe25UkJgbS1mmMXXyYyC7fGcDx3NEYhmFkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YE/byaHt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2880CC32786;
	Wed, 31 Jul 2024 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434369;
	bh=38eH4sewTUypD+7B7wn9cp51XdNEcMKdka19KqwuSX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YE/byaHtVOKy2HgZn8cwiNqoRtxr6z7qxmf7n2w3goj5s0dUMQDXKhjWXdvt+BI/m
	 luUuW37VIeEPnrDhKZ360tV8FCupFf87MWZfolO8ZkVcA1Qd6pSuzgSGmJqQ9Zi+i9
	 NU4i84WTH9dZN29zR0Fznb5ghselgGQrKAV4DaaTV1PykAC+xNeR3jEHR9y6v//ars
	 47TVHNysEuLpd0SPkDslvUjwlcuuaIxY6pyLMbgypJ89zamUuxemmnIZfg1pWL5nHJ
	 6yExgUrmFeXxCYiFhvwl/MY/SxMiv+8vYEBgXOmacTSEQLU3OJq1h9koiBkD7lAqGJ
	 Kw6uaJ5sBPpqA==
Date: Wed, 31 Jul 2024 15:59:21 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] HID: treat fixed up report as const
Message-ID: <2kfmgwlmliwmn6olmnaab2mdn4ywquqputk3hcdqqkyqc6bfvd@jtlmixoar7qu>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
 <20240730-hid-const-fixup-v1-1-f667f9a653ba@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730-hid-const-fixup-v1-1-f667f9a653ba@weissschuh.net>

On Jul 30 2024, Thomas Weiﬂschuh wrote:
> Prepare the HID core for the ->report_fixup() callback to return const
> data. This will then allow the HID drivers to store their static reports
> in read-only memory.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/hid/hid-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 988d0acbdf04..dc233599ae56 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -1203,6 +1203,7 @@ int hid_open_report(struct hid_device *device)
>  {
>  	struct hid_parser *parser;
>  	struct hid_item item;
> +	const __u8 *fixed_up;
>  	unsigned int size;
>  	__u8 *start;
>  	__u8 *buf;
> @@ -1232,11 +1233,11 @@ int hid_open_report(struct hid_device *device)
>  		return -ENOMEM;
>  
>  	if (device->driver->report_fixup)
> -		start = device->driver->report_fixup(device, buf, &size);
> +		fixed_up = device->driver->report_fixup(device, buf, &size);
>  	else
> -		start = buf;
> +		fixed_up = buf;
>  
> -	start = kmemdup(start, size, GFP_KERNEL);
> +	start = kmemdup(fixed_up, size, GFP_KERNEL);

I think that kmemdup makes all of your efforts pointless because from
now, there is no guarantees that the report descriptor is a const.

How about you also change the struct hid_device to have both .dev_rdesc
and .rdesc as const u8 *, and then also amend the function here so that
start and end are properly handled?

This will make a slightly bigger patch but at least the compiler should
then shout at us if we try to change the content of those buffers
outside of the authorized entry points.

Cheers,
Benjamin

>  	kfree(buf);
>  	if (start == NULL)
>  		return -ENOMEM;
> 
> -- 
> 2.45.2
> 

