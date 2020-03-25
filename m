Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D81A1930D6
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 20:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgCYTFn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 15:05:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:39064 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgCYTFn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 15:05:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id i20so3740233ljn.6;
        Wed, 25 Mar 2020 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pcRErvm2Q518gCbI05/42E3zgrQBPnKUjsE254rV4i8=;
        b=jOsvlDmAnsWF8Zgi1Kc+OAsbG3gWnfkPWsVsEAuywtsKrez7awraN/gAflS+VbGpgi
         lTb+NL7GMqfRW6s9+bLM4tq5JXPaRTnpJQJmzpbZMUsMKaLogF/62JoIQws11Q2bz4Q3
         kN/q/qbygHS9gbZrwgeP3stxTlSaXTAQB2tLTdVrTk5AZISotzbrm9fUhQddE8Qhp57Q
         vmcrjRIT5KEr16szoVRPVX9XZpfEia+hbwv14K9xL0XSS116ExAvKiJVMqzwNUOhj3U4
         Ehspp7hOpL4MalroyZbd3HkMeCw2OmCrO1o/WDTFKkxu9nDrazlcmxDwFmTMOraeEopO
         kANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pcRErvm2Q518gCbI05/42E3zgrQBPnKUjsE254rV4i8=;
        b=CpSO9ng2HxSRENHsqLi8NeR7p2tOMWk6Di29Lz0CCpwaZGPxMSfhnLqPHBUbHVgAfS
         MMka3msRsHyt+cE8WAVfAyWCQ28EGbXR7JJwZ2SbLuPDB3VqtC1x8xvq3JAqkkf3InWp
         qgtrM+DIt8WwY2wKSpO5l9jV35zA3BTUOSM8WvnqR1dbYulCakueBLw+lUIxh0ZeTX9R
         mdNzguAxgn42y5/QfHOZlkUoQ3sLIRXn2urtT68FnvxZIZHeoWFu+XkuzhJXW9+4XeMO
         TuiRoSiRFSmhTwVXGPW1gIB7Nxbo/AZNoXmvOV8X/cPN/oIj3mP6V7zBE0iiGNumSbn4
         E0tg==
X-Gm-Message-State: ANhLgQ2Pjc9+c6fSvjGVF9h0fyXw0mU0ritWV+gc9gVKqAlkIWNh37LA
        g3oGCremauC8pWoDk6ZQ74U=
X-Google-Smtp-Source: ADFU+vtNtlANgH6ZU/SxscTh0o9bgRwziu95+xWxmtzh+N/lwSGsvM5yQMpXh/Hd6K53fTv+dhxjBg==
X-Received: by 2002:a2e:854e:: with SMTP id u14mr2793589ljj.95.1585163140593;
        Wed, 25 Mar 2020 12:05:40 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id t23sm4927602lfq.4.2020.03.25.12.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2020 12:05:39 -0700 (PDT)
Subject: Re: [PATCH v9 13/55] Input: atmel_mxt_ts - add regulator control
 support
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        rydberg@bitmath.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200325133334.19346-1-jiada_wang@mentor.com>
 <20200325133334.19346-14-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <672615bc-adce-213f-9e44-864163c0a770@gmail.com>
Date:   Wed, 25 Mar 2020 22:05:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200325133334.19346-14-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

25.03.2020 16:32, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> Allow the driver to optionally manage enabling/disable power to the touch
> controller itself. If the regulators are not present then use the deep
> sleep power mode instead.
> 
> For a correct power on sequence, it is required that we have control over
> the RESET line.

...
> +	data->reg_vdd = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(data->reg_vdd)) {
> +		error = PTR_ERR(data->reg_vdd);
> +		dev_err(dev, "Error %d getting vdd regulator\n", error);
> +		goto fail;
> +	}
> +
> +	data->reg_avdd = devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(data->reg_avdd)) {
> +		error = PTR_ERR(data->reg_avdd);
> +		dev_err(dev, "Error %d getting avdd regulator\n", error);
> +		goto fail_release;
> +	}

Hello Jiada,

The new regulator properties should be documented in the device-tree
binding.
