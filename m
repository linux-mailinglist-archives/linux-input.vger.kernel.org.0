Return-Path: <linux-input+bounces-9852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE08A2C67A
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 16:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72FCF188C614
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 15:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C28231A9B23;
	Fri,  7 Feb 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPNNxL3A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A122238D2A;
	Fri,  7 Feb 2025 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940645; cv=none; b=h/BAe5WKIUcvsS5UKdLLMnUOGipWnnOQrJXJeuwQBWdRrcm4UeqQLPO+syylfyY45SwKLNsbq/6Cgj2AJ4QaYiO6NAvPNRiglSVwZvIdYg2HqpAjhS1Ak1kmAM30ppaBotzIx2ndfYPjOCCJmAjLJG1jAktgSoX/O9KfqPrsC1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940645; c=relaxed/simple;
	bh=Jk0/VkszBVxw6eqnKdiHbNffXaTjiybG0EKgCetdWoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e70ALZTLkAePmLgq2a6VIRNVft/BfKWhq/y0vweesBm9jUWUnNUHfdigxczglSUcP8hV/DHS3poeJmcva6h4mxrbbGEmpV1fXK+zCBQitw8udSH0g2oQ5y8dSISmBJk80tNRU3txbZ5RfAKaJ+xu8DJ0CGCVwAAZO5qgpmkLKbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPNNxL3A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00AFC4CED1;
	Fri,  7 Feb 2025 15:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738940645;
	bh=Jk0/VkszBVxw6eqnKdiHbNffXaTjiybG0EKgCetdWoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=iPNNxL3ACwmsh7RSnDEm+jTDtTTtSGAm1y1/YZDuaIXvapF8t9UpP4dGgRE0B+zbq
	 yM+551tGgPEGqZTFrgJ2t1Ny8h5jrcnn+/XIOZxn3DbvEHqMNDxfrQFzQ75/OB07xc
	 kfXafoCneFhb2Lf5V0QZdYD2myK+ou4HseyZ/9XAY7f76ROYpPNVlDbf1Vj8LS4Dh1
	 5DsNeCBxW4OWrUkC3r7EW0cfI5paHA6Yvm8+tyJSrkyssIHmkrIz24MssW/PMxPt0E
	 VYWsX8ypTzxr8wQLBfACkii6niRk+iHAhRO3xEeMDULMa94sa2xTsR2SItxDxzm4X3
	 A093lTOWkeWpA==
Date: Fri, 7 Feb 2025 16:04:02 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Tatsuya S <tatsuya.s2862@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] HID: Add reserved item tag for main items
In-Reply-To: <20250106074911.69770-2-tatsuya.s2862@gmail.com>
Message-ID: <0380nnrq-3qqp-q646-s112-4q0qo39n5s3q@xreary.bet>
References: <20250106074911.69770-2-tatsuya.s2862@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 Jan 2025, Tatsuya S wrote:

> For main items, separate warning of reserved item tag from
> warning of unknown item tag.
> This comes from 6.2.2.4 Main Items of Device Class Definition
> for HID 1.11 specification.

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


