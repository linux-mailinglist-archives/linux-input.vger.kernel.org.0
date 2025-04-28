Return-Path: <linux-input+bounces-12025-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AD7A9E9EC
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 09:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240E818925F4
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 07:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DD02209F5A;
	Mon, 28 Apr 2025 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZCqHxsO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF91202C38;
	Mon, 28 Apr 2025 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745826362; cv=none; b=Hv0O9VMtqQVRw4ThLWLWwV3GjBAUiB9iLqyFxRbmh/UR40oh3cQ3PYRZkNd6z4/n2QfRwc6wkRYVBdXbjKAQynm6ZBMQEhA/edYhM5WeKNoibKUjs8B9m//EVz4D0MMHoNzpeVgz53cFWNojoxVhexTthanqs/S4Io4OfJZ1clI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745826362; c=relaxed/simple;
	bh=EJbGodDqIP+tS3Kofqbo9nkkax/3cglXQM+EtLKvhdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3WAx7yQAkShRRjGaRasoxT0y/5anCRXtznXLfodrwzalHrx6ldyAvaBjOGmqpO2WjzYfKOta1l0yEKnf90HBMHKI5E2pXXkEd4dYyNtmo4TsPnMapQXUWYviBWhoPPivsm8C2xojlrZxcZAAWGG1GnLPT0H66JVrpSR9hjeK3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZCqHxsO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41701C4CEE4;
	Mon, 28 Apr 2025 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745826361;
	bh=EJbGodDqIP+tS3Kofqbo9nkkax/3cglXQM+EtLKvhdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZCqHxsOpKLL7LqfIX1oQLe535edU2oSuet77hgRK0mAo7KbyrmicShQRMFdErpoe
	 0naOp796dVkdc8FIUEWY67KyJg+rP5U6+FqfME3yqBYu8LCJyL1Hw5RvcS2xQbRGC0
	 QEF++kH5YoADzdWEsiS4Gy7DFFFHuGy8F5YmA82I7jqTcUmGL5QRN6kpNhwOZIpY9z
	 Yt2X92zB8JYkrbdjWS1GxTJTjumut69toiWOXTm6rBJvai0Q+6PYfHwScgvmUun+4W
	 uzyLkjMu9HoxanFkGv8EvCphGMXceqYuGWCbXzkba5OKPsmgC+nDm2toyh0vegI00t
	 reZLECR7HTgdA==
Date: Mon, 28 Apr 2025 09:45:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Esben Haabendal <esben@geanix.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
Message-ID: <20250428-logical-successful-spoonbill-cd1c6b@kuoka>
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
 <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com>

On Tue, Apr 22, 2025 at 05:15:02PM GMT, Esben Haabendal wrote:
> This should be added for boards where there is no pull-up on the reset pin,
> as the driver will otherwise switch the reset signal to high-impedance to
> save power, which obviously not safe without pull-up.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252ea5c573068a46d4aa 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -45,6 +45,10 @@ properties:
>    reset-gpios:
>      maxItems: 1
>  
> +  no-reset-pull-up:

Is this common property? Where is it defined? Otherwise missing vendor
prefix.

Best regards,
Krzysztof


