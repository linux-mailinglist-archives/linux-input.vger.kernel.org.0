Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 423507A8291
	for <lists+linux-input@lfdr.de>; Wed, 20 Sep 2023 15:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjITNDW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Sep 2023 09:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236403AbjITNDU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Sep 2023 09:03:20 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63D9F3
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 06:03:05 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso109078231fa.3
        for <linux-input@vger.kernel.org>; Wed, 20 Sep 2023 06:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695214984; x=1695819784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztb1RGGYrfwP5JwjfpfbJ/dfRAOrJ8qtDmO12YBZve8=;
        b=nNynK4HaY31bm6NQiYtVm1hHlhFQVf6oVrSnh7HXQP5oPPZLSGkpaJhbgHqdrxDoSQ
         9fIR5RBFx0BclxnLPE5WZFeZK2PF11rkGOLg3XRVhEQcI0OOzF1Xt1nPWxDSXOfNDPot
         4hLMQQX/+UUSzTlH+IRuhEGKjZSiS15EAtMF/y/ulga5qIspfKE2X9UvTrCBVcyer5Q7
         HljgQKHQw86kw1KHWV1+nYSOXD1fbBmkqLugz8iUEW+c2i8HLoMIOEjPoyaYWpEw67up
         wLBS2v+jRquOmMxbH9Utg1Zzn2jppVGQYY9M4mj9rwTBL4gHkPRv3rTty/8SuKPzw4rr
         1oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695214984; x=1695819784;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztb1RGGYrfwP5JwjfpfbJ/dfRAOrJ8qtDmO12YBZve8=;
        b=FYO/nLXtQAOcSmVJRmh16yYOGGAohQ+VKWrZn63w5+yrZA93imnpI2CA5906UBQEFE
         RTgwe4dIDz6O4Vz64xoEOVjPa04p3V2bNBP5n/VU32b3+r+O5iMMtNsU6NBnvv6c+3kE
         vfL8pCupQap8iGQw72O91HPDM1diFkZ9qZy5FsfeIUq/RLKHZMpHol+APy3pGbVLTWAb
         vnZM4z8JUJbkpQeo7Oovn4IKoBC6zYrQ4rEihl4oEPy9qFNcDQTEAR5Ga3zJR3N85j3t
         7oOeAxFyPaV88uZTyAY2IbeKyP7HztiRjRfh8QGG6OqgMUKcqARvztKBAWB0a2b2OyWw
         Du0w==
X-Gm-Message-State: AOJu0YyjwXMGG8NtZ1cycljlv4ZFI6MhH2aKgIOc9ytihe5rcN/isP3x
        BCO/R4JYMo+3EHln7WtfePhCVg==
X-Google-Smtp-Source: AGHT+IH4JPL2VNc8ltA2Civzr7C475DFU0XS/aR6ZfXmibqfLpGuImdITfEbdIV7s241TmLXgE7n+Q==
X-Received: by 2002:a2e:8656:0:b0:2c0:3413:5d9a with SMTP id i22-20020a2e8656000000b002c034135d9amr2367001ljj.34.1695214983582;
        Wed, 20 Sep 2023 06:03:03 -0700 (PDT)
Received: from [172.20.86.172] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id h27-20020a170906111b00b009a1fef32ce6sm9507844eja.177.2023.09.20.06.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Sep 2023 06:03:03 -0700 (PDT)
Message-ID: <8691c163-5d1b-dcf7-45f0-d450b71b5a05@linaro.org>
Date:   Wed, 20 Sep 2023 15:03:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 23/52] input: pm8941-pwrkey - Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        kernel@pengutronix.de
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
 <20230920125829.1478827-24-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230920125829.1478827-24-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 9/20/23 14:58, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
