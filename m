Return-Path: <linux-input+bounces-4681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 883D291B2AE
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 01:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4EB21C21D5A
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 23:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF471A2FA5;
	Thu, 27 Jun 2024 23:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="GNZ9OK/h"
X-Original-To: linux-input@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD723FBA5
	for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719530698; cv=none; b=IpbIWnI65lVedFRhAKckiYzoUbDS5TpYMibmFUTYioVA8B1iA1XWyGQuqRCR3z/Keo6WyZolaD5apJs1rKdhCLzoS8BiZVvclZSxNjEPVL6VrdyRu5Qhz+bnxM+h0j6aNbfAw9m54J46tpk2/oOl7o+ZvPkM1OcWSMp71YBjs34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719530698; c=relaxed/simple;
	bh=XKHD5Bq5YfgUyxHpt9168dR5W0eOutqISDsCOP8X5Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R78reRx17qTYNTeFKIcMR5MRIiqO8oYhXGTfJUh5U5AnUceSXyW73emNVLNH2Z1ngmg384FrQRr70u2VNZ0kiV7EYFdojKM2D3d9Oe6tlOjByI64z1KdWqlgsRG/9rNCouYOgzyXTVfdoZaNZAH2YKRZ8s4TDbWOMb31/X9ApSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=GNZ9OK/h; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: robh@kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719530692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICAp9hfKMLlt54zicEALRnRFEpyeGbOieXNIePqoNoE=;
	b=GNZ9OK/hjojKKCCZocw+iREmnpb37vYRkSFSXwPqL8nb7rqxSxZaUL5+xrDLqnjLif7oEY
	zEENhDMupadjyE57tmxI2vrP+bWvkynFNvw4acwo5Iw9kMwnxrWorwk0bX33aBivpgSsC3
	wpOZyH6UqPniuLxCl21BmdWyaOs+bNDppFXGe0bWbcRIBH6lvPXhPnHguWQdAEiaLG2S0Z
	3WEn6uiVuVFT4DnVCKzdZ+IX4cqAbYh8+WFglwHQfYiVbMv6xfZy2nRFvKR2oCLAcRzIPc
	9AcLPbYDkIQSlhZ2LTDXKkJ/lASwJthjy3VanlZpUsr5ERsf79cD01NzJQVhvQ==
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
Message-ID: <908e60e3-0922-4dd7-b28b-1d97c6191716@postmarketos.org>
Date: Fri, 28 Jun 2024 01:24:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] dt-bindings: panel: document Samsung AMB655X
To: Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-1-388eecf2dff7@postmarketos.org>
 <20240627221255.GA649980-robh@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <20240627221255.GA649980-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 28/06/2024 00:12, Rob Herring wrote:
> On Mon, Jun 24, 2024 at 03:30:25AM +0200, Caleb Connolly wrote:
>> Describe the Samsung AMB655X panel. It has three supplies.
>>
>> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
>> ---
>>   .../bindings/display/panel/samsung,amb655x.yaml    | 59 ++++++++++++++++++++++
>>   1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
>> new file mode 100644
>> index 000000000000..eb987d022a0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
>> @@ -0,0 +1,59 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/panel/samsung,amb655x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Samsung AMB655X 1080x2400 120hz AMOLED panel
>> +
>> +maintainers:
>> +  - Caleb Connolly <caleb@postmarketos.org>
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: samsung,amb655x
> 
> 'x' is not a wildcard is it? Those are generally not allowed.

No, not as far as I can tell. every reference I can find refers to this 
panel as amb655x, there i haven't found anything else and I don't know 
of any variations of the panel.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: reset gpio, must be GPIO_ACTIVE_LOW
> 
> blank line
> 
>> +  vddio-supply: true
>> +  vdd-supply: true
>> +  avdd-supply: true
>> +  enable-gpios: true
>> +  port: true
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - vdd-supply
>> +  - avdd-supply
>> +  - vddio-supply
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/gpio/gpio.h>
>> +    spi {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        panel@0 {
>> +            compatible = "samsung,ams495qa01";
>> +            reg = <0>;
>> +            reset-gpios = <&gpio4 0 GPIO_ACTIVE_LOW>;
>> +            vdd-supply = <&vcc_3v3>;
>> +
>> +            port {
>> +                mipi_in_panel: endpoint {
>> +                  remote-endpoint = <&mipi_out_panel>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.45.0
>>

