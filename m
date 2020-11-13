Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 637CB2B169F
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgKMHmG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbgKMHmG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:42:06 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A51C0613D1;
        Thu, 12 Nov 2020 23:42:06 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id z1so4158284plo.12;
        Thu, 12 Nov 2020 23:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=fHsx/NcMBm2j9y031ocQ8/B+5AiiNR8Z5txEsFchJ80=;
        b=t0pgferCyaNF1Mvbe80gXAC9Lm1sRrFEWfXbDPiNfBp2lUEDBRLsWhZaWgFpz2unpP
         xBy15gJjsJ1lbaygn5v0EVAywUk39D0rTYdU26Tqx/XzKm7vCTfOW91l28NGFTx5gajW
         BcWv17nhbADyJ2qVTU2JltOP4l6O6YYVxvfCBei6MjKFtUIRzv/1ytmGRHXNas7G9Vmf
         65bGmAjBCKL6Vua0XSJut+3YadLqFnmfGctakAlor3lDehhMRp4sPuNEjgLySusjhcbs
         j8NkD1gjTBjF/9ig/3zS/13+JSSYXT+l+nAEOrUI29/sWhEaaUdmJYR1qV1Betp31oUm
         YskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=fHsx/NcMBm2j9y031ocQ8/B+5AiiNR8Z5txEsFchJ80=;
        b=ZHmFmV3OT/B5yoUNxFd444+s0M6556f41p7Q8rY8tEU+0tX6AdTrWrcTySJxYz/SeF
         ZPdnG6574p8qK0FQzq0jhZ776tiHvxMBa1gtMNhasPwSkXKNBi6zM2KQnTOl1ayY/DLS
         b4J1aRsmnCsWRTlvddYFJeLiuKmrihvVFDuE9a5JPB4znbpOV5Jy2Jtyli4TV4WJQlbY
         O3t0CJtXIYMQOOVkgBPYvX8I/OTR62JvUEWBbg2oP6Ak2Nzswkf+gZtFJG9mm956Z6oW
         BP9x507zqZS+1tLIRtmL4iZn4g08WsSGOhKGoqvtC7IK2PAtIu3AEJVxRYbT4i+4FMH+
         q4hQ==
X-Gm-Message-State: AOAM533ehldoYFB3Wm+T3k/IYfOYI/7s5BrKo6yObMQ//cReYwrD0P0P
        umVQMV8FRVHMeMeh0e141Bs=
X-Google-Smtp-Source: ABdhPJxZ0lHEyQ5IeFttjAQTFYoC3IbRJVBLE5AaqFopkaJUtoUFgm61z5XWdpjP9F3tDicu3uNDXw==
X-Received: by 2002:a17:902:a70c:b029:d7:eba5:7874 with SMTP id w12-20020a170902a70cb02900d7eba57874mr1212216plq.9.1605253325705;
        Thu, 12 Nov 2020 23:42:05 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w196sm8535175pfd.177.2020.11.12.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:42:05 -0800 (PST)
Date:   Thu, 12 Nov 2020 23:42:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 06/15] input: touchscreen: melfas_mip4: Remove a bunch of
 unused variables
Message-ID: <20201113074202.GJ356503@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-7-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:55AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
>  drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
>  drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Sangwon Jee <jeesw@melfas.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/input/touchscreen/melfas_mip4.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> index f67efdd040b24..9c98759098c7a 100644
> --- a/drivers/input/touchscreen/melfas_mip4.c
> +++ b/drivers/input/touchscreen/melfas_mip4.c
> @@ -465,13 +465,9 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
>  static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
>  {
>  	int id;
> -	bool hover;
> -	bool palm;
>  	bool state;
>  	u16 x, y;
> -	u8 pressure_stage = 0;
>  	u8 pressure;
> -	u8 size;
>  	u8 touch_major;
>  	u8 touch_minor;
>  
> @@ -480,14 +476,11 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
>  	case 1:
>  		/* Touch only */
>  		state = packet[0] & BIT(7);
> -		hover = packet[0] & BIT(5);
> -		palm = packet[0] & BIT(4);

No really happy that we'd be losing information about protocol. Is there
a better way to suppress the warning while keeping this info?

>  		id = (packet[0] & 0x0F) - 1;
>  		x = ((packet[1] & 0x0F) << 8) | packet[2];
>  		y = (((packet[1] >> 4) & 0x0F) << 8) |
>  			packet[3];
>  		pressure = packet[4];
> -		size = packet[5];
>  		if (ts->event_format == 0) {
>  			touch_major = packet[5];
>  			touch_minor = packet[5];
> @@ -501,14 +494,10 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
>  	default:
>  		/* Touch + Force(Pressure) */
>  		id = (packet[0] & 0x0F) - 1;
> -		hover = packet[1] & BIT(2);
> -		palm = packet[1] & BIT(1);
>  		state = packet[1] & BIT(0);
>  		x = ((packet[2] & 0x0F) << 8) | packet[3];
>  		y = (((packet[2] >> 4) & 0x0F) << 8) |
>  			packet[4];
> -		size = packet[6];
> -		pressure_stage = (packet[7] & 0xF0) >> 4;
>  		pressure = ((packet[7] & 0x0F) << 8) |
>  			packet[8];
>  		touch_major = packet[9];
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
