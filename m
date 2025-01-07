Return-Path: <linux-input+bounces-9019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB01EA04A4D
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D99118884C2
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0081F4E40;
	Tue,  7 Jan 2025 19:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="BYzbNVOu"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4711F428A;
	Tue,  7 Jan 2025 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278444; cv=none; b=fL9HMkfTkJnFkcn9xFnRJ7oJ7uOStNc+PsgyAUewZsE7xWRnGWyL8HeOiiO191pbdW1m3wrW99sT23jOPWUJYp/KGTrpT2YseeUMElqTBwC0sz08/mZTWxpYenL8YS2v9TP7nLx/1fq8uXnx9D8JEBt7+3c/H6cdf9RAfDFVSTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278444; c=relaxed/simple;
	bh=LxKeuBsfyyzbg5g4kpQlahz5eSSkf2OfnyIXZh1hnEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOqUp8kfcBG1T3/4LdF38CcHWl+k85ndTT5hYikz00al3fmYMw7UcvM8v56JmihhAFNt+MogFXOHqCIkUKJT6bMv6jCoVcKIyTOjGhGZA8eoA6R1Ia+LHTecNiPK3+ywMvnVv4p0Bz9uSjpRJ4y3DGE2ps/M8pRRFy04Bzr0EtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=BYzbNVOu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1736278437; bh=LxKeuBsfyyzbg5g4kpQlahz5eSSkf2OfnyIXZh1hnEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BYzbNVOukj0lyR2szwvrHDjPWocm0crnpMQUbhyaKtu4qKbQpLtmQ/rfMWh6eIuF1
	 URtUqGgPssnpXM6Si+OCJfuXff72LkTSlcdsA0gCUmKF7WP0Mbk3NjSno4i3QTFCTV
	 WLcj29SsPgf6oV1ExMmXvvhuRpQcAMsWRf6z//dI=
Date: Tue, 7 Jan 2025 20:33:56 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	Manuel Traut <manuel.traut@mt.com>
Subject: Re: [PATCH v3 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <3134353b-1bbe-4049-8041-7043cd97ff8d@t-8ch.de>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-2-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107135659.185293-2-markus.burri@mt.com>

On 2025-01-07 14:56:53+0100, Markus Burri wrote:
> The delay is retrieved from a device-tree property, so the duration is
> variable. fsleep guesses the best delay function based on duration.
> 
> Link: https://www.kernel.org/doc/html/latest/timers/timers-howto.html

timers-howto.rst was removed in commit 1f455f601e20
("timers/Documentation: Cleanup delay/sleep documentation").

Also inside the kernel tree refer to documentation files by their location
inside the tree instead of the website.

> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  drivers/input/keyboard/matrix_keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 2a3b3bf..5571d2e 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -68,7 +68,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
>  	__activate_col(keypad, col, on);
>  
>  	if (on && keypad->col_scan_delay_us)
> -		udelay(keypad->col_scan_delay_us);
> +		fsleep(keypad->col_scan_delay_us);
>  }
>  
>  static void activate_all_cols(struct matrix_keypad *keypad, bool on)
> -- 
> 2.39.5
> 

