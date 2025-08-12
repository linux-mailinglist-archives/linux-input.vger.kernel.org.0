Return-Path: <linux-input+bounces-13943-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 647B4B22779
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA394277A4
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA021265292;
	Tue, 12 Aug 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LdiRU8zZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7C41EDA1A;
	Tue, 12 Aug 2025 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003147; cv=none; b=T1nfWpUSG4x6VWK0zIPPbxzeoZGo2KJppVL1y2+OGupYSniEvl3NK4F03DPgCVDty7nJNRTOH2ALV6ANk5e5/L47styESqhwLLanp1vAhjGhvrDuEi+nl4dXhxWKOme23oLc6y6JFMjiTdNhXltOq64GxWG6iAqqUDIhFOY7xuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003147; c=relaxed/simple;
	bh=f0T8Ag8vf/uQzW8aci3/qT9iK0umABX1JBMbSF1X4Sw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J9dwHaBpxKpEhgSHoh5ioKWQyEdF33JHmNnaX2QRBuKo/eEAEwiCpBlrxn+8n40wtSpxR7nAyK3aIOAiGWqFl9HbENQKf++rtvsiBzQOVVscbzbojXU8EM2+hgaIFwJkP7X1pce2M4tbQxO/49C7GchQZFYvSEDjPOOfPRt99JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LdiRU8zZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED26C4CEF0;
	Tue, 12 Aug 2025 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003147;
	bh=f0T8Ag8vf/uQzW8aci3/qT9iK0umABX1JBMbSF1X4Sw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LdiRU8zZ2OETWZIVd9d5v0Yzk65rc31o7uBEAlt8qVisDwuUcCEFwMnZJYxfZT7Pt
	 mqP4WbNuGPBNBxxFg045EuZMEBLmhc9YaWmlh2JIx5j8NwwOfkKED4FzPq9+w9Eac1
	 B7d6nbK/Gd9hNgHuzbloCL0/3XQGHgRoddSNND0DFTxcZNGmld10ejo6bqNyW6XIhN
	 YY+zv+gYVrD4DeXZfjcxmN74vUKwQaGnbGna6spQLn75kZyRwToNm6XBkk0bwu4eQH
	 Rot8aHq9fn3pGcOq/GIOa1UaFxjusUOVzDCoNH7voC+h1YUEQMBp7JVbjl3xuRPcVL
	 S5S2nPengPtzA==
Date: Tue, 12 Aug 2025 14:52:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: Kconfig: Fix spelling mistake "enthropy" ->
 "entropy"
In-Reply-To: <20250724111118.141114-1-colin.i.king@gmail.com>
Message-ID: <25rs7454-spnn-3214-3817-np009o98s5r1@xreary.bet>
References: <20250724111118.141114-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, Colin Ian King wrote:

> There is a spelling mistake in the HID_U2FZERO description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index a57901203aeb..79997553d8f9 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1243,7 +1243,7 @@ config HID_U2FZERO
>  
>  	  U2F Zero supports custom commands for blinking the LED
>  	  and getting data from the internal hardware RNG.
> -	  The internal hardware can be used to feed the enthropy pool.
> +	  The internal hardware can be used to feed the entropy pool.
>  
>  	  U2F Zero only supports blinking its LED, so this driver doesn't
>  	  allow setting the brightness to anything but 1, which will

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


