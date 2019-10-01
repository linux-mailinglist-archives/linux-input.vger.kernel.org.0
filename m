Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF3D0C36E3
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 16:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388205AbfJAOSR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Oct 2019 10:18:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727096AbfJAOSQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Oct 2019 10:18:16 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0958D2086A;
        Tue,  1 Oct 2019 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569939496;
        bh=V1X4vM5LyhMojnRAqDtv1Lkud7jILmSl7EvtxhBRJ28=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SF6tf4/yMf+nuaUQsZ6w5m2+YHU79cQawLEcWzvXncnasG6nZw0pQ7Vr3DFT/zQDn
         Ob9YBR9lI4Zm06Hv+DyoNu3BLn/hpVxAQpZxTsobqXh0BGLWnIjxVQ+azGu86uRjRU
         mO1y0fMwmImKgrctOskja6vE8K1f1q1/A+v7wj7c=
Date:   Tue, 1 Oct 2019 16:17:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Ethan Warth <redyoshi49q@gmail.com>
cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB
 Gamecube Adapter
In-Reply-To: <CAAPc1Th4mgE=ntLY=NXn2Jbfgi0OBpZ5R2sYGhWJ_4+syuPA9w@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.1910011617080.13160@cbobk.fhfr.pm>
References: <CAAPc1Th4mgE=ntLY=NXn2Jbfgi0OBpZ5R2sYGhWJ_4+syuPA9w@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 6 Sep 2019, Ethan Warth wrote:

> >From 32bdfb1d652cc38ab13f8616df58dee726201785 Mon Sep 17 00:00:00 2001
> From: Ethan Warth <redyoshi49q@gmail.com>
> Date: Wed, 4 Sep 2019 16:07:45 -0500
> Subject: [PATCH] HID: add support for 0079:1846 Mayflash/Dragonrise USB Gamecube
>  Adapter
> 
> Mayflash/Dragonrise seems to have yet another device ID for one of their
> Gamecube controller adapters.  Previous to this commit, the adapter
> registered only one /dev/input/js* device, and all controller inputs (from
> any controller) were mapped to this device.  This patch defines the 1846
> USB device ID and enables the HID_QUIRK_MULTI_INPUT quirk for it, which
> fixes that (with the patch, four /dev/input/js* devices are created, one
> for each of the four controller ports).
> ---
>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-mf.c     | 2 ++
>  drivers/hid/hid-quirks.c | 2 ++
>  3 files changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0a00be19f7a0..9cd909985a4c 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -362,6 +362,7 @@
>  #define USB_DEVICE_ID_DRAGONRISE_DOLPHINBAR    0x1803
>  #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE1    0x1843
>  #define USB_DEVICE_ID_DRAGONRISE_GAMECUBE2    0x1844
> +#define USB_DEVICE_ID_DRAGONRISE_GAMECUBE3    0x1846
> 
>  #define USB_VENDOR_ID_DWAV        0x0eef
>  #define USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER    0x0001
> diff --git a/drivers/hid/hid-mf.c b/drivers/hid/hid-mf.c
> index fc75f30f537c..92d7ecd41a78 100644
> --- a/drivers/hid/hid-mf.c
> +++ b/drivers/hid/hid-mf.c
> @@ -153,6 +153,8 @@ static const struct hid_device_id mf_devices[] = {
>          .driver_data = HID_QUIRK_MULTI_INPUT },
>      { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
> USB_DEVICE_ID_DRAGONRISE_GAMECUBE2),
>          .driver_data = 0 }, /* No quirk required */
> +    { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE,
> USB_DEVICE_ID_DRAGONRISE_GAMECUBE3),

Thanks a lot for the fix; however your mail client seems to have damaged 
it badly with respect to whitespace and line-wrapping. Could you please 
fix that up and resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs

