Return-Path: <linux-input+bounces-16808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB85CFB40A
	for <lists+linux-input@lfdr.de>; Tue, 06 Jan 2026 23:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4DFA301926A
	for <lists+linux-input@lfdr.de>; Tue,  6 Jan 2026 22:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034A92DC78D;
	Tue,  6 Jan 2026 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="B1nL42bw"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF5C18DB35;
	Tue,  6 Jan 2026 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767738005; cv=none; b=VeLb5yc04maA+r3/I+NlYpsW85tAKSUNqXm2W+o0XLiKhQTZkIz4bpoX/Sh6iE7+kZChgUjAWelSMey02C4pUpDatu4B2d5WENuF+uiN5vpDHQP07fVvTTdfqXR2lgJSJX/2ZeVLVFbRPoTTs+HHHrj0A32YB3rnpejID54/YzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767738005; c=relaxed/simple;
	bh=kH4wZWzWsdqigHjtE42n66oZ9Jf3cM/78grSvpqE8qw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZqX3ZhOAmekIr7ZzdfnyPAb3kWVO8hHFkYB3G6oUbDsEV7o51nQC6J8AbjV8AC9Qz/PQEnoLkoLnJUkHzZv0eH/lSmipW0EdtB2MZvz6Y7IoEATOduBGSSB/gNI/C/JC2A9QEElllhu9oc3vIFEnz0H0C4PeC1q7u1k8dg0bRnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=B1nL42bw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BD99D40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767738003; bh=FVwC2MMPmRThvcFd1SPXhNOi5Ew/zUgGmd8itNypsK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B1nL42bwEhVj2Y5exnXoJrRoGGmEpkzFEShc8Byu/GmF8kc5gO1futUQYfrkrKFxp
	 cgEBqBDXDDlM08P9hpY80W4A7MlcURfVyqDZhxowbb7QGJuXbXT9hzjyZQoi4hKSiu
	 uoG1veZt9N/nOyXncsB06kBowz+htvH+4XjLFb5K3cFcPcHxGKtu15Y8LhwMNH0XUX
	 WnsXD00reX+kAuPdE3NJS/HRgm8FUyVYJIfJW1y1QX4BiWGXZ4P5phjlNGldGX+K+I
	 i9evE8QrbKUoDhvfTZgoxBHuoI2PrQk2UDm8rwmwwdJLoQnHqdlCfxWue8+kKTv6oy
	 652aKDRO9vx9A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BD99D40C7D;
	Tue,  6 Jan 2026 22:20:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Wu Canhong <canhong12@163.com>, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, canhong12@163.com
Subject: Re: [PATCH] doc: input: fix typos in input.rst
In-Reply-To: <20251226160219.64818-1-canhong12@163.com>
References: <20251226160219.64818-1-canhong12@163.com>
Date: Tue, 06 Jan 2026 15:20:03 -0700
Message-ID: <87pl7mbcz0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Wu Canhong <canhong12@163.com> writes:

> 'even codes' should be 'event codes' at the end of input.rst
>
> Signed-off-by: Wu Canhong <canhong12@163.com>
> ---
>  Documentation/input/input.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/input/input.rst b/Documentation/input/input.rst
> index d9a6de87d02d..7bbda39d8ac2 100644
> --- a/Documentation/input/input.rst
> +++ b/Documentation/input/input.rst
> @@ -278,4 +278,4 @@ list is in include/uapi/linux/input-event-codes.h.
>  EV_REL, absolute new value for EV_ABS (joysticks ...), or 0 for EV_KEY for
>  release, 1 for keypress and 2 for autorepeat.
>  
> -See :ref:`input-event-codes` for more information about various even codes.
> +See :ref:`input-event-codes` for more information about various event codes.
> -- 

Applied, thanks.

jon

