Return-Path: <linux-input+bounces-1906-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA851854F73
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 18:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89CF9B24D86
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 17:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02805FDD4;
	Wed, 14 Feb 2024 17:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="MPHVT4xD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64F560867;
	Wed, 14 Feb 2024 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707930354; cv=none; b=QEDQr1nCwlSin9Wv4WvHeg5v99VSbOD2Rz6cIeN1s7Mzo3SrzujQ0NZPHJlF3Pnio1tl/97+qnVsWYSjUqcPkS855GO4PhQI0i3Y9EtNUSE6TBqsdj7pfHz/KhjjoPSNuMbQcy1PSV0l051aTFqEAiZqRxcmZbt/2xVI0Dj1x7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707930354; c=relaxed/simple;
	bh=rx3M+Duu0YsPRFId7MG8RbxYqjR1u0OvnRcZx0ekX40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GaMmOwrO1BojaUmn9x5QjAWqRCuVpWOz17FIREYJdSQxeUkw6qQuAmDnQ0VEXXOsl/CCA3EtdrEQIhikvQeuKUcZTLohIKT+7Wrtl6H731sVW+lJDu2aPFS4rme36T3xPn38rTtYy2ypMGeFbGB4X/R1b++L+ENDdJCaGDJW//U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=MPHVT4xD; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EAorNh015120;
	Wed, 14 Feb 2024 10:07:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=pps1;
	 bh=xnq1AQLHK2MU8DiOuNCgG/K29mjeX+zve6mmPdGlY68=; b=MPHVT4xDLQoN
	/1zvNof2zQICOz6Tlx8rfOZRqPP4Bp4AW/+H89TQeHo89LS6VKE+lHOIuU5OHmuf
	zibJAbYemgpH5st1nIwhmwGBitwO16mOzoRfmtastl+2LE/W0ceBbmT+EUv85DJy
	DcmeyTgA1E64PO/kqp0o36nL/foYjeBAr3wvuDWCiiZSkKeTpNodNTwqhA/1hqcH
	y8Xcnhn3QHw2vtp45LOwPiEXKHnj3c6QtxZU4znfQfromZIOJrMRmIaIikIdhR8D
	MlPSAoNfzqgZ8OWG6nqDnlCicOOTSNS6jemSQUhgF8CwHntWHO1FaSvRjXxA3YDo
	NJHHjVooMA==
