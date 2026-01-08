Return-Path: <linux-input+bounces-16872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F30ED03CDF
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC32B303DF76
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D06041B34A;
	Thu,  8 Jan 2026 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcAbjdCn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B8C286D7E;
	Thu,  8 Jan 2026 10:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869309; cv=none; b=TgphNUl4vFSKP7DxwRqYAKekU8OLAVAIVr/Fkb58MESfCyIXe0s9T53AYkEixN7ST00si6e6mHja4FfZ41ViBxdioOWqggOJ6rVE+ryiCzqrfvY9cOZfXPccfqOxA0GnUuMIlnzJ1kJQT3uYTDlSnPWvoduefTqqxFsZSi8yh/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869309; c=relaxed/simple;
	bh=mfTHFuBrtHvWBMtN29ExNoOubr3/AlrAj+kSoSl0MHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs01FxDu1N57KoyMRk6K+9+IYtmkgL8YDZRqI6r6IFOe8NYvcEPiIxgtvp4gXmjeqhTxn5F/Nak0HKbEZSMA5QVsSiNJ33SM9QqWJ20KiGnt7IN42U5p5IfEbnOxG42S1k/l+EGiJ8XB9n68RVYCK2lMiRvTEQus6YyDRMYQYuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcAbjdCn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02340C116C6;
	Thu,  8 Jan 2026 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869307;
	bh=mfTHFuBrtHvWBMtN29ExNoOubr3/AlrAj+kSoSl0MHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jcAbjdCn+tBIea4rBDb9fXc2HymhaBd3qRbDHbDEMgA8+xy2luplPO2IzNox1RmaA
	 eOVIVXLvIkr18nsipC0OiLqZ3gwiHfQUVT5RcZ+oXMrxr2dkrDGe2T7egFa9MuKPKF
	 pWdH7m//0byfBhv9UEiqlQqg5WHq/tOureQ7FmnXgCW2pvEOQHMXdq42qSYUxgfQK8
	 lyHj+I0VW6W6s/6EfxBV5eU5sHp4s2icNxllM9IKAUdNVNf7ThkrYIJm0gK5ijD2yP
	 EU9TDo/O0RhrpMxS2g7o0e0shpEKp50NSTp1Mioq72IsURO/GX7BZs5R4B6WN70Dc2
	 5ij3un2cwa7Kg==
Date: Thu, 8 Jan 2026 11:48:18 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Tomasz =?utf-8?Q?Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Cc: dmitry.torokhov@gmail.com, corbet@lwn.net, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	vi@endrift.com, linux-kernel@altimeter.info, peter.hutterer@who-t.net
Subject: Re: [RFC PATCH 3/6] Input: Fire EV_BTN if found in ev_bit
Message-ID: <3hbaxvaacc4gopd3p4dbqvkemqsy7qrzo4el73ngg7szbu5zbk@xq5c7ah5ul7y>
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
 <20260104213132.163904-4-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260104213132.163904-4-tomasz.pakula.oficjalny@gmail.com>

On Jan 04 2026, Tomasz Pakuła wrote:
> Passes EV_BTN through to handlers and allows reacting to this event by
> clients.
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  drivers/hid/hid-input.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 2bbb645c2ff4..900a6fc9813e 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1673,7 +1673,8 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>  
>  	switch (usage->type) {
>  	case EV_KEY:
> -		if (usage->code == 0) /* Key 0 is "unassigned", not KEY_UNKNOWN */
> +		/* Key 0 is "unassigned", not KEY_UNKNOWN */
> +		if (usage->code == 0 && !test_bit(EV_BTN, input->evbit))
>  			return;
>  		break;
>  
> @@ -1723,10 +1724,19 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>  	    value == field->value[usage->usage_index])
>  		return;
>  
> -	/* report the usage code as scancode if the key status has changed */
> -	if (usage->type == EV_KEY &&
> -	    (!test_bit(usage->code, input->key)) == value)
> -		input_event(input, EV_MSC, MSC_SCAN, usage->hid);
> +
> +	if (usage->type == EV_KEY) {
> +		/* Send out EV_BTN with button number (starts at 1) */
> +		if (test_bit(EV_BTN, input->evbit))
> +			input_event(input, EV_BTN, usage->hid & HID_USAGE, value);

In addition to what Peter said, this seems to be a lot more convoluted
than what it needs to be.

The one nice thing about the EV_BTN is that is transfers the intend of
"this is a buttons with no particular meaning". And that's exactly what
the HID usage page "button" is.

So why not:
- whenever there are buttons from the HID usage page button -> map them
	to EV_BTN
- only map EV_BTN to usage page Button (to prevent weird things
	happening with keyboards)
- keep doing the weird mapping in HID we do but do not upper bound the
	EV_KEY like we do (first hunk in this patch), and store the mapping
	EV_BTN/EV_KEY in the input/evdev subsystem, not in HID
- on the HID side, we fire just the EV_BTN for button usage page, and
	input does the backward compatibility.
- the backward compatibility needs to be in the input side of things so
	we can add the new ioctls Peter was mentioning.

Cheers,
Benjamin

> +
> +		if (usage->code == 0)
> +			return;
> +
> +		/* report usage code as scancode if the status has changed */
> +		if ((!test_bit(usage->code, input->key)) == value)
> +			input_event(input, EV_MSC, MSC_SCAN, usage->hid);
> +	}
>  
>  	input_event(input, usage->type, usage->code, value);
>  
> -- 
> 2.52.0
> 

