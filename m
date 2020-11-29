Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBCEA2C7753
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 04:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgK2DAA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Nov 2020 22:00:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgK2DAA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Nov 2020 22:00:00 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20EEFC0613D1;
        Sat, 28 Nov 2020 18:59:20 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id bj5so4594600plb.4;
        Sat, 28 Nov 2020 18:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Q3b1sQJCxI5XmG09fBg4TUi3YzBpki4VHQf63SVwQ3g=;
        b=bNzd4MeLKYn/aUZ15PYil7zQwTrrBxCwX8XkIDGiazwQINvfY9DuJEXKPTC8rdAYQK
         ZTgF+2moFdCFvvR8Wns5Vmj0nouhniHWkmyIHfjhSvyV1RqPH8rpAy3MiMpNCuk+B58O
         RFj2IhpvETRlF4PL6aq7x2GD1jYb9vtyOdSagVaGR42l+4IP17uZnDrHNhR8wobEYiAI
         gWRTjqSpSQ6VhUpI6aIe+P2K/crbTGrZsrFqZaB7KxuLfX6YDbxiDoaUC8gGDOM3Rmig
         rqC4AvZoG5UqJlI3GYHWHkS8HVSXo2lu9RfdfBhbu5zI6m0b99jlCd4AB5r0oQVcJr+b
         NozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Q3b1sQJCxI5XmG09fBg4TUi3YzBpki4VHQf63SVwQ3g=;
        b=W4dj73Ahfe7v8VvJ2smKi56udHqKBvUjL1NFk18cHcwEpRgHogumlkJRgCDVtNue0v
         mDirFQX80Kv303nMfd24B62uPyGgItoRGSz7/cR43KbnuNDidX6+2Z6nW2Mi2WcV3psY
         5q41NhWcleYb2FpUg0uMTYIoXD87auaBWyX3rnZLf5QCAAVOXcVm+V+ugRs271T0y7rX
         DkbAXaqQKBQrSWySf+6ZKbnYU/UaqMJt3z21Gt34lrvj4itDFB7QdYi3av+SvvTu7Fje
         9g6V5GBUC+rmKxHEgMAyU/Z8qOmZ7/76/QYi7cp6liyFT609Tu6nSbc2lZWKkVTKU04U
         JUBA==
X-Gm-Message-State: AOAM533fWNisDFk/mexbwCTebOY0WREP1ZgwAupAYdVA/8cb0eEEI+f5
        Q6v10k2EKMXX/hdnU7p+bhwojGRqmxw=
X-Google-Smtp-Source: ABdhPJzpV7xAcwqi3GsTAKfGt+3pHFiyFfF8DTODZP//N4Qs0dvV0PvMV48QSM8g688vN/9LN7WKGQ==
X-Received: by 2002:a17:902:bf0b:b029:da:274:c754 with SMTP id bi11-20020a170902bf0bb02900da0274c754mr13101439plb.43.1606618759462;
        Sat, 28 Nov 2020 18:59:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i6sm15781824pjt.49.2020.11.28.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 18:59:18 -0800 (PST)
Date:   Sat, 28 Nov 2020 18:59:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/4] input: touchscreen: melfas_mip4: Remove a bunch
 of unused variables
Message-ID: <20201129025916.GI2034289@dtor-ws>
References: <20201126133607.3212484-1-lee.jones@linaro.org>
 <20201126133607.3212484-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201126133607.3212484-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On Thu, Nov 26, 2020 at 01:36:05PM +0000, Lee Jones wrote:
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

So __always_unused did not work?

-- 
Dmitry
