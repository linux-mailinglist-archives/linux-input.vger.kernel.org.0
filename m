Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4D5481E4A
	for <lists+linux-input@lfdr.de>; Thu, 30 Dec 2021 17:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240245AbhL3QmA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Dec 2021 11:42:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240031AbhL3QmA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Dec 2021 11:42:00 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F154DC061574
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 08:41:59 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id t18so35918502uaj.1
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 08:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XrRySsKXOf0uloNIkK67SgKW95Rk+XuwYN9d+/9OLzw=;
        b=KuGju6DExzC2z2N6h7dzkCQHUM5HPOLU7zCfT+7XO/rGlyhUei8oK09rEF3GN4PKUD
         nkiF0z+9La4jP6f0iAm/r3lDzTRLNDMzev8vo+Yfi4XbjZdJAZB+6x4xRS1ZHUY7WhXP
         ujl7srAtxy9qLdS6qh07LzfBWoG3DbEoDRKMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XrRySsKXOf0uloNIkK67SgKW95Rk+XuwYN9d+/9OLzw=;
        b=vTk05Wn6Iq7IiFIrMeWekCfW6Fqro9dNkkr1Q6KGb0JRIS4vcN3JLFcoqQj25dP173
         rVOj6DM7S+sa632tit0+8n/5ElgEk4Cac+f4+MQWUQCXXmdLxuAkbt4399gK8yzovQA6
         2yfrE0W0sI1wqjlxOC5EU41/O2i7h0aGBQ77g8C88Y5kh99N3wBBqhV6zNo3KezIPA5N
         lNh4YpyczvDRXraEHhdy9ivZ51bezlh85QB383xVIV+boIOXbphOubhlgs/ZJfxk1fhN
         JM1KDhJ7khBtBQCINHm0DrbbJKaizd7dtvUxoXj0pBAT2WGLRySJq5SO7mgPXHBvfJf8
         O6ug==
X-Gm-Message-State: AOAM532HChy0olnmmvIYkyAoiTgshaiEovBiQm6xL2v3/oznJWcMUZ7d
        aA6gDcuoIMVs4k8fnt5gbfwnP5b5KHpa6w==
X-Google-Smtp-Source: ABdhPJzZc3mmoM3fwN7h75ZehtvJV6nYdi5dWuJNbDtxj02C1DSIb/mfwh/5QEzxEzTzT/N3whyYYw==
X-Received: by 2002:a05:6102:237a:: with SMTP id o26mr9123859vsa.79.1640882518888;
        Thu, 30 Dec 2021 08:41:58 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id i28sm4923893vkr.16.2021.12.30.08.41.58
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 08:41:58 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p2so43245709uad.11
        for <linux-input@vger.kernel.org>; Thu, 30 Dec 2021 08:41:58 -0800 (PST)
X-Received: by 2002:a9f:2383:: with SMTP id 3mr9941461uao.77.1640882517657;
 Thu, 30 Dec 2021 08:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20211221191743.1893185-1-acz@semihalf.com> <20211221191743.1893185-3-acz@semihalf.com>
In-Reply-To: <20211221191743.1893185-3-acz@semihalf.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 30 Dec 2021 08:41:46 -0800
X-Gmail-Original-Message-ID: <CA+jURctAgdaZqZNtV_39PiX4c7fKBB31wki4LmD3Fxe47cqojw@mail.gmail.com>
Message-ID: <CA+jURctAgdaZqZNtV_39PiX4c7fKBB31wki4LmD3Fxe47cqojw@mail.gmail.com>
Subject: Re: [PATCH 02/18] Input: add FF_HID effect type
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input <linux-input@vger.kernel.org>, upstream@semihalf.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, 21 Dec 2021 at 11:17, Angela Czubak <acz@semihalf.com> wrote:
>
> FF_HID effect type can be used to trigger haptic feedback with HID simple
> haptic usages.
>
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>  include/uapi/linux/input.h | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> index ee3127461ee0..0d4d426cf75a 100644
> --- a/include/uapi/linux/input.h
> +++ b/include/uapi/linux/input.h
> @@ -424,6 +424,24 @@ struct ff_rumble_effect {
>         __u16 weak_magnitude;
>  };
>
> +/**
> + * struct ff_hid_effect
> + * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
> + * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined range
> + * @vendor_id: the vendor waveform page if hid_usage is in the vendor-defined range

Looks like you forgot to change vendor_id to vendor_waveform_page on
the line above.

> + * @intensity: strength of the effect as percentage
> + * @repeat_count: number of times to retrigger effect
> + * @retrigger_period: time before effect is retriggered (in ms)
> + */
> +struct ff_hid_effect {
> +       __u16 hid_usage;
> +       __u16 vendor_id;
> +       __u8  vendor_waveform_page;
> +       __u16 intensity;
> +       __u16 repeat_count;
> +       __u16 retrigger_period;
> +};
> +
>  /**
>   * struct ff_effect - defines force feedback effect
>   * @type: type of the effect (FF_CONSTANT, FF_PERIODIC, FF_RAMP, FF_SPRING,
> @@ -460,6 +478,7 @@ struct ff_effect {
>                 struct ff_periodic_effect periodic;
>                 struct ff_condition_effect condition[2]; /* One for each axis */
>                 struct ff_rumble_effect rumble;
> +               struct ff_hid_effect hid;
>         } u;
>  };
>
> @@ -467,6 +486,7 @@ struct ff_effect {
>   * Force feedback effect types
>   */
>
> +#define FF_HID         0x4f
>  #define FF_RUMBLE      0x50
>  #define FF_PERIODIC    0x51
>  #define FF_CONSTANT    0x52
> @@ -476,7 +496,7 @@ struct ff_effect {
>  #define FF_INERTIA     0x56
>  #define FF_RAMP                0x57
>
> -#define FF_EFFECT_MIN  FF_RUMBLE
> +#define FF_EFFECT_MIN  FF_HID
>  #define FF_EFFECT_MAX  FF_RAMP
>
>  /*
> --
> 2.34.1.307.g9b7440fafd-goog
>

Harry Cutts
Chrome OS Touch/Input team
