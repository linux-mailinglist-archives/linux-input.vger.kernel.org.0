Return-Path: <linux-input+bounces-8274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FB9DA5DC
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 11:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757772819A0
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBD1197548;
	Wed, 27 Nov 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="drzVBvfo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5E9193067;
	Wed, 27 Nov 2024 10:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732703643; cv=none; b=DdpXim3b7GEwdXp+oPks8OKm2odoh94O1zr3HlM4RmxG+FrTU/CynyVpmnZT+VwSSaNon1IKBdrAaiawpSYbv5jHERkWRDGwPO3Xw17t48rIqrueCMx+UkoX9FnknDMZPyvk9x4HeQvT+u0aXbahzG4jwSpPJUhT4yI3Z4Z7kKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732703643; c=relaxed/simple;
	bh=eve/B6gdZ8G8s9gW8iCruNKL7f1O9Im7UFs73nBSbA8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KybzyIPhT9yL1XR/egyajczGVMOGU35Iq2OGIOtZ+5nEHCp3ybTVv/ESFkA3+h3uFFmIU5TZs6pOqUF/avUwqBp0cP+e6OLJLNyQKMcqDOiacjgxLjpEXoG5cg/faUh9dJafHY2l9GTRSNiLDDs+RLNP66kf/kxR1E2DtQ1xJZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=drzVBvfo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF44C4CED3;
	Wed, 27 Nov 2024 10:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732703643;
	bh=eve/B6gdZ8G8s9gW8iCruNKL7f1O9Im7UFs73nBSbA8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=drzVBvfoNphI57mGd59ZOoGzsgByokgUOO1CFkMyIaSaIcx/upUT0UEPXHM/OZePE
	 dLZbOS856iSMCbXw8W9Ji/5NMDpB97WARUU+gcKMhT3Unay/TQGUEm1SeVS/LDUZht
	 39gaaea71BYOXxfET8mqeFvK9duMt7qRDXCqd1ibf+TgPe6/4SO2i/33El2HycBKLz
	 sf6SIyf7UJwWJghCZmC/7yUvzP2P3dN8+ia6VaZ5dsuPkJyt3tcv3i7wtiUDLb6rpH
	 fBt+/0d6UuLD+7pfSC+FHCnXqQvzFe2X9uFyGfK2VCdYkB2JNYQ2rmOHCs5TcCVCSk
	 Nf3Tr/6OL+4qQ==
Message-ID: <a0c89130-2b1c-494d-bd39-0f217e9979d5@kernel.org>
Date: Wed, 27 Nov 2024 11:33:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2024 09:46, Krzysztof Kozlowski wrote:
> On Tue, Nov 26, 2024 at 09:47:59PM +0100, Sasha Finkelstein wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - apple,j293-touchbar
>> +          - apple,j493-touchbar
>> +      - const: apple,z2-touchbar
>> +      - const: apple,z2-multitouch
> 
> What is the meaning of these two last compatibles in the list? What are
> these devices?


Previous Rob's comment apply here as well. If z2 is protocol, then
multitouch and touchbar do not feel appropriate, unless these are some
subsets of the protocol. But as in other cases no one knows here what's
there inside, so avoid making generic compatibles. Just
apple,j293-touchbar and 493+293. That's the recommendation we keep
insisting on almost always.

As Rob explained: protocol does not matter in terms of compatible. We do
not have devices like "analog,j293-spi" (and there is clear NAK when
people post them, with one or two exceptions).

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +
>> +  cs-gpios:
>> +    maxItems: 1
>> +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
>> +      J293 has a hardware quirk where the CS line is unusable and has
>> +      to the be driven by a GPIO pin instead
>> +
>> +  firmware-name:
>> +    maxItems: 1
>> +
>> +  label:
>> +    maxItems: 1
> 
> Why is this needed? I think it is not part of common touchscreen schema.
> Drop, devices do not need labels - node name and unit address identify
> it. If this is needed for something else, then come with generic
> property matching all touchscreens.

This is v1 so I did not expect previous talks, but now I dig them out
and there was conclusion: your compatible defines label. You do not have
two of same devices in the DTS to justify it. Drop the property.

Best regards,
Krzysztof

