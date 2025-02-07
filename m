Return-Path: <linux-input+bounces-9841-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD99A2C38B
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DB4B3AA75D
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8151E7C37;
	Fri,  7 Feb 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AdO9q6Nw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795814EB51
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 13:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934955; cv=none; b=UNq70mw4nE8vr10+r7B9XmtdtdCJUkH11wJeCTvjhZQ/zwX1ZrOqCT/FuvSBlIxQI77PPZ96ypYp9H1rE+yqVrZsWRfx3SKURENShStd/41RHnsp52HBSCaC6fi9HEAVymovhCPvoOChU+fO4iXBD+bARtxme1/cqkgZo9yz+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934955; c=relaxed/simple;
	bh=rTsG+v1PuBdLRTseE8fZO6vHetryz8y1wUxHaKjWgMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n8Os19Me6tjZOZ9CrFMmUaK3GwCOnHA8cGIXITuiTWscGrvDEygQ/Gp4W02lXCNUIr9Z4wwcbPlbciOsNLKIVfCAP/EoGOMMzT7dLJ/ySgdwEnWR8Prto1gKBJXP/LaRIx6FPyjHxeo1aUcRUwT6C1H6RC7BDOroDUrYWjT7VPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AdO9q6Nw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB6DC4CED6;
	Fri,  7 Feb 2025 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934955;
	bh=rTsG+v1PuBdLRTseE8fZO6vHetryz8y1wUxHaKjWgMU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AdO9q6NwOfuNZ7PtcyUTHrLBFjbe0gtGUe0ZYu2k5pjSTGJmPx9QZTJAKjPTVzM+X
	 URCmiyTWNA1Tuz40qzxGLtH8+PkcbdIwDQ4J+Kqr5UUvEWexoOY/B2l2xM4Vw23JRy
	 Yjn/gbRfrP3zium5akiMRtsQQbChPT9KTbmN6x7WmqZJIpTEFtbGs33WHyIQPs3rMl
	 vHTchJy4efacgfKSXfVcFLSQZYNX48OZrkpbyUh7SH5O4hyoMWAf1niDpwZm4r6ZAA
	 NMf0Tzq6JcXVXtePzNwEVjSZGBVIg9s3dNSOkef5OrfNQh2DjVp+fvIGSC2md15ui/
	 UydsJbKQrg0mw==
Date: Fri, 7 Feb 2025 14:29:12 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 2/3] hid-steam: Mutex cleanup
In-Reply-To: <20250205035529.1022143-2-vi@endrift.com>
Message-ID: <n3r16r31-5n7r-pq2p-rpss-7p8r10q2qpno@xreary.bet>
References: <20250205035529.1022143-1-vi@endrift.com> <20250205035529.1022143-2-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Vicki Pfau wrote:

> Both branches of this if/else start with mutex_lock and end with mutex_unlock.
> This hoists the mutex lock/unlock outside of the if statement for simplicity.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied to hid.git#for-6.15/steam.

-- 
Jiri Kosina
SUSE Labs


