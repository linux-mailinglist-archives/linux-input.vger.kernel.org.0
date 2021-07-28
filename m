Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098313D8AF4
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhG1JlH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:41:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:52670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231408AbhG1JlG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:41:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 85C8060F9E;
        Wed, 28 Jul 2021 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627465265;
        bh=5Sz0+gciavzdOLZggl9uM/lWADQD15jdSD/3wSpVGZU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=imJiDoKvUPT+VOBW4ldnhUcL0TiJlN3JWZeCvkR9ePdM7m1ioicFxmXBmTrOL5auj
         0/HnY5vMPtLeju1maEJTs0crd8r326RCLJjc8rIPGTTnC5dazl3QnWvSjaffTTCGkh
         MN8vzIdVhw/o6tqoG378jYYM8yKhkqH2ggzc769pmfEck/H2X94axeY+mx4KR23YKp
         /NxaManeCCTkFtAzgYM82iThjEO523M1Jn2AsnxGRAFUiLRnmzSbqpR63dFa/yw49b
         Q02nOfIgZCi2JFQPdhitFxLB+SFXT9uAMp21uwKSTtvsrUPnbgQ8dgVzCqh+bUgizN
         9HAS/z9reMgoA==
Date:   Wed, 28 Jul 2021 11:41:02 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Haochen Tong <i@hexchain.org>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: apple: Add support for Keychron K1 wireless
 keyboard
In-Reply-To: <20210717170431.i6cubjpihjdxepmu@kotori.hexchain.org>
Message-ID: <nycvar.YFH.7.76.2107281140570.8253@cbobk.fhfr.pm>
References: <20210717170431.i6cubjpihjdxepmu@kotori.hexchain.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 18 Jul 2021, Haochen Tong wrote:

> The Keychron K1 wireless keyboard has a set of Apple-like function keys
> and an Fn key that works like on an Apple bluetooth keyboard. It
> identifies as an Apple Alu RevB ANSI keyboard (05ac:024f) over USB and
> BT. Use hid-apple for it so the Fn key and function keys work correctly.
> 
> Signed-off-by: Haochen Tong <i@hexchain.org>
> ---
>  drivers/hid/hid-apple.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 6b8f0d004d34..dc6bd4299c54 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -501,6 +501,8 @@ static const struct hid_device_id apple_devices[] = {
>  			APPLE_RDESC_JIS },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
>  		.driver_data = APPLE_HAS_FN },
> +	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI),
> +		.driver_data = APPLE_HAS_FN },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),
>  		.driver_data = APPLE_HAS_FN },
>  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ISO),

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

