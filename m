Return-Path: <linux-input+bounces-10488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841A2A4BA8A
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 10:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92CB53A4F1D
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 09:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286FC1F098A;
	Mon,  3 Mar 2025 09:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZ75W5eC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1EE1F03E1;
	Mon,  3 Mar 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993214; cv=none; b=TvTxDOTu2WiFW5YJORtsRo19NLIOsfexoiafw30cGsgp+LCqXoBCTzd2Moy9rcE4d+48EOG5Emi34nusjY03+9RSrVs61cA0WrIW+G0912P8LsrDmktswKugxzNG98xFN3UNgZdHS7Ne5C94qj9Mj7m8VfCvfeFNCHzfiE0Zq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993214; c=relaxed/simple;
	bh=5V6TmhFSAHQi4HZmsJhdIk7VQt3Do/msTQLseRqFGkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKyEh/Cg3A6O+9MrIhwmCEqb1c+l32euOJBiN4f48w2wQUqdrTmMzZDSa1MLyEJYoW6JXn7yJwx8XDgRj/+FOYD2P18ISS7vn1T0lxEWXXgyaWi8jKG5CZQ+MRsoS62rtFDU5mjyGNnbbkZ/B+1zIeSxOdKZpPIZoOVEsFgdtIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZ75W5eC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BECAC4CED6;
	Mon,  3 Mar 2025 09:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993213;
	bh=5V6TmhFSAHQi4HZmsJhdIk7VQt3Do/msTQLseRqFGkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZ75W5eCacvwAP5FxEqJkGL5hOy5MlRoDfpifjgvAB/DM69AxAT9K5d+HEtp0O4Qj
	 GAXmDOFOw2h7qkwODYCPeKNYz0neQBG+69hjRpSrhG+MuElh9N3/qi+7ggBTD+hRw9
	 rjRrXmafck+zX5Cq+8ow72AnOLaXr4kpMPRtgZ4JS8YBsUWg8g9oyzfNpe/ekyBf5u
	 1LO7sNjQwDQfiYtVL5ya5Ux9y+BfGPxLEWwqeBAse4i/OSuOFyW9hG6GS2fc8Mvt6Q
	 JVnp+GenOMQMD/OOolduvHc5q473L0r5AsOp4kjZY0ph6F6LjaKp1ucGvWF2GUuKN4
	 Zfg9PAhGmOFRA==
Date: Mon, 3 Mar 2025 10:13:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
Message-ID: <20250303-radical-electric-tiger-90eb0a@krzk-bin>
References: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
 <20250301-pocof1-touchscreen-support-v3-2-af01c3b30b55@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-pocof1-touchscreen-support-v3-2-af01c3b30b55@joelselvaraj.com>

On Sat, Mar 01, 2025 at 05:43:08PM -0600, Joel Selvaraj wrote:
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patches, we will enable support for the Novatek NT36672a
> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
> Tianma and EBBG panel variant respectively. This is done in preparation
> for that.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


