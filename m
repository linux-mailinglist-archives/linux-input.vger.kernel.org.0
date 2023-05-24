Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C729E70FCA8
	for <lists+linux-input@lfdr.de>; Wed, 24 May 2023 19:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjEXR3h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 May 2023 13:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232808AbjEXR3g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 May 2023 13:29:36 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 517CB12E
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:29:34 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3382dc7d50bso7977365ab.2
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684949372; x=1687541372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
        b=bH+sXSbXZp8RHLYTq/K0OUSg075jA0Oq9cOOJggv39jUnsy54WOQT1vfeRh6HM829V
         ToWma5ngCXUBD5wGmC7RAev0GyONVyUjB+NcGWgL8mw0htimVwRSdzztZmW7M6eDgtgT
         3eOgyE2ZUP+h+BDMqtLUfmji/WDlUUOzmtTf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684949372; x=1687541372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq6BLiBB15ZpThHz2GQJH12upVOih5oQeiwfZRvJZIs=;
        b=hIts1qDiA+nX1b8eqKuUHbpMaRb8dOEgIkq1g5gMrRiHUOZ5GPCll5zOsVWeVBWxev
         Ow7JH1o77cqlYNpp2RPr3608mSPe0Quc3oTC9y3wuDk8gcGv10dcJYec4+ulMEMrtYjH
         TpZ2HJl6exrYe9DVqWX2p9EN/dIovFT3EOzNMFB4mH6OW/XTXSHYO724tOkZcmw/XjVj
         W9se43/jEGXL8mX5WDJw88reEq++tDPYth7+3zhXR+6V7SAzDUdO4PLfIs1u74aIm05e
         tdV/rE/y+MMCNlt7XJNTxFgP7YLqmzuL++H+y2rWoIXLF+92Xk0teAlHLCy7Z0wy58ja
         b+mQ==
X-Gm-Message-State: AC+VfDzAZFDzKnP+IcwvhRcBlVgEN/mTBPgk4Jw3XpJMHC016KJPPaMv
        nsqddWv3B8MP1AToJR/7+TqQ4T+tnKBLqFoBiDU=
X-Google-Smtp-Source: ACHHUZ4WJzwE8Blau0UhuDbfHfjUan50CV9MDvaiV+MfajYjrp1knIb8rZu/qiT1gJGGyt5VPSfxuw==
X-Received: by 2002:a92:d849:0:b0:32f:80a1:2e44 with SMTP id h9-20020a92d849000000b0032f80a12e44mr13007231ilq.9.1684949372380;
        Wed, 24 May 2023 10:29:32 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id z21-20020a027a55000000b004165ce4456fsm3172256jad.33.2023.05.24.10.29.31
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 10:29:31 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33164ec77ccso9615ab.0
        for <linux-input@vger.kernel.org>; Wed, 24 May 2023 10:29:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:1b09:b0:335:a48:f668 with SMTP id
 i9-20020a056e021b0900b003350a48f668mr199716ilv.15.1684949370785; Wed, 24 May
 2023 10:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org> <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
In-Reply-To: <20230523122802.7.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 24 May 2023 10:29:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Message-ID: <CAD=FV=Ucn7BeWWGOOEX0ho7yH31VF-w7U60KFB8qSn4L1xn3fw@mail.gmail.com>
Subject: Re: [PATCH 7/9] HID: i2c-hid: Support being a panel follower
To:     Jiri Kosina <jikos@kernel.org>,
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
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
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

On Tue, May 23, 2023 at 12:31=E2=80=AFPM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the patch ("drm/panel: Add a way for other devices
> to follow panel state"), we really want to keep the power states of a
> touchscreen and the panel it's attached to in sync with each other. In
> that spirit, add support to i2c-hid to be a panel follower. This will
> let the i2c-hid driver get informed when the panel is powered on and
> off. From there we can match the i2c-hid device's power state to that
> of the panel.
>
> NOTE: this patch specifically _doesn't_ use pm_runtime to keep track
> of / manage the power state of the i2c-hid device, even though my
> first instinct said that would be the way to go. Specific problems
> with using pm_runtime():
> * The initial power up couldn't happen in a runtime resume function
>   since it create sub-devices and, apparently, that's not good to do
>   in your resume function.
> * Managing our power state with pm_runtime meant fighting to make the
>   right thing happen at system suspend to prevent the system from
>   trying to resume us only to suspend us again. While this might be
>   able to be solved, it added complexity.
> Overall the code without pm_runtime() ended up being smaller and
> easier to understand.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-core.c | 82 +++++++++++++++++++++++++++++-
>  1 file changed, 81 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 34c0d98b4976..f1bb89377e8d 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -38,6 +38,8 @@
>  #include <linux/mutex.h>
>  #include <asm/unaligned.h>
>
> +#include <drm/drm_panel.h>
> +
>  #include "../hid-ids.h"
>  #include "i2c-hid.h"
>
> @@ -107,6 +109,8 @@ struct i2c_hid {
>         struct mutex            reset_lock;
>
>         struct i2chid_ops       *ops;
> +       struct drm_panel_follower panel_follower;
> +       bool                    is_panel_follower;
>  };
>
>  static const struct i2c_hid_quirks {
> @@ -1058,6 +1062,34 @@ int i2c_hid_core_initial_power_up(struct i2c_hid *=
ihid)
>         return ret;
>  }
>
> +int i2c_hid_core_panel_prepared(struct drm_panel_follower *follower)

As pointed out by the kernel test robot, I clearly missed making
several functions "static" in this patch series. :( I'll fix that in
v2, but for now I'll hold off sending v2 to wait for additional
feedback.

-Doug
