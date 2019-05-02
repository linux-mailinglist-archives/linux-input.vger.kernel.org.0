Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B33F110C6
	for <lists+linux-input@lfdr.de>; Thu,  2 May 2019 02:48:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbfEBAsw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 May 2019 20:48:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34225 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfEBAsw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 May 2019 20:48:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id v10so427778oib.1;
        Wed, 01 May 2019 17:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/DJSVXUD6ihdDGPu0GZjl5uPL7+MwkMGdNWZHLgSEZ0=;
        b=FV2f99ZGRYMYUthNqY65zhIZx0jdIuRg49qo49W6Okp+Ncmymi6C/PPiSJ7LwIq2wH
         V/py9IEexclqxm2NJG1q3HlskOh8TkhjMlGjpLHgZPjyFOyDmrLsOdW3aWco9eEsLpKL
         E/2vpKbQIB3FXtBhuNOQQZixzrLEuPH33X6X+8X8f3tw2ZNkZkwABGdnoLdMEuLg0OKC
         ItlbqqR9Lv4//rv7D7C6tRW2x+9w0p29Cv3uRFeSBl7TCfCb924j/aw9CkkS22tMTFJC
         S7ECsCXxP516Jzbh3DYcdheHRj560mqUOKlMDm13+LkZmMzgx9qRUYDgVGTdDpkIr/NN
         yWOg==
X-Gm-Message-State: APjAAAWHHjf9qpesIAoEfSrH7Gwta7svu4ZleaP60nGxk6O/91KFpMNP
        As9zbrEJLyqZ9sD1xFlMGb4AhSY=
X-Google-Smtp-Source: APXvYqzw6vNDK3Wzkdy9CxKtL6Q3ubGrIjPHnrFf021GVDCBaGS2/NFROx9ihayNuO+j0GGbsvHoYg==
X-Received: by 2002:aca:3306:: with SMTP id z6mr748777oiz.25.1556758131022;
        Wed, 01 May 2019 17:48:51 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i11sm16269124otl.27.2019.05.01.17.48.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 17:48:50 -0700 (PDT)
Date:   Wed, 1 May 2019 19:48:49 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RFC PATCH 1/4] dt-bindings: input: Add support for the MPR121
 without interrupt line
Message-ID: <20190502004849.GA8232@bogus>
References: <1556267420-93219-1-git-send-email-michal.vokac@ysoft.com>
 <1556267420-93219-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1556267420-93219-2-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 26, 2019 at 10:30:17AM +0200, Michal Vokáč wrote:
> Normally, the MPR121 controller uses separate interrupt line to notify
> the I2C host that a key was touched/released. To support platforms that
> can not use the interrupt line, polling of the MPR121 registers can be
> used.

Other than making the 'interrupts' property optional, that's a driver 
change, not a DT change. IOW, we shouldn't need a whole new binding.

> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
>  .../bindings/input/mpr121-touchkey-polled.txt      | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
> new file mode 100644
> index 000000000000..6bb1d312614c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/mpr121-touchkey-polled.txt
> @@ -0,0 +1,26 @@
> +* Freescale MPR121 Controller without interrupt line
> +
> +Required Properties:
> +- compatible:		Should be "fsl,mpr121-touchkey-polled"
> +- reg:			The I2C slave address of the device.
> +- vdd-supply:		Phandle to the Vdd power supply.
> +- linux,keycodes:	Specifies an array of numeric keycode values to
> +			be used for reporting button presses. The array can
> +			contain up to 12 entries.
> +
> +Optional Properties:
> +- autorepeat:		Enable autorepeat feature.
> +
> +Example:
> +
> +#include "dt-bindings/input/input.h"
> +
> +	touchkeys: keys@5a {
> +		compatible = "fsl,mpr121-touchkey-polled";
> +		reg = <0x5a>;
> +		autorepeat;
> +		vdd-supply = <&ldo4_reg>;
> +		linux,keycodes = <KEY_0>, <KEY_1>, <KEY_2>, <KEY_3>,
> +				<KEY_4> <KEY_5>, <KEY_6>, <KEY_7>,
> +				<KEY_8>, <KEY_9>, <KEY_A>, <KEY_B>;
> +	};
> -- 
> 2.1.4
> 
