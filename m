Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD5FECD8E9
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 21:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfJFT3T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 15:29:19 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:38045 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfJFT3S (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Oct 2019 15:29:18 -0400
Date:   Sun, 06 Oct 2019 19:29:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570390155;
        bh=bUEOVhJJhOqFLKt6DTTxsqdcfaox3b9pxusoUbhoOjU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=vlRv7BTINqQrys80aNI+aYXNP6LWcaFofks2t+Xa9IrwhQhmAxxg+Xja47IbbjuUf
         jsLxrD17XkojrMUrC0euUVGz63a3h69wf3xtmxSiPzm15iHsPBkoNbrsfW2oxxeusj
         vTHOjxK4tyIVpvzMiV0mjWgwtTqYlyjD12Pna/Jw=
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
From:   Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH v3 3/4] HID: logitech: Add feature 0x0001: FeatureSet
Message-ID: <R1ooPQVKZmsUqlvqixQWt1oSjWQh4x9pfrGMkSKOuBhCPB2QHPSUBQKtdC3E-SVODHPXI9E4a43KCtV_q_EeXDGHMY8vjss9y23_39OfS8E=@protonmail.com>
In-Reply-To: <e0dc8d111e1615d35da0c87b4b93b55b3bb89f23.camel@archlinux.org>
References: <nZMYgsXB3gdFVoIR3TeMjdbHiP4STlPINtmdH7TkH-nLrHS5APVXn00Z-L89Bjnam4_EBf1GLqI5KAZDZhFnH9hyWGyCOGJQKZzpyN2tqlE=@protonmail.com>
 <e0dc8d111e1615d35da0c87b4b93b55b3bb89f23.camel@archlinux.org>
Feedback-ID: 18B_FC5q-t32TXzMsVp9BgkgrdNH3iwklfW8WOrHrcxZA0WRj7JodCh5VXKxs6A3OaiHK0QNd8wi3SImKex8yQ==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sunday, October 6, 2019 11:25 AM, Filipe La=C3=ADns <lains@archlinux.org=
> wrote:

> On Sun, 2019-10-06 at 01:04 +0000, Mazin Rezk wrote:
> > This patch adds support for the 0x0001 (FeatureSet) feature. This featu=
re
> > is used to look up the feature ID of a feature index on a device and li=
st
> > the total count of features on the device.
> >
> > I also added the hidpp20_get_features function which iterates through a=
ll
> > feature indexes on the device and stores a map of them in features an
> > hidpp_device struct. This function runs when an HID++ 2.0 device is pro=
bed.
> >
> > Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 92 ++++++++++++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitec=
h-hidpp.c
> > index a0efa8a43213..64ac94c581aa 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -190,6 +190,9 @@ struct hidpp_device {
> >
> >  =09struct hidpp_battery battery;
> >  =09struct hidpp_scroll_counter vertical_wheel_counter;
> > +
> > +=09u16 *features;
> > +=09u8 feature_count;
> >  };
> >
> >  /* HID++ 1.0 error codes */
> > @@ -911,6 +914,84 @@ static int hidpp_root_get_protocol_version(struct =
hidpp_device *hidpp)
> >  =09return 0;
> >  }
> >
> > +/* -------------------------------------------------------------------=
------- */
> > +/* 0x0001: FeatureSet                                                 =
        */
> > +/* -------------------------------------------------------------------=
------- */
> > +
> > +#define HIDPP_PAGE_FEATURESET=09=09=09=090x0001
> > +
> > +#define CMD_FEATURESET_GET_COUNT=09=09=090x00
> > +#define CMD_FEATURESET_GET_FEATURE=09=09=090x11
> > +
> > +static int hidpp20_featureset_get_feature(struct hidpp_device *hidpp,
>
> Can you change this to `hidpp20_featureset_get_feature_id` please? So
> that we keep in sync with the documentation, and to avoid minor
> confusion as IRoot has a `get_feature` function.

I will change this in v4, thanks.

>
> > +=09u8 featureset_index, u8 feature_index, u16 *feature_id)
> > +{
> > +=09struct hidpp_report response;
> > +=09int ret;
> > +
> > +=09ret =3D hidpp_send_fap_command_sync(hidpp, featureset_index,
> > +=09=09CMD_FEATURESET_GET_FEATURE, &feature_index, 1, &response);
> > +
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09*feature_id =3D (response.fap.params[0] << 8) | response.fap.params=
[1];
> > +
> > +=09return ret;
> > +}
> > +
> > +static int hidpp20_featureset_get_count(struct hidpp_device *hidpp,
> > +=09u8 feature_index, u8 *count)
> > +{
> > +=09struct hidpp_report response;
> > +=09int ret;
> > +
> > +=09ret =3D hidpp_send_fap_command_sync(hidpp, feature_index,
> > +=09=09CMD_FEATURESET_GET_COUNT, NULL, 0, &response);
> > +
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09*count =3D response.fap.params[0];
> > +
> > +=09return ret;
> > +}
>
> Just a nitpick but can we put this before
> `hidpp20_featureset_get_feature`? This way we keep the ID order.

