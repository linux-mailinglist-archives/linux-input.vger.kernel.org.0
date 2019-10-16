Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B353D8879
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 08:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731408AbfJPGHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 02:07:25 -0400
Received: from uho.ysoft.cz ([81.19.3.130]:50406 "EHLO uho.ysoft.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfJPGHZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 02:07:25 -0400
Received: from [10.1.8.111] (unknown [10.1.8.111])
        by uho.ysoft.cz (Postfix) with ESMTP id D9F2FA1E72;
        Wed, 16 Oct 2019 08:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
        s=20160406-ysoft-com; t=1571206043;
        bh=FqXa8sJDOA/bgwqRuOuWEjcOj5Iw8nEKq+aYc80lY04=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qRga/fhEJWT21RcFo85a5LD+uHsRDWQUeja9DYPZfq6Ci4em9S5SR3pGnN99n27JZ
         Udf2DDyDdFHeR8+RggoSY3Zo5IEIqUVnYGQ0QNyAKYxUjQTaYcJXJylRT5ueQE3pFj
         +jV2gWOYDX0bG1sUq1nCVhNAVK3PBOj+O2aAc8BY=
Subject: Re: [PATCH v3 5/5] ARM: dts: imx6dl-yapp4: Enable the MPR121 touchkey
 controller on Hydra
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-6-git-send-email-michal.vokac@ysoft.com>
From:   =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>
Message-ID: <390ce745-4768-8e61-de03-fde74517fad5@ysoft.com>
Date:   Wed, 16 Oct 2019 08:07:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1570083176-8231-6-git-send-email-michal.vokac@ysoft.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03. 10. 19 8:12, Michal Vokáč wrote:
> Add the touch keyboard present on Hydra board. The controller
> is connected only using I2C lines. The interrupt line is not
> available hence we use the polling mode.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---

This should ideally go through the input tree with the rest of
the changes that add support for the poll-interval.

Shawn, can you ack this so Dmitry can take it, please?

Thank you,
Michal

> Changes since v2:
>   - None
> 
> Changes since v1:
>   - Use poll-interval property name instead of linux,poll-interval.
> 
>   arch/arm/boot/dts/imx6dl-yapp4-common.dtsi | 13 +++++++++++++
>   arch/arm/boot/dts/imx6dl-yapp4-hydra.dts   |  4 ++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> index e8d800fec637..6507bfc0141a 100644
> --- a/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> +++ b/arch/arm/boot/dts/imx6dl-yapp4-common.dtsi
> @@ -4,6 +4,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/input/input.h>
>   #include <dt-bindings/pwm/pwm.h>
>   
>   / {
> @@ -330,6 +331,18 @@
>   		vcc-supply = <&sw2_reg>;
>   		status = "disabled";
>   	};
> +
> +	touchkeys: keys@5a {
> +		compatible = "fsl,mpr121-touchkey";
> +		reg = <0x5a>;
> +		vdd-supply = <&sw2_reg>;
> +		autorepeat;
> +		linux,keycodes = <KEY_1>, <KEY_2>, <KEY_3>, <KEY_4>, <KEY_5>,
> +				<KEY_6>, <KEY_7>, <KEY_8>, <KEY_9>,
> +				<KEY_BACKSPACE>, <KEY_0>, <KEY_ENTER>;
> +		poll-interval = <50>;
> +		status = "disabled";
> +	};
>   };
>   
>   &iomuxc {
> diff --git a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
> index f97927064750..84c275bfdd38 100644
> --- a/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
> +++ b/arch/arm/boot/dts/imx6dl-yapp4-hydra.dts
> @@ -45,6 +45,10 @@
>   	status = "okay";
>   };
>   
> +&touchkeys {
> +	status = "okay";
> +};
> +
>   &usdhc3 {
>   	status = "okay";
>   };
> 

