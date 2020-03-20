Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3483218DB91
	for <lists+linux-input@lfdr.de>; Sat, 21 Mar 2020 00:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgCTXMT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 19:12:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:37820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726970AbgCTXMT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 19:12:19 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 410012072C;
        Fri, 20 Mar 2020 23:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584745939;
        bh=xITPe9kD/gj+fOPdGOTe6A22zquscdQ0ksE7rlEJUYc=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=ZK/osN8QvYi74CFYtcsfqRHNvB1hhopgRkWTL4IJkoGd5Hk0eFRVC/Q8xgXJza0Wj
         v2mcrjxqjGRVvl/E5cmvaCyX18mxSKD0pB0PLu7qSkZpFAHaefcAuLj8CiajykK0b+
         yAhNAo1Xm1p1/3JqZx2oLfn0qrtjFovIO15PR45A=
Date:   Sat, 21 Mar 2020 00:12:16 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: lg-g15: Do not fail the probe when we fail to
 disable F# emulation
In-Reply-To: <20200315173449.24857-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2003210011070.19500@cbobk.fhfr.pm>
References: <20200315173449.24857-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 15 Mar 2020, Hans de Goede wrote:

> By default the G1-G12 keys on the Logitech gaming keyboards send
> F1 - F12 when in "generic HID" mode.
> 
> The first thing the hid-lg-g15 driver does is disable this behavior.
> 
> We have received a bugreport that this does not work when the keyboard
> is connected through an Aten KVM switch. Using a gaming keyboard with
> a KVM is a bit weird setup, but still we can try to fail a bit more
> gracefully here.
> 
> On the G510 keyboards the same USB-interface which is used for the gaming
> keys is also used for the media-keys. Before this commit we would call
> hid_hw_stop() on failure to disable the F# emulation and then exit the
> probe method with an error code.
> 
> This not only causes us to not handle the gaming-keys, but this also
> breaks the media keys which is a regression compared to the situation
> when these keyboards where handled by the generic hidinput driver.
> 
> This commit changes the error handling to clear the hiddev drvdata
> (to disable our .raw_event handler) and then returning from the probe
> method with success.
> 
> The net result of this is that, when connected through a KVM, things
> work as well as they did before the hid-lg-g15 driver was introduced.
> 
> Fixes: ad4203f5a243 ("HID: lg-g15: Add support for the G510 keyboards' gaming keys")
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1806321
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-lg-g15.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
> index 8a9268a5c66a..ad4b5412a9f4 100644
> --- a/drivers/hid/hid-lg-g15.c
> +++ b/drivers/hid/hid-lg-g15.c
> @@ -803,8 +803,10 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	if (ret < 0) {
> -		hid_err(hdev, "Error disabling keyboard emulation for the G-keys\n");
> -		goto error_hw_stop;
> +		hid_err(hdev, "Error %d disabling keyboard emulation for the G-keys, falling back to generic hid-input driver\n",
> +			ret);
> +		hid_set_drvdata(hdev, NULL);
> +		return 0;
>  	}
>  
>  	/* Get initial brightness levels */

This is now (for a few days actually, but seems like I forgot to send the 
e-mail) queued in for-5.6/upstream-fixes (but it might go in only for 5.7 
in case there is nothing urgent popping up in that branch in the coming 
days ... we'll see).

Thanks Hans,

-- 
Jiri Kosina
SUSE Labs

