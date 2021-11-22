Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4476A458BBA
	for <lists+linux-input@lfdr.de>; Mon, 22 Nov 2021 10:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233134AbhKVJqy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Nov 2021 04:46:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbhKVJqx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Nov 2021 04:46:53 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AB9C061574;
        Mon, 22 Nov 2021 01:43:47 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu18so78104262lfb.0;
        Mon, 22 Nov 2021 01:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=96YdYnrZU5YLxN1JzFIGG7wsDdU9R5NPYgLUAZOsBTE=;
        b=VTqdQfaP+qvVnDG3bStis/xCYyypIyT+471LdosA7whE/T+oVfo9jWGHt5XyVoLlnU
         ZU+TyADxR9ZApFtRWKeRkwdNWU1pcDVSqGVbyopG6gn7pByUhSF5zQdp1xV/nDTTQA11
         O92gShWh8DW9Qg/MUO3U7hEopnrXo5KWeQYWIiJolxdAI8TUZibOpSubIxflTxmMjQoE
         p7FHuX4p/+WZsAleEQUy0/EbyDDKCj5TOWDFLgyp2w9wvaLLEpyG67DCyhz6c8PUhaLZ
         wvmmQyTTK8fbdcId1xdbaa8IQajw+x+2eUJ9fp6sRfDpFVwJsSyMjhP4wVgSwW/gU6pi
         /8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=96YdYnrZU5YLxN1JzFIGG7wsDdU9R5NPYgLUAZOsBTE=;
        b=LcW916WQVLsQm4+ZXmW59gcKFHO/D0L4ze5scjGglVrCtnfUTPrqBo3WK5kMAY/fPj
         Vhd6XecEEj9fzFcevNOUWjcT0WYoSuKpnVbpbqwdJpXApgwh+XcJBaKT94bxtMoimTj2
         QEKdGtlA/5vhZovuGJxVt01C0mxaT9pOgXup5dPZ6R7p1ifc/ih7RtQQNZMhi5GRtF6g
         r8EtpgqIVmsul04ChriGNhpSmXFi32zbqwR5OsUOf3y1SPHaeh5aOXkVIo1dkkg41Myq
         eVMVpvqzoL12hms0wAzZhPcPIvmIGKeKdBTf3NYxcpwzakir1VzS0XYL5xZ8DYGp2nhg
         yewA==
X-Gm-Message-State: AOAM5304rACrGR723SOfRDNfhQVKIfCpScM5SL18tPSWkGPTEIhvzbEY
        Qyqco7DymcejQLU9fLYmqXI=
X-Google-Smtp-Source: ABdhPJyVJLl2xLchsCGW10or57QJEWPuQfw4b5lPbZL4JZeso1zXXGSWnfL4uP/pDhnt+ZUrEggi9g==
X-Received: by 2002:a2e:4a0a:: with SMTP id x10mr51646760lja.322.1637574225739;
        Mon, 22 Nov 2021 01:43:45 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id z2sm902449lfd.301.2021.11.22.01.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 01:43:45 -0800 (PST)
Date:   Mon, 22 Nov 2021 11:43:42 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Simon Ser <contact@emersion.fr>,
        Rob Clark <robdclark@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        David Airlie <airlied@linux.ie>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Doug Anderson <dianders@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/input_helper: Add new input-handling helper
Message-ID: <20211122114342.0d23890f@eldfell>
In-Reply-To: <YZfMm3GkFereYPTZ@phenom.ffwll.local>
References: <20211117224841.3442482-1-briannorris@chromium.org>
        <20211117144807.v2.1.I09b516eff75ead160a6582dd557e7e7e900c9e8e@changeid>
        <20211118123928.545dec8a@eldfell>
        <CAF6AEGuc9JbOsC4Lrvoqo8VzMHq+7ru7Y6_UwoZaGV2wHQ6E5g@mail.gmail.com>
        <20211119115419.505155b5@eldfell>
        <YZfIgd8s7uGXAD2X@phenom.ffwll.local>
        <98236dpcx39iOz8xAYrwGLfiLdwgUlljrbBgHL3wd8A0Wz4KzRk3PR8s_tb5Rxu4eScKI4483kB6Vhv-T64CJYOeQqwXlqo2c-64HvoS5cg=@emersion.fr>
        <YZfMm3GkFereYPTZ@phenom.ffwll.local>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_evsixBuO_dMS.WYC8Ptp6x";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--Sig_/_evsixBuO_dMS.WYC8Ptp6x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Nov 2021 17:11:07 +0100
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Fri, Nov 19, 2021 at 04:04:28PM +0000, Simon Ser wrote:
> > On Friday, November 19th, 2021 at 16:53, Daniel Vetter <daniel@ffwll.ch=
> wrote:
> >  =20
> > > Random idea ... should we perhaps let userspace connect the boosting?=
 I.e.
