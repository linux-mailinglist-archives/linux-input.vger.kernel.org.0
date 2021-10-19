Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C715C433ACC
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 17:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhJSPku (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 11:40:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24505 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232316AbhJSPkt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 11:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634657916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lBWny9l8w5QQ5c/h7R1rNUnAj1o8FomFEG/lW37JHhQ=;
        b=TvhEUa7FKVCvHey6VHmqNNFFSp7ZwccDrloFjA8/Wias9G+EIMxyilUeHM/smRNYBe63Q6
        EegCj6FlTitsaVj4yTJV7E+AhxHDNXDgAlooVuzEVIqc/CLW1gDIbdc9IvMZnp4HWlsD/K
        2T0aJot3wtJBMftC9uyTwQtCYIhj61s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-qEEs9KnNPoSF0pTAiHEgig-1; Tue, 19 Oct 2021 11:38:34 -0400
X-MC-Unique: qEEs9KnNPoSF0pTAiHEgig-1
Received: by mail-ed1-f70.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso807391edt.11
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 08:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lBWny9l8w5QQ5c/h7R1rNUnAj1o8FomFEG/lW37JHhQ=;
        b=JTxOgiMvBgFnQx5P/gNiv1euq4diLSqq9BTbKl6143/ZIBsfsndYCVi/xgnXW7tmv8
         +zAJllaYIUlxR3FOdtvyqeSGV+CiAWWjt7KMIFxGO3bZzbqNZ2kbTE3FmkHKG4EBF4tM
         AW8HIqMIkRbPAvxqMpsoQy+7/JZtbLP4FhAnJ4sAhf3D3I1kKguUG+dICzMqqUL6LXYi
         vVRH4Vw5w3woXuSvXb9nf12hJz4YTFB8D7AWt1nT4XQp9HJr3Xx1TE2cumlALNXqBhyG
         W6Nveu5fzrgBRAvuPKt3+aM04QJjAcDoLoB2jTAwjndAxC327aD+S5EFpQvv4kGL15CK
         YsWw==
X-Gm-Message-State: AOAM533xCKjFzg33O/2yO/5tWcW3Dgf1q+HM46cEmcBU7IQVSL7frHN+
        86j6e5UjOQprYX020L04yEwdKpqZ1NaB/YdnJ0H6t4OT6lHemHd8T1DMihpZhGTsCss67wXYmAq
        ib8CIA4o1wCEa3uEuCLfUlI0=
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr55292090edb.381.1634657913653;
        Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG/fAtFGLBchgq7PN24BSIFjwXRBZ3wtMsrjk1m8hP9cKbjUIFYOi0igzOYOGWTbohrYqsZw==
X-Received: by 2002:a05:6402:4243:: with SMTP id g3mr55292072edb.381.1634657913512;
        Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r3sm11033928edo.59.2021.10.19.08.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 08:38:33 -0700 (PDT)
Message-ID: <7b1224bf-005b-03a4-5bf1-3b8ec3de6b4c@redhat.com>
Date:   Tue, 19 Oct 2021 17:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*()
 helpers
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        alsa-devel@alsa-project.org
References: <20211018143324.296961-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

On 10/18/21 16:33, Hans de Goede wrote:
> Hi All,
> 
> We have been open-coding x86_match_cpu() checks for enabling some
> SoC specific behavior in various places.
> 
> The sound/soc/intel drivers used to also open-code this but this was
> cleaned up a while ago introducing a number of soc_intel_is_*() helpers.
> 
> This series moves the definition of these helpers to a more public place
> and uses it in a couple of more places outside the sound tree.
> 
> Mark, I know we are a bit late in the cycle, but if you can pick up
> patch 1/3 (assuming on one objects) for 5.16, then the rest can be
> applied after 5.16-rc1 is out.
> 
> Regards,
> 
> Hans

Thank you all for the review and acks. I've pushed the entire series to:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
now, with Andy's Reviewed-by and the acks added and Andy's
nitpicks addressed.

Once the buildbot has had a chance to play with this I'll push this
out to platform-drivers-x86/for-next.

Regards,

Hans




> 
> 
> Hans de Goede (3):
>   ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
>   platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
>     helpers
>   Input: axp20x-pek - Use new soc_intel_is_cht() helper
> 
>  drivers/input/misc/axp20x-pek.c            | 26 ++-------
>  drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
>  include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
>  4 files changed, 75 insertions(+), 81 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
> 

