Return-Path: <linux-input+bounces-10363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 071CDA44E2A
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 22:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 247143AC0B8
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35B6620FA9E;
	Tue, 25 Feb 2025 21:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCubtC0+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33D320F08F;
	Tue, 25 Feb 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517212; cv=none; b=ZYQTKxrASwMUJtlEvYBZDxY8ijnqN1HKKahG187BPfFxzeI9+didn2ot2qw2jW/N1AO7K2PCMaAncUzrOYa0QZpDOYrxEFbh/QBThfpeQlQQkmzArMJufqi/v/xf0qd5Kf3hZ9ai/cAVgJzjeJMCO6xZUm0oLURSGDBwKO5GHdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517212; c=relaxed/simple;
	bh=xcMZiURjHPd6etPkRW7uGuDOzfEqUxABtdIaFktNg8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsRTOqBzcduVMYFj7K9Wd9NWv4QC+eEZEfogPwDQxynhC9s6mq8VI1V5ay6EF7OGMH7hOQ0lLnqSJvPnHdLfPXZjEodk+J07TpKkeV2+e1/1Q9lOqud2lNlhOGjSBhhdwePfj8hY6fjVtAM4ucQSqtkBpQI3//xDeoGsKJDJ9tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCubtC0+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D16C4CEE7;
	Tue, 25 Feb 2025 21:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740517211;
	bh=xcMZiURjHPd6etPkRW7uGuDOzfEqUxABtdIaFktNg8w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QCubtC0+a8eKWjoVlcQepvZs+LOemMR94Q6HBUEpGbQbr5Tnbp81mZpI7yTCOzBQQ
	 zloysKPoixgyOMjt7i0PGhedFAIjsghJMjyKx/kDewsmeN7v+34kpTKMXCL0uTIXkp
	 Y99Oxb8X1xhx60eZ4QGHm7QW1X4TZJkzoNaESDJgkiIbbTbEfi0ohObxcMWnloWw0A
	 ohhNohwtLI1uIHAznRARbwQMMNKNlWMXAxWDWgbM4ReUb9TSu8FZ7PxUBKJ7C1juM4
	 eWrS6sj0u7l964xHjiU8oWDuCwskSesdCCGSpEYlieD3cWWa/ZiIWJkyMtnf44jHKG
	 PWOiXW5tr6mJg==
Message-ID: <6fe399c7-9c88-4e5a-b1a6-1bc62482655d@kernel.org>
Date: Tue, 25 Feb 2025 22:00:02 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/6] Add spi-hid, transport for HID over SPI bus
To: Jarrett Schultz <jaschultzms@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Vinod Koul <vkoul@kernel.org>
Cc: Dmitry Antipov <dmanti@microsoft.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jarrett Schultz <jaschultz@microsoft.com>
References: <20220707165902.3184-1-jaschultzMS@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20220707165902.3184-1-jaschultzMS@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7.07.2022 6:58 PM, Jarrett Schultz wrote:
> From: Jarrett Schultz <jaschultz@microsoft.com>
> 
> Surface Duo devices use a touch digitizer that communicates to the main
> SoC via SPI and presents itself as a HID device. This patch's goal is to
> add the spi-hid transport driver to drivers/hid. The driver follows the
> publically available HID Over SPI Protocol Specification version 1.0.
> 
> The specification is available at
> https://www.microsoft.com/en-us/download/details.aspx?id=103325.

Hi, I know this is a bit of an old thread..

The spec mentions some oddities around dual or quad SPI - do you
perhaps have some version of this patchset that implements those?

Konrad

