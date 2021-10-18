Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFF44328E4
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 23:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231858AbhJRVQO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 17:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25187 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229555AbhJRVQN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 17:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634591641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6eBzORXCbFEMu4YDfNXk+RL3umCNwL4ub/VK7Fp9vPc=;
        b=Yp5k+3H349YrCUHrKhtOtOD35uPxmJPLz0gnEkDYVicgk6eZJnEF9DESUK24VjdrnCk1ga
        HQhuoAvvh/YxLX03Powm5AOfNyRCxOn/SSOhTmmpXpOhekVbmC18796vf5JC1ndhcr09WJ
        GuQAFQ2k1rDYaHTJwaljWslRbZopcOc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-HqbfbHVTPCy_zP9uxFdlzQ-1; Mon, 18 Oct 2021 17:13:59 -0400
X-MC-Unique: HqbfbHVTPCy_zP9uxFdlzQ-1
Received: by mail-ed1-f71.google.com with SMTP id v9-20020a50d849000000b003db459aa3f5so15521109edj.15
        for <linux-input@vger.kernel.org>; Mon, 18 Oct 2021 14:13:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6eBzORXCbFEMu4YDfNXk+RL3umCNwL4ub/VK7Fp9vPc=;
        b=n+sSDdLoT1maFwgxcxe8kBDac3SF2gVVSaLyWMZN5KHuyY67beSt7IFxg/sazBMGRb
         gCTpJ67/TybZvT4QCYkjUku2If7ZxiuBa9s/7SLha+i5MOulTIIjltB5OpgwAAC7Z1zv
         fALqEJLhZoxO+X/kAJ0jaMGCC1ne4ReJSZjX19ESfJuYmL/ktVfFE9otQwPVa75ncVnU
         cF2INjSlNrf30JyAZuHR+y5iTiTHeE7+pU9o1pCPqpbGSEHYWPzEpMtZpaFI+iMbwELB
         kcIsvnRjcZLginyy0yGMveu5nymMIjQbf1LyiWeETWtgw+7C8YIK0utwHUr8ABIjQSkg
         N2aA==
X-Gm-Message-State: AOAM5336JFvWs0suAGJi07bZgAP5P5qMvrMT3+4JCLYUZc+7DQMszxIY
        hBuWDOkfXCLX3IGErQX0SHtpnoeysbIUfWHm0RuBNJIWdVgNrOIn5lKuRAsVFHuovIv1+DUft7L
        XxcZ6qYSF6VjgCJLf5fDaldg=
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr33861142ejq.299.1634591638509;
        Mon, 18 Oct 2021 14:13:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR/1A9wzRRVEB3L+RBQpU75fFxxxvftqHqqkyF3AqtMVIPa7tvvcHIcNFBuxFp+GpIaMN07g==
X-Received: by 2002:a17:906:4895:: with SMTP id v21mr33861086ejq.299.1634591638159;
        Mon, 18 Oct 2021 14:13:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z13sm6933808ejl.106.2021.10.18.14.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Oct 2021 14:13:57 -0700 (PDT)
Message-ID: <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
Date:   Mon, 18 Oct 2021 23:13:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
 <YW2UNRAWUphJqhyW@sirena.org.uk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YW2UNRAWUphJqhyW@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mark,

On 10/18/21 17:35, Mark Brown wrote:
> On Mon, Oct 18, 2021 at 04:33:22PM +0200, Hans de Goede wrote:
>> The soc_intel_is_foo() helpers from
>> sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
>> sound subsystem too.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Does this mean that you are ok with me merging patch 1 + 2 through
the drivers/platform/x86 tree ?

Regards,

Hans

