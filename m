Return-Path: <linux-input+bounces-12306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C222AB4530
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 21:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0FA01B420C0
	for <lists+linux-input@lfdr.de>; Mon, 12 May 2025 19:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0D8255E53;
	Mon, 12 May 2025 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHZLs4Yu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0901CA84;
	Mon, 12 May 2025 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747079423; cv=none; b=GYuLPl0wzswJQg9InElDKGzEeLTtLcZxmmBY2YLiVTBYvaSimZbQffYN/T2aey/querks3yl/X1FvJR+sGeqcsivVbf6oSCJ4wwjPRrFvRwdl0KDK2XL+2Im9H5HpYHXX+xx6FKEn3eKVXw9t9x1Xxqt3Zzp8nE+0+t8awlMuLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747079423; c=relaxed/simple;
	bh=yQi4reQtnYQYLf5UFhxYGFIxYYxyY/Zpe3d6jmIEJyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFa5tO/lrkrYNxry5IvnihfaDlBJAP6H9uDXWVs9xl5gKDVy6dN9M+F9WtdMiVb7/hUnj7+IPrejHswz0evkW9eZHzOVp38K2fbtjVHH3okIl6XtsUMQyFV0LTw0IdXbtPfWU2Xf9WQKz7QyFBYFztCUJveUuPYor762RAU4dtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHZLs4Yu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87A1C4CEE7;
	Mon, 12 May 2025 19:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747079423;
	bh=yQi4reQtnYQYLf5UFhxYGFIxYYxyY/Zpe3d6jmIEJyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mHZLs4YuaJOSe+zdghR3qGbYnycC0C4TjNNE5E19H1DHJvubrA9JUp6g0euX6nWj1
	 15BrdBv7QCNBqbxRrIxFZU5ecUv6RPG3tX9mzd0+DUETJW7gxwTV3XK0sdIxmjtwCe
	 Jylp0xSv/rRDpioRA7yfXKXrISaFVu/0W0z/Vo0S9ro2sWyzvQKxWpXkleoT2h01fi
	 TQ8pkmF/0upftdTajVmBR/VQnlXi5ETy5qjVi1wvbnEklEaB/Jcy4uZuml/qKAUV6o
	 EeIp/68edQ/g/bsXOOrw63ePQwXKFFnO/v81q0gX5Prpp5aHnamcAc6E6Fm28uVrw7
	 7jXoeK2t1LTyg==
Date: Mon, 12 May 2025 14:50:20 -0500
From: Rob Herring <robh@kernel.org>
To: David Bauer <mail@david-bauer.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
Message-ID: <20250512195020.GA3882546-robh@kernel.org>
References: <20250505203847.86714-1-mail@david-bauer.net>
 <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
 <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>

On Tue, May 06, 2025 at 12:05:43PM +0200, David Bauer wrote:
> Hi Krzysztof,
> 
> thanks for the review.
> 
> On 5/6/25 08:21, Krzysztof Kozlowski wrote:
> > On 05/05/2025 22:38, David Bauer wrote:
> > > Add device-tree binding for the Semtech SX9512/SX9513 family of touch
> > > controllers with integrated LED driver.
> > > 
> > > Signed-off-by: David Bauer <mail@david-bauer.net>
> > 
> > You CC-ed an address, which suggests you do not work on mainline kernel
> > or you do not use get_maintainers.pl/b4/patman. Please rebase and always
> > work on mainline or start using mentioned tools, so correct addresses
> > will be used.
> I'm a bit unsure what you are referring to - maybe I've set the options
> for get_maintainer.pl wrong, but i use
> 
> get_maintainer.pl --nogit --nogit-fallback --norolestats --nol
> 
> to determine TO recipients and
> 
> get_maintainer.pl --nogit --nogit-fallback --norolestats --nom
> 
> for CC destinations.
> 
> Granted, my tree was a bit out of date but it was from mainline
> and after rebase both commands returned consistent results.
> 
> Hope you can provide me with some guidance there.

Probably that I don't use 'robh+dt' for a while now. Just 'robh'.

