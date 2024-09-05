Return-Path: <linux-input+bounces-6257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98C96DEAA
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 17:44:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6701A1F21A7E
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 15:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD8219E810;
	Thu,  5 Sep 2024 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfu3pEk0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EFD1CFBC;
	Thu,  5 Sep 2024 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725551061; cv=none; b=n4sNUp+xhgV6hC09Jg00E8KQgCCtEdngAofwpKjAkp25ZE3j3w6Z4DdPpxlETr2a86ZXyQnBeCC9LssG+yibbRNLLCGG5/uh2VYhB7Y49lvcBANzmH2inUjSexnPZOwo9ZZ6onzUJA3lfOjcJLuYU6ImkL6lu4ACb/h1ZfcjORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725551061; c=relaxed/simple;
	bh=IX6/3mCaOhX2APIlASsoo4zd6sCvyLclDhS0DQDtquc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ka2jhU672ziPmdeSJiCzisR45fa+rRC6s9mdNpR7lwpMAyYLYoamVF3FZIjwdNIdIoE2VeTpIDK5wAqErgKuR0zpAVrMMGpR+6UBNKBZP/EKmQ18wWzZCRNmsaX9KaGE68JEMHJYNdd14DBfWf9HTxq7e35gC7Mp9RJLBj618Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfu3pEk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E36CC4CEC3;
	Thu,  5 Sep 2024 15:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725551060;
	bh=IX6/3mCaOhX2APIlASsoo4zd6sCvyLclDhS0DQDtquc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qfu3pEk045CMrXezjVGeWIKXpk2eMdiJwVSjFJrHbAl5J7uYhEX/BdJYYLOYPQc0n
	 AHhVaJ90cG6Www5byfe73dae0ZbqYAQQteGBQ2Df9yyl2zHwx57mWLNQc+DSTaHwgQ
	 1S+GzyA5vIduIQnJL1JrJb8dWuNP4yqQQ3RsUbcseaQ2AYlFTXvIGqW+dx1f0guU6f
	 phoLge//O9yWc4jDFeIfeqkjAGRPSkemZo5VesIuu8pVBp5Kbh31ylf1fCxdRmCerR
	 iewO9FNeKL/is5c8GUhmXiTFkyVoOLRsLFTlBJHq1Z5dZRUw2H6mrSrLgZi0HXuBdn
	 jN4Yem35SQi6Q==
Received: by pali.im (Postfix)
	id 9A8494AB; Thu,  5 Sep 2024 17:44:14 +0200 (CEST)
Date: Thu, 5 Sep 2024 17:44:14 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Erick Archer <erick.archer@outlook.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: alps - use guard notation when acquiring mutex
Message-ID: <20240905154414.5cnp5ozwflefp36l@pali>
References: <ZsrBkWIpyEqzClUG@google.com>
 <20240825201347.pdphq33cmng4ltds@pali>
 <ZtC2lcKuZd-NbDdl@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtC2lcKuZd-NbDdl@google.com>
User-Agent: NeoMutt/20180716

On Thursday 29 August 2024 10:57:41 Dmitry Torokhov wrote:
> Hi Pali,
> 
> On Sun, Aug 25, 2024 at 10:13:47PM +0200, Pali Rohár wrote:
> > 
> > Hello, I'm not familiar with new guards and their usage. But if this is
> > a preferred way for handling mutexes then go ahead.
> > 
> > I just looked at the code and I do not see any obvious error neither in
> > old nor in new version.
> 
> Is this a Reviewed-by or Acked-by? If neither that is fine too, just
> want to make sure.
> 
> Thanks.
> 
> -- 
> Dmitry

Hello, I have looked at it again, and you can add my:
Acked-by: Pali Rohár <pali@kernel.org>

