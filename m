Return-Path: <linux-input+bounces-9741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4FA26647
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 23:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D0181886A01
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150EC21146C;
	Mon,  3 Feb 2025 22:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzgsAT5C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE86921129D;
	Mon,  3 Feb 2025 22:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738620008; cv=none; b=uzq8KL6caHTTe6JTb3KISq+cyW9b5BhjoauuE8aCtAxIDt6WgMuUEmuTTjvMfM6YUEaK/GIuoIAR0f8r2I5hPz2PhkCBjyJj4rczbOCUJr+ENSb2g2x4V6dh444gNRbH7LbZZnc5Bkun5HMHrWCHEVhgyNaqk2pENSL77Ifk9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738620008; c=relaxed/simple;
	bh=zTpbD3p4Exi+pVjfbAPzlpxt15x0aHmzV3xzArB9Gek=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oZcwCdkwxh2zkKIonFj+2Sa5EANe+T+CdJC68Wla418EEUSjBrQQXsmpeJcHeul+2sREz53V5fBXZfmP08q7pwKZ2kBKIrdti4JZMMt4MUEVfBD/+0uIZaKudW2MRoKEhvQXlCs6agoGsxt+F/jCyAZgUm2nqvfgOM1+zf4us38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzgsAT5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFCDFC4CED2;
	Mon,  3 Feb 2025 22:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738620007;
	bh=zTpbD3p4Exi+pVjfbAPzlpxt15x0aHmzV3xzArB9Gek=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gzgsAT5Cb2gc99fo91wbkV1kJgG7ZBs4s2ucSWNCcuGUAUukYrT7ftO5ODMrpHVVA
	 5SV0+kmZ/gPz4LdcgBoXE2L7HX6A2y25BRffiEO/MusTz7b2TFue4PmOOMLK4si4DA
	 Yo1/j8ZekC80lM6BJHL3QSvRDRgl6zCk/R9hIP4tbfoVVPuWfmJpwLeQaFkYb2lU9y
	 4xBLccqZQ+0aRMWEblUSynt68FP3G5l+daDQexaM6WPuwtBq6x60le6BOEg3qHbBev
	 xtII9X3TjYPiLMHXQhZRCnDtnc9uLeR9+mTqYtOseyTVAT2kCEAXvaQxN0ozE+Xem3
	 Avi3NJtpaX5DA==
Date: Mon, 3 Feb 2025 23:00:04 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Daniel Brackenbury <daniel.brackenbury@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hid: topre: Fix n-key rollover on Realforce R3S TKL
 boards
In-Reply-To: <20250129010849.722271-1-daniel.brackenbury@gmail.com>
Message-ID: <43o3oo85-sq99-013o-9955-8r4p3q64350s@xreary.bet>
References: <20250129010849.722271-1-daniel.brackenbury@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Jan 2025, Daniel Brackenbury wrote:

> Newer model R3* Topre Realforce keyboards share an issue with their older
> R2 cousins where a report descriptor fixup is needed in order for n-key
> rollover to work correctly, otherwise only 6-key rollover is available.
> This patch adds some new hardware IDs for the R3S 87-key keyboard and
> makes amendments to the existing hid-topre driver in order to change the
> correct byte in the new model.
> 
> Signed-off-by: Daniel Brackenbury <daniel.brackenbury@gmail.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


