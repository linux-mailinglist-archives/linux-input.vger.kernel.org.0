Return-Path: <linux-input+bounces-12268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D76AB2C1B
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 01:02:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3D043AF806
	for <lists+linux-input@lfdr.de>; Sun, 11 May 2025 23:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEBF265612;
	Sun, 11 May 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuMs4fra"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9812620E8;
	Sun, 11 May 2025 23:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747004517; cv=none; b=oG9PGdzsK2YJULWsBiZmIfaauyT4mddqc7NcdyvmMYlYo687/NpoY2OmAf6pvoJqdsdjl761Mg7pb8KP7h7mW3rIagYRh1yFY53WECziVC/y2BKtqsGcr+vFLDSDxoYHjmnAB6oBMDPI4zOT35y2uY82foAfCn/QC3EHN7VozBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747004517; c=relaxed/simple;
	bh=fDzgMnram4JOIfTMHY4BeJe5f98wVHCb2fz0Fw+Oxno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tICMeSyR84nTq4e6OjHLzJkIGgt93IcsaR652dM8euhLSWROGaRmzpty16E/mFOQ0Nk5l6MlEJ9VY5jbbW7wgQVEmlaDAnloLNUOhvkih7w0Z6KgusXUXg2A6uGCChfvprxAIKke2TZAf91/KAAs88lJrcWaLLhBVQyZ3344eno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuMs4fra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F85C4CEED;
	Sun, 11 May 2025 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747004516;
	bh=fDzgMnram4JOIfTMHY4BeJe5f98wVHCb2fz0Fw+Oxno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XuMs4fraESTy+t5R8ybfLmDZAJTZMTtvBYMx3KqoGFefWRczkXt7d+/p2MoKxjuQg
	 GMslzwlU+P2aqWO6IEZN6pdkh7byXMPQQkm1zEjsmCS0Iixlue7kGVd4Qw7kPpwYvC
	 O7ub2H2Zo/o77+YgUNzngqYbv89D63jeNkydjvSCzW+xEBc4oiFV+q08RJykSWLHU4
	 TiuKP6XpC5Qfp+WGYEhD9NaBdntVcN+I0xySvezGoExatnN2Cs0y8p4lzTVgDIUbhw
	 LgJF53A81MGmwceHalyqQmc38eKeguunY2M2b+br0gC+U8GV3VE0FkxKNX40SEYwEy
	 efX9inScWbhVw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH RESEND v4 0/4] Add Xiaomi Poco F1 touchscreen support
Date: Sun, 11 May 2025 18:01:37 -0500
Message-ID: <174700447992.10930.15859897089243994773.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
References: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 06 May 2025 13:18:37 -0500, Joel Selvaraj wrote:
> In the first patch, I have updated the edt-ft5x06 touchscreen binding
> documentation. In Xiaomi Poco F1(qcom/sdm845-xiaomi-beryllium-ebbg.dts),
> the FocalTech FT8719 touchscreen is integrally connected to the display
> panel (EBBG FT8719) and thus should be power sequenced together with
> display panel for proper functioning using the panel property. Since the
> edt-ft5x06 touchscreen binding uses almost all the properties present in
> touchscreen.yaml, let's remove additionalProperties: false and use
> unevaluatedProperties to include all the properties, including the needed
> panel property.
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      commit: 424246ed3e5d1d7b4a33e2b13a30c8d1b284fad5
[3/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      commit: 2be670d00b4002f56b11a57a510540001ef1cacb
[4/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support
      commit: a18226be95c7ae7c9ec22fd31a6124bef5675c64

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

