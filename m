Return-Path: <linux-input+bounces-14215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 23012B2E939
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 02:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEF9F7A45B9
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 00:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 007B420330;
	Thu, 21 Aug 2025 00:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dL6rtiBA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6610A921;
	Thu, 21 Aug 2025 00:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734874; cv=none; b=nAJz0LMTtf1ctseANFMNtxwRghidfi2DTdEbNIyYrpCMW/HJViuI5BElvfQd4xWFqbdM0axqp2DVOZnfamOe7qCL3UMJsNQyjhFlV6fyGFfuezKlHBeweUkK9isny6t18+XZJADwEo6Fbj0nDRiU5RjtWnywFBhUwYqfyzRboN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734874; c=relaxed/simple;
	bh=c47+fMWeDw96kRkQrYoUXjIWccy+0mVTu7/4RDUErVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3vGtocPONo3KbDGmWGxrhS3STeYKq0HersybhCMRS9ILtVR4GJ27k33m1bHSLTTCoV1ns4fe0mJ+5ktxeUa9+4mi4Al+b3+06BFjqQN8n8D5QNJDr3+Dvs7+V6PDZRsjd4d/Z7h8rNbvp5akOpletsyFYPEK2/seCxtDIkC0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dL6rtiBA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCFFC4CEE7;
	Thu, 21 Aug 2025 00:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755734874;
	bh=c47+fMWeDw96kRkQrYoUXjIWccy+0mVTu7/4RDUErVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dL6rtiBAFhyMJxcIoWiQkGRYy9OMELDo37o6D+6qYXEkDPigImN/LKO+hNSpPmM7Y
	 Zn+9vyJhWwTRQDIMi2KRVzvbogEMyt1XuDTf4yh29aSvODa59AjjyK9LBXD/PSpNzB
	 qjnTQufuJYw6ByM210NgYFrK4spA3idE9VxaoCT+vLLPz1M3LvnweCzROWxT6VQ+Ng
	 GtoevQnHbPsWpFxpRtcI/ClxAQHgul/d5uh3CN+SdO9AV2LTMa/6RiZGBJYPzxfeWd
	 8cgTbkn45VW+9cK85GkrJFTxmSLYQB6oRFgmjjX7ge0snUhVNyRplNa3mCLLfjCweh
	 gZrSecoSJY+Gg==
Date: Wed, 20 Aug 2025 19:07:48 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <20250821000748.GA1767841-robh@kernel.org>
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
 <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>

On Mon, Aug 18, 2025 at 11:02:58PM +0300, Vladimir Zapolskiy wrote:
> On 8/18/25 21:38, Frank Li wrote:
> > Convert lpc32xx-key.txt to yaml format.
> > 
> > Additional changes:
> > - set maximum of key-row(column) to 4.
> > - add ref to matrix-keymap.yaml.
> > 
> > Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> FWIW I'm fine, if this change enters over linux-input, otherwise I'll send it
> in a PR to linux-arm-kernel/for-next.

The input subsystem is the default.

Rob


