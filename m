Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBDBB5E6CAB
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 22:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232013AbiIVUG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Sep 2022 16:06:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbiIVUGy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Sep 2022 16:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD7EE5117
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663877211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WlDx58buz1NO+JYU/5r/GIV4poX4sHqJ9QfL+BBtIvo=;
        b=dpC927A8qjmZPwoZTjq2QvkmXq/fdKNCIvb2pWkSIhAAVWWKlwHhCxQP6PQ0IutK2FfBeU
        qmJbxHW8d60uIgT7lRVXDKMpIW65VK0DdZQLu+S9c5pCWD2GNrl66hmPnErno25+ced7E4
        m3V3eM3Pkc/j1+VBqLCJvk2qabXbVlE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-416-l-ViDY9oNRed3tlhReZChw-1; Thu, 22 Sep 2022 16:06:50 -0400
X-MC-Unique: l-ViDY9oNRed3tlhReZChw-1
Received: by mail-qt1-f198.google.com with SMTP id s21-20020a05622a1a9500b0035bb9e79172so7250390qtc.20
        for <linux-input@vger.kernel.org>; Thu, 22 Sep 2022 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:organization
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WlDx58buz1NO+JYU/5r/GIV4poX4sHqJ9QfL+BBtIvo=;
        b=5/oeQvpzqEw2h+y0J/C0r5nhKu9PxMqRlG4hvHFB0xb0OuSZRyrLsl3vpv28/kM98J
         mqDIEMZz7ldvAdMtTH6GDGMxK5liXX7hlqMpmp04fXlWVoagc6kar6TSTevBucr9jlcM
         cyZPjOdSQEOfETSjSNukcA1RYBsLBxrpI99h9VhCZ6+bU2NVSjq8h1PjoM1OrJ5RLnsS
         fB1aBu2xzkCSJHHG0d1Rc/5kie2fd/nKfFNTrl0xzbuqIYuBffLyD0M3mq7XQFHyIjkV
         0voUxTNQbMOMb91nEkD+x7LYfkUMZCvjgHROiXO1QP9OrIVRFHIMLpYST9qKj+AoB7K8
         uy6w==
X-Gm-Message-State: ACrzQf2i4uF9hOfx4wZ3n9PfSk3W8/ZUq6S5+KXYaKlbyuSifvYD4srG
        LxUkHhjE8wA07UA8MKF+dboEMTY0FgbPe3RLy/BnrJy+I6JZX373p02VRcVI2FninjYg9gmQMn2
        vu/UaWnGHpAaHgzInfhg8VZ8=
X-Received: by 2002:a05:6214:20ed:b0:4ac:b2b4:39af with SMTP id 13-20020a05621420ed00b004acb2b439afmr4014723qvk.57.1663877210073;
        Thu, 22 Sep 2022 13:06:50 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7cp/R2aPOJidkotV4qE0F+VqTWFgvRrWrnqT6AZcJi4NhHX2Cd4NT40J4wIbUo+zZgWP6lSg==
X-Received: by 2002:a05:6214:20ed:b0:4ac:b2b4:39af with SMTP id 13-20020a05621420ed00b004acb2b439afmr4014712qvk.57.1663877209890;
        Thu, 22 Sep 2022 13:06:49 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c48:e00::feb? ([2600:4040:5c48:e00::feb])
        by smtp.gmail.com with ESMTPSA id u5-20020a37ab05000000b006b8e8c657ccsm4262851qke.117.2022.09.22.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 13:06:48 -0700 (PDT)
Message-ID: <3da8a0c9ae4e6d8a1d772498e4d4186bf969fd76.camel@redhat.com>
Subject: Re: [PATCH 1/9] Input: synaptics-rmi4 - fix firmware update
 operations with bootloader v8
From:   Lyude Paul <lyude@redhat.com>
To:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Thu, 22 Sep 2022 16:06:48 -0400
In-Reply-To: <20220608124808.51402-2-matthias.schiffer@ew.tq-group.com>
References: <20220608124808.51402-1-matthias.schiffer@ew.tq-group.com>
         <20220608124808.51402-2-matthias.schiffer@ew.tq-group.com>
Organization: Red Hat Inc.
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Would add a Cc: stable@vger.kernel.org for this

With that fixed: Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2022-06-08 at 14:48 +0200, Matthias Schiffer wrote:
> Commit a6977d758fed ("Input: synaptics-rmi4 - support bootloader v8 in
> f34v7") allowed the F34v7 driver to probe with bootloader v8, but it did
> not update various other bootloader version checks in the F34 code.
> 
> Fixes: a6977d758fed ("Input: synaptics-rmi4 - support bootloader v8 in f34v7")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/input/rmi4/rmi_f34.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f34.c b/drivers/input/rmi4/rmi_f34.c
> index e5dca9868f87..3afc94f679ed 100644
> --- a/drivers/input/rmi4/rmi_f34.c
> +++ b/drivers/input/rmi4/rmi_f34.c
> @@ -370,7 +370,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
>  
>  	f34 = dev_get_drvdata(&data->f34_container->dev);
>  
> -	if (f34->bl_version == 7) {
> +	if (f34->bl_version >= 7) {
>  		if (data->pdt_props & HAS_BSR) {
>  			dev_err(dev, "%s: LTS not supported\n", __func__);
>  			return -ENODEV;
> @@ -382,7 +382,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
>  	}
>  
>  	/* Enter flash mode */
> -	if (f34->bl_version == 7)
> +	if (f34->bl_version >= 7)
>  		ret = rmi_f34v7_start_reflash(f34, fw);
>  	else
>  		ret = rmi_f34_enable_flash(f34);
> @@ -413,7 +413,7 @@ static int rmi_firmware_update(struct rmi_driver_data *data,
>  	f34 = dev_get_drvdata(&data->f34_container->dev);
>  
>  	/* Perform firmware update */
> -	if (f34->bl_version == 7)
> +	if (f34->bl_version >= 7)
>  		ret = rmi_f34v7_do_reflash(f34, fw);
>  	else
>  		ret = rmi_f34_update_firmware(f34, fw);

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

