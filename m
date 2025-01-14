Return-Path: <linux-input+bounces-9235-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F616A1117D
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 20:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEC267A42F3
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 19:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCC920B1F5;
	Tue, 14 Jan 2025 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ew9muCSF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605DC20898D;
	Tue, 14 Jan 2025 19:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884265; cv=none; b=hMdOx3bMPNnCR20dbedOPtuzpcLMzPMzWpW2fjPe/r5Gm93oWNiXh8Dyg/dDTZGKqOIgq6UDz9u0smfE4FpnjEtus55ygbE8Vg29bco75arypoOt1Et5d2U89Axb0bxD/2ILDkm391dfJPTR8hbBVAuHOUB471dPhB8CcnN1Azs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884265; c=relaxed/simple;
	bh=ekSj94HLWuMG53elWaEaqnO3t0X1jJWP6i9MfbNYrek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6RNDBh1QmIeZfJ8xPWPVwjUCELhvowwLBXfM+yojR5/x48nray6/ngzTS2DI0lliWln/G1zM+94vAUC/eOijKCSs5LH5VxoU0F56KzJvS09fKUK6ficPULIR/VehOCHb9SuVhbDFhS1bGSsM5/zao98LE7zokTAEdYgiAHrSPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ew9muCSF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4D5C4CEDD;
	Tue, 14 Jan 2025 19:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736884264;
	bh=ekSj94HLWuMG53elWaEaqnO3t0X1jJWP6i9MfbNYrek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ew9muCSF8tmUFQpfsR89W5j4ScE7sFgu3Msca9NGslTKLO+MnuCa/kF0rHqEAplaa
	 iAdCa/uSetUmI8jXyYFeJcdDcaRy3Fxe6kZA73dGvynmKz7xaZ2ACi8z/pPelP6FCT
	 K1zrXqimyDyNvdgcgJEGA7MylGvbqkCx1UbivNf23kRGe4/7FhaCVjMup1AxzQ6685
	 MhjDnQbB+mFMSRhQh640feIlwu8qKx+S+xJCmmaCHlEAU1vdM12sEGAJRbILbZVZPb
	 Ix64cSqgmL1lIE1nHq8MW9zYqLcSpffkZOsPtKZEoD7lnDIa96NtQ8P5lisMAXkLOY
	 y0Em7zL7+ND4Q==
Date: Tue, 14 Jan 2025 13:51:03 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	Manuel Traut <manuel.traut@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <173688425171.1616382.17333027823836839484.robh@kernel.org>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-5-markus.burri@mt.com>


On Fri, 10 Jan 2025 06:49:03 +0100, Markus Burri wrote:
> The property is implemented in the driver but not described in dt-bindings.
> Add missing property 'gpio-activelow' to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> 
> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


