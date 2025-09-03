Return-Path: <linux-input+bounces-14450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AEDB41D1F
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B501896769
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 11:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB678274FDB;
	Wed,  3 Sep 2025 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDP6wBcY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B355A1DB375;
	Wed,  3 Sep 2025 11:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756899179; cv=none; b=AEs4/CyFAqVgyhIzSoPC31yokijO3DzKu/krVHimMQ6/XAxpW+I11xz4F6ilxrnpXvukIQ8Yev45dma7A/X8HV8ov+RZGMg2KXhAzQDDCu9+/HW9gzSy0y/ZqZHNEZ2tk5Zt/IT/yUl3ie1pKLBxIMrzpcnKbYvxUhmny4gyI98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756899179; c=relaxed/simple;
	bh=M+n1rlZHWVlqVGqtZs2dzXoQrUwi12kueTekO8Z78v0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+wWzcQrL9j8iixk/flr4HZS4jE2jmu+5+z5F/fFyIgw4abzzrjZGA1YbsBGvjVrrWI65dfGwRX5JGzp8XRUU2HCg/gawZACZU/Qu56kC2Xq8IYulBAr7TkxC6y0O/pzjZmh0OUrkty1nAuHY7LcdGSMTvEoVf1LRARH+QKaYNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDP6wBcY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A87C4CEF0;
	Wed,  3 Sep 2025 11:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756899179;
	bh=M+n1rlZHWVlqVGqtZs2dzXoQrUwi12kueTekO8Z78v0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WDP6wBcYHv5xvJv5q8aN5hvn+vpotsZc7zESTLHETdSJQ4p+QAoRAG/ET6Ou2X2E8
	 +N+mJ/cr9t2L2v9sRKfGmFhxX8cDHwHxTl7NOhnZR5Aqz2ieNc19RcIE40SgEHGb1T
	 bmNo5043ak6lx3TQ1wX6bOfP6sLfF6+owlMI3cd3xgc8QqTgAxp3BlWOGRkZHAb8Yj
	 KlEtmNInHV2e0gzCNzxOaL78b1spDpUUTm7p26kQmuJZ2/O85fJXvgF6kgGLMaxIvs
	 lI1uXfJpCRaNoDMATTBI0+MmfqhMsamEw2IELeRBp9Utm7i00OlgK2Ozdt3H6A91Wc
	 F/VKJhQMURjug==
Date: Wed, 3 Sep 2025 12:32:55 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD and Input due for the v6.18
 merge window
Message-ID: <20250903113255.GK2163762@google.com>
References: <20250826134631.1499936-1-mwalle@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250826134631.1499936-1-mwalle@kernel.org>

Enjoy!

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-input-v6.18

for you to fetch changes up to 2215a87b02ad8d353cd3edebd1bed01db2458986:

  mfd: tps6594: Add board power-off support (2025-09-03 11:28:36 +0100)

----------------------------------------------------------------
Immutable branch between MFD and Input due for the v6.18 merge window

----------------------------------------------------------------
Job Sava (1):
      input: tps6594-pwrbutton: Add power button functionality

Michael Walle (2):
      mfd: tps6594: Add power button functionality
      mfd: tps6594: Add board power-off support

 drivers/input/misc/Kconfig             |  10 +++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++++++++++
 drivers/mfd/tps6594-core.c             |  58 ++++++++++++++-
 4 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/misc/tps6594-pwrbutton.c

-- 
Lee Jones [李琼斯]

