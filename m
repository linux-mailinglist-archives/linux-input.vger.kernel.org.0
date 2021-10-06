Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513D14245B5
	for <lists+linux-input@lfdr.de>; Wed,  6 Oct 2021 20:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbhJFSKt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Oct 2021 14:10:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhJFSKs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Oct 2021 14:10:48 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E81C061746;
        Wed,  6 Oct 2021 11:08:56 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id 187so3051816pfc.10;
        Wed, 06 Oct 2021 11:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QyNm5BpemRIxv+xxQfUsI80iHfW6yb7mlL0VKHbA908=;
        b=FIya0BGV3biCJzthjELufMVsOjYj8X/rXMcp2M4OopNxQD4LGD1wnbMjcW4vLsIdBR
         OUcFRwouOpTqKhilmOA52foFwjk5mkq2qZR2BnVzZ0Ql3fF4WlknfVEMGPSoJrpHp4nB
         DLY6wn5kTWMYmGRQ1JuaibprJk0NgJAU0ILjPjOQShZMH90dA0t3Akt1rhawI2Bgp8kr
         m2giBc1pNfOW4ZmTvoDyIiq9UlahSYjPdgjq8yhRsbYFBiCMY5M6Cuu/ppvafZ9A1GiX
         T5vKFKel9EHJkRAW6ZR3KhI42aWR1v3GaBbDtc1R9St1lqtmfSxUGxpGxj65C9KDUyIZ
         OD7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QyNm5BpemRIxv+xxQfUsI80iHfW6yb7mlL0VKHbA908=;
        b=3s9pC7ImhejAwpe/HuRwON6RWVv9vG6cF/jeNhP0EUo090eCDm4dsKapMH1kZYY0Wv
         qSYR85Ha5GijXvd2nishorEYAdu1TGsPwwOYcomX8srSW0F5QrhQBywt9Rdx5g9FIES/
         ZJDuHUVSAvt7/hsPLZ2s+njVV36PIBRd1eWvoVOwNLb32RaWi8CE8oYbHRId2XNoR3Ix
         djQW+aCQyO/LbDsnKqayGknz5+QhTHZky/VYnP9HiVZYWMKes1piYSKUQwwpzvLdEcGI
         dGDGGtQj5RYavgHu6sk0HdT0dsPzj5CzZcrKImmYYyQo8TbMrD+r006B0w9PY52TZ8hk
         olRQ==
X-Gm-Message-State: AOAM532n5l2w5DCaRqIkqXigvO9fQy8WCyRvQbKrqN5CICleoiP4vtze
        NJ43oFOhy5KFR+6ogYnCV1jRNM3y0hM=
X-Google-Smtp-Source: ABdhPJzvoep8PUXmXq/4RuDCelfPInblwyCmINJgvgP0AK6pz2J+Bjt50qF7H0JujKZj4dY2PBlppQ==
X-Received: by 2002:a65:6554:: with SMTP id a20mr106370pgw.107.1633543735899;
        Wed, 06 Oct 2021 11:08:55 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:18f1:d20e:edb5:c807])
        by smtp.gmail.com with ESMTPSA id h9sm6248534pjg.9.2021.10.06.11.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 11:08:54 -0700 (PDT)
Date:   Wed, 6 Oct 2021 11:08:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     John Keeping <john@metanate.com>
Cc:     linux-input@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: st1232 - increase "wait ready" timeout
Message-ID: <YV3mNMnWmUsasZ2h@google.com>
References: <20210929152609.2421483-1-john@metanate.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929152609.2421483-1-john@metanate.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 29, 2021 at 04:26:08PM +0100, John Keeping wrote:
> I have a ST1633 touch controller which fails to probe due to a timeout
> waiting for the controller to become ready.  Increasing the minimum
> delay to 100ms ensures that the probe sequence completes successfully.
> 
> The ST1633 datasheet says nothing about the maximum delay here and the
> ST1232 I2C protocol document says "wait until" with no notion of a
> timeout.
> 
> Since this only runs once during probe, being generous with the timout
> seems reasonable and most likely the device will become ready
> eventually.

I'll apply this, but I wonder if it would not make sense to mark the
driver as preferring asynchronous probing, so we do not delay
initializing other devices while we are waiting for the touch controller
to reset? Could you send me a patch for that?

> 
> (It may be worth noting that I saw this issue with a PREEMPT_RT patched
> kernel which probably has tighter wakeups from usleep_range() than other
> preemption models.)
> 
> Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
> Signed-off-by: John Keeping <john@metanate.com>
> ---
>  drivers/input/touchscreen/st1232.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
> index 6abae665ca71..9d1dea6996a2 100644
> --- a/drivers/input/touchscreen/st1232.c
> +++ b/drivers/input/touchscreen/st1232.c
> @@ -92,7 +92,7 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
>  	unsigned int retries;
>  	int error;
>  
> -	for (retries = 10; retries; retries--) {
> +	for (retries = 100; retries; retries--) {
>  		error = st1232_ts_read_data(ts, REG_STATUS, 1);
>  		if (!error) {
>  			switch (ts->read_buf[0]) {
> -- 
> 2.33.0
> 

Thanks.

-- 
Dmitry
