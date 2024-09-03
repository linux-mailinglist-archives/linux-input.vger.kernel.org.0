Return-Path: <linux-input+bounces-6090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5335969C26
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 13:40:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72EE9280994
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 11:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90E11A42D7;
	Tue,  3 Sep 2024 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iibFK2d/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14031A42CF;
	Tue,  3 Sep 2024 11:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725363580; cv=none; b=Ob6zSYEXwqvPnbxbZHfRth/O7RNNXzKiz04nq76hRNbSZllSHPkE1EPtGOpywmgsfheR8IRqZ7fV0F9jBpTFY71mFZ9nuBBW/LHpNfWdpyDMjWSlPne8LLfp6qV4PpEQU37rYw+OnBLzh0Y8yGu4d5pzCoVce/5GmnecJhIb6rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725363580; c=relaxed/simple;
	bh=EssRZidkPY/Pg62sztnKSI+A+HzJf2rF2rz0IHtNeps=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XgNlAswNKsyhuR599mNCPL9RpstxV5TWiNJcLfmC+zM4bmdzyWjXDx7JgkKgLnlFcG+4Y4/SieMwMkewYEin7fekqoIqm320yKZolEnPUaH9khc7PwWM/msfEzSegL6EjVOkUzp5B4wbxe0JN3BExpjyp4pSd8GdCSZOLQIchTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iibFK2d/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E6F8C4CEC4;
	Tue,  3 Sep 2024 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725363580;
	bh=EssRZidkPY/Pg62sztnKSI+A+HzJf2rF2rz0IHtNeps=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iibFK2d/7GjoAJK+Gkv8yD4hGNYD6cQk9QIAfhNjtUW7uzqmz/D8pVZsb0UWAQUzY
	 UQ811n25FoQUMC4taNmcseHz8fuxppd5iwt/CGuAf28fusLngTXNJhoOW2nlTLd/yv
	 fxNgVaT5xRGlksOEDdjoqpi9vJA9/W64/X+gb2A38wjh/S0gikz8gmx2LzsoIKi0Xs
	 e91Q2c0Og9U6uUoZBZYsuwxsxzubumX1uIL+11fvLYcnzfwWkB/i77u54S3stH5gD2
	 br1RJNP7zMdj2pQSOoDVu3VwiQH1DsIZYDoH5sTzINOmiI2unffAkL6jyfsMY67Xva
	 /LxgG4EnPMhMw==
Date: Tue, 3 Sep 2024 13:39:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
cc: basavaraj.natikar@amd.com, bentiss@kernel.org, Shyam-sundar.S-k@amd.com, 
    mario.limonciello@amd.com, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: Convert comma to semicolon
In-Reply-To: <20240903024402.493709-1-nichen@iscas.ac.cn>
Message-ID: <nycvar.YFH.7.76.2409031339330.31206@cbobk.fhfr.pm>
References: <20240903024402.493709-1-nichen@iscas.ac.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Chen Ni wrote:

> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> index 621793d92464..db36d87d5634 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
> @@ -299,8 +299,8 @@ static void amd_sfh_set_ops(struct amd_mp2_dev *mp2)
>  
>  	sfh_interface_init(mp2);
>  	mp2_ops = mp2->mp2_ops;
> -	mp2_ops->clear_intr = amd_sfh_clear_intr_v2,
> -	mp2_ops->init_intr = amd_sfh_irq_init_v2,
> +	mp2_ops->clear_intr = amd_sfh_clear_intr_v2;
> +	mp2_ops->init_intr = amd_sfh_irq_init_v2;
>  	mp2_ops->suspend = amd_sfh_suspend;
>  	mp2_ops->resume = amd_sfh_resume;

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


