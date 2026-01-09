Return-Path: <linux-input+bounces-16896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8674AD0A5A3
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 14:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13D8B31BF5F8
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 13:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB2135BDAB;
	Fri,  9 Jan 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="i/ATWbT4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2E335971E;
	Fri,  9 Jan 2026 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963699; cv=none; b=IW/eDHzKRTfY/6ev4LwoLinTbZEyykcvLIifTWasecZAtU/ibbF7NRcXJYKlj9GmvelEAOCC3+wee+qpFY4x3ZEg5kbX9b+9vJcCAJ9ivL9bolOlz1EYy4RvNfTGfNfxhWrV4gIXoA8xF8InwqOcVP9azHtQK6vkRFWojj5AdMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963699; c=relaxed/simple;
	bh=k5A3WMP1tURQUV8YTaLgX8u93ATym8rJbdZ7P43xNSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7mLhttfnEc0kqRSfyuUBqYF+iAvR6xEPNZzD3Rxem3U1Ylq3v2e/pduU3ofZOF5RWtSvWoMEqkIMpCgRTKTO+Kx2ppT/o0bkibpfOQHa9w4n/GL9ZW9hWakszCL3JNyyrMko5z9chbJpWR0kSIgbrOm6PWh73TXhonW8gSFP9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=i/ATWbT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D74C4CEF1;
	Fri,  9 Jan 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767963699;
	bh=k5A3WMP1tURQUV8YTaLgX8u93ATym8rJbdZ7P43xNSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/ATWbT4prdWjG98CYbmVw4tjZj8UEN6+C/3ltLVWXA65MLd6pxISSDlNezIHUwr2
	 jQTXs0dwgYMk4IIekeuci2aI818BWvkL8ipzg1B4vrRPDXJk56gu8sQ+AV36JdIe98
	 ukG4QEVdWJHW/g9u5+ndhqfp569jMmcj9GuNtWzM=
Date: Fri, 9 Jan 2026 14:00:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, stable@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: logitech-hidpp: Check maxfield in
 hidpp_get_report_length()
Message-ID: <2026010909-trapped-kindly-1cdf@gregkh>
References: <20260109122557.3166556-3-gnoack@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109122557.3166556-3-gnoack@google.com>

On Fri, Jan 09, 2026 at 01:25:58PM +0100, Günther Noack wrote:
> Do not crash when a report has no fields.
> 
> Fake USB gadgets can send their own HID report descriptors and can define report
> structures without valid fields.  This can be used to crash the kernel over USB.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Günther Noack <gnoack@google.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 9ced0e4d46ae..c5e132a6c085 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4313,7 +4313,7 @@ static int hidpp_get_report_length(struct hid_device *hdev, int id)
>  
>  	re = &(hdev->report_enum[HID_OUTPUT_REPORT]);
>  	report = re->report_id_hash[id];
> -	if (!report)
> +	if (!report || !report->maxfield)
>  		return 0;
>  
>  	return report->field[0]->report_count + 1;
> -- 
> 2.52.0.457.g6b5491de43-goog
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

