Return-Path: <linux-input+bounces-8382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 617949E34DB
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 09:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DF6CB2FE64
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 07:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686E41B87F4;
	Wed,  4 Dec 2024 07:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l87DamSl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE51B87F2;
	Wed,  4 Dec 2024 07:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733298549; cv=none; b=dcjxkXTNoIiPNli9E0Tb9g5usokM+M1Nt3iIET1mHnuVWSxvAG14/o5A9ZDDQ8Q2PpZubKbCjyTTSr0jQYmiKqBrLBDsKOBGCKCLk+/FVVPt3HuhUJNj0oEW/4u5kQitgtd6aHslUzJMuIukEpMWFKda0dWUzCcy5BCb9BE8V3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733298549; c=relaxed/simple;
	bh=Uv4AEBem5p3ILCtxEiA/PBEr39M+KjuXZK2WDr5w2Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQUpzuz8eUjusHhtvXMhGCBrLYWUP2uHTH/HH42hfOsG0bhYC0zUyACyE1SJuptieew6JlULs84rupTGlpE70GHfzMj8I98LkFFfCm/I/KbK9zZ7pKOKVczh/GEqWclKvETRGA5ud5CiuDhzxnfQu+37o2nhz6t2tM7wDx4dcwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l87DamSl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED3DC4CEDD;
	Wed,  4 Dec 2024 07:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733298548;
	bh=Uv4AEBem5p3ILCtxEiA/PBEr39M+KjuXZK2WDr5w2Qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l87DamSl/LiTYktt19I6sgilBWeDp9nUJXLA4jl6hK95i2YBP+Gf0pGTCygpxY/pu
	 6Yjm4yuBriQUleF2QIhuo3wW83ItX8Aep/KG7WrkAIt6ilSGSypO1+jeLX9WP+eWCo
	 4DKH0liW97lOdHyROlnBZwLKkvubrTD5hWnPhlVkquFY1IiGKMpIKqfEtUb/M5X3fP
	 XOmptQ9qUt3p/p00plAwRGbAylBHZhZnReFqUmaqEhHmCjIdCQl/xP5NcA4+vx5tAl
	 tMP0PI0xeVZpiQoOkJYDUGqKmLVqmygpiVO4yWSMQrTZSXMSR/2wbmFjk5P2092EMF
	 D3QM9WPS1funQ==
Date: Wed, 4 Dec 2024 08:49:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen Chen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <2a47hwrbl3r6h5umwikt7bd7rp3njj6wnlo5e67f5kl6zhaq7g@cnolynoswb37>
References: <20241204021014.5083-1-mjchen0829@gmail.com>
 <20241204021014.5083-3-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241204021014.5083-3-mjchen0829@gmail.com>

On Wed, Dec 04, 2024 at 02:10:14AM +0000, Ming-Jen Chen wrote:
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>


Repeating same comment third or fourth time is a waste of my time.

NAK.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Best regards,
Krzysztof


