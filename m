Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1C15B4A67
	for <lists+linux-input@lfdr.de>; Sat, 10 Sep 2022 23:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiIJVxq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 17:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiIJVxp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 17:53:45 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E41122DABD
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:53:43 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id u9so12004983ejy.5
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6L+PSUGxbdCi19Kzp6BZonN1w/q5i5nMluVZJC+p5yc=;
        b=oA2uqROCT54LhRWj64l3rPm7M+LihrVNBFzDjQRtmDzhEdFWFV4yuo1+Z6N1ScH6T4
         lpvp49uyil2y0E3VGzSNhkZempJXL9Fm27zi352oAgdwpNPZYl8OD+dG0soJ2O88lpDu
         tn91F4x2ZI6SBLyIx6SzvkwmHsqmeTgN97WBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6L+PSUGxbdCi19Kzp6BZonN1w/q5i5nMluVZJC+p5yc=;
        b=0liBUzM1BPsDYPG/++KiVWxo+vYXTBFlRAqp+t++2pqug/seRTpSEoOmYCcU62TzLG
         TkghQ9zTWeL6whpjji6Ii2ESuvkNrEhWA3rdtWfZDiHvGnLJafIEANKnm9COMDWVWPvc
         XMGIAO7sYKxn2LuORHfz0ASf1+WRX1C4iDTRjXX0HcMSKJFf3tDnnv07nNkP4aa9hiwV
         0E3/9ZOlrP1AczYx+HXbK24ac0Jh5AErGLwZchqn7QP9PYMUwMSQ9c4qCR4x0t+n+G1F
         KR0BVuGamK6piTj9Nz7JFh+Xo0++E3Pdynfv1x9tsCrT3efR4BspxFIpGTzlKDJdcYeK
         pJqA==
X-Gm-Message-State: ACgBeo19dlmHhYFSO/jhkqaidHndW5IgieHFgVGMicVmoIN5g9GgeWmc
        168nTs/l+/kwcjLU6ATfFtBaojliiLJLE3c4
X-Google-Smtp-Source: AA6agR7eNG84leW8vkIQIQ6rv9Yhnnkxu0cYzw3/I7yACuuWYb62fTj8PWRowirTk05ekgzI0k0mOQ==
X-Received: by 2002:a17:907:2da1:b0:773:dc01:877a with SMTP id gt33-20020a1709072da100b00773dc01877amr10317457ejc.567.1662846822257;
        Sat, 10 Sep 2022 14:53:42 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709063b8500b007336c3f05bdsm2190372ejf.178.2022.09.10.14.53.41
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Sep 2022 14:53:41 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id n12so9147352wru.6
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 14:53:41 -0700 (PDT)
X-Received: by 2002:a5d:6c62:0:b0:22a:2f59:cb7d with SMTP id
 r2-20020a5d6c62000000b0022a2f59cb7dmr7792616wrz.405.1662846821172; Sat, 10
 Sep 2022 14:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220909102720.v3.1.Ib599a6001558a4afd11016e7016d74dce748a749@changeid>
 <20220909102720.v3.2.I22ae48d8ee064456073a828393704809360c4368@changeid>
In-Reply-To: <20220909102720.v3.2.I22ae48d8ee064456073a828393704809360c4368@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Sat, 10 Sep 2022 14:53:27 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WMJRU9hSXUT7Y47xMku1kAuuTap9xhjWt541GOzhvy9g@mail.gmail.com>
Message-ID: <CAD=FV=WMJRU9hSXUT7Y47xMku1kAuuTap9xhjWt541GOzhvy9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] input: touchscreen: elants_i2c: Add eth3915n
 touchscreen chip
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Sep 9, 2022 at 3:28 AM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> The eth3915n requires more delay time than the eth3500 when poweron
>  & reset.
> Define EKTH3915_POWERON_DELAY_MSEC as the poweron delay time of eth3915n,
>  about 80ms.
> Define EKTH3915_RESET_DELAY_MSEC as the reset delay time of eth3915n,
>  about 300ms.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.com.tw>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Just to be clear, this can't land as long as your Signed-off-by and
"From" address don't match.

-Doug
