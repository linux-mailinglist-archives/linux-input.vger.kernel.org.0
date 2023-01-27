Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB94967F162
	for <lists+linux-input@lfdr.de>; Fri, 27 Jan 2023 23:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjA0WvE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 17:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjA0WvE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 17:51:04 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F19E2365C
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 14:51:03 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso10061964pjg.2
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 14:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u2iFcJxKhM5nq+jL9rDDIju5hyKJ3jShtYLlpgUociE=;
        b=WlM9m4j2ekW25AsGCBQKY4AW8zH0vxInA92SrCJqrfj5BEW+CZvZqhW8Ytu1NZ9XjU
         3gft+sTlIb7JHb114fbeznhEuOO4s919IysCsBrU38TkHZSzcWflyOCmNgR45H0Hba1O
         7zZARMYkaTjDU3p552z2S5PVoUXjIYwAifTtteFbNJsYMWqVLUebzNMlTNJ695UT3Sz0
         3nWsTSccHUEkS6k8OYyI7s1Y2nAwSV3dPDAY/FrqUCzqr+aFLXU8n68rTZDV7lu0dcbc
         w8LEYXQsS0hWxa4VWDqwreDmrsVMHH5rczRnQnMnh4F+rJzywBtYNj8KaU4BpTnKQT1E
         zJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2iFcJxKhM5nq+jL9rDDIju5hyKJ3jShtYLlpgUociE=;
        b=4zTGU8Qu7p8jO4Ogqcon1JpKPTN9q2qluS40FqgBWu1ZOQy5Geg5sp3dVoRB8JDQ3l
         iCmcfwmg19YAl4ur/GuW239/h+s0c85b2ACZhxsGzXmuHO+Nr70/z1JdqX8UPykzJDRb
         lA5Dxx/3/3+6MCjDTRrUuDJuYjBfmkRZRv4XKPqBysVVEja2eMQ+8U2/5zDLjocuc6mj
         XPtexmoYXWmtjmXuxTgvotDMWWxV112z+e0qhfYzKFF2VZOW+0DM4OT7QmwA9LmwJqXN
         1GTNi7xYKgpglMhBfDYxgRao8zgUqrOXRTEd72DWGrIodttVB1dVbJaWn72sktkCKuPy
         TYmQ==
X-Gm-Message-State: AO0yUKWvJyBAobewPbqRCaWKe1WUOoJwNYCBUUsr+GN8OzUo4UZtpS2d
        oo9Mrf1/no8DHqsC8pGaWZc=
X-Google-Smtp-Source: AK7set9uAz6pHImsChXppKn5pIB4Jt2aL7L7bGwg/GrnG2DZwpRwL04aXhh6hWkL+KgJqrNg5znu+g==
X-Received: by 2002:a17:90b:1c8c:b0:22c:c0e:e9a8 with SMTP id oo12-20020a17090b1c8c00b0022c0c0ee9a8mr10893946pjb.16.1674859862522;
        Fri, 27 Jan 2023 14:51:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f44a:5afb:bb52:dec3])
        by smtp.gmail.com with ESMTPSA id gz15-20020a17090b0ecf00b001fde655225fsm12903320pjb.2.2023.01.27.14.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 14:51:01 -0800 (PST)
Date:   Fri, 27 Jan 2023 14:50:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Andi Shyti <andi@etezian.org>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Lyude Paul <lyude@redhat.com>,
        Andrew Duggan <aduggan@synaptics.com>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 00/16] Input: Switch to new PM macros set 3
Message-ID: <Y9RVUuRvtIRSUD4A@google.com>
References: <20230114171620.42891-1-jic23@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230114171620.42891-1-jic23@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 14, 2023 at 05:16:04PM +0000, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Continuation of
> https://lore.kernel.org/all/20230102181842.718010-1-jic23@kernel.org/
> 
> This time we have most of the remaining drivers where the changes needed
> are more complex than the earlier straight conversions.
> 
> A separate series will deal with pm80x as the cleanup for that will
> extend to MFD and RTC trees and cannot easily be broken up due to
> some changes in exports.
> 
> There is a general mixture of cases in here:
> 1) More complex direct conversions - typically drivers with separate
>    sleep and runtime pm ops.
> 2) Cases where the callbacks or struct dev_pm_ops is exported to
>    multiple modules.
> 3) Refactors that avoid duplication of callbacks or exports.
> 4) A tweak to the core input handling to use the new macros - this
>    is different from the driver changes, but seemed sensible.
> 
> Note there are a few cases in here where I a much more minimal
> set of callbacks is provided than DEFINE_SIMPLE_DEV_PM_OPS() and
> friends would set. I don't know the history behind those so whilst
> they might well be fine converted to the generic macros, I've
> left them alone.

Applied the lot, thank you.

-- 
Dmitry
