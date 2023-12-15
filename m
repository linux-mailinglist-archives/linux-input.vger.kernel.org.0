Return-Path: <linux-input+bounces-799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552A8146B0
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 12:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36D221C22510
	for <lists+linux-input@lfdr.de>; Fri, 15 Dec 2023 11:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69CA31A5B0;
	Fri, 15 Dec 2023 11:19:57 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47B24B23;
	Fri, 15 Dec 2023 11:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=artur-rojek.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artur-rojek.eu
Received: by mail.gandi.net (Postfix) with ESMTPA id 60F8D60005;
	Fri, 15 Dec 2023 11:19:51 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 15 Dec 2023 12:19:51 +0100
From: Artur Rojek <contact@artur-rojek.eu>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>, Paul
 Cercueil <paul@crapouillou.net>
Subject: Re: [RFC] dt-bindings: input: Clarify that abs_min must be less than
 abs_max
In-Reply-To: <20231215024022.122022-1-macroalpha82@gmail.com>
References: <20231215024022.122022-1-macroalpha82@gmail.com>
Message-ID: <03a9a56362b0559234d4a21a4de3e32e@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: contact@artur-rojek.eu

On 2023-12-15 03:40, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> uinput refuses to work with abs devices where the min value is greater
> than the max value. uinput_validate_absinfo() returns -EINVAL if this
> is the case and prevents using uinput on such a device. Since uinput
> has worked this way since at least kernel 2.6 (or prior) I presume that
> this is the correct way of doing things, and that this documentation
> needs to be clarified that min must always be less than max.
> 
> uinput is used in my use case to bind together adc-joystick devices
> with gpio-keys devices to create a single unified gamepad for
> userspace.
> 
> Note that there are several boards that will need to be corrected,
> all but a few of them I maintain. Submitting as an RFC for now to get
> comments from the input team and the original author in case there is
> something I am missing.
> 
> Fixes: 7956b0d4694f ("dt-bindings: input: Add docs for ADC driven 
> joystick")
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/input/adc-joystick.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> index 6c244d66f8ce..8f5cdd5ef190 100644
> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
> @@ -73,8 +73,9 @@ patternProperties:
>          description: >
>            Minimum and maximum values produced by the axis.
>            For an ABS_X axis this will be the left-most and right-most
> -          inclination of the joystick. If min > max, it is left to 
> userspace to
> -          treat the axis as inverted.
> +          inclination of the joystick. The axis must always be 
> expressed as
> +          min < max, if the axis is inverted it is left to userspace 
> to handle
> +          the inversion.

Hi Chris,

Device Tree is supposed to depict the actual state of the hardware.
I worded the adc-joytick's adc-range property specifically, so that it
covers a case of GCW Zero hardware [1], which has a joystick,  where the
ABS_X axis reports increasing values for the left-wards inclination of
the joystick, and decreasing values for the right-wards inclination. You
are saying that there are even more boards that need to be corrected -
those are all situations, where DT depicts the actual behavior of the
hardware.
What you are trying to do is change hardware description, because of how
a driver in an OS works. You should instead fix behavior of said driver,
even if nobody stumbled upon that issue since 2.6 :) We fixed libSDL [2]
for the same reason.

Cheers,
Artur

PS. cc'd Paul to the conversation.

[1] 
https://github.com/OpenDingux/linux/blob/jz-6.1/arch/mips/boot/dts/ingenic/gcw0.dts#L273C12-L273C12
[2] https://github.com/libsdl-org/SDL-1.2/commit/46806790ad043

>            This property is interpreted as two signed 32 bit values.
> 
>        abs-fuzz:


