Return-Path: <linux-input+bounces-11974-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E6AA9A9BB
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F37655A5AA4
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F65221269;
	Thu, 24 Apr 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRlNWegz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A721CA13;
	Thu, 24 Apr 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489696; cv=none; b=nzv61VOJzyxuivTGgFWyvO0oOKBLAp326JUsK0RXnE+776IpOqDGO3EN4zxgTPvnNp9F71dcDZUBW/WPaGYpnuP0j/YrvD05mjX+O+BukcTCCh42Pw8dva5qZ+xe6LpxBWiR6KDe5fX8O0FzIANcdG98GpuCcPXlluFRkqRNicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489696; c=relaxed/simple;
	bh=E5UI0CVSy6DoDprHrksDqyZf635QWcYPf5CaMvXPIrc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CRIvigIyo1YzXfAk5eBr2U5UmMNRPUwzWJbKSxnL/zX+7TdQJU+ipvFRmGMy8CLao0b1m4LjU1M3bL70nfA+/jGEXmellF2bUZyjXNTiw+ngnwQF0BidZtAJeNGkcvoywuFB1tqjiiaPQ8w/QFcqQhvKJIc8AoThPsH0Pk4sR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRlNWegz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254ECC4AF09;
	Thu, 24 Apr 2025 10:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489695;
	bh=E5UI0CVSy6DoDprHrksDqyZf635QWcYPf5CaMvXPIrc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lRlNWegzoqapSfpLgg1akO8Z/vOBBihVc1VP373ssjBiKfpF0dLuOjkWv6fP7JpCI
	 AKlya5f+R0r20GFrRQMVZ2icUhCUFevgvsRSb9z3Eye15MCr/lt8DgMT8++lVj4PnX
	 vP59sSL5Zz/pgEGrPwCFz8Ov5HDrYXJAaXmUJi8rcMcO/n827jHjlYxFOTI2vpWAZA
	 f/cxDVmEGnTWjXm4ZqF12FraFJ17wq3sljBAnnMCj0sbzLnWd91GgrbYWYtVuhLOte
	 8Awy6esl7kxprcJTW+ATaywYgi8UNGnOPrH7ZCImQifCKcD+4KgzXGVlj2ziUGs3Hn
	 lTHEFAg7lL6MQ==
Date: Thu, 24 Apr 2025 12:14:52 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-thc-hid: intel-thc: make read-only arrays
 static const
In-Reply-To: <20250402112129.410320-1-colin.i.king@gmail.com>
Message-ID: <r2p8863o-795s-851p-22q8-1082r2rq3rq1@xreary.bet>
References: <20250402112129.410320-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Colin Ian King wrote:

> Don't populate the read-only arrays frequency and frequency_div on
> the stack at run time, instead make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> index 4fc78b5a04b5..c105df7f6c87 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> @@ -1121,7 +1121,7 @@ EXPORT_SYMBOL_NS_GPL(thc_port_select, "INTEL_THC");
>  
>  static u8 thc_get_spi_freq_div_val(struct thc_device *dev, u32 spi_freq_val)
>  {
> -	int frequency[] = {
> +	static const int frequency[] = {
>  		THC_SPI_FREQUENCY_7M,
>  		THC_SPI_FREQUENCY_15M,
>  		THC_SPI_FREQUENCY_17M,
> @@ -1130,7 +1130,7 @@ static u8 thc_get_spi_freq_div_val(struct thc_device *dev, u32 spi_freq_val)
>  		THC_SPI_FREQUENCY_31M,
>  		THC_SPI_FREQUENCY_41M,
>  	};
> -	u8 frequency_div[] = {
> +	static const u8 frequency_div[] = {
>  		THC_SPI_FRQ_DIV_2,
>  		THC_SPI_FRQ_DIV_1,
>  		THC_SPI_FRQ_DIV_7,

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


