Return-Path: <linux-input+bounces-9005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2EA04A26
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 20:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D61893A639A
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 19:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE171F4E53;
	Tue,  7 Jan 2025 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtVXuCi9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DF1F4E22;
	Tue,  7 Jan 2025 19:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736278022; cv=none; b=aQevjYzK7AniRLsnPYLYNzUgj6dsauZJtURltV51FPd291rmkvCcE6K3PLleBb3jIxhEHF34vdV/m1BBTNVV7p7wgKqc+TmX5sNXzW9rM510kkbYi0TYet2PQjN/9RER3y8UR5zzzYMCMgAR8Yn5LV7KhSATw+i9opXQ5Kpn8V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736278022; c=relaxed/simple;
	bh=4IKqvdMIZDZIS+D9SQaeBAeVsiD+6/nYO3iABXjBi6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVgGrV0xjHAtKa9QJkXP45+xgLz1Dv91zgujcCRaesCL5X8K3qavIu8tBh8eKjFErTucukvEk1fmWKU8yzyTTNz/pnofaxYg2UwnT991T4x8vDfZH/uodC8WetocXk3g4+R2Ndw2/EC7Sbal1824XksLMR13E1gX54f5NgDjZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtVXuCi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E968FC4CEDD;
	Tue,  7 Jan 2025 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736278022;
	bh=4IKqvdMIZDZIS+D9SQaeBAeVsiD+6/nYO3iABXjBi6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WtVXuCi9yOY/fN4AMsjc3gNyGNCepn5gra8i6KuKeXNjFE+lkfbVFElY5nbAFG7GC
	 qKtz+bJxd6Er7VJj7E48zgfvX0H1HhHeMDaMXkMukyKaTfbIqtOov5S7jDFcVrVOSH
	 R6bmgWS8BIMd0VQCaU7/3ypnmy5DnEkyicI1u/rFPuD9Az/ifcAMuFbMvRmtixlckh
	 GFT57GGTrhlGR+MTTiLtBxzVtlTGv217mPclWkYutJWjQ/WMy/kEju+9/rk1aIYB/y
	 H8DA0pTrvsHMA4J2whTGwJroVhAxkls2Dhuu3wlxL9OLGaoJC7AG5vZFzMbOx4MlXK
	 X+R/Jx2abZzQQ==
Date: Tue, 7 Jan 2025 13:27:01 -0600
From: Rob Herring <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <20250107192701.GA1329697-robh@kernel.org>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107135659.185293-5-markus.burri@mt.com>

On Tue, Jan 07, 2025 at 02:56:56PM +0100, Markus Burri wrote:
> The property is implemented in the driver but not described in dt-bindings.
> Add missing property 'gpio-activelow' to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 75975a1..b10da65 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -38,6 +38,9 @@ properties:
>      type: boolean
>      description: Do not enable autorepeat feature.
>  
> +  gpio-activelow:
> +    type: boolean
> +    description: The GPIOs are low active.

Ideally this should be defined correctly in the gpio properties. The 
problem is that does a 0 flag value mean active high or I forgot to 
define it. There's a similar issue in spi-controller.yaml. I *think* the 
problem is better here since this is an active low boolean rather than 
an active high boolean.

Of the users in the kernel tree, only 
arch/arm/boot/dts/ti/omap/am335x-guardian.dts got this right.

So I think we should mark this deprecated and put a note to use GPIO 
flags instead.

Rob

