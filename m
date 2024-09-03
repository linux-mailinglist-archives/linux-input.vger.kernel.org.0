Return-Path: <linux-input+bounces-6091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD61969C81
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEB131C2168C
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 11:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB1D1A42BB;
	Tue,  3 Sep 2024 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YS8sqHtT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDF31B12C6
	for <linux-input@vger.kernel.org>; Tue,  3 Sep 2024 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364485; cv=none; b=SnTegSBi+UanitAGS1VPBUfcP9PTpXFXiFaPxxuC66VTqmRZtuGrc/K1AsC5lcJUxgeA0oHWMSjOvFnotFm0PYSBZVFZ8BlxxS152DPfgMyiFdTaRIS9wDYf0j92AN5/hXwJLR80oyu1emZDRfuTr+n5mA5ulWEI4WJ7lnZ/UyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364485; c=relaxed/simple;
	bh=DGJdOHZi5OuHrRqZtooi4B+R/jAoHsqJSWoFxOquOi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Txhx8zn6hihJf7rIqvUyA30w6DBXMNSpdeOHy84/5B57AyNOoJQhf4ReCEh2wAeq0xVxrPTi1cie79zry4+i6r8/tmWdgVZx2vcj2SbVXsEj6figw1x/iINT3tkSF5xUptaEhTm1QbZHtX5oY40BdhqLOgWwfQi3FMSwQgf1Szk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YS8sqHtT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D680C4AF09;
	Tue,  3 Sep 2024 11:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725364484;
	bh=DGJdOHZi5OuHrRqZtooi4B+R/jAoHsqJSWoFxOquOi0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YS8sqHtTSSELJ4/GCaE1EHn4eJNwT9sfpb3ZLTb6d8JrJkUuSzGCpQBYFtmF6/BqN
	 K784HJ+1z6ZcOMB+MvRIA1KGysSvgOayle1Ivxif9zIgQ96voHXUkP2y/3U5UTIQcw
	 RAbG447atGyPXlq0lcWJrm4lU0wNt1v214BWWVtleBnHI96Db+7w5e3Q9pa0SKITYf
	 byXZJtubAiYw4xu557IyMguoihQ2+ySRNVNXO5AUIuoLI8hZ2IbgjJFaw+8MQRivzh
	 HlrN+Vz2RbgWFnaMhBXB/hA4guLtJrZLXFjr384pb1GfdMGVc/JVNL69HHzh9kmT2e
	 o16Sn9vpQIjnA==
Date: Tue, 3 Sep 2024 13:54:41 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: He Lugang <helugang@uniontech.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add support for lenovo Y9000P
 Touchpad
In-Reply-To: <EBB0056587822FAA+20240827025605.13790-1-helugang@uniontech.com>
Message-ID: <nycvar.YFH.7.76.2409031354310.31206@cbobk.fhfr.pm>
References: <EBB0056587822FAA+20240827025605.13790-1-helugang@uniontech.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 27 Aug 2024, He Lugang wrote:

> The 2024 Lenovo Y9000P which use GT7868Q chip also needs a fixup.
> The information of the chip is as follows:
> I2C HID v1.00 Mouse [GXTP5100:00 27C6:01E0]

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


