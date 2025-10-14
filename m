Return-Path: <linux-input+bounces-15476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876C1BD8DE9
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 13:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 414C53A5427
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FC52F533E;
	Tue, 14 Oct 2025 11:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVwQkTK4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64A714D283;
	Tue, 14 Oct 2025 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439670; cv=none; b=JEnPXARN7JGucEoPEpqqUTOre06Uw3HIQvF2Ty+edgENFyxeujZt8kOtMpksQ+fWyUH6W6uQ+q3vFyq+TDi54Iq0zdi1rCngubgtf9vbuguDsCwxUi6jbr89BICOIBp+CjQ7q6ktTNhK/siIwrptTspBn9hVDik3Y+EhIKak8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439670; c=relaxed/simple;
	bh=WMqBbQl9s5Jj9CTT6nWXC7tDoaUroeT1OyiwJIijtJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NmQALR4wdKFN6O2PK2GRHe1xbA+0cJ4i7j+Y4BczYSydl6u7ggRZJTphbIkD2TuTbA73Jql4y7iHuoAZjt+AOqtlgiWBzjzNx+5PeqNlXgblNS1gfR1TDNRydtK3fni3YBUKyCtVHkN9xoqyPJTBNisTkySndsGoFr8KtygZX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVwQkTK4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0994C4CEE7;
	Tue, 14 Oct 2025 11:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760439669;
	bh=WMqBbQl9s5Jj9CTT6nWXC7tDoaUroeT1OyiwJIijtJM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LVwQkTK4T6D12ynOPOM58DRuoAApiQf3GfPA+qkZ9LhTYPR/XK7J+SH+4Tu5dQWts
	 VIqamdj6daT/i+Lr7YJ46j1CL/WzRlskT27SQAef0dq3p8iPht3uE/svcvSO0RzBfh
	 OzmJATkzqoArxvaFquNYFP/6hOJrcEZIRM0llNkNY9WRPqN9ouhfuTD8stRCFYnciV
	 JqXqqNMGeIcg7tSX3y0Y8HqLYaT1fYxAM/1++tCM3nSt7Fp0clCM2IQE85dmui/iqE
	 PTQaReHFKfLzaFqmnTb+xPoEHo4IJ3/j6IWNX7Jr3YHgHMgJaxlSLg4HVqYHhzG3pf
	 2zH5Sjj4DCDMw==
Date: Tue, 14 Oct 2025 13:01:06 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Matt Roberts <robertsmattb@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: add IGNORE_DUPLICATES quirk for ELAN1206
 (04f3:30f1)
In-Reply-To: <CALy8NDYVkOnRbzrO37BhX0cf4MHDwxv1LbV=JW3QOCg1+-kOqQ@mail.gmail.com>
Message-ID: <70s5106n-7qo4-4sr1-18qs-o30n143p49o9@xreary.bet>
References: <CALy8NDYVkOnRbzrO37BhX0cf4MHDwxv1LbV=JW3QOCg1+-kOqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 5 Oct 2025, Matt Roberts wrote:

> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 2879e65cf..ed318c80e 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -2150,6 +2150,10 @@ static const struct hid_device_id mt_devices[] = {
>                 HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>                         USB_VENDOR_ID_ELAN, 0x32ae) },
> 
> +        /* ELAN1206 touchpad: duplicate tracking IDs cause hold/click storms */
> +        { .driver_data = MT_QUIRK_IGNORE_DUPLICATES,
> +          HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH, 0x04f3, 0x30f1) },

Is there a reason not to use USB_VENDOR_ID_ELAN here, instead of 
open-coding 0x04f3?

Also, the patch has been whitespace-corrupted, so it can't be applied. 
Could you please look into fixing that, and resubmit?

Thanks!

-- 
Jiri Kosina
SUSE Labs


