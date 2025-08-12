Return-Path: <linux-input+bounces-13941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F51B22767
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 455907B474A
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:50:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E648A274FE8;
	Tue, 12 Aug 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EwSlSUY+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CC1270EC3;
	Tue, 12 Aug 2025 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003061; cv=none; b=cMMltGqe3FO6djH2HC6VNOtF/TBwDhjSUNKM2yPWYkxWQ2FQCmpL5hdzg7pkcwZe9k7zQeEy4+upUExrj8WEVebV/aPgNmxHHedjdlRKh79sicSj4/VZ5QAL4xB4JnN08Ko9oEsT72Nbx6rte92JvUDsGy1QRgZMPR6Ht6C1JYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003061; c=relaxed/simple;
	bh=bGa4OhtvIkQKjrXoiq2MeF8HA4Fzm3J9gCjnyYze4M8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M63zGFZsQffWz6Z30EO7aBkgnR4JL5J/MZmoEwwOLpSI56E057gBIebSCsf46FcOEmyp6yx2VcGIijTg8HXHLXgHfeO8TqF03vmX+rjdsOC6ijkRwlZ/p3Xe3yftI9eCTcIRgsrmgaOb3sECDuK+adljZmscCbs0WrPEawLF/MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EwSlSUY+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2936C4CEF6;
	Tue, 12 Aug 2025 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755003061;
	bh=bGa4OhtvIkQKjrXoiq2MeF8HA4Fzm3J9gCjnyYze4M8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EwSlSUY+dogKwt7HyaFv/UAG6t6udnAa91YsjKqSG4HzURb1Ak0fteGWyKdgj4Oa7
	 Rubv7fj0CrWc+bBUxwl3LQLUznl5PdBvu78hxxoPMURX6QLcDlagbtC+aPygCuvx4l
	 A00RniJaH0p9gd07xAkoKrZy6D7ZGyJMIwse9AEi79mzlQtwZCpdFRo9s2UvN/+CAW
	 1IOk0iK3aZ6M+yuIcutsg2FnFapj1Wjmr1poCY5hZDSwZWTYiK+rCuHu6VYklx9/Vv
	 MX10ggmK/XF4Ax93wGVx2IPEQQhpLjsY6l1rKKFBHqZJk9SDbpXCNqIW6dyiaZ2RQ1
	 UWu2qKL6Qn2zA==
Date: Tue, 12 Aug 2025 14:50:58 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: liu.xuemei1@zte.com.cn
cc: bentiss@kernel.org, even.xu@intel.com, xinpeng.sun@intel.com, 
    srinivas.pandruvada@linux.intel.com, liu.song13@zte.com.cn, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-thc: Use str_true_false()
 helper
In-Reply-To: <20250724103626535JRNAc8OZvk4dXKn-b0CVZ@zte.com.cn>
Message-ID: <311s983o-1r10-n2o0-0o59-068039n0532q@xreary.bet>
References: <20250724103626535JRNAc8OZvk4dXKn-b0CVZ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 24 Jul 2025, liu.xuemei1@zte.com.cn wrote:

> From: Liu Song <liu.song13@zte.com.cn>
> 
> Remove hard-coded strings by using the str_true_false() helper function.
> 
> Signed-off-by: Liu Song <liu.song13@zte.com.cn>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


