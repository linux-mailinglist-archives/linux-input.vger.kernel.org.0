Return-Path: <linux-input+bounces-12771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E8AD42B4
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:14:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C60CF167736
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F230242900;
	Tue, 10 Jun 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fKZoQ2vX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2F3155322
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749582881; cv=none; b=G4NmKoNHYE48SM9+kbRLdC0nzh2uHw/6t9eRVUmXcSIpfXa5XcuS1VGwf+PARkNW62b7g3QkqWs/xVY+2kzLvP1X6IzkJ3+9kKfIBfhm1FNtqGi/OVUs3ddQ57BvhMFG9cnbdIFQD0VWRCldU8e2nph5Qtd8Sx0HQcAU/6Ejr3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749582881; c=relaxed/simple;
	bh=w+mGfUbAIRjlncgVBwqrO/EVwTWwIgWdOQlJ0Xtgcr8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iuaVREP09+1oGTqLvcMNbB4BINkFi92dqxMFBrKLTfusSfzIlD9bBf/Db22toKhJNCAP1szEhwuW7+jEcfABt3tPrkaFURV8sNfACY5NroMfjyLxjZgo0sxp4v7KS/oTlwAJBH8jJsicao2mMDW1acYh1ZIHVeUzqx2N+V9ZOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fKZoQ2vX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC5CC4CEED;
	Tue, 10 Jun 2025 19:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749582881;
	bh=w+mGfUbAIRjlncgVBwqrO/EVwTWwIgWdOQlJ0Xtgcr8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fKZoQ2vXhqnFOOv2IBnu+knTgavC+1RMxteXCtBeFfUs9UIak2RF8CLkeBVlnbVFF
	 psqKDz1Rwzb1MXHLj36CF26qGtcrbtZZ6Qv99aPWzvtONc2FcTIQwhfFlzi5403XMd
	 GFUEZ14m6dCQcHPtTaIJpyMyjQn0+FLXEU6EoWedsNTCJaFJWRhf7pNpQxAWAHQKQO
	 NLZj3xk7G8QRntAsOeJXD1fyjiMDUx492pfNvqWY9NDs/aC/ubMsJBgHJSteXYYALM
	 Ggs8MaM5CpboOGQBxWTlq5msXYeih0qxXJQHTq1Xjt7FOr0HmAsnVpb4nzRVzxGR0H
	 SSOjX6oC2P7DQ==
Date: Tue, 10 Jun 2025 21:14:38 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc: linux-input@vger.kernel.org, thunderbird2k@gmail.com, blaws05@gmail.com, 
    benjamin.tissoires@redhat.com, Roderick.Colenbrander@sony.com, 
    svv@google.com, s.jegen@gmail.com, carmueller@gmail.com, 
    pgriffais@valvesoftware.com, hadess@hadess.net, pobrn@protonmail.com, 
    lee.jones@linaro.org, junwan.cho@samsung.com, tinozzo123@gmail.com, 
    sandeep.cs@samsung.com
Subject: Re: [PATCH] HID: nintendo: avoid bluetooth suspend/resume stalls
In-Reply-To: <20250513074705.13637-1-djogorchock@gmail.com>
Message-ID: <34o356pq-2s63-0838-1239-9p035nnqrq04@xreary.bet>
References: <20250513074705.13637-1-djogorchock@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 May 2025, Daniel J. Ogorchock wrote:

> Ensure we don't stall or panic the kernel when using bluetooth-connected
> controllers. This was reported as an issue on android devices using
> kernel 6.6 due to the resume hook which had been added for usb joycons.
> 
> First, set a new state value to JOYCON_CTLR_STATE_SUSPENDED in a
> newly-added nintendo_hid_suspend. This makes sure we will not stall out
> the kernel waiting for input reports during led classdev suspend. The
> stalls could happen if connectivity is unreliable or lost to the
> controller prior to suspend.
> 
> Second, since we lose connectivity during suspend, do not try
> joycon_init() for bluetooth controllers in the nintendo_hid_resume path.
> 
> Tested via multiple suspend/resume flows when using the controller both
> in USB and bluetooth modes.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


