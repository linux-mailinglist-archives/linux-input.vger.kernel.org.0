Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 819687A4EC5
	for <lists+linux-input@lfdr.de>; Mon, 18 Sep 2023 18:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjIRQ03 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Sep 2023 12:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjIRQJQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Sep 2023 12:09:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63D43C2A
        for <linux-input@vger.kernel.org>; Mon, 18 Sep 2023 09:08:01 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CA2C3278E;
        Mon, 18 Sep 2023 14:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695048525;
        bh=kxIm2dAp6sXu35y7g3gIJiifSayTM3RyGs7vGLhesX4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=crgNw+5KMKjPtCq5ynownhEdXUKOP57AB9Z58m8Hekcx+KLzP8e/FKzW38NC7DwpZ
         E3TyjhlPhiI/nPiP7CF7TrqYJ2V9056P7dzJ1oFd4HorYz/TOBVnjoR/SpUw9xKRuH
         PGsqjlNKJrTaZLd9q5FOeeieO2cvigt5msLOj5fPwv+AjB82yTuaLOu2fJuEMheWwU
         XyDrJXyFb8qOLZapimpU4z591YxN0/ynfV4FJRYnH1DQFaPYPWrAPLv/JAphin6xty
         OMUCsHRKfs83bb6s8KkNoP5tekKc4v1mH2TbBykB7wH6t++AOIefpCY6FC6mCZGxzQ
         jJ0ObCQIoHmWw==
Date:   Mon, 18 Sep 2023 16:48:42 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add Bluetooth ID for the Logitech
 M720 Triathlon mouse
In-Reply-To: <20230827222438.43717-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2309181648370.14216@cbobk.fhfr.pm>
References: <20230827222438.43717-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 28 Aug 2023, Hans de Goede wrote:

> Using hidpp for the M720 adds battery info reporting and hires
> scrolling support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index 129b01be488d..3786fcc93da0 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4640,6 +4640,8 @@ static const struct hid_device_id hidpp_devices[] = {
>  	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb008) },
>  	{ /* MX Master mouse over Bluetooth */
>  	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012) },
> +	{ /* M720 Triathlon mouse over Bluetooth */
> +	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb015) },
>  	{ /* MX Ergo trackball over Bluetooth */
>  	  HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
>  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e) },

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

