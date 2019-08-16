Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7262F906FA
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:34:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfHPRea (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:34:30 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36594 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHPRea (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:34:30 -0400
Received: by mail-pg1-f193.google.com with SMTP id l21so3277932pgm.3;
        Fri, 16 Aug 2019 10:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fkHMgcTeIB2aA6dkreXkXm9LjS4qpjG21Q/r9CswN44=;
        b=i0vjf5dlYtypGdXdbR249NGqlEEK/4dXMMMv08+xbhvMEzohZB4TTbdeXuPOD9rB2j
         +3NxnyQQUlRAxTX1N2yUVk7h/mR353BgK0wqkGEF4DL1gTi3ukwKMe3AzUgvoB23czOH
         /Vst09EFJF2Cw/co6uPx0l3VsFKWK33RJRylizUHO6OavhVo3L/xQqfgzwLPkV2TMRrx
         eqTZVFbQDE4EshOJzVpSEH6w4qrnv2XHjG/G04gEx0yyVsmIgfJmrWYUKaN8CnPt9xig
         T8wELKbTHXNbAFrFgSyZ0cCqi+juRe4G2jgogvNON47JUf5EetyEqVfWR3oCQ+hokxMK
         dpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fkHMgcTeIB2aA6dkreXkXm9LjS4qpjG21Q/r9CswN44=;
        b=fNeOet/OzWSAVHX4UjCzBCVU7k6qtYj+GXlw2+Qb3My6Jho5p8A700TPnm0NbKNsDj
         Yrx6CQZx3ZaT/DITq4Fd9tXFWrmOCxZaIuueoWVuRZZeZRaYlL7F1UpHwmKRnlGErbFF
         +8i69qy1Y+Ta/z8KruEQRI4lJpE2m/cufANojrsRe9VNPVVREdxmVv5LNZx3I1KahyLa
         L+sjQZ2iVkxudOtnttiG0np2lN6VlHzPPeHc1LhxWXtcQLof9C8xh0QFgJ9ylCuK6cBy
         dXku/LvKXlMGXu8W0jkqcm7LmhQ+h2uMfbesNofEZOkSLoSyG7j2iEwO7IXM1pvOfp8a
         k9hw==
X-Gm-Message-State: APjAAAU5iX2qi/P2dXnoxglRn4WAO5Tdj801kmGCtBED9orLeCUhueXi
        YVMN5tGnv/EOvVO0uzTSyDRH8clx
X-Google-Smtp-Source: APXvYqyOfqU3InZ4uy+FEs45U71ydmSmY9M9U7E/2t765p7/SglW4DrH8ntY/zAKRq5BxTXS3GqfuA==
X-Received: by 2002:a63:61cf:: with SMTP id v198mr8671196pgb.217.1565976869446;
        Fri, 16 Aug 2019 10:34:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v6sm4084728pjn.13.2019.08.16.10.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:34:28 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:34:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 06/63] Input: atmel_mxt_ts - output status from T42
 Touch Suppression
Message-ID: <20190816173426.GM121898@dtor-ws>
References: <20190816083130.18250-1-jiada_wang@mentor.com>
 <20190816083130.18250-2-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816083130.18250-2-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:30:33PM +0900, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit ab95b5a309999d2c098daaa9f88d9fcfae7eb516)
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index a75c35c6f9f9..9226ec528adf 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -155,6 +155,9 @@ struct t37_debug {
>  #define MXT_RESET_VALUE		0x01
>  #define MXT_BACKUP_VALUE	0x55
>  
> +/* Define for MXT_PROCI_TOUCHSUPPRESSION_T42 */
> +#define MXT_T42_MSG_TCHSUP	BIT(0)
> +
>  /* T100 Multiple Touch Touchscreen */
>  #define MXT_T100_CTRL		0
>  #define MXT_T100_CFG1		1
> @@ -323,6 +326,8 @@ struct mxt_data {
>  	u8 T9_reportid_max;
>  	u16 T18_address;
>  	u8 T19_reportid;
> +	u8 T42_reportid_min;
> +	u8 T42_reportid_max;
>  	u16 T44_address;
>  	u8 T48_reportid;
>  	u8 T100_reportid_min;
> @@ -978,6 +983,17 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>  	data->update_input = true;
>  }
>  
> +static void mxt_proc_t42_messages(struct mxt_data *data, u8 *msg)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 status = msg[1];
> +
> +	if (status & MXT_T42_MSG_TCHSUP)
> +		dev_info(dev, "T42 suppress\n");
> +	else
> +		dev_info(dev, "T42 normal\n");

dev_dbg(). There is no need to flood the logs with this. I'd assume this
is for assisting in bringup. Should there be some more generic way of
monitoring the status?

-- 
Dmitry
