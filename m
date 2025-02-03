Return-Path: <linux-input+bounces-9699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D6DA2565B
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041B03A9D5E
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 09:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 343C01FFC51;
	Mon,  3 Feb 2025 09:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l81GtO8m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC0C74BED
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576409; cv=none; b=s6O78qjlEv5LWUh0/3UjkNlNYnZLuCtuFHD6q+UQV0GdzeeTHjARIagXOJhoetv7tMvd617R0gDKGrJFkaGfGOyJx12vb7I8jjm46g5fYPpWCiL7Yv8nXU7Pw4+Mkp+BzllpNKrmGEzo1RDlgrUBV8HN4k7BdZY+wiunvHsAM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576409; c=relaxed/simple;
	bh=dvxJOiAAc7qaUxJFgz52GZNeNLCvbdwk10IAeQEHo8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JYeJjD46rbh78eoV3UVZ2JiDpNw3eRkPgcFLNAHJ7ieWJGjjUO6H2kg3SJBpKFUfUlCItf17sPvL5Mb8Y5sDKqF3xpB6PQOhsSK6ApKN5csm58OgCvD++IQ1qdNrjrlzR+yewK7OzyH6Unyldl3zJHjG4MmBdR9kv/CsH+V8q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l81GtO8m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BE4C4CED2;
	Mon,  3 Feb 2025 09:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738576408;
	bh=dvxJOiAAc7qaUxJFgz52GZNeNLCvbdwk10IAeQEHo8s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l81GtO8mIt6sEv8AZC0qZkoN16X8kyzR2nthYwyjW2UKyiPNzs3/YD+Szrt5Jwm/s
	 1yk7VPfrI9Ye5bnAtFXcbKZTHjuIPB7AxHzAZ685xPgWHVnIRT1OieGzn46Gy53UsT
	 d9qErdDNA/MHuXg4HyJzGEDi9fAdHCoDIy4hT0ZPLZvGmZ0uiXVoA53rok2FRXMUXR
	 MeWvJrvZVydlXr69bN7/iU+DZB1t+3JE/NQizogejPnQuNKRw26VK/yf3SS2rPH66Z
	 xrRvUWL18t1TF6mD9eW85i7XlOEXKsQSruDtqs7746KcPAV8AseT6maxXl2hETk6TM
	 vGjLUcNm/xW7w==
Date: Mon, 3 Feb 2025 10:53:25 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, changling.he@intel.com, even.xu@intel.com
Subject: Re: [PATCH 0/2] HID: intel-ish-hid: Fix and improve fw clock
 synchronization
In-Reply-To: <20250122012901.743123-1-lixu.zhang@intel.com>
Message-ID: <05s7n19r-o673-8nq3-93rr-n78152q619p8@xreary.bet>
References: <20250122012901.743123-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jan 2025, Zhang Lixu wrote:

> This patch series addresses two issues related to clock synchronization in the
> intel-ish-hid driver. The first patch corrects the length of the MNG_SYNC_FW_CLOCK
> message, ensuring that the entire ipc_time_update_msg is sent to the firmware.
> The second patch ensures that a clock sync message is sent immediately after a
> firmware reset, avoiding a 20-second delay.
> 
> Zhang Lixu (2):
>   HID: intel-ish-hid: fix the length of MNG_SYNC_FW_CLOCK in doorbell
>   HID: intel-ish-hid: Send clock sync message immediately after reset
> 
>  drivers/hid/intel-ish-hid/ipc/ipc.c         | 15 +++++++++------
>  drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  2 ++
>  2 files changed, 11 insertions(+), 6 deletions(-)

Queued in hid.git#for-6.14/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


