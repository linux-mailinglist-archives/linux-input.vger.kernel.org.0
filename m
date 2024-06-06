Return-Path: <linux-input+bounces-4173-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B321D8FF270
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 18:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1182828D9
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 16:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA771328A0;
	Thu,  6 Jun 2024 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b="AxaXFOcS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0046e701.pphosted.com (mx0a-0046e701.pphosted.com [67.231.149.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F4E523A;
	Thu,  6 Jun 2024 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717691168; cv=none; b=iCeT7eIyaAfObC3ia9Zi4+SckxG1/lsng9Y2muXjRpq+WCjOM7IuEGM0r3yWtqz+lpv2WWZwbtq9Wo+I2+/Cd6eZQklLcv2NmcSFwJiszFyFjL+XttQdmVyIQc2s/QoNdxTW1zoXU+cFg2GKJuBWENFzAMtXuYCCgkAvbjDAJv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717691168; c=relaxed/simple;
	bh=DniSNQzmf0sUNdO13hFY83MISzXkqvsSD8p0cH9kGWY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV0MuflX2mUwfs9PJuuKQ7HNLPFIpDyzxcX0I4hS7GADCxfDuNOC6DnbncwCkcUOPFCgdFKkzunwrMi8M6/jw5JPmEORWCmP54UWYPNobO81cZZxYS7tG/Mpww6QHftcJMFl0vB9VQ7mAAlqaPniXOMG8sZIJ1Za7WlWUQSQQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com; spf=pass smtp.mailfrom=plexus.com; dkim=pass (2048-bit key) header.d=plexus.com header.i=@plexus.com header.b=AxaXFOcS; arc=none smtp.client-ip=67.231.149.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plexus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plexus.com
Received: from pps.filterd (m0341554.ppops.net [127.0.0.1])
	by mx0a-0046e701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456CDCSl015436;
	Thu, 6 Jun 2024 11:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plexus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps1; bh=TXqOBAl+0qBritp3LO30RSbPnM/Ax
	dGVDaqsmMwMIus=; b=AxaXFOcSSazW+YLoS6dicqxfD9BJsYcwyb5UYCrYBOIUN
	mV34gZL0o2qnHfHR623uJrB/go9ABQKJEZKnLTmqnIbwM6l1AM/ghmMEFX83ARUT
	kTwtzhn4tTh83iN98pERfxOyDidsMLJ1g+a3Zoxh1CE1hFasMWuiRhofYAFjzeRR
	4tYfsWFViTF/K47deWJI36u4KI9RzngX3qoQLwrEul4WtM5n4KqWHwjyjgBXghTs
	Bi7l8QuzyeqiEc52n/sLOGNupg+AfQkj7nhhqMtpmg+bjO9LQYvtxIGqy9Ie3olI
	8/UxSMcWkOq7ju7CUlEAsvR1rn5c40ycMPZp+2SPQ==
Received: from dcc-mail-mx-001.na.plexus.com (outbound.plexus.com [64.215.193.254])
	by mx0a-0046e701.pphosted.com (PPS) with ESMTPS id 3ykcwv8tac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 06 Jun 2024 11:25:52 -0500 (CDT)