That makes sense. I will change this in v4, thanks.

>
> > +
> > +static int hidpp20_get_features(struct hidpp_device *hidpp)
> > +{
> > +=09int ret;
> > +=09u8 featureset_index, featureset_type;
> > +=09u8 i;
> > +
> > +=09hidpp->feature_count =3D 0;
> > +
> > +=09ret =3D hidpp_root_get_feature(hidpp, HIDPP_PAGE_FEATURESET,
> > +=09=09=09=09     &featureset_index, &featureset_type);
> > +
> > +=09if (ret =3D=3D -ENOENT) {
> > +=09=09hid_warn(hidpp->hid_dev, "Unable to retrieve feature set.");
> > +=09=09return 0;
> > +=09}
> > +
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09ret =3D hidpp20_featureset_get_count(hidpp, featureset_index,
> > +=09=09&hidpp->feature_count);
> > +
> > +=09if (ret)
> > +=09=09return ret;
> > +
> > +=09hidpp->features =3D devm_kzalloc(&hidpp->hid_dev->dev,
> > +=09=09=09hidpp->feature_count * sizeof(u16), GFP_KERNEL);
> > +
> > +=09for (i =3D 0; i < hidpp->feature_count && !ret; i++)
> > +=09=09ret =3D hidpp20_featureset_get_feature(hidpp, featureset_index,
> > +=09=09=09=09i, &(hidpp->features[i]));
> > +
> > +=09return ret;
> > +}
> > +
> >  /* -------------------------------------------------------------------=
------- */
> >  /* 0x0005: GetDeviceNameType                                          =
        */
> >  /* -------------------------------------------------------------------=
------- */
>
> Please use `DeviceNameType` here to keep in sync with the
> documentation.

Since I have not modified GetDeviceNameType in this patch, I will keep it
the way it was for now. This could probably be changed in a different and
unrelated patch.

>
> > @@ -3625,6 +3706,17 @@ static int hidpp_probe(struct hid_device *hdev, =
const struct hid_device_id *id)
> >  =09=09hidpp_overwrite_name(hdev);
> >  =09}
> >
> > +=09/* Cache feature indexes and IDs to check reports faster */
> > +=09if (hidpp->protocol_major >=3D 2) {
> > +=09=09if (hidpp20_get_features(hidpp)) {
> > +=09=09=09hid_err(hdev, "%s:hidpp20_get_features returned error\n",
> > +=09=09=09=09__func__);
> > +=09=09=09goto hid_hw_init_fail;
> > +=09=09}
> > +=09} else {
> > +=09=09hidpp->feature_count =3D 0;
> > +=09}
>
> I have not looked at the whole code that much but is the else really
> needed here?

I wanted to initialize feature_count to 0 if the device was either
HID++ 1.0 or did not support FeatureSet. This was so that, just in case
its features array was accessed, it would not try to check an uninitialized
array. Although, I could probably remove the else statement and set
feature_count to 0 before the if statement. I would also be able to remove
the redundant initialization statement in hidpp20_get_features.

I will make these changes in v4, thanks.

>
> > +
> >  =09if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
> >  =09=09ret =3D wtp_get_config(hidpp);
> >  =09=09if (ret)
> > --
> > 2.23.0
> >
> --
> Filipe La=C3=ADns
> 3DCE 51D6 0930 EBA4 7858 BA41 46F6 33CB B0EB 4BF2
