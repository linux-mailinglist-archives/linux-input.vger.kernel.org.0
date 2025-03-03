Return-Path: <linux-input+bounces-10489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 280DFA4BA84
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 10:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33B4F16B663
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 09:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86D1E1F03FD;
	Mon,  3 Mar 2025 09:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDOtaufM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F61F03F4;
	Mon,  3 Mar 2025 09:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993230; cv=none; b=Eko/9k+hR9jbHz4SA4fboTq56x6p/VJOBTmwtom7NtQjMBjyqO2jKlv8IjW78jSh/3pzDsJiSQJWIHW0ZqURHYCTpzKEtHh9meD6NZajen381/wiNAj5ofTNkEFyW0GQcQ+h3d4SXP0MbvIbdAPV+h2pdv0ltRdy16f6w/vO4vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993230; c=relaxed/simple;
	bh=cbX1IZV2u0T3mIg8u/7c8HZDjjLHtTM0zS/axg4Z6JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAjCp0LdOVKT+fva5YQN8N76QOmGmjIxs0o46vu6f+ieYpXqmRut+Cot2Tk0FSmrj28XTfydIxaiCHzvO31Is5rWK8J2YCbOFxWtVm8foWeejNeE+L33cNjwA88GIuGMxGlCwtKxORThnnuNmnmBH8uWFlrQkRCTZsFxg4OVjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDOtaufM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1BAC4CED6;
	Mon,  3 Mar 2025 09:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993229;
	bh=cbX1IZV2u0T3mIg8u/7c8HZDjjLHtTM0zS/axg4Z6JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aDOtaufMxbaHYemQkA1sEn2VFhvpVjNbRGg4s3snDQeousQZufRD4/mp4Jjg8vzdK
	 AiQWk1tciD3yQ+XDsAk5CZRbRLSB9SfMT8nuOm22s+onIra+P0D6fyIVHzQAjuUit/
	 EiCkTOZ7pAvnPrPZm28NCEkm8XTgXKsoY3UVgLp4Q/D8aS6ulDbg5j5+ftR/71R214
	 Vx6DtQ5zkH/dW27eJ6Win6mBwovAhcHx6S2FFzOXENf17AwrrF4F2D3aJAoq9jECIq
	 YMVmx5QQTo91y1xV/T0dvwqdsEvcr5lm2/pw0AdIh0tjYIfhHLVVCbH5lO6Yp4I4W4
	 MnDBV+CMruW4Q==
Date: Mon, 3 Mar 2025 10:13:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
Message-ID: <20250303-flashy-venomous-seal-44ad2d@krzk-bin>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
 <20250301-pocof1-touchscreen-support-v3-3-af01c3b30b55@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-3-af01c3b30b55@joelselvaraj.com>

On Sat, Mar 01, 2025 at 05:43:09PM -0600, Joel Selvaraj wrote:
> Enable the Novatek NT36672A touchscreen controller used in the Poco F1
> (Tianma) panel variant.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> index e9427851ebaa..b58964cde834 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
> @@ -13,3 +13,26 @@ &display_panel {
>  	compatible = "tianma,fhd-video", "novatek,nt36672a";
>  	status = "okay";
>  };

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


