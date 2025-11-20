Return-Path: <linux-input+bounces-16267-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 859B0C766B9
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 22:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 5297A2B86B
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 21:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D6433DEEB;
	Thu, 20 Nov 2025 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/rzJUNR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F842337102
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675292; cv=none; b=IaAgDnHN4zfKGo76O2pSc3/tlAiOwujhz1Il6a3B8gmJyDqzXKbgnt7gw3UQCyrESvDJhXA+nn/ffRJimHlOgBUEsgLOA6vs2AkK6qsp1zpsCV1vEgxxhEZGC7US/Lp59xDVuEd5MULRSCQIKapIa5jQiF6+jO4ZLIAzkzDUzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675292; c=relaxed/simple;
	bh=pcnk2I5klp+XgR/40eC9Uzbj3iOC1kKNIOnqTW++PRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cn4nFUuN7qU6jsyFFF8vboHzDky1Zh0Ol5DP34guSRmUkYDl7aSj19PDEs4WmpdSdJGCO9hsNCGbx+nUfGQYsbXeb3Se+Cy0VOJ+bmP6Y5QLHIA58gyB3xTdcwZ+hK/BvvEzbj9x52e381tAUWLO1OvmdQOpva7KIm+OJXDRq1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/rzJUNR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1A15C4CEF1;
	Thu, 20 Nov 2025 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763675292;
	bh=pcnk2I5klp+XgR/40eC9Uzbj3iOC1kKNIOnqTW++PRg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s/rzJUNRMXiBk7ZtFKpc1xYws+0PoNVN2yBAZCwkH69D2A09wQxs0/OZim00JiqGw
	 Ktc2kR/efiFbPGEiAY9uQYNdn2YA95SSpKL21WecoyjKOaKV3k3bC2UrRYm0+HWwtI
	 W4RCuvp6Pm5IrimLLKc+ZdOYlk+7rBFmzpOR+XsJrwNxHEEHJX3Y6cdPnsL7VfgPUM
	 BsXRazeRJuVARlyqK4YKkSOEscEbbdby6FXLdGGGi9SSXbQwL0NGntj+Et8scADDIX
	 5KkIL0eWbOqmVIS6PHVTLJIIcX0I4rohkZnIo5Dc/b58lT61P6WYAdJMetL1CCKIgF
	 w/N4mDsjjrkiA==
Date: Thu, 20 Nov 2025 22:48:09 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Ping Cheng <pinglinux@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    benjamin.tissoires@redhat.com, Dmitry.Torokhov@gmail.com, 
    stable@kernel.org, Ping Cheng <ping.cheng@wacom.com>
Subject: Re: [PATCH 1/2 v2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
In-Reply-To: <CAF8JNh+H=Duf-DnbU5tonMLx2yeSrOQUSMFs8VA9SrzN13Bu_Q@mail.gmail.com>
Message-ID: <n6303648-n37s-o8rr-nrpo-25398r938ppo@xreary.bet>
References: <20251027203742.23740-1-ping.cheng@wacom.com> <CAF8JNh+H=Duf-DnbU5tonMLx2yeSrOQUSMFs8VA9SrzN13Bu_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Nov 2025, Ping Cheng wrote:

> Hi Benjamin and Jiri,
> 
> Can one of you review and merge the patchset?
> 
> This patch was from me. The second patch for selftest followed
> Benjamin's suggestion

Sorry for the delay. This is now queued in hid.git#for-6.19/core.

Thanks,

-- 
Jiri Kosina
SUSE Labs


