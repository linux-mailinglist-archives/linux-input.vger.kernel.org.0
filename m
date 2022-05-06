Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7EB151D1C1
	for <lists+linux-input@lfdr.de>; Fri,  6 May 2022 08:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344657AbiEFHA7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 May 2022 03:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243243AbiEFHA6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 6 May 2022 03:00:58 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C9AD51116D
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 23:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651820236;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=54ZvBbayCIV2xZt0bRzR1dbuERZmTMuFfk3p1ZAPDoc=;
        b=ZTQ5/fljFMJDXvk6/9bXZdqJXqk/SRLqFLZRIR4tQQlzTC/uRguDoNNiONugxveoySkuky
        973HdLllzYaHI6Eg/CXYydERUUG/ReKQq3rlAob53Vpw+7SfMIReam/8Jyv42wDl6Ii2Xt
        6vzMkr/A2yndd1gAmmab6XrzyqbnXWM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-103-79SiseQHOyeHB_nLYimh2A-1; Fri, 06 May 2022 02:57:12 -0400
X-MC-Unique: 79SiseQHOyeHB_nLYimh2A-1
Received: by mail-pj1-f72.google.com with SMTP id oo16-20020a17090b1c9000b001c6d21e8c04so5773809pjb.4
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 23:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=54ZvBbayCIV2xZt0bRzR1dbuERZmTMuFfk3p1ZAPDoc=;
        b=qA0rdYdYpgCCI6s4cwhv1jyp07zaBzmJkuwXXqmOS8XSp4PN139dbCqIvVuAJfb/0I
         eQbKnF5kTTVforcl2ozdP3GS63P2N0PudDzafzM0N+degDuVCgDAnHywZgBpydDzvZk5
         G9a6R8vUsNIQF8lMyTnx29UXYD1YGFBu1V/g4rdGCyCtctmoQgTcYcU92nDap2FAE3Rd
         3MxVuoEqe2GCsPoZ1Xxjr7Zeg7h3vdB4ouM8wFrrLFdYhxjkw+Ik+unBK6LcGs+BWfQz
         LnRyBsGXXN+dPl1YZ3VQGz/XOXuYSbhYN2SwBNpIv56fDNeChuPRDTd64a7bV4TsLqgX
         ZBRA==
X-Gm-Message-State: AOAM532VB7Czb3AZblXjGdjJaz3MZB3eug9lVZuHjkB8ZqvgsQFTSxsT
        txTIqRB9r/DANV/JyvenNGB+lMCc8IVUSv+imqpfL0G2U6YzjV682cLDZXYpiHCT5cCvBWEiiIj
        NaO7zEgtinXqrHpxGwWHTlMjoDiqFyQI2K39ueF4=
X-Received: by 2002:a17:903:1251:b0:156:9d8e:1077 with SMTP id u17-20020a170903125100b001569d8e1077mr2096533plh.116.1651820231574;
        Thu, 05 May 2022 23:57:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoRxwWXQc5arSryIKvBJ6/d4sRsoN8EExI5FhFfxE1YvbYsnyVDLslPiFx+njTEw7ts+98+iCYKkmo1LnmsXQ=
X-Received: by 2002:a17:903:1251:b0:156:9d8e:1077 with SMTP id
 u17-20020a170903125100b001569d8e1077mr2096525plh.116.1651820231366; Thu, 05
 May 2022 23:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com> <20220427224526.35657-3-vi@endrift.com>
 <CAO-hwJLsLx3xFB_PLFqnR7afXp0=NZmhCEMR4xr--sZ3QsZA5w@mail.gmail.com> <0f886b39-8aed-436e-7963-c908409101dd@endrift.com>
In-Reply-To: <0f886b39-8aed-436e-7963-c908409101dd@endrift.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 6 May 2022 08:57:00 +0200
Message-ID: <CAO-hwJ+EP8+wRFVJSrh__t=Jk63SOQLQarbM3ZDHzw4K2_S-JA@mail.gmail.com>
Subject: Re: [PATCH 3/6] HID: hid-playstation: Disable touchpad reporting when
 hidraw open
To:     Vicki Pfau <vi@endrift.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 6, 2022 at 12:04 AM Vicki Pfau <vi@endrift.com> wrote:
>
> Hello,
>
> On 5/5/22 01:57, Benjamin Tissoires wrote:
> > On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
> >>
> >> When using the hidraw node directly, disable the touchpad endpoint to =
prevent
> >> it from sending separate mouse-like reports. This is accomplished in t=
he same
> >> way that the hid-steam driver does it, by creating and attaching an in=
put_dev
> >> with a custom low-level transport driver, which monitors and reports w=
hen the
> >> hidraw node is opened or closed. Reports sent by the real device are r=
eported
> >> to the "fake" device, and the real device is prevented from creating a=
 hidraw
> >> node. This "fake" device is connected with only a hidraw node, and is =
exposed
> >> with identifying information that is identical to the original device,=
 so the
> >> "fake" device's hidraw node appears as the node associated with the de=
v.
> >
> > Besides the "we should have a generic way of doing this", why do we
> > only prevent touchpad events from being reported?
>
> As, from what I can tell, most windowing systems treat it as a mouse, it'=
s the most prone to "double input" problems when prodded by both the hidraw=
 and the windowing system. Windowing systems generally don't do anything wi=
th the other exposed inputs, as far as I can tell.
>
> >
> > [looking at the code further down]
> >
> > So it seems you are entirely disabling the input nodes, which is what
> > I would have expected, so the commit description needs some changes.
> > Or am I reading this wrong?
>
> I am unsure where this discrepancy lies in the description. Can you be mo=
re specific?
>

When I read the code, I was under the impression that when an hidraw
node was opened, it was disabling all other input nodes (joysticks,
buttons and touchpad).
But maybe this is just disabling the touchpad, which still leaves you
with duplicated events on the gamepad side.
So either we need to also disable those other events, or the code is
doing just that and the description is not correct :)

Cheersm
Benjamin

