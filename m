Return-Path: <linux-input+bounces-12635-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77CAC747F
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 01:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AB81A421D9
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 23:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6469230BE9;
	Wed, 28 May 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn/HerPa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE13621D5B8;
	Wed, 28 May 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474781; cv=none; b=A/60D7pqgExNtQr5hvAIRX7zsQaHYwpY7QTEvo0ouF3Gv14EItVAlNStniq8b7GPeKk02ptvuYcN3MXE9KNVABVcvQDqYoe1tqMjwBjJCFZyMb+hVQ5Eg2rG/eYehEPG/XhSOIUAyN9qxVgGfNJFEOGGYFHEGrqnLXSf6vTgZpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474781; c=relaxed/simple;
	bh=CIiZWvuxveOfvj1dMpqf3skmK6WOvXCeyxFf+XT3oAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lf2TIk5I7YvYqXFqZebbsZF5yGApzs0vLSENL+Ej5RS1d0+aMF5Ed/FYldE5xlbMOfoA8PzuhwuOa1hAYSsMpKRIjYdbSCPHwCs3hd6Pf1afdxQ1lJeyMD8JRfOcMNw8Es+vIMBRBRKrLL2Fj6A2Ll2RB1PYhqW1nVKC4fV6uNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn/HerPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D0FC4CEE3;
	Wed, 28 May 2025 23:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748474781;
	bh=CIiZWvuxveOfvj1dMpqf3skmK6WOvXCeyxFf+XT3oAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pn/HerPa9QP3+VoRBOKsuuJVEqUdtrNe9tWdWvjVbTe9GbPbGZGU50EClueBVnwdG
	 GJTJSfA1QtRPU+aydpCbgovCag42XYHK+8eHe9ZtT9gXebFYFvIVAihRkIoUAvdalb
	 vDCa7eCkaHuAd3/uUVjhxk2mn+J2hmp7VPWUhHHwHNKkvjjfRWR/OFoprcT3iO2K1P
	 S1JX/+Vht/ZNGYsZddaz07oIYUYRGhXcXkytjfYQe2Hj5U2PzIGc5TjUhlH+OEpNi1
	 gnLOKfdphojF28XOaoEtTlNPTSk5Ai/a3O0seoy6b03OEbSaklQpACAmR48Lexq2TI
	 8tdlglLQIglBw==
Date: Wed, 28 May 2025 16:26:18 -0700
From: Kees Cook <kees@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: ims-pcu - Check record size in
 ims_pcu_flash_firmware()
Message-ID: <202505281611.A024D45E@keescook>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
 <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <131fd1ae92c828ee9f4fa2de03d8c210ae1f3524.1748463049.git.dan.carpenter@linaro.org>

On Wed, May 28, 2025 at 11:22:24PM +0300, Dan Carpenter wrote:
> The "len" variable comes from the firmware and we generally do
> trust firmware, but it's always better to double check.  If the "len"
> is too large it could result in memory corruption when we do
> "memcpy(fragment->data, rec->data, len);"
> 
> Fixes: 628329d52474 ("Input: add IMS Passenger Control Unit driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Kees, this is a __counted_by() thing.  Would the checkers catch this?
> We know the maximum valid length for "fragment" is and so it's maybe
> possible to know that "fragment->len = len;" is too long?

I see:

pcu->cmd_buf as:

        u8 cmd_buf[IMS_PCU_BUF_SIZE];

and fragment is:

struct ims_pcu_flash_fmt {
        __le32 addr;
        u8 len;
        u8 data[] __counted_by(len);
};

I assume you're asking about this line:

		fragment->len = len;

I'm not aware of any compiler instrumentation that would bounds check
this -- it was designed to trust these sort of explicit assignments.

This is hardly the only place in the kernel doing this kind of
deserialization into a flexible array structure, so maybe there should
be some kind of helper to do the bounds checking and set the
"counted_by" counter?

#define gimme(from, into, counter, len)				\
	({							\
		int __gimme_rc = -EINVAL			\
		size_t __gimme_size = __member_size(from);	\
		if (__gimme_size >= sizeof(*into) &&		\
		    __gimme_size - sizeof(*into) >= len) {	\
			into = (void *)from;			\
			into->counter = len;			\
			__gimme_rc = 0;				\
		}						\
		__gimme_rc;					\
	})

	rc = gimme(&pcu->cmd_buf[1], fragment, len, len);
	if (rc) {
		dev_err(pcu->dev,
			"Invalid record length in firmware: %d\n", len);
		return rc;
	}

-Kees

> 
>  drivers/input/misc/ims-pcu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
> index d9ee14b1f451..4581f1c53644 100644
> --- a/drivers/input/misc/ims-pcu.c
> +++ b/drivers/input/misc/ims-pcu.c
> @@ -844,6 +844,12 @@ static int ims_pcu_flash_firmware(struct ims_pcu *pcu,
>  		addr = be32_to_cpu(rec->addr) / 2;
>  		len = be16_to_cpu(rec->len);
>  
> +		if (len > sizeof(pcu->cmd_buf) - 1 - sizeof(*fragment)) {
> +			dev_err(pcu->dev,
> +				"Invalid record length in firmware: %d\n", len);
> +			return -EINVAL;
> +		}
> +
>  		fragment = (void *)&pcu->cmd_buf[1];
>  		put_unaligned_le32(addr, &fragment->addr);
>  		fragment->len = len;
> -- 
> 2.47.2
> 

-- 
Kees Cook

