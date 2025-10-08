Return-Path: <linux-input+bounces-15297-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 135B4BC35CD
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 06:59:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D60C1886FC2
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 04:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D282BFC7B;
	Wed,  8 Oct 2025 04:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I1OV30nO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC662BFC60;
	Wed,  8 Oct 2025 04:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759899538; cv=none; b=uq0MeIJbKM3PGsjFId8alprcr6M/0mQsGEtLgunyE5HzxWF5WIbMDTCcSVfReMOvyr295E04htNOiP52QksQAZwRBcTN3SlyjwV3SnYsi6S0QgVBD5mSWgqiKh9ecASHn/9ofYLPxgLP8OPNskFSDzVtIyzGWeQ8EDPMTR4nyS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759899538; c=relaxed/simple;
	bh=SCtk0BHUhjXkwi+qKXVHVoFCybYdmqTnWVjrx2Cxk+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbTjZ3CPtDq3W3EDt358tgkGid6MxHX1Se0LcC11VDWX72Edn6jPpTq2adOue6JagjUFO8eoMTZ7ppUEC96+pzsPZVI6y2vkPfc+U4dN92h+IkvJbwQuq9pCMmHJQEVf4z8mYH5jgkMHpRrLhB7KrxYory3CxOcLjRGD92UBc1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I1OV30nO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F181C4CEF4;
	Wed,  8 Oct 2025 04:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759899537;
	bh=SCtk0BHUhjXkwi+qKXVHVoFCybYdmqTnWVjrx2Cxk+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I1OV30nOAhB4FVOLuSRPRCODwta8Io3y6O/pcq812uSR/LnuiElG1g7vvzblNN4ni
	 fKFsDGQRcbPeaTPLxc9ymtocQn5zlXYUJxM2qK35Uok/M8UzCPceKB1i9metIPLWd5
	 KGAmqu1Pm+ES/Wfizk4nQLir5wcGzjobBb55Xkr0=
Date: Wed, 8 Oct 2025 06:58:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Input: pegasus-notetaker - fix out-of-bounds access
 vulnerability in pegasus_parse_packet() function of the pegasus driver
Message-ID: <2025100848-busload-baggage-77f7@gregkh>
References: <20251007214131.3737115-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007214131.3737115-2-eeodqql09@gmail.com>

On Tue, Oct 07, 2025 at 05:41:32PM -0400, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> In the pegasus_notetaker driver, the pegasus_probe() function allocates
> the URB transfer buffer using the wMaxPacketSize value from
> the endpoint descriptor. An attacker can use a malicious USB descriptor
> to force the allocation of a very small buffer.
> 
> Subsequently, if the device sends an interrupt packet with a specific
> pattern (e.g., where the first byte is 0x80 or 0x42),
> the pegasus_parse_packet() function parses the packet without checking
> the allocated buffer size. This leads to an out-of-bounds memory access,
> which could result in a system panic.
> 
> Fixes: 948bf18 ("Input: remove third argument of usb_maxpacket()")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  drivers/input/tablet/pegasus_notetaker.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/tablet/pegasus_notetaker.c b/drivers/input/tablet/pegasus_notetaker.c
> index 8d6b71d59793..6c4199712a4e 100644
> --- a/drivers/input/tablet/pegasus_notetaker.c
> +++ b/drivers/input/tablet/pegasus_notetaker.c
> @@ -311,6 +311,11 @@ static int pegasus_probe(struct usb_interface *intf,
>  	}
>  
>  	pegasus->data_len = usb_maxpacket(dev, pipe);
> +    if (pegasus->data_len < 5) {
> +		dev_err(&intf->dev, "Invalid number of wMaxPacketSize\n");
> +		error = -EINVAL;
> +		goto err_free_mem;
> +	}
>  
>  	pegasus->data = usb_alloc_coherent(dev, pegasus->data_len, GFP_KERNEL,
>  					   &pegasus->data_dma);
> -- 
> 2.43.0
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

