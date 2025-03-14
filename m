Return-Path: <linux-input+bounces-10816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58CA60C4C
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51B721892313
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DDD1DA617;
	Fri, 14 Mar 2025 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux3Vk4GM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E513D1D5149;
	Fri, 14 Mar 2025 08:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741942500; cv=none; b=Tb1I7dzFz2D+K5xgMES9naimIeT318OT0Q3c+ilQu4OQndi99mC6tzjUUWiCvfJbPk6y8ffj2EJmTsHlPiXWyZk5kRjn/Wox4ew0OtHNUMjVY7hvTL5Tonyf1CUCWwtEIEBPaO6FD/FiXa6Lr1aZGxFJGwFj5Jmk18rGsLdtfUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741942500; c=relaxed/simple;
	bh=+b0IBSstB17NAnGEdzn4x8G+MmwGxpNMIS8gdqrWeaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfZM/Nd8O9eMmZzZl63xKnrY8qhQM1fELYrwDt1YCUWbw97YwfS7AwZd5RKNsAWnMJspv5SO3ad+2aVIHPdUNGAGJkKL16W0CAre2QTECVo0pF//5JilCRPSFs0abwBBj8C8x+VfJlQ5/3lWB+qKubfR6tAeMo83nqkYRRjREoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux3Vk4GM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 623A6C4CEE5;
	Fri, 14 Mar 2025 08:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741942499;
	bh=+b0IBSstB17NAnGEdzn4x8G+MmwGxpNMIS8gdqrWeaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux3Vk4GMzieuFnmCUtrPtUQcnXc48e2JV6yNv+MCft26pd6j86pcWKdNEbYhNPTsV
	 TzRg2oIGPBdoULf0KVa6ijMsv/0Qb7hgb3aAxOZu5KcJve2K+sqXur5JzakTgs9riN
	 0bw8JU6qM8EaDPM6DZ1qEBmzjs79ljG86P+So/CY/BK7Lw6Pdz4lPZXCqhn06stybM
	 4R96HPpo/Xo25WQzQhG3oMvlYjgUEaUTfgHrIakB7Dg44dKqGK3EITQ84fjKPlb9ub
	 ux8AwAhd+L6X78I3PfbD3SxFnzfrpBUAqRisTL8IztgOIB5bmg63f0R27DC1oYc+1L
	 govwT7cdhkAOQ==
Date: Fri, 14 Mar 2025 09:54:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Reidel <adrian@mainlining.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
	Oliver Graute <oliver.graute@kococonnector.com>, Felix Kaechele <felix@kaechele.ca>, 
	Andreas Kemnade <andreas@kemnade.info>, Fabio Estevam <festevam@denx.de>, 
	Al Viro <viro@zeniv.linux.org.uk>, Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux@mainlining.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06:
 Document FT8716 support
Message-ID: <20250314-futuristic-godlike-quokka-ddad03@krzk-bin>
References: <20250313202017.19621-1-adrian@mainlining.org>
 <20250313202017.19621-2-adrian@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313202017.19621-2-adrian@mainlining.org>

On Thu, Mar 13, 2025 at 09:20:16PM +0100, Jens Reidel wrote:
> Document FocalTech FT8716 support by adding the compatible.
> 
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


