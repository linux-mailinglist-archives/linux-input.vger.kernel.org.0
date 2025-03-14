Return-Path: <linux-input+bounces-10811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 305E5A60BFE
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF841898343
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DA5A1C6FF2;
	Fri, 14 Mar 2025 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JL72R7Ai"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D33176AA1;
	Fri, 14 Mar 2025 08:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741941847; cv=none; b=BgD16ul/Yusp213nMYseDlTOpeFDsXm2WI36yLavR8U694dwxldUmMhwS0hpLFIL2+ZzqtIUZDW3wcQrje5xd9n+jg8mR5eLnauZysk11++r+COdhUpYGTfiyRnGf/nxBESg0/8eGZiJvbo/PAOZSRCKoTcVMwgr0YmLlCkn5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741941847; c=relaxed/simple;
	bh=JXYrDLHDJIy4XDmVRAFtH3/Nw8vjHWHIqpI0umgJCWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I867IvZxsKIurQBxF9D0Zt5z7yHW4l4uV0U3n9fBRVEBoGk85AsK0/mRl8v26qsuz5gvZ2JVEFgRVTF8eAzxOesQb6zkPXw46Px8l2d4na2a+tOb9WOGwZyM9yEsw3/gbKed39oM1GiZjNe+Hu3aVuf1OSjO/6Jv+l/oGaUuuVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JL72R7Ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45932C4CEE5;
	Fri, 14 Mar 2025 08:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741941846;
	bh=JXYrDLHDJIy4XDmVRAFtH3/Nw8vjHWHIqpI0umgJCWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JL72R7AipakNKXRd8hpRg722SKXRxb9kH7fBuaLQffWloARE1UtElKLOXI3Q4KgZs
	 X4riQQdOrm39/Nroe50SPp6t1bsal/QkmM18EvvpUs0SuGaLOpB6PBxa5iTD1DH+ZU
	 lsesVtvqh8GyqGHa7n5Ag3J2KKmf7qcMzdC1GSNOkLw35/QfTomz8VkANOVka0p+pI
	 hwRW03LNfMaH+VmlXDV8WIEVrITA6u29xXj8Nw2YKSs13fDxvGtN0PYIH3X03TkuQj
	 6ofE7ERqStAq08+QqkZ4o1Z1O8nBSECOKokZ6T5zRs1mKx2qCy4hcq7LJrStrQ6fjq
	 V8uwzBoAo/HNg==
Date: Fri, 14 Mar 2025 09:44:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: crypto: fsl,sec-v4.0-mon: add optional
 force shutdown time property
Message-ID: <20250314-omniscient-screeching-lyrebird-d7ee1d@krzk-bin>
References: <20250313114453.702-1-ian.ray@gehealthcare.com>
 <20250313114453.702-2-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313114453.702-2-ian.ray@gehealthcare.com>

On Thu, Mar 13, 2025 at 01:44:52PM +0200, Ian Ray wrote:
> Add an optional property to configure the force shutdown time.

And why is this hardware property? You described the desired Linux
feature or behavior, not the actual hardware. The bindings are about the
latter, so instead you need to rephrase the property and its description
to match actual hardware capabilities/features/configuration etc.


> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  .../devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> index e879bc0be8e2..ee282c352535 100644
> --- a/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> +++ b/Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
> @@ -111,6 +111,14 @@ properties:
>          maxItems: 1
>          default: 116
>  
> +      force-shutdown-time:

Missing unit suffix

Missing vendor prefix

> +        description: |

Do not need '|' unless you need to preserve formatting.

> +          Configure the long-press force shutdown time.
> +          Setting this value to zero disables the long-press detection.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 5, 10, 15]
> +        default: 5

Why existing power-off-time-sec does not work? Isn't input schema
already referenced for this node? Looks like you are duplicating things
for no gain.

Best regards,
Krzysztof


