Return-Path: <linux-input+bounces-11976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90157A9A9E4
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE0FE189D576
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B288221712;
	Thu, 24 Apr 2025 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwVpHHwT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30639221708;
	Thu, 24 Apr 2025 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489911; cv=none; b=mbf9Blccxgxd5KQi254i7qxhyhTzWGm0EW8iNYg0Cjwep/JFV5su/nkds52ZpLhX3EDB+7y/hbUdStuBeEwcHaVbvqCmRBrarr7Rx9Vjc1rojMS/emOnH0fPNz4NqQs0uZve47nS2dFwZBoGuGxP89ikiEhkQ0TKzHIWAX5l8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489911; c=relaxed/simple;
	bh=Ddk2Iu+rBULTGkPSu8ho2jYg8FUvYGgr3tZBN1sB5oY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EjcWssb2SJGolcIO2Sjng3rv0gkaZ1Eq0A5R2MMu2KHXaVqks3YHSmlCoK0YIhFC5JfUsubpWbDrBgP3XEwIf1awsONm9EL1QxZMlsZ554vFIb01/BfWi2gn5ugjPnr/2V2WAiIrkOPgRwQ9TknvoQ+qS51X6n4R9DsmwR2uVBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwVpHHwT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07002C4CEE3;
	Thu, 24 Apr 2025 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489910;
	bh=Ddk2Iu+rBULTGkPSu8ho2jYg8FUvYGgr3tZBN1sB5oY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KwVpHHwT61wNUke+EUsvfIxAkmFpICKZRxGhcvNF3xyeTLiAwTgzA1/XxvaMqdr+M
	 WAqot3oBTRTVGI2J9HS/82ukmgst2+b+741NEzMqWZ7Pee1apyOq7J0LmvCkYX4wWI
	 ouWlc9QCYv6j4Cqs/bU1/R4R5WyEi18V2HU4EAWLOuO22+hZRmkWtPpeWW9e8HkOLa
	 Xa0UM39kKFmpOAiCIKjQoPAz7OReBlthETZkE4Z5pAvER5hXigGHzDEjM4pUxrgjc5
	 n/Zc4kKjxFT8F+QOZzDRI+ywyzHS/9R6P69959MbYykMT1F7G8THnfyCxFNMKcZoWa
	 19eRtCoVNGRzQ==
Date: Thu, 24 Apr 2025 12:18:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
cc: Basavaraj Natikar <basavaraj.natikar@amd.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    "open list:AMD SENSOR FUSION HUB DRIVER" <linux-input@vger.kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v4 RESEND 0/2] Fixes for SRA sensor handling
In-Reply-To: <20250421213210.1160665-1-superm1@kernel.org>
Message-ID: <oo62srr7-0128-p33p-9073-ro2rq99919n6@xreary.bet>
References: <20250421213210.1160665-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 21 Apr 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> On systems with an SRA sensor there are some problems with both init
> and failure paths.  This series accounts for both.
> 
> This is resend of V4 which ahsn't gotten any movement the past two
> weeks:
> Link: https://patchwork.kernel.org/project/linux-input/cover/20250407151835.1200867-1-superm1@kernel.org/
> 
> Mario Limonciello (2):
>   HID: amd_sfh: Fix SRA sensor when it's the only sensor
>   HID: amd_sfh: Avoid clearing reports for SRA sensor
> 
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Sorry, I previously reponded to v1 by mistake. v4 has been applied.

-- 
Jiri Kosina
SUSE Labs


