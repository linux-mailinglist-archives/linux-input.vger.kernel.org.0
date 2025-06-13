Return-Path: <linux-input+bounces-12874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AC3AD83B0
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 09:09:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BC4E3B91B3
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 07:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496D827467B;
	Fri, 13 Jun 2025 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZwQHguT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A10727466E;
	Fri, 13 Jun 2025 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749798561; cv=none; b=aEqK7BbV6VkYZPnPp8xSUG1U204pOyZmYoEZlTxOak6N9IviAQkj1UPXx8wfaRnzlU1KIG/0UkQD0OlHx7VM9FSP0clwnlHPv4pdct+cNmt2mcHSVGla/c49PbMPFAdp2yHH2pK1CRoFLdo9DcJUewa+qLp6Fa6OO9tKSHCBHsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749798561; c=relaxed/simple;
	bh=Mb1jyZOQPN9JATWBbLyCYwDfAwrKONx5/T3Sp8j0edM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBmJvkLH1e8HLDtEW2GG3nOHxKvNOSjhb2Bb60Gt7RB7Z/wLLPyyKJTbdb7jcQ+r2WpqyrOHcxSkesp0SNrhMFkyzJg69x2/8KNbUOaomyc/+sd59VW2TXQz1Qn9gmwYTGLD4DMNg8n5nAKXsyMbT5pBwfPSHVSqqpd3VGXx4Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZwQHguT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B5FBC4CEE3;
	Fri, 13 Jun 2025 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749798560;
	bh=Mb1jyZOQPN9JATWBbLyCYwDfAwrKONx5/T3Sp8j0edM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IZwQHguTjI+NHlRsb7p7gV+3FKXQu+3OLuSJEcdfaIGSV2gdb7kqoFAuVmO8RtoGy
	 YSexCJqBy9HH7z6rdB4ncYzn0sQJRQ2tIiiLI5ZXtXrafaSwzkhpuKJwwGzteOqeat
	 rx3apaWgVPrAvilPBQz6dzvdLUAKHsKAsozM3OeLx7/tavaDMgbS7P+DWMLygIShXu
	 nul2JIp5r1GNuDRSlJY7y47EjVAvEn+Vs3TAZqL21edg5qr7OOx7oHmbVUrnEeGsQF
	 aHAae6TGanDR7WGD/rRzPzvCTYS4ReA4IrmXNdwwuuF5LsOxycNtOQjalBmowu8hg8
	 SAgXKROHdhbWQ==
Date: Fri, 13 Jun 2025 09:09:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sangwon Jee <jeesw@melfas.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: input: melfas-mip4: convert to
 dtschema
Message-ID: <20250613-big-firefly-of-aptitude-a88cbe@kuoka>
References: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
 <20250613-mip4-touchkey-v2-1-9bbbe14c016d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613-mip4-touchkey-v2-1-9bbbe14c016d@disroot.org>

On Fri, Jun 13, 2025 at 01:11:33AM GMT, Kaustabh Chakraborty wrote:
> Port the documentation file melfas_mip4.txt over to melfas,mip4_ts.yaml.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/input/touchscreen/melfas,mip4_ts.yaml | 55 ++++++++++++++++++++++
>  .../bindings/input/touchscreen/melfas_mip4.txt     | 20 --------
>  2 files changed, 55 insertions(+), 20 deletions(-)

You need to fix MAINTAINERS as well. With that:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


