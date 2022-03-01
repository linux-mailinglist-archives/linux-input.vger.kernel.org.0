Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F484C849D
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 08:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiCAHFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 02:05:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbiCAHE7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 02:04:59 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95401583A1
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:04:18 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id q11so12724273pln.11
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 23:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EjwOL3y5O4d0DCe2fxX2+SrP2QXUrvmpSlAE5LBvsJY=;
        b=jVQMX7a3ig26XIwqEnzvqwY/X3/8ELRr25DhQgvC0HCWvFI2ISxhw6N9frCT4mp8RR
         PaGFZ3uP+CmfUxmnsLgaNM1ciTcvGkI1ghgk1dGcHINSoCiPNA4sipsvslaEJvYJWIHw
         n95zrVWxUbKkNdSSlNMMX95yDA/6xdOsGBmi58ZO6s4mUDtnoY1Z/4eoj476cEmFUFt9
         cgzss/UeC2O2SdSUIS8Scvp7Jv73b8Je1z9VY3kxnlNxTitzFwszdWBVM5sTGzJZLc7N
         gg+lH6f+h3z3QKUED4lzXErBhcOn9s6NdPUHS+8oUNPKPAPYlRyIO0TjuVwCGo4eg/AH
         /uMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EjwOL3y5O4d0DCe2fxX2+SrP2QXUrvmpSlAE5LBvsJY=;
        b=ddCCf3Iwwm8dSKa+u+HAU1uJR6FLUQ00fj4hp4078LDkSgjsaAuErtRVbB/EB3v30O
         LkHtlphAK1rEh8sLWmXCcnnxbbmhBoRGZYKmr7r8AJXaxFPYJaCPY8Fk74QuLEIWzawq
         oVUeJO52jot0WT4tDmaNHP4cCB2A9RUkuJ8BD1vgiPoLtW4hqg8F/16ZZWtEuc/cjjVR
         Kwur1Ep5OvdEIYwBek7fIG3r+d6RjCZdNLKKRPYeRl9lcV10BZYC1k74rwYNKYpXBe8G
         YkRo5IqfXbDYeC0xNSthVT2vxR+wwdfbTU/yC/dgG2pv691hRdYmVAc219c+G9wnCENU
         vjyg==
X-Gm-Message-State: AOAM533Plxyko/iZQQ4PfvvvrYeTp3gB11XRaQg9Q6q8WyIl3jbmJwZv
        IDew6T/hrboSX3DkYf318UHbelLSoJ8=
X-Google-Smtp-Source: ABdhPJzgel6HqiRgQfkO+6PiZYodl/zUU28ISAjzFSwLh9NdnXHxhzcbJ+jJ9R3sfoHeqbf/naFrnA==
X-Received: by 2002:a17:90a:c901:b0:1be:ce4d:7cee with SMTP id v1-20020a17090ac90100b001bece4d7ceemr3973160pjt.213.1646118258000;
        Mon, 28 Feb 2022 23:04:18 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id y74-20020a62644d000000b004f129e94f40sm15322625pfb.131.2022.02.28.23.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 23:04:17 -0800 (PST)
Date:   Mon, 28 Feb 2022 23:04:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 4/5] Input: goodix - Fix race on driver unbind
Message-ID: <Yh3Fb9uCfzYVLeWd@google.com>
References: <20220131143539.109142-1-hdegoede@redhat.com>
 <20220131143539.109142-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131143539.109142-4-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 31, 2022 at 03:35:38PM +0100, Hans de Goede wrote:
> Because there is no way to detect if the touchscreen has pen support,
> the driver is allocating and registering the input_pen input_dev on
> receiving the first pen event.
> 
> But this means that the input_dev gets allocated after the request_irq()
> call which means that the devm framework will free it before disabling
> the irq, leaving a window where the irq handler may run and reference the
> free-ed input_dev.
> 
> To fix this move the allocation of the input_pen input_dev to before
> the request_irq() call, while still only registering it on the first pen
> event so that the driver does not advertise pen capability on touchscreens
> without it (most goodix touchscreens do not have pen support).
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
