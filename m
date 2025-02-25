Return-Path: <linux-input+bounces-10360-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC8FA44E02
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 21:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C87987A22B1
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 20:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A9819F41B;
	Tue, 25 Feb 2025 20:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="sqzs/H1V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BhAJADjs"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEC31A2396;
	Tue, 25 Feb 2025 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740516225; cv=none; b=PFmF2TfNyAsE0z0UEzk2ZG4VxGfg7ci/rCRLj8RZ1xbbtt7UV4v1wSxYHi6xUHn3VlCNEXH+mcxr8as6cJ6EnKP3moRTm/r54tgXFVtlLnoHd9wdlYKXwseap987e956Ut2ltvGLVlvE+4zPsuNUZugyhCcWGdas2nUrJMmPFeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740516225; c=relaxed/simple;
	bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/TecLMtuchqQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jTjQQCoymsBnJrXK8hlgiOvaTS5xYIhjFr6buPLurZsvYY7eyTcQwaLKph6lpGYVy2IIVA4SjzeatR0aQhY6gtjGuWHU9ZAzbICAxQNXPSjEW28teChkcKj3nYCT+V0acwcq57/kMMlJzMHK9ZAQYcTgXYuG0GEvLWcOuhzNwbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=sqzs/H1V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BhAJADjs; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DFBD52540158;
	Tue, 25 Feb 2025 15:43:40 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-10.internal (MEProxy); Tue, 25 Feb 2025 15:43:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1740516220; x=1740602620; bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/
	TecLMtuchqQ=; b=sqzs/H1VLTKz+ic/Ses3INJph9n2k4WuTOxFo+MvtoLX169Y
	nSkD4oDB9axeueV5vNigULRe7V9Mu71G0wgnXLmN3vS16206nonzNfN9cLp7zOwB
	b46FBm0BJcFBpq68axremRPUQlqIdkYY0zz6q8e4FGsjUM4fLRxHYpLQ68BzmZgx
	xiFtLpYME1Oocxe6/yZ6fSV+mYVtdAaRREo/8nHe6UWV38WbyrzeK0FX1kDo7Uxk
	jLBd4wFmGuEeXmNGcAf5w8GMA9lmfVAlz+V6+s2/hrhaxewpyRSxxENXymJanLIc
	DM1hEzl7Vhz2z9XTidYlovfeqfLoIFMWitLV7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740516220; x=
	1740602620; bh=O/fhfATb4AiUXDJCmjcXCXRXVNJS4e8/TecLMtuchqQ=; b=B
	hAJADjsSmaVl9LVtpfE6cRAsxXwwuTg1N7861zIRXibXgg2MxKhe+aikLrrD5MYY
	BiUooc93Mf8BsbhWcMow1u3RQFNKr+lXhLXazMqVa9Bg/by/lAeF7zTcm9g9k32U
	LOQAu/sFMy7FXiBL5+vU++XTFY4U7+IcqiQ820mF9pY+1RoTOXWaEitR2V+ptCfZ
	WJqdLfdhwUcM/QpXuDkpvn2Uf2Mzj6i+/MmXL9x4tTgwytoe5zUXbM4n59+2gJKX
	kBk7Yu/gI/JeJe36RNZxUYPdSN+zx3GuLfPJgv0uP7DdvOIWe+qh0vGhZct/9XFj
	6rxueUVS3Wx/36OK80jIw==
X-ME-Sender: <xms:eyu-Z4C34Fh3XE97I_u7gERDrdNerw9w3TP03wXikKnfqf5RKF8_GQ>
    <xme:eyu-Z6g9gS4J2rwHWVuwYOTTTiErGSRRsvFXQqt44vO_0E7TSNN76phlHbZJ6MRuE
    Gpbv8-vsjNXnuSRF1o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekvdeilecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeegheduteffteeguefgteeugeffvdejgefg
    gfegkedthffgudfhudduieelkeekkeenucffohhmrghinhepghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghn
    sehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmh
    htphhouhhtpdhrtghpthhtoheprhihuggsvghrghessghithhmrghthhdrohhrghdprhgt
    phhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpth
    htohepfhhnkhhlrdhkvghrnhgvlhesghhmrghilhdrtghomhdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtph
    htthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihk
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhn
    fhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:fCu-Z7mIrGgSvFW5O80C-vreKzrTwA4iGXV1Ro_0fyX3q1pRBxe8Tg>
    <xmx:fCu-Z-zYu1EGdl3h3FKh3drCYacxHtXezkfwDqZdxjihmMbGRQYAFQ>
    <xmx:fCu-Z9Qos28BREiaYB0D-yS_S_9S-SrA8KYEkGIq5EUF3NSdWLJrGg>
    <xmx:fCu-Z5Z2TYLoOG5jGqeS938z0CwNI11CKJlvFB0XatiQbrawZxKJCA>
    <xmx:fCu-Z5pbHil56P7IpzzlVm65q57AwXFOM7H0nmnKK9xQPlbnpUhxW4xr>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D655BBA006F; Tue, 25 Feb 2025 15:43:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 21:43:08 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Sasha Finkelstein" <fnkl.kernel@gmail.com>,
 "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Henrik Rydberg" <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Janne Grunau" <j@jannau.net>,
 "Neal Gompa" <neal@gompa.dev>
Message-Id: <4394a92e-8024-431e-a667-1644171472d2@app.fastmail.com>
In-Reply-To: <20250224-z2-v7-3-2746f2bd07d0@gmail.com>
References: <20250224-z2-v7-0-2746f2bd07d0@gmail.com>
 <20250224-z2-v7-3-2746f2bd07d0@gmail.com>
Subject: Re: [PATCH v7 3/4] arm64: dts: apple: Add touchbar digitizer nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 24, 2025, at 12:01, Sasha Finkelstein via B4 Relay wrote:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Adds device tree entries for the touchbar digitizer
>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---

Hi,

this doesn't apply anymore on top of asahi-soc/dt [1]. Can you rebase and resend?

[1] https://github.com/AsahiLinux/linux/tree/asahi-soc/dt

Thanks,


Sven

