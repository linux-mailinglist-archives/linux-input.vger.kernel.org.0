Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1630E71A2DC
	for <lists+linux-input@lfdr.de>; Thu,  1 Jun 2023 17:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbjFAPkk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Jun 2023 11:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233324AbjFAPkj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Jun 2023 11:40:39 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992E7B3
        for <linux-input@vger.kernel.org>; Thu,  1 Jun 2023 08:40:38 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-77483f80522so41695139f.3
        for <linux-input@vger.kernel.org>; Thu, 01 Jun 2023 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685634036; x=1688226036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vZ+EiS+GQTo9AhoMTu3o3MEzgb5CpypJEioCqg0kvwY=;
        b=mUwKms3MQB40gOnUj9w/LsDIifBL4E72NvbbTbjieV6RnMe6YUevOcGljDQCmBbIHG
         YjPASne2HN0sCyaEnoemFzJIl/ednz3wIoiwjjsnz/mhfBabJT7Zp4lRzyP7Z/LCmxB1
         61ecMUlvEEtsSEQ0YfsJGo3VNd6MAqHYVNUUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685634036; x=1688226036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZ+EiS+GQTo9AhoMTu3o3MEzgb5CpypJEioCqg0kvwY=;
        b=B+Bsfw0v+M2sicBSap7BdcAMCOoM4OJ8rlhfEhgRD+pp14UgNpmIFtaq+PhVRyx/3H
         aCvjz22SOT1qcVKIMXsjr2KttO4P7nVvqO5qHjP8pPlRsWsM36UEe/0Y841lM5g7mXfm
         AbJdvKXlIqeWMGex2+5m2HFP9qwpN4d7sW9pUhPPaCgADuACco205OebCPHwwQFWWK+3
         ztAt9mBvw06HD7XbY4r8PbeCr6S9af8cDSyPYlwKHMiU1jumr1nXFB/fcgi/Me/EISjL
         yA7CSWjKvYr9VYVTobBT5ePsIM7eAAzSknL+Qfx7h1Nc6Axl/QXnk5QIB8DIIvIi/9Xf
         C+XQ==
X-Gm-Message-State: AC+VfDycnB/hj6fDR+Lned0FPtHBDntA3yA6zArDRUTOZcsaOiJrYfih
        4ysf0O2axYp6g7426u6VuCMZ1j66VuEEzWK/b7w=
X-Google-Smtp-Source: ACHHUZ6LO+1ULrWuXQ97svk03bXF8yeXHoQzvQu5xtKpmTVkHdzz1cDox+1ydT+JPXx48cfTUNjvgA==
X-Received: by 2002:a5d:9ccb:0:b0:774:9c64:e0ab with SMTP id w11-20020a5d9ccb000000b007749c64e0abmr7183187iow.17.1685634036161;
        Thu, 01 Jun 2023 08:40:36 -0700 (PDT)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com. [209.85.166.175])
        by smtp.gmail.com with ESMTPSA id o5-20020a056602224500b007748f491918sm4652439ioo.40.2023.06.01.08.40.35
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 08:40:35 -0700 (PDT)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-33bf12b5fb5so128415ab.1
        for <linux-input@vger.kernel.org>; Thu, 01 Jun 2023 08:40:35 -0700 (PDT)
X-Received: by 2002:a05:6e02:180c:b0:33b:3d94:afb5 with SMTP id
 a12-20020a056e02180c00b0033b3d94afb5mr191613ilv.25.1685634034756; Thu, 01 Jun
 2023 08:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=FV=VYfPSwar2AXBxB3vX0dV1kjQ5bZMxsEBFhUnMNRXbBCw@mail.gmail.com>
 <20230520050649.2494497-1-yangcong5@huaqin.corp-partner.google.com>
 <20230520050649.2494497-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=Wm_SK0V6WJUkuvu8yFfiP60JBuOdw9cy=0Ck2Jbn-X2A@mail.gmail.com>
 <bd19f71b-59ee-80e7-9ff1-1cc26ecc49a7@kernel.org> <CAD=FV=WaVXUr8=4MrZQgA7t=yUBDt-iMvOFSeWhsKZ8XHJAREA@mail.gmail.com>
 <CAHwB_N+ZpCAYftCLRwyNo2wCca+JHfGJc0_rJ=jwJcU0mbG=Dw@mail.gmail.com>
In-Reply-To: <CAHwB_N+ZpCAYftCLRwyNo2wCca+JHfGJc0_rJ=jwJcU0mbG=Dw@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 1 Jun 2023 08:40:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBwZmJUVKqX5XOrgJB-VYPgJP=HKr+DoFRFu3C3tGq2w@mail.gmail.com>
Message-ID: <CAD=FV=XBwZmJUVKqX5XOrgJB-VYPgJP=HKr+DoFRFu3C3tGq2w@mail.gmail.com>
Subject: Re: [v2 2/2] dt-bindings: input: touchscreen: Add ilitek 9882T
 touchscreen chip
To:     cong yang <yangcong5@huaqin.corp-partner.google.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, hsinyi@google.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, May 31, 2023 at 8:06=E2=80=AFPM cong yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> Thanks, I'll keep an eye on that next time. This patch can be discarded,.=
After adding this series https://lore.kernel.org/r/20230523193017.4109557-1=
-dianders@chromium.org=EF=BC=8C

Thanks! I'll see if I can give that series a spin soon and then see
how we can make progress to getting it landed.


> using ekth6915  also can meet my needs.

Even if using ekth6915 can meet your needs, it's still better to
actually add the right compatible string. Putting in the device tree
that you have an "elan6915" and that you're providing "vcc33" isn't
the best when you actually have a different touchscreen and are
providing a very different voltage. Adding the proper bindings is
definitely preferred.


> On Wed, May 31, 2023 at 12:58=E2=80=AFAM Doug Anderson <dianders@chromium=
.org> wrote:
>>
>> Hi,
>>
>> On Tue, May 30, 2023 at 4:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
>> >
>> > On 22/05/2023 17:33, Doug Anderson wrote:
>> > > Hi,
>> > >
>> > > On Fri, May 19, 2023 at 10:07=E2=80=AFPM Cong Yang
>> > > <yangcong5@huaqin.corp-partner.google.com> wrote:
>> > >>
>> > >> Add an ilitek touch screen chip ili9882t.
>> > >>
>> > >> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
>> > >> ---
>> > >>  .../devicetree/bindings/input/elan,ekth6915.yaml         | 9 +++++=
++--
>> > >>  1 file changed, 7 insertions(+), 2 deletions(-)
>> > >
>> > > I'm curious about the DT maintainers opinion here. Should this be a
>> > > new bindings file, or should it be together in the elan file. If
>> > > nothing else, I think the secondary voltage rail name is wrong. I to=
ok
>> > > a quick peek at a datasheet I found and I don't even see a 3.3V rail
>> > > going to the ili9882t. That makes it weird to reuse "vcc33-supply" f=
or
>> > > a second supply...
>> >
>> > It's easier if they are CCed...
>>
>> Crud. I just assumed and didn't check the CC list. Cong: can you
>> resend and make sure you're CCing the people that get_maintainers
>> points at. One way to find that would be:
>>
>> ./scripts/get_maintainer.pl -f
>> Documentation/devicetree/bindings/input/elan,ekth6915.yaml
