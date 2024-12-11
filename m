Return-Path: <linux-input+bounces-8499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE80B9ECE4B
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 15:13:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5DA51884643
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2024 14:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D974A237FD3;
	Wed, 11 Dec 2024 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7FFXWiC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC9E237FD2
	for <linux-input@vger.kernel.org>; Wed, 11 Dec 2024 14:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733926172; cv=none; b=G7CN7rdLmZFZWBce0Ini41+6bgxHQwLbyL/Fyylhgo/4mlxyf+8hzauczNvz+BGDfcOqZ1kKJww22mBgpb/VkqbTC+1oPGwNCX8hH/uaytBh7At4z6ycC1UEA3utt//pUmvdA/YTpS49vvToSNc19Zxy+l27LWd8MwLDvGqTr4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733926172; c=relaxed/simple;
	bh=NgvlsUS5tgwQWylPQ9ywsOpX/shcelsv2sxjWXmIik4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YI8ax7VQxo5ZHl4RvSH8UBCSRQufQY1zCnu+0SPiRCH5g2mfXCZc673dHVjOI8g4DdCQ2NZFvirjNFx12vGmRWrlFeMGVGjClSyeje7bJaI58bXjAK2YnZ3M5xmuNTbnpPzQBWEF214Y6jj1ve7ujCaUnkAibj/trVggapL0K4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7FFXWiC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32B3C4CEDD;
	Wed, 11 Dec 2024 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733926172;
	bh=NgvlsUS5tgwQWylPQ9ywsOpX/shcelsv2sxjWXmIik4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d7FFXWiCwpwXYWU1Xy7Wg/PeE7b2Ke67PVN067upLRLoANcvdBhwY28jT6PRNGIOT
	 73b03sOhzwEQ4j19pKs7fL69e2i9NWN/mValZoysY1/ybUh/8rTtk2ubYPxvA78qCi
	 4xUeo+/9c7oSB9wS2LfS6N2YsF7A7L/6pDH4UqqyTi7NNrl6jhDEPWzzPU+2jDA4CN
	 1iBKZtnnqgnv34Ns3CaYMgDpHvh4VXzV9oB9HuYVIaWev/67MV9+zMnnDHSAvUzmTi
	 xmzV5gjf3u8BTeFFCPfLShSW3j8fb6NPVNZedMykuegtvQq8PSE543/OEd+q+JTaZV
	 US638mVbFNdAg==
Date: Wed, 11 Dec 2024 15:09:29 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, Erin Skomra <skomra@gmail.com>, 
    Peter Hutterer <peter.hutterer@who-t.net>, 
    Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH 2/2] HID: wacom: Status luminance properties should set
 brightness of all LEDs
In-Reply-To: <20241210210059.87780-2-jason.gerecke@wacom.com>
Message-ID: <r432237q-no33-rr8s-5p7r-03581s1pq178@xreary.bet>
References: <20241210210059.87780-1-jason.gerecke@wacom.com> <20241210210059.87780-2-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Dec 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> The wacom driver has (deprecated) sysfs properties `status0_luminance`
> and `status1_luminance` that are used to control the low- and high-
> level brightness values (llv and hlv) of the status LEDs. These two
> properties had an effect on /all/ of the status LEDs.
> 
> After our driver switched to exposing each status LED individually
> through the LED class, this behavior changed. 

Would you be able to identify a particular commit where this behavior 
change happened, so that ...

> These controls started having only a temporary effect on the 
> currently-lit LED. If a trigger changed the current LED, the driver 
> would switch the brightness back to the llv/hlv values stored per-LED. 
> (The code's current behavior of updating the "global" e.g. 
> `wacom->led.llv` values has essentially no effect because those values 
> are only used at initialization time).
> 
> This commit restores the original behavior by ensuring these properties
> update the per-LED brightness for all LEDs.
> 

... we could add a Fixes: tag here?

Thanks,

-- 
Jiri Kosina
SUSE Labs


