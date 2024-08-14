Return-Path: <linux-input+bounces-5576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8895C952494
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 23:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4539828126F
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 21:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDDE1C7B8A;
	Wed, 14 Aug 2024 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwogjtiO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB65210FB;
	Wed, 14 Aug 2024 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723670026; cv=none; b=dqtW0vuawtuIuKlY57PWJdZM8l/3Fnq0CXVeBHkM7Tz512ssyXGIiY45UjIoXqiluffiY0PTsHAceuG7EUGiJAjAhYeQytK0kEh/lKSJXllf5cZScey8lN+BCM1j+EEKn31zl8q8p5Q05mzsB9ETLASDBkwFJjpzZAYXD4iDL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723670026; c=relaxed/simple;
	bh=Xv3awSuwxf4eDrN41xnk4xJagCRp5iKnzwQJYZp6JDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGqCLwv/bOuiucP+xger/8X4Uv/0h9nNMIF9qxhP7i5dq3Cd4c5O04KNBVEJYXccL5KEVwkwu/mmQLv00nJAxa6XlplYPE0+yVs9++sMFREn78XWw+deU/Mb0xXyaHMKFpL6cpbNL4c8iam2HxGyBR0oKSo9EZ7yDXrY151aThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwogjtiO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E865DC116B1;
	Wed, 14 Aug 2024 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723670026;
	bh=Xv3awSuwxf4eDrN41xnk4xJagCRp5iKnzwQJYZp6JDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwogjtiOMiVOmDXiVtAOUI/s/R4YueU7dvsz2jxVcJhiwZQaFX05bQW+Ex/Z70rSE
	 1/RGuNuLGas5w1rFCm1MzGP26Z4kmn4oXNC7de9peEGSmgdPouH5tzjVLn3MapM07p
	 dz+3MZ9DlVT5rytYPxldA6SrVIK6AtJv3GJCNLYrPyRAo2u62SQSmb+fdBCRlp3HMY
	 pefhysqrOLz3XqZKKi1PWaCkleWpZR+OMvRv1IXm0WS+3LdneEK9Rpc3bqk8wcJGyN
	 OLiCeOlNpzN3vrjXvWDc3XBVHWxTFdWNJP+fS98NprnmH9pcmjC5LZiibw6s9CXjQH
	 pBmHvDsinksKA==
Date: Wed, 14 Aug 2024 15:13:45 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
Message-ID: <20240814211345.GA4028598-robh@kernel.org>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814185140.4033029-1-Frank.Li@nxp.com>

On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> Convert binding doc ads7846.txt to yaml format.
> Additional change:
> - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> - use common node name touchscreen.
> 
> Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> There are warning:
> Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 
> I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> uint32

It's going to have to be a special case in dtschema. I'll work on a fix.

Rob

