Return-Path: <linux-input+bounces-14520-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF29B4649A
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 22:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB30B7A705B
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 20:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD6D284886;
	Fri,  5 Sep 2025 20:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qci4YWjO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD6C1F4262;
	Fri,  5 Sep 2025 20:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757104387; cv=none; b=RMFmL4RPux+NSX4xLZMY8UO4aALihe5rRxjnZKsvHO64UMsM+2a3saTslbrDvKW9dg4+nMJcKNpMYbwFulxBmzpLknaKfCUykMsfuYyk5dRuN3fKlcGg/U+07t2vw0Q8uVyWuIuVwTieaVJyJLbifqgSAvGIboDOXLFGoTeLGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757104387; c=relaxed/simple;
	bh=7+4tc2DX6Np4dUdLk0Zy6oOY1gQEUFikJpLNx0nxG+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buseqwcpY8+SMzNZYJTam6wNwvRe7RMY9DO4/nfEGsU/HMQ011mYzeD/5Gn11mf/lPNfJAtDV0MzSKp8iCFhVAbDaDi08Wx0n7PWY/FTJgIL0vHpcjkMb3kiPmd1OkBPDKp9KXLuyoG54j5pVfM4OhmKyMfXmK2pgaC5F9IhJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qci4YWjO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C53C4CEF1;
	Fri,  5 Sep 2025 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757104386;
	bh=7+4tc2DX6Np4dUdLk0Zy6oOY1gQEUFikJpLNx0nxG+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qci4YWjOMckkPUqMCSj7Rfz/vQiLgNDyppbevOF5WgsBSYYOLOAqz/o/ypyWP57/q
	 TvqgWRIOzxzA6B0PO16ZN6+9+EWHdK8vFLFkhJKiAbxo2ZCZT3fFMVZtm/GgG1e1Mf
	 QLFuUM+JSIEvDeWWqc3XDO0g8iilrs+FOpqST+y7tyFknTmouW2uavqXrKgZJp9FMm
	 sEpmT7NKe0CKqznLDessUxTNIgJHtEd5Cc1zHD1TUB16qknqnLmhCa9T6y9+CqZ6B8
	 N0655fL7n8j8WqD7UR2wzhu0HlQdNj0uaa6xKU0vXMrzHtDPr0Yex+CUfvIDbgE3x2
	 de1WpZvoxXpAQ==
Date: Fri, 5 Sep 2025 15:33:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: input: convert max11801-ts to yaml
 format
Message-ID: <175710438523.1268822.1694465252230993147.robh@kernel.org>
References: <20250904200641.531897-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200641.531897-1-Frank.Li@nxp.com>


On Thu, 04 Sep 2025 16:06:37 -0400, Frank Li wrote:
> Convert max11801-ts to yaml format.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../input/touchscreen/max11801-ts.txt         | 17 -------
>  .../input/touchscreen/maxim,max11801.yaml     | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/max11801-ts.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