> > > we do a bunch of standardized boost targets (render clocks, display sr
> > > exit), and userspace can then connect it to whichever input device it
> > > wants to? =20
> >=20
> > On IRC we discussed having user-space hand over a FD to the kernel. Whe=
n the FD
> > becomes readable, the kernel triggers the boost.
> >=20
> > This would let user-space use e.g. an input device, an eventfd, or an e=
poll FD
> > with any combination of these as the boost signal. =20
>=20
> Can userspace filter eventfd appropriately like we do here? And can they
> get at that maybe 2nd eventfd from logind or whatever there is on distros
> where /dev access is locked down for compositors/users.

(Mind, eventfd is a specific thing, see 'man eventfd', and evdev/input
device fd is different.)

I don't think any of that is any problem when userspace prepares an
epoll fd to be given to the boosting machinery. The boosting machinery
could have several different targets as well, PSR vs. GPU clocks and
whatnot.

I envision a compositor to maintain an epoll fd for boosting by
adding/removing the same device fds to it that it already uses in its
operations. I don't see any need to open new device fds just for
boosting. It's only the epoll fd given to the kernel and after that the
epoll set can still be changed, right?

The boosting machinery would never actually read or write the
registered fd(s), so it would not interfere with the normal operations.
But it also means the fd will remain readable until userspace services
it. Userspace may need to set up that epoll set very carefully to have
it work right (e.g. edge-triggered?).

If your input handling is in a different process than the DRM poking
for some reason, the epoll fd should still work if:
- it is possible to use SCM_RIGHTS to pass the epollfd from the
  input process to the DRM process, and
- you cannot extract the watched fds from an epoll fd.

Do we have those assumptions today?

Then the attack surface in the DRM process is limited to changing the
epoll set of which fds can trigger boosting, but the DRM process can do
that anyway. I also presume the input process can still add and remove
fds from the epoll set even afterwards.

> I do agree that if we can do this generically maybe we should, but also
> the use-case for input boosting is pretty well defined. I think it's just
> about making sure that compositors is in control, and that we don't make
> it worse (e.g. with the sr exit adding latency when the compositor can
> redraw quickly enough).

The epollfd design sounds very good to me. One can register an
arbitrary set of fds with it, and use even eventfds in the set to have
purely software triggers.


Thanks,
pq

--Sig_/_evsixBuO_dMS.WYC8Ptp6x
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGbZk4ACgkQI1/ltBGq
qqddPw//Qlx3c98y/lzr7O5yeBvbHMGOutdUbTN4frjqqEhhM6TRvl1yMT3oNxBC
N2MxbN1yhJKJihbRqLMI5RkDEiJMqE2e5VBWqwV9ir2DdNG5vR1qqimzkeJeuJsr
f77q2taZwGgnXqqmocroQPPeMxmJD5274xzF55cerzZy6YKE1JoQSpsr4Km1lc/j
/B+N3CDx9c/ezZ6k0Lc0NvuhFFHB1IVtstwOKSPKPqo8XGDrDW9PehcpGOaNGFD8
4wBdVzHGC8JzWfGZqNdVXAtxWZgGDkHYg2uXDUq6Y/BMEilRCXrBYlxjTnce4JAT
wq6jZZXtchRYmXaqyIZ+D93smC1vxxkIBvErCVc/Z1AiCgq99P752jcpUq39QFN+
/bVcr57syOk6+u/WU2S5chtU64zyNcLwu6vEKUZO9/DIDF4rGsGci0ZgjXdj9kHf
/BiYybwmZWmXjxbGjHMU6ZaBjTvl8cq1cIt7Nq1A5IcoBpiqb6ohL5b3i0gg7WCB
Z3J8rPoNQIZTPIusSb6L1BJZCqeRiIA95tTiX7UIlgDQoHOVPdMPU1of0wQa4uke
7K6P5Sg0QSfIpfIVd8Tu657ia53/ucnr1GyTnep9Cm+o46pFfNzZSEgoBOQB4ugl
4MCipr9Y8XvCskwR6myOwajP7qfdjJ0Lm36vfxShtbiSVieen+8=
=kYcC
-----END PGP SIGNATURE-----

--Sig_/_evsixBuO_dMS.WYC8Ptp6x--
