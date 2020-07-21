Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6353522850B
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 18:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgGUQMl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 12:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgGUQMl (ORCPT
        <rfc822;Linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 12:12:41 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7ADC061794;
        Tue, 21 Jul 2020 09:12:41 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id k27so12167267pgm.2;
        Tue, 21 Jul 2020 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q+LcCZY/rB9hRqalJEFgYKqj0Xrc9NYu49mml43Naro=;
        b=Q8/i33JCodDzaLyqTs1/DOnQWML6Z23owcAcp5lXVV6xU4nhZ9PVgTXr0q2kF8DssV
         ukZb5rZVuxcLvDtDRJz+ALon3R7S2SIbqeYk1UYcmNolCnxa8nDD1ytqAvnW/5eD0x4m
         D5WU38G/HP+GiWkem3IBh1NXkw9FoPwxndJHu+8pCYXVl2f6Cu6e98+MngTLOgIwmnRK
         1cB1tg6TbOnbJXBwPDh5qa7BM3v7x3vOeXloBeMOKXLJJs+L4ttaZ+v2e+p50UAw/kY9
         wKFzJIc/2NB20DVe+rmLKgjzAU+yEcZaaekM9t8b4Bx6rmly+ugd1tfmK8SmiFvVMdXR
         Ta7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q+LcCZY/rB9hRqalJEFgYKqj0Xrc9NYu49mml43Naro=;
        b=jH3Pa3c4B4zQw2QAAYdcA/moq+sGj1vyK5S1unGhjM+JV1KAqGSdPktTzhUKqxcrZR
         +AlIks8RMbsqULuGGFDqaH/WEnGdRfk3yqAte4ZUOt3i3n7Bw+icPrYp3tMKCoiWHt86
         cAOeRd4IVwRx4ni/HcZtF5WPM6HrL3SwyvUiXO8+E8hqwOGOYlxXqV3HOP+9g0WkCZ97
         WpflmUBjgTfYOGmure1bOE/ubFMNv8/cYQ9QpnJG7K7MFiEWTzDXacLZl/gB3fhZ97SG
         /jTOe1OfNEBY1bfh/DvH901NYPK6LXo5zoVkbK4ox3Srjrtf7qR4YFD/BsKo/nh+Uv+B
         KfaA==
X-Gm-Message-State: AOAM531SjnAivFMt89wLCeK7SvpqU/UjMr0qnbrOVivrha76rJ00mTPg
        4EScN5fhWOqBH4HY/3DMd3w=
X-Google-Smtp-Source: ABdhPJzr6w+HX5vuT6iz2EOTCcdH35p36Dk0mb9LntSP/+Sfd4CSakbgq1wzQlMeJQ3PqQRBnT0KXw==
X-Received: by 2002:a62:3895:: with SMTP id f143mr14230692pfa.27.1595347960719;
        Tue, 21 Jul 2020 09:12:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b205sm20194519pfb.204.2020.07.21.09.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 09:12:39 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
X-Google-Original-From: Dmitry Torokhov <Dmitry.torokhov@gmail.com>
Date:   Tue, 21 Jul 2020 09:12:36 -0700
To:     Dave Wang <dave.wang@emc.com.tw>
Cc:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com
Subject: Re: [PATCH 1/3] Input: elan_i2c - Do no operation for
 elan_smbus_set_mode function
Message-ID: <20200721161236.GI1665100@dtor-ws>
References: <20191209111107.32239-1-dave.wang@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191209111107.32239-1-dave.wang@emc.com.tw>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dave,

On Mon, Dec 09, 2019 at 06:11:07AM -0500, Dave Wang wrote:
> Some touchpads might get error while triggerring the set_mode command
> in SMBus interface. Do no operation for elan_smbus_set_mode function.

Are there devices that do not trigger errors? How do we put SMbus
devices into low power mode?

> 
> Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
> ---
>  drivers/input/mouse/elan_i2c_smbus.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
> index 8c3185d54c73..bcb9ec4a7a6b 100644
> --- a/drivers/input/mouse/elan_i2c_smbus.c
> +++ b/drivers/input/mouse/elan_i2c_smbus.c
> @@ -84,10 +84,7 @@ static int elan_smbus_initialize(struct i2c_client *client)
>  
>  static int elan_smbus_set_mode(struct i2c_client *client, u8 mode)
>  {
> -	u8 cmd[4] = { 0x00, 0x07, 0x00, mode };
> -
> -	return i2c_smbus_write_block_data(client, ETP_SMBUS_IAP_CMD,
> -					  sizeof(cmd), cmd);
> +	return 0; /* A no-op */
>  }
>  
>  static int elan_smbus_sleep_control(struct i2c_client *client, bool sleep)
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
