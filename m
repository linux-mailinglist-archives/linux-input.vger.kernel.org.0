Return-Path: <linux-input+bounces-6715-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758979865D2
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 19:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D011F21074
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 17:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC0582D94;
	Wed, 25 Sep 2024 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tE1lFf/v"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02D081AD2;
	Wed, 25 Sep 2024 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727286073; cv=none; b=Zya4AIloha6UWuumYNC4KdB8uxhaRQPO4K5oYwnlpYD9/TYxB09lpj+G3NC8wwQbL60VsMV99k/hfcIX0ZD17tDCmOajXNI0+rDFCbXi5WX255mBP8PK+YHRjubCyKBK08k9F3ajudzcJ5gd17bEx5r+PQQya7sG7jbiPGfPvRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727286073; c=relaxed/simple;
	bh=U4s0x8nHMCGlFBnv5DAkUy0EqfOT9iiCoy3JEC/fUIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C79tX9uac/Vtiowz79swgbQ9EYdyMbcNgbpzEMdq8B9k2N+69xsVqXBUvkpJ+IYiRd0RvhwSq2YRUmNJXvJMEayhw+M6hJ5Qxk76jRLOQOwao+4XWnkEp2xzDOSw81PTxUu63Wl6hE6+8wKayuZ0ht5f6Z2qv56jV7jPRZdheSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tE1lFf/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B930C4CECE;
	Wed, 25 Sep 2024 17:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727286072;
	bh=U4s0x8nHMCGlFBnv5DAkUy0EqfOT9iiCoy3JEC/fUIA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tE1lFf/vTuZYq0vMci6pm/+QmUZrT8OzOHI8z8iUkwKQDg5jze1pHhapIANYzmVTC
	 2Jzz67eMuG5yscuiSU5pRNbPE7x63oAKOSroMsRZZOfsQTWreqwbyRL8iL/e3zdIk1
	 tgvBj5HGNs8k0iWeoOmz4MucK/9ZLhIL7hD2xOZ4eDWKFG9zkY3+gJY1EVLCFD6ao+
	 y5PFW9aIzWioSZUCThQ4KFOOAwX5tnHTbr9BPPMD4F650feIcoj0sXtVMA0XNi8JiV
	 x9VRPdIUBTNv8k6l+MH9gdcEDHutWIhpYHDJVFwtBePmT2ZVR379/MKudvWfMTu7xi
	 qFaDX7JDMceXQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-535be093a43so136752e87.3;
        Wed, 25 Sep 2024 10:41:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdPLjjZ6hYv4l+iN8bjp/OQb7+Uh9Ju+BqAkKyS2eOtWfHgaxHRNgFeTeQNWp0QFNMif+1ZgddOPNr@vger.kernel.org, AJvYcCWdnw2Xow/MhHQdjiQFy/oAcGdfA3NkHmKQJTXsmjdYvmQC7EEn5a3z0lX3q63inKtaj6yP03NcL/k1KF4b@vger.kernel.org, AJvYcCWqVYksAkz3Vgcb+DxNnu/oL/mCfaEsFWhKDAxyVk4YafWUpfQtNtR69KpEMZuh8FOkOigN3bsRxeuCF1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7WQoZOyeRmwzVgjPajisKbsNNZLI535QA0NhqIDTITTnMN91h
	2YyMLoNl1XfvOi+/EUwN1pT2BSqPWeOjRUdOQ9/Kv6pMGEMc3UB4mDr8009NETcWV+G/eXT4Zj9
	VzOrkxYRb+qBvYZxtXzlQuwxLUQ==
X-Google-Smtp-Source: AGHT+IH97NR3bii8dolCy3vIDGVKQUMJRb1vgW3VK4/LPlUIVHJRiOZUB76+0ljkh/ZwIYWIZ5pxkFsIwvO65MktGZk=
X-Received: by 2002:a05:6512:250a:b0:535:6a4d:ed74 with SMTP id
 2adb3069b0e04-538775678f1mr2233982e87.51.1727286070749; Wed, 25 Sep 2024
 10:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814024513.164199-1-charles.goodix@gmail.com>
 <20240814024513.164199-3-charles.goodix@gmail.com> <CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com>
 <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
In-Reply-To: <CAL_JsqKUDj6vrWMVVBHrDeXdb3ogsMb3NUbV6OjKR-EhLLZuGg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Sep 2024 12:40:56 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
Message-ID: <CAL_Jsq+6fvCaxLexo9c6zs+8vwyfPAOCCVsejw_uKURVU-Md9w@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com
Cc: dianders@chromium.org, dan.carpenter@linaro.org, conor@kernel.org, 
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org, 
	hbarnor@chromium.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 5:41=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Fri, Sep 6, 2024 at 3:28=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
> >
> > On Tue, Aug 13, 2024 at 9:45=E2=80=AFPM Charles Wang <charles.goodix@gm=
ail.com> wrote:
> > >
> > > The Goodix GT7986U touch controller report touch data according to th=
e
> > > HID protocol through the SPI bus. However, it is incompatible with
> > > Microsoft's HID-over-SPI protocol.
> > >
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > > ---
> > >  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++=
++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt=
7986u.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.y=
aml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > new file mode 100644
> > > index 000000000..a7d42a5d6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: GOODIX GT7986U SPI HID Touchscreen
> > > +
> > > +maintainers:
> > > +  - Charles Wang <charles.goodix@gmail.com>
> > > +
> > > +description: Supports the Goodix GT7986U touchscreen.
> > > +  This touch controller reports data packaged according to the HID p=
rotocol,
> > > +  but is incompatible with Microsoft's HID-over-SPI protocol.
> > > +
> > > +allOf:
> > > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - goodix,gt7986u
> >
> > This is already documented in goodix,gt7375p.yaml. Now linux-next has w=
arnings:
> >
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goo=
dix,gt7986u.example.dtb:
> > touchscreen@0: compatible: 'oneOf' conditional failed, one must be
> > fixed:
> >         ['goodix,gt7986u'] is too short
> >         'goodix,gt7375p' was expected
> >         from schema $id:
> > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goo=
dix,gt7986u.example.dtb:
> > touchscreen@0: reg:0:0: 0 is not one of [93, 20]
> >         from schema $id:
> > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goo=
dix,gt7986u.example.dtb:
> > touchscreen@0: 'vdd-supply' is a required property
> >         from schema $id:
> > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> > /builds/robherring/linux-dt/Documentation/devicetree/bindings/input/goo=
dix,gt7986u.example.dtb:
> > touchscreen@0: 'goodix,hid-report-addr', 'spi-max-frequency' do not
> > match any of the regexes: 'pinctrl-[0-9]+'
> >         from schema $id:
> > http://devicetree.org/schemas/input/goodix,gt7375p.yaml#
> >
> > Please sort this out and send a fix.
>
> I should add that it is intermittent whether you see this error or
> not. The tools select a single schema based on the compatible string
> and it is undefined which of the 2 schemas you will get.

Still an issue and no response. Please fix or revert the series.

Rob

