Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF4287646F4
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 08:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbjG0GiJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 02:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231808AbjG0GiC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 02:38:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D201E189;
        Wed, 26 Jul 2023 23:38:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F3F261D4B;
        Thu, 27 Jul 2023 06:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53265C433C8;
        Thu, 27 Jul 2023 06:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690439879;
        bh=FRjnZpBXyoICml35qRO4Ubw0mh4eZitG61lIBtAT9ZE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fYZL11pKqnmkNulOQe7GL0kffosuY1A0wodOf9CauFTecIaODJGJPhXFxc7GYCnLi
         BER1cf+68K8Sz2Jhsnl4nq4fGGxli2s2LmnmWkmf9kSG75WPIDHdxsThaZ4Nb4s5p7
         pUWoIaAaMZSgVHhutZGd/KWaom/Sli98Q8tiw2zU34EzcqASaA5SNusxS1pyJc4Ua7
         9AyNvj3j3dUOJimVrImfyr0ZfSgr/zzasFPckHAj9q/VU/kQpXeLodMZmz5RJrVV8l
         c8qxGhe0+v6AvJtH3eCtG/XNvGqjEyYEGHVCQEqYj7/T25emB02p4i6V3iaDfN8UCm
         99iL9y1DWV5Aw==
Date:   Thu, 27 Jul 2023 08:37:56 +0200
From:   Maxime Ripard <mripard@kernel.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [PATCH v3 02/10] drm/panel: Check for already prepared/enabled
 in drm_panel
Message-ID: <i3cbgrc365lwscwux2itho6uv74ji3hsjuge4zoxfnlnhacyqc@r73mmifyxffj>
References: <20230725203545.2260506-1-dianders@chromium.org>
 <20230725133443.v3.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid>
 <snx3fzvf3icauri2xuigydvpqxtzhp34mptdxvifi7jswm2evy@sx7jr7zwvjw5>
 <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qmidvgjg6qmglwns"
Content-Disposition: inline
In-Reply-To: <CAD=FV=VcsTik+HD11xeDM2Jq9ispcX0-j5QtK8D1qUkrGabRGg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--qmidvgjg6qmglwns
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jul 26, 2023 at 08:10:33AM -0700, Doug Anderson wrote:
> On Wed, Jul 26, 2023 at 5:41=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Tue, Jul 25, 2023 at 01:34:37PM -0700, Douglas Anderson wrote:
> > > NOTE: arguably, the right thing to do here is actually to skip this
> > > patch and simply remove all the extra checks from the individual
> > > drivers. Perhaps the checks were needed at some point in time in the
> > > past but maybe they no longer are? Certainly as we continue
> > > transitioning over to "panel_bridge" then we expect there to be much
> > > less variety in how these calls are made. When we're called as part of
> > > the bridge chain, things should be pretty simple. In fact, there was
> > > some discussion in the past about these checks [1], including a
> > > discussion about whether the checks were needed and whether the calls
> > > ought to be refcounted. At the time, I decided not to mess with it
> > > because it felt too risky.
> >
> > Yeah, I'd agree here too. I've never found evidence that it was actually
> > needed and it really looks like cargo cult to me.
> >
> > And if it was needed, then I'm not sure we need refcounting either. We
> > don't have refcounting for atomic_enable / disable, we have a sound API
> > design that makes sure we don't fall into that trap :)
> >
> > > Looking closer at it now, I'm fairly certain that nothing in the
> > > existing codebase is expecting these calls to be refcounted. The only
> > > real question is whether someone is already doing something to ensure
> > > prepare()/unprepare() match and enabled()/disable() match. I would say
> > > that, even if there is something else ensuring that things match,
> > > there's enough complexity that adding an extra bool and an extra
> > > double-check here is a good idea. Let's add a drm_warn() to let people
> > > know that it's considered a minor error to take advantage of
> > > drm_panel's double-checking but we'll still make things work fine.
> >
> > I'm ok with this, if we follow-up in a couple of releases and remove it
> > and all the calls.
> >
> > Could you add a TODO item so that we can keep a track of it? A follow-up
> > is fine if you don't send a new version of that series.
>=20
> By this, I think you mean to add a "TODO" comment inline in the code?

No, sorry, I meant an entry in our TODO list: Documentation/gpu/todo.rst

> Also: I was thinking that we'd keep the check in "drm_panel.c" with
> the warning message indefinitely. You think it should be eventually
> removed? If we are truly thinking of removing it eventually, this
> feels like it should be a more serious warning message like a WARN(1,
> ...) to make it really obvious to people that they're relying on
> behavior that will eventually go away.

Yeah, it really feels like this is cargo-cult to me. Your approach seems
like a good short-term thing to do to warn everyone but eventually we'll
want it to go away.

So promoting it to a WARN could be a good thing, or let's say we do a
drm_warn for now, WARN next release, and gone in two?

Maxime

--qmidvgjg6qmglwns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMIQxAAKCRDj7w1vZxhR
xS9GAP9BIm0s8ZsLC+bhjElbosmrjvC+nJKq8JPUsWqiC6LCgAEA7zDgSlWYWW1y
wy47ZmFD7kfSibH3ZXnpNrOTtnnmpQ4=
=4IGd
-----END PGP SIGNATURE-----

--qmidvgjg6qmglwns--
