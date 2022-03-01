Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1234C8484
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 08:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbiCAHER (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 02:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiCAHER (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 02:04:17 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576AE4B1ED
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:03:36 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m13-20020a17090aab0d00b001bbe267d4d1so1384961pjq.0
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KgLQK2L9yySuV0x1TLNUaS/YPtYQJwG8B5LXqaZRS/k=;
        b=dQPLjE/7SuLcBB1klQh9iqM7aXcvBVgc4eL8R/BhaO2J2sZnwc1atAXtHyLENZD2qe
         Lpk3rwxuWGVOrmZxDGjl9qYaH1fR9Ntv/wKhZyhNAa7NHD8QY4Ik1cxaSNWaZZvoPEUS
         AVhtC3mmd1GS/0RAo84EYNBuRNlJcfKD1F3IPHXhvpTg5Imib7ww0xyeSAj9b8D0PsXe
         RoqR3hBrxixWlotK8sDenmTbIb9/6aqUeaslr3D+fhbvyy7JXEN2FJNK1CbjxIkSbWhl
         ZggEp5XbLnAZD8QAjoqyXTA8PgcU/+wK5ELNQVhxx3K4Nv5fp9UnnbRIU0dGBwvTvdwo
         nz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KgLQK2L9yySuV0x1TLNUaS/YPtYQJwG8B5LXqaZRS/k=;
        b=Cg0v5W4g343OBc+oNu8Mb3Z0BWcz4rUPJmkTIKB7IQHxmLEVgaLrGugsBnyAxTkMjw
         zPquHIASPNY0fhDAqYhSqVWwlSXRQipB25bW4PFSEwRUHakC1S8rroULURECuZjyJ0D4
         Lc5V6GKW4tcwFTKhHBDb1TCo4yghbF4revg8KBHwkDtdJaqBOGf0358+Sd71qh4u5se0
         D/vifrqzLwyoCIsEFBBFJQgDpsFwva60+C43aehKQL9Uw3YMGSMYwycNgFV2RmHMnIxS
         j20vRkRozxHqU8SqGf11dKQmwl7UK9nd7zXWb4NOqt/RBWaAWQ/ViktCnCyq05nFyH7G
         FxYQ==
X-Gm-Message-State: AOAM531WCNkVHkvrogO18yATI118M9VWtdljlGc0qOQlwSMCGOmOPcpm
        wda6a49SSuoHCAyz9DcnFqJto2JYS3Q=
X-Google-Smtp-Source: ABdhPJyQvCqze+AdgM+QmlzUXxxogH59FkLl8HtdfEsVuCkVTUJxRFFDDZTMLeyjydknABILtBv4pg==
X-Received: by 2002:a17:902:db0d:b0:14f:b047:8d22 with SMTP id m13-20020a170902db0d00b0014fb0478d22mr24202323plx.90.1646118215703;
        Mon, 28 Feb 2022 23:03:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id y39-20020a056a00182700b004e19980d6cbsm16142342pfa.210.2022.02.28.23.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:03:34 -0800 (PST)
Date:   Mon, 28 Feb 2022 23:03:32 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/5] Input: Set EV_ABS in dev->evbit even if
 input_alloc_absinfo() fails
Message-ID: <Yh3FRK0Z/p8w7CsY@google.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131143539.109142-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Mon, Jan 31, 2022 at 03:35:35PM +0100, Hans de Goede wrote:
> The input core's error handling for input_alloc_absinfo() failures

The original idea was actually to catch cases where ABS axis was set up
without calling input_set_capability() or input_set_abs_info(), but
great idea to also catch allocation failures.

> is based on ignoring the error until input_register_device() runs
> and then checks for the failure like this:
> 
>         if (test_bit(EV_ABS, dev->evbit) && !dev->absinfo) {
>                 dev_err(&dev->dev, ...);
>                 return -EINVAL;
>         }
> 
> This relies on EV_ABS actually getting set in dev->evbit even
> if input_alloc_absinfo() fails, change input_set_abs_params() and
> input_set_capability() to actually adhere to this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
