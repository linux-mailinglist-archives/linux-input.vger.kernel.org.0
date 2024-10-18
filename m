Return-Path: <linux-input+bounces-7528-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD5A9A3B89
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 12:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5D5728475F
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 10:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444562010F7;
	Fri, 18 Oct 2024 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUNAdAYy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41A201021;
	Fri, 18 Oct 2024 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729247357; cv=none; b=nDGPm1W1ETm3SgoP/ONKQtX4fbZf9kYFZawGM6ThLpbKcaiHIbVmNPCGogegyWu7HIA8JbiR9N2LzSofrB3HcZcdkStiEUzcwRSpebWBNrGUEbVm91/qhUIY59rWeDVpo2t1npoFaLipP3bblmbXZoQ1QOdh5LgIN860pA8btLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729247357; c=relaxed/simple;
	bh=1k5zdatWmMVzIArm2Fk3txQTqagO25Rf8f+FypKhIz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WveP7J1GXnymjUapElOkuW4qeC1ROEr/xtzYxUeXGqFgvno31DI+kiXMROcntiTK3u9zQJYnnC3AX3aQwc7YhVnfx6v2sGA5QnUaH6KwO28tlgFfENYK6gQwhvsuWFxXMEJsW61H9mxYpbFDXXiQInkkAg4pnSyw/1zOmmPD4to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUNAdAYy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F80AC4CEC6;
	Fri, 18 Oct 2024 10:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729247356;
	bh=1k5zdatWmMVzIArm2Fk3txQTqagO25Rf8f+FypKhIz4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CUNAdAYy8IN0SbqBBsByxbfjahehsYg2SsVO4ngWLAXhrNVVb+p8U4KQaeU4U9xvI
	 DUOpKXDcA/zdI7chmYrC3CKwWxAIwBeg0nluj3L8BxIzYXgjwN8HylM17naT3J4JSN
	 Y2nuGc7govrABj0sR/fF6TtvsMKakx551ks3ic8quEgRpt3dlwT0FK7Ot9gFazkztZ
	 gbhN9ZY3Z8Wht9Equvy86a2l6mAw+rGqfgUX5jCbeKDeUKYlIBcRakJwjUwLfSVmd0
	 LNloOPKe2Dv4BCJwBgeTNj8V+B66728ehaydXEUYoE/5uGMxGvGs/SnH5GvGeetwvG
	 xRzMXzrPRvbtg==
Date: Fri, 18 Oct 2024 12:29:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Lode Willems <me@lodewillems.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] HID: add Kysona driver
In-Reply-To: <20241005120256.13847-1-me@lodewillems.com>
Message-ID: <nycvar.YFH.7.76.2410181229030.20286@cbobk.fhfr.pm>
References: <20241005120256.13847-1-me@lodewillems.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Oct 2024, Lode Willems wrote:

> This patchset adds a driver for the Kysona M600 mouse
> with support for battery reporting.
> 
> Tested with a Kysona M600 V-HUB Special Edition
> 
> Lode Willems (4):
>   HID: Add IDs for Kysona
>   HID: Kysona: Add basic battery reporting for Kysona M600
>   HID: Kysona: check battery status every 5s using a workqueue
>   HID: Kysona: add basic online status
> 
>  drivers/hid/Kconfig      |   9 ++
>  drivers/hid/Makefile     |   1 +
>  drivers/hid/hid-ids.h    |   4 +
>  drivers/hid/hid-kysona.c | 248 +++++++++++++++++++++++++++++++++++++++
>  4 files changed, 262 insertions(+)
>  create mode 100644 drivers/hid/hid-kysona.c

Now queued in hid.git#for-6.13/kysona.

Thanks,

-- 
Jiri Kosina
SUSE Labs


