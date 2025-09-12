Return-Path: <linux-input+bounces-14653-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A3DB55171
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 16:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA144B607FD
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 14:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31C031C56F;
	Fri, 12 Sep 2025 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPLulpa4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465F30AAC1;
	Fri, 12 Sep 2025 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687042; cv=none; b=UGsG1/ixvHLVJhKBH4F31W8Xy5OHxzvB/jfmKFube9B5yra+GRv/FY9kRTDU1qPTbifraNBjbSke52U1QsPEZnQTmp3dYOwe3VnDSBBCQ9NT2kBg9jgwjdB3P7/UDqd678uxA6s+ydc8i4CMKn9um6j7fQKa/2Gp++EhhmfGQnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687042; c=relaxed/simple;
	bh=R9Zeya4tIZdJ8t94wN+9Fj9g2LtCWVpIo57dpc9HrUE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=neZpJpgEjHUSZXDUFtvEWrSsCf8ytpkAEN3/xCd34LLeyY4nXYEcfFjTZ40I7exTNbyqD8ieA7TR0yEJIDHIFBDY8rkSH4+PufgQ4uQjJw+4Cf1FmUJbJH/f8YdILqgMafECihy8s+jxxTyCpv8ZvZ2tbISBpQA4DbCGX7mQHKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPLulpa4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5A9C4CEF1;
	Fri, 12 Sep 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757687042;
	bh=R9Zeya4tIZdJ8t94wN+9Fj9g2LtCWVpIo57dpc9HrUE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NPLulpa47j4FchkAg0+e1DteIR2wNllZWlEvBnS4etFWATgvq8zNDhR5oaZ6HpL+E
	 gHudbpt85nxGJxFZz7Td79wkgh8OaYzh6zjIqRESs8BtmZ1zvKBBA0t4/W6Ek78/iz
	 94sN9bZKwV6z2WJNGLeH33li78U+XXOqJr1Rn0v2tnJ+8scoNdV21dRUVtyVEooSDh
	 /suh8SxefYR+mf+pfztdRfh9qLeRrHGf3nKRLGegH3lzfZ4pr4fpZlAI271BIoNOh9
	 WljLCmkXFUL8hIPc0+ndeb8pzXjw+23AugIIGhHyuaErbuQYchgYNs0lMqV2IvD2kr
	 HqnhlG+wEQvxg==
Date: Fri, 12 Sep 2025 16:23:59 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Janne Grunau <j@jannau.net>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Vishnu Sankar <vishnuocv@gmail.com>, linux-input@vger.kernel.org, 
    regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
    stable@vger.kernel.org
Subject: Re: [PATCH] HID: lenovo: Use KEY_PERFORMANCE instead of ACPI's
 platform_profile
In-Reply-To: <20250901-hid-lenovo-drop-platform_profile-v1-1-e2e9c68483ab@jannau.net>
Message-ID: <s5q84snp-733q-o350-16ns-n2qroo550opn@xreary.bet>
References: <20250901-hid-lenovo-drop-platform_profile-v1-1-e2e9c68483ab@jannau.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 1 Sep 2025, Janne Grunau wrote:

> Commit 84c9d2a968c82 ("HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd
> Fn keys") added a dependency on ACPI's platform_profile. This should not
> be done for generic USB devices as this prevents using the devices on
> non ACPI devices like Apple silicon Macs and other non-ACPI arm64
> systems. An attempt to allow using platform_profile on non-ACPI systems
> was rejected in [1] and instead platform_profile was made to fail during
> init in commit dd133162c9cf ("ACPI: platform_profile: Avoid initializing
> on non-ACPI platforms").
> So remove the broken dependency and instead let's user space handle this
> keycode by sending the new KEY_PERFORMANCE. Stable backport depends on
> commit 89c5214639294 ("Input: add keycode for performance mode key").
> 
> [1]: https://lore.kernel.org/linux-acpi/CAJZ5v0icRdTSToaKbdf=MdRin4NyB2MstUVaQo8VR6-n7DkVMQ@mail.gmail.com/
> 
> Cc: regressions@lists.linux.dev
> Cc: stable@vger.kernel.org
> Fixes: 84c9d2a968c82 ("HID: lenovo: Support for ThinkPad-X12-TAB-1/2 Kbd Fn keys")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  #regzbot introduced: 84c9d2a968c82

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


