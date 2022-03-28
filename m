Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03D54E9628
	for <lists+linux-input@lfdr.de>; Mon, 28 Mar 2022 14:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242203AbiC1MEU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Mar 2022 08:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242185AbiC1MES (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Mar 2022 08:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88B61A184
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1648468956;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U4YuSoXEpfKw3CY3q6k+YQSDCe8in/eyYKmmQSSQgag=;
        b=DigmBhJ0gBPPZXtCsm/twMx6KbCEaCo6vGrHqLJr+VMNIO8Y8O8Uv5APRTyO+Pgdn4zMDO
        UBRgXU5nUDNdAI4zPHFIrhNjPhiFEAjQDqakDnovSoj7cciUyVQ7lFnKBTHjmDY6PirPJm
        /QdRODGjHr1vgZfTUf2XLEqeOIp2RGc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608--m-fN9uWPSGigPgx2_aiGg-1; Mon, 28 Mar 2022 08:02:34 -0400
X-MC-Unique: -m-fN9uWPSGigPgx2_aiGg-1
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso8808022edt.20
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 05:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U4YuSoXEpfKw3CY3q6k+YQSDCe8in/eyYKmmQSSQgag=;
        b=xM6/RkMxP3ntCkalYDHCFGCTSrlIwicowTu5OZ8bjM3V7DEQA2aLUC+aIN7I3y1WI1
         5kPTCZNgoiEu5qJNTUNyeQCtmn/+F/uPx3f/KAJBckqKC2c8rDgjJvOs9OiVTKoMrVv3
         kgGcccTJlPYxwz8bgBfUZR8hlgkZYtEYZuTSDRXCGHaMUlI3vCha+jQdzKnsvJQhbZUE
         jUF6wrbTn2ErYq5pqmxsKLdiJbDDnNS2GnbRrSSPrDPB07YNCvKTMUoybZMrkuhLuInQ
         PbSbQbGUYfjCWvuDlNKNxe+PELAxkEcX9zTJVpZ2W1iJ5/Nbn4JalbM+7DsNmoXD6qI2
         W1Sw==
X-Gm-Message-State: AOAM530lIGpsC/THHtqCaFnoIX5E9KOYev/XzBSclPZwWbxcOOWsXerl
        xhiI6ygBKxaRqgazoqtURt6WfRxJtU1atl0vSEHlXOJoKdt4R2s73skdWm8LsyzQ4DaM7Pi9kgG
        cPz/3y8ZFmm0v/FN3jbye1Ac=
X-Received: by 2002:a05:6402:4250:b0:419:5e89:a40f with SMTP id g16-20020a056402425000b004195e89a40fmr15885170edb.319.1648468953576;
        Mon, 28 Mar 2022 05:02:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxQVYA+xa0yLm7c8pheyKZfxqoGvrYk09ZOIa2goIURwU9jniNoOsbE1V3iGYnUMyaACVw7g==
X-Received: by 2002:a05:6402:4250:b0:419:5e89:a40f with SMTP id g16-20020a056402425000b004195e89a40fmr15885144edb.319.1648468953305;
        Mon, 28 Mar 2022 05:02:33 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u26-20020a05640207da00b00419a14928e5sm4959473edy.28.2022.03.28.05.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Mar 2022 05:02:32 -0700 (PDT)
Message-ID: <161e7a97-d259-0bd7-431f-6b9f69e7cc37@redhat.com>
Date:   Mon, 28 Mar 2022 14:02:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v4 1/4] input/i8042: Move __initconst to fix code styling
 warning
Content-Language: en-US
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, tiwai@suse.de, mpdesouza@suse.com,
        arnd@arndb.de, samuel@cavoj.net, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220322162125.59838-1-wse@tuxedocomputers.com>
 <20220322162125.59838-2-wse@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220322162125.59838-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 3/22/22 17:21, Werner Sembach wrote:
> Move __intconst from before i8042_dmi_laptop_table[] to after it for
> consistent code styling.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/input/serio/i8042-x86ia64io.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
> index 148a7c5fd0e2..91c6f24b4837 100644
> --- a/drivers/input/serio/i8042-x86ia64io.h
> +++ b/drivers/input/serio/i8042-x86ia64io.h
> @@ -791,7 +791,7 @@ static const struct dmi_system_id __initconst i8042_dmi_nopnp_table[] = {
>  	{ }
>  };
>  
> -static const struct dmi_system_id __initconst i8042_dmi_laptop_table[] = {
> +static const struct dmi_system_id i8042_dmi_laptop_table[] __initconst = {
>  	{
>  		.matches = {
>  			DMI_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */

