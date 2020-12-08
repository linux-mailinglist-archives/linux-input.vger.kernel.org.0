Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121622D20DD
	for <lists+linux-input@lfdr.de>; Tue,  8 Dec 2020 03:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbgLHCc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 21:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726479AbgLHCc0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 21:32:26 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CDB3C061749
        for <linux-input@vger.kernel.org>; Mon,  7 Dec 2020 18:31:46 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id t22so17390533ljk.0
        for <linux-input@vger.kernel.org>; Mon, 07 Dec 2020 18:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UIh58Pb5soqB/2URacD1gmXz7qZ0Z7IQDExviOSyhic=;
        b=iDcHOGqyGiiRoEYnWYx84jc8JcAnQe0Eh4cD6j3DEvq9xnAd/EnD9TmU8CsCvZGEvp
         aC2Zk8JIc3PEHcVrThRNYarfMX9E4WDxU6Yj8VhBctmEC6URrQo5OXEcIutlMsJbuf5I
         OhAW4piVPqKsXUV0zSDCDDnWipuEq+S7BuXRp3HoAZZ4FTMr8ixIfL63t5bImABYffbG
         lDx03L4K2NQ+LleYIawtv8jcSmEgPOcKrVCPJadA70dUb/Dkd+eUbqBfRBs0zh/5TT9H
         fQ++TiObj2rX40SLlvOl3AZDTVbdHTuYDjwkIIs+n7YUYSx3uouobMzzwH0lSIM4PY4C
         /YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UIh58Pb5soqB/2URacD1gmXz7qZ0Z7IQDExviOSyhic=;
        b=MbSraSZlXT+G2VQQiRvUpUm9AxDLGGkyqT8xeunZuPZequDCDU61Zv1faQovOK6SZl
         9p1r0upjbdoksNgrlJI7wU7LJcRIL2JKaIi3qlfg9Tttz1fne+ynG1cM0FfxL84Qy3D2
         07L5q9F/VyV/KACYfrUDmfOTbw316gV8tEXRlf5mjWSgE7NykD41ZriFrxL9mu+6nF2+
         evTkKUO6zk5qJXd+iJW/TKVVnI+FpMlTjul3Z4SVYK0dCAC4jdNPjvnRv/QqVZxksbjC
         7rc1gG+rRpvF69Zw9eZjJbA7Fq1Lf+Gxddxfsrlb/a0YNb/POifW5ayrSFATQcrSbluO
         PjWg==
X-Gm-Message-State: AOAM533EZiNXUpDJkPjF3jD+wH00CqPq7vTakun9rZb8PpSzU1lVtvek
        K2+d/pBOP6weoSGdH+TFEwtgUgtAAiVcWOeQncVXYt5jqBE=
X-Google-Smtp-Source: ABdhPJzRV+JyH+HG1WmER0OjAXXdUN6tzICF2hvRVp2zkBTZAOHPyX8oN2pIQRL3JKZveDv01yRMfMr8ubGaSG7SJF8=
X-Received: by 2002:a2e:9cd3:: with SMTP id g19mr9357628ljj.188.1607394704491;
 Mon, 07 Dec 2020 18:31:44 -0800 (PST)
MIME-Version: 1.0
References: <X87aOaSptPTvZ3nZ@google.com>
In-Reply-To: <X87aOaSptPTvZ3nZ@google.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 7 Dec 2020 18:31:08 -0800
Message-ID: <CACK8Z6Fycg-U4vmUiL53Cc0uCuyKgsaqkdkJVRNKvw4w-YTCDA@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb - send 'scancodes' in addition to key events
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 7, 2020 at 5:43 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> To let userspace know what 'scancodes' should be used in EVIOCGKEYCODE
> and EVIOCSKEYCODE ioctls, we should send EV_MSC/MSC_SCAN events in
> addition to EV_KEY/KEY_* events. The driver already declared MSC_SCAN
> capability, so it is only matter of actually sending the events.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
FWIW, Acked-by: Rajat Jain <rajatja@google.com>


> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 023f083dadd3..354d74d62f05 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -184,6 +184,7 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>                                         "changed: [r%d c%d]: byte %02x\n",
>                                         row, col, new_state);
>
> +                               input_event(idev, EV_MSC, MSC_SCAN, pos);
>                                 input_report_key(idev, keycodes[pos],
>                                                  new_state);
>                         }
> --
> 2.29.2.576.ga3fc446d84-goog
>
>
> --
> Dmitry
