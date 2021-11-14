Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F9044F8BF
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 16:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231264AbhKNPhA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 10:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbhKNPg7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 10:36:59 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857BFC061746;
        Sun, 14 Nov 2021 07:34:04 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u1so25429362wru.13;
        Sun, 14 Nov 2021 07:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=UxG9jqXZ2rrcXJetB9n01D1jBBkOp/rsJEYkSdG9ry4=;
        b=MdKV1UKQgUWKcUFWCWserkdOxn3wZzyvJbKvXm0GL+9TcCXn/ACTf54pwAwu7Wv1Bt
         ixjKMQ9NMi/GAt4qEfrtyEHQBdWVTYq2sPPZS+E1Cuqo9/a4L3oX9u1dwMfCCcDs4NP2
         e9F3RmT819C4ci3p7RhgL3BJOLlQ7BJvrgGAJiW0SW0TRGyaCEpNuR4lbApDUnF/Lm1g
         xCby7e/kxScQc7QFz7lS6+Brc41664PxfbnFm9Qs4DF62mY1QCHIUe2KR+4DCVaJ6Eeg
         GR/ppH9ssla+R1Sv7Ebof+oWFyldNE4wn/gNYYxgsnBOiC0v308KcK5tGPlfI83Rm4Bs
         mCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=UxG9jqXZ2rrcXJetB9n01D1jBBkOp/rsJEYkSdG9ry4=;
        b=e4RHIg7gKbAz1nzbVwtvwKWWakyKFXeWS0y7C/rsKbv49KyBAEsO1eNAlg2JezeDmh
         X5utKO+590rh4EmoZ0CwgptK10ekWpYb78N3T46cLhG/Wq+8hrRvUquJTTCv0DxFg0KS
         8MuRI/0gplXKUmhYUb3tba/1CmxoPTDRQyjI9o/tKDmZ8POODDxuHEptNDi1r8/xw15c
         N64th9ksicu/eSgXN71O4okKB+toVCASuRp20eQTK5NC9psiRVq7THGumFTf5yKQtryo
         tzc3UKiDGqct3DubRNG8JALC/P0aROvaD5OdfDe5+DPTuqd2TIp7Pqcy8YBN8hcN9/qV
         Fvzw==
X-Gm-Message-State: AOAM533xLZN/OEWfciUwAwOk/69yU0AAAosooPcYOXTHVRcXNkvCWJfn
        GQAkl01GiS1Ge94s2RKAqYc=
X-Google-Smtp-Source: ABdhPJzL8TIq0WQFpuym+VOGp9DoCnORdpZMOEp44eTDhD8r4NaguH61Ojm0/F2e99XfRnelifFUkQ==
X-Received: by 2002:a05:6000:12d2:: with SMTP id l18mr39062733wrx.289.1636904042999;
        Sun, 14 Nov 2021 07:34:02 -0800 (PST)
Received: from elementary ([94.73.36.41])
        by smtp.gmail.com with ESMTPSA id m2sm16941868wml.15.2021.11.14.07.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 07:34:02 -0800 (PST)
Date:   Sun, 14 Nov 2021 16:33:54 +0100
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Claudia Pellegrino <linux@cpellegrino.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: magicmouse: prevent division by 0 on scroll
Message-ID: <20211114153354.GA7246@elementary>
References: <20211114025327.146897-1-linux@cpellegrino.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211114025327.146897-1-linux@cpellegrino.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Nov 14, 2021 at 03:53:27AM +0100, Claudia Pellegrino wrote:
> In hid_magicmouse, if the user has set scroll_speed to a value between
> 55 and 63 and scrolls seven times in quick succession, the
> step_hr variable in the magicmouse_emit_touch function becomes 0.
> 
> That causes a division by zero further down in the function when
> it does `step_x_hr /= step_hr`.
> 
> To reproduce, create `/etc/modprobe.d/hid_magicmouse.conf` with the
> following content:
> 
> ```
> options hid_magicmouse scroll_acceleration=1 scroll_speed=55
> ```
> 
> Then reboot, connect a Magic Mouse and scroll seven times quickly.
> The system will freeze for a minute, and after that `dmesg` will
> confirm that a division by zero occurred.
> 
> Enforce a minimum of 1 for the variable so the high resolution
> step count can never reach 0 even at maximum scroll acceleration.
> 
> Fixes: d4b9f10a0eb6 ("HID: magicmouse: enable high-resolution scroll")
> 
> Signed-off-by: Claudia Pellegrino <linux@cpellegrino.de>
> ---
>  drivers/hid/hid-magicmouse.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/hid-magicmouse.c b/drivers/hid/hid-magicmouse.c
> index 686788ebf3e1..d7687ce70614 100644
> --- a/drivers/hid/hid-magicmouse.c
> +++ b/drivers/hid/hid-magicmouse.c
> @@ -256,8 +256,11 @@ static void magicmouse_emit_touch(struct magicmouse_sc *msc, int raw_id, u8 *tda
>  		unsigned long now = jiffies;
>  		int step_x = msc->touches[id].scroll_x - x;
>  		int step_y = msc->touches[id].scroll_y - y;
> -		int step_hr = ((64 - (int)scroll_speed) * msc->scroll_accel) /
> -			      SCROLL_HR_STEPS;
> +		int step_hr =
> +			max_t(int,
> +			      ((64 - (int)scroll_speed) * msc->scroll_accel) /
> +					SCROLL_HR_STEPS,
> +			      1);
>  		int step_x_hr = msc->touches[id].scroll_x_hr - x;
>  		int step_y_hr = msc->touches[id].scroll_y_hr - y;
>  
> -- 
> 2.33.1
> 

Hi Caludia,

Thanks for ccing me.

I can confirm both that the bug is present and that your patch fixes it.

Tested-by: José Expósito <jose.exposito89@gmail.com>

Best wishes,
Jose
