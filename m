Return-Path: <linux-input+bounces-9092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95502A0705B
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:52:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D222C3A6AEF
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 08:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858C8201002;
	Thu,  9 Jan 2025 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUrBrvNP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B01EBA19;
	Thu,  9 Jan 2025 08:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412748; cv=none; b=jLn134EiWPEY2jR8kHZ0ijeSDfxzrqLQ7M1/K+8Om/bfDwpeQesDxTMCNwpwpteeM9pumkLQR1hlRrjoFget8NIGpWlCIzkSOJ85O5vxI7zkHTU0DWUED9rC8rfH9brkFWKrG+M84HSa4G5zqQf/iESRwrQE/YsL6Q+ba5sJlsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412748; c=relaxed/simple;
	bh=TvUNJv8yJjtpo185rkOPuPVGK4fNp0KoEpN/gIjMEhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHIWNeA6LNf2C3P6mx3GT5kioBGPQUZSYZv8TiiKfsKv6trhA9LRJSSTh5l5AlXlT4G6VHru9ZM+TdBn4pt7Us4WIrDC6v+vMwe7P5wbMIvuIzXAgPnuwKCC9wRl1lY+A3KYgsYzjBT/JHRnVE/N8yBs+0FRVZXQBIjrURQRTBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUrBrvNP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B661C4CED2;
	Thu,  9 Jan 2025 08:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736412746;
	bh=TvUNJv8yJjtpo185rkOPuPVGK4fNp0KoEpN/gIjMEhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUrBrvNPOcUnmh+bwM7eTNr+s19B16W+pxZ10Lyneb+7oPdPxS6ztV23f3nQqQ+aF
	 ORW6h+wLS7iWEfKUMxi+02GRWkLX6w1/10lgHHZ9Gz/UT9AUgHHHtAh7NaSDetddNB
	 4mBNORp70DYyYkTYL7GuclYVUETWav++tg1tAIWXY0iUlWd8BxZ8KJEBwKUpx9w7sl
	 xASZ6QQA1nKFzy58CEISqgFZ9NsdvHCOxOCrV+JOQ4xpnqm8R3HK/EDZLNcCkdct9V
	 RmEf7KUeeYBDKl95jJ9BN3IRnpZFEuj1TOQhGfKZZ2TDvA1FLpHC8B5eUE4MZg4meB
	 YjsE6413js1ZA==
Date: Thu, 9 Jan 2025 09:52:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ming-Jen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sudeep.holla@arm.com, 
	arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v6 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
Message-ID: <q73tpquvwrbrlhugbik3pfkzsywskbntpdtkmhbqrz6qdx2p4d@7flo7ahmfnme>
References: <20250109002622.771-1-mjchen0829@gmail.com>
 <20250109002622.771-2-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109002622.771-2-mjchen0829@gmail.com>

On Thu, Jan 09, 2025 at 12:26:21AM +0000, Ming-Jen wrote:
> From: Ming-jen Chen <mjchen0829@gmail.com>
> 
> Add YAML bindings for MA35D1 SoC keypad.
> 
> Signed-off-by: Ming-jen Chen <mjchen0829@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


