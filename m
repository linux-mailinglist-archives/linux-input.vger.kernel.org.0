Return-Path: <linux-input+bounces-4705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C609391C136
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3B71F22233
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE6B1C0DC6;
	Fri, 28 Jun 2024 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BT7swWQg"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20221C005B;
	Fri, 28 Jun 2024 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585538; cv=none; b=CpUo/zU/8bTprrONKUtjfNuxGm/Q3l5Luwy+53HIR+XDty+svBjvy6H5AMf+sSeFpFwFO/UseoLuzdB0tmL0h8WUIoOa/XQNNXTwYbSDM0y4M2oWLbFwvBplREL8N1yucW9MILv+0ixSGQ6o85IMc2M3e1a83y6zEr/TX/RTt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585538; c=relaxed/simple;
	bh=8E9K+P8qR+5aCKSzHuCg66HKgwOcAevKNzc9zIvxcgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQd2Y6gZkOBviG33CNBLo0ASgtoB7F3947UN6Xdap09QI635Ac5RIc6Imup0hN6q2FQBJEyJChWzcmg/LOu2lclEpAcLVJwi1WBOjghnIoBuh/T3hwQwKX9exa/LzMZRY3KlPnYXgs4L51FZtGWcve+d5sd8wd2QmlISzIQA3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BT7swWQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E6AC116B1;
	Fri, 28 Jun 2024 14:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585538;
	bh=8E9K+P8qR+5aCKSzHuCg66HKgwOcAevKNzc9zIvxcgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BT7swWQgCeT7eJIX3qG3YazDF/OwP4/x9MPZUy+wERzE2X4ytbcdxAQK4Csg5hM4a
	 tVzktFfDItuUrLSH8fj2mcuuBFDD9+Fg5o/5ffY8nZCNflLoKbPH7ejhx29Q36IZMX
	 koQWMJkh822wKdOFVELOmvwyco3xFIWFD6xMs/8Ae23k7gKY9GdD/JPy81W3OTILX0
	 wF9GMk7TxHkMKGJxWUc9115XfKb7/jSIzI729xtoS7iN2e3qHjCotSl/lZqYgS5FSC
	 KEB+3rYONiaLx37XeSfoK3pE87lOJ9o2HGZ0GuAt7FXSHKWRUruMW4DSA2sSb6bKrX
	 SyI0Npy69Eg2g==
Date: Fri, 28 Jun 2024 15:38:53 +0100
From: Lee Jones <lee@kernel.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com,
	James Ogletree <jogletre@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Message-ID: <20240628143853.GQ2532839@google.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <171958538756.3311721.9922103612711130930.b4-ty@kernel.org>
 <20240628143825.GP2532839@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240628143825.GP2532839@google.com>

On Fri, 28 Jun 2024, Lee Jones wrote:

> On Fri, 28 Jun 2024, Lee Jones wrote:
> 
> > On Thu, 20 Jun 2024 16:17:40 +0000, James Ogletree wrote:
> > > Changes in v11:
> > > - Constified function parameters in ASOC driver
> > > - Removed an unneeded #include
> > > - Changed number of max FF effects = 1
> > > - Minor refactoring in Input driver
> > > - Reworded comment in MFD driver
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/5] firmware: cs_dsp: Add write sequence interface
> >       commit: 205fdba5d0ffe1ad8de61763d74323e88b640d41
> > [2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
> >       commit: 2fab5abad124fe7e1b99ccba3305aa4c5a24496b
> > [3/5] mfd: cs40l50: Add support for CS40L50 core driver
> >       commit: cb626376cbd00cd69329371519a8e9568baef715
> > [4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
> >       commit: c38fe1bb5d21c2ce0857965ee06174ee587d6b42
> > [5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
> >       commit: c486def5b3ba6c55294cee9abc7396d9dc18f223
> 
> Submitted for build testing.
> 
> If all is good, I'll submit a PR for the other maintainers soon.

For my own info: ib-mfd-firmware-input-sound-soc-6.11

-- 
Lee Jones [李琼斯]

