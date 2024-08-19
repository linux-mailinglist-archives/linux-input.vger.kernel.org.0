Return-Path: <linux-input+bounces-5682-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 494619572B5
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:09:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E77D21F237E6
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:09:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197DD188CBE;
	Mon, 19 Aug 2024 18:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WAaajCBq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65B01CAAF;
	Mon, 19 Aug 2024 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090940; cv=none; b=WiLnHrigaoGxaZSn5JUjzkoje9VPaQy5fooy+SABy53Y9/BJt6FTqPegaK5nOzYxm99Dapd96DlpkmVcCcVG32TsB6ugRzuqsJXLNVBQx3QY66JnSK8poj2xTvZOkkn2/S5sbO0vBTiL5h2dlRvk1blTeXqgief8bUAoLB15JBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090940; c=relaxed/simple;
	bh=fTB4A0asWDpmLFxNSq8fxQC2XXG1822+zTrzwrnUP84=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XwRRNvihXcRKQ7B314GkrDVfYqY98jm+UhFqhEHPUd1ntj8RZCBQwCd2Lgph8u9fUgUjqBGnulz+/zoRrPw37MMtSnhTu+WF9ouMC8oLLG5wN3EYy0dkLC5Nw2vLi/rCMK5u3LZ66ohZQRv62O5+S/62nNQXX/ZkFBq3EbXt7Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WAaajCBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA85C4AF0E;
	Mon, 19 Aug 2024 18:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090939;
	bh=fTB4A0asWDpmLFxNSq8fxQC2XXG1822+zTrzwrnUP84=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WAaajCBq3Fmg9yYfX1POQqZZ8kCWwLzAsjTdXoPIdqgq6U3PTS4aMmROqSGRIw3RZ
	 1u1jdWDG+9qBYFLFKo6DbxR+KWcq2CHMpIkZ9qvg6T2bd991Jz0fOFoIw+Y/4/vCPC
	 YoOMq6zl0dcEz8OOsmR7HyN7tITLSiSHu8Dazvlnz/5X/uOsFpAdd/I3tZNLA2QI6f
	 xNPNSFObyMLLarN6ndlGtGWESJ2I7pZth23XJwwx81ebxsdWa7pNp+M3WiSf8a6Aa3
	 TDDng79CgjmJQsmfvWIh1Qd14oHLaN/F9qbcMUAZ5MkNjfY7jWLltr6y1o+8JWPI1C
	 vLmEEVAhr3Dwg==
Date: Mon, 19 Aug 2024 20:08:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Yue Haibing <yuehaibing@huawei.com>
cc: basavaraj.natikar@amd.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend -next] HID: amd_sfh: Remove unused declarations
In-Reply-To: <20240731103545.2014741-1-yuehaibing@huawei.com>
Message-ID: <nycvar.YFH.7.76.2408192008480.12664@cbobk.fhfr.pm>
References: <20240731103545.2014741-1-yuehaibing@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Yue Haibing wrote:

> Commit 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor
> Fusion Hub (SFH)") declared but never implemented them.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


