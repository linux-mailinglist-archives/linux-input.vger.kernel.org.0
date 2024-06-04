Return-Path: <linux-input+bounces-4060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D6B8FAD0C
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A50101C2097A
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C58C78283;
	Tue,  4 Jun 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B718jDKh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B2C446CF
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717488230; cv=none; b=qYnrfJqJAbs6g/3e9+qzbr9T1JhmsNlLwMfTxXSR2F5iePQYk5Z1JJWqgn8MHWOS4NwWkz9NyceH1zBevNbD7kmikVd15lITuCRDX1p3joAjyj2bQTriJmlrZ1jujxGDHRJvdBGD5j3o2VRuo/4lLjtu2P4FKwGmyYSDP1vZXbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717488230; c=relaxed/simple;
	bh=9NUiLGZFvTNCAJkCapV5N1EB6ZvWjVyJ/8JPXdph0B0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gbVcPtRLCMh0P+KCj26LxeKXXhnJZLHCHQOJAXdgTEJlYP0Jk2wcHE2/nlxiFlWHQ+ERpgKMDSAiAfmICbmjsDf2cKZvZMR65zdmmDN490eMDR/iYeO5Lgc5ng75AAdL2kIgvsbXDMKVsZGy6KGsAXW/VVAAuzhTgmF0vzyq9eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B718jDKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01622C2BBFC;
	Tue,  4 Jun 2024 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717488230;
	bh=9NUiLGZFvTNCAJkCapV5N1EB6ZvWjVyJ/8JPXdph0B0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=B718jDKhyBO71tjhsfX6nKkBRkKnAt9DP5501+I3ZnEBlECICN/PmOaoofxQHZvU9
	 DX7ONPyq6uzKBShiQUlvYK7XsIAcwjOx5VsUkd1DIbhTOtKMPcgsR4s3jrk88w6yoC
	 pGQTAhP+Ml1T971eGEwnfr7rv1t1e8RHsHKookLLQnvk8WP8Dn2v7fccHt7DH5LUMc
	 6dFJxnzzJaG7bkDG5Uak9v98ovFrNPnrSZKBNpivvMeEBWS/MZO7UZo4HNLgwVTEzm
	 YHOooxobv/rQugvkqkKobAWjiYiGG8WYY2IJPpZ6BLY0cihHRP2sVxX1p0CmYTium3
	 zfPZhpyeqMPTA==
Date: Tue, 4 Jun 2024 10:03:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aseda Aboagye <aaboagye@chromium.org>
cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/2] input: Add support for "Do Not Disturb"
In-Reply-To: <Zl4BBz4Doo8krta_@google.com>
Message-ID: <nycvar.YFH.7.76.2406041003200.16865@cbobk.fhfr.pm>
References: <ZldxNQGXy4zWVPu1@google.com> <ZldzsCybMzSWnZaQ@google.com> <Zljhp-u-s-RPPXDj@google.com> <Zl4BBz4Doo8krta_@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Jun 2024, Aseda Aboagye wrote:

> 
> > >  #define KEY_ACCESSIBILITY              0x24e   /* Toggles the system bound accessibility UI/command (HUTRR116) */
> > > +#define KEY_DO_NOT_DISTURB             0x24f   /* Toggles the system-wide "Do Not Disturb" control (HUTRR94)*/
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > Feel free to merge through HID tree.
> 
> Thank you for the review!

Thanks. The patches are whitespace damaged though, and can't be applied. 
Could you please fix your patch sending workflow and resend?

Thanks!

-- 
Jiri Kosina
SUSE Labs


