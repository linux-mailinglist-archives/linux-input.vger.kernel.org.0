Return-Path: <linux-input+bounces-4473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 766EA90F0EC
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 16:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B911C242C2
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 14:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AD6200C1;
	Wed, 19 Jun 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MlAeFpfy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311CA1F95E;
	Wed, 19 Jun 2024 14:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718807989; cv=none; b=Lo72QWVONpFjSW1irkTIjRzv/m4Xg3fcYOJ0rKxU27V5pIWsU83Ntw0WncRa1ExljDmbxj4O5JuQ0dnpt4nl+qojJjX3pT772klDLSGadLfjzJCXg4GrONW/sNn+Ot2ecQ5oe/s+OMGQpPOzv0o3uwRMS+G7wF4YBs/ndm6UBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718807989; c=relaxed/simple;
	bh=ciV3kxMDAtsr62XK28YxSZTLAcoEm/u46Hqbeirjwks=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=d777rQgP9JGzPmK+ysOi3bESPXcwqtdtwnswlToWaNLeHnI7lR5BdWv/nCZhnAJT+ia8smK41OLxJ6+yJYJyelhddIb60p3iu4zLyrTlac2QkHMJvOfvOzmuoV5T6ADCBW7tdOIuLlFT3ucxZgdfQMcO20q/Tp5S2TnaUbD44fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MlAeFpfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C543C2BBFC;
	Wed, 19 Jun 2024 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718807988;
	bh=ciV3kxMDAtsr62XK28YxSZTLAcoEm/u46Hqbeirjwks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MlAeFpfy5FM2wrb8DNGCMbwXxAP75N17hlXfmAYva2EoyyJZd2hTxkCUX/a7YMoZj
	 +6MbYAU4WDtWfkRkfDQDAM/xDHodLWHtbbEtioPQR6PcRb7DXb1I6/mg4cKK1NAeW7
	 OsKWbQfCTxuNU1JmXjUnNrOPV+uyxAP58hDPvD/Wpx9gJpYhkwPWF8L7XUnSSClT7a
	 x4cEWrpRPKU4UTg0wi9tNESFn3t0dpE1mmtq/0JkRaIXxPm3yuWOApyUtpNrpfe0+W
	 +FMoB948Ea2NCHrMRmqDvdp5Qy6B255YFqYzPwDBDJdnsYEr42570vebuBCixM6naM
	 E3531yjdnuZXw==
Date: Wed, 19 Jun 2024 16:39:45 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Luke Jones <luke@ljones.dev>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] hid-asus: use hid for brightness control on
 keyboard
In-Reply-To: <9e4ee526-2b94-45f3-9fe9-0f1d0918916b@app.fastmail.com>
Message-ID: <nycvar.YFH.7.76.2406191639360.24940@cbobk.fhfr.pm>
References: <20240607040532.1074379-1-luke@ljones.dev> <20240607040532.1074379-2-luke@ljones.dev> <dd0a211a-bef1-4eb2-8d1f-2d63799af94c@app.fastmail.com> <9e4ee526-2b94-45f3-9fe9-0f1d0918916b@app.fastmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Jun 2024, Luke Jones wrote:

> > I thought this was finalised but I'm still getting conflicting 
> > reports. Please don't merge until I confirm the fix.
> 
> This is ready for merge now. I have more confirmation that the single 
> patch with no adjustment to report_id works well.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


