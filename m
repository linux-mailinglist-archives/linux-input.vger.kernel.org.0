Return-Path: <linux-input+bounces-5683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A739572BF
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7E75B20A63
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09926188010;
	Mon, 19 Aug 2024 18:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RW7oGbNN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41231CAAF;
	Mon, 19 Aug 2024 18:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724091266; cv=none; b=qjbStn46Uk/FhniBM2JxgjWqAmIhMCbrPcPJ/askc+fJF3fV0bnW5I/uvc6kOOwoasBXzsADWaIca52SNzqtrVmNwt/XQZT1Q7VurLxtZGKS9OnUBUgTXJwiY9hPYmtwO/soGLWqFCZonZIYPCldKyolc5YPIaLBhzliFsQqM34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724091266; c=relaxed/simple;
	bh=iZQ92qejbJ1jXk/myPPreBEYsg5PWEhEzzzrLSkC+o4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PWnNptlmMnujY6nn0Dtd1TJQ6cCtVRvshlow5oikjnWIF5k1VTtu/ILer3EpkDPkYdivGJs7aA6cI60v5wxlUl15uQMLuu5YUI2TiC2OAy1UiiNwOA6NMiKd4SBQ77X8XisT4OMBjFHizzsx6iMATUTX1WDLq9QWDhCtW5pXQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RW7oGbNN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B8EC32782;
	Mon, 19 Aug 2024 18:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724091265;
	bh=iZQ92qejbJ1jXk/myPPreBEYsg5PWEhEzzzrLSkC+o4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RW7oGbNN5w/t5ITWNDq6TePZbAFKrhjJ76lVE5uTtdlDtgcINGyf8b8TF1kr7UBc1
	 SVDsGSZX5oxaGEvZ8wRlB0FgVuTT6YnGtxV/hhPJ0v1/SFRNwUW7TElzTg9oM0mVtV
	 rtjA6SZdp5/dvxEUNU7TaVh5nmRdiGYr3o5Ah7Y0sghNTkgRvE50xgGzcro7IkC+C+
	 NiQcvAUDKdvtt/e3789YXxXCbX1eNJS6wT5wHwYrAKXzw0wcJ3hZb65WcHP2cVtvFp
	 H9LRzZA2T228/R4N+XYJVlLlAuLGuPtP8vTKmhPnZxsB8fd3x9ldnZOapE6eYexwtK
	 wGqDprH2XEBNw==
Date: Mon, 19 Aug 2024 20:14:23 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: WangYuli <wangyuli@uniontech.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, guanwentao@uniontech.com, 
    Terry Wong <terry.wong2@yahoo.com>, Craig Cabrey <craigcabrey@gmail.com>, 
    Dmitry Savin <envelsavinds@gmail.com>, Lugang He <helugang@uniontech.com>
Subject: Re: [PATCH v2] HID: multitouch: Add report_fixup for Goodix GT7868Q
 touchpad
In-Reply-To: <801C5D6FCE55F473+20240731154619.514470-1-wangyuli@uniontech.com>
Message-ID: <nycvar.YFH.7.76.2408192013450.12664@cbobk.fhfr.pm>
References: <801C5D6FCE55F473+20240731154619.514470-1-wangyuli@uniontech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, WangYuli wrote:

> Goodix GT7868Q has incorrect data in the report and needs
> a fixup.
> 
> The device is a haptic touchpad used on
> Lenovo ThinkBook 13x Gen 4 series of laptops and have
> incorrect descriptor that hid-parse fails to parse hence
> device is not working.
> 
> Link: https://github.com/ty2/goodix-gt7868q-linux-driver.git
> Signed-off-by: Terry Wong <terry.wong2@yahoo.com>
> Signed-off-by: Craig Cabrey <craigcabrey@gmail.com>
> Signed-off-by: Dmitry Savin <envelsavinds@gmail.com>
> Link: https://lore.kernel.org/linux-input/20240716222757.22931-1-envelsavinds@gmail.com/T/#mc7922671337acc84c69d367074ce341db5a819dc
> Suggested-by: Lugang He <helugang@uniontech.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>

Hi,

the fix for this device has already been queued [1] and currently is 
included in pedning pull request to Linus.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=for-6.11/upstream-fixes&id=c8000deb68365b461b324d68c7ea89d730f0bb85

-- 
Jiri Kosina
SUSE Labs


