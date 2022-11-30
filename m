Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9E863D44D
	for <lists+linux-input@lfdr.de>; Wed, 30 Nov 2022 12:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbiK3LUq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Nov 2022 06:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234424AbiK3LTy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Nov 2022 06:19:54 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE2D2AE05
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 03:19:18 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id k79so2002637pfd.7
        for <linux-input@vger.kernel.org>; Wed, 30 Nov 2022 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BATu+UcqlwtwfiH4MTWO+KZsAE1c6RkNGAfFiYngKsc=;
        b=MWUGFgJ3pPP+HjfH6nVLwvKypRF6J+Sr9LNGi4Tezu8OkPBBJC/D4s+9zBJX9IhKk9
         LHv2LkBJfJabLZ00leMhDqXsvyi/rCK3AIOrXcGF3p+VY3TKh9m3okvgUAEJMUnBpevF
         7seCtYq7oQbml4ZQOO0QIqUZoK5fbAg7nQsCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BATu+UcqlwtwfiH4MTWO+KZsAE1c6RkNGAfFiYngKsc=;
        b=1xedA+vbeJLYSho18xGeak4zTxs8J511nRZM0nVfWRQ9dGwutIE+1E9qZjXngwn90w
         6G2mzXXPM3FMlESpk0uioRPD69Cn3upsFDWMSNPaOaEmByaWE2LbTX3I01QrS4k3CYbd
         bTZS0y6OwJWxHyLbbUAkRtVA4AnMNGn1RRZYEo5WpCoKVThtQhNviNeEmHWE0SOUeKF2
         kQRhombBL3cNg3X5hHnj0laht0NgrDoLQToWky/8GLzi2Kn8P4yBAWiD/UWFzerpTyRf
         ptTaxSZF/J6++MwOEZfdkEVyecbwwzXwPSsTyFyEXc5qDNuYkX1lDHyyXbhm9mK8GHct
         KFMg==
X-Gm-Message-State: ANoB5pmvYKd4dHIYhAuL7zXH7DPONLE75X81IkhS1U57Ra1FbTiZfbiH
        fjT/ClQaWj/0twoONptjAOPwp3Bhmfw9Z7JX6c5gqA==
X-Google-Smtp-Source: AA0mqf5jySgZgQzui4HtwIX1shh1/LW1UBionDIXDLn/xObKoTzJveFzh3gM2+BL/Q8jj8n2pkBDQVBIeobfFvYc6Gw=
X-Received: by 2002:a05:6a00:1812:b0:575:19b6:dfe9 with SMTP id
 y18-20020a056a00181200b0057519b6dfe9mr16659744pfa.16.1669807158350; Wed, 30
 Nov 2022 03:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20221130101021.1868764-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20221130101021.1868764-1-benjamin.tissoires@redhat.com>
From:   Florent Revest <revest@chromium.org>
Date:   Wed, 30 Nov 2022 12:19:07 +0100
Message-ID: <CABRcYmK3x0+1kCe-yJSjKS57t1aLJxRiZRt+tSzzQ0aeuoMvMw@mail.gmail.com>
Subject: Re: [PATCH 0/2] HID-BPF: Kconfig fix
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 30, 2022 at 11:10 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi,
>
> As discussed in [1], we need to add some more dependencies to HID-BPF in
> the Kconfig. This way, when fmod_ret will be available on arm64, HID-BPF
> will get enabled automatically.
>
> Jon, would you mind giving a shot at that patch on your test system and
> confirm the error disappeard?
>
> Cheers,
> Benjamin
>
>
>
> [1] https://lore.kernel.org/r/CABRcYmKyRchQhabi1Vd9RcMQFCcb=EtWyEbFDFRTc-L-U8WhgA@mail.gmail.com
>
> Benjamin Tissoires (2):
>   HID: bpf: enforce HID_BPF dependencies
>   selftests: hid: ensures we have the proper requirements in config
>
>  drivers/hid/bpf/Kconfig            | 4 +++-
>  tools/testing/selftests/hid/config | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> --
> 2.38.1

Reviewed-by: Florent Revest <revest@chromium.org>
