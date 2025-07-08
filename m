Return-Path: <linux-input+bounces-13428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75780AFD804
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 22:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 856863B3EF3
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 20:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BCD23D2AD;
	Tue,  8 Jul 2025 20:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pRG4ak4K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130B188596;
	Tue,  8 Jul 2025 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752005702; cv=none; b=rTJobpHL5ye7w+CDoOtHE3VhZiQ0R8GYMs0KnOOb11AVO848NxkDjJrjVyz5mIfWg1O9Y+s7uHtpRz/ViBXzKp3wDV6f3teQCOsd+2M/dyq6or4KBDJTFmNdYsWj4SXbBOZPLEjLFQQGED36wN9VDjSErXh6nv44Qr+hiowS2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752005702; c=relaxed/simple;
	bh=+hqQk6xFLmuAN5hbHH7Ah1KrkQUEmGmXnkg8briSWwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8ogGj01rz01ydm848ugAFeZi/7SHrZObsLd10f79oB8i/9v+K7vqY4nlQxLhXYbZDjSmgM6v5llSyHvDPiqy2jEC0TSgCZzpf2kRrfZzfwdO5Xb4db2kGgXr0Eise46Js0solEEIM5QQi78Tqsnfr3qmUPpr2qz3YD2opziX3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pRG4ak4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EE3C4CEED;
	Tue,  8 Jul 2025 20:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752005701;
	bh=+hqQk6xFLmuAN5hbHH7Ah1KrkQUEmGmXnkg8briSWwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pRG4ak4KyQhbFmSO4eGOOn0W/sSpvD4K0Ehk4qNZO81vMmH6HVVSCWvJf8+UIuD6e
	 g/3YryjFebFBwoDuPb2db9mvu1qY6O3Xf0ZZwIDc4DyUnlHNiimvoPSkc4rpEwvA5F
	 M5WanvL0gOKcuk6VZFmtj5J3YFk0QkNUCIlnD6jvXRRAgup4BV3jn6iU9eOm5IKdt7
	 +kaBfagxTy/foxvzx/eXvSSnZBbWZhBXaD3OZmq9EizYV07PgcMFUcT5BoqGgqAUiz
	 8SE7aK4DZVC+jYlQdQZT4jbYu8jPtwzTbZIuN+OQV0G1BB63oOErbHg9IgaR4Cd3OP
	 7uCAfWbiKxVzw==
Date: Tue, 8 Jul 2025 15:14:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: syna,rmi4: Document F1A function
Message-ID: <175200569935.897402.7503152684767093360.robh@kernel.org>
References: <20250707-rmi4_f1a-v1-0-838d83c72e7f@apitzsch.eu>
 <20250707-rmi4_f1a-v1-1-838d83c72e7f@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707-rmi4_f1a-v1-1-838d83c72e7f@apitzsch.eu>


On Mon, 07 Jul 2025 21:54:25 +0200, André Apitzsch wrote:
> In some configurations the touch controller can support touch keys.
> Document the linux,keycodes property that enables those keys and
> specifies the keycodes that should be used to report the key events.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  .../devicetree/bindings/input/syna,rmi4.yaml         | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


