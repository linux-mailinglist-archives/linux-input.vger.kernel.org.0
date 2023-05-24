Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68BD370FC0B
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 18:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjEXQ5z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 12:57:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjEXQ5x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 12:57:53 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E5A10B
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 09:57:49 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-338816ea786so7736085ab.0
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 09:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684947467; x=1687539467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YTCMbQuOQ0Gv9EZ3XI5kQ6nF5j6GhuYAcPObTk6+dJ4=;
        b=KamQihe1v6s4UILufypjPnMLfFC1ITK9V84i8HcikBL5rKo6TwkGef0wLclXnX7S1L
         +3j+HgRYmggS3R7rSKn3Am/AAeILjzN5QhrGnfkemsmCWVpEsQKoABav0sE0QBdpOjsW
         6I8NAZT+fbXTzyt/ni7I5kxfdGP/edcrdmlbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684947467; x=1687539467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YTCMbQuOQ0Gv9EZ3XI5kQ6nF5j6GhuYAcPObTk6+dJ4=;
        b=Piacn9nwPl5KMRmGUS1faERAoBI3koYFujVquBEBMkcPI3GmhP4r5dxJQOAeyV5ZfA
         BZsRQoJHNb8x9BzVEYeF9f6e70ZaapKfyyVk2snKX2sPMob3KljUxpQjgCcrZ8+xC4X1
         /13BnglgLKC5DKZcLKlTPc3cm2Jm0SO/TQeKcJHg5w30M88eTLkN6vlL0PAbVVRcHFAo
         5+llPIOAaMYN/qthnPO5JrJ2PZCtguigCgc9MgLnLc4l3GEbZJ3DgcFucVzzmuhMAWa8
         3vLJC9gxpt588MXqRGipmdqIhRtYUY0usxwRLIWlhL8cK6UidLUQwXyGmXys15VYDhO7
         mVcQ==
X-Gm-Message-State: AC+VfDwd61lXvafVT+lEDNfGhBUuhC14oaPbn+F9GqCpLMKWjRmDQjDu
        ZIL6lw5IdmX0lxYM00b1XizK2XJ4ehhQvPsm6MM=
X-Google-Smtp-Source: ACHHUZ5r2w9yodVOtBf002jcY8t0hxnYQQSUikgYoH3VI/XxcVSvqyG60DrIS5Xt3YlYcHBv69m2qw==
X-Received: by 2002:a92:d94c:0:b0:326:3a39:89d0 with SMTP id l12-20020a92d94c000000b003263a3989d0mr11820675ilq.1.1684947467425;
        Wed, 24 May 2023 09:57:47 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id n8-20020a027108000000b0041cce10544dsm192291jac.123.2023.05.24.09.57.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 09:57:45 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33164ec77ccso4295ab.0
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 09:57:44 -0700 (PDT)
X-Received: by 2002:a05:6e02:12c2:b0:338:9f6a:d54a with SMTP id
 i2-20020a056e0212c200b003389f6ad54amr268468ilm.24.1684947464098; Wed, 24 May
 2023 09:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid> <21041738-e23f-45bc-580b-4139c0cb87d9@linaro.org>
In-Reply-To: <21041738-e23f-45bc-580b-4139c0cb87d9@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 May 2023 09:57:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WCQXzwojXbUruZ3Nm-dueX8B6c7MENX5EFpVU1qyqp6A@mail.gmail.com>
Message-ID: <CAD=FV=WCQXzwojXbUruZ3Nm-dueX8B6c7MENX5EFpVU1qyqp6A@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in drm_panel
To:     neil.armstrong@linaro.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org
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

