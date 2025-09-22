Return-Path: <linux-input+bounces-14983-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A02BB91FD1
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 17:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A66D188A536
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 15:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9CF2EA729;
	Mon, 22 Sep 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUmRw1gE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCFD2EA499;
	Mon, 22 Sep 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555538; cv=none; b=vAt9zsWuYopGDcpQH+XUw4BQ9CYoopx1ftrMwlA+F1b76+mUHcYdIwwT0KTI/SslDRDGyD6BYwWgy7bBa/cmlmMzbEhTmDDUwwM/SOReobcvlTpxMGr+4Q6gQ4H8IydN3jsFhRLqIpJ9VgULRbQCxfd5khas02TNTFLCXfVNZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555538; c=relaxed/simple;
	bh=FBWDbjZfsMysPb0xcoGWF64MTI0r+fWrLs6ifIU3x0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1w2Q8bmg9e6lp2mJvoMfcl78nmMhP0uTbdNEma+0SXuC0qFZi8MREfgbeOUuz8bJNLlxvZpOcOpEWgyA2DAVaj0DMYsN8RVtS9MgMdXEDucGBATKLoy6tMZNWrsZOk4KLRDj7piHd7AoOXYh9EhgxOAnEB5ydWecv5B2iIjBGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUmRw1gE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61BFC4CEF0;
	Mon, 22 Sep 2025 15:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758555538;
	bh=FBWDbjZfsMysPb0xcoGWF64MTI0r+fWrLs6ifIU3x0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUmRw1gESZaZOwHKqmiaPk930EhWUHUpcYJcLamtYfE9PStoI6+9qpbvoGloczY8O
	 XkJBP+tKpbzpqrTbXxIENGg40CpLqOo6mfu4ARI7JGb0lOLMh6GgLkbNfq5gGzN4m1
	 ZkjzrpxXmTNQ/GvRsm+bBxjvyTGuKBY5eqRmm8zxthD/aOjlH3QMYbngVxS10PGmdx
	 +SsQIgN6yp6lm+EanBfIeakIyB42WGZd5nKF4uEgSg1CqbWDKN1A1KnBajvOdL0IZ/
	 c9GEt6IZROwXyE2Tfn/Db1Pr2vvk+UVh8UQR8OPOMART4JIyl8PIMJ9vwgodzX9v3p
	 4FYuaPAQFcqpg==
Date: Mon, 22 Sep 2025 10:38:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: input: document Samsung A552
 touchscreen controller
Message-ID: <175855553663.6246.2974787430902564373.robh@kernel.org>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914134458.2624176-2-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 16:44:56 +0300, Ivaylo Ivanov wrote:
> Document the Samsung A552 touchscreen controller, present in devices like
> the Samsung Galaxy S7.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../input/touchscreen/samsung,s6sa552.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/samsung,s6sa552.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


