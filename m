Return-Path: <linux-input+bounces-7527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C27389A3B72
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 823EA285976
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F9B200BAA;
	Fri, 18 Oct 2024 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rEqiHmDl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5EF18C938;
	Fri, 18 Oct 2024 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247079; cv=none; b=g82PnxHY0ETnoTEyxHrClPoNl//oKHS5VKUS8DtlvIBxlMgBhXOTM47LrD6hOL14sKA2heAYLLKo753hdqXUQKPmGcvBDqsSY/pdxjyJEM/3u3C+jrVLnfxZPonR7bSOasl7NazvqIEJavKGGXcVzD7EJkmOmqb3C9s806wJsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247079; c=relaxed/simple;
	bh=cWX64qorojrVQ5gx13d3kqEmpkphq2oQIx91nL2B81c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qbgMiHqpLDEqwNbCiYDFc5IWzwhPbF/ssv5SqbE869aqxu5ch4tuQxan1idLrfM7lWhctSpBcwYOWUpfFzxy9z9Y240neHPidU0RTPM2vRQyqLtaFVf2Uwk/VtasvYTRidiUP77yiuYhqZl43K5VaVmFSuCGOKbq6DslCWMCI9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rEqiHmDl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBC6C4CECF;
	Fri, 18 Oct 2024 10:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247079;
	bh=cWX64qorojrVQ5gx13d3kqEmpkphq2oQIx91nL2B81c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rEqiHmDlbXHi19ZDDGDIrdmMBHBHsHGuEuxZKzv+9Ceo0AEAiadc4BjtPox3md3+k
	 x0w+oWU2bTwUCPTnu6YvbY2E6aKq8AFxbe1x8+zGuE9uznQRZUE97POg6Kl0ZEoVui
	 t4UUfwNvh0Wf7myerJJA/JiaP1rg80ACocc1PgU9a/HgOI//R0nUEgciHdhEYWcOBM
	 rT9dxAtvxDY8Vke4RDEwcPqsFnj9ijK5UxrUH5jeuiol0Ii1uhzSWHbFkCV5TXnzm/
	 Gl9WsM2F8s1/GUVYMZbO8nTnkA0u1vQacWth/JSL23RnDOZAWLtfJGwcHXTE8bRGdZ
	 0aKFk+NRxfJiA==
Date: Fri, 18 Oct 2024 12:24:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Thomas Kuehne <thomas.kuehne@gmx.li>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v2 1/1] HID: debug: Remove duplicates from 'keys'
In-Reply-To: <20241016133523.899754-1-andriy.shevchenko@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2410181224270.20286@cbobk.fhfr.pm>
References: <20241016133523.899754-1-andriy.shevchenko@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Oct 2024, Andy Shevchenko wrote:

> Duplicates in 'keys prevents kernel builds with clang, `make W=1` and
> CONFIG_WERROR=y, for example:
> 
> drivers/hid/hid-debug.c:3443:18: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>  3443 |         [KEY_HANGEUL] = "HanGeul",              [KEY_HANGUP_PHONE] = "HangUpPhone",
>       |                         ^~~~~~~~~
> drivers/hid/hid-debug.c:3217:18: note: previous initialization is here
>  3217 |         [KEY_HANGUEL] = "Hangeul",              [KEY_HANJA] = "Hanja",
>       |                         ^~~~~~~~~
> 
> Fix this by removing them.
> 
> The logic of removal is that, remove...
> 1) if there is a constant that uses another defined constant, OR
> 2) the one that appears later in the list.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: fixed which one to remove for KEY_HANGEUL (Jiri)
>  drivers/hid/hid-debug.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


