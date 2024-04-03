Return-Path: <linux-input+bounces-2793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5F896E6E
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 13:46:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5334E1C20A84
	for <lists+linux-input@lfdr.de>; Wed,  3 Apr 2024 11:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BE017583;
	Wed,  3 Apr 2024 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBJ74YzJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560611419A2
	for <linux-input@vger.kernel.org>; Wed,  3 Apr 2024 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712144768; cv=none; b=po2bFzXjM6kGyjT2wrQ0/TEKQsCmwBIO3bYRz1cINnMEcZvsp5xF/7csd6gmGIVrRRIk9hfXoVze5TjRcyrxaDujGRifnD9gxjamwjOxrETuBEzeKW9/lGIHVWRrnbN0vNZhHBEeXCJT6H9andVGmwOs/mF1M+ComRNKnjWWKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712144768; c=relaxed/simple;
	bh=ea//ZnxqPcoeXvhwBiQKCY/roavyoDCRYqAGNL9wBrI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OEVlhBSObKGGzuT8i872SCndMPmrNeviw62p5sHtjAbGWvP4+AO/nwAMztO2k7Pbg9ZzS6QM2TWZtTMeWRb8dzU0m2HK+Dt8jpGKQsSFsNneaWE8s8nRZiqriwieTt4HaLyoop2JyUWQkGfI3TNe1V1LsGPpLV4HJj0fsd+ijoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBJ74YzJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852C1C433F1;
	Wed,  3 Apr 2024 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712144767;
	bh=ea//ZnxqPcoeXvhwBiQKCY/roavyoDCRYqAGNL9wBrI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bBJ74YzJsBWK0FBfdT4kUoQ7iBeGXqW4C/0IfKWvVDss3Re2GvB5/3jWlB2LMwKuk
	 Zm7MmtnoFZdSAd694ZmS6N4D/rUtc7cUomeyqCxIDBrI/Mvw4DjTd6Jse1Tk68uCSP
	 pzqKr7+iHK5Lz+/guB5y9lTzrzSgxZngFGOjJkgBL7z1D1XSKSy+SZQuG1FeIoshnE
	 b49fjg6GzGkIShikJMZCAqJyt5hd20QyKvxnnFpO73TIkwVr1ABvSumLQPn1NjlUTn
	 bTyUso+yBMKudjvRTdUjzGHWF7PPz50dyDXGTVi8UAynq2Z1KkwegAe275oL9U5+3a
	 mJTDMUUfVHDNw==
Date: Wed, 3 Apr 2024 13:46:05 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Kuehne <thomas.kuehne@gmx.li>
cc: linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH v2 1/1] HID: hid-debug: add missing evdev and HID codes
In-Reply-To: <ZgDSAzsYVzgnjyao@black>
Message-ID: <nycvar.YFH.7.76.2404031345550.20263@cbobk.fhfr.pm>
References: <ZgDSAzsYVzgnjyao@black>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Mar 2024, Thomas Kuehne wrote:

> Hid-debug's rdesc output for a game controller contained a few question
> marks and numeric IDs instead of the expected descriptive names.
> 
> This happens because:
> 1) the mapping data is missing event codes defined in input-event-codes.h
> 2) HID usages aren't up to date
> 3) hid_resolv_usage fails to account for the sensor pages' modifiers
> 
> Add missing event codes and update HID to HUT 1.5.
> 
> Signed-off-by: Thomas Kuehne <thomas.kuehne@gmx.li>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


