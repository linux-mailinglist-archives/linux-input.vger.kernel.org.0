Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29BD7664246
	for <lists+linux-input@lfdr.de>; Tue, 10 Jan 2023 14:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbjAJNuQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Jan 2023 08:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231974AbjAJNuK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Jan 2023 08:50:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C686E3D9EC
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 05:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673358560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=teTLpIxdbTtTNHVGXJ6w9Bc6uBamTOnk9njzhvYbxSE=;
        b=HCNo31Ptp3qJ7vumzvEhCbYmfJrmXqFNP8RMA3/z93qFi9WF3itKrgMsf/yX/jjgRECjHU
        Zzv3jIsFoOlqsRrNp1nQLQKlg4eNEr8MHdNvca2D4iQFd8cgBrae9hst3o2Nw3XPMeiTox
        S+iLd2BTt3//QpFHtk4o4qXDDL+BAg0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-157-1ZO5KeqVOCeTYNCUNmnC0g-1; Tue, 10 Jan 2023 08:49:19 -0500
X-MC-Unique: 1ZO5KeqVOCeTYNCUNmnC0g-1
Received: by mail-ej1-f71.google.com with SMTP id sh12-20020a1709076e8c00b0084d4e7890a0so3316840ejc.7
        for <linux-input@vger.kernel.org>; Tue, 10 Jan 2023 05:49:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teTLpIxdbTtTNHVGXJ6w9Bc6uBamTOnk9njzhvYbxSE=;
        b=iE4PENT4mbBgRvncX4NoM2YrbcaY5ZiH45NLjNZxF0RQOIJpkTfGRocwQZ2gYxrDO2
         JFHz5kCfxkDjBddj03NjgNSMEdb5rc7Am/hlIHMPH6uWMuHznmzcwdtn2thFs7nmzlmB
         IT73wEyeg48+A9I6whdbxdxXBevuu0mXTggdHf4lYyHb5khWXzbWFOiN+4AzcNk/LdaX
         BFFzeS1GRjaHkXezY/2M33wdHaRftRn8rQs0CFULbtGnG8u+5pNwDGlTBl9Ezigtatko
         ljLys6Fp0jLz18LS77JcLGjUONjUPBrmkNfhiDLgq+p/eqSlojHN7ZU71eQbfTEDQRhP
         N+5g==
X-Gm-Message-State: AFqh2kpOvrjiAdnep72e6u8sIb1yDrHyUPy6MORPPcq1dVuhRkNUsNex
        I7IMyy2p7L1hbbP5XAe8ODOlMgy2KswrElY7EqhObUKdwAXUNBwnq6JC37xnNNTT28niNB+Lt4p
        8uHJUh+MKtRWiY4xKOpZ5xPU=
X-Received: by 2002:a17:906:fb18:b0:82d:1d5f:2617 with SMTP id lz24-20020a170906fb1800b0082d1d5f2617mr60058171ejb.69.1673358557522;
        Tue, 10 Jan 2023 05:49:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMNi7wOlZo4s1Zn7kJ4gUobUV2K2uH9OxwHq0qaI9xN75GwnkqWb7tziva1tODOWUhLIfl6w==
X-Received: by 2002:a17:906:fb18:b0:82d:1d5f:2617 with SMTP id lz24-20020a170906fb1800b0082d1d5f2617mr60058158ejb.69.1673358557316;
        Tue, 10 Jan 2023 05:49:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k23-20020a17090632d700b00837ac146a53sm4952247ejk.23.2023.01.10.05.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 05:49:16 -0800 (PST)
Message-ID: <0497d80b-698c-019a-caa2-b109fd8d5cb2@redhat.com>
Date:   Tue, 10 Jan 2023 14:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] Input: i8042 - add Clevo PCX0DX to i8042 quirk table
Content-Language: en-US, nl
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, mkorpershoek@baylibre.com,
        chenhuacai@kernel.org, tiwai@suse.de,
        wsa+renesas@sang-engineering.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230110134524.553620-1-wse@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230110134524.553620-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/10/23 14:45, Werner Sembach wrote:
> The Clevo PCX0DX/TUXEDO XP1511, need quirks for the keyboard to not be
> occasionally unresponsive after resume.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/serio/i8042-acpipnpio.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 46f8a694291ed..efc61736099b9 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1238,6 +1238,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>  					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "PCX0DX"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),

