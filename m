Return-Path: <linux-input+bounces-936-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DC581CAB3
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 14:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01F1A1C21A94
	for <lists+linux-input@lfdr.de>; Fri, 22 Dec 2023 13:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D30120329;
	Fri, 22 Dec 2023 13:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N+8qPPjO"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AD81D55E
	for <linux-input@vger.kernel.org>; Fri, 22 Dec 2023 13:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703251710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zjtBwcyrS/xfG3xz11U3E0BKYyC+0OSUW6t3X3+SrTk=;
	b=N+8qPPjOBnxE8cESGjjeA3zJl2TAMGwJ9HkvlS/boXteFUXs51ATMMERVG2prvHMLfSBNq
	SqC7vWA8RkGt9z07ra+fljdvnrA+fa34KhFaI67h6obraBl8DtpxYvZJNrUWKhwJs+ToC+
	/grRqEPnB5qmavFLGlGqei43au1QMcA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-zu6EsMVNNMO4uCuuzIR6FQ-1; Fri, 22 Dec 2023 08:28:26 -0500
X-MC-Unique: zu6EsMVNNMO4uCuuzIR6FQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-553a7468be9so818852a12.2
        for <linux-input@vger.kernel.org>; Fri, 22 Dec 2023 05:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703251704; x=1703856504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zjtBwcyrS/xfG3xz11U3E0BKYyC+0OSUW6t3X3+SrTk=;
        b=QVbxtfwZ8L3rg/+SxYv5NFzEWDW4d5QVNg06u8Bxtd3H1qYHkhF68iXL8YlJiVeIMs
         r+G9OdDj+zbvxse8tqjztAHkXeV0MQeK19eG6TiVswSxm9jc8NWcwUznaXzkzgI99HDw
         GhKX5Gdwam1rvbwjE9C6hnRmZHjduBifDR/EieFZ3oyhpecG6/27Je6tYklBQA0zwXtJ
         XAk2QFVpXTa+LidwPzEB6sHyoI/bLbBrVRQlVKm4bdzbrZExnArE2nMrICWb+1G2rmjU
         gMonLi2yIUoWCsEv3bFvjREmXhWsQP8bbX3EzuKnbac87FpkNPMa75zTkYIUbAjgDFe+
         FWkA==
X-Gm-Message-State: AOJu0YwToGPyEEMBLlDS2x1psb0hiwHDg8/5uJRiIejqzItQN2vzQi/q
	Canp7y5vxoO/f25FyMxfw7rli1FU1r290dAWXclntY0jkpIjBJZs5JMmPr09ar91cBmfdZ2mp/Z
	lpdTZMneN6u050MMWH66Mdn/6Vjund2/m12LQx5h4TdSl6OH6UFBnNPVHxA==
X-Received: by 2002:aa7:c7d4:0:b0:553:451d:981 with SMTP id o20-20020aa7c7d4000000b00553451d0981mr611578eds.27.1703251704705;
        Fri, 22 Dec 2023 05:28:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8dKAHszdWVmVU3P+KG67bHgG7OlsmCbL7vkqRTd451rgN60S1dg0/d1u9nbfcB9U9ZPw0e7teJrPTePkYpk8=
X-Received: by 2002:aa7:c7d4:0:b0:553:451d:981 with SMTP id
 o20-20020aa7c7d4000000b00553451d0981mr611573eds.27.1703251704410; Fri, 22 Dec
 2023 05:28:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231219231503.1506801-1-jekhor@gmail.com> <20231220145229.020abe62@jic23-huawei>
 <CAKWEGV50duj-TcKdQp1BtN_QgnBZyG0WgAqo8Y5UtCinqOAh_g@mail.gmail.com> <38313826939a468ff8c7eee24e2cf07e9eef6768.camel@linux.intel.com>
In-Reply-To: <38313826939a468ff8c7eee24e2cf07e9eef6768.camel@linux.intel.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 22 Dec 2023 14:28:12 +0100
Message-ID: <CAO-hwJ+RDnukVhL1=PirK=hU7gm2t73xsg=aDss0M9hj_CSuHA@mail.gmail.com>
Subject: Re: [PATCH] HID: sensor-hub: Enable hid core report processing for
 all devices
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Yauhen Kharuzhy <jekhor@gmail.com>, Jonathan Cameron <jic23@kernel.org>, linux-input@vger.kernel.org, 
	linux-iio@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>, 
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 1:44=E2=80=AFPM srinivas pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Wed, 2023-12-20 at 17:04 +0200, Yauhen Kharuzhy wrote:
> > =D1=81=D1=80, 20 =D0=B4=D0=B5=D0=BA. 2023=E2=80=AF=D0=B3. =D0=B2 16:52,=
 Jonathan Cameron <jic23@kernel.org>:
> > >
> > > On Wed, 20 Dec 2023 01:15:03 +0200
> > > Yauhen Kharuzhy <jekhor@gmail.com> wrote:
> > >
> > > > After the commit 666cf30a589a ("HID: sensor-hub: Allow multi-
> > > > function
> > > > sensor devices") hub devices are claimed by hidraw driver in
> > > > hid_connect().
> > > > This causes stoppping of processing HID reports by hid core due
> > > > to
> > > > optimization.
> > > >
> > > > In such case, the hid-sensor-custom driver cannot match a known
> > > > custom
> > > > sensor in hid_sensor_custom_get_known() because it try to check
> > > > custom
> > > > properties which weren't filled from the report because hid core
> > > > didn't
> > > > parsed it.
> > > >
> > > > As result, custom sensors like hinge angle sensor and LISS
> > > > sensors
> > > > don't work.
> > > >
> > > > Mark the sensor hub devices claimed by some driver to avoid
> > > > hidraw-related
> > > > optimizations.
> > > >
> > > > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > > Fixes tag?
> >
> > Fixes: 666cf30a589a ("HID: sensor-hub: Allow multi-function sensor
> > devices")
> >
> This flag causes
>                 hdev->claimed |=3D HID_CLAIMED_DRIVER;
> I don't see the flag is used anywhere after this assignment in hid
> core. Only two other drivers are setting this flag. We need Jiri's help
> here why this is a special case.

It's used in hid_report_raw_event()[0]:
```
    if (hid->claimed !=3D HID_CLAIMED_HIDRAW && report->maxfield) {
        hid_process_report(hid, report, cdata, interrupt);
        hdrv =3D hid->driver;
        if (hdrv && hdrv->report)
            hdrv->report(hid, report);
    }
```

The whole point of setting HID_CLAIMED_DRIVER is to have hid->claimed
not equal to HID_CLAIMED_HIDRAW, in case we need the hid core
processing.

Cheers,
Benjamin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/hid/hid-core.c#n2015

>
> Thanks,
> Srinivas
>
> > >
> > > > ---
> > > >  drivers/hid/hid-sensor-hub.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-
> > > > sensor-hub.c
> > > > index 2eba152e8b90..26e93a331a51 100644
> > > > --- a/drivers/hid/hid-sensor-hub.c
> > > > +++ b/drivers/hid/hid-sensor-hub.c
> > > > @@ -632,7 +632,7 @@ static int sensor_hub_probe(struct hid_device
> > > > *hdev,
> > > >       }
> > > >       INIT_LIST_HEAD(&hdev->inputs);
> > > >
> > > > -     ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > > > +     ret =3D hid_hw_start(hdev, HID_CONNECT_DEFAULT |
> > > > HID_CONNECT_DRIVER);
> > > >       if (ret) {
> > > >               hid_err(hdev, "hw start failed\n");
> > > >               return ret;
> > >
> >
> >
>


