Return-Path: <linux-input+bounces-7061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085F98FEF1
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:32:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27A921F21C7F
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 08:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821ED136E01;
	Fri,  4 Oct 2024 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E6Ntitqp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C561802E;
	Fri,  4 Oct 2024 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728030760; cv=none; b=HONHv8bZewQrJ3vSF07kN0Y3tO9DIg2EUGUyOsWMQSOCirVhqDBpSG0ChNNa6q/6StK/xTNguw2ZSgIXQk8k9Q7gxtsx+8JyHmzGAZbtDQCDhSwBVGDeR9ZmfNsjYuSX0Wv7ZDr979SOJWvkvVfKmZPOgm8fOFTk1NxgeQQrhOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728030760; c=relaxed/simple;
	bh=Okjwow2NRaq+qHRz2xzgp56d9P2FmI6hg79iwqc14Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u8fobKN2QUH/G6RnI5wMrEiu0fqPkbSKjQGVBN94R6l7RbCal/3y6LAxqoXaNBKe2l2KyRLI7UBgH8EyItjki0XW2xKz78FQfKbaFGGpkbTFNA0/0pXrW09EnJ06t3Hfilg4PnB4n0opLKLLBW0HFInJY8SjeLXeMEXyPJkFPSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E6Ntitqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856BDC4CEC6;
	Fri,  4 Oct 2024 08:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728030760;
	bh=Okjwow2NRaq+qHRz2xzgp56d9P2FmI6hg79iwqc14Ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6NtitqpwIT2lnnEASETR0OEZIkYpBnrFPLp0HMSQyLep1ru5gWsZuqSDGFBOuKnr
	 Hkc0oMHgLvjOxDAeT47NarqTEwSnPnx727byVACQw9dxGXj0iqawrsULFx0dMw+vQZ
	 A3KiqoYE1wAJdlkCBKq4lqGDyMO2+nqFGELl3aXh8Sw6AsiOeLYjJiD4KqtqSfuj5u
	 3w7MWuf349BDuukRktfM0kEXDLTvqb7Sh7eSJYNUDTbCzjn8gKBqNdnAWenH6c67yH
	 a20ettg6P6uOPMdJz3bV/9fbvfenBQoIDFaDqcP82HBvH6NDzRJ4fAgmNviivw69H6
	 VcKfnzMzjpahA==
Date: Fri, 4 Oct 2024 10:32:35 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: SurajSonawane2415 <surajsonawane0215@gmail.com>
Cc: srinivas.pandruvada@linux.intel.com, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: intel-ish-hid: Fix uninitialized variable 'rv' in
 ish_fw_xfer_direct_dma
Message-ID: <gx5bubwp2vsei4o6aoahsj5nivlqdl6vdwricxkh6icupuq4nc@wboib5iyqsmj>
References: <20241004075944.44932-1-surajsonawane0215@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004075944.44932-1-surajsonawane0215@gmail.com>

On Oct 04 2024, SurajSonawane2415 wrote:
> Fix the uninitialized symbol 'rv' in the function ish_fw_xfer_direct_dma
> to resolve the following warning from the smatch tool:
> drivers/hid/intel-ish-hid/ishtp-fw-loader.c:714 ish_fw_xfer_direct_dma()
> error: uninitialized symbol 'rv'.
> Initialize 'rv' to 0 to prevent undefined behavior from uninitialized
> access.

Thanks for the patch!

FWIW, I tried to understand why this went unnoticced for so long: the
only case where rv might be used uninitialized is if fw->size == 0.

In that case, all that happens is that load_fw_from_host() tries to call
ish_fw_start() which will in turn overwrite the return value.

So I'm not sure if request_firmware() can return a firmware of size 0,
and if ish_fw_start() will be happy about that, but I would hope one of
the 2 would complain and not crash the kernel.

Anyway, I'll grab this one and adding Fixes and CC:stable as this might
catch an interesting bug, and fixing smatch complains is always good.

Cheers,
Benjamin


> 
> Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
> ---
>  drivers/hid/intel-ish-hid/ishtp-fw-loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> index e157863a8..b3c3cfcd9 100644
> --- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
> @@ -635,7 +635,7 @@ static int ish_fw_xfer_direct_dma(struct ishtp_cl_data *client_data,
>  				  const struct firmware *fw,
>  				  const struct shim_fw_info fw_info)
>  {
> -	int rv;
> +	int rv = 0;
>  	void *dma_buf;
>  	dma_addr_t dma_buf_phy;
>  	u32 fragment_offset, fragment_size, payload_max_size;
> -- 
> 2.34.1
> 

