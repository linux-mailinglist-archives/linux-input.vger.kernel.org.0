Return-Path: <linux-input+bounces-8601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C019F2C0C
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 09:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69873188151C
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC291FF615;
	Mon, 16 Dec 2024 08:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="W1CZUG7e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kVyAYW8a"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B2C1F709A;
	Mon, 16 Dec 2024 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734338256; cv=none; b=pHbOMRGEZeU9wmqqDZ0yFz4BpXXCo1ef3cpvDBoI59CsPw6y4CjKwF3zcdeaEm9EIqOjVKnaJCJY9foLvQ8da2W7BiMnU/1CJzuC9aNqzNq6Zewg0MEvg/strGzJ1D13OJsujyxb5ptxwEjobLj0pt6woDxyGJNA4xfr5oU7y4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734338256; c=relaxed/simple;
	bh=G5iOSpiCvKWgBkvTbE8BeIEzKnW5/hdoL6FsopUDLM4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pIFlGXgJN24CrvFi8gdiFl26QK1sDZShRra5Eajpt7SlfxKKukQqRNBBA34OnwigAAV7ESOSXTbrx2fhwIwZgOvBF6gfzzOmhRjpXnAEf67gCYb+htzML3zyjdR+Kme38jAdfEod6z5+H/wz+SKcuXR5yRBUJ0fqf9pPSC3PyEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=W1CZUG7e; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kVyAYW8a; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 87C4C114011B;
	Mon, 16 Dec 2024 03:37:32 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 16 Dec 2024 03:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734338252;
	 x=1734424652; bh=QuwIIKotvWiGSfFnUvfQc5WJsm4iWiEqcQ7nbAiK+xo=; b=
	W1CZUG7eaQaDIXxrHwJqoYY2zuMUb62yDQd9cAQ5zBrX5LtzqLvLS/vlg3GNb4uf
	CU66MnEndfSqcv0tV8NM6ft3RKmcwNpbvLk+mXklTX4be+KGRo8G3GD83ccmjP9U
	K3ZikgivLN3T5YYty2zIy6kttEE7hMt0h21KD+0kZmNC1Gklr0F+xzLLxXhiH04Y
	/c6IRgeKWGQwzx7D0CEZNwt6mQbqurhVteQnRY3SAU1tnPUh9joXO3FYvNv/BEjO
	wnO+ZaH8bk6CGNZQLWDasl0yIlNB/9lFZWEGig9+B4XfgUAkrY4JDwttv1E6M+gf
	+xXzI7hjPQjPqFnaI8PVWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734338252; x=
	1734424652; bh=QuwIIKotvWiGSfFnUvfQc5WJsm4iWiEqcQ7nbAiK+xo=; b=k
	VyAYW8anAq0SHR36vK+r1IEwV7E1BgT6g8F3dTsoxYV5c8ctSHoog+K5mMzZFpgX
	+HXUZg0FYaorG8wWLp5TjRsKNWU8vBOHje/+dioF5idqwHfK63grkBg1hBl2da2d
	FNtrnNiaFAubfyRDk+8mJLBeU0JzzOvbE+cG7OL6g2chKRFywrW1CQZPBc3PCiA5
	9PqT34A4WvmqQ4kIVyd9xYDTaO8I+klqe5eRipFHh6u8FIs5tHxpEkPzTSJ9FAqz
	jMaqp7qI9PD1zqlOTYX3FGEzmx8k12SYnRepbrHuzsu4w+BKGp6h/HjYGb9+R++A
	m+xGzcwpZ76zROLzH8CFA==
X-ME-Sender: <xms:zOZfZ30C85k7-L5LPSJlffWVNvXf7-AZV7pi24zfkNxKsSTdghKxRg>
    <xme:zOZfZ2F55tlzncPllBfRfUt6y8WMjkM932JTuHWZ3DsAUq2lvJEq8WOQsD184dYAH
    fUOYJQTHf18WTOVJHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrledvgdduvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprh
    gtphhtthhopegumhhithhrhidrthhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepsggrrhhtohhsiidrghholhgrshiivgifshhkiheslhhinhgrrhhordhorhhgpd
    hrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zOZfZ34s-9JrlLziW4TZ58dFtuFTH8DiscHwF2DLE7y9IknoCd1ZSA>
    <xmx:zOZfZ82R9gv-oYVCacjgAEVtYfWXXROPRkIjJDFPt6RDLflwfT7djw>
    <xmx:zOZfZ6EGOgrji6H8Zaacv_G92X4i3yX7dFJvP3TFVYpn9rFoXv4kZA>
    <xmx:zOZfZ98U_Lezj1lEBxW4_gNeih_5ZQ3gsVcpDaM_LMocpw_05DlB3Q>
    <xmx:zOZfZ2hTzJmbCrHBFzWTluiUGDVeRZBpG4ORHsk1Nx0584O8r3p4kHnk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 256EC2220072; Mon, 16 Dec 2024 03:37:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 09:37:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <010fe0ce-68bf-4e36-83b9-6c8e9c046cae@app.fastmail.com>
In-Reply-To: <20241216083218.22926-1-brgl@bgdev.pl>
References: <20241216083218.22926-1-brgl@bgdev.pl>
Subject: Re: [PATCH] Input: davinci-keyscan: remove leftover header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Dec 16, 2024, at 09:32, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The corresponding driver was removed two years ago but the platform data
> header was left behind. Remove it now.
>
> Fixes: 3c9cb34939fb ("input: remove davinci keyboard driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  include/linux/platform_data/keyscan-davinci.h | 29 -------------------
>  1 file changed, 29 deletions(-)
>  delete mode 100644 include/linux/platform_data/keyscan-davinci.h

Thanks for the fix!

Dmitry, can you pick this up?

Acked-by: Arnd Bergmann <arnd@arndb.de>

