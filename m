Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A63716A13
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 18:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjE3Qwl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 12:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjE3Qwk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 12:52:40 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C78669D
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:52:38 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7748d634a70so333714139f.2
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685465558; x=1688057558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfTlpnHMOZxiUbtco4W6+o8TVl366P2iW1YkCqnywqM=;
        b=aJ+aohhXMeeCIfS1f0lskYblnpOpzi0i+o8fMr4QUma/Oxo/KiAYRFyEtfDjMb0N/2
         5rjfuTjLK8MICLbt9Z+5MZ9xtzJgY2x7lFrJqilQHK+c1uYEDdS7nKO8zddV3/Fy0IIl
         aeHfl6vZQCP43QDB0/gM+y6n6nLwJD/WWNvvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685465558; x=1688057558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfTlpnHMOZxiUbtco4W6+o8TVl366P2iW1YkCqnywqM=;
        b=bZ027yHnlzkUlNXNOmeKCi1Ygo2g8hcMiip3MmSYK/+n7Q9qfRoI9YgbsrYnl9OiRG
         EXAT9yNljeRzhLk8ROty7f8qh+BZsk/w7NGGXjDeptwr/wGcxz9C6cZlfiSbCtZ6Mpjl
         SHCwW6l6mZ8smPLdWkFljZGw9983tp1pgKbCHtGa9uT6UaKKO5C1yoeuw/wcjmceLgqC
         CNIQeY/32U2iCq4sWNH85Q10B1oyyFKwC90nPrPJxOFuOjiXQbH0ybXTPRZXrPNsIAEs
         LzYfclVwOm23Rjb22II6J9k3/suUqyoMiTvZ3UTzktBWFly81JTocjwdnSiu5yKlWnlF
         e42w==
X-Gm-Message-State: AC+VfDzRZq8lYWKBoALEgN93vraZMAI2Mx8030p9wePFt5itjgDfsoVq
        1vfk5+ShYnTZ2CBigMGbGl2F9fyesPupDtAL5YA=
X-Google-Smtp-Source: ACHHUZ7LTBAAA79nRQjvjeuaW2Z+VYKqAqrqUXg7IQrn/Apn0JyEhJzBm9Co6cBR4TmBOBVVu/UNMQ==
X-Received: by 2002:a92:d352:0:b0:333:eae9:c3f8 with SMTP id a18-20020a92d352000000b00333eae9c3f8mr146549ilh.7.1685465558241;
        Tue, 30 May 2023 09:52:38 -0700 (PDT)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id i39-20020a056638382700b0040bbf478147sm824507jav.163.2023.05.30.09.52.37
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 09:52:38 -0700 (PDT)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-33b7f217dd0so4375ab.0
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 09:52:37 -0700 (PDT)
X-Received: by 2002:a92:c24e:0:b0:338:3b6a:4719 with SMTP id
 k14-20020a92c24e000000b003383b6a4719mr165620ilo.17.1685465557498; Tue, 30 May
 2023 09:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230523193017.4109557-1-dianders@chromium.org>
 <20230523122802.1.Id68e30343bb1e11470582a9078b086176cfec46b@changeid> <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
In-Reply-To: <10457cab-f9b0-c38b-9f11-36853b71c7e8@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 May 2023 09:52:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XJhVaFNcLZ_wA=vnYCVVxjq1NFxdV794C0mmxpqvPL6g@mail.gmail.com>
Message-ID: <CAD=FV=XJhVaFNcLZ_wA=vnYCVVxjq1NFxdV794C0mmxpqvPL6g@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: HID: i2c-hid: Add "panel" property to
 i2c-hid backed panels
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, May 30, 2023 at 8:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/05/2023 21:27, Douglas Anderson wrote:
> > As talked about in the patch ("drm/panel: Add a way for other devices
> > to follow panel state"), touchscreens that are connected to panels are
> > generally expected to be power sequenced together with the panel
> > they're attached to. Today, nothing provides information allowing you
> > to find out that a touchscreen is connected to a panel. Let's add a
> > phandle for this.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >  Documentation/devicetree/bindings/input/elan,ekth6915.yaml  | 6 ++++++
> >  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
> >  Documentation/devicetree/bindings/input/hid-over-i2c.yaml   | 6 ++++++
> >  3 files changed, 18 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml=
 b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index 05e6f2df604c..d55b03bd3ec4 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -24,6 +24,12 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  panel:
> > +    description: If this is a touchscreen, the panel it's connected to=
. This
>
> Hm, can there be different setup? Touchscreen without panel? What would
> it be then?

For a touchscreen that's a discrete device (not sharing logic / power
rails with the panel) you'd just leave off the panel node like we've
always done. Assuming folks like this series in general, I'll try to
improve the wording for v2.


> Why only these touchscreens? This looks generic, so maybe in
> touchscreen.yaml?

Ah, that makes sense. I guess we need to add an include of that file
from the elan and goodix bindings. The hid-over-i2c.yaml already has
it, though. I'm not 100% sure the existing "hid-over-i2c" driver in
Linux actually calls the function to parse all those properties, but I
guess that's a Linux problem and not a DT bindings problem. ;-)

-Doug
