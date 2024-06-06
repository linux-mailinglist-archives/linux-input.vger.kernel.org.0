Return-Path: <linux-input+bounces-4157-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A168FDF52
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 09:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B6EFB21321
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 07:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6E613AD06;
	Thu,  6 Jun 2024 07:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clylkcG6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F101D19D890;
	Thu,  6 Jun 2024 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657850; cv=none; b=akObOPmIn3/X5c7EU7k5qFz2gu9eZQZtyK5jNeuTt7OqlA8ZA10gDK4StVIJB2bNvoloM22gqQ4pW7/El9oHkwMFhpGWoo/9mvQSCRpZ+AjahfMBHXUlk+N4aMHlwRhsuyajwSfv+GudRdTlLTF8Jg3FrA+NaEg2f12Cm8Fw/tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657850; c=relaxed/simple;
	bh=feUC7cgN4kEHonWqGpsmtZb0vkD5Y70RcFg1PgquXUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t+kalPppC7gOPatdy6pK5Oy/kBfQ72gQBtGFf/69gjLTXVPxsLFkIq3po3Ax9pBvUE2MN6Vt4RzdSEJQLQ6V5PFZgLZq5NwjkMfsVQ1aodP6Cx+9oD/wW5tteWsiDFZJi+IJMTMH4SE5j4jITU07g6IBiillB24T5R1tVOC96VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clylkcG6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C50C2BD10;
	Thu,  6 Jun 2024 07:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717657849;
	bh=feUC7cgN4kEHonWqGpsmtZb0vkD5Y70RcFg1PgquXUE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=clylkcG6wLV/z+p3wpI6arQjgogf9c/Q3ru7LBfLNte7GDZ/7PUgTzROqXsr0Mycx
	 soEKFSLYjNIO8+b7tv8TRJhmOPrObPJxtKCLsOSgVnLXWWfGRMgJ9QsUf1rCpLz3cS
	 CsoDingtqACw80UNr2STQ3O3n+ctcOlD5HUIils7PXu51IdCXvKzgA4OOQ7EUnlhOw
	 MaKIr1wHDLhH6YC9JTGJYPWFzRDnMw8u+0deSpls3jAo93GefB736hcJy/g35i51EC
	 A2+XcEA7gRE0ZP+v6hiY4nLwDR8hKbPwAG7TEL2KLACOsiY8wnbXhPPjwuXX2l09xR
	 4Hxrnsrcj+ljA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sF7Gs-000000007R6-0dz0;
	Thu, 06 Jun 2024 09:10:50 +0200
Date: Thu, 6 Jun 2024 09:10:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s: fix
 touchscreen power on
Message-ID: <ZmFg-uBodIMkINof@hovoldconsulting.com>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <ZmBZPHbDv7ma_JaJ@hovoldconsulting.com>
 <fupsiajh2za5r7itt2naxtynyqiwpw3efubrjmydd5ohypo3jg@2u44rbhbvmym>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fupsiajh2za5r7itt2naxtynyqiwpw3efubrjmydd5ohypo3jg@2u44rbhbvmym>

On Thu, Jun 06, 2024 at 08:57:47AM +0200, Benjamin Tissoires wrote:
> On Jun 05 2024, Johan Hovold wrote:
> > Hi Jiri and Benjamin,
> > 
> > On Tue, May 07, 2024 at 04:48:14PM +0200, Johan Hovold wrote:

> > > Johan Hovold (7):
> > >   dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
> > >   dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
> > >   dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
> > >   HID: i2c-hid: elan: fix reset suspend current leakage
> > 
> > Could you consider picking the first four patches up for 6.10-rc3 so
> > that Bjorn can take the devicetree changes?
> 
> We definitely can. But if it makes things easier, Bjorn can also take
> the whole series through his tree with my Acked-by.

Thanks, but it should be fine to take this through two different trees.

It will probably take a little longer to get the DT changes into
mainline anyway as they will also go through the SoC tree.

> > >   arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
> > >   arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
> > >   arm64: defconfig: enable Elan i2c-hid driver

Johan

