Return-Path: <linux-input+bounces-884-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724581962A
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 02:22:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EA752879FE
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 01:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AEA5241;
	Wed, 20 Dec 2023 01:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d82D+FAN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D68F6D;
	Wed, 20 Dec 2023 01:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cda24a77e0so1439778a12.2;
        Tue, 19 Dec 2023 17:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703035323; x=1703640123; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BDQ0C/UuIbHfVYkNVyd9qPgnTDAn1mRbPqzgGn6yPFc=;
        b=d82D+FANjtQfaC1l7XYESfxQ3Wldq/I8DcgrEltPj5Cq6UxIAXE4fPLQtBX3RjWpEW
         kIvuZl+IJRcjdVAzwi3XqEXmAzTxlD3dk45BPq5nTXIedgIzts9LGCvq17i2p/0cXRgW
         kDBMDzB24AnH6hl+Y9s1WfCFppuNDiT8vXOhtB22yuYkWLMrhA5cAd9qrpn+shwgi+02
         DvyEjEjNVdkHpUQhfrv3eRgLRo17N4eQ5Z9F4g+H+MMzGp9uWFLzQinbWT1DVbDe7MIx
         OMOiRidc8U8gtioTbCIFketAL9oeKVFvs2Rso9mQR+kXZlVwzaJ9F0rMml5LeRK5vAqQ
         ThfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703035323; x=1703640123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDQ0C/UuIbHfVYkNVyd9qPgnTDAn1mRbPqzgGn6yPFc=;
        b=w/hK/p/smhTrxKk39n9GizHZsOPFWwIe812IiAcrECcx0QmUH/npnntYsiidm9MeyX
         cWClyiZMdDCDLMs0+IwSSNgZzFKfZuQhLZT8e709r5FTsMsXdjJ9bdVnnILB21O9AtKk
         MsPrG+wnkd+d7Ud2oxgwHeEZcxA0g58ByET4OEFJF7rDV5Yxqc1bHaveZANGt7c/ClNq
         Vqe7mOvCI+8bvhrlMWU5epa9U4VbM/pBxufYX+O05lRmCOG+eESpIfe2os1Rp/Q5KeQb
         NvOK2GZ7kDJcgcSXh04gG7DUTIz1+LzU/ng4l20R0S//If9DAyN4IaKslDbES4aZwRC6
         L6Fg==
X-Gm-Message-State: AOJu0YyN/Qe5gzq7/oEdvXGx0B65kLByQcIS27adU8esd5GOVS+Ixf2V
	S62izwgKsd9/xNOeeJzMPG0=
X-Google-Smtp-Source: AGHT+IE1kY61E75r6p1GEXmIRnbuWxCmoCr4bpdB5dzOyBkYFLcKxNOO+nao+NSulARD3z/pnbQ7Tw==
X-Received: by 2002:a17:90a:fa0b:b0:28b:9c35:f2b9 with SMTP id cm11-20020a17090afa0b00b0028b9c35f2b9mr2245325pjb.64.1703035323196;
        Tue, 19 Dec 2023 17:22:03 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:b2ca:95aa:9761:8149])
        by smtp.gmail.com with ESMTPSA id pt10-20020a17090b3d0a00b0028afd8b1e0bsm2321389pjb.57.2023.12.19.17.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 17:22:02 -0800 (PST)
Date: Tue, 19 Dec 2023 17:22:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Artur Rojek <contact@artur-rojek.eu>,
	Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
Message-ID: <ZYJBuGMs4kKKDxmc@google.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
 <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
 <ZYH97KVDO4lFsbmi@google.com>
 <fb38504f15148c78c7a91850daf8c247d592b0a0.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb38504f15148c78c7a91850daf8c247d592b0a0.camel@crapouillou.net>

On Wed, Dec 20, 2023 at 01:23:31AM +0100, Paul Cercueil wrote:
> Hi Dmitry,
> 
> Le mardi 19 décembre 2023 à 12:32 -0800, Dmitry Torokhov a écrit :
> > On Fri, Dec 15, 2023 at 12:19:51PM +0100, Artur Rojek wrote:
> > > On 2023-12-15 03:40, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > 
> > > > uinput refuses to work with abs devices where the min value is
> > > > greater
> > > > than the max value. uinput_validate_absinfo() returns -EINVAL if
> > > > this
> > > > is the case and prevents using uinput on such a device. Since
> > > > uinput
> > > > has worked this way since at least kernel 2.6 (or prior) I
> > > > presume that
> > > > this is the correct way of doing things, and that this
> > > > documentation
> > > > needs to be clarified that min must always be less than max.
> > > > 
> > > > uinput is used in my use case to bind together adc-joystick
> > > > devices
> > > > with gpio-keys devices to create a single unified gamepad for
> > > > userspace.
> > > > 
> > > > Note that there are several boards that will need to be
> > > > corrected,
> > > > all but a few of them I maintain. Submitting as an RFC for now to
> > > > get
> > > > comments from the input team and the original author in case
> > > > there is
> > > > something I am missing.
> > > > 
> > > > Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven
> > > > joystick")
> > > > 
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5
> > > > +++--
> > > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/adc-
> > > > joystick.yaml
> > > > b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > index 6c244d66f8ce..8f5cdd5ef190 100644
> > > > --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> > > > @@ -73,8 +73,9 @@ patternProperties:
> > > >          description: >
> > > >            Minimum and maximum values produced by the axis.
> > > >            For an ABS_X axis this will be the left-most and
> > > > right-most
> > > > -          inclination of the joystick. If min > max, it is left
> > > > to
> > > > userspace to
> > > > -          treat the axis as inverted.
> > > > +          inclination of the joystick. The axis must always be
> > > > expressed as
> > > > +          min < max, if the axis is inverted it is left to
> > > > userspace to
> > > > handle
> > > > +          the inversion.
> > > 
> > > Hi Chris,
> > > 
> > > Device Tree is supposed to depict the actual state of the hardware.
> > > I worded the adc-joytick's adc-range property specifically, so that
> > > it
> > > covers a case of GCW Zero hardware [1], which has a joystick, 
> > > where the
> > > ABS_X axis reports increasing values for the left-wards inclination
> > > of
> > > the joystick, and decreasing values for the right-wards
> > > inclination. You
> > > are saying that there are even more boards that need to be
> > > corrected -
> > > those are all situations, where DT depicts the actual behavior of
> > > the
> > > hardware.
> > > What you are trying to do is change hardware description, because
> > > of how
> > > a driver in an OS works. You should instead fix behavior of said
> > > driver,
> > > even if nobody stumbled upon that issue since 2.6 :) We fixed
> > > libSDL [2]
> > > for the same reason.
> > 
> > We have several places in the kernel (such as mousedev and joydev)
> > where
> > we expect that max is greater or equal to min if they are specified.
> > I
> > am sure that at least some userspace components also have this
> > assumption. In general, we expect min to be a minimum value reported
> > and
> > max being maximum value reported, and orientation expressed via
> > different properties (see [1]).
> 
> You can express all you want in DT properties the orientation of the
> axis, it does not carry to userspace. As far as I can see there is
> absolutely no way to tell userspace that an axis is inverted.

That is true, and I will argue that it is a feature. Kernel's task is to
normalize the data stream and present it to userspace so that it does
not have to deal with differences of hardware. This abstraction often
breaks, but when we can keep it, we should.

Thanks.

-- 
Dmitry

