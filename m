Return-Path: <linux-input+bounces-10531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500B6A4EE46
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 21:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A7F47A5ECE
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 20:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041391FAC46;
	Tue,  4 Mar 2025 20:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcW9W9An"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FF81FAC34;
	Tue,  4 Mar 2025 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741119821; cv=none; b=swXg+VKJaW6BmbN0EaIMn4NAHShXBywyQWxas505vhQGF8k6SFv1TejtMgNRlfWyJmOPD6lhlROVMZci7OzdXLc1Eglva4rmcTnks77J/r5yIgepJj3gnwXhpnojuZ3HT+EmQCjYaqPkm8NUFtGFfN3p2QEJd6UvrCiKUuxY4Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741119821; c=relaxed/simple;
	bh=g789kfaQQHuo8kTSk/c93II7xSW10weQSTmmIUy/3U4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Uqso9pdpWQBcqwuvC3P+ipNI/vRablaYeSgY9SH2gd7uI8ZhwbWy9Que0VqfXRdBJ4KsrlMrxrhljfzKUeyhwechOIGF+PSBbzE3raW6viAk1FTCueSn5WFv2nwetCRm1T/fhFQUqrhLQZwDIzCkX8PGBwGN8iw15zVe/J1xdjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcW9W9An; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DCCC4CEE5;
	Tue,  4 Mar 2025 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741119821;
	bh=g789kfaQQHuo8kTSk/c93II7xSW10weQSTmmIUy/3U4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EcW9W9AnrJDv/H0Z0CwTnNLWDwqkpQaptMqLhQFf3E67zhkcaTE9j2mupXVyYuUQO
	 tiduBhr6E4zDJgWwhtQLIQ/JolA7Sw2IjvAV3ploV+zL64dhLA8Bp48tXjIjQO8Wvk
	 mIIZLG+WMnHDpsYhqcE4s4XAQ3PXlpcp5LrwI4KUVq1urMMu61YFCXVq3ReYvwyOso
	 JYNSJgwSihaT0jveyjFw+h+CxRBhngtRUSDJQYQeca5soQXm9JcISym+inMRtzBq0o
	 VpBSn+WlInOyfHAsyPdCi8PSL6sarQr4Quh4BlAj9acxebwhzhISmBQCgFSe1dMUHi
	 MIu7U55nBxDjg==
Date: Tue, 4 Mar 2025 21:23:38 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    Alex Henrie <alexhenrie24@gmail.com>, 
    "jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, 
    "bruners@gmail.com" <bruners@gmail.com>, 
    "seobrien@chromium.org" <seobrien@chromium.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
In-Reply-To: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Message-ID: <sp111ppn-q3pn-20rp-92n0-rqn0p2s7s7n5@xreary.bet>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> The only difference between the fn mapping of the MacBook Pros with esc key
> and those without is of the presence of KEY_GRAVE in the translation table.
> 
> We can easily use a flag instead of writing the whole table again to omit
> it from the models that have an esc key.
> 
> Additionally, APPLE_IGNORE_MOUSE quirk was unused in this driver, so has
> been removed in this commit.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
> drivers/hid/hid-apple.c | 72 ++++++++++++++++-------------------------
> 1 file changed, 27 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 49812a76b..e31c9e8e8 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -30,7 +30,7 @@
> #include "hid-ids.h"
> 
> #define APPLE_RDESC_JIS		BIT(0)
> -#define APPLE_IGNORE_MOUSE	BIT(1)
> +/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
> #define APPLE_HAS_FN		BIT(2)
> /* BIT(3) reserved, was: APPLE_HIDDEV */
> #define APPLE_ISO_TILDE_QUIRK	BIT(4)
> @@ -43,7 +43,8 @@
> #define APPLE_IS_NON_APPLE	BIT(11)
> #define APPLE_MAGIC_BACKLIGHT	BIT(12)

This patch is corrupt -- the context lines are missing the leading space. 
For some reason, it's only the 1/4 which is corrupted, the rest is fine.

Can you please look into this and resubmit?

Thanks,

-- 
Jiri Kosina
SUSE Labs


