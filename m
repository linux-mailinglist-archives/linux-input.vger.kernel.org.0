Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00F705091A1
	for <lists+linux-input@lfdr.de>; Wed, 20 Apr 2022 22:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382271AbiDTUyB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Apr 2022 16:54:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358062AbiDTUyB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Apr 2022 16:54:01 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFF217E11
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 13:51:14 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id j8so2877508pll.11
        for <linux-input@vger.kernel.org>; Wed, 20 Apr 2022 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qCSct4SgnYAo3WshETVA8Er5fh6+bUwnTYAxgKf17qg=;
        b=ZYXe1xP97OHdq0dafIuHa1lCCyY3mJW+Cjwky1BFLUAeM/DmQHR50qS8s8dn2JBUkH
         sDKlqFJBF50yU1fNndin/Z9MGWh0K8Wonw0Qwwxw0A4/jFOQ/xpNLVjRyTBK9/BhE8mO
         hN1QZ/ZAhjXL64oGTk7bmL0T+sDODhLNAVtyoRYSS69RWgKVN7S/prSXvH75pu8GPPQr
         J81J2xVg8C0bMGWYyPgL7H0x7QYnIojfRfL2mXNkwry22jPwPa9KvViGPlzOEpfl2nsQ
         X9hiL23iZYSlkmc6B+Nckldwkgq7gbWgrRLE5weV97nCH2jULgKhvqg5hm71KrhaTFoL
         UXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qCSct4SgnYAo3WshETVA8Er5fh6+bUwnTYAxgKf17qg=;
        b=2YkjEd6LZAyKTP21vmthrWeY41AB2IDAm11knhy7NcbNrUaz1cNRLl6iYoBvgi5jlQ
         psVbtkRIkwUR/uw8m4TB3HWAWUPdhpIRUysrnbcm9ZlmC61IFWuNulcGMCv9+Ubo0gu3
         BojT1gMY3PQdc9t1L+XJGvZyFQ3CGPtWHqWFBsYIfdzeq9wy7P8wLFOCUosPQ7KL5LaV
         YmjAcnot8qjm98EsmPvRxiQZ3fvNWEugn+sXrC5U5wBGv26kkBbvHQUotvQ8ipQSIMnD
         coCL0vPe5Nks+FUI1kPLaBMk4J13S/73KDYpV4yP/qSRhnFSO/K7UKvTJQ5+Y7VGVxNd
         69aA==
X-Gm-Message-State: AOAM533f+QBl0QEXyhaeqORcSjVOeBLzhLoJEOQ59kUarEZwwPOH19Q7
        P+NaWHDhQiv85VGNUMiGFu5cFs5AjZc=
X-Google-Smtp-Source: ABdhPJyTJX7ffBbjGMfy49wlH14shwmU+RSZE9tVOkkmp713Z+wncxg/jLXgfdH4awbOLOPhnclQhg==
X-Received: by 2002:a17:90b:1004:b0:1cd:510d:c1c1 with SMTP id gm4-20020a17090b100400b001cd510dc1c1mr6389838pjb.56.1650487873761;
        Wed, 20 Apr 2022 13:51:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:fe4b:9301:599b:d734])
        by smtp.gmail.com with ESMTPSA id a133-20020a621a8b000000b0050acaab7b29sm3526260pfa.31.2022.04.20.13.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 13:51:12 -0700 (PDT)
Date:   Wed, 20 Apr 2022 13:51:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org
Subject: Re: [PATCH] HID: add HID device reset callback
Message-ID: <YmByPhFWkzpPrpYe@google.com>
References: <20220419122632.2988786-1-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220419122632.2988786-1-acz@semihalf.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Apr 19, 2022 at 12:26:32PM +0000, Angela Czubak wrote:
> @@ -529,6 +529,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
>  		/* host or device initiated RESET completed */
>  		if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
>  			wake_up(&ihid->wait);
> +		if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
> +			ihid->hid->driver->reset(ihid->hid);

I wonder if this would not be better to execute the reset callback
first, before signalling that the reset has completed instead of racing
with i2c_hid_hw_reset()?

Thanks.

-- 
Dmitry
