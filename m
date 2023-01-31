Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB634682144
	for <lists+linux-input@lfdr.de>; Tue, 31 Jan 2023 02:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjAaBHB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Jan 2023 20:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjAaBHA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Jan 2023 20:07:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC242FCE0;
        Mon, 30 Jan 2023 17:06:59 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id y25so21890888lfa.9;
        Mon, 30 Jan 2023 17:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i8oNqOnqGl0TJqn6jZQHbNg94bw3DsYJIPuzzD1fNwk=;
        b=LcODaJLsEWVzIjx/pIT0gzk51VcJDCNKLdsZ06vqR6ZiREx9INQ7cVy4vOAxpJ8xk+
         NtkfSRh5hy7OhtnOG5wugoSh8xU5i8LKuMUzjQi5Txr9s+44+BRWA4Hwcnvtn9b8jVLy
         xkrdQJH8tTnFMSUn32b/axfKYg7WdU9cDYQep0p3WeizwAa9DjT0Sf1tqP7SyqMZKpkc
         6jsc45WwIlPMRoDcop7pCgQbQgAgaxZVKjIEQjBVxWrHpI2rbYoIo5nHy3n9yW6HJ5pZ
         4uHs5PPKVe5I7oYYHZpvxaAA9HbA1dvkIoLansFEfec61kL2tOcQ2lLYHpO/jKVWpxJD
         vFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8oNqOnqGl0TJqn6jZQHbNg94bw3DsYJIPuzzD1fNwk=;
        b=N4+C01RCytj4U7W9FllvbqGeouAtsVhMf2UErN0LJZduiLAVj+8gYwanPYsWZ/rg/n
         V6POyfQ1kkzOOjlcEvLUGYeso3yVuQNzbLEK8r5jzS/8if+db8Eo/VT3KqNRU2GajFYH
         obl64iFyaqxXE1GkaY4sofYKJFhPM8V3fhvMyfBKlDIoi3cuYc4PCJWRbUoeL4rKtADR
         RiQ88v4aKwS77Iulp5DP66KOwQ/ZdMPnQpG3vzOZ0Sr/Zy5vXYtDLH8RqyyCthatbzHc
         iWFX4fg98Z6gc2kJ+2fAOdQi2p3mhVWtZ6a7yAC+nHsR44g0hDQuuw4HG+g57NSykv0s
         I7qw==
X-Gm-Message-State: AFqh2krWhGkBvgoqPnXd3sq6hzsshEbEfJCULJV7axGcA6HtvYfUHlB3
        xznAXwDOtb5/CuawUq+Q/I8sPzQ70bF9hpYpMaA=
X-Google-Smtp-Source: AMrXdXvb3x30sDfNnUATc8PmsbWxWBdcxDJwYBYZZcLo+IqFaZaLu7FASDESU0mjuLUkvKoXk362fh0NVQABgr2tT48=
X-Received: by 2002:ac2:4f0e:0:b0:4ca:fab6:91db with SMTP id
 k14-20020ac24f0e000000b004cafab691dbmr4596313lfr.202.1675127217110; Mon, 30
 Jan 2023 17:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20230128202622.12676-1-kaehndan@gmail.com> <20230128202622.12676-5-kaehndan@gmail.com>
 <b3712d74-2276-b7ba-4145-4d9a6d5f3a34@linaro.org>
In-Reply-To: <b3712d74-2276-b7ba-4145-4d9a6d5f3a34@linaro.org>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 30 Jan 2023 19:06:46 -0600
Message-ID: <CAP+ZCCe6J8y=qLMWafXPur1V_0=oQdw2QWqeAZ-C3TroMB4HhA@mail.gmail.com>
Subject: Re: [PATCH 4/4] CP2112 Devicetree Support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 29, 2023 at 5:06 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/01/2023 21:26, Danny Kaehn wrote:
> > +#if defined(CONFIG_OF_GPIO)
>
> Don't use #if, but IS_ENABLED(). I think it should work here.

I think I will still need to use an #if / some sort of preprocessor directive,
since of_node is only a member of the gpio_chip struct if that is enabled
(and thus causes a compile error if done outside of the preprocessor)...
Unless I'm misinterpreting your comment?

>
> > +     dev->gc.of_node                 = of_get_child_by_name(hdev->dev.of_node, "gpio");
>
> You leak it now on error paths.

Ah, good point. Will fix!

Thanks,

Danny Kaehn
