Return-Path: <linux-input+bounces-4880-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B45929573
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 00:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 642611F2173F
	for <lists+linux-input@lfdr.de>; Sat,  6 Jul 2024 22:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F7D3AC01;
	Sat,  6 Jul 2024 22:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cj8vp3qc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA92A339AC;
	Sat,  6 Jul 2024 22:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720303294; cv=none; b=q66445/n9N4dGytz3TbiSeTcEKViaMoQJTEMpzdbGG1FnSdz6iUVSzU6QbsQkppF4npeFYwiEL2ICSgMH7I1lcl7/U/7bur+g7ngCoVLkVC1awGEWOxeazk3ecR0DwBGcJie9Kti8lYw2L1JZBfrlLdiCoCaoWlCqqO7THD2aJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720303294; c=relaxed/simple;
	bh=b7FMk8yaivqnVyPJYtM/vlRfAHS64LY/MtAAWWYBIw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVnSigItRL43K6xAg1Y2HHKCs1KtuwyjbAMWQBLveH8v86aj+ZqCrUxm6or5ORuQQ8bbH/e2vx1cS8TiBGbhlP4dIF9FRwXCfxCf/wGGZAK1qW06C8BdX+9SEFbNBMLnT3cg4dn60+cfxDsqYQlfg34BImq9yC2D4cOgDW1NBoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cj8vp3qc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E77C4AF0B;
	Sat,  6 Jul 2024 22:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720303294;
	bh=b7FMk8yaivqnVyPJYtM/vlRfAHS64LY/MtAAWWYBIw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Cj8vp3qcKaHQcnApTZSzvonT2Gl8hVyR6gdGsAinVKnzEw8c59E1aRf98Rm47mMhX
	 m9hdeHelpVfAnJufCOYy32RwFEplKLsL/S1pL7X7j+pwqJw/vmibfnw3j+R88pV1Rh
	 obt+Z5yvTFK1mXoPGCseZ9iltk05b6qxwNalWCKH41k9HpakerfD0o/CVJ/Bz0Tk3L
	 FH1v8wEABKd8KnQS0iTOLX2RwaExSbDRTGBXiBCXa1Up/NFkot+HUKd1uSqhwe6T1U
	 dBxBHKNWaOHVx0RWN38D5HBs+wnIrvpTIsnvmPSVWlj6KEkq6asf/GPaRSB3zKtcnT
	 xze/VrGd/IupA==
From: Bjorn Andersson <andersson@kernel.org>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	konrad.dybcio@linaro.org,
	Jens Reidel <adrian@travitia.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add vibrator support for PM6150 PMIC
Date: Sat,  6 Jul 2024 17:01:17 -0500
Message-ID: <172030328811.28909.3827861968759501138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240606181027.98537-1-adrian@travitia.xyz>
References: <20240606181027.98537-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 06 Jun 2024 20:10:25 +0200, Jens Reidel wrote:
> This series adds vibrator support for PM6150. Was tested on SM7150
> (xiaomi-davinci).
> 
> To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: qcom: pm6150: Add vibrator
      commit: e3e169cd28d0ba80d25ad683e076b299a39e8526

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

