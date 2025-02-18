Return-Path: <linux-input+bounces-10153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A172A3AA82
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 22:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38A7F18853D2
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71E517A2E2;
	Tue, 18 Feb 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTL/S73e"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA552862A2;
	Tue, 18 Feb 2025 21:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739913019; cv=none; b=XHS+POn764YOsCORfmlNsuoTmIzpuP3sJGBatmWxkB2f4TYsaBHpuRdgUCMgKzusoqNr2boMk6HTDbLYY6eHD5UeCg8z/gIdWJaqAeLULxnl0tXAjR1Cao5vdhvBV7XiMA+7f38n3vjRKGhEvT3rutfq11lxUlwxKWF4BTSVVfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739913019; c=relaxed/simple;
	bh=oz7oiHSEP/O/Vfsc3/sVaySbaE34jzNYdVh8P/aTyyQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oUZVaXBPY39/cijUcnFnGbg9Z3IbpP7cp2IVhJFwVFUrH0rwAKCTAmG24YVh2cheFJCZKiMkWKfHrwubdfUQAfpc+3bHJbJn+ohH1+7j5mbf2k9/8Y3dtdzV1o1m3+iz5CSM/hGOqXfVvqOduBZ1A2QMeJrA8wDRfh0uNUPlMlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTL/S73e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0E6CC4CEE9;
	Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739913019;
	bh=oz7oiHSEP/O/Vfsc3/sVaySbaE34jzNYdVh8P/aTyyQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WTL/S73eYNTPh76wLr0sqP2y1yzAhmEcFKnRHhPhGIWb/veRsvcudTkV2jAiso1EW
	 mUhplUTsJuSMQl+8hACiMBzgyOzY4cFkJRbLMwlLKQ6KNdDVmF2PCJwYQ2e7K1uVaR
	 eAIAFUWu/VQ1WN/fR4k8sTbY7TTXlxVPLWP+fbe9+pefy2SAn6g55oNQy7ukt2IpbN
	 /jwcMAldjsqT2ZAuMpuPPZDBjYAm6cNtAqUzb3aPN/3xphB9aOYr1SBXsV5AoNElb5
	 Kxix+lKZQNperOl+wdbqUa23kkkM5G2BsgfLQI41nl/HKBNQGkApwi2AtVo2tU2lUR
	 EUwBzWCLUzxTA==
Date: Tue, 18 Feb 2025 22:10:16 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: david.laight.linux@gmail.com, bentiss@kernel.org, 
    srinivas.pandruvada@linux.intel.com, mpearson-lenovo@squebb.ca, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Hid: Intel-thc-hid: Intel-thc: Fix "dubious: !x | !y"
 issue
In-Reply-To: <20250213024021.2477473-1-even.xu@intel.com>
Message-ID: <04553pqn-2s4r-593r-q8pq-4s18q5380p9n@xreary.bet>
References: <20250213024021.2477473-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Feb 2025, Even Xu wrote:

> Change to use "||" to make it more readable and avoid miss
> understanding.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.com
> ---
>  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> index eb23bea77686..8f97e71df7f4 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> @@ -295,7 +295,7 @@ static void release_dma_buffers(struct thc_device *dev,
>  		return;
>  
>  	for (i = 0; i < config->prd_tbl_num; i++) {
> -		if (!config->sgls[i] | !config->sgls_nent[i])
> +		if (!config->sgls[i] || !config->sgls_nent[i])
>  			continue;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


