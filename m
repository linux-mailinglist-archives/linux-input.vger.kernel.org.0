Return-Path: <linux-input+bounces-13155-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B30CAEC3B7
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 03:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 217BB7AB251
	for <lists+linux-input@lfdr.de>; Sat, 28 Jun 2025 01:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D421A01BF;
	Sat, 28 Jun 2025 01:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="o10c/Ov4";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="o10c/Ov4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366219E82A;
	Sat, 28 Jun 2025 01:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751072735; cv=none; b=nWSFGuhmvnMB1233Lsbvjcb3lBFgpoYCCx2tOjTCf6KDl5c08F8emHm0P+DFx4VafcvpmmSu3/F1+6WkPuQZK1ZxCRF8oACFOp/dc57F9cmlBzcWiglqEX6EhkVyMZ7+aoJlIwU4xXCjaFIm2jnC7WMnU17Djkmd8/1vstF+ax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751072735; c=relaxed/simple;
	bh=TpUWAVaLMF4ulXcMSeUq6hXbTlYEUlPjAt0Xg4D3NSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3v8RN9/0FpxmRebb0OUOJoOZsKMrmzVuKSFxVCLGCZujjkeRuYFvV2zqYHxXrfr4doPke2klMrgfAOYgFSHRwvAPHfGbiEtwB/ogSaaqSRkHy/okZldE1QLWCkO86uaGdG1+m96+IdYa7K0Ikqv48D0+urtCjdSTxtPzc80fGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=o10c/Ov4; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=o10c/Ov4; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072731; bh=TpUWAVaLMF4ulXcMSeUq6hXbTlYEUlPjAt0Xg4D3NSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o10c/Ov48oF4yT8PSHvLCTPLQ3p0vHQaG6xF7Ny9KxYrG6UGp66QfqDKDCa+zIJiG
	 svDMaFxRCD14bVYn45m7F0tJmIoRKcE8H66ZKPQvsL8qLbuQ/EfELCrQVEZyaBmWEe
	 WFyWedUjy+dciLN4sVgksReARWAjubasaVgyX1LckwCJnsf99G4mjotJB0HX1qq0Bb
	 Ki5u/n6kuxoCfr/Tdgy0z3f/xxxiKAvADzt3eTkiI8dMDtx26NrfEB1ENnJQXL9QS/
	 nEnbGlmZse6zmKNp1TP+lvRGZQ6gEESmi5g9OnvoulMhrd4cuQGp6v7MeX+R5rZuhX
	 giuxQqRVc8Pww==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 5D0153C4FE4;
	Sat, 28 Jun 2025 01:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1751072731; bh=TpUWAVaLMF4ulXcMSeUq6hXbTlYEUlPjAt0Xg4D3NSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o10c/Ov48oF4yT8PSHvLCTPLQ3p0vHQaG6xF7Ny9KxYrG6UGp66QfqDKDCa+zIJiG
	 svDMaFxRCD14bVYn45m7F0tJmIoRKcE8H66ZKPQvsL8qLbuQ/EfELCrQVEZyaBmWEe
	 WFyWedUjy+dciLN4sVgksReARWAjubasaVgyX1LckwCJnsf99G4mjotJB0HX1qq0Bb
	 Ki5u/n6kuxoCfr/Tdgy0z3f/xxxiKAvADzt3eTkiI8dMDtx26NrfEB1ENnJQXL9QS/
	 nEnbGlmZse6zmKNp1TP+lvRGZQ6gEESmi5g9OnvoulMhrd4cuQGp6v7MeX+R5rZuhX
	 giuxQqRVc8Pww==
Message-ID: <dc0da3aa-f3b0-45c3-b3d0-bf365ab2faad@mleia.com>
Date: Sat, 28 Jun 2025 04:05:30 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: input: convert lpc32xx-key.txt to yaml
 format
To: Frank Li <Frank.Li@nxp.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..."
 <linux-input@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/LPC32XX SOC SUPPORT"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
References: <20250624200659.2514584-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250624200659.2514584-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250628_010531_401950_92253A23 
X-CRM114-Status: UNSURE (   5.62  )
X-CRM114-Notice: Please train this message. 

On 6/24/25 23:06, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

<snip>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

-- 
Best wishes,
Vladimir

