Return-Path: <linux-input+bounces-6355-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23576971EA8
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 18:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D17FE285E73
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 16:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C4B136E37;
	Mon,  9 Sep 2024 16:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="plwG9gAr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14677136663;
	Mon,  9 Sep 2024 16:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725897833; cv=none; b=IHU9qdIeBlagvZHcX1sItac2GZsNVTlUcnuiFu1vM86Tc+MxsGWfTcq0mKNw1GmWi5JB6Bo8RyoInf9wfObsRENxeX901eArvufo04+Nz6j0+MolGiGXx4OTwmD2pb0jrONX9XdjwEZmsra3iV78h1Sp3lgk6rawnDNaoiX7Tq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725897833; c=relaxed/simple;
	bh=Qds/bqD29GbyYQt52CwX2huCVVJG/7lLOHGGl84zbPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6IVtukmBltRQUWQpnH3p/frUNWNAghr0XtuCFzuVzSeYwgqxh293uEr0picZbahGqe3tI1VaKi+7AWlUNcjAhivqXsoUtegGh/bXm5LHVGeY7qBhz2CncLD3zKoMv9075iwVx7rPgaQ97hrA/OL3JqDgxJ8fNbd8i/4mqLxA10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=plwG9gAr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E68EC4CEC5;
	Mon,  9 Sep 2024 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725897832;
	bh=Qds/bqD29GbyYQt52CwX2huCVVJG/7lLOHGGl84zbPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=plwG9gAr1POQy+pvGKXi6aF0TCce7bOgXbYgB256ll6PqcB1Q0RVdAinRgBvsCaG+
	 2cfUx/Tk00u7dBs986WQensl+p12b6lP4AzAr4XqaJhwht5FGZDYNycf1BvUm5UzeS
	 e9GIxWBL3dOhxT28gOh5q+FJHeYMumrSgGhnDq9y3HLvwotdBaV9e2AoIoplBQo9cs
	 S8SDr4dPPd2UGF+Wag/AfFnIK9RkZk0J2HUPl7141Bxum4fKrAb5j0rVpX61ZaUxwc
	 gVQZSBUrhhmCKfPCIJVBK0xvwlTKsd4OHKA3abnapCfYzCucMY1exIrDSpGrvmNFLW
	 uu8kSDDgokdTw==
Date: Mon, 9 Sep 2024 11:03:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: update reference to m8921-keypad.yaml
Message-ID: <172589746601.214206.2603655107565042737.robh@kernel.org>
References: <20240908-keypad-wakeup-ref-v1-1-762e4641468a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240908-keypad-wakeup-ref-v1-1-762e4641468a@kernel.org>


On Sun, 08 Sep 2024 21:25:16 +0100, Simon Horman wrote:
> commit 53ed3233e6b5 ("dt-bindings: input: qcom,pm8921-keypad: convert to
> YAML format") resulted in a renaming of the output .txt file from
> qcom,pm8xxx-keypad.txt to qcom,pm8921-keypad.yaml.
> 
> This patch makes a corresponding update to the link to that .txt file
> in wakeup-source.txt.
> 
> Flagged by make htmldocs:
> Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  Documentation/devicetree/bindings/power/wakeup-source.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


