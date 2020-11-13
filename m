Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB82E2B1699
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgKMHkc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:40:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKMHkb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:40:31 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAE69C0613D1;
        Thu, 12 Nov 2020 23:40:31 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w14so6917947pfd.7;
        Thu, 12 Nov 2020 23:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Kc4zpgCIo7TfpbXs93lzsYdWhQWRL3/bt5FKJ8OT6Ok=;
        b=c5iRV+TVxkKb9WaqrpRn5rf4JeUYhg6cMZouSz9pd7SrGfWawMgxs1ep9lTG3LNjd5
         Xp5Wuzp+X1Z0ex6e+tF9/TI5jWe7KURr8Qyg1jP8yP5SoIARvrZaO8Ze9L6EqxwGOow+
         jwXTXm/XsPQQ2iIokiAIT82rS942qPJXkWaf6jzti1jV70T1o58J99UdO8dQeoeKrXG3
         cvo1LKBdhWeFnsR0siDcbthi3WU6eRxYocpShJI1uN52J5GGzyYnfJpX0glXcq8Z2bpy
         jH88jgnJwfnSmDOKydkp8VLjSV1AfPs9ck6FcEbFGYdJ60tsdw9168ichWmE8Uf6y7W3
         cfGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Kc4zpgCIo7TfpbXs93lzsYdWhQWRL3/bt5FKJ8OT6Ok=;
        b=TZyDQ/RmV6K9BWmPMuMETGrQzA5F9NCYk89s1inrzQ24980Gtyc55c1ZkPsP1TT938
         90Pucf4PtGBGJzEN/VnA82IOOkO/AMRwr5jV3MMWaLC72fGrfsbS0v3ixTf4ELpY6IzS
         /agiCZhpeEG65i1yds2UXPwqK33qbRDDkkRZnML6d3jbDkZzRmdBwjvmmcf+a4ek6ahq
         rHOiQbRbqMYFzltctAUZ8970EggZDHoeDJu0ltN29G1+KvlZhXCOPETwRIf/T1KuV9b2
         gsq62ogT1oaF1xqh3fMfDJ8p9d5tUb5phgfai6/sx5jKnsWi5swxSCU860NKlLvQ0V5p
         n65Q==
X-Gm-Message-State: AOAM530ENyNdvZM2K5/Z367c9NvT3Re7/SBCM0cedsnbc6GZlq0fCESC
        /xZooCiTOraYsqlr/bVl+UDp7P0OXTw=
X-Google-Smtp-Source: ABdhPJxS7sM9wBhoU4SnE3Wbnq9NyDqSYDIvLWXd+gJMpezdIifAVvYeUD5nePM1SIGfmvbBX+8AFw==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr1054276pgb.165.1605253231281;
        Thu, 12 Nov 2020 23:40:31 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i29sm8067234pgb.10.2020.11.12.23.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:40:30 -0800 (PST)
Date:   Thu, 12 Nov 2020 23:40:28 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 08/15] input: touchscreen: surface3_spi: Remove set but
 unused variable 'timestamp'
Message-ID: <20201113074028.GI356503@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-9-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-9-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:57AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
>  drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/input/touchscreen/surface3_spi.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
> index ce4828b1415a8..72dc4c562a4e1 100644
> --- a/drivers/input/touchscreen/surface3_spi.c
> +++ b/drivers/input/touchscreen/surface3_spi.c
> @@ -94,9 +94,7 @@ static void surface3_spi_report_touch(struct surface3_ts_data *ts_data,
>  
>  static void surface3_spi_process_touch(struct surface3_ts_data *ts_data, u8 *data)
>  {
> -	u16 timestamp;
>  	unsigned int i;
> -	timestamp = get_unaligned_le16(&data[15]);

Benjamin, should we pass timing data on to userspace instead?

>  
>  	for (i = 0; i < 13; i++) {
>  		struct surface3_ts_data_finger *finger;
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
