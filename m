Return-Path: <linux-input+bounces-5886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CE95F8AA
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 19:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5CA01C225EC
	for <lists+linux-input@lfdr.de>; Mon, 26 Aug 2024 17:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C64A1991B3;
	Mon, 26 Aug 2024 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tQhc+tsC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5AC1991AF;
	Mon, 26 Aug 2024 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724695035; cv=none; b=KSkxre0DMi0K3rHTy1x6bNr1fswTIfIa3bHGmzbjfL4mSO0EjfUz5U2J6n6peLNbiACDgphFw8Lr+lQK2iaDTbMhwB8k6iTbSP65dMm5+VHsrgHWp7HYy9HUeOLvBQjkEbawqwOBPjK63XBdhTHGwMgTFwSHcjdelNWqJ7x+pzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724695035; c=relaxed/simple;
	bh=lMKKl6X0Obu7zaLv5b6ZbxDB97sf+AkKiJrbIarWJQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAWMiEWpeM6zXPZqTNBP1dZEGLVHn7mfiy+dwcaNCoJVkUfK3lg/h759Qcx9O0HtffunSzCnbhjWYuiJBMfr/tPg+piR7/J7fibs0cGQClJUncCBl++VTRu9SGFvR3LSwQBNQ9M+Jz/0rwx/yBVwQ0Gv7RKnREMKpkRszQYwH48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tQhc+tsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7069C8B7A3;
	Mon, 26 Aug 2024 17:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724695035;
	bh=lMKKl6X0Obu7zaLv5b6ZbxDB97sf+AkKiJrbIarWJQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQhc+tsCBHQlJCAS/+SqnJgG1FiHHeMa3lMu05+LacbQoEfaC3JtsHv0l4cNM+YDX
	 DBwPORTXORAyTdNd5LSycMPibA67zi76GBbJvvyiAswU/dVYn8bJNJsusxOCHKO0H8
	 ywzKQtItH1q+QeWPhQJW485/ZaxPAotAQFUVs5H2Jwd9iQPPwYxd6IP84wVoNuFDC3
	 4twtlMwgvuxGV2RHzd4mWLT17hRq7giqrWTpzZHmRN+uDZzCQc2L20nGe8RvHKfQEW
	 sjHfiwBQu4gZUjPO1qFBeWcAZ+uRQoOpg2m0UrBf+8oEVvce5ZeaPME/NSY2Ren1MP
	 KYAMpdzEJbwMQ==
Date: Mon, 26 Aug 2024 12:57:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: linux-input@vger.kernel.org, krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: input: qcom,pm8xxx-vib: Document PM6150
 compatible
Message-ID: <172469501820.1128279.133921156287509066.robh@kernel.org>
References: <20240606181027.98537-1-adrian@travitia.xyz>
 <20240606181027.98537-2-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606181027.98537-2-adrian@travitia.xyz>


On Thu, 06 Jun 2024 20:10:26 +0200, Jens Reidel wrote:
> The PM6150 vibrator module is compatible with the PMI632 vibrator
> module, document the PM6150 vibrator compatible as fallback for the
> PMI632 vibrator.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>  Documentation/devicetree/bindings/input/qcom,pm8xxx-vib.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Seems this one was missed. Applied, thanks!


