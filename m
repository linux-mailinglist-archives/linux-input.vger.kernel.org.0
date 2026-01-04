Return-Path: <linux-input+bounces-16784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0BCCF16B6
	for <lists+linux-input@lfdr.de>; Sun, 04 Jan 2026 23:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE9230084CE
	for <lists+linux-input@lfdr.de>; Sun,  4 Jan 2026 22:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C94323EA95;
	Sun,  4 Jan 2026 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fHCSafGj"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AC11DD0D4;
	Sun,  4 Jan 2026 22:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767565836; cv=none; b=t0TpE6CeZpNQj6rBahzJiNKYZ5MV1gcK9+BCkwQa0Z5OqUiZam4OZG54e8TjpawG0Yi//SSvUlmKgZYsLdC/D7Vqx3ZmU7H4BQ840SUKjv8pdeZlXj2VXupHcszZWJDhEbqwL3DNIsxIzvwzfmaQSC08gKL9tJnWXLGDmGWG/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767565836; c=relaxed/simple;
	bh=7j7iz2URhz+LpjEMX3u8HWmW3953oHzGCoUvP3xzsRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jei4V6e+PaYEtvCnFGZpt732tPtLMzEFfdeh4/Gb49pVc/ux1BiFZem448IaPrEbmc87AA281cXfQJMgRMj5A6VAv47LKzm7an2nVUZ8Epy9kuvfPpV0TINVsDnJf3Fw0IB9xw2h8sAbSrQz+mD3E4fWY9Qq5L/10zuTrfpyZlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fHCSafGj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=TcOxMQmm8wqY+5S5LE3GTQ0FMOqnbI/VKjrZ/iGv0CU=; b=fHCSafGjz0yuacXYBLps2sWK9O
	Vvk8CZqogRoGhjMRIIJNLVAjphkkb7J8ZKrWYQ2e63JRbXapMFLYmLBdl8FrgG8y71vw9TyOdxPaZ
	t/dDhsJynFoKQqm20pxCCpbJcg90qWZ99SUmENSDZgIBK5mIBa86ZyMF3uq2BOlHADAnw4fSs62sK
	vyL2a43QrBY8dmf2FYUrLFXSq/Qmm3yPNSzKXCnSLQZE4ztqlEm8XewYE5fACqs1PADUYWZhEz2qd
	tPb6tAM8O3po4PbqeP21hPrkUuLnrFDGDyhLb86WKxtu505IjHOBqszGtjW2Fxtm05+1fBUtNE//e
	/gqHS8pg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcWcK-0000000AWMh-1APx;
	Sun, 04 Jan 2026 22:30:32 +0000
Message-ID: <59a7579b-308e-470e-aabe-a161210dcfe6@infradead.org>
Date: Sun, 4 Jan 2026 14:30:30 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] Input: Introduce EV_BTN event for generic buttons
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 dmitry.torokhov@gmail.com, corbet@lwn.net, jikos@kernel.org,
 bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, vi@endrift.com, linux-kernel@altimeter.info,
 peter.hutterer@who-t.net
References: <20260104213132.163904-1-tomasz.pakula.oficjalny@gmail.com>
 <20260104213132.163904-2-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260104213132.163904-2-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi--

On 1/4/26 1:31 PM, Tomasz Pakuła wrote:
> This will be used to fire generic button events that only transmit
> button number and it's value, not related to any defined usage.

                    its

> 
> Made for HID joysticks but could be adopted by other devices.
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  Documentation/input/event-codes.rst    | 5 +++++
>  include/uapi/linux/input-event-codes.h | 1 +
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
> index 4424cbff251f..c387eaa63dfb 100644
> --- a/Documentation/input/event-codes.rst
> +++ b/Documentation/input/event-codes.rst
> @@ -59,6 +59,11 @@ Codes section for details on valid codes for each type.
>  
>    - Used to describe binary state input switches.
>  
> +* EV_BTN:
> +
> +  - Used to describe state changes generic, numbered buttons without defined

                              changes to generic,

> +    usages.
> +
>  * EV_LED:
>  
>    - Used to turn LEDs on devices on and off.


-- 
~Randy


