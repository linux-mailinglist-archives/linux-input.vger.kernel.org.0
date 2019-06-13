Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B857344F52
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 00:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727251AbfFMWjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 18:39:49 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:32983 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727024AbfFMWjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:48 -0400
Received: by mail-qt1-f196.google.com with SMTP id x2so366294qtr.0;
        Thu, 13 Jun 2019 15:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bCHJc/RYQOHT8KIIL8NnCGZBh/2T41LitjB/YOWB1/4=;
        b=UDiWmucC39NOFi3/dIsit95KBy8HJENqc0ZZRVsjXis/fC5NCFUjhKhtcRTicgs2uB
         ++1JljC+yn5tbqt49QA8uKFEHe4g5HkxcyjKIhfILIq2AStHN6J33EDLCYJgfxwMYTBQ
         TaF3UKoFyZ+blkbMEqOhIklQ9tt7tk22v/5G3J04T2sXz6NfR3Vt6plpNGqnZU1ppCBr
         Gu+IcJEGWHGnAX5g9y0uvQTJ+rx8lyOXZUjW8ta8h7ANLqzuT9iZ4oybtcNQadIGR9Af
         Ed0++CDBCNNS+e47pQF4nVv4tFjdx3bK+3YJDDUbDum3FnLdlfMOMVAAoq3f9EfODcka
         GQKA==
X-Gm-Message-State: APjAAAUbh2rJwyhcTsBy9H6eYbBQcB2Ea7ZAjflh8oRXEvoWLcV+f5/D
        UoUBF56IxMucSOscBURGEw==
X-Google-Smtp-Source: APXvYqzFn/C8biXE88xDpBCccLlZIsNQzH0RGUaWMgWYLwdhGFaFjJgxaPQy9hUWHHluUnKM2YMbqA==
X-Received: by 2002:a0c:b036:: with SMTP id k51mr5598377qvc.103.1560465587282;
        Thu, 13 Jun 2019 15:39:47 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id v72sm594399qkb.0.2019.06.13.15.39.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:46 -0700 (PDT)
Date:   Thu, 13 Jun 2019 16:39:45 -0600
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
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: input: Add support for the
 MPR121 without interrupt line
Message-ID: <20190613223945.GA938@bogus>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <1558098773-47416-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1558098773-47416-2-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 17, 2019 at 03:12:50PM +0200, Michal Vokáč wrote:
> Normally, the MPR121 controller uses separate interrupt line to notify
> the I2C host that a key was touched/released. To support platforms that
> can not use the interrupt line, polling of the MPR121 registers can be
> used.

'separate' from what?

> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v1:
> - Document the polled binding in the original file, do not create a new one.
>   (Rob)
> 
>  Documentation/devicetree/bindings/input/mpr121-touchkey.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> index b7c61ee5841b..97f55273d473 100644
> --- a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> +++ b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> @@ -1,9 +1,14 @@
> -* Freescale MPR121 Controllor
> +* Freescale MPR121 Controller
>  
>  Required Properties:
> -- compatible:		Should be "fsl,mpr121-touchkey"
> +- compatible:		Should be one of:
> +			- "fsl,mpr121-touchkey" - MPR121 with interrupt line
> +			- "fsl,mpr121-touchkey-polled" - MPR121 with polling
>  - reg:			The I2C slave address of the device.
>  - interrupts:		The interrupt number to the cpu.
> +			In case of "fsl,mpr121-touchkey-polled" the interrupt
> +			line is not used and hence the interrupts property is
> +			not required.

Absence of the interrupts property is enough to determine polled mode 
and you don't need a separate compatible string.

>  - vdd-supply:		Phandle to the Vdd power supply.
>  - linux,keycodes:	Specifies an array of numeric keycode values to
>  			be used for reporting button presses. The array can
> -- 
> 2.1.4
> 
