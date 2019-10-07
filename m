Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C301CEF3F
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 00:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729649AbfJGWst (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 18:48:49 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34092 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729642AbfJGWst (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 18:48:49 -0400
Received: by mail-qk1-f195.google.com with SMTP id q203so14423456qke.1
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 15:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqvgBnkPf48/c8iQIpD40dYiZ/C4cQZKWA6sHzbPuDk=;
        b=jYE5no4fqHAFtQq9FMmi4SR6FbbWZnKKqcaF1/WWdYCtx2i92vXBmBiXTlB7Eab7eE
         KIqw5K00bu4K+2/eU9zIkcbRIDqkEEPRMZ81nNX0huyfAz9MU0airqGb0+7Jevk8QMKC
         DoK3shgxraZ15x/7rTaIyENce0dXfEFBk7QqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqvgBnkPf48/c8iQIpD40dYiZ/C4cQZKWA6sHzbPuDk=;
        b=fKk+vune14hnN/9JiBUROH0jfij4VL8UYvWBNc9RxeEzzJONLngeK9Tr3+b1bGx/mG
         555z1dxSPLequ8lRgAeA4Ale3LHU/nHStecMlq3Fy/WgfsjQkcnWkMKwuTQU2kr8BV8Z
         yGAr6uBbLxIxPwriRv4AcRCZ93OSfkPZRnVw6FWQsyuH1sCdEMwQdaOAtsOdS3hY3UZy
         7cEEIBAeaG18nuKNZXwmKfPESKghifp8k7xNc6cCg1P3zcUx5FeSZUiAu6pECftegZRS
         1v07p4UtKDnRnPiiMGXjTZUlz+ffwa4ToKsxqZSLtRh8oxnFk40eM6RhZSDo7e0miris
         YRqw==
X-Gm-Message-State: APjAAAVTRa2usQ+TwDqSnwRNsfGwm9UuGkq2+7cmuvP+0pCYJekxZsz/
        QuHolfPKCs0NblOGh0Ks3RdLqNdd1H4=
X-Google-Smtp-Source: APXvYqxmp7whxCWcnC87N5uiozxFMYCo2SHfBAHF8arnh22DYuzsGmNJm/cUjYP1FwIECffdV26Fyw==
X-Received: by 2002:a37:9d93:: with SMTP id g141mr26362714qke.188.1570488527575;
        Mon, 07 Oct 2019 15:48:47 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id h10sm8989957qtk.18.2019.10.07.15.48.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2019 15:48:45 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id r5so21875732qtd.0
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 15:48:44 -0700 (PDT)
X-Received: by 2002:a05:6214:370:: with SMTP id t16mr29551583qvu.245.1570488523404;
 Mon, 07 Oct 2019 15:48:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191005101629.146710-1-ikjn@chromium.org>
In-Reply-To: <20191005101629.146710-1-ikjn@chromium.org>
From:   Brian Norris <briannorris@chromium.org>
Date:   Mon, 7 Oct 2019 15:48:32 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPKqVX6QJLB4OvNTGgfJrrEvKYcwzspYAQaicFpymJigQ@mail.gmail.com>
Message-ID: <CA+ASDXPKqVX6QJLB4OvNTGgfJrrEvKYcwzspYAQaicFpymJigQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: google: whiskers: mask out extra flags in EC event_type
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Ting Shen <phoenixshen@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 5, 2019 at 3:16 AM Ikjoon Jang <ikjn@chromium.org> wrote:
>
> Whiskers needs to get notifications from EC for getting current base
> attached state. EC sends extra bits in event_type field that receiver
> should mask out.

Notably, this patch was never actually landed upstream:

https://lore.kernel.org/patchwork/patch/1019477/
[PATCH] mfd: cros_ec: Add support for MKBP more event flags

and therefore, this EC_CMD_GET_NEXT_EVENT v2 handling is not yet truly
relevant. (i.e., no upstream-proper users should hit this bug yet.)
But that's also a reminder that we need a patch like this for *every*
cros_ec client driver that's using the event_type field. Other
unpatched drivers include
drivers/media/platform/cros-ec-cec/cros-ec-cec.c,
drivers/platform/chrome/cros_ec_chardev.c, and possibly others.

So I wonder: why don't we
(a) *really* try to upstream the above patch and
(b) fix it so that event_data.event_type *always* masks out
EC_MKBP_EVENT_TYPE_MASK
?

(We could still handle the EC_MKBP_HAS_MORE_EVENTS bit within
cros_ec.c, but there's no need for every other driver to have to know
anything about it.)

Of course, this is another reminder that we should *really* try to get
our cros_ec patches landed properly in upstream, because otherwise we
have a different set of bugs and features landing in various
downstream and mostly-upstream kernels.

Brian

...
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -96,8 +96,9 @@ static int cbas_ec_notify(struct notifier_block *nb,
>         struct cros_ec_device *ec = _notify;
>         unsigned long flags;
>         bool base_present;
> +       const u8 event_type = ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK;
>
> -       if (ec->event_data.event_type == EC_MKBP_EVENT_SWITCH) {
> +       if (event_type == EC_MKBP_EVENT_SWITCH) {
>                 base_present = cbas_parse_base_state(
>                                         &ec->event_data.data.switches);
>                 dev_dbg(cbas_ec.dev,
