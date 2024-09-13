Return-Path: <linux-input+bounces-6495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE5978168
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 15:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE4BA282AE2
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 13:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A50501DB945;
	Fri, 13 Sep 2024 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgMcs7gE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E70A1C2DAA;
	Fri, 13 Sep 2024 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726235064; cv=none; b=tygatnt702HOMX6rNTLqgmsipkfil2Jq6Paw9yaiwyuBUt5aRF2s4ewE7PFMx3LYWUnqPUaTro0QjHC2wCEKuoTKH2ogS6L8OkUbtg9laurgGM/Y5lubDTTdxgSjoozD2e/IXhbLbVlQFHucgtnbJtg/Retj8xIPX3U7T1VoIyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726235064; c=relaxed/simple;
	bh=bIoXbLfwlGc0AcnLoearxQIaugkPFsXY6E5AZhdBT10=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OdlZs+1hDEVUpbx9UoJqIqUhic8z/UzpJXvruM/dLfyB66Avd6LLc4cd9zTTE51nqwgWTCY/ZdLEniu+QHuQ8muHHrpVDJwNiaHF1CzC/Rkx5Tb0RrEAKCW2JJwl6Q7v+RX/Bjd1CCb+31NCzh5R3faW1pBhrGilU8EF9MWM8jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgMcs7gE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5089EC4CEC5;
	Fri, 13 Sep 2024 13:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726235064;
	bh=bIoXbLfwlGc0AcnLoearxQIaugkPFsXY6E5AZhdBT10=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PgMcs7gEgwqHE53v3SvoNMALM66xXZOylhjm/Jr+mBkU9ZjltsSMWodvFh8QiOXaX
	 p44xZZwmWFqJzpnhp93b/76AKCOzi6Jgyk/tQvLgKm0WbIsTx4tWRHGHxFXhHfxz++
	 snywpn8pe0gbIa62p1Ln4kChWf/v9jXu4eJgYHoI/nJcZv5/fOIoA8U2GU5ou0oZwE
	 UW+lxwa/2C1hvRNZcmK5ogTJZdvltNSj/WTBvELqEw09wQN74bcOz4yxspnvvSTwb7
	 XuPEpptbY26nHejaGk/anxJMqgUtd4URP/qvXunUXwZlu9nMYkJY3yGIn5CENh6jse
	 i0keg2LETo06A==
From: Benjamin Tissoires <bentiss@kernel.org>
To: jikos@kernel.org, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240913074632.3779321-1-ruanjinjie@huawei.com>
References: <20240913074632.3779321-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] hid: cp2112: Use irq_get_trigger_type() helper
Message-Id: <172623506306.1194883.2350447718826983354.b4-ty@kernel.org>
Date: Fri, 13 Sep 2024 15:44:23 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

On Fri, 13 Sep 2024 15:46:32 +0800, Jinjie Ruan wrote:
> Use irq_get_trigger_type() to replace irq_get_irq_data() and then
> irqd_get_trigger_type(), if the irq data is NULL it will return 0.
> 
> No functional changed.
> 
> 

Applied to hid/hid.git (for-6.12/cp2112), thanks!

[1/1] hid: cp2112: Use irq_get_trigger_type() helper
      https://git.kernel.org/hid/hid/c/e9a081c80cb3

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


