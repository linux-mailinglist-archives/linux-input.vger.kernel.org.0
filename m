Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0237447135
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 03:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234019AbhKGCTp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Nov 2021 22:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbhKGCTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Nov 2021 22:19:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5A4C061570;
        Sat,  6 Nov 2021 19:17:02 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id g184so11818113pgc.6;
        Sat, 06 Nov 2021 19:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=gg2o6Jpi3G1bwmp5OBY9g1sVftj0DmiTSSSqsnFCp9I=;
        b=nt+WohtfbSOXNAReHWLuxuTkhwvbBVXUBM6dCuqc/GZBBq9XAijH5X5lJZXz68ks2A
         9g4lJeLquYBfoSFwtYog5k0ZBJmzmPsooSpQUsGBHtcQIDRe/Qb+cOYF8JWAZUtRsZjt
         gCVIYZHpOPg5Nn2jlT/xGyJqOvvGazH8b0q6tSYhSQTC9RRMec5ZlMmdNSM019SfFbLI
         KgssZsJTGM8H7nFG45TcpVBkUwRQTK6FKl8GJUm16PWmdidI4YsrmrIMtp+d6nMrgIxj
         qwIlumYPjDlGgLmzKeZF1DdASdoSh2cvCAl51z5rzsbT9B541WUXL7su99cScPHseXtZ
         boIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=gg2o6Jpi3G1bwmp5OBY9g1sVftj0DmiTSSSqsnFCp9I=;
        b=NPEOIWdhq2eL5EVOuhtSpr3x83TGNB6ynfJW7iDu5qYoQp04GhKiChDwHH4koj9EOa
         512FFoI1MNu2YT0AwiB2q99KaqWLmjCeBJTNHQ4w0tUNS8MDbCNYYB9VXKR2XzZajz8z
         rlx/CaqLom6VzS8LN2H5kG2gQ6qpXi7MYMJDs01/YBxe8TLlogFMQPMP+8bNA+gi//1v
         YTYAvZrGNqDvUiTINjbS7RIbyk22srLFIiyaXM29c9FEErTV3CKkAxc/PRTcJCfhjDt4
         5k/cLCEYMoPWjBIToqzFGDAQvkbhFxbAkNkJUcSvIqeQ+E59Rr2vPPOTKYmw8HLiQ1F3
         qjzg==
X-Gm-Message-State: AOAM531F/HluKYOJevPWiOPmayvKCxeSw49OPihnmOuPtIjv63vj10uR
        Tl8Q+74Nc5V0XCNvwXIzYNY=
X-Google-Smtp-Source: ABdhPJwbeOIXK8GTz+FBuWHsXLeYHK8BmThkDPTtCjz+V144mJrQGUrjqNc9WsBj5D9jKBerhIVEfg==
X-Received: by 2002:a65:460f:: with SMTP id v15mr17547110pgq.430.1636251420719;
        Sat, 06 Nov 2021 19:17:00 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:53c2:e6fc:3a1a:b644])
        by smtp.gmail.com with ESMTPSA id s15sm4706443pjs.51.2021.11.06.19.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 19:16:59 -0700 (PDT)
Date:   Sat, 6 Nov 2021 19:16:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Brent Roman <brent@mbari.org>
Subject: Re: [PATCH] HID: input: set usage type to key on keycode remap
Message-ID: <YYc3GYKgfKDQ0AYj@google.com>
References: <20211028205542.499280-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211028205542.499280-1-linux@weissschuh.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Oct 28, 2021 at 10:55:42PM +0200, Thomas Weiﬂschuh wrote:
> When a scancode is manually remapped that previously was not handled as
> key, then the old usage type was incorrectly reused.
> 
> This caused issues on a "04b3:301b IBM Corp. SK-8815 Keyboard" which has
> marked some of its keys with an invalid HID usage.  These invalid usage
> keys are being ignored since support for USB programmable buttons was
> added.
> 
> The scancodes are however remapped explicitly by the systemd hwdb to the
> keycodes that are printed on the physical buttons.  During this mapping
> step the existing usage is retrieved which will be found with a default
> type of 0 (EV_SYN) instead of EV_KEY.
> 
> The events with the correct code but EV_SYN type are not forwarded to
> userspace.
> 
> This also leads to a kernel oops when trying to print the report descriptor
> via debugfs.  hid_resolv_event() tries to resolve a EV_SYN event with an
> EV_KEY code which leads to an out-of-bounds access in the EV_SYN names
> array.
> 
> Fixes: bcfa8d1457 ("HID: input: Add support for Programmable Buttons")
> Fixes: f5854fad39 ("Input: hid-input - allow mapping unknown usages")
> Reported-by: Brent Roman <brent@mbari.org>
> Tested-by: Brent Roman <brent@mbari.org>
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Makes sense.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

> ---
>  drivers/hid/hid-input.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 4b5ebeacd283..21d8cc64064d 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -160,6 +160,7 @@ static int hidinput_setkeycode(struct input_dev *dev,
>  	if (usage) {
>  		*old_keycode = usage->type == EV_KEY ?
>  				usage->code : KEY_RESERVED;
> +		usage->type = EV_KEY;
>  		usage->code = ke->keycode;
>  
>  		clear_bit(*old_keycode, dev->keybit);
> 
> base-commit: 42d43c92fc577dca59ed74aec7868abec8d6ca6e
> -- 
> 2.33.1
> 

Thanks.

-- 
Dmitry
