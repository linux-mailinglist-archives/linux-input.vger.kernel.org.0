Return-Path: <linux-input+bounces-4793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C7191EBA3
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 01:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D73581C21C73
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 23:56:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2321173328;
	Mon,  1 Jul 2024 23:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WSjuTxX0"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366B3173323;
	Mon,  1 Jul 2024 23:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719878172; cv=none; b=nK6cs9gb/QoiBkZPSVIFtDVgKMVv3dX6TReNHHRRF035Vivf3C83JYFIxNsuAEpqVGXed/Yx7pODmGUlmJ0wEyIkr5zMWLYYmReVq/eBGK5cSzMycuv02zL4NQVbxbYcxT2ebuJNnI7f9P2ckbcAm/XFMF2TTJzSmJf//t91pAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719878172; c=relaxed/simple;
	bh=rt/hAUMzDFDlKHvDKnsth/BkPRLmcLyYD2ehnJe3O9I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZeIwk5bLRk/LD90Ptl/vy4Rk969HPgYf/s2zmTwwRkQPMRjhjJrlOjaCTesN0ftMG8VyHWzmU8bSKeQHxhLqr8WUATgXJL/DztnQK+TvahffRXRCXqqqgkZDfYWrZQgtU3TY8vX+2ro4hL7cJzUhrTKIm1bLcu+JXFLzDk/W7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WSjuTxX0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=I6mZeW427vjnexyv5h/Jiv+vURV2kWko5K33iEkm/S0=; b=WSjuTxX0ZXOwuwBpdLDk3cuYIm
	g3Z/G5Vn+ZboV/cvN29+ts09duKPo3kINLjdfaiJvWGO0vVxZtGDUBlZ8qtMWZvyi1ZpRWEicB/Ib
	WJ5XpVIvdVArcnAsXt+1UM9zp2ZxbQWnfcEWZz8rGSQNuA9x4tMFcrZL0i4n3Rk8u3+gw5M8ghekU
	qI1aeZ/1GIEssjrE/f3cUqaj5NYmxUeI7wu/Z1dgvEuDbEabe85FHJnDvrgBEk6rMi2SWuDNPeayr
	8uXFwAyfmhIdmy0pWDmfAV0X3yiD7D1q+p3t/ocEMpdfrDBsdYgY+9JGfS6pQ+AcZngiPUJUUO2Ko
	YLZNv3lQ==;
Received: from [50.53.4.147] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOQsQ-000000058Uj-1oY6;
	Mon, 01 Jul 2024 23:56:06 +0000
Message-ID: <c2ce9d53-1aa6-45ed-ba18-61acfb4b2a7b@infradead.org>
Date: Mon, 1 Jul 2024 16:56:06 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add libps2 to the input section of driver-api
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <ZoMQhkyUQYi1Bx4t@google.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZoMQhkyUQYi1Bx4t@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/1/24 1:24 PM, Dmitry Torokhov wrote:
> libps2 has been using kerneldoc to document its methods, but was not
> actually plugged into driver-api.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/driver-api/input.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/driver-api/input.rst b/Documentation/driver-api/input.rst
> index 4bbb26ae2a89..bd7a3578ade7 100644
> --- a/Documentation/driver-api/input.rst
> +++ b/Documentation/driver-api/input.rst
> @@ -40,3 +40,10 @@ Sparse keymap support
>  .. kernel-doc:: drivers/input/sparse-keymap.c
>     :export:
>  
> +PS/2 protocol support
> +---------------------
> +.. kernel-doc:: include/linux/libps2.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/input/serio/libps2.c
> +   :export:

-- 
~Randy

