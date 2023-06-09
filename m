Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28511729DAC
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 17:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238333AbjFIPBY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 11:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjFIPBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 11:01:23 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A344418C
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 08:01:22 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-33e60900753so8157985ab.3
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686322882; x=1688914882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmJ5zFCWUL2O8tDvqWovVw/cx5VcmioXKAOPxd/sjek=;
        b=JbWwAotMfdJAy8qJCePGhA1/ddU0mLAc7fS2Co5bDL7aOy8L4ch2/OhJdYbppx8ZNF
         Mynu50Yg714JDtEDojANkvOAZBPIU+uRCRXDHq96XqLiDbllcn1IbbeSW8KZCU8Okk7M
         AdOf4COp5p68FcrQdEHNn0Y3MQrLWpUKrspgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322882; x=1688914882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BmJ5zFCWUL2O8tDvqWovVw/cx5VcmioXKAOPxd/sjek=;
        b=fbTziYxLx3M+5q/4X8hFAUwqYTsSrjhhS1F4BEQTaY3Go0EySmsKoTao/VRlGliaZS
         jVBmuVdzts45SfICM+CgPg33ndAcaR08QDJBi31SGVhfSIwexLYtsSNWRlY0ZDAOenJl
         vm2Tm+AShMYnc0TenDQoRwHkWNWO/kG/Q2rkdJ3gySmNmcWvAkeeABxZLy6B1DJn5/LG
         QLnozNOntlo2vcM3gGXwaCvdQmNRIr07gQdjwrJ3AgKdtFCS6Z2URwlxGJN1A9C2Pljn
         yR0Mo92QIPbP+zeTF0oCImtH72GxyOxt/2NGB8IqqDnhFMd2TiN+C0UlEFT8Rid2pSan
         EgQw==
X-Gm-Message-State: AC+VfDx2J6wq7bbAzSNkU7dZwoeWqXOOdcDtLlhWKP+VLllYZTcqBEjK
        C+hJrCiJuTniFbiCd4Lq62Y0nJ+xLEjJskqE6RA=
X-Google-Smtp-Source: ACHHUZ6rGRI1LDL4ZX3YzA1HBoYWTAU77VH40TkZNuz8cuNm4pZWmv3lUAXASF0RTT27tZTIMfAD/g==
X-Received: by 2002:a92:c743:0:b0:331:a2f5:b50d with SMTP id y3-20020a92c743000000b00331a2f5b50dmr1649243ilp.30.1686322881981;
        Fri, 09 Jun 2023 08:01:21 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id k19-20020a02cb53000000b004167410a9bcsm979651jap.113.2023.06.09.08.01.21
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:01:21 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so250215ab.1
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:01:21 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d02:b0:33d:cd39:c1cd with SMTP id
 i2-20020a056e021d0200b0033dcd39c1cdmr397198ila.14.1686322880679; Fri, 09 Jun
 2023 08:01:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230607215224.2067679-1-dianders@chromium.org>
 <20230607144931.v2.8.Ib1a98309c455cd7e26b931c69993d4fba33bbe15@changeid>
 <y3l4x3kv7jgog3miexati5wbveaynnryzqvj6sc4ul6625f2if@w7nqgojfavfw>
 <CAD=FV=W-fXpm4JCczrNgAS2M9u2VLd2jAkJvE9XJgQpvoE5rjA@mail.gmail.com> <CAO-hwJ+3M1iYgaAFEtf-63U20ccGfdiRoi3197YoZmyvMYsGzQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+3M1iYgaAFEtf-63U20ccGfdiRoi3197YoZmyvMYsGzQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Jun 2023 08:01:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X4aYuLC-8xgSD1VkCGnKEm4oRdYkHSajx7pL8aGu6YqA@mail.gmail.com>
Message-ID: <CAD=FV=X4aYuLC-8xgSD1VkCGnKEm4oRdYkHSajx7pL8aGu6YqA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jun 9, 2023 at 2:27=E2=80=AFAM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> > I suspect that it's not worth it, but I'll do this if you feel
> > strongly about it.
> >
> > I guess the simplest way I can think of to move this to its own file
> > would be to put the whole private data structure (struct i2c_hid) in a
> > private header file and then add prototypes for i2c_hid_core_resume()
> > and i2c_hid_core_suspend() there. Then I could add something like
> > i2c_hid_core_handle_panel_follower() that would have all the
> > registration logic. I'd still need special cases in the core
> > suspend/resume/remove code unless I add a level of abstraction. While
> > the level of abstraction is more "pure", it also would make the code
> > harder to follow.
> >
> > Unless I hear a strong opinion (or if this series changes
> > significantly), I'll plan to keep things in the same file and just use
> > a Kconfig.
> >
>
> Right, a separate file might not be the best then :(
>
> Do you envision this to be used on the ACPI side of i2c-hid? Because
> if this is OF only, then maybe it would be interesting to put it there
> (in i2c-hid-of.c), instead of having it in the core. IIRC i2c-hid-of
> also has ways to set up/down regulators, so maybe it'll be better
> there?

There is no reason why this problem would be limited to devices using
devicetree. Even if ACPI could somehow magically power sequence the
touchscreen and panel together, doing it behind the back of the kernel
driver would be a bad idea anyway so folks using ACPI would need the
same code. I don't have tons of experience with ACPI nor how to hook
this up there, but I purposely made the API for registering the panel
follower such that the client doesn't pass anything devicetree
specific. If someone could figure out how to detect a link between a
panel and a touchscreen for ACPI and add this code to
drm_panel_add_follower() then it would automatically work for the ACPI
case as well.

-Doug
