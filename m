Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21DFE11E073
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 10:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfLMJRx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 04:17:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfLMJRw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 04:17:52 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A1F82077B;
        Fri, 13 Dec 2019 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576228672;
        bh=g6Mh9w3BdmP7NfyaTqT+aoKR0enNKfr+KYD2GmPCfSU=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=vIO9uweaeEDBCqBzb4bdaG5pfPlz0ur9jDZLPZslftAW+5fGLtNMnIYy7s5sK70tf
         Z9InRZxaEm86FakL09BcpZwBXi1RYMnmQH6UGbNc6+CRqDSVuNA/EZz4+Cny08rkRM
         Wwb8wGfqrHq/z6YI2cUNSQG5Dj1eGDJr40VV7ans=
Date:   Fri, 13 Dec 2019 10:17:49 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Priit Laes <plaes@plaes.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Add quirk for Xin-Mo Dual Controller
In-Reply-To: <20191130222209.5084-1-plaes@plaes.org>
Message-ID: <nycvar.YFH.7.76.1912131017100.4603@cbobk.fhfr.pm>
References: <20191130222209.5084-1-plaes@plaes.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 1 Dec 2019, Priit Laes wrote:

> Without the quirk, joystick shows up as single controller
> for both first and second player pads/pins.
> 
> Signed-off-by: Priit Laes <plaes@plaes.org>
> ---
>  drivers/hid/hid-quirks.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index c50bcd967d99..2007e31837ad 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -173,6 +173,7 @@ static const struct hid_device_id hid_quirks[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_WALTOP, USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP_LTD2, USB_DEVICE_ID_SMARTJOY_DUAL_PLUS), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_WISEGROUP, USB_DEVICE_ID_QUAD_USB_JOYPAD), HID_QUIRK_NOGET | HID_QUIRK_MULTI_INPUT },
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_XIN_MO, USB_DEVICE_ID_XIN_MO_DUAL_ARCADE), HID_QUIRK_MULTI_INPUT },

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs

