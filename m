Return-Path: <linux-input+bounces-4098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4B8FC725
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 11:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D03F91C21AA2
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 09:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A875184FDA;
	Wed,  5 Jun 2024 09:02:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from out198-2.us.a.mail.aliyun.com (out198-2.us.a.mail.aliyun.com [47.90.198.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E8D1946AC;
	Wed,  5 Jun 2024 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717578156; cv=none; b=EyMUMHyDZ9YVtN+00i0HjDdQ2O1KtkSyWVNEeSIIFBID5pdZ5J9c6TXgWdmt9Jr39lXujCy3TCxkPJr5robDOMu1deMRCfTEIimHS9q6F5221AfcQT+iZ/YcnC/W8BmfyWuEJ4R1ihxUWP+GdQfKi7MwJ4YZ25Qx3Tjism1otdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717578156; c=relaxed/simple;
	bh=0S2W+9p08kP76IrQ50FsiyB2AXjRLgRQGc+PvbA1Yd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DibP+Tjy4WI9dLIxd1dGbSG04XVt2cn58V9/PoUT8KqZVC0Szrzh4cj0LQyexfRmJRGSOF5RQIJDgBw4JnjUCH8suGuY99TqDBDgLr/UVkD3vaj/7JnXeGR8Ma312AR8v21r8zn3ndbzkeK2h7utyPqn/vc3Hub0N+RujtlJoOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436261|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.271975-0.00154261-0.726483;FP=0|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033070021158;MF=wangshuaijie@awinic.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Xwd4rMH_1717578126;
Received: from awinic..(mailfrom:wangshuaijie@awinic.com fp:SMTPD_---.Xwd4rMH_1717578126)
          by smtp.aliyun-inc.com;
          Wed, 05 Jun 2024 17:02:17 +0800
From: wangshuaijie@awinic.com
To: robh@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.torokhov@gmail.com,
	jeff@labundy.com,
	kangjiajun@awinic.com,
	krzk+dt@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liweilei@awinic.com,
	wangshuaijie@awinic.com
Subject: Re: [PATCH V1 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
Date: Wed,  5 Jun 2024 09:02:06 +0000
Message-ID: <20240605090206.156859-1-wangshuaijie@awinic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240531013607.GA3665090-robh@kernel.org>
References: <20240531013607.GA3665090-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 30 May 2024 20:36:07 -0500, robh@kernel.org wrote:
>On Wed, May 29, 2024 at 01:06:04PM +0000, wangshuaijie@awinic.com wrote:
>> From: shuaijie wang <wangshuaijie@awinic.com>
>> 
>> Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.
>> 
>> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
>> ---
>>  .../bindings/input/awinic,aw_sar.yaml         | 110 ++++++++++++++++++
>>  1 file changed, 110 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml 
>> b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
>> new file mode 100644
>> index 000000000000..ed4ec29c9b4d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
>> @@ -0,0 +1,110 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Awinic sar sensor driver family
>> +
>> +maintainers:
>> +  - Shuaijie Wang <wangshuaijie@awinic.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - awinic,aw_aw96103
>> +      - awinic,aw_aw96105
>> +      - awinic,aw_aw96303
>> +      - awinic,aw_aw96305
>> +      - awinic,aw_aw96308
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  sar-num:
>
>Custom properties need vendor prefix.

The patch for version v2 will fix this issue.

>
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      set the index of the sar sensor.
>
>What is 'sar'? It's never defined.

SAR(Specific Absorption Rate), The patch for version v2 will include this explanation.

>
>How is the index determined? We generally don't do indexes in DT unless there is some correlation to the h/w.

Perhaps using "label" is more appropriate, as it represents the order of the SAR sensor.
The patch for version v2 will fix this issue.

>
>> +
>> +  vcc0-supply:
>> +    description:
>> +      Optional regulator for chip, 1.7V-3.6V.
>> +
>> +  channel_use_flag:
>
>vendor prefix needed plus use '-' rather than '_'. Here and elsewhere.

The patch for version v2 will fix this issue.

>
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      The flag of channels used.
>> +      Configure according to the specific chip channel used.
>> +      Bit[31:0] Each bit represents a channel.
>
>So a mask rather than a flag.

The patch for version v2 will fix this issue.

>
>Up to 32 channels possible? If not, add constraints.
>
>> +      If the customer uses ch0 and ch2, then channel_use_flag=<0x05>
>> +
>> +  aw_sar,update_fw:
>> +    type: boolean
>> +    description:
>> +      Choose if you want to update the firmware.
>
>DT is mostly fixed. So someone would want to update the firmware every time?

In certain situations, if the program in the chip's ROM does not meet the needs,
it is necessary to reload new firmware into the SRAM after each power-on,
and then use the new firmware.

>
>> +
>> +  aw_sar,monitor_esd:
>> +    type: boolean
>> +    description:
>> +      Choose if you want to monitor ESD.
>> +
>> +  aw_sar,pin_set_inter_pull-up:
>> +    type: boolean
>> +    description:
>> +      Choose if you want to set the interrupt pin to internal pull-up.
>> +
>> +  aw_sar,using_pm_ops:
>> +    type: boolean
>> +    description:
>> +      Choose if you want to use suspend and resume related function.
>
>OS configuration. Doesn't belong in DT.

Perhaps this name is not quite appropriate. It mainly determines whether to
put the chip into sleep mode in the PM, and there are other operations in
the PM that are not controlled by this option.

>
>> +
>> +  aw_sar,use_plug_cail:
>> +    type: boolean
>> +    description:
>> +      Choose If you want to perform calibration when plugging and unplugging the charger.
>> +
>> +  start-mode:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      When connecting to aw963xx, select the location where the firmware starts.
>> +      set 0 if start in rom.
>> +      set 1 if start in ram
>
>Looks like constraints.

Only the AW963XX series chips need to configure this option.
I will redescribe it in the V2 version of the patch.

>
>> +
>> +  irq-mux:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      set csx as irq pin. config this field when connect to 
>> + aw96308/aw96305BFOR
>
>Constraints? Can you imply this based on the compatible?

Yes, only AW96308 and AW96305BFOR need to configure this option.
I will redescribe it in the V2 version of the patch.

>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - sar-num
>> +  - interrupts
>> +  - channel_use_flag
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        awinic_sar@12 {
>> +            compatible = "awinic,aw_sar";
>> +            reg = <0x12>;
>> +            sar-num = < 0 >;
>> +            interrupt-parent = < &tlmm >;
>> +            interrupts = <72 0>;
>> +            //vcc0-supply = <&pm660l_l4>;
>
>Why commented?

This is a non-essential configuration,
and I will remove it in the v2 version of the patch.

>
>> +            channel_use_flag = <0xff>;
>> +            aw_sar,update_fw;
>> +            //aw_sar,monitor_esd;
>> +            start-mode = < 1 >;
>> +            irq-mux = < 2 >;
>> +        };
>> +    };
>> --
>> 2.45.1
>> 
>

--
Thanks,

Wang Shuaijie

