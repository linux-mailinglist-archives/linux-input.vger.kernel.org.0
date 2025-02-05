Return-Path: <linux-input+bounces-9790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F26A28799
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 11:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B773A8F44
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 10:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E592A22B584;
	Wed,  5 Feb 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIXaXcP7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E8821A945;
	Wed,  5 Feb 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738750166; cv=none; b=lLqvvzXYYewMwcAxmMxBwrq6kRTAXD4BT9DzVJs1iGqZh6OnkbkkPRyRqwmY/az5fM35gqoNAsgmD2zZAtxG3Z5UcsAEzZUpbabx0i/5g+H/V1RBFC4h+UFEYTuOdjWBf/M2i0U3UltuzLcw8k4kBtSD33gzpWpefDTm6xs2KR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738750166; c=relaxed/simple;
	bh=wcO0snABHQ/EQlJRhm7GcrcM4rAy14UC6Dnnsk8wbVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KdhJ8xoJts4ykCOnc/goFIXu4Z7uKw5XE/7tZrx/TYeS1VQUMMM5ZdEoprdORM2xljXE4sa3OEMAsG+vlDFebk4OZ4qocFJTTo4gXA4rt60DGfpHNloTB7c44bkHOKzA7UKyO7VMIWPFRmdczwnfyX/rHoxwAc3a08Ie0OeweSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIXaXcP7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C25C4CEE6;
	Wed,  5 Feb 2025 10:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738750166;
	bh=wcO0snABHQ/EQlJRhm7GcrcM4rAy14UC6Dnnsk8wbVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIXaXcP7VjYb2tahYBouaQIsm+B0Pj3pEpFHpBM5QBAsZBEe14pnRaexLj++442Pf
	 C+wbRjwLmL+m5FMZ6DdkbPL0lPKCac6q1v56Sf7Nm0lmyhQFqyvFTocKDcpTEYFnII
	 07398xW6at2BojjUi9thVCWhZQ06wiZXuRhR6KkhWYJS9eonnLNKseKwZg+yfYmcmF
	 BcrRsLrH4d4NxkMZchWCfmXpv5gDVHsCvFUrmMUKBIti3lHZc4qN2OwS916MoKvT7w
	 othU07/kideZpBID3TIi2Ilh+VWB/tOdvG32QQ2a9D7EHieD4jnjbqGShYqHghS2h5
	 SOXglgoRjlKGw==
Date: Wed, 5 Feb 2025 11:09:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fred Treven <ftreven@opensource.cirrus.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Trimmer <simont@opensource.cirrus.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	James Ogletree <jogletre@opensource.cirrus.com>, Ben Bright <ben.bright@cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Jeff LaBundy <jeff@labundy.com>, 
	Heiko Stuebner <heiko@sntech.de>, Karel Balej <balejk@matfyz.cz>, 
	Igor Prusov <ivprusov@salutedevices.com>, Jack Yu <jack.yu@realtek.com>, 
	Weidong Wang <wangweidong.a@awinic.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Paul Handrigan <paulha@opensource.cirrus.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>, alsa-devel@alsa-project.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH RESEND 4/7] dt-bindings: mfd: cirrus,cs40l26: Support for
 CS40L26
Message-ID: <20250205-large-brass-stoat-9c0fe5@krzk-bin>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-5-ftreven@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204231835.2000457-5-ftreven@opensource.cirrus.com>

On Tue, Feb 04, 2025 at 05:18:33PM -0600, Fred Treven wrote:
> Introduce required basic devicetree parameters for the
> initial commit of CS40L26.
> 
> Signed-off-by: Fred Treven <ftreven@opensource.cirrus.com>
> ---
>  .../bindings/mfd/cirrus,cs40l26.yaml          | 81 +++++++++++++++++++
>  MAINTAINERS                                   |  4 +-

I don't understand why you decided to resend the same two days *AFTER*
you received review.

No, implement the review you already got. Resending the same in such
case is not only unnecessary noise but actually ignores/skips the
review.

NAK

Best regards,
Krzysztof


