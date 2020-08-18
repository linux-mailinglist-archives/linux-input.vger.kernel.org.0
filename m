Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4064D248E0A
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 20:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgHRShm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 14:37:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:43450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726552AbgHRShm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 14:37:42 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 637462075E;
        Tue, 18 Aug 2020 18:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597775861;
        bh=ZEvs8o9Cs9Bxz+/GwLoeLnxd525MlEW+yK6EBKlDt1o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ODL3DEpw13zKXtA0vHLJKqI53fQ9cznNLp3bHXTZgl4l6PwaNbJmIsEDufkdYsy0X
         3mMx3fMxel7+ZZ/J3jUAnFdDjcnIfOoARKFZSHUCkgELy1pVlIE4nTZueA+nzkoJRG
         hGugQm6UDewi3euFPIm9zK8dTpL5MEgtVZ9onZCw=
Date:   Tue, 18 Aug 2020 20:37:38 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Luke Jones <luke@ljones.dev>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        rydberg@bitmath.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH V5] HID: asus: add support for ASUS N-Key keyboard
In-Reply-To: <20200818075916.52267-1-luke@ljones.dev>
Message-ID: <nycvar.YFH.7.76.2008182034140.27422@cbobk.fhfr.pm>
References: <20200818075916.52267-1-luke@ljones.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 18 Aug 2020, Luke Jones wrote:

> From: Luke D Jones <luke@ljones.dev>
> 
> Enable missing functionality of the keyboard found in many ASUS
> Zephyrus laptops: Fn key combos and hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
> Two input event codes are added for keyboard LED mode switching
> prev/next.
> 
> The keyboard has many of the same key outputs as the existing G752
> keyboard including a few extras, and varies a little between laptop
> models.
> 
> Additionally the keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.
> 
> Misc changes in scope: update some hardcoded comparisons to use an
> available define, change "Mic Toggle" to use a keycode that works.
> 
> Signed-off-by: Luke D Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c                     | 165 ++++++++++++++++++---
>  drivers/hid/hid-ids.h                      |   1 +
>  include/linux/platform_data/x86/asus-wmi.h |   2 +
>  include/uapi/linux/input-event-codes.h     |   7 +

CCing Dmitry for the KEY_KBDILLUM_MODE_PREV / KEY_KBDILLUM_MODE_NEXT 
additions. Dmitry, OK by you please?

[ ... snip ... ]

> -	ret = hid_hw_raw_request(hdev, FEATURE_KBD_REPORT_ID, dmabuf,
> +	// The report ID should be set from the incoming buffer due to LED and key
> +	// interfaces having different pages

Please use the kernel comment style (/* ... */) here.

[ ... snip ... ]
> @@ -751,14 +841,14 @@ static int asus_input_mapping(struct hid_device *hdev,
>  	     usage->hid == (HID_UP_GENDEVCTRLS | 0x0026)))
>  		return -1;
> 
> -	/* ASUS-specific keyboard hotkeys */
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000) {
> +	/* ASUS-specific keyboard hotkeys and led backlight */
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR) {
>  		switch (usage->hid & HID_USAGE) {
>  		case 0x10: asus_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
>  		case 0x20: asus_map_key_clear(KEY_BRIGHTNESSUP);		break;
>  		case 0x35: asus_map_key_clear(KEY_DISPLAY_OFF);		break;
>  		case 0x6c: asus_map_key_clear(KEY_SLEEP);		break;
> -		case 0x7c: asus_map_key_clear(KEY_MICMUTE);		break;
> +		case 0x7c: asus_map_key_clear(KEY_F20);		break;

This change doesn't seem to be mentioned in the changelog; why is it OK in 
general case for other devices sharing this codepath?

Otherwise the patch looks good to me. Thanks,

-- 
Jiri Kosina
SUSE Labs

