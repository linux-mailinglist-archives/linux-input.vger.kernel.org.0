Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE487184B4
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 16:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237582AbjEaOVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 May 2023 10:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235858AbjEaOUg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 May 2023 10:20:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3831A2
        for <linux-input@vger.kernel.org>; Wed, 31 May 2023 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685542635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iKY4ohXdL6Kppb6cdBaAFMS5w8OYmdrqeHw64hwzbU8=;
        b=OwZ/VGGhwR02258P7qeqiZM4pNTUDwdoqZ++SdyTkMWse7NH3D0Et+5jAFXTtgXt+YxWj+
        geCv9+0Dh08eIVD6pD9kblXVhUYPw/AWfbR32kjtkE1DUMscbz0/lGSGQiKuE7BFWKo3/v
        atgPVSev+yJVHHeDcA9Jk7TEeITk20g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-K_2DzIq1O1C9bJoiHpuv7w-1; Wed, 31 May 2023 09:52:38 -0400
X-MC-Unique: K_2DzIq1O1C9bJoiHpuv7w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-94a355cf318so597324566b.2
        for <linux-input@vger.kernel.org>; Wed, 31 May 2023 06:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685541157; x=1688133157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iKY4ohXdL6Kppb6cdBaAFMS5w8OYmdrqeHw64hwzbU8=;
        b=AVxn4jxdHACi4oHWiKow5DwaYfUH4bdK83KZfelI5WoScgewNESY+w7FZcvMBAas7a
         P85Cuc0sC8jGDqezFKoM5J20el3qeR8Mp2w1GqOZwLotvsAnZqRXq54Kv5v65B+Q+GxR
         wKSt8qEk64qEDP0hmvaynyzlg7jWKcwMJd9hWqcuJ04MdWIFzgu0YK24L32BdKR+jT2E
         RJ9UEplTCzb21OY2MiN+7L5GZfmhRvcr9wAXWztgH0mFzeFxtKelp+AgVInos4OeJeOB
         apmYHF5rJmPU0DCgvxKPfKpS9csDqEyaWwxHs2g82Rs6WErdrKaRDxv3fX+qQkGf5BY8
         aNWQ==
X-Gm-Message-State: AC+VfDwhWTsp4F3er/iQxJa9BoSDQh2pHPqunokWgoTvdB0rJp2iwMbL
        WVLMHljE79yIhUHt5UyawYmoway5U2LGUkqh8fjd4eqceiEX+Tgy4D/q2iNH8Xv24zToQ330tDy
        pXAoViROq3YlPMkmweml002s=
X-Received: by 2002:a17:907:7e92:b0:96f:f809:1394 with SMTP id qb18-20020a1709077e9200b0096ff8091394mr4565998ejc.53.1685541156465;
        Wed, 31 May 2023 06:52:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7hhjQJzrNRzyGM1wTqzVW8nH8LuS4AWEp9EAl1HWLRdpILKHy/8ekBdMh24NZdi98uCcyc/w==
X-Received: by 2002:a17:907:7e92:b0:96f:f809:1394 with SMTP id qb18-20020a1709077e9200b0096ff8091394mr4565974ejc.53.1685541156144;
        Wed, 31 May 2023 06:52:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v15-20020a170906338f00b009663cf5dc3bsm8980369eja.53.2023.05.31.06.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:52:35 -0700 (PDT)
Message-ID: <dba63a7b-6e5d-6145-5eea-0c2da3dc9445@redhat.com>
Date:   Wed, 31 May 2023 15:52:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] input: Add new keyboard backlight control keys to match
 modern notebooks
Content-Language: en-US, nl
To:     Werner Sembach <wse@tuxedocomputers.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230530110550.18289-1-wse@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230530110550.18289-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Werner,

Thank you for your patch.

On 5/30/23 13:05, Werner Sembach wrote:
> The old three KEY_KBDILLUM* keycodes don't reflect the current situation
> modern notebooks anymore. Especially the ones with RGB keyboards.
> 
> e.g.
> - Clevo NL50NU has a toggle, an up, a down and a color-cycle key
> - TongFang PH4ARX1 doesn't have a toggle key, but one that cycles through
>   off, half-brightness, and full-brightness.
> 
> Also, on some devices these keys are already implemented in firmware. It
> would still be nice if there is a way to let userspace know when one of
> these keys is pressed to display the OSD, but don't advice it to actually
> do anything. This is the intended purpose of the KEY_KBDILLUMCHANGE define.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  include/uapi/linux/input-event-codes.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 022a520e31fc2..05287bf9a77f7 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -803,6 +803,10 @@
>  #define BTN_TRIGGER_HAPPY39		0x2e6
>  #define BTN_TRIGGER_HAPPY40		0x2e7
>  
> +#define KEY_KBDILLUMCYCLE		0x2e8

I do not really see what the difference is between this and the existing KEY_KBDILLUMTOGGLE, userspace can already choice whether it toggles to a number of states or just toggles on/off.

So IMHO this one should be dropped.

> +#define KEY_KBDILLUMCOLORCYCLE		0x2e9

This one is fine.

> +#define KEY_KBDILLUMCHANGE		0x2ea

Keyboard backlight support should be exported to userspace as a LED class device, see e.g. :

drivers/platform/x86/thinkpad_acpi.c    : tpacpi_led_kbdlight
drivers/platform/x86/dell/dell-laptop.c : kbd_led

And the LED class device sysfs API already has a mechanism for signalling kbd-brightness changes triggered by the hw itself (e.g. by the embedded controller) to userspace. See the use of the 
LED_BRIGHT_HW_CHANGED flag and the calling of led_classdev_notify_brightness_hw_changed() in the 2 above drivers.

So strong NACK for adding KEY_KBDILLUMCHANGE, this is duplicate with the led_classdev_notify_brightness_hw_changed() functionality which is already supported by userspace. E.g. GNOME will show an OSD notification similar to the sound volume change OSD when changing the keyboard brightness through EC handled hotkeys on ThinkPads and various Dell models.

TL;DR: to me only KEY_KBDILLUMCOLORCYCLE makes sense, assuming that this needs to be handled by userspace, if this is handled in the EC then this too should simply call led_classdev_notify_brightness_hw_changed()

Regards,

Hans





> +
>  /* We avoid low common keys in module aliases so they don't get huge. */
>  #define KEY_MIN_INTERESTING	KEY_MUTE
>  #define KEY_MAX			0x2ff

