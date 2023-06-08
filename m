Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D9C0728599
	for <lists+linux-input@lfdr.de>; Thu,  8 Jun 2023 18:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236180AbjFHQny (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jun 2023 12:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235084AbjFHQnx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Jun 2023 12:43:53 -0400
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A905273A
        for <linux-input@vger.kernel.org>; Thu,  8 Jun 2023 09:43:33 -0700 (PDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-33aa60f4094so2437045ab.1
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 09:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686242577; x=1688834577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lm0NPXeSllB+Ruuyhki9CYskDouHV5Cnz0fcBZ5jUqQ=;
        b=naw1Ma2viBaJyjtuUwEh22IEpPN+PHLAQBeCRR2WL38fW1lDfDGoQseJHlBSJiJc0m
         PNFhhqRazE6+UFKEdp6+17kRagdpKQTp+I/AMOaXRzDyZEkhlR4u/ANPvh/rXSe37UPI
         VsH9JRS9dlC0iJdQUPMXyupl3W5Zb14EVJiAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242577; x=1688834577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm0NPXeSllB+Ruuyhki9CYskDouHV5Cnz0fcBZ5jUqQ=;
        b=eNCCRB/GgSkYb1t9Fomoc0HZmOdIwP0OJHs6YSWUGs/fz3MrH7BFDmW11RwZKfG/GH
         26X+Gkroy4JYLp2ijqxyKYXDZQDP8pg00tb1ibacGB5BHhbxQSxovlBccag8DmTkfOeD
         NKkmdaITUdqPndH/q6nW/YPEHQjJ2fx5wQWYraV5UgrNEEzLE2HaSbHijnM9eoBXD+D9
         BWH7nBErB9Dz3ZHglz8KDXfGkG/vBOSeFd39zP3orX1cxMjtzehsrbPDbveG/LQe37/e
         qHBIwnLMHN4fzss6wTVq9PmH1zZVHBm/PQ3EVJE++oVH4HUqnu/U1EIeN/elBauVcR0R
         wCVQ==
X-Gm-Message-State: AC+VfDwNKRa3crNcyEBfLix2xccfy2+vByEJWc8AbivdZOl9c+gvdGjY
        D7kkmfxgtyJFGJGGK6ms3hRKeb2QPYMvOty7ai24eg==
X-Google-Smtp-Source: ACHHUZ6K/6aZtK6oKtHNzs9TK+TayI9fHXFB+ZSjV7SBodMSfAZfwc+LCxcy4zef7hp91eYyrxN8Kw==
X-Received: by 2002:a92:b05:0:b0:334:de38:d600 with SMTP id b5-20020a920b05000000b00334de38d600mr811300ilf.3.1686242576799;
        Thu, 08 Jun 2023 09:42:56 -0700 (PDT)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id p5-20020a92d685000000b00331139b467bsm510879iln.21.2023.06.08.09.42.55
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 09:42:55 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-33d928a268eso143545ab.0
        for <linux-input@vger.kernel.org>; Thu, 08 Jun 2023 09:42:55 -0700 (PDT)
X-Received: by 2002:a05:6e02:214a:b0:32a:f2a9:d1b7 with SMTP id
 d10-20020a056e02214a00b0032af2a9d1b7mr139231ilv.10.1686242575095; Thu, 08 Jun
 2023 09:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid> <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
In-Reply-To: <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Jun 2023 09:42:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
Message-ID: <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] HID: i2c-hid: Support being a panel follower
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org, hsinyi@google.com,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-arm-msm@vger.kernel.org,
        Chris Morgan <macroalpha82@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, Jun 8, 2023 at 8:37=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
>
> On Jun 07 2023, Douglas Anderson wrote:
> >
> > As talked about in the patch ("drm/panel: Add a way for other devices
> > to follow panel state"), we really want to keep the power states of a
> > touchscreen and the panel it's attached to in sync with each other. In
> > that spirit, add support to i2c-hid to be a panel follower. This will
> > let the i2c-hid driver get informed when the panel is powered on and
> > off. From there we can match the i2c-hid device's power state to that
> > of the panel.
> >
> > NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> > of / manage the power state of the i2c-hid device, even though my
> > first instinct said that would be the way to go. Specific problems
> > with using pm_runtime():
> > * The initial power up couldn't happen in a runtime resume function
> >   since it create sub-devices and, apparently, that's not good to do
> >   in your resume function.
> > * Managing our power state with pm_runtime meant fighting to make the
> >   right thing happen at system suspend to prevent the system from
> >   trying to resume us only to suspend us again. While this might be
> >   able to be solved, it added complexity.
> > Overall the code without pm_runtime() ended up being smaller and
> > easier to understand.
>
> Generally speaking, I'm not that happy when we need to coordinate with
> other subsystems for bringing up resources...

Yeah, I'd agree that it's not amazingly elegant. Unfortunately, I
couldn't find any existing clean frameworks that would do what was
needed, which is (presumably) why this problem hasn't been solved
before. I could try to come up with a grand abstraction / new
framework, but that doesn't seem like a great choice either unless we
expect more users...


> Anyway, a remark inlined (at least):
>
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - i2c_hid_core_panel_prepared() and ..._unpreparing() are now static.
> >
> >  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
> >  1 file changed, 81 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i=
2c-hid-core.c
> > index fa8a1ca43d7f..368db3ae612f 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -38,6 +38,8 @@
> >  #include <linux/mutex.h>
> >  #include <asm/unaligned.h>
> >
> > +#include <drm/drm_panel.h>
> > +
> >  #include "../hid-ids.h"
> >  #include "i2c-hid.h"
> >
> > @@ -107,6 +109,8 @@ struct i2c_hid {
> >       struct mutex            reset_lock;
> >
> >       struct i2chid_ops       *ops;
> > +     struct drm_panel_follower panel_follower;
> > +     bool                    is_panel_follower;
> >  };
> >
> >  static const struct i2c_hid_quirks {
> > @@ -1058,6 +1062,34 @@ static int i2c_hid_core_initial_power_up(struct =
i2c_hid *ihid)
> >       return ret;
> >  }
> >
> > +static int i2c_hid_core_panel_prepared(struct drm_panel_follower *foll=
ower)
> > +{
> > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid, p=
anel_follower);
> > +     struct hid_device *hid =3D ihid->hid;
> > +
> > +     /*
> > +      * hid->version is set on the first power up. If it's still zero =
then
> > +      * this is the first power on so we should perform initial power =
up
> > +      * steps.
> > +      */
> > +     if (!hid->version)
> > +             return i2c_hid_core_initial_power_up(ihid);
> > +
> > +     return i2c_hid_core_resume(ihid);
> > +}
> > +
> > +static int i2c_hid_core_panel_unpreparing(struct drm_panel_follower *f=
ollower)
> > +{
> > +     struct i2c_hid *ihid =3D container_of(follower, struct i2c_hid, p=
anel_follower);
> > +
> > +     return i2c_hid_core_suspend(ihid);
> > +}
> > +
> > +static const struct drm_panel_follower_funcs i2c_hid_core_panel_follow=
er_funcs =3D {
> > +     .panel_prepared =3D i2c_hid_core_panel_prepared,
> > +     .panel_unpreparing =3D i2c_hid_core_panel_unpreparing,
> > +};
>
> Can we make that above block at least behind a Kconfig?
>
> i2c-hid is often used for touchpads, and the notion of drm panel has
> nothing to do with them. So I'd be more confident if we could disable
> that code if not required.

Happy to put it behind a Kconfig. I'll plan on that for v3. I'll stub
the functions out if there is no Kconfig, but plan to still leave
structure members just to avoid uglifying the sources too much.


> Actually, I'd be even more happier if it were in a different compilation
> unit. Not necessary a different module, but at least a different file.

I suspect that it's not worth it, but I'll do this if you feel
strongly about it.

I guess the simplest way I can think of to move this to its own file
would be to put the whole private data structure (struct i2c_hid) in a
private header file and then add prototypes for i2c_hid_core_resume()
and i2c_hid_core_suspend() there. Then I could add something like
i2c_hid_core_handle_panel_follower() that would have all the
registration logic. I'd still need special cases in the core
suspend/resume/remove code unless I add a level of abstraction. While
the level of abstraction is more "pure", it also would make the code
harder to follow.

Unless I hear a strong opinion (or if this series changes
significantly), I'll plan to keep things in the same file and just use
a Kconfig.
