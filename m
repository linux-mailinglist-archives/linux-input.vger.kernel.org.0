Return-Path: <linux-input+bounces-16926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1BCD0D3B2
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:01:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD4513019BD1
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 327552AEE1;
	Sat, 10 Jan 2026 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZFlBRTx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBBE500969;
	Sat, 10 Jan 2026 09:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035687; cv=none; b=UiIK32C4DqZRzsN0V8Q2G4ceMNmuJ4q+9ExfQEAVX/rWwdgLR6QepBHsTNuyIg/3npF95hNKEe7xQvd3mZ2RYqBtp/yVmEsNRBQ6MPhAb7RbUust+tXkksojcDNF190Mqmh3ozBnTMcNleZ71Ei5huakRljnhsbQ6pbMPxBZNGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035687; c=relaxed/simple;
	bh=t3xqgP0YJtHtc8MGdL/f4ErhNKsMy+sMYsCt+V5zSiY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YoP6ozVNh9tQWWtIhfuWINqdTWjvUnVoyIVVIxNw0ysuBd6DhzSzogRU3SVWhzsE5TP8BCcH0kjup3DOLh+3WNHPZuugE/NmqIQSbxTTxnDJ3CHCg7ytrkgw8+f7UoNq1F3gMP6+wg2w+TSqy5o3epgIbk4UrLSnR2bBSkkxZ+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZFlBRTx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F41C4CEF1;
	Sat, 10 Jan 2026 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035686;
	bh=t3xqgP0YJtHtc8MGdL/f4ErhNKsMy+sMYsCt+V5zSiY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NZFlBRTxcCno13+vT6O8sw9afRFkmmHhcS8Ec4s5nHO2bv2Qm0QCFplu3ES0YqEMP
	 mNOl/hQPd2xNDqrlGk5i0YyhmVk1VV708sDtt3tk9xBSKBxupHEXo+T6AySShHowLu
	 0CICxu8j1qnOABhF4cACJhluD1+nFp7oRH+skn1oK2yQ5oajAAsARvoN7GRP3/JjQU
	 g+U4qwaRcKuJ6kR9hOcJ3uFhKwNaGnWYHjz5EcIRpKtGMkTeRMD6yf+pTwfdWUtdQ6
	 VlwbNavb+Q1rh7QYs9faBrIGVRNihg6hS2iPgwt589ULOpxxW74s5EaFfS4OD/n6Ye
	 f/Dx1NQ4EQfXA==
Date: Sat, 10 Jan 2026 10:01:24 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
cc: roderick.colenbrander@sony.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: playstation: Add missing check for
 input_ff_create_memless
In-Reply-To: <2nn8276r-50nq-5655-o1r2-o610sp1s69q6@xreary.bet>
Message-ID: <r3965n0n-p102-322s-52qs-85n890685rn0@xreary.bet>
References: <20251117082808.1492-1-vulab@iscas.ac.cn> <2nn8276r-50nq-5655-o1r2-o610sp1s69q6@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 10 Jan 2026, Jiri Kosina wrote:

> While reviewing it though, I came across the fact that just one line 
> below, if input_register_device() fails, I believe we're leaking the 
> already allocated struct input_dev.

Actually we're not, it's managed device. Sorry for the noise.

-- 
Jiri Kosina
SUSE Labs


