Return-Path: <linux-input+bounces-15465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 567D5BD88FB
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4261D4FCEBF
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE552F0690;
	Tue, 14 Oct 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n67bp0HY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E5B2EA48B;
	Tue, 14 Oct 2025 09:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435331; cv=none; b=tf1R3TA5zl/JKbICcWQV0D0hARSszhNgm4tfe8AGfHLurUS+FitYyXwgxBq/DXCS4TqpsooLaHjPzn3nu/9rctgVK8tDOIUAh1ZxO2CFe0Mn2q6875tGSe0G3Zu3SLBZTMVxjgGcCYj5QkBiHStmR9lSaHBfjxLRgcgEoCyUuck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435331; c=relaxed/simple;
	bh=vjyysok8ydO2qUwr+zeJ9NGUJe9esAPiRJzWLppcF+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ZL40TClupW4hgsbIS32OYE6PBC3hfguUhrk/ke3fsFEvmXdNxXQNDRcx4Gk1wWz83iCMKOZMdQ/0+QLFbEURVzSxEmGAEJtuyopEBuMtt0f1hOebT5VJjur7Trmylm+Ruep8AEZ7ay8QBMD9OT7IFGKMAc+v9+/VUpdze8k7KUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n67bp0HY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26E56C4CEE7;
	Tue, 14 Oct 2025 09:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435330;
	bh=vjyysok8ydO2qUwr+zeJ9NGUJe9esAPiRJzWLppcF+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=n67bp0HYkz/ZzKOUR08VpZ+vgxlCsHafUS6MKjqdV41qiEY7K5095W9WRphR92s/p
	 7wQ9SMLrTGVmcmTFY7HwIMgCzpTirXLTEG25RuIN/aXKHP/N36B5qgaaGO/OXfF+E3
	 16m+zKEEz/euB6efqNFNPVaEBhKeNPHWD3elRSuWnnvyjFjlVW0QmtGlmxJao1MT1R
	 rlfrRFksQVKxV/HdE11HGstC2yX37pxVQjZErTPykE6i8ynFmv1tA6xGH5diyOp4lF
	 1cYvBkKVxlO2jihQtxdKDdv8yQkeMWCorOLmr6zmo+5prq4L2/guBlne7PLumYnEWu
	 RMkRrItjGXVCQ==
Date: Tue, 14 Oct 2025 11:48:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Tristan Lobb <tristan.lobb@it-lobb.de>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: avoid Cooler Master MM712 dongle wakeup
 bug
In-Reply-To: <20250928162543.226114-1-tristan.lobb@it-lobb.de>
Message-ID: <850os3pp-r9s7-n098-3o55-43qq1s5q00s0@xreary.bet>
References: <20250928162543.226114-1-tristan.lobb@it-lobb.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 28 Sep 2025, Tristan Lobb wrote:

> The Cooler Master Mice Dongle includes a vendor defined HID interface
> alongside its mouse interface. Not polling it will cause the mouse to
> stop responding to polls on any interface once woken up again after
> going into power saving mode.
> 
> Add the HID_QUIRK_ALWAYS_POLL quirk alongside the Cooler Master VID and
> the Dongle's PID.
> 
> Signed-off-by: Tristan Lobb <tristan.lobb@it-lobb.de>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


