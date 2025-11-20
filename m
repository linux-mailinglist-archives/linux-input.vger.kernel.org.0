Return-Path: <linux-input+bounces-16262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD14DC7526A
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 16:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 76EED360D48
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 15:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F521805E;
	Thu, 20 Nov 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="usGVbOkz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274B4376BDD;
	Thu, 20 Nov 2025 15:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763653614; cv=none; b=C6xZMzoC4C2MzjRLCteWSVoI1jDAQs916WiUmOTD6Yo0e2ONbdyyNFOfsSa0sQq+l2EdOqGQUszYa5x7LfqtWhO5thq6KQPGEMJwq3lLMH7IOIohekOZmEb1qxQpTR+sk8q3rZrMb3U9hoj1+ZTJcutrYRskdGzlDPv5wneoGUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763653614; c=relaxed/simple;
	bh=rciefd72TLsBIkrwNt0PBaD5IMmH7vuLnPk2LGt79f4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TRI+n/vQufFKeAqjs/g0XIhhHk52rNowJHoxoV/S5PHwKbR2ay8SfKKGxxZ8aq7nRKU/viBE6WCFVSU7qXIZ7fuKCIh6P4XOLag2RjKr/jwm4CJ65x4kxoDMkR8mmA0WVt3nhij8BCt2C+L4EW8QSnx+vtf9IZhXMqCGw+XdRmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=usGVbOkz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596EBC4CEF1;
	Thu, 20 Nov 2025 15:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763653613;
	bh=rciefd72TLsBIkrwNt0PBaD5IMmH7vuLnPk2LGt79f4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=usGVbOkz8MkkplY4EmO5uJ6kaOGXukhSRVUd8U7nTJhXlMeX5A2Ng/7JpWkE+sjIH
	 w1dFE3qEdT+iZ120Mqjt0InYIZTRftizvyndMjgAK9m87WHaiK6+6iBBAbSWZ85TAa
	 WMOYdolA8GbP2eMirifwo8VO1SBmBvcv+WHA07OZInRw8Qtk7vfyB4Lz0HmARrU2FY
	 /WkhaU5riUja6BH/asGg0QfbtGDO/J9K1OH9GnOnD6oqy+mhVDPr3XnNXnHEI+JTc+
	 D9rU2+ta0YZEHDIai4GeodySeGHy5qE7a2bLU6cynx9zycSWti1Cqtxr+07ERT0LXl
	 FHXscUpRSmung==
Date: Thu, 20 Nov 2025 16:46:51 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
    Peter Hutterer <peter.hutterer@who-t.net>, 
    Nicholas LaPointe <nicholaslapointe8@gmail.com>, 
    Higgins Dragon <higgins@higginsdragon.com>, 
    Curran Muhlberger <curran@cs.cornell.edu>, 
    Jan Felix Langenbach <JanFelix.Langenbach@protonmail.com>, 
    Hannah Pittman <dev@hannahl.co.uk>, 
    Colin Ian King <colin.i.king@gmail.com>
Subject: Re: [PATCH 00/10] HID: bpf: sync up with current udev-hid-bpf
 programs
In-Reply-To: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
Message-ID: <3rosns8p-n849-pq99-2n56-4n28so06215q@xreary.bet>
References: <20251118-wip-sync-udev-hid-bpf-v1-0-0f8105c54835@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Nov 2025, Benjamin Tissoires wrote:

> As I need to get a new release of udev-hid-bpf, it would be good to
> mark the currently "testing" HID-BPF programs into stable.
> 
> So I've taken all of them, formatted them to the LKML format and sent
> here.
> 
> Again, no need to backport any of those into stable, we are putting them
> here mostly for code archiving purpose and have a public central point
> for them.
> 
> Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
> ---
> Benjamin Tissoires (10):
>       HID: bpf: Add support for the Inspiroy 2M
>       HID: bpf: add support for Huion Kamvas 13 (Gen 3) (model GS1333)
>       HID: bpf: support for Huion Kamvas 16 Gen 3
>       HID: bpf: Add fixup for Logitech SpaceNavigator variants
>       HID: bpf: Add support for the Waltop Batteryless Tablet
>       HID: bpf: Add support for the XP-Pen Deco 01 V3
>       HID: bpf: Add support for XP-Pen Deco02
>       HID: bpf: add heuristics to the Huion Inspiroy 2S eraser button
>       HID: bpf: add the Huion Kamvas 27 Pro
>       HID: bpf: fix typo in HID usage table

Now in hid.git#for-6.19/hid-bpf, thanks!

-- 
Jiri Kosina
SUSE Labs


