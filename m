Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8954E58FF4C
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 17:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbiHKP2M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Aug 2022 11:28:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbiHKP2L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Aug 2022 11:28:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E5A3894120
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 08:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660231690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pyyZicGfxCosuxfOzGiPvCZKl7Zw5v9IKBUyR8STasU=;
        b=JI6YvA1Lou2VxAhMElYS5vRoPT29+lcwUSgcZ8Pv/+w00e6UDX3xULzdTPZh/R5P8BrG9O
        pdo4jJQtI40SN+K9otGouCZNQTKnf9UVy5XlINomWg0xb7Jwqbr+fy21h8jLBv5i/WyMOy
        EgMITFTQuSrvk1D8UfPyvg3T6yI4/l8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-256-NXjOxiGlMXGR3TcQMzKzYw-1; Thu, 11 Aug 2022 11:28:09 -0400
X-MC-Unique: NXjOxiGlMXGR3TcQMzKzYw-1
Received: by mail-pg1-f200.google.com with SMTP id 196-20020a6301cd000000b0041b0f053fd1so6619456pgb.6
        for <linux-input@vger.kernel.org>; Thu, 11 Aug 2022 08:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=pyyZicGfxCosuxfOzGiPvCZKl7Zw5v9IKBUyR8STasU=;
        b=pmJDukDHKNH+n3YJBc/tKqNeFEla6C07aUiWo0RwHJLh6iP6RLXC9lepGO0vouNAFq
         i+AsyGqwQu5FTtPzTyuauQo3/9h610tExSfdcqtPqdDBnFchYXWnmyBa2UDUruenYOIh
         tyPSf9y6OLayeN6UtJ5g4FvYQ8Rel3Q3UocjKWJPalo/YddeVDiwwGuxY5LRh/Mbo1Ka
         HIpXE6D6LVfft2ZPYELkvWBRKtwDTVE96hMjdVgVFh6jSEEj3e5RI0uK5Ki5dwg9NNat
         DQZdNTEqwzMjSeT5Da+iKd6JxVlM1F4IoBRjOqXL73lYZ31q1YDdlCYl1u8gMP95kx8n
         W58g==
X-Gm-Message-State: ACgBeo0ByakRc1NCHCLHO74IhI1C8Qm1Tu//skY5C3j/1PROukdAVV9E
        X4LNQWCcltbvfhqCmsVauqnQAQzt8u+zaqhBBC6Qp6IPDR7aNhvBT10lh0CVrNwfFuwA7n1vyNc
        Em6y4KO/uyQ/PAzdZE3crHEFKX5uo6duc6Lv96xs=
X-Received: by 2002:a17:90a:c58e:b0:1f3:1ab5:22ae with SMTP id l14-20020a17090ac58e00b001f31ab522aemr9331837pjt.45.1660231687776;
        Thu, 11 Aug 2022 08:28:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XMWTyM027cAaa57/38LykZhXqn1Z5RtclKltuvWm2EbjrPCwh5ukQpnlhdVbthKxo9c9SXjbcZ2jBPZ4YaZo=
X-Received: by 2002:a17:90a:c58e:b0:1f3:1ab5:22ae with SMTP id
 l14-20020a17090ac58e00b001f31ab522aemr9331818pjt.45.1660231687557; Thu, 11
 Aug 2022 08:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220804151832.30373-1-openglfreak@googlemail.com> <20220804180038.GA8906@elementary>
In-Reply-To: <20220804180038.GA8906@elementary>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 11 Aug 2022 17:27:56 +0200
Message-ID: <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Torge Matthies <openglfreak@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 4, 2022 at 8:00 PM Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gma=
il.com> wrote:
>
> Hi Torge,
>
> Thanks for the patch.
>
> On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
> > Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
> > styluses") broke input from my XP-Pen Star G640. This is because the
> > "Digitizer" usage is not recognized as a valid usage for input devices.
> >
> > This patch changes the IS_INPUT_APPLICATION macro so that the "Digitize=
r"
> > (HID_DG_DIGITIZER) usage is recognized as an input device usage.
> >
> > Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for stylu=
ses")
> > Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
> > ---
> > This patch could be risky, because any digitizer devices that were
> > previously not treated as input devices are now used for input.
> > Alternatively the linked commit could be reverted, but that would
> > re-introduce the problem detailed in its commit message.
> >
> >  include/linux/hid.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I hesitated about this when I sent the patch you mentioned. In the end,
> I didn't include any fix because the digitizer use was tested for 2
> years in DIGImend, so I (wrongly) assumed that it was safe enough.
>
> However, my initial thought was to add in uclogic_probe():
>
>         hdev->quirks |=3D HID_QUIRK_HIDINPUT_FORCE;
> +       hdev->quirks |=3D HID_QUIRK_HIDINPUT_FORCE;
>
> Let's see if we can hear more opinions, but if you are worried about
> affecting other drivers, that could be a good solution.

Sadly, my automated regression tests are broken for a while and I
haven't checked if that patch is introducing errors in hid-multitouch.

FWIW, this part has always been painful because some tablets were not
using the correct usages. And so that's why we are ending up in that
weird situation.

Anyway, just to mention that any code that touches this part should be
tested against the hid regression tests suite[0], because that's the
only way to find out if the change is affecting other devices.

Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/libevdev/hid-tools

>
> Best wishes,
> Jose
>
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 4363a63b9775..07803e144d98 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hd=
ev)
> >  /* We ignore a few input applications that are not widely used */
> >  #define IS_INPUT_APPLICATION(a) \
> >               (((a >=3D HID_UP_GENDESK) && (a <=3D HID_GD_MULTIAXIS)) \
> > -             || ((a >=3D HID_DG_PEN) && (a <=3D HID_DG_WHITEBOARD)) \
> > +             || ((a >=3D HID_DG_DIGITIZER) && (a <=3D HID_DG_WHITEBOAR=
D)) \
> >               || (a =3D=3D HID_GD_SYSTEM_CONTROL) || (a =3D=3D HID_CP_C=
ONSUMER_CONTROL) \
> >               || (a =3D=3D HID_GD_WIRELESS_RADIO_CTLS))
> >
> > --
> > 2.37.1
> >
>

