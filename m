Return-Path: <linux-input+bounces-15696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FBAC0605E
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 13:39:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF8E3B51CC
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1043168E2;
	Fri, 24 Oct 2025 11:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AfCh23CR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020A312814;
	Fri, 24 Oct 2025 11:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761304866; cv=none; b=h9hMu4Icqd2gvQY6MNagQIoRZfLSq0s/CRh2m1Yc7o3ohCRJ93FIqVFi2P6NcrmYNaoc50Czan8Hh5ftAx5k2P8VqlnIWpMtrx31aZ4yD3ZzxTJbLkevfXymwjz2GtCgIaj8o1x+EC/ID32wfHg6CxZM6FX6Au7mdDFcDxdrb24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761304866; c=relaxed/simple;
	bh=jxqwbHmEQa30I7+3adFHBCExVPQkkMFdOMmbhRZ9zm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EvRQCAt5J8Me3XznMpmWIerBwKcydzWFhZpkPoAlPdI9+jrZKglhWpkW4nF8TYTxmxxotX6DwjWOGby1i0AjU2+b1XK56WfGGyXPEhn8wFIgDFLpI0r9YzisFi1tOMB0CMC6H9VOJfVYVc0sBbxdVhRJ2SzeU6VgHX4yRfEy9JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AfCh23CR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609DDC4CEF1;
	Fri, 24 Oct 2025 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761304865;
	bh=jxqwbHmEQa30I7+3adFHBCExVPQkkMFdOMmbhRZ9zm4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AfCh23CRwy0sPsVo89K/Y/aiRzB+J2yboNx9LsTrvnlckUHUtIDHiuDCUo3uTjPK1
	 nMDPlkfuF4aKE8CxC17XN3MoTvAnACIul2/jA7/CPJsRUB4S7PY7zO0diRIYqt5fvL
	 4wLde8lcDZYwhXWISd81nFtCaT1SlgB7q7W+ACVGxKo/vp/jG/gtPG64RhDbUbbBXp
	 FZYDCaLrP0h+8MW3vhkb2mOzKy8k5xh5g5wloIrkutu9adHt1qg6LJF0T7hbKed9qT
	 8b76aC9X48Ftm5tntML8Cbt/ClLWy8qfF/xXpbF46AvUbCzZonrgmhkIr0u3QJek39
	 kz9Y3BLRZwlFg==
Date: Fri, 24 Oct 2025 13:21:02 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, Zhang Lixu <lixu.zhang@intel.com>, 
    Kees Cook <kees@kernel.org>, linux-input@vger.kernel.org, 
    llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] HID: intel-ish-hid: Fix -Wcast-function-type-strict in
 devm_ishtp_alloc_workqueue()
In-Reply-To: <20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
Message-ID: <8p739q12-5so8-6s98-8o1o-44046s9q7011@xreary.bet>
References: <20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Oct 2025, Nathan Chancellor wrote:

> Clang warns (or errors with CONFIG_WERROR=y / W=e):
> 
>   drivers/hid/intel-ish-hid/ipc/ipc.c:935:36: error: cast from 'void (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>     935 |         if (devm_add_action_or_reset(dev, (void (*)(void *))destroy_workqueue,
>         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   include/linux/device/devres.h:168:34: note: expanded from macro 'devm_add_action_or_reset'
>     168 |         __devm_add_action_or_ireset(dev, action, data, #action)
>         |                                         ^~~~~~
> 
> This warning is pointing out a kernel control flow integrity (kCFI /
> CONFIG_CFI=y) violation will occur due to this function cast when the
> destroy_workqueue() is indirectly called via devm_action_release()
> because the prototype of destroy_workqueue() does not match the
> prototype of (*action)().
> 
> Use a local function with the correct prototype to wrap
> destroy_workqueue() to resolve the warning and CFI violation.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2139
> Fixes: 0d30dae38fe0 ("HID: intel-ish-hid: Use dedicated unbound workqueues to prevent resume blocking")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

I have also added

	Reported-by: kernel test robot <lkp@intel.com>
	Closes: https://lore.kernel.org/oe-kbuild-all/202510190103.qTZvfdjj-lkp@intel.com/

and applied, thanks!

-- 
Jiri Kosina
SUSE Labs


