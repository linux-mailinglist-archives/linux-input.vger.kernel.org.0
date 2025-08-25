Return-Path: <linux-input+bounces-14304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D46B34AB8
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 20:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E75D817951A
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 18:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052827E077;
	Mon, 25 Aug 2025 18:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="Y0lW4Ohd"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279C2279DB6;
	Mon, 25 Aug 2025 18:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756148305; cv=none; b=itxKtyKPHlX1rvMoE5pBCbLPhG0mXtpSN5iRstDFJHG67Oz0hUeonrIpvHOmT2t4JdwNBKV0r9t6NnReHb05ymDfYlOsycLUucYbx6GDKddkkfF6vJ9Eq1oXbL/r/XJzHYAElKHuBjaJfrdsDix+8ansGupS8A5c7N0DYNZftgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756148305; c=relaxed/simple;
	bh=1/zuFivZomsPME8/8+PeCrrHoyCcc8gLbHYb+qnZXpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oy9Buwn/+uudXWAk7/7184HSpSInp43kVVARAKBetpbe7x3hajQ64oOkP0H6Hw4A0elIshTW2gaS3NHexNbKdZ0oyQ4/ealo+dfHxFtH/y1aCwrj2KCLrQ5NywjUHi/YvqREfYpZvNWQnGn+l5navyZc0Dw7mmxMNGUzJ28D0Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=Y0lW4Ohd; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=lut+2nMqBPAZwhskUcYSHcIkgN0GFw27ibGnIZuPDy0=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1756148278; v=1; x=1756580278;
 b=Y0lW4OhddN5bU3GtpzfzWj3Cp3q851aMj2UyIjCl2QsLSIGJ2BZUlPBXxkVcuPmeBnq+6tU/
 VTuv5qfcS+A7XceSP3EwTg1ehAYoBuwTAHHGkZQn05W0SBzFx9Om42mLaekWcyjU1qc+QG4dgar
 v52VyqSF02Du60oaS68kpn1y/Sa4fRqkj0V6e0AAUCFBnIce7/PWaQ84uj+VLP09ECbnUXdsB6J
 x6vK/wJYRPO7iir6fl8uZL14Ra604p2BlYnG+LVDaB96ljHl3BdkkJzIpLcS85tTGCHThF0fwSM
 WIdCMh8MKgIDlFj8uE/JUVbkaJgJViYMBoWGVDSlxjJwg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id 21d610d7; Mon, 25 Aug 2025 20:57:58 +0200
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
To: Conor Dooley <conor@kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] dt-bindings: input: touchscreen: imagis: add missing minItems
Date: Mon, 25 Aug 2025 20:57:57 +0200
Message-ID: <5917367.DvuYhMxLoT@radijator>
In-Reply-To: <20250825-capillary-viral-b7448ca6a57e@spud>
References:
 <20250824-imagis-minitems-v1-1-cea9db55e87f@dujemihanovic.xyz>
 <20250825-capillary-viral-b7448ca6a57e@spud>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Monday, 25 August 2025 18:42:38 Central European Summer Time Conor Doole=
y wrote:
> On Sun, Aug 24, 2025 at 06:12:05PM +0200, Duje Mihanovi=C4=87 wrote:
> > The binding currently expects exactly 5 keycodes, which matches the
> > chip's theoretical maximum but probably not the number of touch keys on
> > any phone using the IST3032C. Add a minItems value of 2 to prevent
> > dt-validate complaints.
>=20
> Does this mean that there are devicetrees in the wild that use < 5
> keycodes?

Indeed.

> >=20
> > +  - |
> > +    #include <dt-bindings/input/linux-event-codes.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    i2c {
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +      touchscreen@50 {
> > +        compatible =3D "imagis,ist3032c";
> > +        reg =3D <0x50>;
> > +        interrupt-parent =3D <&gpio>;
> > +        interrupts =3D <72 IRQ_TYPE_EDGE_FALLING>;
> > +        vdd-supply =3D <&ldo2>;
> > +        touchscreen-size-x =3D <480>;
> > +        touchscreen-size-y =3D <800>;
> > +        linux,keycodes =3D <KEY_APPSELECT>, <KEY_BACK>;
>=20
> Does this really need a dedicated example? Why can't the property go
> into the existing one?

Only the IST3032C is currently known to support these keys and this is enfo=
rced
by the binding, so it wouldn't really make sense to add it to the 3038C
example.

Regards,
=2D-
Duje