> > 
> > Please use scripts/get_maintainers.pl to get a list of necessary people
> > and lists to CC (and consider --no-git-fallback argument, so you will
> > not CC people just because they made one commit years ago). It might
> > happen, that command when run on an older kernel, gives you outdated
> > entries. Therefore please be sure you base your patches on recent Linux
> > kernel.
> > 
> > Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> > people, so fix your workflow. Tools might also fail if you work on some
> > ancient tree (don't, instead use mainline) or work on fork of kernel
> > (don't, instead use mainline). Just use b4 and everything should be
> > fine, although remember about `b4 prep --auto-to-cc` if you added new
> > patches to the patchset.
> > 
> > 
> > > ---
> > >   .../bindings/input/semtech,sx951x.yaml        | 180 ++++++++++++++++++
> > >   1 file changed, 180 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/input/semtech,sx951x.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/semtech,sx951x.yaml b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
> > > new file mode 100644
> > > index 000000000000..e4f938decd86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
> > > @@ -0,0 +1,180 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/semtech,sx951x.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Semtech SX9512/SX9513 based capacitive touch sensors
> > > +
> > > +description: |
> > 
> > Do not need '|' unless you need to preserve formatting.
> > 
> > > +  The Semtech SX9512/SX9513 Family of capacitive touch controllers
> > > +  with integrated LED drivers. The device communication is using I2C only.
> > > +
> > > +maintainers:
> > > +  - David Bauer <mail@david-bauer.net>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - semtech,sx9512
> > > +      - semtech,sx9513
> > 
> > Devices are not compatible? What are the differences?
> 
> The SX9513 is a cost-reduced version which does not
> support proximity sensing. With the current support
> of the driver they work identical. Should i add this
> information as a comment?

In the 'description' above, but not the driver support part.

> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#address-cells':
> > > +    const: 1
> > > +
> > > +  '#size-cells':
> > > +    const: 0
> > > +
> > > +  poll-interval:
> > > +    default: 100
> > > +    description: |
> > 
> > Do not need '|' unless you need to preserve formatting. Same comment
> > everywhere.
> > 
> > > +      The polling interval for touch events in milliseconds.
> > 
> > Missing -ms property unit suffix... unless you are using existing
> > property from common schema, but I do not see any reference (and thus
> > unevaluatedProperties at the end).
> > 
> > > +
> > > +patternProperties:
> > > +  "^channel@[0-7]$":
> > > +    $ref: input.yaml#
> > > +    type: object
> > > +    description: |
> > > +      Each node represents a channel of the touch controller.
> > > +      Each channel provides a capacitive touch sensor input and
> > > +      an LED driver output.
> > > +
> > > +    properties:
> > > +      reg:
> > > +        enum: [0, 1, 2, 3, 4, 5, 6, 7]

maximum: 7

> > > +
> > > +      linux,keycodes:
> > > +        maxItems: 1
> > > +        description: |
> > > +          Specifies an array of numeric keycode values to
> > > +          be used for the channels. If this property is
> > > +          omitted, the channel is not used as a key.
> > > +
> > > +      semtech,cin-delta:
> > 
> > Use proper unit suffix and express it in pF.
> 
> To represent 2.3 and 3.8 pF, would it be better to represent in
> femtofarad?

Yes.


> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 0
> > > +        maximum: 3
> > > +        default: 3
> > > +        description: |
> > > +          The capacitance delta which is used to detect a touch
> > > +          or release event. The property value is mapped to a
> > > +          farad range between 7pF and 2.3pF internally. The delta
> > > +          becomes smaller the higher the value is.
> > > +
> > > +      semtech,sense-threshold:
> > > +        $ref: /schemas/types.yaml#/definitions/uint32
> > > +        minimum: 0
> > > +        maximum: 255
> > > +        default: 4
> > > +        description: |
> > > +          The threshold value after which the channel detects a touch.
> > > +          Refer to the datasheet for the internal calculation of the
> > > +          resulting touch sensitivity.
> > > +
> > > +      led:
> > 
> > I think subnode is here not needed. This should be part of the channel,
> > probably.
> 
> Just to be sure - you mean to have a property "led" upon which instructs
> the channel to be used to drive an LED and include the LED specific
> properties in the node of the channel?

Actually, I think it is fine as-is if the LED driver works 
simultaneously with the touch input and isn't mutually exclusive. The 
'led' node is for the LED. The parent node is the driver/controller.

If they are mutually exclusive, then I'd say you want channel@[0-7] and 
led@[0-7] nodes at the same level.

Rob


