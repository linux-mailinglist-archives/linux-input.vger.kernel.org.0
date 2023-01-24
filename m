Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9416794BE
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 11:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjAXKHG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 05:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjAXKHF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 05:07:05 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCB7227B5
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 02:07:03 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so12422112wml.3
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 02:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4R9YOVwUyYBfPGZ2jxpq4QdSE5HSTz36nOFHPxprj4k=;
        b=zJVdnaSFz7iV10ZvhyVWrq7k7nAXw+oolpCL+uYiR4/jcI197MSHCIJKOVqDlIO86l
         0isT162sRwAkmrA9EfHiob7XmPBJY3fO6FhiI7BBL2XF38SO6lFoHODuAkBwTa0rei/x
         39klM776k3NT+DK2ikAGzZRcP+M6Z2qypHYBHWk8EwAuZMVuHAO1cZPuQ9hrYX0HKWB7
         Rzvn1I5SKEXKxPWvQexvtRIXgU5EMTRTvOFIdhMHPFNS7QAAjf1BY+m40ULxhxOVIi/n
         +jztu7FOtdoGIUj2laKjBDLsL87KFHKFEBCtV+DDcFSWtjaXyKOpfVBoLnWIsEJ1PQJk
         IdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4R9YOVwUyYBfPGZ2jxpq4QdSE5HSTz36nOFHPxprj4k=;
        b=H7yTscHCFKNsyxaBU2WAFimDQXXrHTlsq3sTFzf+npNCVbRCWDtlzjABhscPjdastV
         aTjWwOYUvvTj52mkjFdj0I81myVtK+MiTAaQYSnHQfHmHnHbp67q+Qvkx4rHwpiWf7WV
         VbLItPELGUQXOL3IpF0pg8WFjA4aTOCdZy5qzYfyM0/byCaj569WecE9kVJ8tmbSfBDB
         RPMlS2d01BXjgsHYffVDbmaqcSfynTZHW+Mmij1Z7TWVXu2/YwXEkFdXROeI9h/eUfNl
         oLKwkzJ8/GGT5hG3b01ea/eP0EpDQkcfwqVrM0EWyBs8iAP2BvyDVoIAwDqkfoaLHn/s
         gdJg==
X-Gm-Message-State: AFqh2koQd6w6wG95xlE/PmZyvz4DL3TyZRjIqFqncbf6Cl4rX2Zvz93L
        nqyM4gnuq26NtxglHeNDavF2EQ==
X-Google-Smtp-Source: AMrXdXusOj/jDctjTJIm+rwbb31SI3b7Z1ftwkUnu0L0+tn23q9EQqeQJ+gRSS2nGC+u8jOURVKWtw==
X-Received: by 2002:a05:600c:1c02:b0:3d2:3b8d:21e5 with SMTP id j2-20020a05600c1c0200b003d23b8d21e5mr27392120wms.14.1674554822224;
        Tue, 24 Jan 2023 02:07:02 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d470f000000b002bc8130cca7sm1491871wrq.23.2023.01.24.02.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 02:07:01 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-input@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rayyan Ansari <rayyan@ansari.sh>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4: Fix SPI device ID
In-Reply-To: <20221219133717.1638496-1-rayyan@ansari.sh>
References: <20221219133717.1638496-1-rayyan@ansari.sh>
Date:   Tue, 24 Jan 2023 11:07:00 +0100
Message-ID: <8735802qm3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 19, 2022 at 13:37, Rayyan Ansari <rayyan@ansari.sh> wrote:

> Currently, the ID being set to "rmi4_spi" causes this warning:
> "SPI driver rmi4_spi has no spi_device_id for syna,rmi4-spi"
>
> Change the ID to rmi4-spi to stop this warning.
>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/rmi4/rmi_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
> index c82edda66b23..aa3a6a8544d4 100644
> --- a/drivers/input/rmi4/rmi_spi.c
> +++ b/drivers/input/rmi4/rmi_spi.c
> @@ -510,7 +510,7 @@ static const struct dev_pm_ops rmi_spi_pm = {
>  };
>  
>  static const struct spi_device_id rmi_id[] = {
> -	{ "rmi4_spi", 0 },
> +	{ "rmi4-spi", 0 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(spi, rmi_id);
> -- 
> 2.39.0
