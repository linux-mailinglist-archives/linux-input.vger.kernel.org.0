Return-Path: <linux-input+bounces-14990-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6F8B9345B
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 22:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 001501906AD6
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 20:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B8002765F8;
	Mon, 22 Sep 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4hgugTv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1234258CDF;
	Mon, 22 Sep 2025 20:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574346; cv=none; b=rwAuM61thsPCAa2GRYzQajtuFEo4weFz6kJeCHCCw9AHJa1W2j+IFpOume0HRul9PJupTfkK5HQb63Z4rDP0ncEzKBGEt5mRfmLLmF3Pmi2umnBvt45FT5oBMzCs6FDoi0cE/SbFQXnain9F9HoYwWdmdIdmPw3QZo2uwsLggKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574346; c=relaxed/simple;
	bh=+o77CxiR6PW1rb3QO/Lwu1zm59L/LEmuF1ytYgz1oXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nftp7dR2CuXafwYD513Uxx3bWsPjRpfx1vEoeM3Ym+tXxuJvgUviHqSWS0DL5DcAHT25XyEjT/lE496HNfMYmVyOfmh9eW5k8Wxo3ZM+/J2VXvIPcogkyXeOYDZ1GxlirPBWK/7Iwf1FVBVNLQKsoXBVRLCmD0XVqjqq9F7Jtfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4hgugTv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6808C4CEF0;
	Mon, 22 Sep 2025 20:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574345;
	bh=+o77CxiR6PW1rb3QO/Lwu1zm59L/LEmuF1ytYgz1oXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l4hgugTv8eSZ2nZMc208PAnkzIQUS3iBlGPDJtbzisALOU/Bx00nI9PdqRd9iVOg9
	 yGut5XUYSITLulj1Kxdj1dxkgz5zdYEj/wDSnzL/bMWbH67qIdCnZ2vCGzZjhqtBUQ
	 vsSY11zARPYhnpicn9AU+U4qF6SaE5VTF4eDADnn+LDb/e68M9Xm77frbIO8+TfgMN
	 Jj+nDQmHA2mgPTHHP/HDqXljqgODnDLlOL2yVqcdn13J9YbAvOEdeN/gTlVKbdSbRN
	 hTu3ba+Mc2yV1Cbnebn23wsOQOOds3CPs1PW2r0LU2lrgEJM1HoYlRSoNlFkotj2P8
	 c7OuuTuLnX9eg==
Date: Mon, 22 Sep 2025 15:52:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	sebastian.reichel@collabora.com, linux-input@vger.kernel.org,
	linux-amarula@amarulasolutions.com
Subject: Re: [PATCH v6 1/3] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <175857434367.1304282.14949706453809538332.robh@kernel.org>
References: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921173353.2641438-1-dario.binacchi@amarulasolutions.com>


On Sun, 21 Sep 2025 19:33:42 +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v6:
> - Add deprected to the compatible string and attn-gpios
>   property
> - Put const 0x2a i2c address for reg property only in case
>   of not eeti,exc3000-i2c.
> - Put false the attn-gpios property in case of not
>   eeti,exc3000-i2c..
> - Drop example for eeti,exc3000-i2c.
> 
> Changes in v5:
> - Move bindings into eeti,exc3000.yaml
> - Remove eeti.yaml
> 
> Changes in v2:
> - Added in v2
> 
>  .../input/touchscreen/eeti,exc3000.yaml       | 33 +++++++++++++++----
>  .../bindings/input/touchscreen/eeti.txt       | 30 -----------------
>  2 files changed, 27 insertions(+), 36 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


