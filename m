Return-Path: <linux-input+bounces-12070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B772AA0E77
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 16:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E92621B678B0
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 14:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C3542D3A91;
	Tue, 29 Apr 2025 14:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="C8sz6Hri"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0002D3A7C
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 14:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935921; cv=none; b=DEwT1Ty7eBlumvJZfVT7JmJ0+Vmh97KQ2LbshhVwpgViTe+QR9QWVJ0iKFWVqDvyy07Hh4dYLc4MGvhbFt7tNbBMVEq+6al69tPHsy+4NsP+SRzk4SmV2i3GtDHya4drC21fWzmnjQjdwyUa/SWgOQMwIVQmK5yrxjlNkwxZpdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935921; c=relaxed/simple;
	bh=EedXxP4H/gP9dZwClr0nJhcaeU3loAc85FlGQSOdHXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tvi55hYjJEhdwrmdgCiO3jKEIHjRXyO5mHsxhJEBIQS+qSct3uu60XCcH7VDP4m3pSy1mKE7PMazpUDRPuBMHrwzulkHO/W2T11s6e0bUpiQ3PZygXFj6yT6SVuSdus96qa4H6/9nMF4/iJ9d75fOxj+gJ/tUKqk2RYQa/HbrAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=C8sz6Hri; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745935911; x=1746195111;
	bh=EedXxP4H/gP9dZwClr0nJhcaeU3loAc85FlGQSOdHXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=C8sz6Hri6mhi7xT+Mx/PB/QQLCwvYIlcemsD0Dpvu366TnBRw6uQ8jtJBvMv0J9ZI
	 LDcxJldaQyPWeEhWwDOFqZe20NYDkgUAbj2o3xSiLf1IgQ6rHbwt/NoNN+S9Wqy3S5
	 t9wtOQWsHQkW4QV/sdyCdaIBrqMCWdfvix3mZNzYxYkf5qiwdnnJ3PGR911jgqXaSu
	 T+ElYKfDScUICac9Xp5vS8fXp4qmCQ8xIx5bd1FrGRaHwnCjDTTrDjBDZgAOTgodfC
	 7EaEMLHsrEgHstlpM2kUu3PlCHJOuUgwXUREyQ/UfXVfFp6m6QhZoIHF2JMUeaazNV
	 psbjOxvbkQNqw==
X-Pm-Submission-Id: 4Zn2LY4yQxz4wx0L
From: Esben Haabendal <esben@geanix.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,  "Rob Herring"
 <robh@kernel.org>,  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor
 Dooley" <conor+dt@kernel.org>,  "Hans de Goede" <hdegoede@redhat.com>,
  <linux-input@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
In-Reply-To: <23onpttl3w2wo3625c7flbljahojipsb4xznrx6xynr7rrzofr@2bcvjji7dpu6>
	(Dmitry Torokhov's message of "Mon, 28 Apr 2025 12:30:47 -0700")
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
	<20250422-goodix-no-reset-pull-up-v1-1-3983bb65a1bf@geanix.com>
	<20250428-logical-successful-spoonbill-cd1c6b@kuoka>
	<zkDFUv9azjyXaS--ufxgROyruM2mpckWkDNeHtAO160rM2DuaJthpjgN0c_L8QgTk8bNA7Km0UewYmp1rWENwg2x4ngP-8C1rYhHMgAz0OA=@geanix.com>
	<gIFipXKkfBDfbZfwOS6mcggLQSkovy0HQrNkBpcZQNS4wc5y3ET_IR85NKxw5FB6_PDFgQaFgB0z3CRVvvNTSQ==@protonmail.internalid>
	<23onpttl3w2wo3625c7flbljahojipsb4xznrx6xynr7rrzofr@2bcvjji7dpu6>
Date: Tue, 29 Apr 2025 16:11:48 +0200
Message-ID: <87wmb3t5uj.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Dmitry Torokhov" <dmitry.torokhov@gmail.com> writes:

> On Mon, Apr 28, 2025 at 07:58:55AM +0000, Esben Haabendal wrote:
>> On Monday, April 28th, 2025 at 09:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> > On Tue, Apr 22, 2025 at 05:15:02PM GMT, Esben Haabendal wrote:
>> >
>> > > This should be added for boards where there is no pull-up on the reset pin,
>> > > as the driver will otherwise switch the reset signal to high-impedance to
>> > > save power, which obviously not safe without pull-up.
>> > >
>> > > Signed-off-by: Esben Haabendal esben@geanix.com
>> > > ---
>> > > Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>> > > 1 file changed, 4 insertions(+)
>> > >
>> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> > > index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..7e5c4b98f2cb1ef61798252ea5c573068a46d4aa 100644
>> > > --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> > > @@ -45,6 +45,10 @@ properties:
>> > > reset-gpios:
>> > > maxItems: 1
>> > >
>> > > + no-reset-pull-up:
>> >
>> > Is this common property? Where is it defined? Otherwise missing vendor
>> > prefix.
>>
>> Good question. When is something a common property?
>>
>> The idea of marking something as not having a pull-up on the reset pin could be considered a common thing I guess.
>> But for now, I am defining it for the goodix driver only, as I am only aware of these devices needing to handle it in a special way.
>>
>> Should I rename it to goodix,no-reset-pull-up?
>
> We already have GPIO_PULL_UP/GPIO_PULL_DOWN flags available in GPIO
> bindings. So maybe the correct way is to have the driver rely on them
> and only leave the reset line in high-impedance mode if GPIO tells it
> that there is a pull-up?

As I understand GPIO_PULL_UP/GPIO_PULL_DOWN flags in bindings, they
indicate that pull-up/pull-down is to be configured for the gpio.

This is different to what I am expressing with goodix,no-reset-pull-up,
as I am expressing the lack of external pull-up on the signal. Without
that, the goodix driver assumes that an external pull-up is mounted, and
that the gpio pin can be set to high impedance, and the external pull-up
will ensure that it stays high.

How do you propose that we can use GPIO_PULL_UP/GPIO_PULL_DOWN flags for
this purpose?

/Esben

