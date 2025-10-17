Return-Path: <linux-input+bounces-15579-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C45BEA59C
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 17:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4DA495A1A82
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 15:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0089D231C9F;
	Fri, 17 Oct 2025 15:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8RsJBIv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120E330B3A
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716097; cv=none; b=ri637LzoN2hMTzWOqD402q0v8oqjlrWWLdMKCwFPKpR+8rd5VHCRs7QxKdxQPf97aZ1698VWlcak+0LPmo8s5LrKdd7QVwvAjKggHbAAZHFz++ci2B69KCHmcItxn+JGJ2Bj3H0MSqli/q5S4iR1rgqwX0M3uyYH0dlM2ZuKBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716097; c=relaxed/simple;
	bh=HYaDchW1eTI5q8adOk/HLFuf7X8xRJJyZIMJJRhRDNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QlzuaciHCntOBPzJnfmeEK0ivAEeoWQ8B71L2XY3bXDkogfHyqqN1SW95i04M5wPsAusIpAXSaDxG4PSkxgLvd2fc2Fjjh7wZeRtvgX7rf6xI47BiRx1xdLnyqTpMaWoZwLpOGR8kgWOJKgsU1RXNWYAuTO01Nn0abANEVS76tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c8RsJBIv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40119C4CEFE;
	Fri, 17 Oct 2025 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716097;
	bh=HYaDchW1eTI5q8adOk/HLFuf7X8xRJJyZIMJJRhRDNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=c8RsJBIv9FMs1zPBxI5oi/oZ3aJyaet97E7sR1CZ4qaYZ9yRSex6Lkgg3zpjHLjPm
	 vRO5iLDqBOrxtfwy51FT1UKrjuT+NEGC7JCqNOERWDyFG+zFxrZlt0q5oDFHuvYeiM
	 EuON5nAlRIH9BhDanMch0/YeSoSJ0UcQakWyTc9g2EKa3DdcrHAQJBX8c+LRmilh24
	 Ssn0uvzAJ+Kn019Z7oZQDpPWrJPLlYvQ7Mdke6EW1yPLDBukcR4NX5uIJ99B0GVy6u
	 9zI0DTJQdsxlMRf+uc7rKQFpUFPAN+Q2NEJ21suSMVGhj4WBpNqWrc2LGnzniZDVgE
	 v4Q4MflAWuUvw==
Date: Fri, 17 Oct 2025 17:48:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH v2 0/6] HID: intel-ish-hid: Various power management
 improvements for hibernation
In-Reply-To: <20251017022218.1292451-1-lixu.zhang@intel.com>
Message-ID: <8qq29396-s74s-077n-220p-n8p6psn1qq64@xreary.bet>
References: <20251017022218.1292451-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Oct 2025, Zhang Lixu wrote:

> - Separating hibernate callbacks in dev_pm_ops for clearer power state transitions
> - Using IPC RESET in ish_wakeup() to ensure reliable device wakeup
> - Scheduling firmware reset work on RESET_NOTIFY/ACK for robust recovery
> - Resetting client state on resume from D3 to maintain consistency
> - Enhancing resume logic in ishtp-hid-client for better stability
> 
> These patches enhance reliability, improve power management flow. All changes
> have been validated on TwinLake (ISH 5.4), ArrowLake (ISH 5.6), and PantherLake
> (ISH 5.8) platforms.
> 
> v2:
>   - Rebased on top of [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking
>   - Changes in [PATCH v2 5/6] HID: intel-ish-hid: Use IPC RESET instead of void message in ish_wakeup()
>     * Set the HW ready timeout to 10 seconds, matching the original timeout
>       value used in ish_wakeup(), to prevent timeout issues on devices like
>       the Lenovo ThinkPad X1 Titanium Gen 1 that require approximately 4
>       seconds to become ready after wakeup.
>     * Added RECVD_HW_READY_TIMEOUT macro for better code maintainability.

Applied to hid.git#for-6.19/intel-ish-v2, thanks.

-- 
Jiri Kosina
SUSE Labs


