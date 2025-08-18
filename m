Return-Path: <linux-input+bounces-14109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D2B2B215
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 22:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E048B17DF85
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 20:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B600216E23;
	Mon, 18 Aug 2025 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Gc9MgdMt";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="Gc9MgdMt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B282D202C2B;
	Mon, 18 Aug 2025 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755547738; cv=none; b=Gwjv7pyLfeamMR15PTAFQObyW5R0/59a2LuhJrcVJl3Jw1u52PEd3VZK78t4RTXnhIHHMw0JAHcvC7cPQ9Cxpa1AEE9rJeBUSzoWkYzuVpEHyBQumMqCgkPklW3tSPdNYUCgPRfQPxzHX9LfJ4log2KDtWuybJnFi8TfaRGp/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755547738; c=relaxed/simple;
	bh=eh3xMCOXyKgUJnXSbekRaaERghl4/yYfIIqbXegEsNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGwXpp/ouDxh/45i0GvHp0eqTT/5ln0NylE03nPb3VLElusdhHpE+8o62LN3FJZzTNrqp1/Fiv+0eQ47iWhvze1WExVy21hasOpFz/hj1acwX1McpIvPh32gBwRxkDSvExkOczn/iECMt2nKHaveJv3DjrIvFP6XiIuvUvXQ+7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Gc9MgdMt; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=Gc9MgdMt; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1755547382; bh=eh3xMCOXyKgUJnXSbekRaaERghl4/yYfIIqbXegEsNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc9MgdMtwxpXDzaPzTZUlJ3RZkuXL0Ppvq+ZftY9pwlfXlNZwaOMoRyfCbMzIMmrB
	 w9PqQMryQLNz3T3nM4NvTduVyawi+c8amAPbl6QvnN56q2nwokuYxByqg3RITWdYk3
	 XLzWTwFpGHjSPqyMzjNuEP3YBLp6Kf1kMHLOBuWD3zCVSCmVQG1yBDP8miK27zacGS
	 gLGdfgKh5ReCiiByKueYyVEiBwL0oePIudMEHRo6VtGyD6sCOU9Y9Be9w5nat707jn
	 ICtepewfpNKao1W5lke1WvVw0C+fksnReLIroHfskqpvDkqRjVbjuoZBGxBp79u9Rv
	 qXHTcYhw/2kjQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 146333CDE9D;
	Mon, 18 Aug 2025 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1755547382; bh=eh3xMCOXyKgUJnXSbekRaaERghl4/yYfIIqbXegEsNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc9MgdMtwxpXDzaPzTZUlJ3RZkuXL0Ppvq+ZftY9pwlfXlNZwaOMoRyfCbMzIMmrB
	 w9PqQMryQLNz3T3nM4NvTduVyawi+c8amAPbl6QvnN56q2nwokuYxByqg3RITWdYk3
	 XLzWTwFpGHjSPqyMzjNuEP3YBLp6Kf1kMHLOBuWD3zCVSCmVQG1yBDP8miK27zacGS
	 gLGdfgKh5ReCiiByKueYyVEiBwL0oePIudMEHRo6VtGyD6sCOU9Y9Be9w5nat707jn
	 ICtepewfpNKao1W5lke1WvVw0C+fksnReLIroHfskqpvDkqRjVbjuoZBGxBp79u9Rv
	 qXHTcYhw/2kjQ==
Message-ID: <ddcd3af2-534d-4708-9f7d-e301a91373ab@mleia.com>
Date: Mon, 18 Aug 2025 23:02:58 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
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
References: <20250818183814.3603308-1-Frank.Li@nxp.com>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20250818183814.3603308-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250818_200302_104236_E7C5C42E 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message. 

On 8/18/25 21:38, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

FWIW I'm fine, if this change enters over linux-input, otherwise I'll send it
in a PR to linux-arm-kernel/for-next.

-- 
Best wishes,
Vladimir

