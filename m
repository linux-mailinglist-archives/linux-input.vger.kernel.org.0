Return-Path: <linux-input+bounces-152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D11157F2782
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 09:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04C8E1C218C4
	for <lists+linux-input@lfdr.de>; Tue, 21 Nov 2023 08:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAE23B785;
	Tue, 21 Nov 2023 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uc2JScwO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E63B78D
	for <linux-input@vger.kernel.org>; Tue, 21 Nov 2023 08:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC31AC433C9;
	Tue, 21 Nov 2023 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700555535;
	bh=qyOqw1vmpf9f3BB2JiFLuh6XeTrJmOiGfETBWHfF9bM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uc2JScwOoas3p4YQlTcq1HZNtLPQ3XBZ/jIZD/j4lHwBYd2YYAqucpkgzUt8mJldS
	 iJeHRYavrO240i+wOIF2UAyJkjBlMb1i/LbvF1kCd9nq5DtkQTi2841jby8k/eepre
	 Glp4Bv0lkwsh3Gw38CFLN3Hbtr+5GPIgkUsxIWhsrqNMnAvswiXD7NmTrKzH6I74qA
	 px4IUQZvo/T2W96Smplqs1BfoEtOHZ0E0+YfFPjxgdE39Ygoy/Y5mSPt1wfgqrs8HR
	 jg+nSFTeaEuJPsHxZyddTH9hXR2pPLV+jrkdPExtbeDo9QM00PBz3C5WXgYUQVIWWF
	 cE5DnGnLfb/aQ==
Date: Tue, 21 Nov 2023 09:32:12 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Yihong Cao <caoyihong4@outlook.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "open list:HID CORE LAYER" <linux-input@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: apple: add Jamesdonkey and A3R to non-apple keyboards
 list
In-Reply-To: <SYYP282MB2110B4E87983EAFEDC8741E49BA2A@SYYP282MB2110.AUSP282.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2311210932060.29220@cbobk.fhfr.pm>
References: <SYYP282MB2110B4E87983EAFEDC8741E49BA2A@SYYP282MB2110.AUSP282.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Yihong Cao wrote:

> Jamesdonkey A3R keyboard is identified as "Jamesdonkey A3R" in wired
> mode, "A3R-U" in wireless mode and "A3R" in bluetooth mode. Adding them
> to non-apple keyboards fixes function key.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


