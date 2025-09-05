Return-Path: <linux-input+bounces-14512-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71BB461E5
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 20:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8CDA169E8E
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 18:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAFF31C56C;
	Fri,  5 Sep 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYgeI2eh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB75131C563;
	Fri,  5 Sep 2025 18:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757095953; cv=none; b=A/PvEFZ/pA2aD3XtD4541n0o85T+xjYfq6j/EfI+14NIgMsMRtq+dfFHbP8SkygryjnvphS5oQAJ9d+RTKx5VucWbZkyoXCGlk7Qli+aNt4GmDto1rh+7ZP5Ns7Zlit2rH1sn+y3vlEzN/3+2I87KMWg96/Pq7096v42Rpf/CK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757095953; c=relaxed/simple;
	bh=GclH6UAe0lMBCKESAkLf32nFl67B+C++e618PpnQ/fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM+IIK2qHTeYJOkP/EwN9kknMmR3bq1cNJaHSrxs/bEP5kvueHp3gbSFY/Mci01Suuye+6G89DodxsmlvNcpwf8GFdN2MaBVwnYJ2/ZUN0vpUCMHyLdxWpbQ/HPA55N04e+S9/fS6r24l16LqO6jnBRDKLeowl5jcSTUamIo0z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYgeI2eh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E165C4CEF1;
	Fri,  5 Sep 2025 18:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757095952;
	bh=GclH6UAe0lMBCKESAkLf32nFl67B+C++e618PpnQ/fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYgeI2ehKi0mVEoV/5p9krDVbxAMNKN1GDyCzQmEPRy8P8N8ax723taaPdZGjE8bd
	 Qp+6gs4MPBMDt+WXj4OvfkqvjP/Z84PymUfXpD52LxeLCn6appbnWgny9ocAKaxhZC
	 oEncEUme/eENG4gVD0MEdfSNEDgfa7GRl0T7S+JL72wWcgLig7zgt0MMKNhFPZ2t9/
	 hG0hBkV1S7z8c1lV4j1+rRahKVPeRnzNXyvlppkYEIiWBUCTF5KVK1C+21cZxeywd0
	 +WbehcylZEqKttL8qNttnGdNv7CxZtYw+Nkq8XeM5MGQ5GdNlP/m4ph27QACj7LW0z
	 5kVrZPm/U3JsA==
Date: Fri, 5 Sep 2025 13:12:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: exc3000: move eeti,egalax_ts
 from egalax-ts.txt to eeti,exc3000.yaml
Message-ID: <175709595048.1038269.13052974258073701995.robh@kernel.org>
References: <20250904171543.517650-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904171543.517650-1-Frank.Li@nxp.com>


On Thu, 04 Sep 2025 13:15:41 -0400, Frank Li wrote:
> Remove legacy binding egalax-ts.txt file. And add compatible string
> eeti,egalax_ts and wakeup-gpios to eeti,exc3000.yaml. "eeti,egalax_ts" is
> general compatible string, which is not preferred. But it is compatible
> with old devices (older than 10 years) and existing driver in
> drivers/input/touchscreen/egalax_ts.c.
> 
> Allow address 0x4 for eeti,egalax_ts.
> 
> Don't require touchscreen-size-x(y) for eeti,egalax_ts.
> 
> Keep the same restriction for existing compatible string.
> 
> Fix below DTB_CHECKS warnings:
> arch/arm/boot/dts/nxp/imx/imx6dl-gw52xx.dtb: /soc/bus@2100000/i2c@21a8000/egalax_ts@4: failed to match any schema with compatible: ['eeti,egalax_ts']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - sorry missed one local change at v1
> - allow address 0x4 for eeti,egalax_ts.
> - move out touchscreen-size-x(y) from required.
> ---
>  .../input/touchscreen/eeti,exc3000.yaml       | 30 +++++++++++++++----
>  .../bindings/input/touchscreen/egalax-ts.txt  | 18 -----------
>  2 files changed, 24 insertions(+), 24 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/egalax-ts.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


