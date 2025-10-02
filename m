Return-Path: <linux-input+bounces-15195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86ABB269E
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 05:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 481CE3C363E
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 03:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F2123C50F;
	Thu,  2 Oct 2025 03:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eo9s9F7B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDC712CD88;
	Thu,  2 Oct 2025 03:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759374398; cv=none; b=ls+SJT5oH4BI1Jlg2NYe9kc8H4bpzpEd84a/AR47FNeaWo7O15anzF6mpC8DAJY896dn61jeaL+u5F8Cd5ehB3Fb9JpfcoajYTQTK6dGhy7mF+W96Z4gcU77K1RFRnnFUjNVqxrlWqLyJgCmdFGFUYMAvuPx/euHZFAweVck618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759374398; c=relaxed/simple;
	bh=UDokEHamW4iF3/ZXV5VEgzWuDmwfuICqhowi1FOtP8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evMzqG8esONNQINuHb+bC/36Xp8gXOSR0Fiis8KHQmHoyrPrdT1Y0D8qr4cAkTGB1NEgP8flPtldjjYa2KJpFr6jbESaldQM/391BcZznE+JOyHEesJdCyeWa4gC2WJpvW8S/g+a3NLRLvopz26xY2djKTUrwpax9V4tXNa7IVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eo9s9F7B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67DBEC4CEF1;
	Thu,  2 Oct 2025 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759374397;
	bh=UDokEHamW4iF3/ZXV5VEgzWuDmwfuICqhowi1FOtP8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eo9s9F7BPln+gRU6E8kok1E4q/A34t13I6582NiZerCJEYw22kCZp++cKeW70LMhz
	 hvKnk+ekMas1GQe6nOifffHb69NsdRdn0gUtg8hm95wXYMKYSawJcGd643tBSLEcEW
	 LhBMpDdrIWax/gcswz/SwgFZrxHwveLU+96rSqq3eRU88WfBkXvdg2jBuGkl1eQxRI
	 MCLnUpSO63QHKm2tJlrjiQIa94nm0Z6QldFUkA4nigmU7xzikpjhgahWdQljS9zfKO
	 fgeB+BdOTqnnGOlr/QTPdHzu1gs6oaYb8NfwEUQfZbutrQNuMb2vJKbZpvwrpYIOHz
	 YKZumkzAhwwMQ==
Date: Wed, 1 Oct 2025 22:06:36 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Conor Dooley <conor@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: move ar1021.txt to
 trivial-touch.yaml
Message-ID: <20251002030636.GA2975104-robh@kernel.org>
References: <20250926184720.391335-1-Frank.Li@nxp.com>
 <20250926184720.391335-2-Frank.Li@nxp.com>
 <20250930-venomous-tracing-669be2e1163b@spud>
 <aN2eWrTWsonkchJT@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aN2eWrTWsonkchJT@lizhi-Precision-Tower-5810>

On Wed, Oct 01, 2025 at 05:34:18PM -0400, Frank Li wrote:
> On Tue, Sep 30, 2025 at 08:05:56PM +0100, Conor Dooley wrote:
> > On Fri, Sep 26, 2025 at 02:47:12PM -0400, Frank Li wrote:
> > > ar1021 have only reg and interrupts property beside touch common
> > > properties. So move context of ar1021.txt into trivial-touch.yaml.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > change in v2
> > >  move to trivial-touch.yaml
> > >
> > > previous discussion
> > >     https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
> >
> > You mentioned there were a load of other devices using just these 3
> > properties. Do you intend moving those too?
> 
> I go through other yaml, I have not found more. But there are somes, which
> have one additonal properties reset-gpios.
> 
> If add 'reset-gpios' as optional property here, I can move more these into
> this files. But I am not sure if it is good idea to lose restriction or
> use if branch in trivial-touch.yaml.

That seems fine. Unless reset-gpios is required, I don't think you need 
an if/then schema. Even required probably doesn't make sense. Any board 
design could tie off the reset or make it not s/w controlled.

Rob

