Return-Path: <linux-input+bounces-14867-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96331B86D30
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330171885041
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3EA2E03E0;
	Thu, 18 Sep 2025 20:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3gycq6m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD74E29A9FA;
	Thu, 18 Sep 2025 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225888; cv=none; b=ij+PGOZRDBqppqva5Wsnv83olbOYtoHGMq8BVka34+xMGxs+uBfUIBB6jTEbHApPKF04f7jFqqUa28CayIDoHsFZS35fTXVigv59nESmN43GV5Ri1IBdWuT7hO5t4EYEH6TZh3UcE5Zwyp80pm5JVXScMM7YzXEboTaebNvIfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225888; c=relaxed/simple;
	bh=hhwYTBmp+pjaSqd4spdmGudLCrYSc975lpbw5uyePwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PALkFsRzY/frXTWb7nyIR+IyyvDaY9b7Gk81k16hw7dGoOP8MsEDPv5V/MOf8tSUgNNkhRtWb7Jw6gBK4t6xltym2aRKeL4yaiGkIB7jCVgj7HUCI19kChNR+4XPTDW+ypBQ29VFXXW8I5TAl1Oj77yu/meAej9AWrR0sdjfu+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3gycq6m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D37C4CEE7;
	Thu, 18 Sep 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758225888;
	bh=hhwYTBmp+pjaSqd4spdmGudLCrYSc975lpbw5uyePwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t3gycq6mJofxibO0U2iRDhAci69cXomXZ0G1dtcgE8LcIQoUlzuRhxgG47hnxA9Jv
	 gJtwpCLRjvwCFosm9tK8z+ZIPId23GmCul6XOhSGahWUWY6IlDSaKyXU+msmlil4L/
	 UhRd+o1ujZ2P/a+okQcGOC+xBXpjpzeartZAv03osvaV967GXJHe5vChkcn8366Y1v
	 4wSfMDw82ixekA/hzxeCeMEVFvOohnysnR/zR6IqeYqLePRsk3XQXYmOiNgKdKVhmJ
	 znFqcj7+iT8KEdKwS7WFx5zAF4aYezEdTrAngn4yU3lwieGsDKX8pEEMyrTUMIA3JJ
	 N1ZJHNRzx6p+A==
Date: Thu, 18 Sep 2025 15:04:45 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v5 3/6] dt-bindings: touchscreen: add
 touchscreen-glitch-threshold-ns property
Message-ID: <20250918200445.GA2529753-robh@kernel.org>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
 <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918155240.2536852-4-dario.binacchi@amarulasolutions.com>

On Thu, Sep 18, 2025 at 05:52:31PM +0200, Dario Binacchi wrote:
> Add support for glitch threshold configuration. A detected signal is valid
> only if it lasts longer than the set threshold; otherwise, it is regarded
> as a glitch.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> ---
> 
> Changes in v5:
> - Add Acked-by tag of Conor Dooley
> 
> Changes in v2:
> - Added in v2.
> 
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> index 3e3572aa483a..a60b4d08620d 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
> @@ -206,6 +206,10 @@ properties:
>  
>          unevaluatedProperties: false
>  
> +  touchscreen-glitch-threshold-ns:
> +    description: Minimum duration in nanoseconds a signal must remain stable
> +      to be considered valid.

What's wrong with debounce-delay-ms?

