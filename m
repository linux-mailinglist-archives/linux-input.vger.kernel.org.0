Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B51E63B14B
	for <lists+linux-input@lfdr.de>; Mon, 28 Nov 2022 19:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbiK1S3W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 13:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiK1S3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 13:29:03 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08FA82EF29
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:21:25 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id w23so10967876ply.12
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 10:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6cndovhtAq5jxS1ZDI8EvgvWaLB7TWFvNGlaB1oaX+4=;
        b=ALnY2fkn+MXQYSFd5i57wyQB7riulPSBvkv0gQfSyYQOsylSJNBierOGTazaoh4Htw
         T+WNDfEugAqeoZgVqilbAMhJT9l32Bx2mtE02wJ+lscm4TIv344xkaFzMyiMTh1VUGZH
         SZJ6yiNEFKQ+52+fYXIM9oReeyibndk7yinaJm2sdLpnKxNy+I/WHwRv1eLsq0aJJzgs
         53nkdvoKNUxFmqwcmw6qXZMBDRnIiV94Aj2VXFn5fXrZDEgI6TWfm9WU1vUnGDI4E1If
         TPU760W8LUqhg44/TGL6G6uQ0FOGCH3UVEAa2IZa6jlJRGQgLRFFC9GprbqqXfvTXEQ0
         EqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cndovhtAq5jxS1ZDI8EvgvWaLB7TWFvNGlaB1oaX+4=;
        b=k8BhFR09Vj9f6e3MQa2Hv4nnjVVcIMQsHgbvWsvTu/pAkjVK+umZvWEywaRbJfu4qD
         cKaOk9IgzvRmaYpI6e0ijSRa2jo7MOyqWZ+x5ugl4OmUd5cFDs9GfkrEmvaWxR923kx4
         IsOkf2L7r72m1aYnvJe+gBMvRP3Yfu7LOIQsMvYFR3viIkkzV5MHPxxSL9Ph+hgQnWGs
         KJA4NYgGR+nk0Ql+RvoXjD9vP0QI3uEFpPXQ0iCKPZOP3d336l3LzC3KS3J8GyiwLagM
         SCui4KxIvbqHa9MsNM/pfSccXXNA3eJnNyD7c+8jEcDhDKaDD1BFsnmKeFLTASHOxcQr
         59zA==
X-Gm-Message-State: ANoB5plKrk17Yyf4IlFOyZG106HsqihHD8d5Pzuk7288idea5Typ7a4q
        oiywY15TEAlm6l8pktFfi/A=
X-Google-Smtp-Source: AA0mqf7njaAbljjU/rKUREJhfsLdTuCClP26KmcQ2tJnF9QJSMqBlecE9g5qkbV89EAzfWFlrYF2KQ==
X-Received: by 2002:a17:90a:bd96:b0:219:3553:4ff5 with SMTP id z22-20020a17090abd9600b0021935534ff5mr6840826pjr.22.1669659684399;
        Mon, 28 Nov 2022 10:21:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:fd7c:c075:f9ff:46c4])
        by smtp.gmail.com with ESMTPSA id q10-20020a6557ca000000b004393f60db36sm7097277pgr.32.2022.11.28.10.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 10:21:23 -0800 (PST)
Date:   Mon, 28 Nov 2022 10:21:20 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     haibo.chen@nxp.com
Cc:     inan@distec.de, robh@kernel.org, linux-input@vger.kernel.org,
        carlos.song@nxp.com, linux-imx@nxp.com
Subject: Re: [PATCH] input: touchscreen: exc300: read the second frame during
 the interrupt line keep low
Message-ID: <Y4T8IADdw1EHr4lw@google.com>
References: <1669630110-11022-1-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1669630110-11022-1-git-send-email-haibo.chen@nxp.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Haibo,

On Mon, Nov 28, 2022 at 06:08:30PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> For the EETI EXC series, it support up to 10 points, two consecutive frames
> need to read. But for each frame, need to be read when the interrupt line
> keep in low level, otherwise, the read frame always get all 0xff data.
> 
> The hardware behavior for this touch device is it only support the low level
> trigger method, when irq line change to low level, usr need to read the
> first frame, and then the irq line return to high level, after about 320us,
> the irq line change to low level, then usr need to read the second frame.
> 
> Without this patch, we always find the second frame is readed during the irq
> line keep in high level, through the i2c logic analyzer, we see the data in
> the second frame is all 0xFF. This is because usr read the second frame
> immediately after the first frame in the same irq handler. But the irq line
> will back to high level after the first frame and keep about 320us. This
> behavior is wrong, and even worse, in some probability, this wrong behavior
> will cause the touch device stuck, can't generate interrupt any more, which
> means the interrupt line always keep high even after touch the screen.
> 
> This patch change to read only one frame in one irq handler. For the case
> need to read two frames, in the first irq handler, save the total contact
> number, then in the second irq handler, report the leftover contact.
> 
> Fixes: 7e577a17f2ee ("Input: add I2C attached EETI EXC3000 multi touch driver")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/input/touchscreen/exc3000.c | 40 ++++++++++++++---------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 4b7eee01c6aa..eae7844e33db 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -75,9 +75,10 @@ struct exc3000_data {
>  	struct touchscreen_properties prop;
>  	struct gpio_desc *reset;
>  	struct timer_list timer;
> -	u8 buf[2 * EXC3000_LEN_FRAME];
> +	u8 buf[EXC3000_LEN_FRAME];

I think this violates the notion of an input frame and will interfere
with the logic of dropping unused slots as the report will be split
across 2 input frames. You need to keep the buffer size large enough to
store both packets and postpone reporting of contacts until you read the
2nd packet (if there are more than one frame worth of contacts).

Thanks.

-- 
Dmitry
