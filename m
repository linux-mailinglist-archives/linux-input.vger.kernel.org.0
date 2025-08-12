Return-Path: <linux-input+bounces-13938-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 682B4B22744
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 14:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E57F16957A
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 12:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567DE1386DA;
	Tue, 12 Aug 2025 12:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krv7IsKD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7C8AD51;
	Tue, 12 Aug 2025 12:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755002787; cv=none; b=q7YRN3/a6ZyxPA0IDxea2s4YkLYAk5NhdsH4LdbvFELsR+cVrIAYKtNJJR4iWbBPwxpQxCVeWJPSd81m9JKC+b/UBMqFX1xIz2BSlTOQUYol7hH+R4gSDVR0gukc5FQs71jIxYr9Y3jAfWOl1McG1c4YhAPiEwuPNQKJOZxvr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755002787; c=relaxed/simple;
	bh=/WbWMmaEV0SbSER+6CeeMNrOUCbLu+mvu/EL/4cyUuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hrsODM+wUt1cOyPIVTssnkX5EbOzQtjr8J7PMfl1TRFZ6pnRQ6nQlO7m6X9gkrr5TWzZdTbF5/1P6nvJaN/sn8kdB2TWLh8R7PYLZ5fekZOinJR+UzNogjOFZLcyXy1oR1hGjaHfv8FZ6ceKC7e4OiVRYARc9ZW1uVBRcA172uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krv7IsKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D338C4CEF4;
	Tue, 12 Aug 2025 12:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755002786;
	bh=/WbWMmaEV0SbSER+6CeeMNrOUCbLu+mvu/EL/4cyUuY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=krv7IsKDVfnUqqTK64l8JioDZ8jC5Y1vNhGeW+M7TTomsvk6ZjeF2hsUGNZ7H5wpU
	 EVDrF5dUVZYNZOM/97FtDNep6GqVSiktfqalVs46JOCihNE1pUzgWkMeh0VbFINK9M
	 rcABDPAM2DnwFhBXVpTyUseo/VMehqkOyjfCorlWRXrkNUcOE67ad04zoxlKG3+rFH
	 PcJqM2OaADz5hEpijFTjOmsT5us22yA+m0fo6WIU/GVnKgMMzYMTfTOrGGPiMtv3iV
	 2BQ9Sroe8McVJCTIbr0051dUadxvQyWdA1TPB/ikljqoBlGxB54Hbn6pBd6A2zmGWb
	 tYL1Wym/mJjVQ==
Date: Tue, 12 Aug 2025 14:46:24 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Minjong Kim <minbell.kim@samsung.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-ntrig: fix unable to handle page fault in
 ntrig_report_version()
In-Reply-To: <20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
Message-ID: <rqo85n88-82s2-30s6-qn80-r4r943p4q59o@xreary.bet>
References: <CGME20250717061154epcas1p329022ab54ed143d2a8d5b3f8b7554b38@epcas1p3.samsung.com> <20250717-hid-ntrig-page-fault-fix-v1-1-96fa145a137f@samsung.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jul 2025, Minjong Kim wrote:

> in ntrig_report_version(), hdev parameter passed from hid_probe().
> sending descriptor to /dev/uhid can make hdev->dev.parent->parent to null
> if hdev->dev.parent->parent is null, usb_dev has
> invalid address(0xffffffffffffff58) that hid_to_usb_dev(hdev) returned
> when usb_rcvctrlpipe() use usb_dev,it trigger
> page fault error for address(0xffffffffffffff58)
> 
> add null check logic to ntrig_report_version()
> before calling hid_to_usb_dev()
> 
> Signed-off-by: Minjong Kim <minbell.kim@samsung.com>
> ---
>  drivers/hid/hid-ntrig.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-ntrig.c b/drivers/hid/hid-ntrig.c
> index 2738ce947434f904f32e9a1979b1681c66972ff9..96d3300655b5aa1621015b8e1fb511e6f616a713 100644
> --- a/drivers/hid/hid-ntrig.c
> +++ b/drivers/hid/hid-ntrig.c
> @@ -139,6 +139,10 @@ static inline void ntrig_set_mode(struct hid_device *hdev, const int mode)
>  
>  static void ntrig_report_version(struct hid_device *hdev)
>  {
> +
> +	if (!hdev->dev.parent->parent)
> +		return;
> +
>  	int ret;
>  	char buf[20];
>  	struct usb_device *usb_dev = hid_to_usb_dev(hdev);

I know that mixing declarations and code is fine these days, but we 
haven't been progressive enough to switch to that coding style in HID 
subsystem yet :) Would you be willing to move it below the declarations?

Thanks,

-- 
Jiri Kosina
SUSE Labs