On Wed, May 24, 2023 at 2:52=E2=80=AFAM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 23/05/2023 21:27, Douglas Anderson wrote:
> > In a whole pile of panel drivers, we have code to make the
> > prepare/unprepare/enable/disable callbacks behave as no-ops if they've
> > already been called. It's silly to have this code duplicated
> > everywhere. Add it to the core instead so that we can eventually
> > delete it from all the drivers. Note: to get some idea of the
> > duplicated code, try:
> >    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
> >    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> >
> > NOTE: arguably, the right thing to do here is actually to skip this
> > patch and simply remove all the extra checks from the individual
> > drivers. Perhaps the checks were needed at some point in time in the
> > past but maybe they no longer are? Certainly as we continue
> > transitioning over to "panel_bridge" then we expect there to be much
> > less variety in how these calls are made. When we're called as part of
> > the bridge chain, things should be pretty simple. In fact, there was
> > some discussion in the past about these checks [1], including a
> > discussion about whether the checks were needed and whether the calls
> > ought to be refcounted. At the time, I decided not to mess with it
> > because it felt too risky.
> >
> > Looking closer at it now, I'm fairly certain that nothing in the
> > existing codebase is expecting these calls to be refcounted. The only
> > real question is whether someone is already doing something to ensure
> > prepare()/unprepare() match and enabled()/disable() match. I would say
> > that, even if there is something else ensuring that things match,
> > there's enough complexity that adding an extra bool and an extra
> > double-check here is a good idea. Let's add a drm_warn() to let people
> > know that it's considered a minor error to take advantage of
> > drm_panel's double-checking but we'll still make things work fine.
> >
> > [1] https://lore.kernel.org/r/20210416153909.v4.27.I502f2a92ddd36c3d28d=
014dd75e170c2d405a0a5@changeid
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/drm_panel.c | 49 ++++++++++++++++++++++++++++++++----=
-
> >   include/drm/drm_panel.h     | 14 +++++++++++
> >   2 files changed, 57 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..4e1c4e42575b 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -105,11 +105,22 @@ EXPORT_SYMBOL(drm_panel_remove);
> >    */
> >   int drm_panel_prepare(struct drm_panel *panel)
> >   {
> > +     int ret;
> > +
> >       if (!panel)
> >               return -EINVAL;
> >
> > -     if (panel->funcs && panel->funcs->prepare)
> > -             return panel->funcs->prepare(panel);
> > +     if (panel->prepared) {
> > +             dev_warn(panel->dev, "Skipping prepare of already prepare=
d panel\n");
> > +             return 0;
> > +     }
> > +
> > +     if (panel->funcs && panel->funcs->prepare) {
> > +             ret =3D panel->funcs->prepare(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->prepared =3D true;
> >
> >       return 0;
> >   }
> > @@ -128,11 +139,22 @@ EXPORT_SYMBOL(drm_panel_prepare);
> >    */
> >   int drm_panel_unprepare(struct drm_panel *panel)
> >   {
> > +     int ret;
> > +
> >       if (!panel)
> >               return -EINVAL;
> >
> > -     if (panel->funcs && panel->funcs->unprepare)
> > -             return panel->funcs->unprepare(panel);
> > +     if (!panel->prepared) {
> > +             dev_warn(panel->dev, "Skipping unprepare of already unpre=
pared panel\n");
> > +             return 0;
> > +     }
> > +
> > +     if (panel->funcs && panel->funcs->unprepare) {
> > +             ret =3D panel->funcs->unprepare(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->prepared =3D false;
> >
> >       return 0;
> >   }
> > @@ -155,11 +177,17 @@ int drm_panel_enable(struct drm_panel *panel)
> >       if (!panel)
> >               return -EINVAL;
> >
> > +     if (panel->enabled) {
> > +             dev_warn(panel->dev, "Skipping enable of already enabled =
panel\n");
> > +             return 0;
> > +     }
> > +
> >       if (panel->funcs && panel->funcs->enable) {
> >               ret =3D panel->funcs->enable(panel);
> >               if (ret < 0)
> >                       return ret;
> >       }
> > +     panel->enabled =3D true;
> >
> >       ret =3D backlight_enable(panel->backlight);
> >       if (ret < 0)
> > @@ -187,13 +215,22 @@ int drm_panel_disable(struct drm_panel *panel)
> >       if (!panel)
> >               return -EINVAL;
> >
> > +     if (!panel->enabled) {
> > +             dev_warn(panel->dev, "Skipping disable of already disable=
d panel\n");
> > +             return 0;
> > +     }
> > +
> >       ret =3D backlight_disable(panel->backlight);
> >       if (ret < 0)
> >               DRM_DEV_INFO(panel->dev, "failed to disable backlight: %d=
\n",
> >                            ret);
> >
> > -     if (panel->funcs && panel->funcs->disable)
> > -             return panel->funcs->disable(panel);
> > +     if (panel->funcs && panel->funcs->disable) {
> > +             ret =3D panel->funcs->disable(panel);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +     panel->enabled =3D false;
> >
> >       return 0;
> >   }
> > diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> > index 432fab2347eb..c6cf75909389 100644
> > --- a/include/drm/drm_panel.h
> > +++ b/include/drm/drm_panel.h
> > @@ -198,6 +198,20 @@ struct drm_panel {
> >        * the panel is powered up.
> >        */
> >       bool prepare_prev_first;
> > +
> > +     /**
> > +      * @prepared:
> > +      *
> > +      * If true then the panel has been prepared.
> > +      */
> > +     bool prepared;
> > +
> > +     /**
> > +      * @enabled:
> > +      *
> > +      * If true then the panel has been enabled.
> > +      */
> > +     bool enabled;
> >   };
> >
> >   void drm_panel_init(struct drm_panel *panel, struct device *dev,
>
> LGTM and let's cleanup the panel drivers
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks! For now I'll hold off on landing to see where this series ends
up. If the series ends up looking good we'll have to coordinate
landing the various bits between the drm and the hid trees and the
second drm patch in my series depends on this one>

If my series implodes I'll land this one on its own with your Ack. In
any case, once this lands somewhere I'll take an AI to cleanup the
panels.

-Doug
