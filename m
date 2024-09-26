Return-Path: <linux-input+bounces-6772-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBFD9878CA
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 20:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C47272832D6
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB62D158874;
	Thu, 26 Sep 2024 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+MIckp0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA01A702;
	Thu, 26 Sep 2024 18:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727373697; cv=none; b=bRn+rk+e4J5QVT0Z4DkWj4u/Ox4UTwY1O4bIot1cYpxrVj/5D/Ry/y9umOHfr+a/CS5jwoKsdRYqaMryKu4K0LomDWHepVlr9MH7UGuKRSxgBCVQM78+ZTbYYOJBuTBUZD1Vw0B2eqvlN9askBijGJO+YpigUvT7gaeoCqxnuwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727373697; c=relaxed/simple;
	bh=TFnpVbO9kLbZVjk5/aPheAFT/pdm9LsYlblLnlvukd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b2O88zfZS5FI7yd6OgcVXpTDY6ohxmT8cQj78FHya9Gw8f1X+gxPZQuqXO61eaqo7y87K9Fk4ER5nJsijqXN6Dm4Xu0R9dxdNoUxewzXKe2cGfIpUYhep5lBcrH8r7U/Y9Zwwi622MIknvGZbs7UbTWyuU44+tQ1wFZ0PNBHVus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k+MIckp0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5E3C4CEC5;
	Thu, 26 Sep 2024 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727373697;
	bh=TFnpVbO9kLbZVjk5/aPheAFT/pdm9LsYlblLnlvukd4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k+MIckp0OA2ob5Uw6EWhQ7SBvfgK61kQpbilpRv4C6pVk3+MlPH6JKk7MBXZy+txJ
	 a+1Z3J+4eUFPyGkIsoZTPcWXFfIuotv4XiOfG/uTVW8C+0o+qvJKGmmmYveIJ6tnCZ
	 T2bKjYJWCBZzL7cCrHLUDave7spmmI2XzIzvQvkm+sz92bkuBga8WXsxFGV1VZdT04
	 1ffWhU01sVlOneCtvNP9pVD5T8wB8dzqAqntdrbhhi7NPeUxSa02IN6ZZRPncKvHwC
	 Q3s4YaMWu3WTQx7ThqzYI6e2IgrG9fwnYEiIH7PNmFRUSxwM0MpSry/3MzmGMuUNZa
	 AqaibjRkutFbA==
Date: Thu, 26 Sep 2024 20:01:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Charles Wang <charles.goodix@gmail.com>, linux-input@vger.kernel.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: input: Revert "dt-bindings: input:
 Goodix SPI HID Touchscreen"
In-Reply-To: <nycvar.YFH.7.76.2409252306420.31206@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2409262001220.31206@cbobk.fhfr.pm>
References: <20240925194921.18933-1-krzysztof.kozlowski@linaro.org> <20240925194921.18933-2-krzysztof.kozlowski@linaro.org> <nycvar.YFH.7.76.2409252306420.31206@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Sep 2024, Jiri Kosina wrote:

> > This reverts commit 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID
> > Touchscreen") because it duplicates existing binding leadings to errors:
> > 
> >   goodix,gt7986u.example.dtb:
> >   touchscreen@0: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['goodix,gt7986u'] is too short
> >         'goodix,gt7375p' was expected
> > 
> > This was reported on mailing list on 6th of September, but no reaction
> > happened from contributor or maintainer to fix it.
> > 
> > Therefore let's drop binding which breaks and duplicates existing one.
> > 
> > Fixes: 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID Touchscreen")
> > Reported-by: Rob Herring <robh@kernel.org>
> > Closes: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I've applied both patches now and will expedite them to Linus.

Both are now in Linus' tree.

-- 
Jiri Kosina
SUSE Labs


