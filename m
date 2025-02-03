Return-Path: <linux-input+bounces-9702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CBA2566D
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 10:55:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BABD47A5381
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 09:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C429B200110;
	Mon,  3 Feb 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxFIkE8J"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7A31FE467;
	Mon,  3 Feb 2025 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738576499; cv=none; b=t/daPFBQIw195nKxiVhrqus7R2Pia4mA+s4Qwl+ZSirn2MMUSg6d6lxMZmHRzP2/we86KAv3m+Pi/JuAzWFY9viQSz/I1jDMFtDM1Sk2CISTfNbB2RVLq4oV1VWLlLvGkenf8gvTA3qjmW6mkwTUdfhRGo5RbSmQwVqzjv4Ka/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738576499; c=relaxed/simple;
	bh=/lRMxdKebZKE6l7wkf5qC7rCBesoYL++jJQTzWYNKyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gj2sPbirGvWyw4QR+fCZiMrcqYag8WSLj5cpCVfi/mY0StuvW0L/MTWaQWBwV/3FTx7MRjSzwewuQ/zYbYuP+fgtDLhysWCDMJ5+59S95tbmsrTrV3YRF513mpD22u/AaPxv1PpAqSpNFMvDxFAeCngqT9x/Mp5rgnUjZ22ggRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxFIkE8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22371C4CED2;
	Mon,  3 Feb 2025 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738576499;
	bh=/lRMxdKebZKE6l7wkf5qC7rCBesoYL++jJQTzWYNKyY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UxFIkE8J5mhoGVWq+Sup32ag57EVAh6JXd0pqYM5kdVFMV43QTSkdV44yYBSIBcTX
	 nn0070rGp4RzMXReBzWl0uhvgYwUM0kyrMzAavPr2zjNYXq/fsdRvnOl8ZXZW4IM8r
	 wNc1RQ3dlOnTLj2TCLcNAPah0rpxO+L6hIorUZtyoPm7/Of8PnFr4Jl5gTQ3DsgjNj
	 l+s3v+U1qYAonjogVZPUYEgxuEvF8rCk2kJWA10pta8VjAZPgPq0CxQ99umSx86JPP
	 /jilItmixIcpVRDACSU9sOwYormuHbcMsHGOPJWXVNqy3MbMmCMV7laPi18C2qpbxG
	 GSFCa8Wu20J3w==
Date: Mon, 3 Feb 2025 10:54:56 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Vishnu Sankar <vishnuocv@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: lenovo: select CONFIG_ACPI_PLATFORM_PROFILE
In-Reply-To: <20250122065120.1335235-1-arnd@kernel.org>
Message-ID: <o2790845-67ns-p6o9-85r0-82q1qnr234np@xreary.bet>
References: <20250122065120.1335235-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Jan 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous patch tried to fix this link failure:
> 
> x86_64-linux-ld: drivers/hid/hid-lenovo.o: in function `lenovo_raw_event':
> hid-lenovo.c:(.text+0x22c): undefined reference to `platform_profile_cycle'
> 
> but got it wrong in three ways:
> 
>  - the link failure still exists with CONFIG_ACPI_PLATFORM_PROFILE=m
>    when hid-lenovo is built-in
> 
>  - There is no way to manually enable CONFIG_ACPI_PLATFORM_PROFILE, as
>    it is intended to be selected by its users.
> 
> Remove the broken #if check again and instead select the symbol like
> the other users do. This requires adding a dependency on CONFIG_ACPI.
> 
> Fixes: 52e7d1f7c2fd ("HID: lenovo: Fix undefined platform_profile_cycle in ThinkPad X12 keyboard patch")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks a lot for the fix Arnd, applied to hid.git#for-6.14/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs


