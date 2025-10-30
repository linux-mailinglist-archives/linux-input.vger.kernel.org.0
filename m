Return-Path: <linux-input+bounces-15798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2B3C1F8DB
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 11:30:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1925B4EB2E6
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8325230B518;
	Thu, 30 Oct 2025 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jel8LdaQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CF2F6591
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 10:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761820054; cv=none; b=XqZZlZ6sKpixo9FnIip9eS9K37G6OQptrOyyJktD2CplQ1wD+D8Lvidm+jjZgsB2TQLuLHZ8gcBWbkOxvFzzxARLb2ItviOHkiwcK+0uOvpJBrIw6Cei6aiHN8Su7Ol3WcGG5cGfYw/FY5/5/ZwKiCMQ6202aAj27u+/1Ee75d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761820054; c=relaxed/simple;
	bh=7HeetPGaO4gFmh1Mg5DmHeyuQ77hJK/pNQ7M4AfKSIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ED+s6mA6vdwZeBGLtkW0tpZcfg0Uog0xYzWXOhzKFR1EQhodu4hPcW1E1n+sdhsjhaRP6IbMw6ZolxKgUIlhq/rTtScMW6MIOddrXILX0PbfN02LAl8pXyfCG0fjgjoj86S2QnyclAY51f+5W46rwmdAEEXRRwnmMeWXDR7Xd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jel8LdaQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25129C4CEF1;
	Thu, 30 Oct 2025 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761820053;
	bh=7HeetPGaO4gFmh1Mg5DmHeyuQ77hJK/pNQ7M4AfKSIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jel8LdaQ8nRFVTPMig1h+arSE6udY51X8vxzl+ckqYZtaFz8+C9LAKSS1gPceS0B/
	 uRN+edqIXmZE5WNdqJCJ1WlpTAo4IxtX+uKfBt/pDZVNoRINlmAIGJ9gVM8ftF5zhr
	 5AQAW2n2ppPm7eGgbRSdB0Tw3j3cajkJPKDGqj+KHqtESEIJ9uvRw2EaBlpvQXYP8O
	 csNaZZdx/jScvre5C1H2A1igDlL7hnm2bVPzQwKwPNcj8OL6U92lficEhFsWrdSasN
	 AFSKggGH6pkLqoxH+75H+2TPtRCA/xjV45AevAhav813uON97eLcib3qo7HXp88S9y
	 ve6aAbFHcaIwQ==
Date: Thu, 30 Oct 2025 11:27:30 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
cc: linux-input@vger.kernel.org, Even Xu <even.xu@intel.com>, 
    Xinpeng Sun <xinpeng.sun@intel.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Philipp Stanner <phasta@kernel.org>, 
    Wentao Guan <guanwentao@uniontech.com>, 
    Abhishek Tamboli <abhishektamboli9@gmail.com>
Subject: Re: [PATCH 1/1] HID: intel-thc-hid: Remove redundant
 pm_runtime_mark_last_busy() calls
In-Reply-To: <20251027120123.391125-1-sakari.ailus@linux.intel.com>
Message-ID: <prq6p64s-r129-3q27-66rr-258o34qn866p@xreary.bet>
References: <20251027120123.391125-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 27 Oct 2025, Sakari Ailus wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


