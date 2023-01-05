Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 820C565E932
	for <lists+linux-input@lfdr.de>; Thu,  5 Jan 2023 11:45:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbjAEKpS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Jan 2023 05:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232344AbjAEKor (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 Jan 2023 05:44:47 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C02E244C5A
        for <linux-input@vger.kernel.org>; Thu,  5 Jan 2023 02:44:46 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id v14so26837631qtq.3
        for <linux-input@vger.kernel.org>; Thu, 05 Jan 2023 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNRD8jAXca9n/dIKZ1bxA61Ox3J99wFxFx2Cc/KkiDQ=;
        b=dvepq4DY1CNgGNhzC2OC9FdNGDlzEk3r29cJEWfku7biogA681SPKuaml7Vv31k4nQ
         rOFofy65MQRNBYIAu0sxJUNw3JBNSMcq+s71ZUdh4eO5Ks7wEP4csjAjqxW9vAFFVpEu
         /eTJGWRM/pfBB5mwAwGds3TDWTRs2KAmMp/cQKbNbbJv6zeeQCCOAnZRg0IGtrFybkOK
         pdywZ+ylSb91e/Jqwd0/EVdapvyv9mLThIDwbCs6yADtsHMCFrWwCIt6/tIP5yccKXMa
         Epk717U38/dNdG6xVoz6/eqoODlhMOsw05dhQBO6kjaltaH2n3aAmEAZzCYIKEHwYDZ4
         1P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNRD8jAXca9n/dIKZ1bxA61Ox3J99wFxFx2Cc/KkiDQ=;
        b=xdKBNAWz8M1Z2zC8+QjM42t3dETdW2QZBoC/fV4w8lyn6YBOE3X9N1XtM27FjowfQv
         jJ6p84EEwwIEt+Vk0uxqpdJp0SfOVpjqf9f8Q94zhLwjz2RlVlnLNBUmm4+9Ohaa1UnC
         /5YocsdhnnOY4AME7nkNr/9F6CHccRaJbh5koVyykFPM7YbZL8fGSqXf2hoKlAAr/ie8
         c9wBbO3/HRuRGcoITIYrQM70d1KfMuBgVfxyYDEY0oOTlbqkb21wCLF0QlGR2pROQVoB
         M7Pnj0wX8HnRvCzD7Z1L/2ekRNnCb5Fn9gF44iWzkE5s5gYdmi01mMTQn9wEKMsZXZ1F
         n2DA==
X-Gm-Message-State: AFqh2kqxoD2O9k7uxw8wvFScA/4IhEEai1vaYxdMM5ZUzZOlcobWP60g
        CYezxepEG4EMQ1dl4YVusfQ=
X-Google-Smtp-Source: AMrXdXs01/tQcXwypRZ3l4CW9jUFTC1X3bV/QifvvL6tQiaVkAGDWxy8FaXbVbA4XZyaApJ2dgT06A==
X-Received: by 2002:a05:622a:1646:b0:3a7:f6cf:a597 with SMTP id y6-20020a05622a164600b003a7f6cfa597mr93009735qtj.33.1672915485841;
        Thu, 05 Jan 2023 02:44:45 -0800 (PST)
Received: from localhost (net-93-66-86-112.cust.vodafonedsl.it. [93.66.86.112])
        by smtp.gmail.com with ESMTPSA id bl41-20020a05620a1aa900b00702d1c6e7bbsm25249823qkb.130.2023.01.05.02.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 02:44:45 -0800 (PST)
Date:   Thu, 5 Jan 2023 11:44:42 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, djogorchock@gmail.com
Subject: Re: [PATCH] HID: sony: Fix division by zero
Message-ID: <20230105104442.4zt4dm4mmgbtde63@ananas>
References: <CAEc3jaDf_TqzxRt3m=OscjLcg=L-jYhNq2r7jEyD6Z1pFo3NRA@mail.gmail.com>
 <20221228180130.47ix3afwbv4bmqfc@ananas>
 <CAEc3jaD-Z4F8CQBHKrBV=H1JwO3LhQMxy1rv2k30rCYhkr1CmQ@mail.gmail.com>
 <20221228215838.7rxsevi4wfldmm2j@ananas>
 <CAEc3jaAq7wH1b_jmw-t__Fc4xG6bTpW8hTnBf0gF8L04-sSiEw@mail.gmail.com>
 <20221229192119.jy2q4xaipfplqjbd@ananas>
 <CAEc3jaAvAh__5AUwjat4qQzLzSsNCAncYQtEX5ExXX1Hxh9cLw@mail.gmail.com>
 <CAME7zCKPjFbE6nSSoQOVK=BnFG0YAvMgHjAmHKTXcxk3Weuo+w@mail.gmail.com>
 <CAEc3jaBz92QRKCs1Ckb0njDNMu4=CHZcUJ=MPif3Mzvw_Xok2w@mail.gmail.com>
 <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAEc3jaD78h1qbWg+QQ40_yv5xc-oGFHAEyEOx2Nh20C-pxwcJg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Roderick,

sorry for the late response, I've been busy in these days. I'll reply
to both emails in this one.

>Thanks for testing. I added a similar patch to my hid-playstation tree
>this morning (hid-sony will go away soon).
Ok perfect! Does hid-sony will continue to support old Dualshock
controllers or they will be all merged into hid-playstation?

>I'm not entirely happy with the patches yet and need to do some
>thinking. The issue is the value range, which is not correct. For the
>accelerometer the numerator and denominator need to be 1 to match the
>proper range. (It just happens that the scaling factors are the way
>they are I think.)

>The uncalibrated gyroscope values are 16-bit signed, but the hardware
>limits are +/- 2000 degree per second. To have enough precision during
>calibration the value range is extended (resolution per axis is set to
>1024, so 1024 corresponds to 1 degree per second).

Can you tell me a bit more about what is the expected calibrated
output for both gyro and accelerometer? 
Like unit of measurement (I hope deg/s and m/s^2) and data type?
Is "1024 -> 1dg/s" a mapping used only while calibrating or is the
expected conversion during normal usage?

>When I heavily shake a DS4 in evtest, I can easily reach values like
>15 million or more. However, the maximum value we have set on the
>evdev node to about 2M. In other words there is something wrong. I
>need to look closely at other internal code.
Definitely seems there is an issue.
Can you suggest me a tool to test the gyro/accel using linux?

Thanks,
Alain
