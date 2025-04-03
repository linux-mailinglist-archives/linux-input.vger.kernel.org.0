Return-Path: <linux-input+bounces-11489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B5DA79C21
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 08:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 036911731E2
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 06:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CA71A23B6;
	Thu,  3 Apr 2025 06:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJu6QJgW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A59190477;
	Thu,  3 Apr 2025 06:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661999; cv=none; b=XAUe+geRr0dDV03iMVKyMO225ef3rDtxSwJCedKMQZr5FucBcOXLs/82yGmYL+k7MBkUhJGihDONR8yGG4XWptezERzqYW9DkdMJUREqNZcLVveDSVQIkbettBovfRSAvwhfJTRG2GJ4vsRXPGumQwyv5KubU4Q9CL9r9F7eRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661999; c=relaxed/simple;
	bh=a791Ijrj4pxHIMDg2yMK6Vitj1r+VceYdbEDTVe5/A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwJQ2YMg6O2kM2rdHHa4R1vr2SmnWRgjM+Rm/HZGsLDazSLoihk2BHPWwlR1GqcHPrCrNbQyS2mVJOmXVQJEOSt7y1/Osr/6y4WP2+Dep+KiwGGOoWOt+ZwoZJBGqWVgaj8Zb9rcbvPA2gtfMPbg9RYb3hK75tQhdyBWiS8kChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJu6QJgW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F83C4CEE3;
	Thu,  3 Apr 2025 06:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743661999;
	bh=a791Ijrj4pxHIMDg2yMK6Vitj1r+VceYdbEDTVe5/A8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rJu6QJgWYL9WFNVdajsNsrLzLm7FW+H1Ikd8jh5JYpgIRkXWUodRdIPFx3MpV/cdh
	 ipDXi4FrROjgpyqKDUxz6SSchMaIPAmX+HwpnKA/TYBO116Z2XMqlnXKVC2PHEahh3
	 TRCrHwxqiMB2BmOnfi9tmROfQO6g5bkL1eELg4lpZl1Q9Ovp/nyEQ0RNoEwWY5wtC4
	 dJX2+3fsvuiu3KKXYfQmH1ljOejAd18F7EgwgBDY0VPlbQWVlv9p7mX2WdimBseuUf
	 QhFQ9vPD3u14uiYect9zUo5uXofWle8riAO+4wxRT2r1HHDke6G60rDN7DUTwEgUG6
	 ToeE42DDL0vvw==
Date: Thu, 3 Apr 2025 08:33:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Vincent Huang <vincent.huang@tw.synaptics.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 1/7] dt-bindings: input: syna,rmi4: Document
 syna,rmi4-s3706b-i2c
Message-ID: <20250403-savvy-inquisitive-tamarin-9c14cd@krzk-bin>
References: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
 <20250402-synaptics-rmi4-v4-1-1bb95959e564@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250402-synaptics-rmi4-v4-1-1bb95959e564@ixit.cz>

On Wed, Apr 02, 2025 at 08:44:52PM +0200, David Heidelberg wrote:
> Mostly irrelevant for authentic Synaptics touchscreens, but very important
> for applying workarounds to cheap TS knockoffs.
> 
> These knockoffs work well with the downstream driver, and since the user
> has no way to distinguish them, later in this patch set, we introduce
> workarounds to ensure they function as well as possible.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/input/syna,rmi4.yaml | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> index b522c8d3ce0db719ff379f2fefbdca79e73d027c..855614718bfd1c6c41805d64e713cf5635c20f10 100644
> --- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> +++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
> @@ -18,9 +18,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - syna,rmi4-i2c
> -      - syna,rmi4-spi
> +    oneOf:
> +      - enum:
> +          - syna,rmi4-i2c
> +          - syna,rmi4-spi
> +      - items:
> +          - enum:
> +              - syna,rmi4-s3706b-i2c  # OnePlus 6/6T

Drop i2c suffix.

With that:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


