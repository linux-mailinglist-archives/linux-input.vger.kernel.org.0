Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56B4154CB8
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2020 21:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgBFUMx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Feb 2020 15:12:53 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38611 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727474AbgBFUMx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Feb 2020 15:12:53 -0500
Received: by mail-pj1-f67.google.com with SMTP id j17so458843pjz.3
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2020 12:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Z6j9xl2gMAuJIZhUM3OZ+/+Wm5NYXPRonJqY9rHuf6Q=;
        b=GPdbUU4JBvVFhS7rJEgeoHkbVXb9GzIGPU0J7jERwnBHvYLtYmAD1ll1Cga7j3ID3g
         XUEt8PjNaOVqBa+CnbfH9oNsfyc+E7FT675Gr0zNZVCxWTmUKuLnW1iDC1ldRoxCMhjR
         +Hmq3zVYVPbp79FzicizP0aOa3w1CpxzXqetZvuvAcplg8JDOohk0idIMjmWrgjBK+oY
         FBIme313NDOlXXYSzVdrgEnGv9QL4vxFI2WM4STblguOEhb8FvXFskRPn/25ZmPYLm8z
         IOn4LasE8kQj3lQ06o6jufXO2lJHYw68vrXd0uJrLP3QQIBZOkOco71lIkjh2fPA6EUa
         DDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Z6j9xl2gMAuJIZhUM3OZ+/+Wm5NYXPRonJqY9rHuf6Q=;
        b=edAyhRpsYjARuW1JTG7dN037YeWbI86Y6k8IsoRO6W/dl2DyD3+htx0d510Ki8H15P
         NKcVMArHremv9KSvmgA8ltez0O4bRd72k7GRHZTRlmZ4MOaHC3SSbuFEJfFG6WeUBvH/
         UBtX7P+xNjCtPLSLDiFeKJAL9xzHtNKrC+D1DfCsbRoOtn/k2ZzC1yXcXtpidThLn36d
         ZdtfsB8sIf/aoLVmOqV7pGqo6a5kGSvDCAyGvXKJ1+Ol1WnXuEMN/AUy94tLmkpydfyW
         kMaVQzS6fflV4l/Aq1Wx/53+wTq4dlrLEdKECdy5M1wWj2gMg8r2VNc4/rjUYBqltwiK
         gA9g==
X-Gm-Message-State: APjAAAXtA3PiTi+CG+tz6YUY9mz7mQ0vXj0GGewMlkbI8yzd/pENyYi+
        V504kvcafigyr7/Fnhu/STrrVA==
X-Google-Smtp-Source: APXvYqxCYxs5NXO73LHmmJkSf8xcneqdHgt20U7cp772ADNCXrR7dMyGpQCGHZe8vjEXvFkit8aF4Q==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3mr5851345plo.282.1581019972735;
        Thu, 06 Feb 2020 12:12:52 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id u26sm240765pfn.46.2020.02.06.12.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:12:51 -0800 (PST)
Date:   Thu, 6 Feb 2020 12:12:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Nuno S? <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Stefan Popa <stefan.popa@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Marcus Folkesson <marcus.folkesson@gmail.com>,
        Kent Gustavsson <kent@minoris.se>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-clk@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Fix paths in schema $id fields
Message-ID: <20200206201248.GO2514@yoga>
References: <20200204224909.26880-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200204224909.26880-1-robh@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue 04 Feb 14:49 PST 2020, Rob Herring wrote:

> The $id path checks were inadequately checking the path part of the $id
> value. With the check fixed, there's a number of errors that need to be
> fixed. Most of the errors are including 'bindings/' in the path which
> should not be as that is considered the root.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: "Nuno Sá" <nuno.sa@analog.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Stefan Popa <stefan.popa@analog.com>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Hartmut Knaack <knaack.h@gmx.de>
> Cc: Lars-Peter Clausen <lars@metafoo.de>
> Cc: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
> Cc: Kent Gustavsson <kent@minoris.se>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-iio@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
[..]
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index e39d8f02e33c..b5bef5abc281 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/bindings/arm/qcom.yaml#
> +$id: http://devicetree.org/schemas/arm/qcom.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
>  title: QCOM device tree bindings

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
