Return-Path: <linux-input+bounces-16972-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD17D127CF
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 13:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFEB03054657
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 12:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AC8357715;
	Mon, 12 Jan 2026 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXzO9CFi"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA4D357714;
	Mon, 12 Jan 2026 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768219967; cv=none; b=fl/vfOe8Ou5WMbcXLC3IEjoQONCWqbtqW2hcn6j4nnr/pA2ZhMYftSYBEqV4xstJmJmbYqJRDFZGSrLz6mdNdlp78Lsc+22CsUnudjiuz94eYd0sRnd79b0vAgC6O6tmvdVFpyJk1/byVbQVbhEmujSDu8V+M53z7/h1R6nuhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768219967; c=relaxed/simple;
	bh=pMYZI0CgzcClVF9Y2wlUPH6tDeeT1bqttwxiUBJ9puA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PqaCg20YhRt+eKLPweAgnyH6wvdnoE4pWmEA3J58SXHDaSTMGN91oNKtw5ACopOKcYFzBGJL3Xn5gMxc8p+pM0y4oY8Q9pft3L0UGEHut6EwM3iXe22fygXARrjvQ68VBsS/uLv3fUpkEMzPaa21zNmup6J46T65YNQrV6dOib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXzO9CFi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69682C16AAE;
	Mon, 12 Jan 2026 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768219966;
	bh=pMYZI0CgzcClVF9Y2wlUPH6tDeeT1bqttwxiUBJ9puA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pXzO9CFipLA5HqDI1isf0mUo6gkpCenVIFEJSxBWFM2iCWLwnn0fOxqO2H9C0e++2
	 h2YRJxresSBGsBtRmiDFTHZqYLY4WN06EfMoxlJIJsWBIB2pSz47RcDFq7jouiSoAc
	 b+3KMKQVrpHgjB+IfYS3w6ajEUXWoUmGBpCzwYOWxpP90rHBrL0jKi0YVcg8k686kU
	 8WC+JsnESL0GWJ89iTpMiGSVXG5+clfu4ARpzbr4zgGnbz2rq2vR7BS71/Jb/BBc1c
	 hz6/HcletGBu2MvTOUOh7kdxRXtP52AbjzTPyVhXZRMO/6EN/vg/zMXASZRG3sA054
	 crCw47+qHJ9bA==
Date: Mon, 12 Jan 2026 13:12:43 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] HID: hid-lenovo-go: Add Lenovo Legion Go Series
 HID Driver
In-Reply-To: <20251229031753.581664-3-derekjohn.clark@gmail.com>
Message-ID: <0on4p9s6-7512-9408-49no-3292o86113r3@xreary.bet>
References: <20251229031753.581664-1-derekjohn.clark@gmail.com> <20251229031753.581664-3-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Dec 2025, Derek J. Clark wrote:

> Adds initial framework for a new HID driver, hid-lenovo-go, along with
> attributes that report the firmware and hardware version for each
> component of the HID device, of which there are 4 parts: The MCU, the
> transmission dongle, the left "handle" controller half, and the right
> "handle" controller half. Each of these devices are provided an attribute
> group to contain its device specific attributes. Additionally, the touchpad
> device attributes are logically separated from the other components in
> another attribute group.
> 
> This driver primarily provides access to the configurable settings of the
> Lenovo Legion Go and Lenovo Legion Go 2 controllers running the latest
> firmware. As previously noted, the Legion Go controllers recently had a
> firmware update[1] which switched from the original "SepentiaUSB" protocol
> to a brand new protocol for the Go 2, primarily to ensure backwards and
> forwards compatibility between the Go and Go 2 devices. As part of that
> update the PIDs for the controllers were changed, so there is no risk of
> this driver attaching to controller firmware that it doesn't support.
> 
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  MAINTAINERS                 |   6 +
>  drivers/hid/Kconfig         |  12 +
>  drivers/hid/Makefile        |   1 +
>  drivers/hid/hid-ids.h       |   3 +
>  drivers/hid/hid-lenovo-go.c | 734 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 756 insertions(+)
>  create mode 100644 drivers/hid/hid-lenovo-go.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9ed6d11a7746..b5ad29d24e3e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14135,6 +14135,12 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
>  
> +LENOVO HID drivers
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	drivers/hid/hid-lenovo-go.c

Hi Derek,

thanks for working on this.

I am now almost finished with reviewing this pile and am planning to queue 
it in hid.git shortly, but I have a question regarding the MAINTAINERS 
entry above.

The title claims support for all of Lenovo HID, but there is much more to 
it than drivers/hid/hid-lenovo-go.c, specifically in hid-lenovo.c.

So either please make the title more specific (or claim the ownership of 
the whole Lenovo HID landscape indeed, fine by me, but the please reflect 
that in F: :) ).

Thanks,

-- 
Jiri Kosina
SUSE Labs


