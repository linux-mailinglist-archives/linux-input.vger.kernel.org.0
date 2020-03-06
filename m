Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1DBE17C4CC
	for <lists+linux-input@lfdr.de>; Fri,  6 Mar 2020 18:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgCFRpn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Mar 2020 12:45:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39292 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726090AbgCFRpn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Mar 2020 12:45:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583516742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CMTg0TedaIFOhx4o5LKmMRYaCsUrpsNojDNW2nk+DDU=;
        b=Uslm4aXIqPcbneB/f0nldQek8/7fHw7R22yWDcHr+rw+QtE3Af6skCbh/L6AOX/sky61Wo
        YTsPyhl/qC/nVL+/YNnqJnbRems3ws8tuwAyV7Yww7isyMbZPn9cxVG+9ZLRuJsgkArawS
        hqnQ1esROZDkxzy2UoSi8z4SQs7ZKj4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-C10iKqvGMRC8CD3wRVIZig-1; Fri, 06 Mar 2020 12:45:40 -0500
X-MC-Unique: C10iKqvGMRC8CD3wRVIZig-1
Received: by mail-qt1-f197.google.com with SMTP id r19so1825210qtb.10
        for <linux-input@vger.kernel.org>; Fri, 06 Mar 2020 09:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CMTg0TedaIFOhx4o5LKmMRYaCsUrpsNojDNW2nk+DDU=;
        b=tyfnObtTvV9HPv1AXpS4MgAPQxi+17cfodHo+ndLSacu27PclRwqPGbj1yLr1dzQA5
         g8rJvJAZiRvNXDq/nYeDrot6dBjBAAJHiCgizWSmdo23Pqe34NQH2/gXDKCXv2rWSYeI
         i2sjt/ZHltYRFLvzk33K2IyhV/vu/+3n5tNi069mpAadhlg6QnG9r2LC3+clLiDz/BbI
         Tzz1S0Afl5gJlrNUg8/h+YegPF1WyoTE3xIUuRjMqKGz7nMtRf0AiSLjkbOKanGY+vEt
         1rERn0vRKUBfodHzg2fVNQQRD5eYoSi0ots6nILO2oomBSB4Qk0dcC3Ei7YEHQ9we1/S
         xM6Q==
X-Gm-Message-State: ANhLgQ2qriFt1pOME1rFgMM2EcV0GfOWxC+N1lpzp3ll7Fn9yen6rkjx
        0bR+dJk5d73CvmuhChHlVOG+uyg2xiLob64mcbSkMXdigDoRObyX4dxkJskG7SrxnFw38t91I8l
        kezOYolvzX1MaGSDPTGzbnVHKmX890ED1ACmMxgU=
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr4124003qke.169.1583516738499;
        Fri, 06 Mar 2020 09:45:38 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtLkMqmAAE5g6XIxPekB6iUZaExraKcxW50QFZu1+5KPDAHpDrbYIAx376mvnWlzfYRLHDphukJ91rmSpoaWRM=
X-Received: by 2002:a37:a1cc:: with SMTP id k195mr4123983qke.169.1583516738227;
 Fri, 06 Mar 2020 09:45:38 -0800 (PST)
MIME-Version: 1.0
References: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
In-Reply-To: <1582766000-23023-1-git-send-email-johnny.chuang.emc@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 6 Mar 2020 18:45:26 +0100
Message-ID: <CAO-hwJJo=oNTFNtS5DWtMP7FSiMXUYV5KTa1VDzH4LA4SBUCaQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c - Report resolution information for
 touch major
To:     Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Jennifer Tsai <jennifer.tsai@emc.com.tw>,
        James Chen <james.chen@emc.com.tw>,
        Paul Liang <paul.liang@emc.com.tw>,
        Jeff Chuang <jeff.chuang@emc.com.tw>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 27, 2020 at 2:13 AM Johnny Chuang
<johnny.chuang.emc@gmail.com> wrote:
>
> From: Johnny Chuang <johnny.chuang@emc.com.tw>
>
> This patch supports reporting resolution for ABS_MT_TOUCH_MAJOR event.
> This information is needed in showing pressure/width radius.
>
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---

Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

>  drivers/input/touchscreen/elants_i2c.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4911799..14c577c 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1309,6 +1309,7 @@ static int elants_i2c_probe(struct i2c_client *client,
>         input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
>         input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>         input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> +       input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
>
>         error = input_register_device(ts->input);
>         if (error) {
> --
> 2.7.4
>

