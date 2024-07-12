Return-Path: <linux-input+bounces-5005-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 243CA92F84B
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 11:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30391F24687
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 09:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0302B1422C3;
	Fri, 12 Jul 2024 09:47:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out198-13.us.a.mail.aliyun.com (out198-13.us.a.mail.aliyun.com [47.90.198.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBF148300;
	Fri, 12 Jul 2024 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720777652; cv=none; b=VRF1nFaXo3VTS0psmH+PxaCiUECnisKB6AL2JsM0bCmn0i+lO6i5YJImEtr1HGWgoHhmDBd9ITGimU46zCY8rK675V9IcuyTs0uoz8IxurgdZ/EB7yKYcMGoYlS86gOVsurplyomoGs4Y9vAi1/W6RCnUw1djouyt9PKmqz87Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720777652; c=relaxed/simple;
	bh=mbPMrEjdN9LcCh7mNH7mMXaAwzDeqWfigO0ycI5zsV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M5t5acdalaLDAmNnaMFuz9rhzA/MioEs2XGNGhGp7AVwYzVQT/W6G2H8B/oXbxEOXfFHnMCUKdV0O5qMJwWUKc8RFCEh8DJAtoKU+qmC+SGAfMwVyPVEaP2VQUBhWInrre/ntbu88UaFuBI54zV1p0AuwQDNglcyq0bD+iUMna8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.246811-0.00114254-0.752047;FP=8030687512528426034|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068159080;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.YOOztHC_1720777621;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.YOOztHC_1720777621)
          by smtp.aliyun-inc.com;
          Fri, 12 Jul 2024 17:47:08 +0800
From: wangshuaijie@awinic.com
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	robh@kernel.org,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V2 1/5] dt-bindings: input: Add YAML to Awinic sar sensor
Date: Fri, 12 Jul 2024 09:47:01 +0000
Message-ID: <20240712094701.2393968-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <1c61d5b5-d9c0-4fa3-8267-8aaf6c441b75@kernel.org>
References: <1c61d5b5-d9c0-4fa3-8267-8aaf6c441b75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,=0D
=0D
Thank you very much for your valuable suggestions. I will fix the related i=
ssues in V3.=0D
=0D
On Wed, 5 Jun 2024 12:20:31, krzk@kernel.org wrote:=0D
>On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:=0D
>> From: shuaijie wang <wangshuaijie@awinic.com>=0D
>> =0D
>> Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver=
.=0D
>=0D
>Subject: drop final stops. From all your patches.=0D
>=0D
=0D
The patch for V3 will fix this issue.=0D
=0D
>> =0D
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>=0D
>> ---=0D
>=0D
>No changelog, so nothing improved?=0D
>=0D
=0D
The patch for V3 will fix this issue.=0D
I will include a changelog in the next version.=0D
=0D
>>  .../bindings/input/awinic,aw_sar.yaml         | 125 ++++++++++++++++++=
=0D
>=0D
>No underscores, but rather awinic,aw96103.yaml=0D
=0D
I will change the name to awinic,aw96xxx.yaml in the next version.=0D
=0D
>=0D
>>  1 file changed, 125 insertions(+)=0D
>>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sa=
r.yaml=0D
>> =0D
>> diff --git a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml =
b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml=0D
>> new file mode 100644=0D
>> index 000000000000..2560ef09d3d0=0D
>> --- /dev/null=0D
>> +++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml=0D
>> @@ -0,0 +1,125 @@=0D
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)=0D
>> +%YAML 1.2=0D
>> +---=0D
>> +$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#=0D
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0D
>> +=0D
>> +title: Awinic sar sensor driver family=0D
>=0D
>driver as Linux driver or some other hardware meaning? If first, then=0D
>drop and describe hardware.=0D
>=0D
>=0D
=0D
The patch for V3 will fix this issue.=0D
(title: Awinic's AW96XXX capacitive proximity sensor)=0D
=0D
>> +=0D
>> +maintainers:=0D
>> +  - Shuaijie Wang <wangshuaijie@awinic.com>=0D
>=0D
>Missing description. You already got question about meaning of sar and=0D
>indeed nothing improved.=0D
>=0D
=0D
The patch for V3 will fix this issue.=0D
=0D
>> +=0D
>> +properties:=0D
>> +  compatible:=0D
>> +    enum:=0D
>> +      - awinic,aw96103=0D
>> +      - awinic,aw96105=0D
>> +      - awinic,aw96303=0D
>> +      - awinic,aw96305=0D
>> +      - awinic,aw96308=0D
>> +=0D
>> +  reg:=0D
>> +    maxItems: 1=0D
>> +=0D
>> +  irq-gpio:=0D
>> +    maxItems: 1=0D
>> +=0D
>> +  awinic,sar-label:=0D
>=0D
>label is a string, not number.=0D
>=0D
>> +    $ref: /schemas/types.yaml#/definitions/uint32=0D
>> +    description:=0D
>> +      Set the label of the SAR(Specific Absorption Rate) sensor.=0D
>> +      It is set to 0 if one awinic sar chip is used.=0D
>> +      If two awinic sar chips are used, awinic,sar-label in the first=0D
>> +      awinic-sar should be set to 0 and awinic,sar-label in the second=
=0D
>> +      awinic-sar should be set to 1.=0D
>=0D
>Sorry, no instance indexing. Drop.=0D
>=0D
=0D
I will modify the relevant descriptions in the V3.=0D
=0D
>> +=0D
>> +=0D
>=0D
>No need for two line breaks.=0D
>=0D
>> +  awinic,regulator-power-supply:=0D
>> +    description:=0D
>> +      Choose if you want to use a regulator to power the chip. Then the=
=0D
>> +      vccX-supply has to be set.=0D
>> +=0D
>> +  vcc0-supply:=0D
>> +    description:=0D
>> +      Optional regulator for chip, 1.7V-3.6V.=0D
>> +      If two awinic sar chips are used, the first regulator=0D
>> +      should set the ID to vcc0-supply and the second regulator=0D
>> +      should set the ID to vcc1-supply.=0D
>> +=0D
>> +  awinic,channel-use-mask:=0D
>> +    $ref: /schemas/types.yaml#/definitions/uint32=0D
>> +    description:=0D
>> +      The mask of channels used.=0D
>> +      Configure according to the specific chip channel used.=0D
>> +      Bit[31:0] Each bit represents a channel.=0D
>> +      If the customer uses ch0 and ch2, then channel_use_mask=3D<0x05>=
=0D
>> +      For a 3-channel chip, the maximum value is 0x07;=0D
>> +      For a 5-channel chip, the maximum value is 0x1F;=0D
>> +      For a 8-channel chip, the maximum value is 0xFF;=0D
>> +=0D
>> +  awinic,update-fw:=0D
>> +    type: boolean=0D
>> +    description:=0D
>> +      Choose if you want to update the firmware.=0D
>=0D
>Not much improve in explanation or rationale. Why do you want to update=0D
>FW every time? Explain this in property description.=0D
>=0D
=0D
In the next version, I will remove the relevant feature.=0D
=0D
>I mostly skipped the rest, because it does not look like you addresses=0D
>previous feedback.=0D
>=0D
>...=0D
>> +=0D
>> +required:=0D
>> +  - compatible=0D
>> +  - reg=0D
>> +  - irq-gpio=0D
>> +  - awinic,sar-label=0D
>> +  - awinic,channel-use-mask=0D
>> +=0D
>> +unevaluatedProperties: false=0D
>=0D
>Missing some ref, like dai-common or component... or this is supposed to=0D
>be additionalProperties: false instead.=0D
>=0D
=0D
In the next version, I will change it to additionalProperties: false.=0D
=0D
>> +=0D
>> +examples:=0D
>> +  - |=0D
>> +    #include <dt-bindings/gpio/gpio.h>=0D
>> +    #include <dt-bindings/interrupt-controller/irq.h>=0D
>> +    i2c {=0D
>> +        #address-cells =3D <1>;=0D
>> +        #size-cells =3D <0>;=0D
>> +        awinic-sar@12 {=0D
>=0D
>Node names should be generic. See also an explanation and list of=0D
>examples (not exhaustive) in DT specification:=0D
>https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicet=
ree-basics.html#generic-names-recommendation=0D
>=0D
=0D
In the next version, I will change it to proximity.=0D
=0D
>=0D
>I still have no clue what is sar and there is no description in this=0D
>binding.=0D
>=0D
=0D
I will add relevant descriptions in the next version.=0D
=0D
The specific absorption rate (SAR) is a metric that measures=0D
the degree of absorption of electromagnetic radiation emitted by wireless=0D
devices, such as mobile phones and tablets, by human tissue.=0D
=0D
In mobile phone applications, the proximity sensor is primarily used to det=
ect=0D
the proximity of the human body to the phone. When the phone approaches the=
 human body,=0D
it will actively reduce the transmit power of the antenna to keep the SAR w=
ithin a safe=0D
range. Therefore, we also refer to the proximity sensor as a SAR sensor.=0D
=0D
>> +            compatible =3D "awinic,aw96308";=0D
>> +            reg =3D <0x12>;=0D
>> +            irq-gpio =3D <&tlmm 72 0>;=0D
>=0D
>Use proper defines.=0D
>=0D
=0D
In the next version, I will change it to interrupts.=0D
=0D
>> +            awinic,sar-label =3D < 0 >;=0D
>=0D
>Do not introduce different coding style. Drop spaces. See DTS coding style=
.=0D
>=0D
=0D
The patch for V3 will fix this issue.=0D
=0D
>=0D
>=0D
>Best regards,=0D
>Krzysztof=0D
=0D
Kind regards,=0D
Wang Shuaijie=0D

