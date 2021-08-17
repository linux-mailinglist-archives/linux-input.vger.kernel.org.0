Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482BF3EE808
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 10:09:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238193AbhHQIKG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Aug 2021 04:10:06 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:51755 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbhHQIKE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Aug 2021 04:10:04 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUl4z-1mfvUR1giP-00Qg8l; Tue, 17 Aug 2021 10:09:30 +0200
Received: by mail-wm1-f43.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso1234439wmb.2;
        Tue, 17 Aug 2021 01:09:30 -0700 (PDT)
X-Gm-Message-State: AOAM532/nYoVYQdaPNTDw/HJAla55xHpS/5pQ2ITJ01MNb4kgq3EOarN
        CpWh2KXxroCQzhSQTghMZwGntd848CqgIz3kG0g=
X-Google-Smtp-Source: ABdhPJw/hVeF2oi552UuzFwFxuAsd7BwTOC7LdXLOiMZcArDyclXg5p1pniYYafsm/+Q1D9cOD+vthsEizxoC+Abkac=
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr2051915wmq.120.1629187769866;
 Tue, 17 Aug 2021 01:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210817072842.8640-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210817072842.8640-1-lukas.bulwahn@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 17 Aug 2021 10:09:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1H-Of2LC9Yp36PB+dhAwvirohSVDo1y9nWshyZytWqNw@mail.gmail.com>
Message-ID: <CAK8P3a1H-Of2LC9Yp36PB+dhAwvirohSVDo1y9nWshyZytWqNw@mail.gmail.com>
Subject: Re: [PATCH] input: remove dead CSR Prima2 PWRC driver
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2QKq/FQd5pk2kzFN5fPpXezwU69TUHVu0OZ9SSDS1TFm+ae8FJQ
 w3AlHn+C7tssZge064OTegWIogTtYV9PybKm5pUegLVj+l3j2peZ9ZCxwTPMPR3NLZESUQf
 eZWFyKVZbLcc+lWBRvxiNXqWBZx5OCSJh1wlPSVVNT1d16npJkzwtbAJkHy31JqAt6IcdXh
 MDi7ORAAVLDaG/Lb1Qtig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:N+LggpEY3oM=:xLXGheIGd65UuAakDmsOib
 oeOSWQ2aSXgwWyHa5+p2hBATg04TKHgKAHUT4kDt+hQbir0nOzD2zMSfp0ROfSng5Ya2dSqAU
 VBR8EeSbIZeNAdk9lHBvPyQF0Ls7+LD0I5WDAQAwzHXcax37dRHAHCy/drBCo7ZpzBowkU6v0
 B4WiAdWE0/trNxJTM7dYtN23uf/Juiqi2HCgLtzF9NtdB7s1FqucgJk+a+JHzu27RQqrhnW9Q
 JgMBEBXkaKgR7HT4iQHZPNOcdffCEawPwbVnataFKBFZd6ZlxlCfhoMorVQx7d3+zKKmgz/4N
 T7l9nMx3mRgMXhuZlirQh/0gp6kXUsIW2GoW4KZUQJzW/gS9Ep1jj0TioN0ouXP8q7VmeCzsi
 xAJcNchb5dLO+fwKBwC6AKJGkJoJ1Y7Gz4FqxAjZW6aFTwFzIz1gUYk6yaOitkN7WaUGYQiis
 pHTYSb4EHu7qWW/FUuatZwa8q1wuIrlOrBSFYdssCPNLci6806TDGyAd1B1Tr+U3A/9RZzJxw
 LnAii/EHP1Cgal9MR2mmYmhLihdRlBXShNLLCdiy2IV0n1DgpTNp+dMy0pV+b+XN0DrgQR9hv
 iZ3YJvToTfINR1/iaivi7fG9XgDxlYKymL2S3YysJ2W/3dqp7ed29Kwk7ZIJgyjUL8bvrHHPn
 ixJTpmWduVlqrH0RAObAc2+r9iZzSvRgHEDiUfTTNhOA81oLb5HRNs+zHFvNni1Nbkujs+lO6
 vT4ScnPv4AB77WsQBUq+acYUDYunSVMaVo0zOrBupuQFwltvx0L0rJnJUPoe4Y9DIYfyEEP94
 U0JmSfx6C80OSi34YxHBWCzf65ldhi+NqdDXdtmCnEBEte0Krv6uzoIufrefBXuPs5YdgSV
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 17, 2021 at 9:29 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit f3a732843acc ("ARM: remove sirf prima2/atlas platforms") removes
> the config ARCH_SIRF in ./arch/arm/mach-prima2/Kconfig.
>
> Hence, since then, the corresponding CSR Prima2 PWRC Driver is dead code.
> Remove this dead driver.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Good catch!

Acked-by: Arnd Bergmann <arnd@arndb.de>
