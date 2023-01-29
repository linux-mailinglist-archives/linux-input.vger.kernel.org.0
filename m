Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF0767FE67
	for <lists+linux-input@lfdr.de>; Sun, 29 Jan 2023 12:05:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231182AbjA2LFa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Jan 2023 06:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjA2LF3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Jan 2023 06:05:29 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B06A31A95F
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:05:28 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so6334410wms.2
        for <linux-input@vger.kernel.org>; Sun, 29 Jan 2023 03:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GppRghTaO1PPI0EXaJTL1WXJ3CX8Xxr7Apc7O6JxpIE=;
        b=G5a+B6C3DVl39IFYfawi9O95blE3YYBKB9On6Wl+CU5HyeKoteSpRhhfUWbLLqyfOx
         flNtXTH2ksCss+Uxgzy+dL1sVAwhi6EDSyAoXjI+UIcYQs3pwILnmibHE18k9Q0whfF4
         WebFu3hISOPMmU+C9Sgylpm03vcBy/SIXyI8IFaI69kR6RULDW6WCqE4wH1UTFxSYtka
         +HMhbIxHxb4NIlwuT+RID+uU+WUvcfHYMhkTKKQsMcKZTT6vwF9Uo24oB4Y8zRrdmz0q
         zWzzb/uR5H7wxh15q6sKxtfhRmcWS4Un3FSJ1En63TToOmYRC5AR421TnhFFruOIMfos
         2mWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GppRghTaO1PPI0EXaJTL1WXJ3CX8Xxr7Apc7O6JxpIE=;
        b=saQE/CWuTs6E2tE44/s27UG/T2Qz7pUvrrLGSbPShAzeME7h7Ugj0v2klJ0KIh3e7K
         sRku/zaU2pwn6rSbcCuV14LIw2H3GUMWOIYw2Nlkwi9jB3HULLDNUPUR5jOv1XbJ+slH
         OeYUmzu8QPlfj8P8i9wC1gdavx9T/k6wYnuiR7tGGxgYhbowO+zaqXvffXA14SQdW+5h
         xjOvTtw7/v9Oshg+YuPJ6C68zKCULnD7sIXRbYMPo4CoEVcmTFV8LJgqnpAKCCKYRgB5
         SEWwrUnvOWrmyOwcRAkVL2FTN5nkDeBzuQ+AuWtemgK/T2CAEjv4/1IqyKlbdlDRXlwk
         f7Ww==
X-Gm-Message-State: AFqh2koj3BWH2WdJUe/EZH2Hn7NDP6XnL990ejpNy1w7YfKb98XVuk2R
        Ij690gPTYCUpkhuEMsV9MIlMRQ==
X-Google-Smtp-Source: AMrXdXs2GBEtFwFFY5voNaTr0MeRTH+8VGwCTmSO8OpHOvOb201rEwyoUoNDSVtpihNsGb4VFOWVJg==
X-Received: by 2002:a05:600c:4fc6:b0:3dc:d5c:76d9 with SMTP id o6-20020a05600c4fc600b003dc0d5c76d9mr21132629wmq.0.1674990327296;
        Sun, 29 Jan 2023 03:05:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k4-20020a5d66c4000000b002bdc19f8e8asm8891088wrw.79.2023.01.29.03.05.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 03:05:26 -0800 (PST)
Message-ID: <07e44a94-70e3-fcb7-a2b7-086775ebc560@linaro.org>
Date:   Sun, 29 Jan 2023 12:05:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] Share USB device devicetree node with child HID
 device
Content-Language: en-US
To:     Danny Kaehn <kaehndan@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
References: <20230128202622.12676-1-kaehndan@gmail.com>
 <20230128202622.12676-3-kaehndan@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230128202622.12676-3-kaehndan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 28/01/2023 21:26, Danny Kaehn wrote:
> USB HID core now shares its devicetree of_node with its child HID device.
> Since there can only be one HID device on a USB interface, it is redundant
> to specify a hid node under the USB device (and further, binding this way
> isn't currently possible, as hid_driver does not support of_match_table).
> 

Here and in other patches:

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

