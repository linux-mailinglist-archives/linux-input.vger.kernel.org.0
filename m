Return-Path: <linux-input+bounces-14426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DFB4054B
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 15:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66994E7495
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 13:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6FA30C341;
	Tue,  2 Sep 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIho2e0L"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC67A2F1FC1;
	Tue,  2 Sep 2025 13:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756820634; cv=none; b=Puu8WT27ifxVXiKaRoyWiedmq8+I2satbnzpunUv/A/y9MAEW0nZoTdByQSO6W4kXemtG7YdyqZYsTnPpn2ICpVauPE2qnwviW2DYKILyTImJU9PbS09YE7J2cMossZIXy2r23EmpWjLZbix0H5FbJBK/+VAJJZcrql4gmAxa+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756820634; c=relaxed/simple;
	bh=RwCMBPynbs3OJ8fGMibLwlL7w44ypPVyoRps83C6zbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t5JdkLUf3sOjlt2JXiLUGf+M+3LTd6mw3GErnD4C8/IcTfutqnSfycKZFP0xN97l2sTN6PoR6CU1xsnzxgNvKYnjcZl1kmP+OznbfMUKPqw3EayFWpeFhP9P9xmE8LGJDggHzBLjpzGzHkPhKwIurlcW0cSz8VRETupTUF/it1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIho2e0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 415D5C4CEED;
	Tue,  2 Sep 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756820634;
	bh=RwCMBPynbs3OJ8fGMibLwlL7w44ypPVyoRps83C6zbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIho2e0LrJtdNoB0/Jhg9N5+EgoDsgsVgnsubzo8sr60qc7Df5uI+Q7TWo+o39sGC
	 3R8Nk6EzS2HJR7o4gsxfq98Hak1dCjhn+DP9hGY5diRhmARZvWUuGQZQAZjY7Z4xxc
	 ico1bqlnpES7oduVfOthQaTRvoWLD+n2UmLE785RalSpRVcb6+qYkOc5ONkxydgOSK
	 O687h/gko1Z38fnV3RQ91AdV4tWSrAhGUfvPIi2SQWrI72zelYVx4toJOjNrFIdadS
	 VRGQ0TaZryqiwsabfG9zJxyTadmxxG7YzLS8QoDfHGwGTIGujhmC5la1IDf4toboDn
	 2qKMKTMc1eqag==
Date: Tue, 2 Sep 2025 14:43:49 +0100
From: Lee Jones <lee@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] Input: mc13783-pwrbutton: enable other mc13xxx PMIC
Message-ID: <20250902134349.GQ2163762@google.com>
References: <20250817102751.29709-1-akurz@blala.de>
 <20250817102751.29709-4-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250817102751.29709-4-akurz@blala.de>

On Sun, 17 Aug 2025, Alexander Kurz wrote:

> All three mc13xxx types do feature two common power buttons while mc13783
> and mc13892 provide one extra button each that differs unfortunately.
> The common buttons are ONOFD[12] (mc13783) and PWRON[12] (mc13892/mc34708).
> ONOFD3 on mc13783 will still be supported while support for PWRON3 for
> mc13892 will be left unsupported for simplicity.
> Add the similarities to the header files for reference, extend the
> platform_driver struct with the id table to support all three types.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  drivers/input/misc/Kconfig             |  4 ++--
>  drivers/input/misc/mc13783-pwrbutton.c | 21 ++++++++++++++++++---

>  include/linux/mfd/mc13783.h            |  4 ++--
>  include/linux/mfd/mc13xxx.h            |  9 +++++++++

Acked-by: Lee Jones <lee@kernel.org>

>  4 files changed, 31 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]

