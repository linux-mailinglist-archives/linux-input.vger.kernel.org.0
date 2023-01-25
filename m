Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A0CA67ACC9
	for <lists+linux-input@lfdr.de>; Wed, 25 Jan 2023 09:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbjAYIr6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 03:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbjAYIrq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 03:47:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB6558952
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 00:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674636101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4viStdFhELUFl5gToSCw3F2SmTIzzk74YC63rU202BU=;
        b=G/mQntHx02nGoIPkZS8rr4FjXRvEmC6PNVYnBy465Nmh55Ry0T7t80YBfrOlaYUERCUZNf
        UouR0z07LDeycxs+q9sNf2FWcX896uTdyer/GgGxSEWkTMEsYNq6MYGd+6UIecTXNlWrsI
        1VDyK+8D2/oXWvZ24E/XS4E60V1wqxU=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-380-2KkCm_pTOvWMSWuysPo_Bg-1; Wed, 25 Jan 2023 03:41:39 -0500
X-MC-Unique: 2KkCm_pTOvWMSWuysPo_Bg-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5066df312d7so9546407b3.0
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 00:41:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4viStdFhELUFl5gToSCw3F2SmTIzzk74YC63rU202BU=;
        b=NiAyQXlJINIautRZtWBulyIKlqiemtQz3HLnWpjysIy1lo8XqTwTDvqNt2PIMOrJif
         2ZAK2kl4Im5B0w3Y8CClujXF8iPEGchLsFKvIq1aj2WpyhDGseIrHDZFsGTItlkmjWXU
         F5AbHRNVdiAWU0gHzNWxi4e0aNeHy6Vsy6DuhzDZ8HjY/o9urbUvtjnMp0Ls0l4YD/zv
         t/PHX+dTShHbg6GHz3lcZW/jEaaKpL8a4wFEgebBxn+1kj1Nrnfu3N2bvK/m3g8u+8Ys
         6QS2/44xi3qpRWHE44/nUw58Sui1/HjMNhVJf63xdnvMmq1a3jM28H3Lfkvv4PdV5J/T
         nIJw==
X-Gm-Message-State: AFqh2kqPEJLZ5dPshroUumypxmHjb0pl5lGwbE8q51V+JBm94geuq2x7
        H/+dSkqCInGkBQBjmkm3FM3QiuVhucIrxuzxTRItz8e0Fu4j/Z7i7hyuaxOi62hAw6CBUBNUkng
        1UN+8z+exFnV2vczizfW5HRCY4zw0QhkWICkDbbk=
X-Received: by 2002:a25:b94d:0:b0:801:e503:dd0c with SMTP id s13-20020a25b94d000000b00801e503dd0cmr1610154ybm.384.1674636098980;
        Wed, 25 Jan 2023 00:41:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv2ZIGe4FVpCL+IicU4Se3BVFtBYfS4qey72sJxMtdGsnOWdfDrDWRuRyfenLEF5kAeHbZ3qPxs4LMk6exy60s=
X-Received: by 2002:a25:b94d:0:b0:801:e503:dd0c with SMTP id
 s13-20020a25b94d000000b00801e503dd0cmr1610149ybm.384.1674636098712; Wed, 25
 Jan 2023 00:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20230111012336.2915827-1-vi@endrift.com> <20230111012336.2915827-2-vi@endrift.com>
 <c53fc0632b16a7b04bc59ffcd642f3bad4ee864a.camel@redhat.com>
