Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E198DE0F32
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 02:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbfJWA3g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 20:29:36 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44598 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727898AbfJWA3f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 20:29:35 -0400
Received: by mail-pg1-f196.google.com with SMTP id e10so10991599pgd.11;
        Tue, 22 Oct 2019 17:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=etvC0Y36xWfQRfo4KURuMPkjVTPOFZNFyu1FSezH8tk=;
        b=dhVL1wd0b2ObhhyUFz183qLRvXCrw11b8ILluPycCHqpEls3W6/JXlpDO1eXZA7Icv
         s9Q8VCICvl7nvRxv+58u01C3IW45oMCeBwVfWu7L/sLIKUK12XsHkuhg9XlTPSKAADpC
         Bhute3hwRz7dNwG5nEnrGJ+7C2z2yhiep6UXjD0kryGZJcBOkYfMwqgeXf9B6vCebnFw
         nz7XyQysIZCbjSr6A3Y0RUqcc89GvhWbvnuEW1Ji/1JEjWkk+kZA7C07PUguuYpSK+K2
         2I1Kbw0n9X3GHqdOd4Rn3++KaS4NRoxwmJjJQxTkJmy6gPMdvG+TAsnlhlf+Riicb2kF
         fWBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=etvC0Y36xWfQRfo4KURuMPkjVTPOFZNFyu1FSezH8tk=;
        b=IW3C6nM2WmEat8T3ktrodvPRi4bqffG1M+TzKAYiswGIlLW5yUY/9cokU/RAhAichW
         SkKpMIkdKCz5UY0xj36xe6rU+J0YnaO5SwjlNF5dFk/g+pJlnRzgw9SuBSUcQbWftQ/Q
         E5JcOcdItBSMQAD8QvWESME8GnCM73QCpFFjYz2FO6jIKZl/zpTfLpVcy9moYn6+JH4X
         j58zQpNFp1EDZSk7qjrv5bOAWveOJTkQP73YLN0APAZzfo1cXeYYJ5rZNwXJTcOtABHN
         6hHoD2CWlzV6MZcCIcmhPePKUsVmkO651tvcfebmQIoO+TNFy9TcWAIro4C6pwt6xZsd
         Cp+Q==
X-Gm-Message-State: APjAAAUFkHt1YiAybNxct5irFap+MmbEJsgN0fw3LmY0eFIeYhaz64/r
        DiPNagc9kYVTrzXxaDwRW6VHR7OB
X-Google-Smtp-Source: APXvYqxPQ4NlZvsI06wa12Le9f+xncVj9HYEtmazV9FMR5QUn6wvsxcyMCT51BQD99pAW97S7RZ+3g==
X-Received: by 2002:a63:495b:: with SMTP id y27mr6777836pgk.438.1571790573961;
        Tue, 22 Oct 2019 17:29:33 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k9sm19684744pfk.72.2019.10.22.17.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 17:29:33 -0700 (PDT)
Date:   Tue, 22 Oct 2019 17:29:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add DT bindings for Whiskers
 switch
Message-ID: <20191023002931.GX35946@dtor-ws>
References: <20191021030158.32464-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021030158.32464-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

On Mon, Oct 21, 2019 at 11:01:59AM +0800, Ikjoon Jang wrote:
> Add the DT binding document for Hammer's TABLET_MODE switch.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> ---
>  .../devicetree/bindings/input/cros-cbas.yaml  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> new file mode 100644
> index 000000000000..6a746c4cb266
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ChromeOS Hammer's Base Attached Switch
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description:
> +  On some ChromeOS devices with a foldable variant of Hammer base, SW_TABLET_MODE
> +  event should be generated with proper consideration of current device state.
> +  This device senses "base attached" signal from EC (Embedded Controller)
> +  and generates SW_TABLET_MODE event when Hammer is not attached.

Please change to something like below, because device tree is supposed
to describe hardware, not software behavior.

"This device is used to signal when a detachable base is attached to a
Chrome OS tablet".

> +  The node for this device must be under a cros-ec node like google,cros-ec-spi
> +  or google,cros-ec-i2c.
> +
> +properties:
> +  compatible:
> +   const: google,cros-cbas
> +
> +required:
> +  - compatible

Thanks.

-- 
Dmitry
