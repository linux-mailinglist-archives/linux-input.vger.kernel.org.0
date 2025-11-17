Return-Path: <linux-input+bounces-16142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB942C6284D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 07:30:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 14AD522EE2
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 06:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB49223DCE;
	Mon, 17 Nov 2025 06:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iwq55x/P"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120BF1F09A5;
	Mon, 17 Nov 2025 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763361026; cv=none; b=ulSZkE7RRtsdDpPNC6YwHR3zVP3fJrvy/TdPsnmmqCrC7gctmJTWReif1d44kesMClw/rQ+BJv8acYNpf2TM4PLEDklzQvRwxE4f2tn0g9ZwRiCMDv9v2XU0hDKk/E8s4J2Rgpq84jffs1fuzOp+VtZymBb3Cc1y4A+vaRWG5yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763361026; c=relaxed/simple;
	bh=R688FjROdtgALsW80H3qFz9mXCyYWls6Ki7YSSaKH5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8akn4Z5Ax1KEJBFBSW0xE4bNBKVHmicVKcRIApphI2v4yLjpb2Y0Ih17HXQWhuOVmveJxf/gS4M2odWbuKYYnr2LJZG9Ur8IYVc4tdBBS5vvKtEn4f2VZEPgisRfvBOdUYnDtwkr49i+O2rVPbf875KUOjxUoyxFzO5fA7HQdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iwq55x/P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BA5C19425;
	Mon, 17 Nov 2025 06:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763361025;
	bh=R688FjROdtgALsW80H3qFz9mXCyYWls6Ki7YSSaKH5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iwq55x/PO+5Fq2+hrgVyKVr5LhBVyW8r9/a8PUpFmDTkYL3uCtA7sDi+EgKvmK4lM
	 KbNxdZGSKk2YnEWPza93ygJpZF7mayjETh7P0AN3fxDy/wVkCKtYoj6YhyHm+aUTJw
	 Y4IIqse4tGK8qHH5mUrtu0+3vwmiF+W8avomFMSBVVoYvBpD+mcRrH38cttP83olgD
	 tWppiNhX5cmRMLb3SXVzdDsFo0dhfvWj5/NPtDwvSuleHrm2Z4Uu+SwgdbRnum1pUR
	 mvS1yiLgiqr2frAJyFAlSgYS9d3GG3t9OrhhQglOymeP7OPMkZJ+MR7RruqVSVSclv
	 SPQwpr8kQoEtg==
Date: Mon, 17 Nov 2025 07:30:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Message-ID: <20251117-beautiful-pink-macaque-9fd441@kuoka>
References: <20251117110148.v5.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117110148.v5.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>

On Mon, Nov 17, 2025 at 11:02:10AM +0800, daniel_peng@pegatron.corp-partner.google.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> 
> Create new binding file for the FocalTech FT8112 due to new touchscreen chip.
> Confirm its compatible, reg for the device via vendor, and set the interrupt
> and reset gpio to map for Skywalker platform.
> FocalTech FT8112 also uses vcc33/vccio power supply.
> 
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> > > From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> > >
> > > The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
> >
> > So keep the device in that binding under enum. No need to create
> > document for every device, even if they were different but here it is
> > pretty obvious - same chip.
> >
> > Best regards,
> > Krzysztof
> 
> Re-describe the commit message to make more clear why to create new document
> for FocalTech FT8112 device.
> Sorry for the confusion.

No clue what's this, but try yourself - apply the patch and check the
results if it looks correct.

There are extensive guides how to send patches to Linux kernel,
including comprehensive guide on Linaro blog.

Best regards,
Krzysztof


