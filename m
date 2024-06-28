Return-Path: <linux-input+bounces-4707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F35791C14E
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:42:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 694691C2358D
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FBB71C0073;
	Fri, 28 Jun 2024 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7JIDRUU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B741C0072;
	Fri, 28 Jun 2024 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585760; cv=none; b=idFSvrFfu5TPfAlbgoXjP253D+49mprJgqdMR6Bds6txww6oX5uJXXLPkyxtoPced6rucjNcrkMuFyQ+u1NcOpWRvKWLuvCwHMtK06ARWkLI7RShYS3AOEQHrWTlZ3CAICwC94OvsNFaGqaizpFumC1dtd2s1MoHgu5GL8gjjwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585760; c=relaxed/simple;
	bh=MkgXIP8DB6EKkrNQ6rfC7nUcVW+VVmd62md1Jsqt41g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPaAV/NCmHxjCo2caL+iPXafItys+npt2FM4738KHeEDdGldGgqDX3TQMjVHybokv1dTNem6tA/v8vT+Fir97pAj5KTRxDSh0uKTT09EH2d9KYIKwgz8agH2SowrzbgWIfS8/pmBpWBHZEcpXGK1ejm8V3tW3PpP7A7zXCOL/A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7JIDRUU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF65C116B1;
	Fri, 28 Jun 2024 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585759;
	bh=MkgXIP8DB6EKkrNQ6rfC7nUcVW+VVmd62md1Jsqt41g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7JIDRUUneUvNLY7ImMA4+NfZASSPZ9VZj+S8GPR38EQ8Zvt4Wp1JVhg4tIN8Frjp
	 CMxR2DQLEq+eiJwCBlQg8Qtkf/cDpoC0oVG4/KXoIviUXip3EMjpSqZt4PPyv+9Aag
	 wGUWHvdVyDJnnBowlHqUtoz+O7TlKFYU2/P9g/4SKg/xdnFO/gWgjdl9zMP7pfCYL6
	 Z6pmt0NnoOKyKNreyLLlLQT0E/2xr+mcrFwMK9RwP4upFqEJiyL0+s2ApvHeMKrA94
	 Cj675B5V7gR923L7pVR+7DNV0E7lWFUpAVciM1iSQH0t044T4cwMy2sxYlt9JuY3gU
	 mXiAwt4/F3Bgg==
Date: Fri, 28 Jun 2024 15:42:34 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Cc: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 0/5] initial support for Marvell 88PM886 PMIC
Message-ID: <20240628144234.GR2532839@google.com>
References: <20240531175109.15599-1-balejk@matfyz.cz>
 <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>

On Fri, 28 Jun 2024, Lee Jones wrote:

> On Fri, 31 May 2024 19:34:55 +0200, Karel Balej wrote:
> > the following implements basic support for Marvell's 88PM886 PMIC which
> > is found for instance as a component of the samsung,coreprimevelte
> > smartphone which inspired this and also serves as a testing platform.
> > 
> > The code for the MFD is based primarily on this old series [1] with the
> > addition of poweroff based on the smartphone's downstream kernel tree
> > [2]. The onkey and regulators drivers are based on the latter. I am not
> > in possesion of the datasheet.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: mfd: add entry for Marvell 88PM886 PMIC
>       commit: c4725350a9f76fbec45cbbfffb20be2e574eb6ef
> [2/5] mfd: add driver for Marvell 88PM886 PMIC
>       commit: 860f8e3beac0b800bbe20f23c5f3440b1c470b8f
> [3/5] regulator: add regulators driver for Marvell 88PM886 PMIC
>       commit: 5d1a5144396e9570efea02d467df0a68fd28db6f
> [4/5] input: add onkey driver for Marvell 88PM886 PMIC
>       commit: 914089db309ccc590314b6c21df5a1f812e9ab0b
> [5/5] MAINTAINERS: add myself for Marvell 88PM886 PMIC
>       commit: f53d3efa366b1754f0389944401bb53397d22468

Submitted for build testing.

If all is good, I'll send out a PR for the other maintainers soon.

Note to self: ib-mfd-input-regulator-6.11

-- 
Lee Jones [李琼斯]

