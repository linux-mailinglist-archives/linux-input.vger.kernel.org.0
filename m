Return-Path: <linux-input+bounces-12773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B98CAD42C0
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C0CD189F5AF
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3785263C8C;
	Tue, 10 Jun 2025 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMb44XtH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98A24728F;
	Tue, 10 Jun 2025 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583112; cv=none; b=Ap/fPH9RwxBpbatgx927Lv9g3vVGlVa1ew73hor2nxYyQtWbdwQAJawJ5x/+Dh9yfvT6vKNTqkYX3asGnfV6sLbeMZFAcXPY71kxDrzhVy2H8oAgJYuAn2EbRgKw1Lq8ik74eLM+7r0RdckdZDfsc5ioER/qfe0LZH6w2bem6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583112; c=relaxed/simple;
	bh=pFh2/gyUwagG3cnfUegqN3alUoMYVVDfl2gJ7vC6Srk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=r2rrflOxRRx0uRDd46HDYlOIBtbCBSN1NKR14plBWyU7SN6AOVZCeShWeEf1939ATluhwO5kgbiAzE50g5UIC1eOGdKOkBWrJDXWRwZzW3bw2ntn0bMBSA7JrA3JlGhff8sWmxRFTKB8WUwxbPoWrjxh2TY2wb4mVZz0A3Lq0ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMb44XtH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC506C4CEED;
	Tue, 10 Jun 2025 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583112;
	bh=pFh2/gyUwagG3cnfUegqN3alUoMYVVDfl2gJ7vC6Srk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tMb44XtHY3PQ/DJzzMRM0Vu5RvAq7VeHGeRK8sx0KhHjUHNKQUGovyKcCAqPvEAT2
	 JTvXCphIbOaQPyn/NW/tEoHjJ+dQqN5OjsC9ErJXSMouRvtog/JPAf336SxO0iVgX4
	 Tfy06Tg4hvBPJHW2p9NPDhRWFNqzCalH4NJNrGiSY1EFYm+epqwYN9x9bN5eIG3iz3
	 LUmJcPzfFE6OqPBknpATBygA+M3KHJHgHEnySXmHPs7/Sig7gHpRfHbfIedwAc7zE8
	 6QxJwrJocHbGA7qTG/hPre2Rmkb/vPytn80s1XpYRf40Ch5duX+Y4q8nRUByxhDkR9
	 SHG7f142hDD1A==
Date: Tue, 10 Jun 2025 21:18:29 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Chong Han <chong.han@intel.com>
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Enhance QuickI2C
 reset flow
In-Reply-To: <20250514062639.132017-1-even.xu@intel.com>
Message-ID: <6r85q4r6-sr91-3rsr-01n4-rn2p51q44nr1@xreary.bet>
References: <20250514062639.132017-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 May 2025, Even Xu wrote:

> During customer board enabling, it was found: some touch devices
> prepared reset response, but either forgot sending interrupt or
> THC missed reset interrupt because of timing issue. THC QuickI2C
> driver depends on interrupt to read reset response, in this case,
> it will cause driver waiting timeout.
> 
> This patch enhances the flow by adding manually reset response
> reading after waiting for reset interrupt timeout.
> 
> Signed-off-by: Even Xu <even.xu@intel.com>
> Tested-by: Chong Han <chong.han@intel.com>
> Fixes: 66b59bfce6d9 ("HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver")

Applied to hid.git#for-6.16/upstream-fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs


