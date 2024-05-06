Return-Path: <linux-input+bounces-3513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4778BD6C1
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 60E93B21FF8
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C0E715B57B;
	Mon,  6 May 2024 21:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p/akP4EQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5291EBB;
	Mon,  6 May 2024 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715030257; cv=none; b=m6dEsEoW7uCirDS69MwHcT39MEfJRDGQun8xURqPi8QTMDW0GrYyPQ02DaDxytmoMEZtGHNWmDdsctFfgxbrrwN4NUmcWXL0lxnozN6Qzyn8xj/Uggr5TGQYnCFBXmFd+M2diKyHsHr7GXp+r4TRs086xk+z/sFs/xzO3AtJFa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715030257; c=relaxed/simple;
	bh=nlOerx+btwY1Mcb9sXIbyx5LtlxA941Z71rRE+dX5Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CyrXNLzMsEZpsEijGs9XQr9iglbkTKKUhSxa02WIsylyMUyOtB0odAaZsbkn7FiaJkJoZ49o0PzPxnBeeljjuUYZeKpqNOdEEQ+qIJck/d6gMLUBUMm18Ps+CVp8+X3s8GrtAcIZWkgAcKMNqlTklCBQIGAw+wXVC3MoKVWO8Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/akP4EQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624BFC116B1;
	Mon,  6 May 2024 21:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715030256;
	bh=nlOerx+btwY1Mcb9sXIbyx5LtlxA941Z71rRE+dX5Gw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=p/akP4EQkKHC7hTUa2UZHHgsx0a1pcNfIwxi7g0Rx09aMzpWJhw+z4dAVXU/L7Yei
	 ASoEzAfAYxU+V6NTtitdy16P0Oy8wlhAEV3NLMcR4U5uer0OBexBYeWDTUmkldpcZF
	 R6YMB/RLFrcqzAGcgWz+RxNjFW2w15ZvOIE1LQ9k7JFCVdKu9DHx2LJHBtYtBDiiwz
	 VFwB3OusQJdFBM2lav4DFXu241a9wl9p7gjNJvifOzVG5sSh6peBJBP1c1Jx50+Ypm
	 DAcyqyuZu8zoXLEwRrruXa5/HqFdMB7bsnwgWmaFUeVUnbqAM6hIB8zn7bucWhKZqD
	 bkIreGQbs2AMQ==
Date: Mon, 6 May 2024 23:17:34 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Thomas Kuehne <thomas.kuehne@gmx.li>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-debug: more informative output for EV_KEY
In-Reply-To: <Zhp5QlMGazcW+RV5@black>
Message-ID: <nycvar.YFH.7.76.2405062317260.16865@cbobk.fhfr.pm>
References: <Zhp5QlMGazcW+RV5@black>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 13 Apr 2024, Thomas Kuehne wrote:

> Currently hid-debug's hid_resolv_event prints questions marks for
> all entries without explicit mapping information. This makes
> debugging unnecessarily complicated as multiple different
> keys may simply result in the same uninformative output.
> 
> Some common event codes are deliberately not defined in
> input-event-codes.h. For example the 16th gamepad key.
> 
> Instead, print the hexadecimal codes for all events without symbolic
> names.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


