Return-Path: <linux-input+bounces-3508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3598BD6AF
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 701AD1C213E5
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4157715B986;
	Mon,  6 May 2024 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2lCfNL+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1897E15B54C;
	Mon,  6 May 2024 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715029843; cv=none; b=RZlA0tRUBmqUkzjf1rVIaUT3Rphoe0xETAZJPUybOUabDc4FiLg5a8tCVNyLLXlLSpSR+0rQfmfSch5HLnZBdbIeN1poGhy6+ueGVfdHphXC/+Oe9S+6lTGp5PxyWjM46ocFUm1DiD9to2F++LFNTQvcWnrdmrYuRsYbYBwxas0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715029843; c=relaxed/simple;
	bh=bk3lqN2XjY0mTMbPYQRW71134WoqYtSXZeRZhf5u08U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jRPIQwNRyzxpe3FxrBvEmUKE5/6gtjZIYnt3larnh5ITFt24veQUadwMxiInFKR3iD31N5cxnzZzAk6pdPg4M9MhRuHWkBVJtzgtNZRiaPlNIaq9b2GRFx/bh1VLEaQX2qZxJ+qmug/WZgpw9OwCyHtjhv/h74VCdgbKORwvDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2lCfNL+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93FCAC116B1;
	Mon,  6 May 2024 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715029842;
	bh=bk3lqN2XjY0mTMbPYQRW71134WoqYtSXZeRZhf5u08U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a2lCfNL+qYOnjsL4OIbgfYBHto8sV3GOGQLQCH9JFrnQiBzj0KFPZiEcWJrzJGXD5
	 lDCSxiaCTpbu+pGXYANMkSGFND8KkI6wfdUFzt3ng3qe9LHsswuFZogOzIFdvCMHKx
	 RCokHFu3/HG2TPhGBvKkLdc+3AOFCr8NO+LROJKJNZtIeaavBQPr8Fa/20fTDZbIPJ
	 ME9O72DQz1izLPXIkh8zgSTMT4Am65Ruy5TGiFM8WZ+lHnpS9D2beT4n5sj0m1s2F/
	 A0d5JADh0ffyN5Bq9YBDsuC43tBb6tucIlCeS4iwCa5PJo6lRiqdQ0LVyW+Hq+eQNV
	 INWywYdRQnLuA==
Date: Mon, 6 May 2024 23:10:40 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Vicki Pfau <vi@endrift.com>
cc: Max Maisel <mmm-1@posteo.net>, benjamin.tissoires@redhat.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: hid-steam: Add Deck IMU support
In-Reply-To: <80573947-3f6b-4be7-b5cd-999a2113a434@endrift.com>
Message-ID: <nycvar.YFH.7.76.2405062310240.16865@cbobk.fhfr.pm>
References: <20240420123418.4938-1-mmm-1@posteo.net> <80573947-3f6b-4be7-b5cd-999a2113a434@endrift.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Vicki Pfau wrote:

> > The Deck's controller features an accelerometer and gyroscope which
> > send their measurement values by default in the main HID input report.
> > Expose both sensors to userspace through a separate evdev node as it
> > is done by the hid-nintendo and hid-playstation drivers.
> > 
> > Signed-off-by: Max Maisel <mmm-1@posteo.net>

[ .. snip ... ]

> Looks good.
> 
> Reviewed-by: Vicki Pfau <vi@endrift.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


