Return-Path: <linux-input+bounces-5685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC06957358
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:33:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDCB51F22A99
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:33:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1604A172BD3;
	Mon, 19 Aug 2024 18:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQ55X/+L"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E14642D;
	Mon, 19 Aug 2024 18:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724092412; cv=none; b=bCpTCmHHWSLYltv7xtuv7iX24tKzgPxvlTJL/N1wMc8WS/dZtSf0a5aXs4k+n3gAOlCnWVjhZmciEKh26czpAl+pgLyaP1M0rDGtLwtKaktB7eYwJpbyhZze0mkduXpAwVfqeZAqzb/IUnKxk10KTeNp7UQ8socwwWnPKmpa0qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724092412; c=relaxed/simple;
	bh=EDcyhRt08AZvlikLAgQfg1D0g4MUXPrjolvG4JOn5lY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YpnBO6PO9AqDE9ptVREPfGFd0ppF2UpabwPgJT0osHBMuvRQfKiQRh3/v/5LKEZ/QRH+tkW88Ka/sSIGP8r0p2C4tQESdP9Yad7Bqy934mLuFtSpAJ2SyC3xR5Dj24yi5CvlgWKtq+6wOyYcE6DoL1X8N5UAbbg0L5WEiy1+vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQ55X/+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366C4C32782;
	Mon, 19 Aug 2024 18:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724092411;
	bh=EDcyhRt08AZvlikLAgQfg1D0g4MUXPrjolvG4JOn5lY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oQ55X/+L33g3kTfVPznHjJ+u53B5XPrYTJcsp9viL5vdT+ISNd7wlx5PsfxrPzyDv
	 lLgONQlCYYLABXRlFg4o+rglwrvQ427Zk6H/9T+mN2L7FJLs0w1nACZ8CIie+uAU7E
	 BUxJyoLoLkOezc3/jxis7KT3AdufVyj7wT3/jCtjlnzIlju2RqdYDUkBAGYDQXbt8s
	 pvk8Vq2ENBpov2rufq3YmmCvUQT35ga64dhoUPuxMj0TYPVD3bjNctJo2HdHJRE02S
	 yl3rmCeL4opsgDLnyDA3wjJkqhzyHCXjMmkQ9poESUQK33d82kbRgwTFRZL57Aq/a9
	 uzqU0VCiGMV7g==
Date: Mon, 19 Aug 2024 20:33:29 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Roderick Colenbrander <thunderbird2k@gmail.com>
cc: Max Staudt <max@enpas.org>, 
    Roderick Colenbrander <roderick.colenbrander@sony.com>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    nathaniel.lewis@sony.com
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar
 together
In-Reply-To: <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2408192033080.12664@cbobk.fhfr.pm>
References: <20240811130906.3682-1-max@enpas.org> <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Aug 2024, Roderick Colenbrander wrote:

> Hi Max,
> 
> That looks like a reasonable workaround. I think it would be fine to
> add. We will try to support that with Android as well.

Roderick, can I take this as your Acked-by:?

Thanks,

-- 
Jiri Kosina
SUSE Labs


