Return-Path: <linux-input+bounces-6427-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBC29751E5
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 14:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 708911F216B6
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2024 12:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C553176FD2;
	Wed, 11 Sep 2024 12:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxWCdQr2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E25142E9D;
	Wed, 11 Sep 2024 12:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726057287; cv=none; b=pa6tHqpSMTswA89WmNS3CyNIuEEDR8DV8HGbmsDFLshNPRtvKwN09NgvJHx612jaPtVVHPZrLKiC6VWhjk6ypEijAb3rgNZzulNq54OXjEpnq3vvKCTylQMhrRqUXFi179LQ8dYEFxhbnq9JGLkidaEh8R7MjWNbZ6CmEtU+cio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726057287; c=relaxed/simple;
	bh=zkDvPHD9waoczVeuUBXDcIZtXJB7vVQr6OpezhAsA7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kYXKVSn0rhbMdk1XCEdGlFIg4Rb/uCrsH66jVr6qTlfZAIbVh1oxszD3lPZvSGMf55Nnp3tJ/VVFnjofL3u4zcYiYtjHUD9Ks00AgRcXSh0XXAMNICGfTJ1aIhRYGHzbNa6qsyXlY3AKLrELlXCtuRtsR2wAqaeaIWCaYs8waPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxWCdQr2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE63C4CEC5;
	Wed, 11 Sep 2024 12:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726057286;
	bh=zkDvPHD9waoczVeuUBXDcIZtXJB7vVQr6OpezhAsA7M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=OxWCdQr2Nm0/vPl2R1022IHDtP+rFkNsshVwj02hnbRH/pNEpV6Cc/TPmmT3kFB/D
	 geRxpdp8cdVcFGXXGtixEaeD7RJHJjdhKakYPTnyOB2Cj5psLwbdq/c0wbT/3Inu2U
	 bwZxhOZJL0KG9Fau8G/Wi3Il+NUoTgQe7vaP/+xNyQPU8Ivx4ars0WY44WSVmbs/38
	 weCeT1zVccLLJSgUIW3fQbaWsVaeUprOJJQ6a0uHZ9CONHfhwLTsajOy8ujfA8UOuh
	 cQzCth31qOT0Xs079KjOFEdTp529LUBIM0ooRVd3GHa7gPmNYJ9/qjh83A3SjgpIKP
	 2C7Bxp3rF1K9Q==
Date: Wed, 11 Sep 2024 14:21:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
    "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
    "mripard@kernel.org" <mripard@kernel.org>, 
    "airlied@gmail.com" <airlied@gmail.com>, 
    "daniel@ffwll.ch" <daniel@ffwll.ch>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 0/10] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com> <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 31 Aug 2024, Aditya Garg wrote:

> Hi Maintainers
> 
> It has been 2 weeks but I still haven't received a single reply on this 
> version of the patch series. Consider this email as a friendly reminder.

I think it makes most sense to take this whole set through hid.git, but 
for that, I'd like to get Acked-by/Reviewed-by for patches 9 and 10 (drm 
bits).

Dave, Daniel, .. ?

Thanks,

-- 
Jiri Kosina
SUSE Labs


