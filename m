Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DBA6763A7E
	for <lists+linux-input@lfdr.de>; Wed, 26 Jul 2023 17:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234764AbjGZPLc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jul 2023 11:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjGZPLa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jul 2023 11:11:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 181C11737
        for <linux-input@vger.kernel.org>; Wed, 26 Jul 2023 08:11:07 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fb7589b187so10764792e87.1
        for <linux-input@vger.kernel.org>; Wed, 26 Jul 2023 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690384247; x=1690989047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ROWfJuXH2cVv0Y621ig/G+mxiEtHeeKT7it0Legy4=;
        b=lspq4UpCI/CMzAhtCEl/i1AP1t1k0J9KYQIxzwLzcn75tPqdDWSK/BqkNBSwDpKJpI
         5TCbIBw1WtIEu5EZt+hzsYzeuJjHqdcACqiP9Cw8Am/D0FcdLL5zMeKWerD+z29z6k4Q
         Dc10RIQAnAxTd8y57pUJqC510F0TUITb4r4lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690384247; x=1690989047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/ROWfJuXH2cVv0Y621ig/G+mxiEtHeeKT7it0Legy4=;
        b=SG0bJVXfSQSzWv0iE1LgTY1q9zomUiP2aRalqbWCDI6NuhlZa/IgVS3on31/TRaEjW
         9k5eEyAIFTMfKgRmsh8XWDfz6YOQ/IuLWAAFM+ZqO/SPu31HZTOuVGNYm3FfbZG0r8jf
         Ryry02ihKQ9vzKwob7V5L5m+92xqJXq+AQFrH/fQunfszy2eKGzJXoAlY4CMG/JcdEhT
         vRtHWHqwHx1Mtn+FxvLHCOSc46k3zVXH8G5xZWSBxxJKE1NGTm2nIo0NGn9JVZpn85nC
         EqNHpEpOuJI6pM5bGNzxN3n+v+LpdhV/N+n16JS+/NyJprU+dZ8+K7SHCPvB8lFVyTAy
         fWpQ==
X-Gm-Message-State: ABy/qLZfyx/mH3Qy61QnUTRFq2cVyXp7DPagsrUMAsjT9nMsIbY9hxOI
        7KQfePOxQwei+WjFfPnv5tBZkXmufxRJkI84YOMcf+tE
X-Google-Smtp-Source: APBJJlEl/FJNvZmQsS8/8A0yvHeL1HN1ltBlYB9WTmWtSRKqdI+7tK6tmAd8sanCBn5KND0EpQR36g==
X-Received: by 2002:a05:6512:2030:b0:4fe:c40:3583 with SMTP id s16-20020a056512203000b004fe0c403583mr1439238lfs.39.1690384246840;
        Wed, 26 Jul 2023 08:10:46 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id x9-20020ac259c9000000b004fbf5242e8bsm3323115lfn.231.2023.07.26.08.10.46
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 08:10:46 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fb0336ed4fso2755e87.1
        for <linux-input@vger.kernel.org>; Wed, 26 Jul 2023 08:10:46 -0700 (PDT)
X-Received: by 2002:ac2:5494:0:b0:4f2:7840:e534 with SMTP id
 t20-20020ac25494000000b004f27840e534mr170963lfk.0.1690384246218; Wed, 26 Jul
 2023 08:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid> <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
In-Reply-To: <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 26 Jul 2023 08:10:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
Message-ID: <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled in drm_panel
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        cros-qcom-dts-watchers@chromium.org,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, hsinyi@google.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        yangcong5@huaqin.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Jul 26, 2023 at 5:41=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> Hi,
>
> On Tue, Jul 25, 2023 at 01:34:37PM -0700, Douglas Anderson wrote:
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
>
> Yeah, I'd agree here too. I've never found evidence that it was actually
> needed and it really looks like cargo cult to me.
>
> And if it was needed, then I'm not sure we need refcounting either. We
> don't have refcounting for atomic_enable / disable, we have a sound API
> design that makes sure we don't fall into that trap :)
>
> > Looking closer at it now, I'm fairly certain that nothing in the
> > existing codebase is expecting these calls to be refcounted. The only
> > real question is whether someone is already doing something to ensure
> > prepare()/unprepare() match and enabled()/disable() match. I would say
> > that, even if there is something else ensuring that things match,
> > there's enough complexity that adding an extra bool and an extra
> > double-check here is a good idea. Let's add a drm_warn() to let people
> > know that it's considered a minor error to take advantage of
> > drm_panel's double-checking but we'll still make things work fine.
>
> I'm ok with this, if we follow-up in a couple of releases and remove it
> and all the calls.
>
> Could you add a TODO item so that we can keep a track of it? A follow-up
> is fine if you don't send a new version of that series.

By this, I think you mean to add a "TODO" comment inline in the code?

Also: I was thinking that we'd keep the check in "drm_panel.c" with
the warning message indefinitely. You think it should be eventually
removed? If we are truly thinking of removing it eventually, this
feels like it should be a more serious warning message like a WARN(1,
...) to make it really obvious to people that they're relying on
behavior that will eventually go away.


-Doug
