Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E432C729F56
	for <lists+linux-input@lfdr.de>; Fri,  9 Jun 2023 17:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241817AbjFIP4h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Jun 2023 11:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241998AbjFIP4c (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Jun 2023 11:56:32 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26273A97
        for <linux-input@vger.kernel.org>; Fri,  9 Jun 2023 08:56:25 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-33b4552e55cso6158955ab.0
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686326183; x=1688918183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqAimDvnh6CPASJWE79N/CEnDvYL3nhLI7BR9MCv+68=;
        b=BF57r8A4HEY28sjgViBf2OnCR98DgvGGocGLPip/A2SsuaaBg2HLYLf4TslS2ag8rQ
         VAg1cF+l+XCTTKGxdwMOBnHyaOAcGsnnoZ0RO5O+CRnaCTpOD9PM4gp82+DnGYY5Qxsw
         JRZZqErayvJUW2+2hkS8eW+JizoeMj9poU2js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686326183; x=1688918183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqAimDvnh6CPASJWE79N/CEnDvYL3nhLI7BR9MCv+68=;
        b=jCpmCGOfjN81Pww/7kfrKOMPZacye4dRE0YdFq2pt/DUXXVrs8fdbNcqkXXOe+b1G2
         ltFHoRQsT0zK7WYIqmAlnurp7eiL97QJt068Jcy0MhOP9ANQSoSC5c4CZEa5t4xMPPhk
         qmhAOxXMnHsQA89rZ5ehMEMgegRbT9sJzR4f/BLDcO2IC+mneuphArfU9COh3UMH0srH
         A/fcrfeF/uVBLTVwoKzqRGuwvJ217YHGfrkMwLj1SDxpcTtlCGTcHcr7yor6Ll7De2oN
         EtsVM2bGpiTrhrMpykvYxDF/zaaB4mfMrI7UYG+Pw7o+vP4hOqcnWcS3R8ufDa5VLo5j
         6KMA==
X-Gm-Message-State: AC+VfDzPkkTDUgXPSvx4AbvAoRZS3vr8KKp4kb1cFCqumhZruEdsiJHs
        t27V2G2qn/8/7JaPfnmzCoSiqGPAj8W9oum+/U4=
X-Google-Smtp-Source: ACHHUZ4Q1SDmkdvQN/HJoEC7sygqB7l3p2MoGze7WjqTRvLEczgdie7NgIamboTb3YOUYA1uKSko1A==
X-Received: by 2002:a92:d6ce:0:b0:33e:6d37:ce76 with SMTP id z14-20020a92d6ce000000b0033e6d37ce76mr1437924ilp.12.1686326183503;
        Fri, 09 Jun 2023 08:56:23 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id t7-20020a92c907000000b0032ab5a86443sm1144037ilp.74.2023.06.09.08.56.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:56:22 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so257725ab.1
        for <linux-input@vger.kernel.org>; Fri, 09 Jun 2023 08:56:22 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c0c:b0:33d:5640:f315 with SMTP id
 l12-20020a056e021c0c00b0033d5640f315mr375551ilh.25.1686326181977; Fri, 09 Jun
 2023 08:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230608130147.2835818-1-yangcong5@huaqin.corp-partner.google.com>
 <20230608130147.2835818-2-yangcong5@huaqin.corp-partner.google.com> <77dce4ec-89aa-8802-b169-744f6c11b177@linaro.org>
In-Reply-To: <77dce4ec-89aa-8802-b169-744f6c11b177@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 9 Jun 2023 08:56:10 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UxQPWm6BNSeTAJWq1Cc8qFL2WTJHFiOrca5mnTEPHMvQ@mail.gmail.com>
Message-ID: <CAD=FV=UxQPWm6BNSeTAJWq1Cc8qFL2WTJHFiOrca5mnTEPHMvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: HID: i2c-hid: ilitek: Introduce
 bindings for Ilitek ili9882t
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, hsinyi@google.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jun 9, 2023 at 8:50=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> > +  vccio-supply:
> > +    description: The 1.8V supply to the touchscreen.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - vccio-supply
> > +
> > +additionalProperties: false
>
> Why do you disallow all properties from toouchscreen.yaml? Aren't they
> applicable?

This matches what hid-over-i2c.yaml does. It only picks
`touchscreen-inverted-x` and `touchscreen-inverted-y` from the common
file, which aren't needed here. I assume that the rest of the things
from the common file can be probed using the i2c-hid protocol?

-Doug
