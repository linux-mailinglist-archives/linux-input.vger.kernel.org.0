Return-Path: <linux-input+bounces-9057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91601A05577
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 09:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24E853A595E
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 08:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DC21E571F;
	Wed,  8 Jan 2025 08:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRXG8JbC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC41E5019;
	Wed,  8 Jan 2025 08:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325282; cv=none; b=nSJkn5CRQWpHKHNc9PyNHpvX7WN7kmZ0XzuzyYXjxvlWB2LlKFah8X60VJal8CVC2ZVCA/Pg30U0Sz5vghIypPRSnzBzeNJwydJgBQZIsxDjZ2zTbHskg3tXdfRLP5UB6EkzD6D27skpvjPQ1F4nGacx2pf+Ny5rQ1sW4Nzhna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325282; c=relaxed/simple;
	bh=/lYOSoErqgae/JDCumHh0Q6u6tecZ4MvY3yIlXxt8lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0Um7EsOtkmsCf4Z+Bc9fh/FRoYEVmLQYpJu972UgHw961Fny5FLMViuxc1SO5OpQh//+og3Pn5dpyHgmMs/Rthe3BVLA74WTVtY/6rpkbqktcs1htH+Dhll4X6l4HbLvcb7Fjq4PsRZB+S5hTiFCtCwXo6pi09IkETRc5cAM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRXG8JbC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1648C4CEE0;
	Wed,  8 Jan 2025 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736325281;
	bh=/lYOSoErqgae/JDCumHh0Q6u6tecZ4MvY3yIlXxt8lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bRXG8JbCtPSQb5Tp2ucwKFUWRs64uzLPLhL/3DeTxO0DGzcp8+ZGvkXJbPZoutlAv
	 fScT5VKakQ3yLWrtrUhPWN/1JShelw6dtiiKRte9Fe454JsWe0gfh56kCCkJY9Q3vr
	 FHXWUm33Vx4NtgEEcmEBWsAndcgn4z7oy6bAvnXujyUR7K4RX5LKF+amQGWnw2toPq
	 Dkojnpq1EdGBZmto0lFivO3JcApGCHzDLrdSS3I93gQhDoHgPIZ8qA//9ie2fA2wRZ
	 JrUmIwKu635gNCuws3sXC3WkKvrM78E1QoZTsW7fTBv6UU5IDCa3INcub+vkBRy2Qf
	 aZk8jc4w8om4A==
Date: Wed, 8 Jan 2025 09:34:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <z47tu3g4pmoce5qzmf52y74nafw4tejoum27a2xfbblzxbokba@dbut3nrny6wu>
References: <20250107135659.185293-1-markus.burri@mt.com>
 <20250107135659.185293-5-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250107135659.185293-5-markus.burri@mt.com>

On Tue, Jan 07, 2025 at 02:56:56PM +0100, Markus Burri wrote:
> The property is implemented in the driver but not described in dt-bindings.
> Add missing property 'gpio-activelow' to DT schema.

Wasn't this added for ACPI or some platform-data users? It is not really
a correct reason to document something post-factum just because review
was skipped...

Best regards,
Krzysztof


