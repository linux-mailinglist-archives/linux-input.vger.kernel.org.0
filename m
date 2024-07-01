Return-Path: <linux-input+bounces-4776-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304591E6FD
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 19:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A276F1F23639
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 17:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F100616F0CE;
	Mon,  1 Jul 2024 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNKqfDhe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6A416F0C5;
	Mon,  1 Jul 2024 17:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719856469; cv=none; b=cIFLTHPiOPpS++hvsoZuKqGPRacxohmEmDFCljpTSmI42WlQn2YqygO8wysE+VA9/3gVGxf5USVz9l+ZvyezfmPcxfz5ZprkUej07JOV6S9TMb1BuXUX2FLCuPHhQmzfmUrXewnrSVMYFR8iDNSqkXWqQNrk8BSNrRZR6dnERzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719856469; c=relaxed/simple;
	bh=arGGr+4iMRJfz/bnC8tO+72OT8uQlHWAdVYUB1iA9/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzfNMVsUMRP3jrxZSa83MAWoWZly+X6xxlWgKKGJbnCdjVtLbuAxWAcqZAUAT2qO6RUfWs7IOYlgU6DgDCb/3m8bLCOxbpuY2NaOg4Hk8turAiQog14Qs61Dl5kpWV3BD/fm6O4leCFVpjRiyZ9+rVD9/qu0BPdqw6DHCfk0ci4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNKqfDhe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34717C116B1;
	Mon,  1 Jul 2024 17:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719856469;
	bh=arGGr+4iMRJfz/bnC8tO+72OT8uQlHWAdVYUB1iA9/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNKqfDhevetk/oXIw4r/sfry18q3In+E+bUu0xWMgsiimTWZ0DTuNjfbRQYcMrt9g
	 mzDt9h0Tpm9fw3w5nk8jTFT571P5548L2dKCbTEnpzEgaWptauswqU5K3Q4MwIa0p+
	 zjg3U+GnEkHdCn0UOADHObfvI/MhuDOAxrnaPraQ+mfqomkZdtJm4kLXkSyI8jbvr0
	 GwpXV440sEO0/PQiDW7eQRiku1B9XWLV2nUgSnur+aH58+oGTcSVVnSJBi/lfKHRp2
	 558BhqYyReNrZaEe6A5+r+DVFF/bvxM3OtFxs02eVwGszPlXaRMFTqvHBlcR/cBtAE
	 Z12hTEkUMMZtA==
Date: Mon, 1 Jul 2024 19:54:25 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: simplify event handling logic
Message-ID: <kthymccoagu5kmhtr42dnugjzpf3wwesd63eqttyoxmbijoy4k@qe7pbdn5kmdx>
References: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
 <20240701060553.869989-4-dmitry.torokhov@gmail.com>
 <qevkkesgw7y2bypexmogght7iozo646vowjkovht5mplegzvnl@tzfffoaglijz>
 <ZoLZ4INw2gZjNzw1@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoLZ4INw2gZjNzw1@google.com>

On Jul 01 2024, Dmitry Torokhov wrote:
> On Mon, Jul 01, 2024 at 09:41:22AM +0200, Benjamin Tissoires wrote:
> > On Jun 30 2024, Dmitry Torokhov wrote:
> > >  /*
> > >   * Pass values first through all filters and then, if event has not been
> > >   * filtered out, through all open handles. This function is called with
> > 
> > Nitpick: maybe that comment above input_pass_values() should also be
> > amended now that the processing is more straightforward?
> 
> I think the comment is still accurate from the higher POV. We do want to
> send the event(s) first through all the filters and the remainder is
> through the handlers. This is achieved by placing filters at the head of
> the list of handles attacher to the device, and placing regular handles
> at the tail of the list.

Oh right, I missed that in my review.

> 
> Do you want me to expand the comment?

Yeah, maybe add the blurb from above in the comment so we don't ask
further questions next time we revisit that code. And given that you
need to respin the series, it should be all right :)

Cheers,
Benjamin

