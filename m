Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02D9B76C121
	for <lists+linux-input@lfdr.de>; Wed,  2 Aug 2023 01:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjHAXhO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Aug 2023 19:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjHAXhN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Aug 2023 19:37:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A2DD1B1
        for <linux-input@vger.kernel.org>; Tue,  1 Aug 2023 16:37:12 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-686efa1804eso4503052b3a.3
        for <linux-input@vger.kernel.org>; Tue, 01 Aug 2023 16:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690933032; x=1691537832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXudHIvgypAmCajbWyBN3Zf8sF39W8jjIsscKLzxZG0=;
        b=fFOGCPbYt3epcS+6BOcwNMkxzYLfRbxHr40yagsJMwrY3seo90qt7sGQn5q375JpbY
         uAl1qFKuf2gc4ZoxWJ71q/NCf4dnrJ+tW+QsKBP07CiX84HsApvCQnf2iKqFLLCYODuB
         x+6QXRI54rZR6KLwauFMYSgWS3fSzQSty6y3jinxPJKxRcIZJRdpx6Lyp/o2+reFDnex
         Y82Vfk0K3BF17bWfvL4DYrfa8epnp20C70wnRQhAATZExTQGbfN3i1L/d8annG8HrSXz
         GhJ1d23bKgWC4IfkY9Ov3COTrLs6oCVy0Iauc1h0zzZdO6/noDFRpgkxAM+ua1cXsvkW
         z7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690933032; x=1691537832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXudHIvgypAmCajbWyBN3Zf8sF39W8jjIsscKLzxZG0=;
        b=i/lpRjaBSte/W4gbZr6WW1TCyYr2JpWEiuPlq8aCI72a6lT+79rgdYnBXNOv7sGeAY
         rsRqopNT8vXkBDB/XKEOtRSY1rN3xa0ORLHVt/Gzx0ok7uExs8AYfG91ZD4SpUw004QA
         Y/byuvIHvICwTn3a8XNndQ3gruiEEXTrPanr4kzeeiPvabZw1q6gVOPWaF46MGkwhY0O
         Mi6pfRufP816uEdj1kzIk4rs62LfZRhzyW/bkokBAjeTHkfj6mwgJXdpL4pWda94Y93+
         fUpJzHcGDBcVWGxJ7JasmQpSeifJ7oZWJVcDKCSUHZv+N0Z6PXFthLbjzeDhUjvCxPqu
         XN+w==
X-Gm-Message-State: ABy/qLaDBdgWuOJTTRC0ePYQJUf7EOXbmhGw4crIubxInPml7EkYXBkm
        xCDOzCvXG3dqCSIAINYdltA=
X-Google-Smtp-Source: APBJJlFgbr+uQoaJCUSZWoVA71nssDzhI7HMtQzs6KRkRBXOYKV6/K+bBxHNBtQM7AVga/z0dyCmQw==
X-Received: by 2002:a05:6300:8086:b0:12d:ba1e:d763 with SMTP id ap6-20020a056300808600b0012dba1ed763mr13806589pzc.7.1690933031782;
        Tue, 01 Aug 2023 16:37:11 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:877e:78a5:c7ac:e1d4])
        by smtp.gmail.com with ESMTPSA id j22-20020aa78016000000b006862b2a6b0dsm10156744pfi.15.2023.08.01.16.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 16:37:11 -0700 (PDT)
Date:   Tue, 1 Aug 2023 16:37:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhu Wang <wangzhu9@huawei.com>
Cc:     rafael@kernel.org, christophe.jaillet@wanadoo.fr,
        gregkh@linuxfoundation.org, linux-input@vger.kernel.org
Subject: Re: [PATCH -next] Input: serio - fix possible memory leak while
 device_add() fails
Message-ID: <ZMmXJCPAivAVPWRg@google.com>
References: <20230801115105.76690-1-wangzhu9@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801115105.76690-1-wangzhu9@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Zhu,

On Tue, Aug 01, 2023 at 07:51:05PM +0800, Zhu Wang wrote:
> If device_add() returns error, the name allocated by dev_set_name() need
> be freed. As comment of device_add() says, it should use put_device() to
> release the reference in the error path. So fix this by calling
> put_device, then the name can be freed in kobject_cleanp().

Unfortunately this is not as simple. To support serio ports chained
behind other serio ports (to accommodate Synaptics touchpads with
Trackpoints connected to pass-through ports) serio device registration
is done on a thread. So even if you free the device the driver that
ultimately issued serio_add_port() call will not be aware of the failure
and will continue using the device, which will much more likely crash
the kernel as opposed to leaving the device structure around.

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>
> ---
>  drivers/input/serio/serio.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> index 767fc9efb4a8..d3bb6ec91326 100644
> --- a/drivers/input/serio/serio.c
> +++ b/drivers/input/serio/serio.c
> @@ -537,10 +537,12 @@ static void serio_add_port(struct serio *serio)
>  		serio->start(serio);
>  
>  	error = device_add(&serio->dev);
> -	if (error)
> +	if (error) {
> +		put_device(&serio->dev);
>  		dev_err(&serio->dev,
>  			"device_add() failed for %s (%s), error: %d\n",
>  			serio->phys, serio->name, error);
> +	}
>  }
>  
>  /*
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry
