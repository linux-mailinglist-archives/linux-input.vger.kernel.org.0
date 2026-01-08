Return-Path: <linux-input+bounces-16875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C49B1D03149
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 14:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21AD830BA01C
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 13:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82EE4D1ADE;
	Thu,  8 Jan 2026 11:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnT8Eyy8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6414D1AED;
	Thu,  8 Jan 2026 11:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871248; cv=none; b=p0Ddxm7p16GaptN49oQ+YWudhutMFy+cZ4vyHGFEHbSx+m9rJK7f46ywiW+X6u4hblcwEhLPT3U7/RqHJw/0LwzS00sPysoa4bKOCESros70Z5enh1CaGrLXw3q/fJkjkdo0tnUh7sTVrN+n3WVK8sd2o4bNDd/aN1nnxiylTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871248; c=relaxed/simple;
	bh=TdLS/lQOQ47g31V1tPRAULrRx6B8YantWlsya6Bzgrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RRnYnVLuRXohLoJ3AbvkO1/dSzN95WeztFTBNJW+WAaR7YaVL4uDGDH8VnkWthUun26irq8Wu1SWDu7K5Qcux0PXxYoIPtEaxLp0nuAzLPKwoeET6Sk1QgwcG5crrOe2L1S6cO3LSzITARybXoQ7JBa39oogZjPvDV/3ow/VSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnT8Eyy8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F76C16AAE;
	Thu,  8 Jan 2026 11:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871247;
	bh=TdLS/lQOQ47g31V1tPRAULrRx6B8YantWlsya6Bzgrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=QnT8Eyy8qazWoxe42m5exzpbEbosLKJ6CiqtCNQOZEQvJtLXTVXehWVJRqh8tApU2
	 pGXu5UAR9kZzCXRB9dGuYgyXxZxc8WZY0U57hAqc9Y5g8Wdfpwm6U+kP3/gWnMjWWt
	 lWLOxnkwkSDWszVaxy8dyOzjT09SSJvw8+zUcCZBzAncRNlh9LK1V77oqiRf+KHmWS
	 nTMJfR45jgAawHpdfohitsxJAyJaEyOYbtct5awiPpZcLN8khNez5gNY6j2haJeBMN
	 0YQbsf2hsrayRwnACDOSf/VvjcCeU546K3Jf9wOMXUJLLWi1q3F6BLbGgAE3hgLe3I
	 3sCLpVPUMmdOQ==
Date: Thu, 8 Jan 2026 12:20:44 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
cc: Sriman Achanta <srimanachanta@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] Documentation: ABI: Document SteelSeries headset
 sysfs attributes
In-Reply-To: <aVJSNAB8AWpPAQFM@archie.me>
Message-ID: <6rqnsssn-12qq-r547-89s3-04r1spp6pqp8@xreary.bet>
References: <20251228122025.154682-1-srimanachanta@gmail.com> <20251228122025.154682-4-srimanachanta@gmail.com> <aVJSNAB8AWpPAQFM@archie.me>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Dec 2025, Bagas Sanjaya wrote:

> On Sun, Dec 28, 2025 at 07:20:24AM -0500, Sriman Achanta wrote:
> > +What:		/sys/class/hid/drivers/steelseries/<dev>/chatmix_level
> > +Date:		January 2025
> > +KernelVersion:	6.19
> > +Contact:	Sriman Achanta <srimanachanta@gmail.com>
> > +Description:
> > +		Reports the current balance between Game and Chat audio channels
> > +		(ChatMix). This value changes when the physical ChatMix dial
> > +		on the headset is adjusted.
> > +
> > +		Range: 0-128
> > +		       0   = 100% Chat / 0% Game
> > +		       64  = 50% Chat / 50% Game (Balanced)
> > +		       128 = 0% Chat / 100% Game
> > +		Access: Read
> 
> Sphinx reports htmldocs warnings:
> 
> Documentation/ABI/testing/sysfs-driver-hid-steelseries:47: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/testing/sysfs-driver-hid-steelseries:35: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/testing/sysfs-driver-hid-steelseries:62: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> I have to fix up the bullet lists:

Sriman, could you please resubmit the series with this fixed?

Thanks,

-- 
Jiri Kosina
SUSE Labs


