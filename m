Return-Path: <linux-input+bounces-14727-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 787B2B56D54
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 02:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2D11189B1DF
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 00:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E6F19F40A;
	Mon, 15 Sep 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvd3SOEk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10FC196C7C;
	Mon, 15 Sep 2025 00:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757896061; cv=none; b=lMzAr6uUBFH+pXAtpck+ZMox5So9mIBsLBtevuXRoET1j8TykTZebE7HYf68gUAnz9gbhNK75zCkb07U+G7fQoHmtq7lWrLiXYrVhxErheyElvi02SqL5jRsOoLvpYPrnHyJI95KU4bMXlYoLACL1rGhKWUXjGP0uU9Yn8Zi6LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757896061; c=relaxed/simple;
	bh=ZIFcHoaSWWp3DQJCIox2jskJxfvkeB9LoKZVgsK5c8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNDM5NbLNA6ZdTl6hdqd/mjd4R2BvC6Yv+nb1UwaZzCdzQtZzC1igz9SExcp569Aw/UNuw6f990jdhthILdzBesVcivSomeW1ZCUZB06QbI3XoJJWYQ60Bul4Xn9qyBdUysf9LHadaup5v1ObFnGw1QAVo04wUE0a2xF/uP68Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvd3SOEk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CBAC4CEF0;
	Mon, 15 Sep 2025 00:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757896061;
	bh=ZIFcHoaSWWp3DQJCIox2jskJxfvkeB9LoKZVgsK5c8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvd3SOEkAojJFnQ/5zpGO9T6dAvpQdur6xSQWBO6ew9S7i3Kv2FzlfQ3sViUD/+mI
	 GQq+QTXzs3EACi9u3778pBmsBnGkABERFkakvcbYdzOALLurci9kO7T4LLPAikI4cE
	 Uj69TF8B/3yXjvea0p87BzxzoB7ulzl4CZgeb9RVM3TJYaJXgPUf0OhP6YniGSNccK
	 ujmvXYNZQ20izavM+P84y1rwU9b6EH5lX3QNVoTvygmT5DSAzVEC8gRS6MtrB9ex4w
	 kAmeAVJJAQKOdLxir8/ELx0dYxVW7MlgAGFrPzBVrM+BYdAJySlsZO3RvFcn8Yu2a/
	 6ZUjhQcq2dyQA==
Date: Sun, 14 Sep 2025 19:27:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-input@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: touchscreen: resistive-adc-touch:
 change to unevaluatedProperties
Message-ID: <175789605966.2312485.3317752924558038291.robh@kernel.org>
References: <20250910224402.994046-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910224402.994046-1-Frank.Li@nxp.com>


On Wed, 10 Sep 2025 18:44:01 -0400, Frank Li wrote:
> Change additionalProperties to unevaluatedProperties because it refs to
> touchscreen.yaml.
> 
> Fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt6.dtb: touchscreen (resistive-adc-touch): 'touchscreen-y-plate-ohms' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/input/touchscreen/resistive-adc-touch.yaml#
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/input/touchscreen/resistive-adc-touch.yaml         | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


