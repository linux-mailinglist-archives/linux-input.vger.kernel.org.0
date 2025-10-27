Return-Path: <linux-input+bounces-15764-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFD9C11C74
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 23:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B69454FDE78
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 22:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185D4334C2E;
	Mon, 27 Oct 2025 22:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJy+PPbH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5113346AD;
	Mon, 27 Oct 2025 22:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604502; cv=none; b=H5Ye9l4X564fZiL/+24MFm4TUoNdbXM3nG6bSI5U23FpuiEnCAv3b9iLrP/bx1cU34OlfJBZqx+ZF83kwPkne76L+ULQSb5ex855Gw58vCdjMXE29aAT1M1vfDdn58KwSNMAp+dZ3K0yZm0NL2l5cuaIGa5zwliytzzE/7FcHmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604502; c=relaxed/simple;
	bh=z99A8Wr3ppiTen/bPrEEn522L6ID9/Zv6WRGSfawi5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T4yxwJpmXShyoL4MmxDOTBDWV6wP152+YM9oz0yJFw/i95De2P/seAd0yKyn7A7yIKu9YA7B8Cuo7V8/gNc2uetHQ+KUrS3Ub0mTnqdJqYYxmnI6DGUjSV1jj1V7Ol8v9UrQBUBmSjLyd2DAAUeOx4Q148tBapil0VZbqFDVw+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJy+PPbH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F560C113D0;
	Mon, 27 Oct 2025 22:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604501;
	bh=z99A8Wr3ppiTen/bPrEEn522L6ID9/Zv6WRGSfawi5M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJy+PPbHhFAQewmJJr9ExubDS7nwhaesfm1X7VL2GiJil9/K1M/yx7LVFA1CdjCWk
	 bSUwQQRxGU6Emy9kndNLKpr81CGBZSzl9UUmHMGUj/DkL/r6UwMdT9oG1nRxZwo1NA
	 Px/0PP3uAPOIBpPD8DgLfD/uV3izd5Je8Rsnj4mrcrGb1Urh+hQjgeaj6G6h6Ko4oV
	 y5FI+GudSN1ZXNnumJZW98RKHDnn0OqWSdrkhwA/FuBtYMe5ceAiFsEThNXjpW9AiW
	 /VtVeNLI+3PJFIH3WoaigZvf5Mgr54F9X+CV5BnrEKNBCGAYM0CbWFbww8XMXD2Mz2
	 WJnNqrHn+EAvQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RESEND v3 0/3] Add support for Awinic AW86927 haptic driver
Date: Mon, 27 Oct 2025 17:36:55 -0500
Message-ID: <176160465195.73268.8461616280795077371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 25 Sep 2025 12:07:27 +0200, Griffin Kroah-Hartman wrote:
> Add devicetree bindings and a driver for the AW86927 haptic driver, and
> add it to the devicetree for the Fairphone 5 smartphone.
> 
> This driver does not enable all capabilities of the AW86927, features
> such as f0 detection, rtp mode, and cont mode are not included.
> 
> Note: This is my first driver I have ever worked on so if there is
> anything I can do to improve it please let me know!
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: input: Add Awinic AW86927
      (no commit info)
[2/3] Input: aw86927 - add driver for Awinic AW86927
      (no commit info)
[3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add vibrator support
      commit: ebb14a39c059694b588fc71bde72f88f9e72a11c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

