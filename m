Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6086067C224
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 02:01:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjAZBBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 20:01:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbjAZBBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 20:01:49 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239A95CFFC
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 17:01:48 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id az20so1378567ejc.1
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 17:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=diag.uniroma1.it; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WjopSTDIlVYQW+BASB72MQESnjJFz9vIEVKCPp1+0IQ=;
        b=GtC/CeTcpEesVIwH6D0lLpP3Ihb8okBBF6ejVjlc7CNFOwBTXC6O52ljKqfED8I9uW
         Ba4ok6oXGuowBTa5s8ur02R1C6QItcBRVVxRWh4VGQsg2XyCA96dUKzc8+s436O/X8nF
         0an0sjGob+2I89oSEPRT7xMlhxBOVOyzfflDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WjopSTDIlVYQW+BASB72MQESnjJFz9vIEVKCPp1+0IQ=;
        b=Any0oYtNk9gdUzT0jnmWCzDMn+9wvEcxG2BiORVJT++QfpOxwvwWj4RlSaKzahiCig
         bF3lR32ydTaHEm1UGXlMCzW4hXN0fhUzrHbwcv1RFB/q9evS4lB7ikZio5pDmSYWyMJT
         XVDsUVwB0EkRgQRyAJeYzifGs+DenDsv8Rtd+Xv3+KJmAxA/5gAC4YDgxNGHTGbopZWl
         PCWer3LD1EE+HLmpA4dMyLvDhU++FetuAVDXnwq913YTIX6Cbi5353JEfcJ12Qdq2gXu
         PTIEPTVAAU0bus2z+lMN6F7xB1nJVhuWuXOxtyGkEIHQsKcI+l6r3HJ6mCSDuEFHoVfP
         jX6A==
X-Gm-Message-State: AFqh2koZKJ1/IjRY2Sr4spVHmvRGX/Ks1Qqj8j5DeQHcmCz+g82NRjp+
        4nkiBkmSIQRIvrHy0X/KMvwLwvDv7gsWFv3GiyPX8w==
X-Google-Smtp-Source: AMrXdXtJ2GyqnMyk+8rHyUBCTr0/nMRsA66UI/4xNX6NJClyb2Z5LBs3ko3nNifoVblg1BlIhgUO18v0io6XqNgqHxw=
X-Received: by 2002:a17:906:9ea5:b0:84c:a863:ebf3 with SMTP id
 fx37-20020a1709069ea500b0084ca863ebf3mr5726219ejc.100.1674694906652; Wed, 25
 Jan 2023 17:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20230125-hid-unregister-leds-v1-0-9a5192dcef16@diag.uniroma1.it>
 <20230125-hid-unregister-leds-v1-3-9a5192dcef16@diag.uniroma1.it> <CAEc3jaCEKfqEJSV4=6GRj1Ry97xH+HwVSeEOZReNwkt=rLNvNQ@mail.gmail.com>
In-Reply-To: <CAEc3jaCEKfqEJSV4=6GRj1Ry97xH+HwVSeEOZReNwkt=rLNvNQ@mail.gmail.com>
From:   Pietro Borrello <borrello@diag.uniroma1.it>
Date:   Thu, 26 Jan 2023 02:01:35 +0100
Message-ID: <CAEih1qUeDTmN80zSS3ixzVep=5EWhootnjMS8g+pv+C-uWTRRA@mail.gmail.com>
Subject: Re: [PATCH 3/5] HID: dualsense_remove: manually unregister leds
To:     Roderick Colenbrander <thunderbird2k@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hanno Zulla <kontakt@hanno.de>,
        Carlo Caione <carlo@endlessm.com>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Sven Eckelmann <sven@narfation.org>,
        linux-leds@vger.kernel.org,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>, Jakob Koschel <jkl820.git@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jkosina@suse.cz>,
        Roderick Colenbrander <roderick@gaikai.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 26 Jan 2023 at 01:44, Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Pietro,
>
> Thanks for your patch. For sure for ds4/dualsense there have been edge
> cases around rumble removal and others. Those were prevented by this
> 'output_worker_initialized' variable, which is checked during the
> centralized work scheduling function (dualshock4_schedule_work /
> dualsense_schedule_work). That said I don't mind the change as it
> prevents the work scheduling functions to get called unnecessarily.

Hi Roderick,
Thank you for your fast response. You are right, the combination
of the `output_worker_initialized` variable and the spinlock prevents
the work to be scheduled during device removal for ds4/dualsense.
Thank you for the clarification!

Thanks,
Pietro
