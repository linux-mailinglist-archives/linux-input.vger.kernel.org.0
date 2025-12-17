Return-Path: <linux-input+bounces-16612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E67ACC6A05
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 09:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57D8E304B383
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 08:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF6F339868;
	Wed, 17 Dec 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UJgOsmoA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA1F3396E4;
	Wed, 17 Dec 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960846; cv=none; b=OKsmBaH1wmhPoPy5CGKNDbF6jS8zWkV+HnSDPAG+Dg4bdlKHvoavyYhNvWWmcn7chOn2kz3HV9+MO0mGfwT+oCOxbRTNxyrdQWKahQyu0b9KdTMqaFD/mV6gxgiiAnSHxpVVsHQdmfhd9pFmELmytSIrG5oz9nuEeJi19i8P5xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960846; c=relaxed/simple;
	bh=CkDKxaaXHLHll2UZdReeAl5FwPq1Qo6d+IkQgMDfWe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du2tYMk9Oqn8gZ1yzLPx0E+yODR706bUEuYwhJbN/ZKtovRD0gis+B7NCvzEC+37xkLIht/XkRqGVaYVIQaUJVwmgk1cq17ZmNM1JMhJLamCJgkA2AoY1o7qKGJ4pZdeJK8wTioR5USx5xSSBwkjx0GwhBx/ju3umjEP0HHMgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UJgOsmoA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBD3C4CEF5;
	Wed, 17 Dec 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960845;
	bh=CkDKxaaXHLHll2UZdReeAl5FwPq1Qo6d+IkQgMDfWe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UJgOsmoAStGf4jZUf0oJi3Tg0oJ2tkVYhGYgLIdetyz2oqL/SVPELs6QiVZ2v5Sfe
	 cw1eIBoW8dwnA1X99xR5cVRAJOGzxBKzzp3IowGawrMFlU8TbNCMXy/QVQbC2VfhYC
	 0wQTDO581/2OsGOinjopanTDsVsRdY67Rnbjzs8CX8NY1ncOOyAs3faioY5tjzumg2
	 0EdJQnq2t3r2csn92axBKftfpnfzuyU5IUnBr810Fa3zXDBj8ZTuEEoi7+mO3nzTxP
	 XyKvIWUkmfM9rC6lPKXfP4bf/EbZP0HpbGZrsmtn+Z+hw4DaN68mJpkFcSAjnVd7Y+
	 y5d5Dd/3BN9Fg==
Date: Wed, 17 Dec 2025 09:40:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bastian Hecht <hechtb@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: sitronix,st1232: Add
 Sitronix ST1624
Message-ID: <20251217-intelligent-herring-of-defiance-3753db@quoll>
References: <20251215212524.3318311-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215212524.3318311-1-robh@kernel.org>

On Mon, Dec 15, 2025 at 03:25:24PM -0600, Rob Herring (Arm) wrote:
> Add the Sitronix ST1624 which is compatible with ST1633.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/input/touchscreen/sitronix,st1232.yaml    | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


