Return-Path: <linux-input+bounces-4704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C8F91C12E
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5082F1F21977
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644701C0059;
	Fri, 28 Jun 2024 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb6IHOg+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FE21E53A;
	Fri, 28 Jun 2024 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585511; cv=none; b=SYjhMUClHwjiikcBjjJ4w3nnLH1cbumd1L8gEd6btMXRR3sXgXWd7gA7K8tnHh5y11bfOqn3X06hpzQcVEjDZ61SRwLhKGRlmqc0jAhhMqbbvEOclCao6qtb3WZibWyn9eJWgoguubzzgnZBlxvPaRLkzrTa2uGBd2bTlR9bFBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585511; c=relaxed/simple;
	bh=S77P6hCs6k5TSReuDXuJabBjZ5plYzPPz7TpKAhogdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YVKp0YGVXwESg6Inw1jAPWmUC859KBejPniVkZsohGUydoplC3xk4UN9EuoZFTBB50hs8PPb2m0GQWXPNiVWFLNh+0LzmlLnM9YYcmmH20vZX102dNNcyfa66WYa8DfscXfNnL/lKQs1lhr84ZM3Bsmbv5pshhUXd38DfhAmgv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb6IHOg+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768B7C2BBFC;
	Fri, 28 Jun 2024 14:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585510;
	bh=S77P6hCs6k5TSReuDXuJabBjZ5plYzPPz7TpKAhogdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tb6IHOg+LPFCBO1dMkVG8IBbHi9aMjNrvdyR9sId1LjY/7S2AgRCHV4xypExq1+P8
	 e+ZbndLnLE2IThAazan1iP1Tb1nFUvybC+7XqkupnVovq61Y4A5cMo1C2LApoccUx+
	 L3M4DyleSwdslvtja6upIvzgCvb/1LKVFTNmBK8p0vSOEtpZY3Sn8rpW/uhz/u7Lva
	 2KpeI3A/kWIN+BXjkjv0Hm4kyx04xlJPSwNP8InoECAclC8Oy7UQmDK6gvFTxBruWm
	 HggY5KmmCnoZ4Vv/L840QzpPq1YxyU/3xQGTR8kWTgTrlyje4zFcYjqjTFJT4hi9NK
	 xwDYHvYS5xMRA==
Date: Fri, 28 Jun 2024 15:38:25 +0100
From: Lee Jones <lee@kernel.org>
To: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	broonie@kernel.org, jeff@labundy.com,
	James Ogletree <jogletre@opensource.cirrus.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Message-ID: <20240628143825.GP2532839@google.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <171958538756.3311721.9922103612711130930.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171958538756.3311721.9922103612711130930.b4-ty@kernel.org>

On Fri, 28 Jun 2024, Lee Jones wrote:

> On Thu, 20 Jun 2024 16:17:40 +0000, James Ogletree wrote:
> > Changes in v11:
> > - Constified function parameters in ASOC driver
> > - Removed an unneeded #include
> > - Changed number of max FF effects = 1
> > - Minor refactoring in Input driver
> > - Reworded comment in MFD driver
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] firmware: cs_dsp: Add write sequence interface
>       commit: 205fdba5d0ffe1ad8de61763d74323e88b640d41
> [2/5] dt-bindings: input: cirrus,cs40l50: Add initial DT binding
>       commit: 2fab5abad124fe7e1b99ccba3305aa4c5a24496b
> [3/5] mfd: cs40l50: Add support for CS40L50 core driver
>       commit: cb626376cbd00cd69329371519a8e9568baef715
> [4/5] Input: cs40l50 - Add support for the CS40L50 haptic driver
>       commit: c38fe1bb5d21c2ce0857965ee06174ee587d6b42
> [5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
>       commit: c486def5b3ba6c55294cee9abc7396d9dc18f223

Submitted for build testing.

If all is good, I'll submit a PR for the other maintainers soon.

-- 
Lee Jones [李琼斯]

