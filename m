Return-Path: <linux-input+bounces-10848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66657A62210
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 00:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAEFA4219C1
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 23:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05BA1F5615;
	Fri, 14 Mar 2025 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT5BI2Sq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA631F4E38;
	Fri, 14 Mar 2025 23:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995770; cv=none; b=ICco1QgmEK+2XFccDMuf5Q1gEl64rRbxz5zO0j+D70q3r97u8C/KiBVZX6rTmSQvxm8dPmVTL8MYgSGRgKlEZTgLbxITQHLjMooB05XsqMrFRimkL47+WlcqN1iFZij4A1e2wCdJ776y6G3FriUwMPtStaNsMUFPOjdgHsv6tpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995770; c=relaxed/simple;
	bh=i6FRKWOeqg/0KUT5wWrUWYaQ1sfxi4vzjuefq8uOkTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYmftjrQTIemKfgc8medKYjCfsQXoeCzU1ZE0GAAMHropY1rjpfNiiFW1Yx9x2US7LKJL6lU3yx/p91EXciD+Cw0OSBEg6Mo53IqTuspi6yOOZjEhG07zP/xuN7QK5tsDI+qvMy9r68sZtF1byacrRZe3bfOIUSVBtDKvq+TDCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT5BI2Sq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D70C4CEE3;
	Fri, 14 Mar 2025 23:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741995770;
	bh=i6FRKWOeqg/0KUT5wWrUWYaQ1sfxi4vzjuefq8uOkTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TT5BI2SquehMr/G6I+RSq8tCFeNWG5IzDAuCcNwBmZvrPr/CMB9c/Cu0B4da2dcq6
	 3HgbCHL09QRG4ttMl7rEOsrnG70LoXYH8iLEAHFAJ8SAZ1hvyYumKhG2QMqUmN+Zqd
	 ckaZdt6ilfAmYu4F2pu4aMX14+p+0FiLkxG4ct59QV5qn0j+nbACRBHQj1RYBKABsB
	 xtUbk5KOagUxkwoi+ftl3eh1fSaDIVsxgyIxvjpFftHoERBT8eTsRMaQLJ/ze+NrTS
	 UvNyUSm7gKpdOqxzHsJSH3au1LOw9TDad9FNqJwFAySmoMTVlf2zRMo76xGWgokBUY
	 t0dzSaL8YHanw==
Date: Fri, 14 Mar 2025 18:42:48 -0500
From: Rob Herring <robh@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
Message-ID: <20250314234248.GA2536020-robh@kernel.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
 <20250312104344.3084425-2-wenst@chromium.org>
 <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=X14XEdikE3hP4y53uZec12O_ZPtU+GyJ+Tf8R3DK89AA@mail.gmail.com>

On Fri, Mar 14, 2025 at 02:58:36PM -0700, Doug Anderson wrote:
> Hi,
> 
> 
> On Wed, Mar 12, 2025 at 3:43 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration. Enumeration and subsequent operation follows the I2C HID
> > standard. The eKTH6A12NAY requires longer times for both parts.
> 
> Somehow the last sentence above confused me. Can it just be dropped?
> All you care about is that the new trackpad matches the timings for
> "eKTH6A12NAY". Not sure what you mean by "eKTH6A12NAY" needing
> "longer" timings.
> 
> 
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > index cb3e1801b0d3..81c391952ccc 100644
> > --- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > +++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
> > @@ -4,14 +4,14 @@
> >  $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> >
> > -title: Elan eKTH6915 touchscreen controller
> > +title: Elan I2C-HID touchscreen controllers
> >
> >  maintainers:
> >    - Douglas Anderson <dianders@chromium.org>
> >
> >  description:
> > -  Supports the Elan eKTH6915 touchscreen controller.
> > -  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
> > +  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
> > +  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
> >
> >  allOf:
> >    - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> > @@ -23,12 +23,18 @@ properties:
> >            - enum:
> >                - elan,ekth5015m
> >            - const: elan,ekth6915
> > +      - items:
> > +          - enum:
> > +              - elan,ekth8d18
> > +          - const: elan,ekth6a12nay
> 
> The "enum" above is weird, but it matches what we did for
> "elan,ekth5015m" so I guess it's fine? I'd leave it up to bindings
> maintainers. I guess the assumption is that we might add additional
> touchscreens to the list...

Yes, but up to you all if that's a valid assumption.

> 
> 
> >    reg:
> > -    const: 0x10
> > +    enum:
> > +      - 0x10
> > +      - 0x16
> 
> Again happy to leave it to the bindings maintainers, but _maybe_ just
> drop the "reg" parts here and below. It doesn't really have to be part
> of the bindings.

I tend to agree. Sometimes we list I2C addresses as that is part of the 
device whereas elsewhere it is not. I don't know that it's worth the 
if/then schema in this case. 

Rob