Received: from Dcc-mail-mx-002.na.plexus.com (10.249.48.16) by
 Dcc-mail-mx-001.na.plexus.com (10.249.48.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Thu, 6 Jun 2024 16:25:51 +0000
Received: from localhost (10.255.48.203) by Dcc-mail-mx-002.na.plexus.com
 (10.249.48.16) with Microsoft SMTP Server id 15.1.2507.37 via Frontend
 Transport; Thu, 6 Jun 2024 16:25:51 +0000
Date: Thu, 6 Jun 2024 11:24:38 -0500
From: Danny Kaehn <danny.kaehn@plexus.com>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Benjamin Tissoires
	<bentiss@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Ethan Twardy
	<ethan.twardy@plexus.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <20240606162438.GA77976@LNDCL34533.neenah.na.plexus.com>
References: <20240605-cp2112-dt-v11-0-d55f0f945a62@plexus.com>
 <20240605-cp2112-dt-v11-1-d55f0f945a62@plexus.com>
 <20240606151859.GA3605325-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240606151859.GA3605325-robh@kernel.org>
X-Proofpoint-GUID: _AXpfAKKlB9vHLelYyNeTSxjOHZz67Z2
X-Proofpoint-ORIG-GUID: _AXpfAKKlB9vHLelYyNeTSxjOHZz67Z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_13,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060118

I appreciate you taking a look (even in spite of the dt_binding_check
failure).

On Thu, Jun 06, 2024 at 09:18:59AM -0600, Rob Herring wrote:
> On Wed, Jun 05, 2024 at 06:12:44PM -0500, Danny Kaehn wrote:
> > This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> > 
> > The binding allows describing the chip's gpio and i2c controller in DT
> > using the subnodes named "gpio" and "i2c", respectively. This is
> 
> There's no more gpio subnode.
>
Will fix.

> > intended to be used in configurations where the CP2112 is permanently
> > connected in hardware.
> > 
> > Signed-off-by: Danny Kaehn <danny.kaehn@plexus.com>
> > ---
> >  .../devicetree/bindings/i2c/silabs,cp2112.yaml     | 105 +++++++++++++++++++++
> >  1 file changed, 105 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> > new file mode 100644
> > index 000000000000..0108f2e43c8c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/i2c/silabs,cp2112.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: CP2112 HID USB to SMBus/I2C Bridge
> > +
> > +maintainers:
> > +  - Danny Kaehn <danny.kaehn@plexus.com>
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
> 
> Or hub ports. Just drop 'on the host controller'.
>

Will fix.

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
> These are because I2C can be on any of the pins? It's a bit odd if they 
> aren't used as gpios. Probably should be pinmux, but that's overkill for 
> 2 pins.
>

I'm beginning to realize now that this may be a bit non-standard, but it
did solve a stuck bus issue under some conditions.

The CP2112's I2C controller is self-contained and can only be on the
specific pins it is attached to (no pinmux, etc..).

In this case, these properties are ment to specify additional gpio pins
which are connected to the SCL and SDA lines (this then also assumes those
are configured to be open drain / inputs to not interfere with the bus
during normal operation). This was inspired by what is done ini2c-imx.yaml,
but I realize this is a bit different due to using external pins rather
than pinmuxing to the GPIOs.

How I used this was to actually connect some of the CP2112's own GPIO pins
to the SDA and SCL lines to be able to use those pins to recover the
bus. This was able to solve a stuck bus under some real-world cases with
the v2 of the CP2112 containing an errata which caused this
semi-frequently.

> > +
> > +      clock-frequency:
> > +        minimum: 10000
> > +        default: 100000
> > +        maximum: 400000
> > +
> > +  interrupt-controller: true
> > +  "#interrupt-cells":
> > +    const: 2
> 
> Where does the 

Unsure what you intended to ask here -- but the interrupt comes from the
GPIO chip. It is unfortunately not a hardware interrupt, but is
accomplished through polling.

> > +
> > +  gpio-controller: true
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-line-names:
> > +    minItems: 1
> > +    maxItems: 8
> > +
> > +patternProperties:
> > +  "-hog(-[0-9]+)?$":
> > +    type: object
> > +
> > +    required:
> > +      - gpio-hog
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
> > +      cp2112: device@1 {
> > +        compatible = "usb10c4,ea90";
> > +        reg = <1>;
> > +
> > +        i2c {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          sda-gpios = <&cp2112 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +          scl-gpios = <&cp2112 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > +
> > +          temp@48 {
> > +            compatible = "national,lm75";
> > +            reg = <0x48>;
> > +          };
> > +        };
> > +
> > +        gpio-controller;
> > +        interrupt-controller;
> > +        #gpio-cells = <2>;
> > +        gpio-line-names = "CP2112_SDA", "CP2112_SCL", "TEST2",
> > +          "TEST3","TEST4", "TEST5", "TEST6";
> > +
> > +        fan-rst-hog {
> > +            gpio-hog;
> > +            gpios = <7 GPIO_ACTIVE_HIGH>;
> > +            output-high;
> > +            line-name = "FAN_RST";
> > +        };
> > +      };
> > +    };
> > 
> > -- 
> > 2.25.1
> > 

Thanks,

Danny Kaehn


