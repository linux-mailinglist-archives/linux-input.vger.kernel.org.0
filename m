Return-Path: <linux-input+bounces-12078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C7AA1B15
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 21:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 720589A7EC4
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 19:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FBAA250C08;
	Tue, 29 Apr 2025 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="BLiUhj87"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753742550AF
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 19:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953342; cv=none; b=eXGNC+venuGLRNCsK++/x5uFu/uzOFnFayTPDVyIeZsxfDqQi2Zqm51r6XdpMjj2g58WmuMrvI/UglDBCr5lKL/w9dqDFzMGDvuO8zvEItxeqLXItsIQHdUimFffa007ytss7FJaaoKaZXlBER8h1B7LGAlc7yDO1kOUhvO/S48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953342; c=relaxed/simple;
	bh=ZogMkcg1Vv62KgOALOq9xcS0XYjBf/i30u5wYAowTXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G+xmHzJeEUDAjkyRajTpCPzqKs6BnCpJlUtH00gv/+szAckMIF25b2VMbd82PhMQtcU2j8X3rqs/DWHyY5aN2lVx2WJLBR1SSabi4pMJawg/B913Krx5vInsi4t6M/asRiZPtfiFDeEY71ucBYjs/3zvTHBgf9xcAnU9xn0JvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=BLiUhj87; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1745953336; x=1746212536;
	bh=1YjWb/Jn/3bYxh7+rmCEcUaERkMf0JFBVzH01YCTxkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=BLiUhj87ccPj20knCWXb1RKgwwnGzYmFui9nq/odyJDIvWLFa7i2E3cvecS6quwTX
	 /0t9MriOZ+Pw0KMfv1elpYqK0cV+gM2Rk9yxn1xP4U5c0+Fsw73cvqkPj2FcIQ2VOb
	 pjEdLd3hkVT6Q7sCHsr43HWqx1TGSCauHP/jp8djuXn/vmtg3yrred3iRX37PNVxvZ
	 t5fAjR6HN2I2ruIZ+IAhRAWTrsxKzS7DHTtTdySvQeDuq0H1yQ8dnSC9tdFdeE9NK4
	 T4AlB6QroC03tqoD4G9KV1oJXNRza+FvnHtk2jmO+KXB6wG3plaEvsBR+sUDIRizzv
	 e0FjHv3ApfiCA==
X-Pm-Submission-Id: 4Zn8nf5gPRzLT
From: Esben Haabendal <esben@geanix.com>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Conor Dooley" <conor@kernel.org>,  "Rob Herring" <robh@kernel.org>,
  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  "Hans de Goede" <hdegoede@redhat.com>,
  <linux-input@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: goodix: Add
 no-reset-pull-up property
In-Reply-To: <2qwfe6yw3pil5tumibiagikqhgwct27vevi674fklfieabzozc@hzjwatn3vjss>
	(Dmitry Torokhov's message of "Tue, 29 Apr 2025 09:09:58 -0700")
References: <20250429-goodix-no-reset-pull-up-v2-0-0687a4ad5a04@geanix.com>
	<20250429-goodix-no-reset-pull-up-v2-1-0687a4ad5a04@geanix.com>
	<qql72NifdMmJKSRJmT2927URaXnbRAbz9Yjzn9lBrOwjka7NxVvy5YKJUSLmBp435aYJiTkPqeuW1hMDcKKC4g==@protonmail.internalid>
	<20250429-effects-subscript-58eb41737816@spud>
	<87selrt1vl.fsf@geanix.com>
	<Pvo1P0DaSIUd2X7OfO-NXvz2UcLtNfnyMTRBLEBRS3Zokk9Ww0TB4_ce3jobYuWRsvIbUd_E3OF2kzPx0xZbGw==@protonmail.internalid>
	<2qwfe6yw3pil5tumibiagikqhgwct27vevi674fklfieabzozc@hzjwatn3vjss>
Date: Tue, 29 Apr 2025 21:02:14 +0200
Message-ID: <87o6weu6yx.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Dmitry Torokhov" <dmitry.torokhov@gmail.com> writes:

> On Tue, Apr 29, 2025 at 05:37:34PM +0200, Esben Haabendal wrote:
>> "Conor Dooley" <conor@kernel.org> writes:
>>
>> > On Tue, Apr 29, 2025 at 11:56:11AM +0200, Esben Haabendal wrote:
>> >> This should be added for boards where there is no pull-up on the reset pin,
>> >> as the driver will otherwise switch the reset signal to high-impedance to
>> >> save power, which obviously not safe without pull-up.
>> >>
>> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
>> >> ---
>> >>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 4 ++++
>> >>  1 file changed, 4 insertions(+)
>> >>
>> >> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> >> index eb4992f708b70fef93bd4b59b9565123f7c6ad5d..21ac13046b6e021eeb403d854aabc945801dd29f 100644
>> >> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> >> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> >> @@ -45,6 +45,10 @@ properties:
>> >>    reset-gpios:
>> >>      maxItems: 1
>> >>
>> >> +  goodix,no-reset-pull-up:
>> >> +    type: boolean
>> >> +    description: There is no pull-up on reset pin
>> >
>> > I have to wonder, why are these system using the reset property if the
>> > reset is not usable? Shouldn't the property be omitted?
>>
>> The reset are fully functional. It just have to be controlled in
>> push-pull mode.
>>
>> Because of the lack of external pull-up, configuring the reset gpio as
>> input (to save power) puts the reset pin in an unknown state.
>
> How much power do we save by doing this? I don't recall other drivers
> trying to switch reset GPIO into input mode after performing reset...

I don't know.  I also don't recall seeing this in other drivers.  But as
not knowing how much power it is, I did not feel comofortable proposing
to remove it.

/Esben

