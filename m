Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8099069A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 19:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726943AbfHPRSl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 13:18:41 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40596 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfHPRSl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 13:18:41 -0400
Received: by mail-pf1-f196.google.com with SMTP id w16so3435187pfn.7;
        Fri, 16 Aug 2019 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aPvyf/nDNEivNyxg9m1xt4YXOd7OXz4yYfwd9gvfxqU=;
        b=AtzLesif1ydS/JD406ezstt7LYUOSt1j5jH+0z1G7KpDpmWUWWLeJNCVOz9EOjm6vM
         8aK3orHh5Uexb1rB3bNzCevfQYFyAjAgiR2gKWxT/pYcJLkZlkqpk7Wmzl1O65QObmlM
         hwwpAIDl/RxXt05wwCsL7jWZNOix6fugNHOtWrvECCgxUkiwIm9r7HlegYC2l1DNk9Cc
         jD3n2oSrY4rGIOtYDphhY5xa4hWSZGHNYErKOM5txL1AQ7brFUcOtSbdqKOD6NhaSYce
         B6dra/Gr8IPHhzWTtmHrE4VgqBXrIc4QLEjxIGI93nVvUqw/Qvht9bS3dkWpyNpHkKp9
         yErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aPvyf/nDNEivNyxg9m1xt4YXOd7OXz4yYfwd9gvfxqU=;
        b=r6/5UkKM/K2/GzeLuSc8VSLpzuXHh73n7DiZVw3lH0l5uTJa4cllBCSAHKSrRkpGc1
         dZL7BzLUCpaY2A17FtI8Gd686qn/za0XR2uzEm/rqmcVtfEobFpdGMAcVT+yVyra/goS
         TFSE1IV4GtU+Ou/74JnLUNA84fk+dkD+N5mloZBjg4PDw5jn/cLHUw23UuPoqn2FWJqS
         PnlHQgc4T1k8lv5RvIaAT0apwX6xGyhrp0aZsDBASQ9hsLbtsZ/H05YRbGsJh1ybyJBF
         z9AKtvy076KqgupFZS1VOAn8r6Q+O8U2UJ/Zt0GHA+G+7IPV+H7wiQDyAwM/nkjnft2U
         0h6w==
X-Gm-Message-State: APjAAAUPdlUhmde80icpNF8A3/7aSSwfyXPLFsQ9G9tCnKoBpOE8uqB1
        R3+1sGLeirYKgXWMuvxJWrEIRUey
X-Google-Smtp-Source: APXvYqw66AEeDj9XJiILTD9IEYof/FCA9xMExWvuAA0fHx04/CtMJR72/263+iJgD9Drx+0SI7D6VA==
X-Received: by 2002:a17:90a:9505:: with SMTP id t5mr8229334pjo.96.1565975920340;
        Fri, 16 Aug 2019 10:18:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u74sm6628335pjb.26.2019.08.16.10.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 10:18:39 -0700 (PDT)
Date:   Fri, 16 Aug 2019 10:18:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, george_davis@mentor.com
Subject: Re: [PATCH v1 04/63] Input: atmel_mxt_ts - split large i2c transfers
 into blocks
Message-ID: <20190816171837.GG121898@dtor-ws>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
 <20190816082952.17985-5-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816082952.17985-5-jiada_wang@mentor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 16, 2019 at 05:28:53PM +0900, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> On some firmware variants, the size of the info block exceeds what can
> be read in a single transfer.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> (cherry picked from ndyer/linux/for-upstream commit 74c4f5277cfa403d43fafc404119dc57a08677db)
> [gdavis: Forward port and fix conflicts due to v4.14.51 commit
> 	 960fe000b1d3 ("Input: atmel_mxt_ts - fix the firmware
> 	 update").]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 27 +++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 9b165d23e092..2d70ddf71cd9 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -40,7 +40,7 @@
>  #define MXT_OBJECT_START	0x07
>  #define MXT_OBJECT_SIZE		6
>  #define MXT_INFO_CHECKSUM_SIZE	3
> -#define MXT_MAX_BLOCK_WRITE	256
> +#define MXT_MAX_BLOCK_WRITE	255
>  
>  /* Object types */
>  #define MXT_DEBUG_DIAGNOSTIC_T37	37
> @@ -659,6 +659,27 @@ static int __mxt_read_reg(struct i2c_client *client,
>  	return ret;
>  }
>  
> +static int mxt_read_blks(struct mxt_data *data, u16 start, u16 count, u8 *buf)

Can we call this __mxt_read_reg() and the original read reg call
__mxt_read_chunk()?

> +{
> +	u16 offset = 0;
> +	int error;
> +	u16 size;
> +
> +	while (offset < count) {
> +		size = min(MXT_MAX_BLOCK_WRITE, count - offset);
> +
> +		error = __mxt_read_reg(data->client,
> +				       start + offset,
> +				       size, buf + offset);
> +		if (error)
> +			return error;
> +
> +		offset += size;
> +	}
> +
> +	return 0;
> +}

Thanks.

-- 
Dmitry
