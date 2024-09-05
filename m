Return-Path: <linux-input+bounces-6241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CB696D26D
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 10:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73746287362
	for <lists+linux-input@lfdr.de>; Thu,  5 Sep 2024 08:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F1819258A;
	Thu,  5 Sep 2024 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9s5Ekrq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC5194A60
	for <linux-input@vger.kernel.org>; Thu,  5 Sep 2024 08:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725525990; cv=none; b=sPr+2hzMmCKcsfZFNNQlFX4NgJCrBd05v5AfhmFBPdUO8TBKXO/XK8XGOyKJQDJRIN2XvweVbWIBtCkET9tmnK0LY9ASGgz3W7a22u03zOG1rp4qQiqBaOl1kO7lbPTQeBvTLQMHhS9eqCrlmhzX1+vG3fiIltC/Xej7uaO+9nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725525990; c=relaxed/simple;
	bh=e7F++L/dmZeqaqM4k2T8S0WCGy5DIvgs06Xt4KOVxjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ls6z5bkSSNw7FqHvnq+VEKHh8SVV3g63mSOSayHlYS6fgB29uRjaF58GhFx6FYxkEEifuloLZHrbGoRFCPAzybJXeeP+l691PQRRIRhClewXtSRVUmFtA57M2bUa+FHIa2TiN1mtFczkCoq1KpluL8sHF4qgQtxcTYG2spN165U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9s5Ekrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A1AC4CEC3;
	Thu,  5 Sep 2024 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725525990;
	bh=e7F++L/dmZeqaqM4k2T8S0WCGy5DIvgs06Xt4KOVxjo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=V9s5Ekrqgcmx3kqWnsUYYJv+NcPIKQMOj9foGc3b7OVly3o8RHKebf4pQyzu+oHeq
	 p3rlo3Uq2Oe2HeHVEDcTtUIt/B2ZBmDHRDEvlBG6AeE4jdEoqPF4jrQLZZiX3yNPOM
	 J8JaIX8FpHfjX7Yax9ycDJ6XW4g6k4koOGz92WGAe9zTfRCO85aWbQMBm3T/IZHl8P
	 R/o7QqA74GAbG/erA+Ku1qSEQuIvxiW+Efy3V0BEgIeA6kQ+PlMpf4wcMNXVxabALC
	 yj3CeBO7DRbMuh7/m2PMv5AGljjoYdPF8R0WgeJ8kY/iLYVNgYAXVM/0/ydQphlco4
	 6hs4v6eU3yXJA==
Date: Thu, 5 Sep 2024 10:46:27 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>, 
    Erin Skomra <skomra@gmail.com>, Joshua Dickens <Joshua@Joshua-Dickens.com>, 
    Peter Hutterer <peter.hutterer@who-t.net>, 
    Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [RFC PATCH] HID: wacom: Stop mangling tool IDs
In-Reply-To: <20240903182633.870892-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2409051045470.31206@cbobk.fhfr.pm>
References: <20240903182633.870892-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Sep 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> In ancient times, an off-by-one-nybble error resulted in the Wacom
> driver sending "mangled" tool IDs to userspace. This mangling behavior
> was later enshrined into a function so that devices using the then-new
> generic codepath could share the same broken behavior. The mangled IDs
> have not historically been a major problem for userspace since few
> applications care about the exact numeric value of the IDs. As long as
> the IDs were unique it didn't much matter. Some programs (cross-
> platform and remote-desktop applications in particular) /do/ rely on
> the IDs being correct, however.
> 
> This patch rids the driver of the mangling behavior.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
> References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
> ---
> I'd like to get the opinion of the kernel maintainers on making a
> change like this at some point in the future. There are _very_ few
> userspace uses of these IDs (primarily: drivers, compositors, and
> tablet control panels) and my plan is to update those bits and then
> give some time for the changes to roll out to users before re-
> submitting this for real. I don't expect any kind of breakage since
> we'll be taking our time with the rollout and userspace needs to
> have handling for "unknown" IDs anyway (since Wacom periodically
> releases new pens).

As you are in control of the whole ecosystem anyway (because it's Wacom 
specific), I don't see it as particularly problematic.

Thanks,

-- 
Jiri Kosina
SUSE Labs