Received: from gcc-mail-mx-004.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3w8v4ggvyr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Feb 2024 10:07:29 -0600 (CST)
Received: from gcc-mail-mx-002.Na.Plexus.com (10.255.51.221) by
 gcc-mail-mx-004.na.plexus.com (10.255.51.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 16:07:28 +0000
Received: from LNDCL34533.neenah.na.plexus.com (10.255.48.203) by
 gcc-mail-mx-002.Na.Plexus.com (10.255.51.221) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 16:07:28 +0000
From: Danny Kaehn <danny.kaehn@plexus.com>
To: <robh@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <bartosz.golaszewski@linaro.org>,
        <bentiss@kernel.org>, <danny.kaehn@plexus.com>,
        <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
        <ethan.twardy@plexus.com>, <jikos@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <linux-input@vger.kernel.org>,
        <niyas.sait@linaro.org>
Subject: Re: [PATCH v10 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
Date: Wed, 14 Feb 2024 10:06:16 -0600
Message-ID: <20240214160616.2377733-1-danny.kaehn@plexus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240213152825.GA1223720-robh@kernel.org>
References: <20240213152825.GA1223720-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -MsJYhM0Ofpt2r8PTgUYC-bAc6z3Pnc7
X-Proofpoint-ORIG-GUID: -MsJYhM0Ofpt2r8PTgUYC-bAc6z3Pnc7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_08,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1011 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140125

Thanks for taking a look Rob.

On Tue, 2024-02-13 at 09:28 -0600, Rob Herring wrote:
> On Mon, Feb 05, 2024 at 11:09:20AM -0600, Danny Kaehn wrote:
> > This is a USB HID device which includes an I2C controller and 8 GPIO pins.
...
> > 2. There has been some contention between using named child nodes to
> > identify i2c and gpio nodes, and also making the driver implementing this
> > binding compatible with ACPI, since names aren't significant for ACPI
> > nodes, and ACPI names are always automatically uppercased. It has been
> > suggested that perhaps the DT binding should use child nodes with
> > addressable `reg` properties to identify the child nodes, instead of by
> > name [1].
> 
> 'reg' only makes sense if there are values which relate to the h/w. If 
> your addresses are indices, that will be suspect.
> 
> There's documented nodenames for specific device classes in DT. You have 
> to use those whether there's 'reg' and a unit-address or not. I'm not 
> really clear what the problem is.
> 
Ack. Mostly just forwarding on Andy Shevchenko's suggestion for making a more
consistent interface across ACPI and DT since ACPI doesn't support identifying
children by named nodes.

> > 
> > Of course, I acknowledge that other firmware languages and kernel details
> > shouldn't impact DT bindings, but it also seems that there should
> > be some consistent way to specify sub-functions like this accross DT
> > and ACPI. Some additional commentary / requests for comment about the
> > seemingly missing glue here can be found in [2].
> 
> I have little interest in worrying about ACPI as I have limited 
> knowledge in ACPI requirements, what I do know is the model for bindings 
> are fundamentally differ, and no one has stepped up to maintain bindings 
> from an ACPI perspective.
> 

Fair enough.

> > Any comments from Rob/Krzysztof/other DT folks would be greatly appreciated
> > 
> > [1] https://lore.kernel.org/all/ZBhoHzTr5l38u%2FkX@smile.fi.intel.com/
> > [2] https://lore.kernel.org/all/CAP+ZCCd0cD+q7=ngyEzScAte2VT9R00mqCQxB3K2TMbeg8UAfA@mail.gmail.com/
> > 
> >  .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
> >  1 file changed, 113 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> > new file mode 100644
> > index 000000000000..a27509627804
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CP2112 HID USB to SMBus/I2C Bridge
> > +
> > +maintainers:
> > +  - Danny Kaehn <kaehndan@gmail.com>
> > +
> > +description:
> > +  The CP2112 is a USB HID device which includes an integrated I2C controller
> > +  and 8 GPIO pins. Its GPIO pins can each be configured as inputs, open-drain
> > +  outputs, or push-pull outputs.
> > +
> > +properties:
> > +  compatible:
> > +    const: usb10c4,ea90
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: The USB port number on the host controller
> > +
> > +  i2c:
> > +    description: The SMBus/I2C controller node for the CP2112
> > +    $ref: /schemas/i2c/i2c-controller.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      sda-gpios:
> > +        maxItems: 1
> > +
> > +      scl-gpios:
> > +        maxItems: 1
> 
> Why do you have GPIOs if this is a proper controller?

This is exclusively for bus recovery (not implemented in the driver patch
sent here). I believe there's precedent for this in bindings like i2c-imx.yaml?

(skip if the above was all you needed):

Hopefully without going into more details than you're interested in, the
CP2112 hardware doesn't implement any runtime bus recovery algorithms.
Even just by bridging two of the CP2112's GPIOs with SCL and SDA,
I was able to use the generic GPIO bus recovery routine to recover a stuck bus.
This was especially important since v2 of the CP2112 hardware has an errata
which can cause uncompleted I2C transactions on a semi-regular basis.

> 
> > +
> > +      clock-frequency:
> > +        minimum: 10000
> > +        default: 100000
> > +        maximum: 400000
> > +
> > +  gpio:
> > +    description: The GPIO controller node for the CP2112
> 
> There's no need for a child node here. All these properties can be part 
> of the parent.

I had gone back and forth on this for quite some time. Would you suggest this
just because it _can_ be combined, due to the naming constraint on the "hog"
nodes? (as opposed to the i2c not being able to be combined, due to
unconstrained names of child nodes?).

I had initially thought this approach would scale better -- say there was a
similar chip with I2C, GPIO, SPI, and UART interfaces -- would GPIO still
share a node with the parent? And is there a reason that gpio is
special, or just it _can_ be combined due to the naming restrictions? Looking
at some of the bindings under mfd/ I see the GPIO controller broken into a
named child node, although I see they also have their own compatible strings...

> 
> 
> > +    type: object
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      interrupt-controller: true
> > +      "#interrupt-cells":
> > +        const: 2
> > +
> > +      gpio-controller: true
> > +      "#gpio-cells":
> > +        const: 2
> > +
> > +      gpio-line-names:
> > +        minItems: 1
> > +        maxItems: 8
> > +
> > +    patternProperties:
> > +      "-hog(-[0-9]+)?$":
> > +        type: object
> > +
> > +        required:
> > +          - gpio-hog
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    usb {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      device@1 {
> > +        compatible = "usb10c4,ea90";
> > +        reg = <1>;
> > +
> > +        i2c {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          sda-gpios = <&cp2112_gpio 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +          scl-gpios = <&cp2112_gpio 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +
> > +          temp@48 {
> > +            compatible = "national,lm75";
> > +            reg = <0x48>;
> > +          };
> > +        };
> > +
> > +        cp2112_gpio: gpio {
> > +          gpio-controller;
> > +          interrupt-controller;
> > +          #gpio-cells = <2>;
> > +          gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
> > +            "TEST3","TEST4", "TEST5", "TEST6";
> > +
> > +          fan-rst-hog {
> > +              gpio-hog;
> > +              gpios = <7 GPIO_ACTIVE_HIGH>;
> > +              output-high;
> > +              line-name = "FAN_RST";
> > +          };
> > +        };
> > +      };
> > +    };
> > -- 
> > 2.25.1
> > 

Thanks,

Danny Kaehn

