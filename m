Return-Path: <linux-input+bounces-8019-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 036C49C439D
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 18:32:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5B51F219C2
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 17:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F9D14B962;
	Mon, 11 Nov 2024 17:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="mIveQqah"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253F11BF58
	for <linux-input@vger.kernel.org>; Mon, 11 Nov 2024 17:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731346327; cv=none; b=Ferl5jGF9q8LAeO2WqeYWlWh9JRY0bek5O2YBmDfP5J3taBkhU9OxllTmmeZRej3O64La/JOCShHZ4DmuzpFqZqQ6Qe6M9VXkx0xTGfMxAX6LbmDLVpWQM2BF4FPX1Num16wJqHLm9HCaH29H9KEBCCGENWEcmJdzALzXIyADwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731346327; c=relaxed/simple;
	bh=R1OxGtW1OXn6UnWHatNz7pta1Hc/mAoMIINg5IcSwIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rrww2ktrLxTEVsN8efvwB1PS/rda726BWfe3G/EW4EhY/JkkThsD4vGuBWQoW7QurMKJNs/KqjYDiNNn+NihBIN+k7zf6c1p9hX15izddpVQdi8zaIdmoHgwexvu4Pcm4/iCwG3CsAtbXzjkckoq+gpunBVaaEfRBi//J+HdVws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=mIveQqah; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 108F88932A;
	Mon, 11 Nov 2024 18:32:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731346324;
	bh=m+Eyb5nA9rP5UvCqe5BJXcKC8MFjYJaJOoHKui5tOZc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mIveQqahnM5ROin2S8Hd9hqJT92YGDjyviAFuRNsqftCOxP0Ha/b5in09JCXIVOba
	 o5pr2rda+lX8TFA8UPLPUiniuAS3I0t+73b6DwLH7uA8XbumIYrGRTQrkMtxrEjV9n
	 ESF5hZEiWz7sZ+y+KSZL5ykZNFTCE18BNkAzcfWplnHn+1Bgk6WqKHHrzM7zgqqzUu
	 1mpDzt4VuXtPZJqKqHHwKyKvpm7dUdctaj6XqKO0KEBSOtXEoeTAxuPkLB+ut55QJD
	 yNJTvZYE2A8KkZoX46qhtPe3nxOT+heUkH63krZ/A0ahUQKAh3Q6mopMqzHfMhKqqX
	 QQSCs4dSCPs4w==
Message-ID: <781bff37-975d-418e-9ea1-ecb3deb16612@denx.de>
Date: Mon, 11 Nov 2024 17:18:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - Increase xfer array size in 'struct
 ser_req'
To: Nathan Chancellor <nathan@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
References: <20241111-input-ads7846-increase-xfer-array-size-v1-1-06cd92e9f20f@kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241111-input-ads7846-increase-xfer-array-size-v1-1-06cd92e9f20f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/11/24 4:09 PM, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y, trimmed for brevity):
> 
>    drivers/input/touchscreen/ads7846.c:412:2: error: array index 6 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
>      412 |         req->xfer[6].tx_buf = &req->scratch;
>          |         ^         ~
>    ...
>    drivers/input/touchscreen/ads7846.c:416:2: error: array index 7 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
>      416 |         req->xfer[7].rx_buf = &req->scratch;
>          |         ^         ~
>    drivers/input/touchscreen/ads7846.c:334:2: note: array 'xfer' declared here
>      334 |         struct spi_transfer     xfer[6];
>          |         ^
> 
> Increase the size of xfer in 'struct ser_req' to ensure that there is
> enough space for all necessary members and there are no out of bounds
> accesses, clearing up the warning.
> 
> Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   drivers/input/touchscreen/ads7846.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
> index f7bc0a3e56d86932823b6bc0dcd6bcd8e1b9b5c2..7b3711a3597c86f18c45d040f73bef884ec3c4aa 100644
> --- a/drivers/input/touchscreen/ads7846.c
> +++ b/drivers/input/touchscreen/ads7846.c
> @@ -331,7 +331,7 @@ struct ser_req {
>   	u8			ref_off;
>   	u16			scratch;
>   	struct spi_message	msg;
> -	struct spi_transfer	xfer[6];
> +	struct spi_transfer	xfer[8];
Sigh ...

Reviewed-by: Marek Vasut <marex@denx.de>

Thank you

