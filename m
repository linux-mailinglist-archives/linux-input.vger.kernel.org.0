Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66ECF68CA62
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 00:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjBFXPl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 18:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjBFXPl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 18:15:41 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 676F3172B;
        Mon,  6 Feb 2023 15:15:39 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id 203so9545813pfx.6;
        Mon, 06 Feb 2023 15:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2qysyOmoR3PV9k6x9fydWrk9KGS+lQ2TeFI+N4R1O8k=;
        b=EOeOyzwIODU+o8QDnc8pcpuspC+4deu+amxBfiMZU+Ordeyi7CljZMoxjxl+/6WJw6
         6Ecl29R72DgVQnLFFf77lvwajGlJXKedpBv8OhOt0jBCmx5kCbpfn3dDXlQ78QzMpGJv
         pCdUJd1286JG9fAeo82tV/1YqLoU3S6fAOdoqKL5XKU95SqeV5xTLLudd0kTCc/oQFS5
         eWJGm0e3Kt9Rb8E013pbljM/ANVouekV9Fn4OybNgmApo8a9N5g/j6zAvuw3a3C4wv9Y
         O/W+jjpBnaPnozIU23DIudzeDGHPjstuJCVqNpRSITzmTq6MMai8WnQ8I8tFdGqLq6EA
         JpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qysyOmoR3PV9k6x9fydWrk9KGS+lQ2TeFI+N4R1O8k=;
        b=fchAo7j72HDjNgyKrkaa5HUheBetI/ngBoA6rYUdL7B87E9RsomK5R9/iNhouNvJyG
         fKIMp+37X+ROjrgPXETr6Pg+GwBNxS1LYW3pvRLX9Aj7XILgBO0Vu4LaG07iK0rdumET
         GMHn7ZCQ2VGhNJx4QjmaoduVuTHjpJwCzYU2LUKXmZ4P3cOxn0J29FBFVJZK2YwIuMCI
         Gsi0+wAUPlgvt4+KzjDwslenCTpfau850lFFG+BvLt5kTcCAQJ4+Mx4UJ2eiTQOM+dh0
         DSMS+4QOMh7ZcbDtE1jYQwf/WxsXl5g4wq/N6cLSUqVgvnEQnfJSlOukwju5boKFe1dX
         4qWQ==
X-Gm-Message-State: AO0yUKUqO0/smrBhQkUMl3GIGCOg9LSAAItik3F7SwXSkGfMiyNaRSLL
        C+NAhGyTeYpxDPLQd2lyp5M=
X-Google-Smtp-Source: AK7set9kEE37Qdb+EizYv21TE/TB3NT3oCDizl49s4DMzM/x9Jop9wCyaJD4TxgNW0fCNLYmpJnULA==
X-Received: by 2002:a62:1782:0:b0:593:c665:f256 with SMTP id 124-20020a621782000000b00593c665f256mr885730pfx.3.1675725338378;
        Mon, 06 Feb 2023 15:15:38 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:991d:5689:64f0:6f3c])
        by smtp.gmail.com with ESMTPSA id q3-20020a056a00084300b00593adee79efsm7720462pfk.55.2023.02.06.15.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 15:15:37 -0800 (PST)
Date:   Mon, 6 Feb 2023 15:15:34 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v4 3/4] HID: cp2112: Fix driver not registering GPIO IRQ
 chip as threaded
Message-ID: <Y+GKFlcVA2hB+3rU@google.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-4-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206135016.6737-4-kaehndan@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 06, 2023 at 07:50:15AM -0600, Danny Kaehn wrote:
> The CP2112 generates interrupts from a polling routine on a thread,
> and can only support threaded interrupts. This patch configures the
> gpiochip irq chip with this flag, disallowing consumers to request
> a hard IRQ from this driver, which resulted in a segfault previously.

This looks like a bugfix not dependent on anything else in the series
and can be applied separately...

> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  drivers/hid/hid-cp2112.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-cp2112.c b/drivers/hid/hid-cp2112.c
> index 1e16b0fa310d..27cadadda7c9 100644
> --- a/drivers/hid/hid-cp2112.c
> +++ b/drivers/hid/hid-cp2112.c
> @@ -1354,6 +1354,7 @@ static int cp2112_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	girq->parents = NULL;
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_simple_irq;
> +	girq->threaded = true;
>  
>  	ret = gpiochip_add_data(&dev->gc, dev);
>  	if (ret < 0) {
> -- 
> 2.25.1
> 

-- 
Dmitry
