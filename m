Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC3015AA5F
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgBLNuF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:50:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:42764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgBLNuF (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:50:05 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 09E45206B6;
        Wed, 12 Feb 2020 13:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581515404;
        bh=mA8DPi5DYAvxD0Qw8UpsSuYQBQtNLa/YCFn6ogzjGkA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=vFtc44HKg8O0xg2Z4aod+0ZCl6DTRbc3lm8zBQM5/0qmI2yzbNQysxyBVJWoIxn0y
         CjU3CGqrm1kx1OQJz05mYKzJxTMzW+8KYFiRuU49HsGQAUOLfJvX23n2phl622+5k6
         Rfvt7ygtIN/Tb2ZwHaxu8DlQDd+DVsEkjBIft1uI=
Date:   Wed, 12 Feb 2020 14:50:01 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-dj: add support for the static device in
 the Powerplay mat/receiver
In-Reply-To: <20200115201811.3271284-1-lains@archlinux.org>
Message-ID: <nycvar.YFH.7.76.2002121449191.3144@cbobk.fhfr.pm>
References: <20200115201811.3271284-1-lains@archlinux.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 15 Jan 2020, Filipe Laíns wrote:

> The Logitech G Powerplay has a lightspeed receiver with a static HID++
> device with ID 7 attached to it to. It is used to configure the led on
> the mat. For this reason I increased the max number of devices.
> 
> Signed-off-by: Filipe Laíns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index bb50d6e7745b..79294b873057 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -16,11 +16,11 @@
>  #include <asm/unaligned.h>
>  #include "hid-ids.h"
>  
> -#define DJ_MAX_PAIRED_DEVICES			6
> +#define DJ_MAX_PAIRED_DEVICES			7
>  #define DJ_MAX_NUMBER_NOTIFS			8
>  #define DJ_RECEIVER_INDEX			0
>  #define DJ_DEVICE_INDEX_MIN			1
> -#define DJ_DEVICE_INDEX_MAX			6
> +#define DJ_DEVICE_INDEX_MAX			7
>  
>  #define DJREPORT_SHORT_LENGTH			15
>  #define DJREPORT_LONG_LENGTH			32
> @@ -980,6 +980,11 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
>  		break;
>  	}
>  
> +	/* custom receiver device (eg. powerplay) */
> +	if (hidpp_report->device_index == 7) {
> +		workitem.reports_supported |= HIDPP;
> +	}
> +

I guess we can't do anything else than to trust Logitech that they will 
not assign conflicting device_index ID in the future to something that 
will not be HID++, right?

Or is this properly documented somewhere?

Thanks,

-- 
Jiri Kosina
SUSE Labs

