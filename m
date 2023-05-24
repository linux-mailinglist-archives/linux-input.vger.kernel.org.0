Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E05D470FC25
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 19:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjEXREj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 13:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbjEXREi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 13:04:38 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D07F5123
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:04:36 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-338816ea761so2509645ab.2
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684947876; x=1687539876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
        b=atFWzjtpKWM1H6SrZRaX21DCx7Yo/9dPnhA3y055cEjTqri0xre2pbJuy2YlitWYVl
         adTn4QGpztfhbhGlMNdDzETHAhp+JfC7H5bkA3wr+tVBjiEsgW20Ve7dhh1rFwG426Nx
         voL4VQOP9rY8u4LrDd5Eatd0GgxNhAlhGeYHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684947876; x=1687539876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSiv7FiHooBNjd2z6gDTYmV/eBkw3m7qogP3ovVg02M=;
        b=MQ/Pp5wH63XznfVUIPuM87wBqTLoOU++aXw9OusnUpQAxWhgDPaHCVRoUg/wVlyKmh
         pfVCxp2m7jobrSKdk1bllKlBPOqWt29EiaBayW9m5/MjJgNcQUNKZdFp7WyCVb54agDH
         ORmWCR7jsBvrLa6mqk2YqSHwd61QuIwB8Du6JgbbroIwlxVaWPSMzMpdhp+iq2D+gNFo
         pC73ZDdG8CCzkb11qihK9NL/fW6LG5W9suctAmWIfF/5UGsbdN/vJZ/LZxoB0D2CzsMy
         3+iJsdNKwxYhkAoIxWg9JPDJTlgHEdnfExJV5evxskreqxQFEZSLtSVkaaSHgbdtZcqM
         Z6Fg==
X-Gm-Message-State: AC+VfDy8g1IMlbE9UrXa7halGqpV1U04Xkil+thCm0dKKncJmX+gk/Ps
        uz3ByWLw/cWuYe8QYg4IhBXSsM7bjeJH4fMFqeE=
X-Google-Smtp-Source: ACHHUZ5+EvCL03meXkQ65zcCoj41NX2I+xhz+oPMDnFsiF+o4zYDT11H0Gni8u3Sqh50AHoCO4TgeQ==
X-Received: by 2002:a92:603:0:b0:331:a22e:c759 with SMTP id x3-20020a920603000000b00331a22ec759mr11764685ilg.7.1684947876290;
        Wed, 24 May 2023 10:04:36 -0700 (PDT)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id l4-20020a05663814c400b0041aafdf3d29sm3360117jak.45.2023.05.24.10.04.35
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 10:04:36 -0700 (PDT)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-33164ec77ccso5725ab.0
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:04:35 -0700 (PDT)
X-Received: by 2002:a05:6e02:156b:b0:32e:561d:b42d with SMTP id
 k11-20020a056e02156b00b0032e561db42dmr271821ilu.16.1684947875310; Wed, 24 May
 2023 10:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.2.I59b417d4c29151cc2eff053369ec4822b606f375@changeid> <646e391f.810a0220.214ce.d680@mx.google.com>
In-Reply-To: <646e391f.810a0220.214ce.d680@mx.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 May 2023 10:04:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Message-ID: <CAD=FV=WEeeRopigfbSa3mU1aHyr_ZZCnqR94FEn7YTeiDDJ-YQ@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/panel: Check for already prepared/enabled in drm_panel
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, May 24, 2023 at 9:19=E2=80=AFAM Chris Morgan <macroalpha82@gmail.co=
m> wrote:
>
> Thank you for looking into this more. It's one of the last QOL bugs
> for some devices I'm working on, even if the end result is no big
> deal (the other QOL bug involves a WARN on probing a rotated panel).

Glad it'll be helpful!

For the WARN on probing a rotated panel I thought there was some
progress on that front. Commit e3ea1806e4ad ("drm/bridge: panel: Set
orientation on panel_bridge connector") or commit 15b9ca1641f0 ("drm:
Config orientation property if panel provides it") didn't help you?
