Return-Path: <linux-input+bounces-16825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3EACFE46E
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 15:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44BE730EFED4
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 14:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5614A34106A;
	Wed,  7 Jan 2026 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2WeHTTw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC2E340DB2;
	Wed,  7 Jan 2026 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795618; cv=none; b=Nfr8gAhQJ32Sm1XUZhUv0G7D/E6fYmp7u7kdQR7f8NlmWKaJRTG4+vYL9NuMvo8rUPajs+RdW2yspPA1Uw+2ldIghBglvPbTapxHz3qTgu1gqlEBrb00xNPe86iTcE2ErO8qkfQ1CzR7dKEvuGcVxkHM3Jq5wTBOTn6uMH/lqGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795618; c=relaxed/simple;
	bh=vXm+FDmvSMHqW9rNFVomP3Cpid6748XCxDsvU9ZLjkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6XJjS7TpXz6RaMlJOsVf9dMQutl/KikFpNPPl90s+/jqHb7eQXDfhhoqzGQj+N0O13PCVxndLof7vG0dVn/8h9IOTd0kjy+4lioo6mOSHEh2o1/LmoZDH7RpxtLnjPImcCkl9kwah8KXmr18tQnFGbyD/TWAMaoLz//wqcvn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2WeHTTw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B02C4CEF1;
	Wed,  7 Jan 2026 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795617;
	bh=vXm+FDmvSMHqW9rNFVomP3Cpid6748XCxDsvU9ZLjkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2WeHTTwA3vYGnuj6Yl0Ml0gQUJIPyihjaPTo/arzB6ljR7MSWcFkbKQKVM1SsUEI
	 TGk4iGEToc1IjHQLgT3dyzctUr6eHo5hfre3Us3md7f2Flgoof/hSayEKZX6Z8otIl
	 gyUHPco29pI3LPPkF0ln828/lHSnkRR1KqwwCnBS3pZOTv+KjOQBXrY5u/T+hUy7qM
	 6CZUtwxyGzQuKxkwSCsSDcBsL0kgPNyWQfzyjf262Qggwn/u8oSbtkHiM9YenDLglm
	 O904/c4vzH7FH/hAsoaC+gJCtc/5bGcY4FnyT6C/sJYxGd/+rTLgXWLNHOup5nehQF
	 4g83i7UnxM/Kw==
Date: Wed, 7 Jan 2026 15:20:13 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Kwok Kin Ming <kenkinming2002@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: fix potential buffer overflow in
 i2c_hid_get_report()
Message-ID: <or6uoheepcbcx4sm36g7z3ccevhjn6iv2ddztx6mpw4qgbdoyo@n3yfbkwlye5i>
References: <20251231181830.232239-1-kenkinming2002@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231181830.232239-1-kenkinming2002@gmail.com>

On Jan 01 2026, Kwok Kin Ming wrote:
> `i2c_hid_xfer` is used to read `recv_len + sizeof(__le16)` bytes of data
> into `ihid->rawbuf`.
> 
> The former can come from the userspace in the hidraw driver and is only
> bounded by HID_MAX_BUFFER_SIZE(16384) by default (unless we also set
> `max_buffer_size` field of `struct hid_ll_driver` which we do not).
> 
> The latter has size determined at runtime by the maximum size of
> different report types you could receive on any particular device and
> can be a much smaller value.
> 
> Fix this by truncating `recv_len` to `ihid->bufsize - sizeof(__le16)`.
> 
> The impact is low since access to hidraw devices requires root.
> 
> Signed-off-by: Kwok Kin Ming <kenkinming2002@gmail.com>
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 63f46a2e5..5a183af3d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -286,6 +286,7 @@ static int i2c_hid_get_report(struct i2c_hid *ihid,
>  	 * In addition to report data device will supply data length
>  	 * in the first 2 bytes of the response, so adjust .
>  	 */
> +	recv_len = min(recv_len, ihid->bufsize - sizeof(__le16));

It makes sense to put this min call here, but it's already present at
line 304 a few lines after. Could you remove that second check (and
unnecessary one after your change).

Cheers,
Benjamin

>  	error = i2c_hid_xfer(ihid, ihid->cmdbuf, length,
>  			     ihid->rawbuf, recv_len + sizeof(__le16));
>  	if (error) {
> -- 
> 2.52.0
> 

