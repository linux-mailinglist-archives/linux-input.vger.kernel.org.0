Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A61A64DE3A
	for <lists+linux-input@lfdr.de>; Thu, 15 Dec 2022 17:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiLOQL6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Dec 2022 11:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiLOQLy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Dec 2022 11:11:54 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F701658B
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 08:11:53 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bx10so3652010wrb.0
        for <linux-input@vger.kernel.org>; Thu, 15 Dec 2022 08:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5GllUlIDpXau0l2xEgc9SWI+sBV48rCRB1n9ph8iFkE=;
        b=d1iNuBETgZxSJPNmN4hHrBDFqeHAbOqV5FARXpn4WMOB5U08XEIViwYrZENzMTrWzY
         u6/OvJfqWE6u0fK9b5xmOH0GSd0yMSNiFWJZSjTlmWnvXFDkdlznCyTmZMdtF8F1x2eF
         W0+I4JfqUDKZy+BfAzw74gFiFFHkBZ0c/QOrVLqZRjjimCTbD58bt4dZ9su/2hRqExQ2
         GKdAZMiT3KgrR64eLhbyhKiqKbEKHJS/BDffHThQgfBSlVlxUnrmbZ7oQ0y9agXt6/eb
         zS2554ung8aj/rvAIiPnEPFwG7/oQVIJKPXvwMitawk8kfK6Kb9x73cCYXzX4JeS2Nw2
         hZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GllUlIDpXau0l2xEgc9SWI+sBV48rCRB1n9ph8iFkE=;
        b=TqeGl8Pm2vAtzEkkGMzwjW8GP2/UC47XbSSg8jpwQxm3JMoMXm6vYhG/7NxzQtB6YB
         /VvIQJNts0CyXUTBJ8y8qV0YjuYKOvsvuBbFdjNf9eSfj+yhDy+UClyHIV1xPNqhn6FG
         gaMKoTjFK+S6//p722jjNqvxl7oV1P+k25J14qAufHOao5suPPDc6vt0P8E0wi9t0Rtf
         QVLwoCUNedlfUMHm7AUPD1Qh12an57cGtQflXeHjWRtEeieZUl0qBpnFFVXEcsA+Gkm7
         XppYBZV4G7hHFcza+D4iqR95gCguhW4csKuCt6T2cmfC4KLdrmn37lPFX5+25WkghR4o
         Qx4A==
X-Gm-Message-State: ANoB5pl9jtlKJDeMpcH2M+KEF0tLGcoCJicx0xx1fswEDkCj7Tjw8X+Z
        ZpKA4G5jeZgqTCnVJnW/IpWET/+4Aw+nKte0KRM=
X-Google-Smtp-Source: AA0mqf44hSCI9P7LyaxNoja04BFOTE2pCQe+f2LOJKxVT0q73fDik7hh16+jDPJ2NycTiYTvTapo2yCEJuElPOrm1SM=
X-Received: by 2002:adf:fad0:0:b0:24f:b97d:861d with SMTP id
 a16-20020adffad0000000b0024fb97d861dmr445930wrs.201.1671120712298; Thu, 15
 Dec 2022 08:11:52 -0800 (PST)
MIME-Version: 1.0
References: <CANRwn3QZfeu4Oonw2-bFHzDajxDJRD6+G5HXr1WJ7bJuXddf2Q@mail.gmail.com>
 <20221203114318.10103-1-jose.exposito89@gmail.com>
In-Reply-To: <20221203114318.10103-1-jose.exposito89@gmail.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Thu, 15 Dec 2022 08:11:40 -0800
Message-ID: <CANRwn3S=6S+mtzL5eFUP=z6K0m=1LO3gyvS4eWHugB8n_3NBhw@mail.gmail.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     benjamin.tissoires@redhat.com, jason.gerecke@wacom.com,
        jikos@kernel.org, joshua@joshua-dickens.com,
        linux-input@vger.kernel.org, ping.cheng@wacom.com,
        pinglinux@gmail.com, skomra@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks for the response, Jose.

Unfortunately this isn't an issue that we can fix in the Wacom driver
since it affects devices that don't use the Wacom driver. While we
could theoretically adopt affected VID:PIDs into the Wacom driver on a
case-by-case basis, there would be a large time lag between us
adopting a device and users running the required kernel. This should
really be something that is fixed in the hid-generic driver, even if
it means some pain trying to ensure we don't break things in the
process... I'm still hoping to hear something back from Benjamin about
my hid-tools test results or if additional testing is needed.

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....

On Sat, Dec 3, 2022 at 3:43 AM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> Hi Jason,
>
> > Still waiting to hear back about this. Are positive results from the
> > hid-tools tests sufficient, or is there additional work that should be
> > done for this patch?
>
> A while ago a similar patch was sent [1] and it was in a similar status
> to your patch for a while, so I decided to fix the issue in the UCLogic
> driver [2].
>
> I can not tell you if this patch needs additional work, but you might be
> interested in fixing it in the Wacom driver, where it'd be easier for you
> to test that no regressions are introduced.
>
> I hope this helps a bit,
> Jose
>
> [1] https://lore.kernel.org/linux-input/20220804151832.30373-1-openglfrea=
k@googlemail.com/
> [2] https://lore.kernel.org/linux-input/d08049f2-443b-f769-cfde-629cdfb96=
fc0@alexyzhang.dev/T/
