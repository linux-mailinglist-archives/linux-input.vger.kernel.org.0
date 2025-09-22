Return-Path: <linux-input+bounces-14986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C24EB9273F
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 19:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F7951903203
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 17:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7888E315786;
	Mon, 22 Sep 2025 17:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cvxuy2Od"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47578310779;
	Mon, 22 Sep 2025 17:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758562533; cv=none; b=Gd8eYA6jUiKdDQLIs369+a4YtUl68EyHSLMnjvqZ3iBkPv0fXsmBxY1zVv0OLZ1OSQcK8OsHfmSatExmTVZuaTEj/KD1CjmjnyvQ+l39uctNFDgf/8O8sY0aivrdYR6eltHGewrVRbHvFpeC4DpG3uU+tmz+wiNKrwDxfyow/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758562533; c=relaxed/simple;
	bh=SjLMRdgFLtjEhMZhVwZ+8di8xB9TzPTbN6TSdIpLCTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8yXZWVXQnKiyZMZ9gPrSWXXxC+tdphN6/ziNHFImvN9DLqaUeKaFDWuWlgoB3hmVOMRhxTR4MTFARxzc6wBT1wsJrrKKlUTlYOvs07WZ6ZA+ZACJSUaMpYeMNGXXgu76zyo7BwC1y9TnCcJE6VqxB+d21VVYukWNqq6wIXgkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cvxuy2Od; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95E1AC4CEF0;
	Mon, 22 Sep 2025 17:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758562532;
	bh=SjLMRdgFLtjEhMZhVwZ+8di8xB9TzPTbN6TSdIpLCTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cvxuy2Odkf2OfzoH9IYRfasU6uRmJPYkGcgSs3m4jB1USAVSQ/rAUiV0oI2CCA9Uq
	 oi0lYVhfEobvVfedpOX0y/8wFWXrjdNvyNvrbQW4/M9XzNJCvqTecFnCXn4jO+joZQ
	 nYCm8vjGGqWv64zMooed457CfOuRew8yqgPvjjvCraCOpYMq3+k6B2Jpno1qQctqoJ
	 dD0eojmtR37FhLQxPXpS2GYophr43FHe5OMfiQotjJ40mDuSupLfH48iSlPNbXuECa
	 gcbqK4srue3RDwlG/hX0IX0LmCeqBblyTTLYY4pOdR2YWrB0c1RrlxOXmISlsfIHue
	 5p2X4ytw6fy1w==
Date: Mon, 22 Sep 2025 12:35:31 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Reidel <adrian@mainlining.org>
Cc: Hans de Goede <hansg@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: input: document Goodix GTX8
 Touchscreen ICs
Message-ID: <175856252870.514028.9418085581607326906.robh@kernel.org>
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
 <20250918-gtx8-v1-1-cba879c84775@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918-gtx8-v1-1-cba879c84775@mainlining.org>


On Thu, 18 Sep 2025 16:02:48 +0200, Jens Reidel wrote:
> Document the Goodix GT9886 and GT9896 which are part of the GTX8 series
> of Touchscreen controller ICs from Goodix.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  .../bindings/input/touchscreen/goodix,gt9886.yaml  | 71 ++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


