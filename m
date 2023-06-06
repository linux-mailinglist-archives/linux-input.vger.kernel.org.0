Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80F69724A0D
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 19:20:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238691AbjFFRUB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 13:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238677AbjFFRT7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 13:19:59 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF7110F2;
        Tue,  6 Jun 2023 10:19:56 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-53404873a19so3337168a12.3;
        Tue, 06 Jun 2023 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686071996; x=1688663996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ERF5+hQlnPez7dXcfFeWn7GA7KiKyMH6r434v62Amsc=;
        b=delAFlazMbLk1K0XGgek1YtDgjIRUkr/zm2D1LJw1AKmTZUafugOV6VfGhmLtX6UL5
         u3BbAUCYHh5hiIiaiuU5QLo+NHok0MmNFVp3kKGS62gBL8Xzy0TH29FIOrapGj8NxLqs
         aol2FQoHZvKxWMCTS1DoQzJrpqmeQxrcQgbe/kog3gftb4wc7EgkPmchI0pOrz/ojKWu
         sw18/tEEBAzVSm7dPv+RSQF2x4EKP+CtBY9Z5lekTRhufdgdtWGilaB3UefseswLlXNi
         aQOcSJ6KA2Ey8UxxpBQd4DwMtBsb2nPs5e5wPNNTVo0nQGg4dYCHfQfaOdeti+7gtA/4
         iRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686071996; x=1688663996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERF5+hQlnPez7dXcfFeWn7GA7KiKyMH6r434v62Amsc=;
        b=TT61U6cIHKF/3vZ4XbI4IB+1N1ayC9xJrzri6gmsdXb66BbVi08JZvKhviEifIQewg
         njx7jpzt4h0Ozy2FDRFE3aA0P5rsW/fVjc/v6kE9SKykzLQJwlgFh378q/2KYWh7Ve5w
         B2VPtzMYGF5bKQlWcg5J2dbECrjI78tbTpZrcotITW2EOyMguhnoXSfJ/8GRCK7p3lBH
         UhbXClDdLiufpXNgSIzCDnmJQhrzwahYG5wnhz+v8nRiLcGtGBCMNcWBqHdQalW6zGlQ
         xJNk1XNqDIwJZiXziHy2PvH5xESe/Z7Pm9wcSaDIErXt9Iafr3YPra52yENoBF/yM34P
         JzbQ==
X-Gm-Message-State: AC+VfDzLrqu6g7fHj1+8A6+LbccnPNF7YJiEZYMkFwI+i2CgwVYP94FG
        8MgAqC55KyP/TmHx8HCLCwA=
X-Google-Smtp-Source: ACHHUZ75D/YMa8uCuXG2GbJw9mMGruQdTLxWzl7/6sRNAWF1SfwoitUo6qpaJiSpvdfie+uZpqV2MA==
X-Received: by 2002:a05:6a20:a112:b0:114:af27:41dd with SMTP id q18-20020a056a20a11200b00114af2741ddmr261713pzk.34.1686071996197;
        Tue, 06 Jun 2023 10:19:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f59e:5ad5:28cc:2003])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b0064fc715b380sm4412084pff.176.2023.06.06.10.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 10:19:55 -0700 (PDT)
Date:   Tue, 6 Jun 2023 10:19:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] HID: fix an error code in hid_check_device_match()
Message-ID: <ZH9quFTvZndM7Yd8@google.com>
References: <ZH7sZv4PEovkMxNP@moroto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZH7sZv4PEovkMxNP@moroto>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 06, 2023 at 11:20:54AM +0300, Dan Carpenter wrote:
> The hid_check_device_match() returns true if we find a match and false
> if we don't.  But here it returns -ENODEV which becomes true instead
> of false.
> 
> Fixes: 207733f92661 ("HID: split apart hid_device_probe to make logic more apparent")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/hid-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 4b7062dcefec..8992e3c1e769 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2593,7 +2593,7 @@ static bool hid_check_device_match(struct hid_device *hdev,
>  {
>  	*id = hid_match_device(hdev, hdrv);
>  	if (!*id)
> -		return -ENODEV;
> +		return false;

Ugh, I goofed up, thank you for noticing this Dan.

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
