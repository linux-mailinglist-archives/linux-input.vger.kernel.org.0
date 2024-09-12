Return-Path: <linux-input+bounces-6438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AA9768C8
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 14:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 850241F28A77
	for <lists+linux-input@lfdr.de>; Thu, 12 Sep 2024 12:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8250E1A264E;
	Thu, 12 Sep 2024 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ein8uAfG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB31A2635;
	Thu, 12 Sep 2024 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726143141; cv=none; b=CUNGyRuzyEWLLVSjmsSnyDmTO8y5XiErm/CMpb4wo9nklwD24bQDJ2X4uMOCs+KZJjZfynrBKSSyIa8bVxRGNyGBy1fsQ0K157Vr77Xtine/6KXBIyITDbJfIVqfr0S9B7LJwv34kFR6xTay8hgioaNNDl2ZKKc843jLtrLX6ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726143141; c=relaxed/simple;
	bh=tEVhgMO6mwWbRE/vweoFlUtWYEEoEU582Gcc4wWZXt8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DBounD3OGFasMYWKz34aJ8gVqJND6KYOBdoFN839gQWLAxajjW76GmorDfEkgXF6yBqWqC6SUfOD0JPLtF6r97oSW0gztagVIf8FqZcaHJj5amyzbiGROvjWMKlFOMLuKZL2OV68W/fu0YleUxMOHZLoN+mKAo9mjASoMVu57qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ein8uAfG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55A8BC4CEC4;
	Thu, 12 Sep 2024 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726143140;
	bh=tEVhgMO6mwWbRE/vweoFlUtWYEEoEU582Gcc4wWZXt8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ein8uAfGLJjftzOEA1RP/RfjICHB6UxO8YGqYlCpk3fTC42dWEh8T5LqINfUU9u1x
	 VIluHMed42fC9g6Ew6FJtWIXT+RnRRyPIo4k/3ruTWKJfj16UwZB8AsMQBVe1FQd1I
	 o0e2FHkmhr6SCxbBVjYq2UswXEjpbF3CUP45xAeVF+UQdENRp25nb5hO1Bzg4rBbWl
	 Gw6HuG5tw7uxYlwJkN8eINOqzqCKn/GFfMHnCUN3jssHAb54wpWnFa7prlTTAury6+
	 IlGA5iaSF5iTkJrvIxTRpUnrS3hxfyMbia8HYU2DBPE3uG3bYsZ3fGo5+81Puh8VIb
	 kyF9rrqQ77H3A==
Date: Thu, 12 Sep 2024 14:12:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: ". Benjamin Tissoires" <bentiss@kernel.org>, 
    Douglas Anderson <dianders@chromium.org>, 
    Hans de Goede <hdegoede@redhat.com>, Kenny Levinsen <kl@kl.wtf>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: ensure various commands do not interfere
 with each other
In-Reply-To: <nycvar.YFH.7.76.2409112019460.31206@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2409121412010.31206@cbobk.fhfr.pm>
References: <Zt9clAu04BinzIcd@google.com> <nycvar.YFH.7.76.2409111526450.31206@cbobk.fhfr.pm> <ZuHe2zkSbwyr5syK@google.com> <nycvar.YFH.7.76.2409112019460.31206@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Sep 2024, Jiri Kosina wrote:

> Thanks. I was asking whether I should rush it in still for 6.11, or 
> whether waiting for 6.12 merge window is sufficient.

Anyway, now applied, thanks again.

-- 
Jiri Kosina
SUSE Labs


