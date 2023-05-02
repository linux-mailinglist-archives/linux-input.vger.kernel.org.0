Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0CA46F3B75
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 02:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232184AbjEBAlA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 20:41:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjEBAk7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 20:40:59 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E442173D
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 17:40:59 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63b70ca0a84so3711400b3a.2
        for <linux-input@vger.kernel.org>; Mon, 01 May 2023 17:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682988058; x=1685580058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CoUZ92N4Ngw+DcshqErjEvSXfD5pN06XRaz2LUfrT9A=;
        b=ZbHoAv9lrmPn4tbekgzLfBSsgNx9L0YsDQviArN+oIkH6ohEMPm0sb3dslX1Wcmtaz
         lR5xfvBREF3d1Y+aebF+ZdYpMINcv3zsAISQZ1VMQzTulIwIgwfzPoOdm89TZZOHbhuM
         wqEzGnGqBUaU6N2tGw2qe+4tjBFUuYPmaDWwNUZixQ0UaK/AoK1lfSCz68KFKVq4EHIN
         +COm6SiDY7oovoT9h7kbZNZxDlUzxDJteLaK8SYvg54sVcPGc1JQSeuxAGNmzYBcEVBs
         j8uo6iWKX7iuQBCYgaiZsBjk36cit4C1BBkGrAnN4aN9k/U/6V3imW2ROf8s/qjqd9iM
         twDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682988058; x=1685580058;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoUZ92N4Ngw+DcshqErjEvSXfD5pN06XRaz2LUfrT9A=;
        b=EioTy6AuJZ0BiDtItawj5KJ98Tn0hYCyAfcF9ts93LqTdDlBLd+E/tGieF0Al1AeTF
         tH7uBdak5z26TlCtQXxaekjNAyeiz//qzjdBPeGGGhccmJfXgheSXIQvASrZXDB38nyk
         C0BpwaGylBXFD80mhj1BbwkVlWIBHrZ3v5uYITEge4kw8CU4gDHFMZkzYd/fasu2VlF+
         kIqVr23tGj2G/NQDvOg0tDyAv80mwG9nmLAVWWRjmKbuHjokfqZqNj8CS4KmFSjj4LJk
         tw2fyilD6IxhWAfrqyUcxQgvgJPEd7owTY0Mzp21iNCe0sUDRfmidrmn9L2C7+mtNvgf
         GckA==
X-Gm-Message-State: AC+VfDzX0jUxHmViGDkhbNcDs4ua/gPS2YJrzSUZUh6xmFs0vuQREbmK
        jmO1QdKlFAdvJoKZflvy8p0=
X-Google-Smtp-Source: ACHHUZ7paph6xVb/NhuTTI4eNtDb+67lL8bhKS1zCd6ORuuK2IOt6uRlYgRZLS0xEyaNPxJo0e1tOw==
X-Received: by 2002:a05:6a00:c8e:b0:63d:2d99:2e7c with SMTP id a14-20020a056a000c8e00b0063d2d992e7cmr23780152pfv.0.1682988058323;
        Mon, 01 May 2023 17:40:58 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b6ce:736b:e4f7:adb])
        by smtp.gmail.com with ESMTPSA id s23-20020a634517000000b0051f17e4e1b2sm17187902pga.68.2023.05.01.17.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 17:40:57 -0700 (PDT)
Date:   Mon, 1 May 2023 17:40:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4: Use %pe for error codes.
Message-ID: <ZFBcF0ZcBfMFdZLu@google.com>
References: <1ec25bf991f576a98bd8fdc58264a92ee268eba9.1682793592.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ec25bf991f576a98bd8fdc58264a92ee268eba9.1682793592.git.mirq-linux@rere.qmqm.pl>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 29, 2023 at 08:41:19PM +0200, Michał Mirosław wrote:
> Make the error messages a bit easier to understand by showing
> error names where that's enabled.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/rmi4/rmi_driver.c | 66 +++++++++++++++++----------------
>  1 file changed, 34 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_driver.c b/drivers/input/rmi4/rmi_driver.c
> index 258d5fe3d395..82d85c02a873 100644
> --- a/drivers/input/rmi4/rmi_driver.c
> +++ b/drivers/input/rmi4/rmi_driver.c
> @@ -69,8 +69,8 @@ static int reset_one_function(struct rmi_function *fn)
>  	if (fh->reset) {
>  		retval = fh->reset(fn);
>  		if (retval < 0)
> -			dev_err(&fn->dev, "Reset failed with code %d.\n",
> -				retval);
> +			dev_err(&fn->dev, "Reset failed: %pe\n",
> +				ERR_PTR(retval));

If this is desired we should have a format option for
non-err-ptr-encoded errors.

Thanks.

-- 
Dmitry
