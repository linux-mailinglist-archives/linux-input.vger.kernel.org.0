Return-Path: <linux-input+bounces-14873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B1B86FCA
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 23:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DE7D58175B
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:00:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5CB26C3A7;
	Thu, 18 Sep 2025 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MFPGL+0F"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC621C6FE8
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 21:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758229237; cv=none; b=mqlRsS5xTisGE/xVRyJa3HByJoQP24Eko0e1FXgBlz3bZ3ZHAeVU4d8MiOaoBKiPW9b8319naLww8PspDCuNTwLbp9bw9O6GUBx87Ib7HTvLtXIaDXPt7tsDJJDL3eBkMKbYyVQeDhLa7wSxzwbM6sV5/jytvsIgKvEd3qnL4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758229237; c=relaxed/simple;
	bh=OfUXqLDDkS545GzfXO0iJxOO/Yluws5JSCW+LfxKucs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BjDTH10m32T+lDStWqLeaFngc0QzN3H41vD2LF5UDYIg2jJnHw+G3kcKl+uj7egVijZGcs1qMDfNhf6M3Rp9xQz+9+DD4FHY5q2LmgeTG9BJBDlB62AIQqGdZsk3qRR9da1eHc9VZiON3ZDT1TDkxz7se2j6yadXl2yeBvIiSyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MFPGL+0F; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ea5c612297bso1084874276.3
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 14:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758229235; x=1758834035; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa5OIKUu0Ca3IINo/LGf7w71t2tXTJFyE2lgg6vz7B0=;
        b=MFPGL+0FHDPbWs/ygIeidMVhI5Cdq6jQi8gVFLKAasHVHjN00pm4iJnSYwqaZJcY/6
         2TJNwD1YlvnB+Ntz0YBw+IvSsKbC3rJF7qdsDAavg1esPzTYdmlaM5yqqrf/oynqplTG
         PSOU5DH3PBUmbyfD525Fnkxs+O34/04QaqILY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758229235; x=1758834035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa5OIKUu0Ca3IINo/LGf7w71t2tXTJFyE2lgg6vz7B0=;
        b=eQZtTFNG4bP4qri1ijLxLwY3bP2TIt2wZ+reSEtSA3Ge/0BCNoD+8mPssuX4YCn5jy
         I4gviUBBwEOnuohzT+sGYyAEx7Di6ObyShyI++OwWw0DuF1YO9Jz8T9eonJp8mtrcDdm
         OSHG8cIE6VMEDJaUyTIA9L3G10441+/1t9JPgQvGqDf7wRDfO2ppS8t7n36dAzC9DGGW
         l3H3Q8PNuAvNpERxpaUadM7Lk2+JUwy+f+0lHuICKfYrhEjkYWromg+/9efVb1f5H0ai
         oHJfAVPdTcaD9NsmyFdfRxXLKlx5QIOH3MxelwQNXOONQtZ1OBIRJgRLTnlCj9fcazj8
         +vhA==
X-Forwarded-Encrypted: i=1; AJvYcCWPGRZkH7s0ZyXPib3GDVtXGG43bezRlwtQFqln5saY/VPMQBAmCvr+wDC1NU+GQ6/COFFKYIJUANbmbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLoXXyIrfAQp1ZgQZG6zz4cfGyejG4M+r2/aY47nq6b12k3R8d
	JjGg2QemCrdTJklaOR3o6IH5eaPKu588BbqeF+0L/3mQMjsO10FVc4TV4AhSSpWwFS71fDvhlW/
	QdYJkcGP6QepQzR6Wcq05NpJWUANtjUqzPwcQdSgZzg==
X-Gm-Gg: ASbGncvLcQQav1fOFAMbunchxOC6AK7JbkbNBNtzavdp8/BKb2s1hjCT/trYRLxH3AU
	wKdt2Eta8gDPjsNsZUS2h9Q+39rhUF6sxym9VqeBJVmWRAt95srEnCJgX/HXb3JOVJbo8AmGl8G
	yaCB4xaXw93yQO5Xsrgrk8+r9x/VwYSIAXCfjNXuCIGPQ+b4v7xzLg9N/v8hFDYctnjJnSy7nGs
	oH+ksJ8xfRH8ZDR6kd8Kk5yPMnF/zdxUW8=
