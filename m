Return-Path: <linux-input+bounces-14613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC06B53738
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 17:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76925188803F
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 15:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50B4352FFC;
	Thu, 11 Sep 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4xvhmHO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB71F350835;
	Thu, 11 Sep 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757603644; cv=none; b=gnFOwdzvHoAPNbC/o3IoVezjKg0+Zeuc77g35o4dkG0EkflsC+7oNwcz9GTUp4Ri+lbu4YBeqopUgxyQtMp1uxlrZbnRMcTWobUOkR6dusHFc3E+Pqo7rJ9uBf+z/HXgs91/9ssUBIJ/0eCN5qeLKxuPUHJm5CexyRg35nAVhgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757603644; c=relaxed/simple;
	bh=XBnEBB90OcOXKmWP2giYQ6rYXI4N+81XE3LHFRw6NVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUr/ag2GmcmeIQtMx0wchKILpj9JJcCktHn/Y0sbvVIQmcfBUjWpN9C/m3m5fbgjQ4XSuZ8keO8xlmgE6sS4Y6+3VvaqKzbqpshLkKQnkChx1ksSkQcfwgp5stJ2Kz1JRMFhJEv3c325nj6fOi6xREnGo027uaKKTAz4Doif0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4xvhmHO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11BDCC4CEF0;
	Thu, 11 Sep 2025 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757603644;
	bh=XBnEBB90OcOXKmWP2giYQ6rYXI4N+81XE3LHFRw6NVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J4xvhmHOFYX2agkANpI9Y+NhgTgkzS3WODQQMpflnaGZZqA2mJR1ALkkuPq9CVBh8
	 9rzo6WtNPP1ZsjIsl9HBOE6vxDz4/PsTHfzTBiuXSJZSb57vsPKz0nTJJ2z7U+iHR/
	 FZbbyYGQuVzTyGItMAUQzoSIm9vqQQKy4leV6xRWJUTzPaxLEM0Wwf0LJoD3jmNRXK
	 mOc4W/5kBn/a4ucPDYYvkiHwoMgzKVVzg/IXhO9TaSMPgO+XiZYfTvT3hxVNvUeths
	 vq23ggWWCqC7VE1J4w1Eukfd6qwEQDAn99rirX2TsZT+qoesYNrihvhMMuodcScJ89
	 43hmD2VBv5szg==
Date: Thu, 11 Sep 2025 16:14:00 +0100
From: Lee Jones <lee@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: [GIT PULL v2] Immutable branch between MFD and Input due for the
 v6.18 merge window
Message-ID: <20250911151400.GR9224@google.com>
References: <20250826134631.1499936-1-mwalle@kernel.org>
 <20250903113255.GK2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903113255.GK2163762@google.com>

Here is an updated PR containing a recent fix:

a377b1be3a0e ("mfd: tps6594: Explicitly include bitfield.h")

LINK: https://lore.kernel.org/all/DCKNRRN0Q2I7.WFT5U4QKA9XS@kernel.org/

-----

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git tags/ib-mfd-input-v6.18-1

for you to fetch changes up to a377b1be3a0ed51ccabfe22908ebde065848313c:

  mfd: tps6594: Explicitly include bitfield.h (2025-09-11 16:06:02 +0100)

----------------------------------------------------------------
[UPDATED] Immutable branch between MFD and Input due for the v6.18 merge window

----------------------------------------------------------------
Job Sava (1):
      input: tps6594-pwrbutton: Add power button functionality

Michael Walle (2):
      mfd: tps6594: Add power button functionality
      mfd: tps6594: Add board power-off support

Nathan Chancellor (1):
      mfd: tps6594: Explicitly include bitfield.h

 drivers/input/misc/Kconfig             |  10 +++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++++++++++
 drivers/mfd/tps6594-core.c             |  59 ++++++++++++++-
 4 files changed, 194 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/misc/tps6594-pwrbutton.c

-- 
Lee Jones [李琼斯]

