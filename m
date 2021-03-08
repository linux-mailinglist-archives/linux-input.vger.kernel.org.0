Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777F0330AC6
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 11:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231522AbhCHKCa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 05:02:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:57160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231607AbhCHKCE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 05:02:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 52B8A64EB2;
        Mon,  8 Mar 2021 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615197724;
        bh=SXbYLOSUSP4sHbGkOmmiltf76FOjmslDqPsc96yLRbc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=YLSRTTw7zz9ROpgP3mmjVFmHVosQ1YUd3QY7hF6cE7A0vqoX7O7BDqzoeF+o6TQpR
         WWsMXV5Tdc3zpiuBr5akbecBG0j1TClnDPcBKoITJjK+dcXXRvgoTmg36+TzhWSQL7
         FxZzM5Z1NnqazCnn/JPmQqME2TGy+Boevoy1Oyx9vtDRX2kHe6CA50Ojd/Ripplv5o
         WiTBrZwD4q3S6GcGffM+hfvTGDm3VEwPkpdIPzCkgQ25g59++FFVGrc+TUirnsatPi
         8zV33EvBCBIx/EZAvq0DF/ORirSauEI96XeGgHYm9c/cDTuGj4OO7YsNjfKDPeLJY+
         hZx7zPTxSVfrw==
Date:   Mon, 8 Mar 2021 11:02:01 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Shou-Chieh Hsu <shouchieh@chromium.org>
cc:     LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Shou-Chieh Hsu <shouchieh@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: google: add don USB id
In-Reply-To: <20210302115754.1.Ieb3e07a8f6c1d8b912c12d5801f1af20735c3430@changeid>
Message-ID: <nycvar.YFH.7.76.2103081101510.12405@cbobk.fhfr.pm>
References: <20210302115754.1.Ieb3e07a8f6c1d8b912c12d5801f1af20735c3430@changeid>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2 Mar 2021, Shou-Chieh Hsu wrote:

> Add 1 additional hammer-like device.
> 
> Signed-off-by: Shou-Chieh Hsu <shouchieh@chromium.org>
> ---
> 
>  drivers/hid/hid-google-hammer.c | 2 ++
>  drivers/hid/hid-ids.h           | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index d9319622da44..e60c31dd05ff 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -573,6 +573,8 @@ static void hammer_remove(struct hid_device *hdev)
>  }
>  
>  static const struct hid_device_id hammer_devices[] = {
> +	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index e42aaae3138f..0b4929258478 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -493,6 +493,7 @@
>  #define USB_DEVICE_ID_GOOGLE_MASTERBALL	0x503c
>  #define USB_DEVICE_ID_GOOGLE_MAGNEMITE	0x503d
>  #define USB_DEVICE_ID_GOOGLE_MOONBALL	0x5044
> +#define USB_DEVICE_ID_GOOGLE_DON	0x5050
>  
>  #define USB_VENDOR_ID_GOTOP		0x08f2
>  #define USB_DEVICE_ID_SUPER_Q2		0x007f

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

