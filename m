Return-Path: <linux-input+bounces-14576-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EF0B50B24
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 04:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76464467B67
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 02:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E92C242927;
	Wed, 10 Sep 2025 02:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2DaKw3K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BF8241673;
	Wed, 10 Sep 2025 02:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757471799; cv=none; b=TBj4yUZjh1P5aa/hyE4uTt5RK9QIQ/99Ov5mbADO+6jUvfkrUAQ56KYLIMXq1mNOvDLP08i0FMHqW+2L3R5EGd5X3avAXKVOaf8CotXtuunNAzpxOW1ZwfZDERxcPwkzfyxQUv3H4sVrZJp/okYNiJzVcdRwv0aDPAyJmr3SQYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757471799; c=relaxed/simple;
	bh=7LXy0U+1fCW8qn4duZDli2vtbqHftWoW8ljc8W9VqPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQ+L8stDg9ERKxd/zF0T5LUl2Skymyqst/JGc/Z566mGIw0ndzvPQ8Dn3tjfinAiYiKAsA9TisgOYEx3nAY1araHwsiV+MO34ou+bPpXaYiE1oN+l3z9hnRwTxPo7GadVoNgQgIZYtq9gg/ShCpB1PCbKffi68t8fpRUIp25iuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2DaKw3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F905C4CEF4;
	Wed, 10 Sep 2025 02:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757471799;
	bh=7LXy0U+1fCW8qn4duZDli2vtbqHftWoW8ljc8W9VqPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2DaKw3Kbm7DwDwBet6VuOzRh1p9IvD9VDR9F944q9dlYZSqxMYGNlyTvk9MTte+7
	 u5BARDsa+73XYVnGXFs8qyG2/ljE0A1KIYfYjjFH5ciad344dxxDrnM0fuchfOnpis
	 Px0Sf4jm1QAYfEPTVXpNBfmtho32tCuiMpYo32H+xhQZjQncLpj77HOesldWh6JJGg
	 gprH2sK0qyWAgIsNIMQsmJLrDueoe81IV3wLkamFx65c0NhRUWwicoD+1SkjXZK9je
	 f6OeMEem1q3w5Hkk338Ljpd++tffbV5hYYdXfR+OwiH1FuSy4Ddy0MNfw2xtYlKBsN
	 xsAfJXeMIrwSQ==
Date: Tue, 9 Sep 2025 21:36:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: maxtouch: add common
 touchscreen properties
Message-ID: <175747179838.3665416.6625910946432624617.robh@kernel.org>
References: <20250909054903.11519-1-clamor95@gmail.com>
 <20250909054903.11519-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909054903.11519-2-clamor95@gmail.com>


On Tue, 09 Sep 2025 08:49:02 +0300, Svyatoslav Ryhel wrote:
> Since atmel,maxtouch describes touchscreens too, it should include common
> touchscreen properties.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


