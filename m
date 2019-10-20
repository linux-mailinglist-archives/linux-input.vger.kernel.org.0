Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6D9DE0B6
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 23:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbfJTVcY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 17:32:24 -0400
Received: from freundtech.com ([78.47.86.165]:60750 "EHLO freundtech.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726301AbfJTVcY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 17:32:24 -0400
Received: from [IPv6:2a02:8071:2b91:e400:8dde:ba23:ec46:35e3] (unknown [IPv6:2a02:8071:2b91:e400:8dde:ba23:ec46:35e3])
        by freundtech.com (Postfix) with ESMTPSA id 46D5C1E6008;
        Sun, 20 Oct 2019 23:32:21 +0200 (CEST)
Subject: Re: [PATCH] HID: logitech: Add MX Master 3 Mouse
To:     linux-input@vger.kernel.org
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20191020163916.911033-1-adrian@freund.io>
From:   Adrian Freund <adrian@freund.io>
Autocrypt: addr=adrian@freund.io; prefer-encrypt=mutual; keydata=
 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
Message-ID: <50209a68-8a36-b6ae-e371-24afa2d7fdf1@freund.io>
Date:   Sun, 20 Oct 2019 23:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191020163916.911033-1-adrian@freund.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I just noticed, that I forgot so sign off the commit. I'll resubmitt it as v2.

On 10/20/19 6:39 PM, Adrian Freund wrote:
> Adds support for the Logitech MX Master 3 Mouse to the HID++ driver when
> connected by the Logitech Unifying Receiver.
> This doesn't yet add support for using the mouse over bluetooth.
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 0179f7ed77e5..e263085a0b82 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3717,6 +3717,8 @@ static const struct hid_device_id hidpp_devices[] = {
>  	{ LDJ_DEVICE(0x4071), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ /* Mouse Logitech MX Master 2S */
>  	  LDJ_DEVICE(0x4069), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +	{ /* Mouse Logitech MX Master 3 */
> +	  LDJ_DEVICE(0x4082), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>  	{ /* Mouse Logitech Performance MX */
>  	  LDJ_DEVICE(0x101a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
>  	{ /* Keyboard logitech K400 */
