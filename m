Return-Path: <linux-input+bounces-12470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F29ABD68C
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE02516E8D1
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 11:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FA627BF92;
	Tue, 20 May 2025 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b="BaSL/gbC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668E1277026;
	Tue, 20 May 2025 11:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.211.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739596; cv=none; b=DJWBbRYWskWRFBYbBpMUjhXsagbg6rgoztbf2widQukxJFEhiyJEjp8V+8qtKS3pzT4vvrv+lTO8wR/ndzwUTYNxEO5Rdyk6OO9zprfpgX/rix4vosN2w99hu2/y6SJW3dgVoa9lT/nffHTHlGCylMljyTWkByke6tlg6YAZX2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739596; c=relaxed/simple;
	bh=HGkfVnnrGCEl7RuKCn+/IyyoDgVQGbywU/GKg8rw7Ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rAHmgziUbxYcu5SbY3/CUvNWHL0bz1ZZ2iurWwK+mc07hgWXOfQBjS7Rs/LM4oJMu1gI8ExY22TXiX1gsjxK80+ViQ8LDc0/nT8KggJ9ZIpdIV6RbiyoO4S+iSo0CEwPNAipwnOefLYffzDeu2nNO7Jl0t3Q4VwaApiYbs9KbYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru; spf=pass smtp.mailfrom=swemel.ru; dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.b=BaSL/gbC; arc=none smtp.client-ip=95.143.211.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=swemel.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=swemel.ru
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1747739581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+yQOU/9dcs2ycwOIOAdnjAOleA1m7cxeGj9WPvbFMAQ=;
	b=BaSL/gbC4SNgFuPXY6I8Ml8FwZYwEFGYQ92BlnCseNlslAt8yBc4iDkdF/6NTXfUTn969l
	/Bvjr+XSB68O8tP04HlEq9v1D8lChoS04dc9fTUtUcbcQ+mNKwTSxLR05Cn6qGwZmNw7ys
	Xf4YgoISCquJsMiM/G6LCQfq0YdHTyw=
To: noname.nuno@gmail.com
Cc: arefev@swemel.ru,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	michael.hennerich@analog.com
Subject: Re: [PATCH 0/2] Input: adp5588-keys Please correct and add
Date: Tue, 20 May 2025 14:12:59 +0300
Message-ID: <20250520111301.1346035-1-arefev@swemel.ru>
In-Reply-To: <9615d118cf3e52ea67ac0421016f0b6cceb49c71.camel@gmail.com>
References: <9615d118cf3e52ea67ac0421016f0b6cceb49c71.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> On Fri, 2025-05-16 at 16:43 +0300, Denis Arefev wrote:
>> 1. Add check on return code
>> 2. Prevent buffer overflow
>>
>> Denis Arefev (2):
>>   Input: adp5588-keys Add check on return code
>>   Input: adp5588-keys Prevent buffer overflow
>>
>>  drivers/input/keyboard/adp5588-keys.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> Hi,
>
> Thanks for the patch. However, not sure if this is really worth it... This is
> driver is in the process of being removed:
>
> https://lore.kernel.org/linux-input/04b8a6d68fdc0c0eadf69fbbc6a130ecc6c49360.camel@gmail.com/T/#mad1980e9652161a6a2e36c2aeeb97f900c6e9fc2
>
> Unless we want somehow to backport these patches?
>
> - Nuno Sá

Hi Nuno.

It'd be great if the fix patches are applied and then directed
to stable kernels before the code is dropped from upstream.
I've sent v3 with relevant stable tags included. Thanks.

