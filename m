Return-Path: <linux-input+bounces-5628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99939955D2C
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 17:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53389281848
	for <lists+linux-input@lfdr.de>; Sun, 18 Aug 2024 15:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D413D1DFE4;
	Sun, 18 Aug 2024 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qcI7ESa3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1905610D;
	Sun, 18 Aug 2024 15:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723995024; cv=none; b=SAXXVAtmGyrH79vyt0i8NuxSIX+AFa9rTD9tk9E4B7Rc7iOzhMM4qdQr4JbXrQuNesEbQiUjEv2thtZzE1Qz5kLavnws7FdZ6H4n0Gq3X57BBSIlj7uO0LcU6QbVXtVwQty3EBWyHxjA5mked6FeQghxaRCh8CegNMHe8PYw1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723995024; c=relaxed/simple;
	bh=0Mo3uJsUiO+T/LYHr3PvhANc77CoXA7Ua6VCa7Eu1so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+bfw26hpiOI2FM6BepgVzKUOhdTfCoHHF6EA6NEUAhwvO3FPbJYTUvqsQfJr9VLJXNYS512ZtsdgUfbEAQCYbB0EsG0PWJEsEuaqL4yYMHSpFp5h+jfHZ2rS8kKQgXub3xMvVu32KtR+zAP1XpCMyH5x7uz/4KnlRIMKb8RMJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qcI7ESa3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E511C32786;
	Sun, 18 Aug 2024 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723995024;
	bh=0Mo3uJsUiO+T/LYHr3PvhANc77CoXA7Ua6VCa7Eu1so=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qcI7ESa370TVFaIsxRPIEKnnx0P82lbKC7vQkdxj0+DyQD0JOjiDYK1d0jJGW84Kk
	 h0NEC+xtkoWkf3GdqZET88W35zYuu4akaxtRF/G2xCA7vbnHxZJXGq9pOVkQWKXpl+
	 Bhr9oJgbFSV0lslCaDvfqjcfG1TBKx5feDMCmovlEqHZHNUf/TGN7DLRDJ7MtfFhsR
	 0aDzPzHCxELblLxYn6dLg/WoouHOYgDCLn6p/d65dqB+Qz+PfRq8YxtHPZ/87fAbun
	 iqV5E/4rcfjcIqpWnVH2lZ/Dv3g8bCScL9+fys6i2ciFmEdbLIML8fiynNVQaJrACu
	 COFrQWjsCXa9Q==
Date: Sun, 18 Aug 2024 09:30:22 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sanchayan Maity <maitysanchayan@gmail.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 colibri-vf50-ts.txt to yaml
Message-ID: <20240818153022.GA110785-robh@kernel.org>
References: <20240814162940.4020520-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814162940.4020520-1-Frank.Li@nxp.com>

On Wed, Aug 14, 2024 at 12:29:35PM -0400, Frank Li wrote:
> Convert binding doc colibri-vf50-ts.txt to yaml.
> Additional change:
> - add ref touchscreen.yaml.
> - remove standard pinctrl properties.
> 
> Fix below warning:
> arch/arm64/boot/dts/freescale/imx8qm-apalis-eval.dtb: /touchscreen:
>   failed to match any schema with compatible: ['toradex,vf50-touchscreen']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - fix missed required properties
> - use original submitter and input maintainer
> - add value limitted vf50-ts-min-pressure, just provide rough range, which
> not mention in original doc
> - fix style problem in example
> ---
>  .../input/touchscreen/colibri-vf50-ts.txt     | 34 --------
>  .../input/touchscreen/toradex,vf50.yaml       | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/colibri-vf50-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/toradex,vf50.yaml

toradex,vf50-touchscreen.yaml

With that,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

