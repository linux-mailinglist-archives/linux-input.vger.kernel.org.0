Return-Path: <linux-input+bounces-16893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B53D08D91
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 12:16:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7196330204BD
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 11:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9582433C18C;
	Fri,  9 Jan 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="entWZ/xO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655133C180;
	Fri,  9 Jan 2026 11:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957286; cv=none; b=WVGIjtcGEYZpKzvOc9WulEbPDe7D/qr+IjHv0Qdqlolkmp5+9Jn3TYUpnMlH7fqHanQvEc2kzfXnZ1vmm4NJloAN/f8WkY/CZyJHEFCdA7JuWhJH4YXsf2JRmUcBXghAKXyoe1JU7w+WoZxH0nBrQzOWEJwwVsqcZ8LNNqBqbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957286; c=relaxed/simple;
	bh=mBGg8YJATGGBIPdd4QLFBfMIyoN1LOq0JNqC5F5JFao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4wSrqpYgzCvbHP2R8dTG4bjwOrxBCwR6n3Xxkz5zr373O1U62rtE4pEgzzhQV7yc53kn6A3d9VMvvQ1Vx2VOUDzcdglqxzksIVvosxfEtJiSjkhXIAIkMSzMXgbKiiqFIcfLX4vBTH+2zswnLNSTT/QuJL2iJy2wAq+K30KPwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=entWZ/xO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB45C4CEF1;
	Fri,  9 Jan 2026 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767957286;
	bh=mBGg8YJATGGBIPdd4QLFBfMIyoN1LOq0JNqC5F5JFao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=entWZ/xOxZy3g576kPAxJdgHFQLZ2n144Ylt8svTBpxWmf4Zn9itDXJdp3HPoOiwH
	 7sRuB2LZ4z4E8cbX6lq7cP5U1j44Rcxf9obRT7brkn3oNWNmTkYz4hLN03RlVftfwg
	 pcmaMj3bUSwshu+RH+TzgRsSUON+suOuj/8Jf/Bo=
Date: Fri, 9 Jan 2026 12:14:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Check maxfield in
 hidpp_get_report_length()
Message-ID: <2026010956-anteater-pungent-d5b6@gregkh>
References: <20260109105912.3141960-2-gnoack@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109105912.3141960-2-gnoack@google.com>

On Fri, Jan 09, 2026 at 11:59:12AM +0100, Günther Noack wrote:
> Do not crash when a report has no fields.
> 
> Fake USB gadgets can send their own HID report descriptors and can define report
> structures without valid fields.  This can be used to crash the kernel over USB.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Günther Noack <gnoack@google.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 9ced0e4d46ae..919ba9f50292 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4316,6 +4316,9 @@ static int hidpp_get_report_length(struct hid_device *hdev, int id)
>  	if (!report)
>  		return 0;
>  
> +	if (!report->maxfield)
> +		return 0;

Combine this with the if() above this?

And if we are going to be handling "malicious" USB devices, be careful,
you are just moving the target lower down, you also need to audit ALL
data coming from the device, not just the descriptors.  I'm all for
this, just realize that this is a change in how Linux treats devices
(and all other operating systems as well.)

For now, we strongly recommend not allowing "untrusted" devices to bind
to your system if this is a threat model you care about.

Not to reject this, or your other patch like this, just letting you
know.

thanks,

greg k-h

