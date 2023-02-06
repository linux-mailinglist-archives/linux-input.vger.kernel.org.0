Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CBA68BD96
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjBFNPr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:15:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229762AbjBFNPq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:15:46 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F09A15CB7;
        Mon,  6 Feb 2023 05:15:45 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id b11so2152081uae.4;
        Mon, 06 Feb 2023 05:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=//AUB3TWxs4juv07IW+xqrjwA4jnxLVnxEL0hITHhYk=;
        b=RGgVBjNEbYlbtKjoS+8A6vjG1gg1BaRhiQFZtwSrDG5iSho0hGwoHkR5nk/q1JBh8g
         dOr+icnm+iTPf7fXz1jIA6cPTzXUw1o2BZh6NwNcXL9hSbVlkoRLp00NeEotbwuy14ZU
         e/jLaknvW4bI6/nUDSLUt9JdTnxFrRr/VddIDoIjVgwc3l2nir/JB1kDDZEH9j8G+18n
         UpKqBd4CI6YRN7Hd5V0lynMMy0W+on1D4hPRmD9gr2kooRmOSBv9vRInBLoCY62qUzX7
         kggeTkmyOpkE1MAsFrX1lD1nKc2N/jjDb4k2cCvstJ7a/RSDRmkxxexdDMFzNN3DG9wr
         LOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//AUB3TWxs4juv07IW+xqrjwA4jnxLVnxEL0hITHhYk=;
        b=5YZwwjg+3+ifffXKvzoJ45KQ/7Bp5Fuvwfg1nABQpjzpGgWk3ddQ+ZWkz3IxLdukfR
         6onhv7QbhPfBlybcriUv6VXR2cf1vBH70bUsXPaVK6qc++JOfs01nr0OLr4vYkUD68/y
         QDSQkHxgyIF5QIrAWA/h9ivlgf+kHRHgSUCfTs56TVzZZ5TmUW8vb5TgNMuH9X125Ncv
         jZSrUslOF5yvCjTZjLMJTd5gekY5xun/pDmloUGyfV7QnaTaVqPtgYt0DAiyeiOx46Co
         b+JFCUmeHp3Wp9Rjxsfhr7nZwRi5Aq/9aooGpRtKtUClohlUPJQ+VLwhEVcoKf+FPc9P
         8naQ==
X-Gm-Message-State: AO0yUKVruI1k+jhbsdpGJpJjJwzT5LnirBbZ+MJDjCFDFv+wQa6LZHta
        ijn/gd49OtAw/YaLuVfg6dq52bHLI0rtkZMhvX8=
X-Google-Smtp-Source: AK7set/pSCD6/suwk/8eQ3AY2BHJrxOskw8mVMYeNA4ROOQCLLbTxiw0StRZrR0A6NyWOs3saB/2mHEbsDBGF7CuSX0=
X-Received: by 2002:a05:6130:d8e:b0:65c:9a4b:d390 with SMTP id
 cp14-20020a0561300d8e00b0065c9a4bd390mr2740370uab.62.1675689344501; Mon, 06
 Feb 2023 05:15:44 -0800 (PST)
MIME-Version: 1.0
References: <20230205145450.3396-1-kaehndan@gmail.com> <20230205145450.3396-2-kaehndan@gmail.com>
 <8eadde99-28b5-5d21-7c15-119797f11951@linaro.org>
In-Reply-To: <8eadde99-28b5-5d21-7c15-119797f11951@linaro.org>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Mon, 6 Feb 2023 07:15:34 -0600
Message-ID: <CAP+ZCCfA4uMMvw9UtcN5TL7faFWgGrVT6U8RKFs=tUB8iGAQMQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: input: Add CP2112 HID USB to SMBus Bridge
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

On Mon, Feb 6, 2023 at 1:59 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/02/2023 15:54, Danny Kaehn wrote:
> > This is a USB HID device which includes an I2C controller and 8 GPIO pins.
>
> I actually wonder - which part of CP2112 is input or HID related? The
> manufacturer advertises it as USB to SMBus bridge, so it is an I2C
> controller, thus should be in i2c directory.
>

That's a great point - - the device is technically a USB HID device,
and since HID is usually used for input devices, it's lumped in with
hid and input devices on the driver tree. Though, since dt bindings
and Linux are separate, I see how it would make sense to classify it
differently on the bindings side. Though I wonder, since it has both
an i2c controller and gpio controller, should it go under mfd? Or,
since i2c is its "primary" use, going under i2c would be fine?

Thanks,

Danny Kaehn
