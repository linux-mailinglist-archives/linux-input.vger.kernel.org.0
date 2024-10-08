Return-Path: <linux-input+bounces-7136-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4850F993F7D
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD1571F256B6
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8FF1D0DE7;
	Tue,  8 Oct 2024 06:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hz7ebRRF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3771C1AAD;
	Tue,  8 Oct 2024 06:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370654; cv=none; b=EsfZbluvQYGURfTncSL4seMdWLe5Z4VXhyZWUCD44mdJIDTR0o5UoA1GCL8NM12rZh2Ciidh4hlrI54nQrrK4/InOuVwkWhcHb87vQDI8mAJyKEO3kCCtcoOYnN9bafJHTE0wOcA839W57V5wtU+gQDvqWUWeUAsk2a456+YxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370654; c=relaxed/simple;
	bh=LyZ2ki69h2PyFpJzRlR88ioXCtESz/tjGbyPTcRACW8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jTJdRL1lNSxd2vRJyQJhFAafUfru1xnfxaPw5zrAv6lU8K+HqZl3oMF7MPfmW7bqFmPqPvgMPDW9nCmWvLibQiiYzNxC8LvbPh6n3D53YCeU77vMsrHCj4Uv9JXrw9KUERj1AfCeN6391ZglCREXTX9Y+EOsl2ZxlU9gBYZgQOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hz7ebRRF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c718bb04a3so7421398a12.3;
        Mon, 07 Oct 2024 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728370651; x=1728975451; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LyZ2ki69h2PyFpJzRlR88ioXCtESz/tjGbyPTcRACW8=;
        b=Hz7ebRRFJHcdiMcgrdWNPb9h9tCyY3xa2MZtjRZFrZTf5ugL+JWJ800pzDpO1CsMbp
         aETPUBNZzRu+LRGVQkK4rKiWXgJ3x6LBV0lIhevZKrFh0sAR073NRM7YM9n1tmuhuT6n
         dAfWd+Dd+5A/fJ4yi6cr2gPeDXsgcA9JaNA5gO3xruye58NK+JKqid0zCAUsGXOhWLIZ
         N143bCbw/lpHj85Q19bUz5p1FjXbnJh+WyRgUC7EFuLdvS8iUoe+mJ+Etq2zNWDHNy86
         H5LnCq/AuILMZuKvNuv13JzTORpus9xdFxfffEU6ceCwmtu1ory/46jxSjpHUCujz+Lm
         qM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370651; x=1728975451;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyZ2ki69h2PyFpJzRlR88ioXCtESz/tjGbyPTcRACW8=;
        b=tJGx6LMXQ0LP8CZd8DegzrvT1gzPKBZLwY9ThvxH85Yc4qR4VDyvQSjr9S4lODTrWY
         McpHm8P3BySFe3TK8d98if75ava+qFSDEGYB1ROjrPaBn06cJEkzskZLpqRFs4ZTWqxB
         b6YaKH8sESnY7kvnolIdSUjSmRk+Ibq2YWUJwKyBIlHtvZl4pM3tBHCN5tHcIC63Xdwc
         hl1nQaH4B9ePMbCT/gTmfpX6pecz7X1OzZ04YQ98vuDf/33Ru3Vcr5Xuxhx7TCugghFP
         aFssaDFRppjMdG/zZCjThdWWLiR7bNt+XteMmZhNsxAfE164aUTRgeFD7Blgemyz2WC1
         tdFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNp7f8H8aiTmuQ+6nZlDrZu6hAqfZ14APD7FPfeBnPsy9xYMwEvk0S6Ydo5NuG+0OLtqmRyIWa6A7i@vger.kernel.org, AJvYcCWWpj51v+1acRirw8KT7J99/7t2t3AxyZyog4sd2Lu1btISwFKacnZKT1c6zYnVTtJSmubBZLKcfyPQ4kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6EYQMeVjufKvQ69BnWHPF9Lq99RRonUoZRDVkg6KjkFjVjBPz
	gqMkJVu95mmDbLsFp68Fi+jwLpopJNYn5wjqf39oSB5Xkbynj7Td
