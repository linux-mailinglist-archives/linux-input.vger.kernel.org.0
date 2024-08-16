Return-Path: <linux-input+bounces-5599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B1C953E3D
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 02:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F74C1F22367
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 00:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83EB0BE6F;
	Fri, 16 Aug 2024 00:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="jmvbE5J2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jmMyULGk"
X-Original-To: linux-input@vger.kernel.org
Received: from fout1-smtp.messagingengine.com (fout1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AE41E489;
	Fri, 16 Aug 2024 00:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723767499; cv=none; b=Bj9GHXy5U+79OH4rrOAzmOGbFWDwjqBNupp5XxvzHeCIVZUi4f5Tb5eKrBXr4aI1q6R/PTfdRnk4QnOKDpumNueG7dvIdWBxzb90IUy8d57nIPaqMYtxeSMsikH4/3kSTq/DVrjB4MxEngoPcW9JE/+07rJnMCnLf5/L5zTc3wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723767499; c=relaxed/simple;
	bh=xzGcgsCuK3kT2n1AuiXgCrKWOdAcpv/7iav9H+B0Tz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSbEc3sh5Ea3rUV27UZGEg6DOOkO2FuIa9C2AZd0GtuSWyIW30Ciqe7YLznlvKi0JuhWg9DnghcXCP86bJ2uPuUtlbn+DgBfiPaukT/uUPX4lfanPRK6Mlg34bQPjlYDvlpH1wVhFRxt1rTputVt39VvBSBWOlSElQLI+s+ovGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=jmvbE5J2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jmMyULGk; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7C64A138FC70;
	Thu, 15 Aug 2024 20:18:16 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 15 Aug 2024 20:18:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1723767496; x=1723853896; bh=cZMQmRSQYv
	cmILLnCBGLjyBge/6te/j2zOBZUvMmBl0=; b=jmvbE5J2gWnLlzMftrNCq+KQ3F
	G1+/zXv01Tp6yH0dc/Msbg22VAH4TTxXXDfj8asadgeQY4y5GE63hMAimjWEkuXa
	E5TuS1miabcmDySgez5H/8CdzGtrQ/LQSbq3x/bjzaJcp276BIuFeptatXjN+5M9
	gAeMA4PCdNPnOXEdOU9iLWwNx6bA29fI7X1JuS+VtTPNO/FQ+1UmtVpNXe1f8b1F
	CdDvrmpdNG/Car/saGQQURKK+z3eH3/i4Mr6k9lNGNJXGIv3IQM9KRD0iUsbmlO2
	sEV5f1SVJJmeUyMLs7wQnL/MTDRqfu7psqeKXN4knMCFA7qrntEfwb2YSUmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1723767496; x=1723853896; bh=cZMQmRSQYvcmILLnCBGLjyBge/6t
	e/j2zOBZUvMmBl0=; b=jmMyULGk6dNLBgGZ6CUPqbOee9iFKLOgicYUE6R/qpyc
	fKWhOnQ76paOfAzO0VXv9uu2TU04c2FCc9GuK49X5IZ4YwYlCLe9/MLHvA464qE3
	drYtvJDD9nqvBK/IUTY+E6hBE+GGPVTRdwqKFb+jLEUCS7LXyyAcENcC/Y+RxsPV
	hyKAM61fr/qyLnhr1YKkcjzservxYuL/H2SUSMIjSozvAyfp1zEpCBPblo0pUiPD
	jLvwZMiRTShggWXBERPhMljqlICxPoKyjBVOECCIjBrdJyrnflk4POWycvC+nKeo
	LUMijgBxO6/uylrbnm+QQwNkJ1vCa52SaTHZmP7qSA==
X-ME-Sender: <xms:yJq-ZoCMJh876cGY-u_XYYZVQmmsAdqB6IVozIGgWhlkamiPDEVhsQ>
    <xme:yJq-ZqjumrNnGuyCY24qq0Cha8NY219RGucC8JAVmSqs4Gb5nQYP8iwTEfzN8gDJl
    CDluv3FiNw6nopqH34>
X-ME-Received: <xmr:yJq-ZrnlolVlnhQ04HvTZ2GKwnBtw3ilIvC6rwAMvvCG_8538vW_uWfpV54dOla8W4EnLyLgAuvQQ95uDX0nUu8wQJ9EhU64__D->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddruddtjedgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeekvdekgeehfeejgfdvudff
    hfevheejffevgfeigfekhfduieefudfgtedugfetgfenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhhtthgvrhgvrhesfihh
    ohdqthdrnhgvthdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtohepughmihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphht
    thhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepjhgvfhhfsehlrggsuhhnugihrdgtohhmpdhrtghpthhtohepsggvnhhtihhsshes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdr
    tghomh
X-ME-Proxy: <xmx:yJq-ZuxxL0rPfnZUqE5Px7ILDDRIZjkyFEJxjihYZvSxYMj6f5OSgQ>
    <xmx:yJq-ZtRNYSAR519hiq3JK923a7jkjRkH8ew98f_ydYQQGE1Qvf0reg>
    <xmx:yJq-ZpY3sU10rZcOP9bxg7OBDzh9OgAZFQbF3K1n6O_vLDzhIexMAQ>
    <xmx:yJq-ZmQASxGXhTVu24n-Jm5HXP3s8Bw0bxmDhmDSqZRbEJO5gAnhtw>
    <xmx:yJq-ZsERUItwu2hi8gtXp1JQpaC-PVyuyE3hAOZWhf_DcqIK3vOxh-P9>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Aug 2024 20:18:13 -0400 (EDT)
Date: Fri, 16 Aug 2024 10:18:05 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] Input: evdev - limit amount of data for writes
Message-ID: <20240816001805.GA232957@quokka>
References: <Zr5L8TUzkJcB9HcF@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr5L8TUzkJcB9HcF@google.com>

On Thu, Aug 15, 2024 at 11:41:53AM -0700, Dmitry Torokhov wrote:
> Limit amount of data that can be written into an evdev instance at
> a given time to 4096 bytes (170 input events) to avoid holding
> evdev->mutex for too long and starving other users.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I'd expect anything coming near 170 input events is going to trigger
SYN_DROPPED anyway, so:

Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>

thanks.

Cheers,
  Peter

> ---
>  drivers/input/evdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> index a8ce3d140722..eb4906552ac8 100644
> --- a/drivers/input/evdev.c
> +++ b/drivers/input/evdev.c
> @@ -498,6 +498,13 @@ static ssize_t evdev_write(struct file *file, const char __user *buffer,
>  	struct input_event event;
>  	int retval = 0;
>  
> +	/*
> +	 * Limit amount of data we inject into the input subsystem so that
> +	 * we do not hold evdev->mutex for too long. 4096 bytes corresponds
> +	 * to 170 input events.
> +	 */
> +	count = min(count, 4096);
> +
>  	if (count != 0 && count < input_event_size())
>  		return -EINVAL;
>  
> -- 
> 2.46.0.184.g6999bdac58-goog
> 
> 
> -- 
> Dmitry

