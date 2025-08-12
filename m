Return-Path: <linux-input+bounces-13940-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF0B22751
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F194423900
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D241F4CA1;
	Tue, 12 Aug 2025 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jy7bZWwp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256471D5ADE
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002984; cv=none; b=qYEacdrDfSGW3b/NVOe+l847sysZ80+wWcfuR5beMJ+OxWxIAyOq93mJb4S0bK0Y2grCj01g54uN49q9N2eDbfcAOoT8mxKC8NtQ81VmxcCwAftzJP4smLdNd1bB8myB/HjQxSnPt6K3bFNKjQSW+4x6Wl9ynWKQF/sJnAoA4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002984; c=relaxed/simple;
	bh=lc9hyGZNHmxCppiKFkDphIAR88zeFEMqaKSJMTArQ3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=J5adpOAEdvqMBKpaPNqyQD6SW9Hhrh1SsKft8HakqPPZaH588HdP1gKabC0LtipPdR7iAaDBsLu9tdqT0nLrudvVPBo3vlNx5q5PRGdUk88seAXF5evhl4le5RQs+d2N7NHzoNRoL174Rrb6asbeeI+iET/vIn6pHlca874d6ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jy7bZWwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F4FC4CEF0;
	Tue, 12 Aug 2025 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755002983;
	bh=lc9hyGZNHmxCppiKFkDphIAR88zeFEMqaKSJMTArQ3Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jy7bZWwpbtGZxF4jY8CqJ6CjQhCltFhF5kKQ91uvq0aln5ez1bIsy3usedYGwoQXN
	 QBI9hFAl5wWZZUSJJWj5l2Rr3vCk4skq/wQ5md9ZT9ZgCZBkWX3WBzgxdnYfVGf6OP
	 MYgLJFTMrJAdTNjZwRLKHBQLFuKQGncf40uQ/bEArfS/4Drlaz2JbUBEGZ8P4aiim5
	 ygPeBupgt6OcC0MY6NFtwrh60klyFOG+dmyAWzrJUCDxVG48pCEMfyM5EY4tQWyS9d
	 zUs5zrtSzoaKbwNrCpQXkUxQTspQL+oab5oA78FpIQQJvuAuJHWaxdZyfa8syAQeCp
	 k4Nwm9pR0mxZg==
Date: Tue, 12 Aug 2025 14:49:41 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, hua.he@intel.com, wenji1.yang@intel.com, 
    juswin.hsueh@intel.com, henry.yeh@intel.com, neo.wong@intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: Increase ISHTP resume ack timeout
 to 300ms
In-Reply-To: <20250723013132.479762-1-lixu.zhang@intel.com>
Message-ID: <n64qq52q-07s3-760n-sr77-6792soo65675@xreary.bet>
References: <20250723013132.479762-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Zhang Lixu wrote:

> During s2idle suspend/resume testing on some systems, occasional several
> tens of seconds delays were observed in HID sensor resume handling. Trace
> analysis revealed repeated "link not ready" timeout errors during
> set/get_report operations, which were traced to the
> hid_ishtp_cl_resume_handler() timing out while waiting for the ISHTP
> resume acknowledgment. The previous timeout was set to 50ms, which proved
> insufficient on affected machines.
> 
> Empirical measurements on failing systems showed that the time from ISH
> resume initiation to receiving the ISHTP resume ack could be as long as
> 180ms. As a result, the 50ms timeout caused failures.
> 
> To address this, increase the wait timeout for ISHTP resume ack from 50ms
> to 300ms, providing a safer margin for slower hardware. Additionally, add
> error logging when a timeout occurs to aid future debugging and issue
> triage. No functional changes are made beyond the timeout adjustment and
> improved error reporting.
> 
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied to hid.git#for-6.17/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