X-Google-Smtp-Source: AGHT+IG+jmMS+YGazzTsDmiCea8PggBEKgbKxe0M3LSGZznxyuqpBytF7R+BP2vkyJKWD5aZYY/aCQ==
X-Received: by 2002:a17:906:ef07:b0:a86:b46b:860a with SMTP id a640c23a62f3a-a991c0756a5mr1542795266b.54.1728370650910;
        Mon, 07 Oct 2024 23:57:30 -0700 (PDT)
Received: from ?IPv6:2003:f6:ef02:2700:7b7e:80b8:b4bb:6d07? (p200300f6ef0227007b7e80b8b4bb6d07.dip0.t-ipconnect.de. [2003:f6:ef02:2700:7b7e:80b8:b4bb:6d07])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9933db9c5bsm453204566b.162.2024.10.07.23.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 23:57:30 -0700 (PDT)
Message-ID: <1152587140a4c0e921d71864e58476e80c1b8f08.camel@gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: input: Document adp5589 and similar
 devices
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Rob Herring <robh@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mike Frysinger
	 <vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Date: Tue, 08 Oct 2024 09:01:45 +0200
In-Reply-To: <20241002205858.GA1285914-robh@kernel.org>
References: 
	<20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
	 <20241001-b4-dev-adp5589-fw-conversion-v1-5-fca0149dfc47@analog.com>
	 <20241002205858.GA1285914-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-10-02 at 15:58 -0500, Rob Herring wrote:
> On Tue, Oct 01, 2024 at 03:41:36PM +0200, Nuno Sa wrote:
> > Add device tree bindings for the adp5589 keypad (and similar devices). =
The
> > ADP5585 family has small differences like the lack of the unlock
> > function and less pins (cols x rows) for the keymap.
> >=20
> > As there's no MAINTAINERS entry for these devices, add one. Also to not=
e
> > that these devices were removed from trivial-devices.yaml.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0.../devicetree/bindings/input/adi,adp5589.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 310
> > +++++++++++++++++++++
> > =C2=A0.../devicetree/bindings/trivial-devices.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 -
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
> > =C2=A03 files changed, 319 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/adi,adp5589.yaml
> > b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
> > new file mode 100644
> > index
> > 0000000000000000000000000000000000000000..bdbc79758a0390952c8363ec28f48=
057da
> > b929a9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
> > @@ -0,0 +1,310 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/adi,adp5589.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADP5589 and similar Keypad Controllers
> > +
> > +maintainers:
> > +=C2=A0 - Nuno Sa <nuno.sa@analog.com>
> > +=C2=A0 - Michael Hennerich <michael.hennerich@analog.com>
> > +
> > +description: |
> > +=C2=A0 Analog Devices Mobile I/O Expander and QWERTY Keypad Controller=
s
> > +=C2=A0=C2=A0 -
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADP=
5589.pdf
> > +=C2=A0=C2=A0 -
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADP=
5585.pdf
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adp5589
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adp5585
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adp5585-2
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 vcc-supply: true
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 gpio-controller:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if there are pins=
 not used in the keypad.
> > +
> > +=C2=A0 '#gpio-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 interrupt-controller:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if there are pins=
 not used in the keypad.
> > +
> > +=C2=A0 '#interrupt-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 adi,cols-mask:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the number of pins (columns) be=
ing used ad part of the
> > keymap. As
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the device is fully configurable and we=
 can have holes in the columns
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 being used, this is given as mask.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0 minimum: 0x1
> > +=C2=A0=C2=A0=C2=A0 maximum: 0x3f
> > +
> > +=C2=A0 adi,rows-mask:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the number of pins (rows) being=
 used ad part of the keymap.
> > As
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the device is fully configurable and we=
 can have holes in the rows
