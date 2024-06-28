Return-Path: <linux-input+bounces-4703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 444F091C127
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A97D8B216ED
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57021C0052;
	Fri, 28 Jun 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DC1TqMbe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A61E522;
	Fri, 28 Jun 2024 14:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585390; cv=none; b=b7ReVuJq7TU+iMJXj185US5ebVrj+mEelSXL5FrE34LwB8SClTREi9ylIWcTTbgUyROCCwNBYRtfxGmTvjeatU0NLS02ajYyrAZefEBCoxWwpJn7X60wEpW9iSRJld72itIQmKG8xBsICaB+8fY7Vi4sE9YxARcWNcYmNc1kyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585390; c=relaxed/simple;
	bh=spqwbjtFsgEKo2SVTzF7qyYyS/KPXyhIwwS8IkgZw9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tma2wQ8IEqGOHoNVUdvamcR22YtuIURVwnsUctIBBluhbZe+hKt07oEEnyA7FIhYf60rqf/V3ld0fQ8aM2wHRk247l1lDV0OIB3LOUK+aEdom19b62K5phHV7KIlCQ8tYPhA46ZuNLq1yyXqwKxwdVxdJErcKJYzeJFgydNagVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DC1TqMbe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D74FDC116B1;
	Fri, 28 Jun 2024 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585390;
	bh=spqwbjtFsgEKo2SVTzF7qyYyS/KPXyhIwwS8IkgZw9g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DC1TqMbev6wyBRDKvI+XZMg5XWaogkmLNT/l8I4NrqaUC2dTDDXIQyzLjE4nZfvZf
	 KLe7OS3Jik7WNSjWPk/wV34z8QxY4R5bnFqlirmBZnXH8M3z4v8PL7Yju8kSN3AatZ
	 UZf2s+HY8elzAn1ao/0SvVpYiV81wBtpKYKsjTeZNZqprBbLp+0s2RItLALrbMTfPt
	 CE9pV2bYrsn1HXG9/LruaTnBQurH/q3O7LK6Hc4ShjHmM8d96F/yXFhN8QH9rLV63W
	 /lfuYZN7tpTzZ+hpLpyqTJ60qb1cfXFhu6A08greN+DoEKjFjBNWVjbH9ykCflttm5
	 LV+HRbWsyEJTA==
From: Lee Jones <lee@kernel.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, lee@kernel.org, 
 broonie@kernel.org, jeff@labundy.com, 
 James Ogletree <jogletre@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Message-Id: <171958538756.3311721.9922103612711130930.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 15:36:27 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 20 Jun 2024 16:17:40 +0000, James Ogletree wrote:
> Changes in v11:
> - Constified function parameters in ASOC driver
> - Removed an unneeded #include
> - Changed number of max FF effects = 1
> - Minor refactoring in Input driver
> - Reworded comment in MFD driver
> 
> [...]

Applied, thanks!

[1/5] firmware: cs_dsp: Add write sequence interface
      commit: 205fdba5d0ffe1ad8de61763d74323e88b640d41
[2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
      commit: 2fab5abad124fe7e1b99ccba3305aa4c5a24496b
[3/5] mfd: cs40l50: Add support for CS40L50 core driver
      commit: cb626376cbd00cd69329371519a8e9568baef715
[4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
      commit: c38fe1bb5d21c2ce0857965ee06174ee587d6b42
[5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
      commit: c486def5b3ba6c55294cee9abc7396d9dc18f223

--
Lee Jones [李琼斯]


