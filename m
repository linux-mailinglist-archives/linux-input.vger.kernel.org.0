Return-Path: <linux-input+bounces-4233-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D1F900C03
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 20:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00580B22E77
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 18:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2051C5024E;
	Fri,  7 Jun 2024 18:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee3lp7YW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E51A270;
	Fri,  7 Jun 2024 18:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717786095; cv=none; b=lhg6dbV3yzg0EtgXXJtCt5Lx7NPVDw5ZjBnbNvPpqR9uwyKF5sgVJY31Schu+NwMWemAcElpzvuIqout2mrC+7aGCraAWToIqwmEn7jlLT6LILryTLVX50lA0PJUyHV7W/XKPPttmcAN+k+9mVhegbFgpnX1NnbBFjFLX2N2+Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717786095; c=relaxed/simple;
	bh=DtGgDy+D5KM3EF/EaCxohZ818IYKLcFGHBkvEIlLjoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DJ6gNGDx4MuucxVCUnvC3LWaZoLThoj6luIoOsFlv2zjXgwsVrP9Y/FGnCjer/k4VhNMpQW8S/to8QJ0rjw0t2wiOxyIAEpJbelWFsk3hh07c8N5exXgQITKKng9gRA+AxegQGKr/BuX2YPQdW9uW2BLWp0C4cqaHqVaybDTna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee3lp7YW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED11C32781;
	Fri,  7 Jun 2024 18:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717786094;
	bh=DtGgDy+D5KM3EF/EaCxohZ818IYKLcFGHBkvEIlLjoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ee3lp7YWd80nonZ8cGDbIUHpkB6GiiBD5a4S2yQPTQLz+ZiUJWM3Ffxm/kF6o2SbE
	 ALLh9uNXxvhWYNZtieW5N9DCfp7oLxZep2VEITrQGbaNscLowYzU90Kf/9ouX1QsdM
	 jN2NjKKBoOjmcKM3h27UCcdLoCK/dRSxQi8vo4H9NXNFwaMHmwFTZ90qLDgieciAh1
	 RvtaTYwqxaxdoS92V9QMXT7UAuo1GBjYqePWJ4SAQ77pwUamZWBnBmGbHvYoQk6cdM
	 y+efsj5fxjPib0H+Nr2wIyKGvfwmUR2eK7HA1jHKaefsLTGM3+YfA7y5kTs9j80swl
	 1xRTlTqlOtuaQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
Date: Fri,  7 Jun 2024 13:48:11 -0500
Message-ID: <171778608823.816738.7581855560296370875.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 07 May 2024 16:48:14 +0200, Johan Hovold wrote:
> The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> before sending commands after having deasserted reset during power on.
> 
> This series switches the X13s devicetree to use the Elan specific
> binding so that the OS can determine the required power-on sequence and
> make sure that the controller is always detected during boot. [1]
> 
> [...]

Applied, thanks!

[7/7] arm64: defconfig: enable Elan i2c-hid driver
      commit: e706474d8428f420bba11f2c49c3083fd1b31d88

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

