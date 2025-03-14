Return-Path: <linux-input+bounces-10850-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A6A62216
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 00:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 38D064210F8
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 23:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731F41F427D;
	Fri, 14 Mar 2025 23:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eYz7rUHG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404E3126BF9;
	Fri, 14 Mar 2025 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995825; cv=none; b=MxQmqjhjB44dH1O2a7FBD6GamQOYk06r3sfMPX04A7p6D6T0nGuxTbny5zIoeE69tgLiRuEGTYE7cKPMXot2+Ntfug3A4f8c22F8wtHd081521OVuxK7smfPKv2bBtG6qUWPNfASrSXUlR25LhrwCsOWmtL0Jd+EpU3/kVL+F8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995825; c=relaxed/simple;
	bh=rXwMh7DKwUBAV1pWsbA1nv/BVDEbqtMibrCXomL6GL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0huv4JIRPpH9WOy3uQWvVaCHRORX5qMGrIl4YAglGTCPdpwmIkcH25AWRwjZBz8JmDgBPDYSAq16l1lu7fg2JbUnVZfWNPTaoiqfUeJLQLQ3Le88fJq6ytjQpJMLPya+kcFSF5zKC5Lxy4BCQzAP5RiCl9lZYILo9y67lHkeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eYz7rUHG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E4C4CEE3;
	Fri, 14 Mar 2025 23:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995824;
	bh=rXwMh7DKwUBAV1pWsbA1nv/BVDEbqtMibrCXomL6GL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYz7rUHGgBNx2eQl4bluF0GRsaCsWKdPVrd0PDjfhvaBxAqLEq9NwHY0Stjxg9aTc
	 EnpQ6rLuJY8fteJ3VhYDdR1+gP7Rjuj7U2XooR1JY8NESae/CAohGoLzqclc1pYSyo
	 K3Di6WInqaV8HVnnv0FBZaTNUjoQJHwt/5T7lnKiiOVDikwz4aAjxR/VQK7fip5bEI
	 MCN6fo0X+UnH3v21U6VCUrQXLZWA3OF7usMcjQrxfmi+sQTp/sO0H4D3sqg0O7Y3kC
	 xvzPz8+2hWoxgDZFRWw9rcmvUl+vHIe3kC5HenJrxdoC9gpKGEirdtNWua6CcXzABD
	 pLf4hcUBG14tA==
Date: Fri, 14 Mar 2025 18:43:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: arm: mediatek: Add MT8186 Squirtle
 Chromebooks
Message-ID: <174199582298.2541457.8793216796013121859.robh@kernel.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
 <20250312104344.3084425-4-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312104344.3084425-4-wenst@chromium.org>


On Wed, 12 Mar 2025 18:43:37 +0800, Chen-Yu Tsai wrote:
> Add an entry for the MT8186 based Squirtle Chromebooks, also known as the
> Acer Chromebook Spin 311 (R724T). The device is a 2-in-1 convertible.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


