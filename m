Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5AC4EAF4D
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 16:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237822AbiC2Ofq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Mar 2022 10:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238018AbiC2Oef (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Mar 2022 10:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DC97E1EAC2
        for <linux-input@vger.kernel.org>; Tue, 29 Mar 2022 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648564369;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=17L5Bd/rDDofYieluRLge+dXOsZZApI0UCMAz+pSmTw=;
        b=LRMXC1/yO4hZEzqN6hujcCbQQauQvkX0QAOkINCbj9HcFHVh9Tb2Flc55erQ1ADxn0xYSl
        nXIyWJPWifDxHP7g0a7II0v48YIonbLnCJE2zA1IwHI0TrUgpRM2mIGQVfWAvdJH+uzkj9
        uM3Wda5+WqFGrt7zTACCAjt581PXnx4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-RFp5aOJPM7W0-MRhOiko-w-1; Tue, 29 Mar 2022 10:32:47 -0400
X-MC-Unique: RFp5aOJPM7W0-MRhOiko-w-1
Received: by mail-ej1-f72.google.com with SMTP id mm20-20020a170906cc5400b006dfec7725f3so8278270ejb.15
        for <linux-input@vger.kernel.org>; Tue, 29 Mar 2022 07:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=17L5Bd/rDDofYieluRLge+dXOsZZApI0UCMAz+pSmTw=;
        b=4rTukL1bfI0qM0Ru+aixAnLxDSbVnZ587vo6pmxrbvzVpjqIqVqHaZNljSwTl4b6UL
         zV2ac9RkNrAXIlUmUr/6hnC4PUmhDBmKZ3182jpccXOye/kIIyTXA+CimBlC4sVJ7Qmd
         01U/qD9ZUGzJUCVeMEFQdh+LOk9kwct5HvqWdoynDaeuuQXKQLJV0tFt9K5RB8/rlNjE
         nXb3FKs0mWtM1+4VBtUwewhX1rng7EFKir8F5AuIsB6kIXxIwrbS6KFjEjqVLlUvlj0g
         XWTF/sVwoMlcFkKUKrrvN1I+s31y373JULedNV8wqiL+KZ7K3kQxc087p9vrs+a4Zt9V
         iQRg==
X-Gm-Message-State: AOAM5316TyQ/YQwZGuSUMqrhuFCNc8qkmm3pn2O2mlnHIQ0LZXcapzbx
        HFRQVWB8D1oIlGbHQVBcRIqC4fevpDd6NIQIw1tzPz9QlOlDJq/lLdxBLoqkAoJgTpM+vVHPDQ8
        BgrkY1BIJIouJxyTO/1QrBUo=
X-Received: by 2002:a17:906:314b:b0:6d6:da31:e545 with SMTP id e11-20020a170906314b00b006d6da31e545mr35919227eje.125.1648564366294;
        Tue, 29 Mar 2022 07:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqmFlzJiy10RwfiaOb7PhShtC3JPpZmRPKPNWnjU6XgSCS7W3KvBhdb1sU23nSprs49sRYTg==
X-Received: by 2002:a17:906:314b:b0:6d6:da31:e545 with SMTP id e11-20020a170906314b00b006d6da31e545mr35919193eje.125.1648564366024;
        Tue, 29 Mar 2022 07:32:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id b8-20020a056402350800b00419407f0dd9sm8497927edd.0.2022.03.29.07.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Mar 2022 07:32:45 -0700 (PDT)
Message-ID: <f214a2da-bede-8578-0822-0dd228eab600@redhat.com>
Date:   Tue, 29 Mar 2022 16:32:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 4/4] input/i8042: Add TUXEDO devices to i8042 quirk
 tables
Content-Language: en-US
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, tiwai@suse.de, mpdesouza@suse.com,
        arnd@arndb.de, samuel@cavoj.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220329142718.30921-2-wse@tuxedocomputers.com>
 <20220329142718.30921-4-wse@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220329142718.30921-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/29/22 16:27, Werner Sembach wrote:
> A lot of modern Clevo barebones have touchpad and/or keyboard issues after
> suspend fixable with nomux + reset + noloop + nopnp. Luckily, none of them
> have an external PS/2 port so this can safely be set for all of them.
> 
> I'm not entirely sure if every device listed really needs all four quirks,
> but after testing and production use. No negative effects could be
> observed when setting all four.
> 
> The list is quite massive as neither the TUXEDO nor the Clevo dmi strings
> have been very consistent historically. I tried to keep the list as short
> as possible without risking on missing an affected device.
> 
> This is revision 3. The Clevo N150CU barebone is still removed as it might
> have problems with the fix and needs further investigations. The
> SchenkerTechnologiesGmbH System-/Board-Vendor string variations are
> added. This is now based in the quirk table refactor. This now also
> includes the additional noaux flag for the NS7xMU.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/serio/i8042-x86ia64io.h | 125 ++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index 5c0eb5594fb1..a59c6aba7c75 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -1025,6 +1025,25 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		},
>  		.driver_data = (void *)(SERIO_QUIRK_NOMUX)
>  	},
> +	/*
> +	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
> +	 * after suspend fixable with nomux + reset + noloop + nopnp. Luckily,
> +	 * none of them have an external PS/2 port so this can savely be set for
> +	 * all of them. These two are based on a Clevo design, but have the
> +	 * board_name changed.
> +	 */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "AURA1501"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "TUXEDO"),
> +			DMI_MATCH(DMI_BOARD_NAME, "EDUBOOK1502"),
> +		},
> +	},
>  	{
>  		/* Mivvy M310 */
>  		.matches = {
> @@ -1054,6 +1073,112 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>  		},
>  		.driver_data = (void *)(SERIO_QUIRK_NOLOOP)
>  	},
> +	/*
> +	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
> +	 * after suspend fixable with nomux + reset + noloop + nopnp. Luckily,
> +	 * none of them have an external PS/2 port so this can savely be set for
> +	 * all of them.
> +	 * Clevo barebones come with board_vendor and/or system_vendor set to
> +	 * either the very generic string "Notebook" and/or a different value
> +	 * for each individual reseller. The only somewhat universal way to
> +	 * identify them is by board_name.
> +	 */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "N140CU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "N141CU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	/*
> +	 * At least one modern Clevo barebone has the touchpad connected both
> +	 * via PS/2 and i2c interface. This causes a race condition between the
> +	 * psmouse and i2c-hid driver. Since the full capability of the touchpad
> +	 * is available via the i2c interface and the device has no external
> +	 * PS/2 port, it is save to just ignore all ps2 mouses here to avoid
> +	 * this issue. The know affected device is the
> +	 * TUXEDO InfinityBook S17 Gen6 / Clevo NS70MU which comes with one of
> +	 * the two different dmi strings below. NS50MU is not a typo!
> +	 */
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NS50MU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
> +					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
> +					SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NS50_70MU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOAUX | SERIO_QUIRK_NOMUX |
> +					SERIO_QUIRK_RESET_ALWAYS | SERIO_QUIRK_NOLOOP |
> +					SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "NJ50_70CU"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "PB50_70DFx,DDx"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "X170SM"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "X170KM-G"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
>  	{ }
>  };
>  