> > being
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 used, this is given as mask.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32
> > +=C2=A0=C2=A0=C2=A0 minimum: 0x1
> > +=C2=A0=C2=A0=C2=A0 maximum: 0xff
> > +
> > +=C2=A0 adi,key-poll-ms:
> > +=C2=A0=C2=A0=C2=A0 description: Configure time between consecutive sca=
n cycles.
> > +=C2=A0=C2=A0=C2=A0 enum: [10, 20, 30, 40]
> > +=C2=A0=C2=A0=C2=A0 default: 10
> > +
> > +=C2=A0 adi,unlock-keys:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies a maximum of 2 keys that can =
be used to unlock the keypad.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If this property is set, the keyboard w=
ill be locked and only
> > unlocked
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after these keys are pressed. The value=
 127 serves as a wildcard
> > which
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 means any key can be used for unlocking=
.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
>=20
> You probably don't allow repeated key values? If so, then you can add=20
> 'uniqueItems: true' to enforce that.
>=20

Oh nice. Indeed repeated keys make no sense...

> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anyOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 88
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 97
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 115
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: 127
> > +
> > +=C2=A0 adi,unlock-trigger-sec:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the time in which the second un=
lock event must occur after
> > the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first unlock event has occurred.
> > +=C2=A0=C2=A0=C2=A0 maximum: 7
> > +=C2=A0=C2=A0=C2=A0 default: 0
> > +
> > +=C2=A0 adi,reset1-keys:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the trigger events (key presses=
) that can generate reset
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conditions one the reset1 block.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > +=C2=A0=C2=A0=C2=A0 maxItems: 3
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anyOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 88
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 97
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 115
> > +
> > +=C2=A0 adi,reset2-keys:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the trigger events (key presses=
) that can generate reset
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conditions one the reset2 block.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
> > +=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 anyOf:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 1
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 88
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - minimum: 97
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 115
> > +
> > +=C2=A0 adi,reset1-active-high:
> > +=C2=A0=C2=A0=C2=A0 description: Sets the reset1 signal as active high.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,reset2-active-high:
> > +=C2=A0=C2=A0=C2=A0 description: Sets the reset2 signal as active high.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,rst-passtrough-enable:
>=20
> passthrough
>=20
> > +=C2=A0=C2=A0=C2=A0 description: Allows the RST pin to override (OR wit=
h) the reset1
> > signal.
> > +=C2=A0=C2=A0=C2=A0 type: boolean
> > +
> > +=C2=A0 adi,reset-trigger-ms:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Defines the length of time that the res=
et events must be active
> > before a
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset signal is generated. All events m=
ust be active at the same time
> > for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the same duration.
> > +=C2=A0=C2=A0=C2=A0 enum: [0, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
> > +=C2=A0=C2=A0=C2=A0 default: 0
> > +
> > +=C2=A0 adi,reset-pulse-width-us:
> > +=C2=A0=C2=A0=C2=A0 description: Defines the pulse width of the reset s=
ignals.
> > +=C2=A0=C2=A0=C2=A0 enum: [500, 1000, 2000, 10000]
> > +=C2=A0=C2=A0=C2=A0 default: 500
> > +
> > +=C2=A0 '#address-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 1
> > +
> > +=C2=A0 '#size-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 0
> > +
> > +patternProperties:
> > +=C2=A0 "^gpio@":
>=20
> 'gpio' for node name is for gpio-controllers which this is not.

Well this part is also a gpio-controllers but given your comment below, I'l=
l
replace the child nodes for an array.
>=20
> > +=C2=A0=C2=A0=C2=A0 type: object
> > +=C2=A0=C2=A0=C2=A0 additionalProperties: false
> > +
> > +=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: The GPIO numbe=
r being configured.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maximum: 18
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adi,pull-up-ohms:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description: The pullup res=
istor to be used.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum: [100000, 300000]
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default: 300000
>=20
> Key mode doesn't have a pull-up?
>=20

Fair question... I'm taking the same approach as another similar part I
refactored a while ago. Which is, the pin bias is configured through the GP=
IO
subsystem when the pins are used as GPIOs. Seems to me the more sensible us=
ecase
but truth to be said, there's nothing on the datasheet enforcing that...

Anyways, moving this into the array will "drop" this restriction at least i=
n the
bindings.

- Nuno S=C3=A1
>=20

