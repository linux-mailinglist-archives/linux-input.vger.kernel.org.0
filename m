Return-Path: <linux-input+bounces-4838-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4A2926B72
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 00:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427E12824F3
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 22:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B5614B966;
	Wed,  3 Jul 2024 22:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hICZbKof"
X-Original-To: linux-input@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6003B142651;
	Wed,  3 Jul 2024 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720045318; cv=none; b=pek0W4TiIAldt2mG7VI2otgXQMcgSNDog7KER9Z0SbDsHNBo6Xv2O3VHde+hCP+EUxH9uEBSJblqA1rPnERiQafS1qMZjqsdd7xC6UxQvWi/pFGSsqLKkHhqgaB+7oIntZNO3TYHpMrAoF+xAcZ1apCRmNLPaZ4kXHevkSTqSdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720045318; c=relaxed/simple;
	bh=3uyn+KQrD7+JoodPrYSXe0BG8/Upnr+uMnRMaxfx3lM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jPqH9epRG7jayS4TDlf/glHu/nWrRL3Dhrk+t9Rgl75jCQkirShIEGBQm8Ckxx0ZiVLVnqBhB/rkSezC38UUj3IdhKeBjrKN3TRqOonp5QRsOCxShQ/K1HlpR7o8s50SILtm5jPitRB/ujcGkIHgp48qw5S0NpeD3d0q7PcMUG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hICZbKof; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9D9A94189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1720045313; bh=NefHPWiz1XT6XjqnDGEfHoulZ4mLF/O4XPqMKS9lzmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hICZbKofX6K5AfzWTI0wO8o6qXfBjPM8+eAvdvK1WZzSfS49ohTgtIVNA1VPt6TsK
	 Tl46YX3qcXsju4BnO6nNfHtQVAJBb4VqEJbovBaW0XtpZANeY4vKz0UfYxJ7vHqcV4
	 avkgIJiESsbQF8wSHzG8lSc/HETs27T3T4li78kv6Ag+gbiJwrDlzg3xwfIep6E6oL
	 i0dH8p+gw1vJvUJ+kqi272zR6x6lM4fvNtpc1JX3U7LjGnZwhaG/r9uwGEnwXfd/iH
	 Eap5o/kpCjFm8xHflb13ciTLonExblKJFmzfVnUBv/ft7SxsRizSL+TProNfzyM9t8
	 ymiS+bC0QRp1Q==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9D9A94189E;
	Wed,  3 Jul 2024 22:21:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH] Add libps2 to the input section of driver-api
In-Reply-To: <ZoMQhkyUQYi1Bx4t@google.com>
References: <ZoMQhkyUQYi1Bx4t@google.com>
Date: Wed, 03 Jul 2024 16:21:52 -0600
Message-ID: <87h6d6t8u7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:

> libps2 has been using kerneldoc to document its methods, but was not
> actually plugged into driver-api.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  Documentation/driver-api/input.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/driver-api/input.rst b/Documentation/driver-api/input.rst
> index 4bbb26ae2a89..bd7a3578ade7 100644
> --- a/Documentation/driver-api/input.rst
> +++ b/Documentation/driver-api/input.rst
> @@ -40,3 +40,10 @@ Sparse keymap support
>  .. kernel-doc:: drivers/input/sparse-keymap.c
>     :export:
>  
> +PS/2 protocol support
> +---------------------
> +.. kernel-doc:: include/linux/libps2.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/input/serio/libps2.c
> +   :export:

Applied, thanks.

jon

