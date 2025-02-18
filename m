Return-Path: <linux-input+bounces-10152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59DA3AA74
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 22:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79BF018840C8
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D269171A7;
	Tue, 18 Feb 2025 21:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcNvdbOq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3E1286295;
	Tue, 18 Feb 2025 21:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739912734; cv=none; b=ldDuZ1HSKLJLfgBFBkfdNQMLnem2a1fxBylGxypmHPq1VjsyMfYPil4OQ/mXe1EYYe/Dc5zxPwoVal5xun412oEU8vWW7PcE4HcTkqRg11jivUaby997yPirRpnC0rLFJEtPh67UTr2CP1QQAko/bOdGS8pW+el1DFrBGf4XnFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739912734; c=relaxed/simple;
	bh=f2KAeNcWioRJEebmT/6HJ0UgVFeEAG4JQ37rgRoHJhc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fCAXAvsszQyZU8TC+UgNaV0GRwO9ToeUcbCiAeFKZyRS+TxCr8MawhxM4D1Gs75DfDOF8F6YcDxcVFSAzSuk5PvgnxmzrpdG8R6kJHAyuf4xV2FFKLSV3kiXSlDBPnxbL4w1OdQMrOQbxDMHd3hEsitLucb0fuhTcWEjaGy/H6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcNvdbOq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB82C4CEE2;
	Tue, 18 Feb 2025 21:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739912733;
	bh=f2KAeNcWioRJEebmT/6HJ0UgVFeEAG4JQ37rgRoHJhc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OcNvdbOq+t90rYGTZSA2558SkUTd6ATv72ARxTbld5K82gRaGYzM2moDguWVqG44a
	 uk3+kLT0CZfusCGjo2jzhK6+MaIjJGyZ6lqkYuzydAAq/BCZwswU2HQyKAlYC7dnfU
	 W8CHierPe0LV7a0ABRfG6uMv8Wy5p1JZas6lHrdsalHEXzLIZo7FJhQD45n4wlVD6L
	 zJVsYuLHRWv0m5WjnZifpQSJbXwNGWJaZGDNVvuzpSHR5MMYmmUO2nB+Nv6lKPJdA+
	 tiJvSabRnMDef/DCHnPyCHkG8ay2sLKD7XdxJ/ej6cWzIWmBOvSDlvVSrG3zhgjHS6
	 devpP6C8KyQAQ==
Date: Tue, 18 Feb 2025 22:05:30 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: =?ISO-8859-2?Q?Tomasz_Paku=B3a?= <tomasz.pakula.oficjalny@gmail.com>, 
    Oleg Makarenko <oleg@makarenk.ooo>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: hid-universal-pidff: Fix spelling mistake
 "sucessfully" -> "successfully"
In-Reply-To: <20250212122347.495701-1-colin.i.king@gmail.com>
Message-ID: <q516nr37-79n9-8267-29o3-03r3s3oqs945@xreary.bet>
References: <20250212122347.495701-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Feb 2025, Colin Ian King wrote:

> There is a spelling mistake in a hid_info message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/hid-universal-pidff.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-universal-pidff.c b/drivers/hid/hid-universal-pidff.c
> index 5b89ec7b5c26..001a0f5efb9d 100644
> --- a/drivers/hid/hid-universal-pidff.c
> +++ b/drivers/hid/hid-universal-pidff.c
> @@ -104,7 +104,7 @@ static int universal_pidff_probe(struct hid_device *hdev,
>  		goto err;
>  	}
>  
> -	hid_info(hdev, "Universal pidff driver loaded sucessfully!");
> +	hid_info(hdev, "Universal pidff driver loaded successfully!");
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


