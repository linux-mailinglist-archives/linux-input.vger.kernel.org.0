Return-Path: <linux-input+bounces-9742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1561BA26777
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 00:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49A4D7A32E1
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 23:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA70212B10;
	Mon,  3 Feb 2025 23:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVcI6wDT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ECB21148D;
	Mon,  3 Feb 2025 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738623773; cv=none; b=tcTO8CVjsEzaSdiV9Mr3l4yTmdkiTaqiBnn2/xHQs0J7SS865+kGCZiRehqcPEW9TEQdqk9c2nmX444ATvno/IgUp9zziatL+v7ZhoQSeTI3uIawHlTb8/hAjeh7t4Gb5JsEIIZbQNkd9FndthrtAdSglIYvqmlP0B+UH0XCjtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738623773; c=relaxed/simple;
	bh=Ik/acs2fxYmB9dYW8Lr6jv74jb0VD4Bwmp5LIbEzDys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JTiPvCEAucpkrAnKTHfuiiVg6rDSekBOFLW9WSMO6EKOgx64xnwMmmijVI44UCRfzxb8fdysz4LYj4iD67Pz8huneRUtwqI+F1QNZQpaCNFCZf32DmHkDyENoLbUOx/cXHunYQnVV/shfCdjrNsn6VbyZfScrJbENXEhMLeQ+y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVcI6wDT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8F6C2BC9E;
	Mon,  3 Feb 2025 23:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738623773;
	bh=Ik/acs2fxYmB9dYW8Lr6jv74jb0VD4Bwmp5LIbEzDys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WVcI6wDTXmsDYqsZSukBYpA2p4ha4kYI4kTeNM0XStm+RENQDGbPN2lRiHl8IdwL5
	 d0AvjLZBpsZDy6GTHUlrfSU8bTQ61mqlzwWULZNOsq29BkrNh2rdumME0xmmd8AgWf
	 FCdtE2eRAba41HihXlXDouhUTaqm5mV5WD5DyLAZ9GYLxf7wCZm23PgoBrP7+ax0mI
	 OUbxfIOFB0h9J7iwkqEUndQo7MhyaKY3bbm1/WVapXqiZ8dvAQfvcjlyW1T4UaK09U
	 au7bfb9Kdgp462dR2h9y6Ibz5HWEJRxa3OmZLRewMK3QtTx7i9oovLZb74bmh9ulif
	 vsFE1DuWzHb4g==
Date: Mon, 3 Feb 2025 17:02:51 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Reidel <adrian@travitia.xyz>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux@mainlining.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, phone-devel@vger.kernel.org,
	devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Luca Weiss <luca.weiss@fairphone.com>, linux-kernel@vger.kernel.org,
	Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix,gt9916: Document gt9897
 compatible
Message-ID: <173862377059.504653.11429517895166366748.robh@kernel.org>
References: <20250203174309.21574-1-adrian@travitia.xyz>
 <20250203174309.21574-2-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203174309.21574-2-adrian@travitia.xyz>


On Mon, 03 Feb 2025 18:43:08 +0100, Jens Reidel wrote:
> Document the Goodix GT9897 which is a Berlin-A series touchscreen
> controller IC by Goodix.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>  .../devicetree/bindings/input/touchscreen/goodix,gt9916.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


