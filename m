Return-Path: <linux-input+bounces-5577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA029524EE
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 23:49:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA39F1F221BF
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 21:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C3A1C8253;
	Wed, 14 Aug 2024 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lAK3439c"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828077346D;
	Wed, 14 Aug 2024 21:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723672143; cv=none; b=fL2od705Vu+BtTmwBKDrf82hhxu/2Kf01zrf1tgCjOCETG6N/ceu+mCv8p5YMFksrU5ePgC8i4ZqW8jqy/4YdeDSwJAOS3bNv548/r42q2xJ3N4n9OjroZBpNWE5/2N8bczd6IDPamiCV3sYHRPqk5lI64rINVfzzg8NTENxqD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723672143; c=relaxed/simple;
	bh=qUGZc78pzcRRgjxPHtI30pcwqdtIA4voVWxMwOfXCLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+MeaQ0g1fpj4iXOHu4Xv5Bsf4rbqwU/XcZijieN/9W1P0nJi08KgUJs8SA5Sx41F3pQKb+MeoyrHYnNuIahQH9dx2viLlIPyJGgZf2UjqaPexlnxD1VRwjFskMrqCBmB1CrECCWmPL6wIgwj2zGdBj9e7Ldq7cJRmdz9LdDJsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lAK3439c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3498C116B1;
	Wed, 14 Aug 2024 21:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723672143;
	bh=qUGZc78pzcRRgjxPHtI30pcwqdtIA4voVWxMwOfXCLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAK3439cax+vjGyan4WGa2XyIzrJfZ0dyv+7H6Q8tOeQeiHXOEFw+sS4YX3jhgrsM
	 4J/CQ9RSdVH8nq+eThIix9rWo8UdiJZ0Gx9d8J58YRSDG8G03PyEnJYIJxGAjl0RGr
	 ctSUtR7BdTfnPHbeVD3t6Tb3mFLjbXrQ2L5fF6vFa/wDgd2Vo5ytawhWDCk8KF5q/y
	 jKQ/sRISmKa7HXXjfQvBcl7mriaPcPOPBBkXnCJpCTtpmlLQthfF23kkMrlec6DM4f
	 Jr1MwPzTBDVKy8CxU1yRaSuxyBJ3OoHmVsepyDdMjOd6hH+03e6hmBB+8H+Ypt58xn
	 e13ChSIQ8tfSQ==
Date: Wed, 14 Aug 2024 15:49:02 -0600
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
Message-ID: <20240814214902.GA4101180-robh@kernel.org>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
 <20240814211345.GA4028598-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814211345.GA4028598-robh@kernel.org>

On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > Convert binding doc ads7846.txt to yaml format.
> > Additional change:
> > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > - use common node name touchscreen.
> > 
> > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> > 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > There are warning:
> > Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> > 	hint: Standard unit suffix properties don't need a type $ref
> > 
> > I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> > uint32
> 
> It's going to have to be a special case in dtschema. I'll work on a fix.

Should be fixed now in dtschema main branch.

Rob