In-Reply-To: <c53fc0632b16a7b04bc59ffcd642f3bad4ee864a.camel@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 25 Jan 2023 09:41:27 +0100
Message-ID: <CAO-hwJLmNDto15daD=AdZKMGSGYKSS18=EHauT2FeuHoxSPCUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: hid-steam: Add rumble on Deck
To:     Lyude Paul <lyude@redhat.com>
Cc:     Vicki Pfau <vi@endrift.com>, Jiri Kosina <jikos@kernel.org>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 18, 2023 at 12:16 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Tue, 2023-01-10 at 17:23 -0800, Vicki Pfau wrote:
> > The Steam Deck includes a new report that allows for emulating XInput-s=
tyle
> > rumble motors with the Deck's actuators. This adds support for passing =
these
> > values directly to the Deck.
> >
> > Signed-off-by: Vicki Pfau <vi@endrift.com>
> > ---
> >  drivers/hid/Kconfig     |  8 ++++++
> >  drivers/hid/hid-steam.c | 55 +++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 63 insertions(+)
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index e2a5d30c8895..e9de0a2d3cd3 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -1025,6 +1025,14 @@ config HID_STEAM
> >       without running the Steam Client. It supports both the wired and
> >       the wireless adaptor.
> >
> > +config STEAM_FF
> > +     bool "Steam Deck force feedback support"
> > +     depends on HID_STEAM
> > +     select INPUT_FF_MEMLESS
> > +     help
> > +     Say Y here if you want to enable force feedback support for the S=
team
> > +     Deck.
> > +
> >  config HID_STEELSERIES
> >       tristate "Steelseries SRW-S1 steering wheel support"
> >       help
> > diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> > index efd192d6c51a..788b5baaf145 100644
> > --- a/drivers/hid/hid-steam.c
> > +++ b/drivers/hid/hid-steam.c
> > @@ -91,6 +91,7 @@ static LIST_HEAD(steam_devices);
> >  #define STEAM_CMD_FORCEFEEDBAK               0x8f
> >  #define STEAM_CMD_REQUEST_COMM_STATUS        0xb4
> >  #define STEAM_CMD_GET_SERIAL         0xae
> > +#define STEAM_CMD_HAPTIC_RUMBLE              0xeb
> >
> >  /* Some useful register ids */
> >  #define STEAM_REG_LPAD_MODE          0x07
> > @@ -134,6 +135,9 @@ struct steam_device {
> >       u8 battery_charge;
> >       u16 voltage;
> >       struct delayed_work heartbeat;
> > +     struct work_struct rumble_work;
> > +     u16 rumble_left;
> > +     u16 rumble_right;
> >  };
> >
> >  static int steam_recv_report(struct steam_device *steam,
> > @@ -290,6 +294,45 @@ static inline int steam_request_conn_status(struct=
 steam_device *steam)
> >       return steam_send_report_byte(steam, STEAM_CMD_REQUEST_COMM_STATU=
S);
> >  }
> >
> > +static inline int steam_haptic_rumble(struct steam_device *steam,
> > +                             u16 intensity, u16 left_speed, u16 right_=
speed,
> > +                             u8 left_gain, u8 right_gain)
> > +{
> > +     u8 report[11] =3D {STEAM_CMD_HAPTIC_RUMBLE, 9};
> > +
> > +     report[3] =3D intensity & 0xFF;
> > +     report[4] =3D intensity >> 8;
> > +     report[5] =3D left_speed & 0xFF;
> > +     report[6] =3D left_speed >> 8;
> > +     report[7] =3D right_speed & 0xFF;
> > +     report[8] =3D right_speed >> 8;
> > +     report[9] =3D left_gain;
> > +     report[10] =3D right_gain;
> > +
> > +     return steam_send_report(steam, report, sizeof(report));
> > +}
> > +
> > +static void steam_haptic_rumble_cb(struct work_struct *work)
> > +{
> > +     struct steam_device *steam =3D container_of(work, struct steam_de=
vice,
> > +                                                     rumble_work);
> > +     steam_haptic_rumble(steam, 0, steam->rumble_left,
> > +             steam->rumble_right, 2, 0);
> > +}
> > +
> > +#ifdef CONFIG_STEAM_FF
> > +static int steam_play_effect(struct input_dev *dev, void *data,
> > +                             struct ff_effect *effect)
> > +{
> > +     struct steam_device *steam =3D input_get_drvdata(dev);
> > +
> > +     steam->rumble_left =3D effect->u.rumble.strong_magnitude;
> > +     steam->rumble_right =3D effect->u.rumble.weak_magnitude;
> > +
> > +     return schedule_work(&steam->rumble_work);
> > +}
> > +#endif
> > +
> >  static void steam_set_lizard_mode(struct steam_device *steam, bool ena=
ble)
> >  {
> >       if (enable) {
> > @@ -541,6 +584,15 @@ static int steam_input_register(struct steam_devic=
e *steam)
> >       input_abs_set_res(input, ABS_HAT0X, STEAM_PAD_RESOLUTION);
> >       input_abs_set_res(input, ABS_HAT0Y, STEAM_PAD_RESOLUTION);
> >
> > +#ifdef CONFIG_STEAM_FF
> > +     if (steam->quirks & STEAM_QUIRK_DECK) {
> > +             input_set_capability(input, EV_FF, FF_RUMBLE);
> > +             ret =3D input_ff_create_memless(input, NULL, steam_play_e=
ffect);
> > +             if (ret)
> > +                     goto init_ff_fail;
> > +     }
> > +#endif
> > +
> >       ret =3D input_register_device(input);
> >       if (ret)
> >               goto input_register_fail;
> > @@ -549,6 +601,7 @@ static int steam_input_register(struct steam_device=
 *steam)
> >       return 0;
> >
> >  input_register_fail:
> > +init_ff_fail:
>
> JFYI, this actually causes a compilation warning with CONFIG_STEAM_FF
> disabled:
>
> drivers/hid/hid-steam.c: In function =E2=80=98steam_input_register=E2=80=
=99:
> drivers/hid/hid-steam.c:604:1: warning: label =E2=80=98init_ff_fail=E2=80=
=99 defined but not
> used [-Wunused-label]
>   604 | init_ff_fail:
>       | ^~~~~~~~~~~~
>
> TBH I think we should be fine just reusing the input_register_fail: jump =
label
> for this instead of adding another label.
>
> FWIW as well if you want: you could just drop the Kconfig option for this
> entirely, which bentiss may or may not want. It would at least leave a li=
ttle
> less chance for compilation warnings like this, since the more Kconfig op=
tions
> you have for a module the higher the chance you'll leave a warning by mis=
take
> in some random kernel config.

I agree with Lyude here. However the whole HID tree is crippled with
those "if input_ff" and that would mean a bigger policy change.

So I would suggest keeping the Kconfig option for now, and if you
want, Vicki (or anybody else) maybe it's time to get rid of those
input_ff Kconfigs and make them slightly more evident for users.
Whether the first driver to use it selects input_ff or they all depend
on input_ff without the ability to disable it is entirely the
responsibility of the submitter :)

Cheers,
Benjamin

>
> If you end up deciding to leave the Kconfig in I'd at least update the co=
mmit
> message to mention explicitly you added it so people notice it even if th=
ey
> don't look at the diff (e.g. maintainers just merging reviewed patches).
>
> I have no hard opinion either way as long as we fix the compilation warni=
ng
> :). With the issues mentioned here addressed, this patch is:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> >       input_free_device(input);
> >       return ret;
> >  }
> > @@ -842,6 +895,7 @@ static int steam_probe(struct hid_device *hdev,
> >       INIT_WORK(&steam->work_connect, steam_work_connect_cb);
> >       INIT_LIST_HEAD(&steam->list);
> >       INIT_DEFERRABLE_WORK(&steam->heartbeat, steam_lizard_mode_heartbe=
at);
> > +     INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
> >
> >       steam->client_hdev =3D steam_create_client_hid(hdev);
> >       if (IS_ERR(steam->client_hdev)) {
> > @@ -898,6 +952,7 @@ static int steam_probe(struct hid_device *hdev,
> >  client_hdev_fail:
> >       cancel_work_sync(&steam->work_connect);
> >       cancel_delayed_work_sync(&steam->heartbeat);
> > +     cancel_work_sync(&steam->rumble_work);
> >  steam_alloc_fail:
> >       hid_err(hdev, "%s: failed with error %d\n",
> >                       __func__, ret);
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

