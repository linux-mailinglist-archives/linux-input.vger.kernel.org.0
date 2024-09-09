Return-Path: <linux-input+bounces-6334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FD970DD3
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 08:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0701F22596
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 06:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECB71741FD;
	Mon,  9 Sep 2024 06:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMwX5SX8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC02101F7;
	Mon,  9 Sep 2024 06:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725863115; cv=none; b=UwXdanML1w4jaojLzfPQxltmKIs/Tgxify5P/0iHwwHaAdz2cQpdISrvaFVXabh4h3AxRvZCZ1sF8TB6iKuBbtBAuRVsBliQbFLjHCJup7Sc7vLz4cUv//dND4BnbfEj+sQdTPeh8x8T3WoGT9J98wgUUkIx5ZM2cE1YDUGVFY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725863115; c=relaxed/simple;
	bh=y6p1DE5DpeDCpT9qcHyG0X/sFOyTpACS9mt7eSNTNOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERmkvQedpnoqKdFdvlvc5FEF8Btfsd8C0009vM+EtsprM3YnYW9X8+0Chwtia3+y8/wPC3Yfly2pzSsQadvylSwds71mCmp462pfZToHguBLuSZyUBaplVuZ2xv6aT/ARLjp+bSeyMffggQEVmuzvn28sLAZVGAblJfRx2us7x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMwX5SX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85770C4CEC5;
	Mon,  9 Sep 2024 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725863114;
	bh=y6p1DE5DpeDCpT9qcHyG0X/sFOyTpACS9mt7eSNTNOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mMwX5SX821UKyrggNf60JiGRC30c92UwYXOKV262/qQ9V6x8oo4yMKSAwHqnQHK3s
	 73IOXt4m1MSbZU25VaHf91Ow6Pl+aAJHGeX+TTSH6Ut8mnnrJgFfYVKb2qsqUOhlzA
	 YfydZhc5K/1LV8E7rK1qfR4fG5j3SL8v8UIQxv3mW3MdRg4+MMR8JpnpvNnII89zsk
	 rp2tMDLyPOzv4D7nHa8451bneAoemAxnl9+f/CEdDNbbwuaFyBnX48AU0bqPN/xDgj
	 jW0fk4q9GpavqnWcBTLt6hwXl9rCOquzOhNs15xUg82U01VLoAolWGh51qoDcoLvu0
	 eIYhGODtARbMQ==
Date: Mon, 9 Sep 2024 08:25:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	igor.opaniuk@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jeff LaBundy <jeff@labundy.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
Message-ID: <dcbpkytpp56vqewjjqagdj7zful7l4kprhc5bjnu656pwgy4bn@3op2dcj6o3e3>
References: <20240908113027.69471-1-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240908113027.69471-1-kuzhylol@gmail.com>

On Sun, Sep 08, 2024 at 01:30:26PM +0200, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
>  .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> 

I asked to do some minor tweak if new version was going to be send...
eh...

Best regards,
Krzysztof