X-Google-Smtp-Source: AGHT+IGp28b3RtzB09/vCQSod/GaXBm+1LaU+/ZwEenKAZ82Ogxy8gcysNIceSHCo4CO5jfnfEMY8Yfg89rinFTkagQ=
X-Received: by 2002:a05:6902:610f:b0:e98:517a:d058 with SMTP id
 3f1490d57ef6-ea89d1e9730mr930412276.19.1758229234832; Thu, 18 Sep 2025
 14:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-3-dario.binacchi@amarulasolutions.com> <20250918201027.GA2547040-robh@kernel.org>
In-Reply-To: <20250918201027.GA2547040-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 18 Sep 2025 23:00:24 +0200
X-Gm-Features: AS18NWBVm6SiQea3xV3X5Izj9IWvwA2EVM6sgJdzxnP17KY04QnqWViQQGH1JFU
Message-ID: <CABGWkvoxALJgbmaiBe7+1EidtnX2aVE9M9S=QS_Z=hOTh03dRA@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] dt-bindings: touchscreen: convert
 raspberrypi,firmware-ts bindings to json schema
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 10:10=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Sep 18, 2025 at 05:36:08PM +0200, Dario Binacchi wrote:
> > Convert Raspberry Pi firmware 7" touchscreen controller device tree
> > binding to json-schema.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v3)
> >
> > Changes in v3:
> > - Drop firmware-rpi node and use only touchscreen node to fix warnings
> >   you can see in
> >   https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202509=
13092707.1005616-3-dario.binacchi@amarulasolutions.com/
> >
> > Changes in v2:
> > - Added in v2
> >
> >  .../touchscreen/raspberrypi,firmware-ts.txt   | 26 ------------
> >  .../touchscreen/raspberrypi,firmware-ts.yaml  | 40 +++++++++++++++++++
> >  2 files changed, 40 insertions(+), 26 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.txt
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspbe=
rrypi,firmware-ts.txt b/Documentation/devicetree/bindings/input/touchscreen=
/raspberrypi,firmware-ts.txt
> > deleted file mode 100644
> > index 2a1af240ccc3..000000000000
> > --- a/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,f=
irmware-ts.txt
> > +++ /dev/null
> > @@ -1,26 +0,0 @@
> > -Raspberry Pi firmware based 7" touchscreen
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > -
> > -Required properties:
> > - - compatible: "raspberrypi,firmware-ts"
> > -
> > -Optional properties:
> > - - firmware: Reference to RPi's firmware device node
> > - - touchscreen-size-x: See touchscreen.txt
> > - - touchscreen-size-y: See touchscreen.txt
> > - - touchscreen-inverted-x: See touchscreen.txt
> > - - touchscreen-inverted-y: See touchscreen.txt
> > - - touchscreen-swapped-x-y: See touchscreen.txt
> > -
> > -Example:
> > -
> > -firmware: firmware-rpi {
> > -     compatible =3D "raspberrypi,bcm2835-firmware";
> > -     mboxes =3D <&mailbox>;
> > -
> > -     ts: touchscreen {
> > -             compatible =3D "raspberrypi,firmware-ts";
> > -             touchscreen-size-x =3D <800>;
> > -             touchscreen-size-y =3D <480>;
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/raspbe=
rrypi,firmware-ts.yaml b/Documentation/devicetree/bindings/input/touchscree=
n/raspberrypi,firmware-ts.yaml
> > new file mode 100644
> > index 000000000000..697c508326b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/raspberrypi,f=
irmware-ts.yaml
> > @@ -0,0 +1,40 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/raspberrypi,firmw=
are-ts.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Raspberry Pi firmware based 7" touchscreen
> > +
> > +maintainers:
> > +  - Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > +
> > +allOf:
> > +  - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - raspberrypi,firmware-ts
> > +
> > +  firmware:
> > +    description: Phandle to RPi's firmware device node.
>
>        deprecated: true
>
> It should be a child node.

Should I add the touchscreen node to
Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
and remove Documentation/devicetree/bindings/input/touchscreen/raspberrypi,=
firmware-ts.yaml
from this patch?

Thanks and regards,
Dario
>
> > +
> > +  touchscreen-size-x: true
> > +  touchscreen-size-y: true
> > +  touchscreen-inverted-x: true
> > +  touchscreen-inverted-y: true
> > +  touchscreen-swapped-x-y: true
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    touchscreen {
> > +        compatible =3D "raspberrypi,firmware-ts";
> > +        touchscreen-size-x =3D <800>;
> > +        touchscreen-size-y =3D <480>;
> > +    };
> > --
> > 2.43.0
> >
> > base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
> > branch: drop-touchscreen.txt



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

