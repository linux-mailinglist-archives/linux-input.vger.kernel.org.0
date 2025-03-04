Return-Path: <linux-input+bounces-10541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57551A4EED3
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3305516F866
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C0625F99B;
	Tue,  4 Mar 2025 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjg9Li4o"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B3024C093;
	Tue,  4 Mar 2025 20:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741121657; cv=none; b=iu7SYgYOETgpv1HIUQ6kmRH8u1cBaiF7y+ZdMM6hFAGRhdDWC9W4qe8mgaLCaUu3MB5p76PtK+UTdezmAK5nmFp0+L2+523X7W01e329OzRHN/FRPdVOb5dadl3Zp/hwuyu0648r0IHiS+HfLXu/M7+hMJpcuxakvoG6Y8vnZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741121657; c=relaxed/simple;
	bh=UlHhVE7K84x7jrp6xE5BwqkNSROZpXsgHBjbXcUVrQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EyoeCwqNpUEo/2t5+dK84DvSQ3O8qcVG/ClgLY2YoVFKjgX20eErtQxh62DWACxLPzDhUPKXggdgfvQdRNd2vb4cNDv7cKhNohkdLsAQAtDP020sQF2XVUt0ZqcSb3vM5LEFikl/SE8J2aN8CTlGuCzhZZH4Pe6Lr/fP4T8FU/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjg9Li4o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AF1BC4CEE5;
	Tue,  4 Mar 2025 20:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741121655;
	bh=UlHhVE7K84x7jrp6xE5BwqkNSROZpXsgHBjbXcUVrQU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hjg9Li4o5JWUCrPE4elHU99mDgn/ncK0S4Pm/ADtofI5nEsfQwsHTVZoRV/fGun6c
	 FdwWQZAPH2NLL4lf3UfX41d1KIetqgatI9AEPOnc2nx0ELCMocSsxAvYxWjfJgbJcW
	 Qlp64nRVerIE61rf8Tr/ZzhMyQOOOCd5+FJfPkrzqbdEy+MQuS/L/a40TYOV/GZmJt
	 ZRFvSxppmuKiH24dUP7C6H6IAKtFkffigS7SufX3N6uqVFFIrjvUfQnp7Z0CYBP+2l
	 qZnyxpmuwQAxd9Esac3u/8iRnfc5qSGW7cehOf3hLTtH9/m8gE0MO5kdcaVsA+ciZC
	 oZ5YUY78fEngA==
Date: Tue, 4 Mar 2025 21:54:12 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Even Xu <even.xu@intel.com>
cc: bentiss@kernel.org, srinivas.pandruvada@linux.intel.com, 
    mpearson-lenovo@squebb.ca, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
In-Reply-To: <20250304032255.1131067-1-even.xu@intel.com>
Message-ID: <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
References: <20250304032255.1131067-1-even.xu@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Mar 2025, Even Xu wrote:

> During S4 retore flow, quickspi device was resetted by driver and state
> was changed to RESETTED. It is needed to be change to ENABLED state
> after S4 re-initialization finished, otherwise, device will run in wrong
> state and HID input data will be dropped.

Um, RESETTED, really?

In the code the flag is called QUICKI2C_RESETED, but that seems to be 
gramatically incorrect as well, right?

I'll now apply this as-is because the code is already in, but perhaps 
renaming the flag to QUICKI2C_RESET would be in order.

Thanks,

-- 
Jiri Kosina
SUSE Labs


