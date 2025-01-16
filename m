Return-Path: <linux-input+bounces-9267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B88EA13756
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 11:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93833A1E35
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 10:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C001DD889;
	Thu, 16 Jan 2025 10:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I1/sapsu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10DD1DD879;
	Thu, 16 Jan 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737021867; cv=none; b=ARxqdJb+T+2AwfcE/SZ+rOcesFwFDzgAzT4nsl02F+4Qpfqt+iCW+YzG5FZNvdOlMKjCYpDJNslyBMG4cBEhjTZtSDp1qUVi2r2VDo/g5c5ZwAoyVSjU25ITnVn9SJVDkUUhkiS0Xw6o6vCLnQi0nLBQOGrHiFP/hyq2l8V9yhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737021867; c=relaxed/simple;
	bh=9WSR4Bj9MU4Vu3iEh0etBrOM04rKj3DBB+CTM4x7agg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qfi3zwBfxuPB4kGTjDd5+E4TmolcXuQXrsCm7NT+Dnj+ORBCNm1A9M2q1GEyNzQ9WqUlj2pj9kT+z9IZIkSxLbXplVP1Qs+HNgZmF4GUCDx0eatd5Kr2bg9EymjcKag9cJEGIJeb9FssNlhdyWUoQ1ohsVEw5IrB9r/u0jpOL8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I1/sapsu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED56DC4CEE2;
	Thu, 16 Jan 2025 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737021866;
	bh=9WSR4Bj9MU4Vu3iEh0etBrOM04rKj3DBB+CTM4x7agg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=I1/sapsuiyIFweJZQvoNiQxIndWu0D9SuTn97HY9TpoyyB2BQRGr6a6Grqbxfa+SQ
	 SAVZaFt/Ty+gOVysP0Ui6D2Z8XpXwGaNAWc2/3khMNStGXpTzZSEfRYzojB9xS8Rt8
	 d26j0IDyG1UmsCPBHyTrOckjRIKMtgazzF7kkhRSPdG8WfgKWPT8smQBIgM//pDrH0
	 G+MUk8QE5zoZFMcgCJ/1gFG6AiYrY7/4yDB0GsUYbjF5Y4lyBGOHQSTlW23mc3eySC
	 nsjuEG2Z1YP5Gu+g1gGLh7mWVgVG1LlYnoO4f3HzcfiZjs2I7xBhL7pLT0P943cf9K
	 z9NNq5JzMhlOA==
Date: Thu, 16 Jan 2025 11:04:23 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Christian Mayer <git@mayer-bgk.de>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Bastien Nocera <hadess@hadess.net>
Subject: Re: [PATCH v2 0/5] HID: steelseries: add SteelSeries Arctis 9
 support
In-Reply-To: <20250112114438.2196-1-git@mayer-bgk.de>
Message-ID: <62p5r57p-1qq0-qo96-sp69-r6ns75s2s1on@xreary.bet>
References: <20250112114438.2196-1-git@mayer-bgk.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 12 Jan 2025, Christian Mayer wrote:

> Hi,
> 
> i added support for the SteelSeries Arctis 9 headset.
> 
> Changes in v2:
> * Use constants instead of magic numbers for cleaning up model name.
> * Remove unnecessary whitespace changes.
> * Split up preparations and actual adding suport for the device 
> in separate patches.
> * Call hid_hw_open/hid_hw_close for all devices
> * Fix code style issues
> * Optimize capacity mapping for min and max values
> 
> Christian Mayer (5):
>   HID: steelseries: preparation for adding SteelSeries Arctis 9 support
>   HID: steelseries: add SteelSeries Arctis 9 support
>   HID: steelseries: export charging state for the SteelSeries Arctis 9
>     headset
>   HID: steelseries: export model and manufacturer
>   HID: steelseries: remove unnecessary return
> 
>  drivers/hid/hid-steelseries.c | 120 +++++++++++++++++++++++++++++++---
>  1 file changed, 110 insertions(+), 10 deletions(-)

Now in hid.git#for-6.14/steelseries. Thanks,

-- 
Jiri Kosina
SUSE Labs


