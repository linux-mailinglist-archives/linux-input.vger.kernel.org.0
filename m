Return-Path: <linux-input+bounces-15460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 242CABD86C4
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C329234EB38
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539E92E5B13;
	Tue, 14 Oct 2025 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOhJdh9m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD432E0B5F
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433889; cv=none; b=E025M8+LcsvphR3fQC+krtIcRHfLKJG6JL6i1w4pW+zr9tIAfpERGNoYue88NXASOibIOMK1xjuccVqWU9uQOgPS2d5MjHFirAgZjj6jbb+O8f85sShaP5RcjjsRUGhfVsl3qfNoeETt2sj0H/3ShgJM2nwLC6zALEJkqzPZ590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433889; c=relaxed/simple;
	bh=/RsuwwBJmhbccaogZWjmmFpLwRzdz5yzPoaGTPSu2hk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=G+KeJ4aUEKqGWuB28ndZ6KE3Gs9Z6YWEg4EPtDkLnaXl4hU8PiUrq+FH8hOVK4QAnfoKWj0kaYnQjDqfN9pR9dadwOf5MysT8ALEK2K5CFyFftCwakoEuUMAppbvvhd4pU1NNhnQ2z6A1yXWtTgqlRdNl+troggwVflyeycCl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOhJdh9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47709C4CEE7;
	Tue, 14 Oct 2025 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433888;
	bh=/RsuwwBJmhbccaogZWjmmFpLwRzdz5yzPoaGTPSu2hk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JOhJdh9mdtkIWfjBM7XdCNWolwGJr53t4WtuvdKPv/QCPZkSlEgAHBaH3U7/tcUqi
	 tUf0Z7wsSZ2+5BwRhCFwRFXSkcoU2G4gtAU3E64HOugKrngpNPtFdXtFVQtip6PLhP
	 FikILztutcLiWJaAcTCdzxcEOjcKMo34ythfWqHHW7AmaioaT3meaXp+Sn9GzRon/f
	 tP7LUwAC6T2xp9jkOZqP3RHk22HbYsx/OvckO0c05GV9YhCD5fbGSjeA2zb9l7AjnT
	 uPPFZs1XN7b2EizZg40pJugzy41F6VCCHn9PZ+uIkiv9LdIDUBt3Ti213Vji5aPJfi
	 xNIB5v7+Xq5dA==
Date: Tue, 14 Oct 2025 11:24:45 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/6] HID: intel-ish-hid: Various power management
 improvements for hibernation
In-Reply-To: <20250919010559.165076-1-lixu.zhang@intel.com>
Message-ID: <r57s7srn-o26n-0s47-76q0-4o32r47r0n8n@xreary.bet>
References: <20250919010559.165076-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 19 Sep 2025, Zhang Lixu wrote:

> This patch series introduces several improvements to the power management and hibernation
> handling in the intel-ish-hid driver. Key changes include:
> 
> - Separating hibernate callbacks in dev_pm_ops for clearer power state transitions
> - Using IPC RESET in ish_wakeup() to ensure reliable device wakeup
> - Scheduling firmware reset work on RESET_NOTIFY/ACK for robust recovery
> - Resetting client state on resume from D3 to maintain consistency
> - Enhancing resume logic in ishtp-hid-client for better stability
> 
> These patches enhance reliability, improve power management flow. All changes
> have been validated on TwinLake (ISH 5.4), ArrowLake (ISH 5.6), and PantherLake
> (ISH 5.8) platforms.

Applied to hid.git#for-6.19/intel-ish, thanks!

-- 
Jiri Kosina
SUSE Labs


