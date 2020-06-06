Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7558C1F081D
	for <lists+linux-input@lfdr.de>; Sat,  6 Jun 2020 20:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgFFSSL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Jun 2020 14:18:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbgFFSSJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Jun 2020 14:18:09 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F526C03E96A
        for <linux-input@vger.kernel.org>; Sat,  6 Jun 2020 11:18:09 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t16so4995542plo.7
        for <linux-input@vger.kernel.org>; Sat, 06 Jun 2020 11:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a9OiYqPM05X3ie6GoB+zz+1VwRMIF6KQwKi1LpEc1X4=;
        b=UZEHXdJ3nBvT5E3QHXa/y4UB955BykBHCEOxq1uQ6fdPGY3JlowtY/vf3uqmRsCUjM
         dzOFz3cBrWe1V4zGRu4mNSFkYP00av2+ktZ4NFVwx3fVJ1psSshCAkYrt4W765wEmVht
         aY6uhuA969wVMEmwzCs8ZZtfTlMsSfLP7KdECTjtU83WWCTzpkDAYpylsyDa0WXb4HRs
         mtloLgVcsxi/AdZ+cKySkMbOuJhLxXNKV1URfCwKJFs/McQK6f+cqXpX/p5EVJl8XebR
         O1Z3EJ+Zo8NCirWuph23YhFHV9tvElOB33fML7kYfIeqsLOULeP4Fh1RirYF8dLx7XE2
         g/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a9OiYqPM05X3ie6GoB+zz+1VwRMIF6KQwKi1LpEc1X4=;
        b=kNiQqzRPHu55rFWSxY8OJ3hndWDRDXAR+W6QFZa+DshidMwz3BBfkxh2+qBVbyPgk6
         EcSO6QUgyy+/QyTXpoJhXq1JQuUJUe9ak1ZSy/JdAaOnxP7GLkKw5jN/zFpqHR22v8w+
         QcVK3nn/q2u/NDvkaYMatTimq01HDB9bFrkFGj0O6xyOOzM8Ifk5xGNMI16Qiq80xWXc
         q+1VlsbntLP+cplBDFE+McLAXIllnoByD8vTV4DKCVj2ZbYtMdCRyOuMgeql9nBQjlv9
         W5h98tw/hsV2pRrtAFOZciVQ0QB0SeZ15sVuesLHlKNoPTypbFB/J057AO/qWlZgbIWI
         ByLw==
X-Gm-Message-State: AOAM531kSYyfmFyTD5R7QP+JAGDxgYcstJqMVgCOUE90Bx5IOtHwotiw
        uCqYdCh/AZXebtcag6TnF14=
X-Google-Smtp-Source: ABdhPJy1yUvcXnMNSSYPVr07iKmzhdByRV1xr9qN1awDXWYyoCkG1Q0EmiNfALRe1FMorFrCZj26aA==
X-Received: by 2002:a17:902:9043:: with SMTP id w3mr13912479plz.250.1591467488464;
        Sat, 06 Jun 2020 11:18:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id o1sm2928082pfu.70.2020.06.06.11.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2020 11:18:08 -0700 (PDT)
Date:   Sat, 6 Jun 2020 11:18:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-input@vger.kernel.org,
        Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Javi Ferrer <javi.f.o@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH] Input: mms114: don't report 0 pressure while still
 tracking contact(s)
Message-ID: <20200606181806.GR89269@dtor-ws>
References: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200606035017.7271-1-GNUtoo@cyberdimension.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Denis,

On Sat, Jun 06, 2020 at 05:50:17AM +0200, Denis 'GNUtoo' Carikli wrote:
> In the middle of a sliding gesture, we manage to have events
> that look like that:
>     Event: time 1571859641.595517, -------------- SYN_REPORT ------------
>     Event: time 1571859641.606593, type 3 (EV_ABS), code 54 (ABS_MT_POSITION_Y), value 1193
>     Event: time 1571859641.606593, type 3 (EV_ABS), code 48 (ABS_MT_TOUCH_MAJOR), value 21
>     Event: time 1571859641.606593, type 3 (EV_ABS), code 58 (ABS_MT_PRESSURE), value 0
>     Event: time 1571859641.606593, type 3 (EV_ABS), code 1 (ABS_Y), value 1193
>     Event: time 1571859641.606593, type 3 (EV_ABS), code 24 (ABS_PRESSURE), value 0
>     Event: time 1571859641.606593, -------------- SYN_REPORT ------------
> 
> In such cases, we still have a valid ABS_MT_TRACKING_ID along
> with an ABS_MT_TOUCH_MAJOR that is > 0, which both indicates
> that the sliding is still in progress.
> 
> However in Documentation/input/multi-touch-protocol.rst, we
> have:
>     ABS_MT_PRESSURE
>         The pressure, in arbitrary units, on the contact
>         area. May be used instead of TOUCH and WIDTH for
>         pressure-based devices or any device with a spatial
>         signal intensity distribution.
> 
> Because of that userspace may consider an ABS_MT_PRESSURE
> of 0 as an indication that the sliding stopped. This has
> side effects such as making it difficult to unlock the
> screen under Android.
> 
> This fix was tested on the following devices:
> - GT-I9300 with a glass screen protection
> - GT-I9300 without any screen protection
> - GT-N7105 with a glass screen protection
> 
> Reported-by: Javi Ferrer <javi.f.o@gmail.com>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
> ---
>  drivers/input/touchscreen/mms114.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> index 2ef1adaed9af..adc18cd9a437 100644
> --- a/drivers/input/touchscreen/mms114.c
> +++ b/drivers/input/touchscreen/mms114.c
> @@ -183,7 +183,10 @@ static void mms114_process_mt(struct mms114_data *data, struct mms114_touch *tou
>  	if (touch->pressed) {
>  		touchscreen_report_pos(input_dev, &data->props, x, y, true);
>  		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, touch->width);
> -		input_report_abs(input_dev, ABS_MT_PRESSURE, touch->strength);
> +		if (touch->strength) {
> +			input_report_abs(input_dev, ABS_MT_PRESSURE,
> +					 touch->strength);

So this will result in userspace believing that pressure is unchanged
from the previous packet. I wonder if we should report

		input_report_abs(input_dev, ABS_MT_PRESSURE,
				 max(touch->strength, 1));

instead.

Could you please post longer sequence from evtest leading to the packet
with 0 pressure?

Thanks.

-- 
Dmitry
