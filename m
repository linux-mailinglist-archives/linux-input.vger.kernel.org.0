Return-Path: <linux-input+bounces-14449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C73B41C2B
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 12:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3612177C71
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C463347C7;
	Wed,  3 Sep 2025 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8XM54Q9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024E32F775;
	Wed,  3 Sep 2025 10:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896388; cv=none; b=WDpWdYLGozFBNvNEBvMeEKj2/hcrD4OSlnuJig5bWHaZjg4GkuwASelbV84LH+AYEXHPPqP3aftUIvmvHnEZPHa0s/XhNq11VWq5mrTmirvb/Q+qmO010rtUTKz6ALzbABp3W2xODkXBXLNLAWck+rbWabOJGd8cmSbeMmlubJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896388; c=relaxed/simple;
	bh=xCORtF7Xtywho3xt/2429Hnazk0pyqIkbRzbJS8JLhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXPeZ1K7bEV4vkKl2lu8huKWKiaSK4t/KRW1F4H32pElMFnmzDHr6MJXXR/0b5++8XnIxvka4OQw9aSD/UbGBzPPH6v4+3gsRxsdDekNL0jMmz5ZV5V9B9dAC7vi69uc/o2hUGxlE1B+7ZXMXroHpCnpVblXlTElTMMs9Bl1Kwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8XM54Q9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D65EC4CEF0;
	Wed,  3 Sep 2025 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756896387;
	bh=xCORtF7Xtywho3xt/2429Hnazk0pyqIkbRzbJS8JLhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8XM54Q9mNYCmYa3DjMoNaOvXBat723N3OcHQ6DSrGMb8h1WkPE9hQ946XJ//iceG
	 Qggqn7vFvTQKklfNg2x64d1S8bMSjP9MDniQ/fRuSXgpFotqlozaGxMTfAKhqM4DoV
	 W7WxKJrLi2Lu6SffhVk6q2zxofwZS7tlQSJa2y/FltWKQ1aWVc6Z1yElGytNN0vmL0
	 pIob1nV+tAg/EtM9Kwt9lxYPrkSeB55mvrxVlIFz1aEQbnylqR+wP9FKJQrWybfzfx
	 NcmNVT8iXxgaTRKOC1nTw4jgjLnfYerZlpD5M/koCjZLxp/X/EsR/AVKI+zsW3tHtu
	 g8LMFak9ektHg==
Date: Wed, 3 Sep 2025 11:46:23 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michael Walle <mwalle@kernel.org>
Cc: jcormier@criticallink.com, Job Sava <jsava@criticallink.com>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 0/3] mfd: tps6594: add power button and power-off
Message-ID: <20250903104623.GJ2163762@google.com>
References: <20250826134631.1499936-1-mwalle@kernel.org>
 <175689630841.2597045.5125819314695096057.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175689630841.2597045.5125819314695096057.b4-ty@kernel.org>

On Wed, 03 Sep 2025, Lee Jones wrote:

> On Tue, 26 Aug 2025 15:46:28 +0200, Michael Walle wrote:
> > I took over the series from [1] since the original developer was an
> > intern and is no longer with their former company.
> > 
> > Changelog is in the individual patches. But the most prominent
> > change is that the pin mux config is now read from the chip itself
> > instead of having a DT property.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] input: tps6594-pwrbutton: Add power button functionality
>       commit: 170031ff27dd7a07fdedee7f3710a19dcdf889bd
> [2/3] mfd: tps6594: add power button functionality
>       commit: d766ca01c208bdf0f36098607efe1e250ccf41c5
> [3/3] mfd: tps6594: Add board power-off support
>       commit: 2215a87b02ad8d353cd3edebd1bed01db2458986

Submitted for build testing.  Once complete, I'll send out a PR.

Note to self: ib-mfd-input-6.18

-- 
Lee Jones [李琼斯]

