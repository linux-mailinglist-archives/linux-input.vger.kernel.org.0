Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFEDA4BA942
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 20:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240683AbiBQTIK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 14:08:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbiBQTIJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 14:08:09 -0500
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com [IPv6:2607:f8b0:4864:20::a31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33E652B254
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 11:07:55 -0800 (PST)
Received: by mail-vk1-xa31.google.com with SMTP id l10so3607319vki.9
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 11:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Sc+EaJrNQanDC0tIQ/+hLCZwmcOXKaQszAADxGMNESM=;
        b=d+gLtI0iBFxzsdc1bjOFp4XYw3wkM9H8ua5Ht5qwuLPzCq2mtdenqFtfIZDWdRhsWY
         VIWn/r+o3PYhBNfxsKv+GnKX9+RJooqUDpB+rW82OR4DCH3+Zz5d1iKBoLRde/gFw1B9
         FJCfB19/KsaYaqfwLzTeHjBY1IcHyP78eTTVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sc+EaJrNQanDC0tIQ/+hLCZwmcOXKaQszAADxGMNESM=;
        b=D0uGG9HD2BBSgcSYxA5/Mt0glrUKP6OyT2MAOH8f+dw4XfWEeofBpT21/rxpzD74t3
         ezX/kr+hQVGRv1IWyMsQ42BTdxMYncCFca2oQYAYO1Iodll32Shqs1TW5tDkLWiSImV+
         5Te6Czoha9nTUCNK0U7iZPwrg8tzBLmGmOIp4dovf2hxny0y2CArCXK9g5BfWWJvGvdp
         D+s1zKvQ0fNl3Rod+aSGBckDrClynpCYyO8AbYUVzHYfMlRIEh5YEqt50VuLktzm72Ne
         gn3Y9E851Eh/1YpenVq4BWmzPa95x76auEWK5SY5SEuaQRavMp8wXLzag+S3E0xPOAzR
         aCFg==
X-Gm-Message-State: AOAM531ENGeq2djYMIrqd/IHtco0Dg+QNzFlV+iQDqE1KO2ijYZn+aGI
        5Kl0b4W4X8LsbUAo20MwYhcGd5VbqdC+rg==
X-Google-Smtp-Source: ABdhPJwjt0KyVjfB4hdP8+NCjMSomMsfNZm4PS/XZ8qdrM3w0ahwbz8mYudLJ9RTfJhhDWZDbpdQDQ==
X-Received: by 2002:a1f:218f:0:b0:32e:ac90:e17f with SMTP id h137-20020a1f218f000000b0032eac90e17fmr2073300vkh.19.1645124874125;
        Thu, 17 Feb 2022 11:07:54 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id y22sm2329042vsi.25.2022.02.17.11.07.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 11:07:51 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id t22so7413632vsa.4
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 11:07:51 -0800 (PST)
X-Received: by 2002:a67:ac0a:0:b0:31b:6b29:f7b4 with SMTP id
 v10-20020a67ac0a000000b0031b6b29f7b4mr1993579vse.84.1645124870982; Thu, 17
 Feb 2022 11:07:50 -0800 (PST)
MIME-Version: 1.0
References: <20220217041427.1.I5dbf50eb1a7a6734ee727bda4a8573358c6d3ec0@changeid>
In-Reply-To: <20220217041427.1.I5dbf50eb1a7a6734ee727bda4a8573358c6d3ec0@changeid>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 17 Feb 2022 11:07:40 -0800
X-Gmail-Original-Message-ID: <CA+jURcuNRBZrP+aiTMFFoXEpWvKaZRjEbT_JMqu5tNxHZy+i_A@mail.gmail.com>
Message-ID: <CA+jURcuNRBZrP+aiTMFFoXEpWvKaZRjEbT_JMqu5tNxHZy+i_A@mail.gmail.com>
Subject: Re: [PATCH] HID: Add mapping for KEY_DICTATE
To:     William Mahon <wmahon@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        William Mahon <wmahon@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Will,

On Wed, 16 Feb 2022 at 20:15, William Mahon <wmahon@chromium.org> wrote:
>
> Numerous keyboards are adding dicate keys which allows for text
> messages to be dicated by a microphone.

Nit: a couple of typos for "dictate".

>
> This patch adds a new key definition KEY_DICTATE and maps 0x0c/0x0d8
> usage code to this new keycode. Additionally hid-debug is adjusted to
> recognize this new usage code as well.
>
> Signed-off-by: William Mahon <wmahon@google.com>
> ---
>
>  drivers/hid/hid-debug.c                | 1 +
>  drivers/hid/hid-input.c                | 1 +
>  include/uapi/linux/input-event-codes.h | 2 ++
>  3 files changed, 4 insertions(+)
>
> diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
> index 26c31d759914..8aa68416b1d7 100644
> --- a/drivers/hid/hid-debug.c
> +++ b/drivers/hid/hid-debug.c
> @@ -969,6 +969,7 @@ static const char *keys[KEY_MAX + 1] = {
>         [KEY_ASSISTANT] = "Assistant",
>         [KEY_KBD_LAYOUT_NEXT] = "KbdLayoutNext",
>         [KEY_EMOJI_PICKER] = "EmojiPicker",
> +       [KEY_DICTATE] = "Dictate",
>         [KEY_BRIGHTNESS_MIN] = "BrightnessMin",
>         [KEY_BRIGHTNESS_MAX] = "BrightnessMax",
>         [KEY_BRIGHTNESS_AUTO] = "BrightnessAuto",
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 112901d2d8d2..0c6c6db942ca 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -992,6 +992,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 case 0x0cd: map_key_clear(KEY_PLAYPAUSE);       break;
>                 case 0x0cf: map_key_clear(KEY_VOICECOMMAND);    break;
>
> +               case 0x0d8: map_key_clear(KEY_DICTATE); break;
>                 case 0x0d9: map_key_clear(KEY_EMOJI_PICKER);    break;
>
>                 case 0x0e0: map_abs_clear(ABS_VOLUME);          break;
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..12246594891c 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -735,6 +735,8 @@
>  #define KEY_KBD_LCD_MENU4              0x2bb
>  #define KEY_KBD_LCD_MENU5              0x2bc
>
> +#define KEY_DICTATE                    0x27b
> +

The list should be sorted in order of evdev code, so KEY_DICTATE
should go just below KEY_SELECTIVE_SCREENSHOT.

>  #define BTN_TRIGGER_HAPPY              0x2c0
>  #define BTN_TRIGGER_HAPPY1             0x2c0
>  #define BTN_TRIGGER_HAPPY2             0x2c1
> --
> 2.35.1.265.g69c8d7142f-goog
>
