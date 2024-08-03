Return-Path: <linux-input+bounces-5299-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B49469A7
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D42E91F217CA
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B3A49659;
	Sat,  3 Aug 2024 12:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="tE3EiRX0"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46A1D53B;
	Sat,  3 Aug 2024 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688272; cv=none; b=CtllD/4v5UQpVY8ecvhWrsGHlnNRzk+IfKS2sp5GpKM4lD5vkSo8jFmB3Xnt5OmeOyN43gy8gKGx0LnsLqmbdgfpGowIrHH9wAOAvXRHJOZF4zFRavduWHWAXbqF6ff8h2DT05xHGTGShzgBQr633z6Yq1N/woc3VewEfG5l6zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688272; c=relaxed/simple;
	bh=CMS5+c/qQz1o2D46lsvfZ5yvcnTgysrck07yIKd+E3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=clSPPnsaR1DOfvFMqc3NH4fTtBoSr2givaMwNn3K5b0Apj75F16Udx5R/jsohOHfZUpAz0X1FG5TMbA5o2V6GBu0n2y5jydOVmCaX0jRAqB1Q0qxoSb9C4NIBgGm6A1qOqxRJ3EOlto/w2pKAcD61kAmNNgGkkx6QLpFON6zgLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=tE3EiRX0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688259;
	bh=CMS5+c/qQz1o2D46lsvfZ5yvcnTgysrck07yIKd+E3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tE3EiRX0AN08enhI7Bn94Wn5BDEaBAeAfezzn5wLB9iS1GQqzf/8CJ1nIJOLHeK47
	 L/fO7zcbBX7Eywj+1iUhaCDGPbViJ0KYZIBojZBkTasq5xdxoS8gRmpybwueIuTwZr
	 jBjWc0eoYUFX3uODX5VY930rinftlIKnC7I9lnYI=
Date: Sat, 3 Aug 2024 14:30:59 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] HID: treat fixed up report as const
Message-ID: <a48c4f98-bf7c-4050-807c-5c86fbbbd4f8@t-8ch.de>
References: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
 <20240730-hid-const-fixup-v1-1-f667f9a653ba@weissschuh.net>
 <2kfmgwlmliwmn6olmnaab2mdn4ywquqputk3hcdqqkyqc6bfvd@jtlmixoar7qu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2kfmgwlmliwmn6olmnaab2mdn4ywquqputk3hcdqqkyqc6bfvd@jtlmixoar7qu>

On 2024-07-31 15:59:21+0000, Benjamin Tissoires wrote:
> On Jul 30 2024, Thomas Weißschuh wrote:
> > Prepare the HID core for the ->report_fixup() callback to return const
> > data. This will then allow the HID drivers to store their static reports
> > in read-only memory.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> >  drivers/hid/hid-core.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 988d0acbdf04..dc233599ae56 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -1203,6 +1203,7 @@ int hid_open_report(struct hid_device *device)
> >  {
> >  	struct hid_parser *parser;
> >  	struct hid_item item;
> > +	const __u8 *fixed_up;
> >  	unsigned int size;
> >  	__u8 *start;
> >  	__u8 *buf;
> > @@ -1232,11 +1233,11 @@ int hid_open_report(struct hid_device *device)
> >  		return -ENOMEM;
> >  
> >  	if (device->driver->report_fixup)
> > -		start = device->driver->report_fixup(device, buf, &size);
> > +		fixed_up = device->driver->report_fixup(device, buf, &size);
> >  	else
> > -		start = buf;
> > +		fixed_up = buf;
> >  
> > -	start = kmemdup(start, size, GFP_KERNEL);
> > +	start = kmemdup(fixed_up, size, GFP_KERNEL);
> 
> I think that kmemdup makes all of your efforts pointless because from
> now, there is no guarantees that the report descriptor is a const.

The patch was meant to clarify the API to driver authors, not to make
the HID core safer. So I think it would not be pointless :-)

> How about you also change the struct hid_device to have both .dev_rdesc
> and .rdesc as const u8 *, and then also amend the function here so that
> start and end are properly handled?
> 
> This will make a slightly bigger patch but at least the compiler should
> then shout at us if we try to change the content of those buffers
> outside of the authorized entry points.

That sounds indeed like the correct solution.
It also completely avoids to introduction of yet another variable.

> Cheers,
> Benjamin
> 
> >  	kfree(buf);
> >  	if (start == NULL)
> >  		return -ENOMEM;
> > 
> > -- 
> > 2.45.2
> > 

