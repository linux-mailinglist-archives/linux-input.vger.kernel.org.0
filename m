Return-Path: <linux-input+bounces-7578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0BE9A6073
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 11:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C311CB25AF9
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 09:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00CB51E32D4;
	Mon, 21 Oct 2024 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOgJh/ia"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2F21E283D;
	Mon, 21 Oct 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503822; cv=none; b=ICnTxc0YUdkNb7u+W5E57YwnNDf2xEtr91vex0WPROsYCV78HLCmWWe8Z2KxEWorIpqjQe2U6R3nKp/w7LASxQUBbIG09Et/1f+TpwLuaCk0O3v8xgpUDrvCR1cCSl1wOla4dAXOnq55qxuhBUK2eBIKIuVL0yJy1yyfO6Cjy40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503822; c=relaxed/simple;
	bh=DocfnqodpECHeTU7WzOZ8o9ZwceqaD+JMKAhWcybg7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZlkIsu3oBg9qvOfRswXbGSJqGSCrwFOUwqcUdsnoaowz7DWzkhT3pEO5+BbCBN7xskuqkCl63L0eLfj1Nt8AqJ8fFsaAvckhK+/7+nFQ328Pp5A//WNIVFqqk7F36AOKLFU63tZjeK/uBvLVxgTbCtSS7cpTRC2AGPVW1OW0orU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOgJh/ia; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F232C4CEC3;
	Mon, 21 Oct 2024 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729503822;
	bh=DocfnqodpECHeTU7WzOZ8o9ZwceqaD+JMKAhWcybg7g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DOgJh/iab918XNUp6ZzTERCymq7jkBNkGI9G3LUununJvoVxX2FpPcoAdE1hzxayZ
	 KvkWsugqp/KiXlQ+rRMMBN9OZp5VA6PeMBO43HKGbYIofzBamdVvatNlw9iiMj0Tfj
	 ELugB8yXQPcb793QSgDKWG/HONCCQwTnBfJ9lDzioAjfRyrNORrdIl0eYF4sHUlHzc
	 OngBmmVyfZuiwRs44Vfxntua/FIV9JBhk0t9hlRbfEdmtrWfTiG7TxCJ3vBTuZaiUN
	 uJZoLwu04bBl/x7lNpevGhHAN/1FvT55OJ9jID6mluTHHp0yKHBKJKwG2IdUF5/Yxr
	 BxOcj5NpE19Cw==
Message-ID: <fbde8a3a-3adc-4c1a-8529-fde0fa149c8e@kernel.org>
Date: Mon, 21 Oct 2024 11:43:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>,
 Doug Anderson <dianders@chromium.org>
Cc: dmitry.torokhov@gmail.com, hbarnor@chromium.org,
 conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <CAD=FV=UFrk4QCxWzV9zUZnjhwiFf22Fji5KH83svdwba2mPVBA@mail.gmail.com>
 <ZxMfu4yxk961mZWB@ux-UP-WHL01>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <ZxMfu4yxk961mZWB@ux-UP-WHL01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/10/2024 04:55, Charles Wang wrote:
> Hi Doug
> 
> On Fri, Oct 18, 2024 at 01:48:56PM -0700, Doug Anderson wrote:
>>
>> On Thu, Oct 17, 2024 at 7:09 PM Charles Wang <charles.goodix@gmail.com> wrote:
>>>
>>> The Goodix GT7986U touch controller report touch data according to the
>>> HID protocol through the SPI bus. However, it is incompatible with
>>> Microsoft's HID-over-SPI protocol.
>>>
>>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
>>> ---
>>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
>>>  1 file changed, 58 insertions(+), 10 deletions(-)
>>
>> I'm happy to let device tree folks make the call here, but IMO it
>> would be much cleaner to just consider the I2C-connected GT7986U and
>> the SPI-connected GT7986U to be different things and just use a

Same device, you cannot have different compatibles. The way how the same
(literally same chip) device sits on the bus is not part of the binding,
thus no different compatibles.

>> different compatible string for them. So essentially go back to your
>> v7 patch from before [1] but change the compatible to
>> "goodix,gt7986u-spi". If, for instance, this device also had a USB
>> interface then I don't think we'd try to cram it into the same
>> bindings even though the same physical chip was present...
>>
> 
> Honestly, I agree with this approach, but Krzysztof seems to prefer
> extending the existing binding.

I prefer not to have warnings and that was the problem with original
patchset. I am fine with splitting different models between different
binding schemas/files, but not the same device in two files.

Best regards,
Krzysztof


