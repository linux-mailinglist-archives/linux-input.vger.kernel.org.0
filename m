Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF7389299
	for <lists+linux-input@lfdr.de>; Wed, 19 May 2021 17:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354781AbhESPat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 11:30:49 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:33289 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354777AbhESPat (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 11:30:49 -0400
Received: by mail-ot1-f46.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so12138502oto.0;
        Wed, 19 May 2021 08:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=7+JB9Zyu4+IY2hdDOgcmRMbIQW9I3jTmXTZo7gASLew=;
        b=ngOo7DLOlIDsUKLSWCs7rPfiOhBa0xQ9GrNexUdEnYzVKtXrkrv8PdfCV9Vxn/llC/
         7akxXHyAcB119dMfhLr1tVoYeWo3vbsR8bJ5HZLHzPVxpAadzj/j+KskrzDXzvNHcU2M
         HdnYcQrLXQRFpx3kOqIjy/S1xrMoS7BO+HuyT4KnSnX6zKzNiBUwHEAr6z7iWmOXvv3n
         aV32dol6+4t9TEffbL4aL8QYP11qQZC+aS79Pe8GQWNn7xZLUgVymhWNuEkh+7jkSTh4
         VvTMzWmddU/eAF/5+G0Aw2oEkNICM74ADyyPEwUe5yvcjrH4YR0nFiBPHM0OiHE+I06N
         ebxw==
X-Gm-Message-State: AOAM531iRPtwgULdWS0BZdo8c/9wpRo2RIg9/JF5u9BA2yVtmkrJSDOZ
        Tzfj/nJznhm9XpslT+uWYQ==
X-Google-Smtp-Source: ABdhPJzaSafp0audcs87a9mL6YLp05FiXb1wBCFLn+0OqGYGYkYPD48OIiWNXACJVQ2DTYwY+cmQ/g==
X-Received: by 2002:a9d:62d2:: with SMTP id z18mr9579427otk.78.1621438168410;
        Wed, 19 May 2021 08:29:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z9sm5015oti.37.2021.05.19.08.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 08:29:27 -0700 (PDT)
Received: (nullmailer pid 3134238 invoked by uid 1000);
        Wed, 19 May 2021 15:29:24 -0000
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        kernel@pengutronix.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        David Jander <david@protonic.nl>
In-Reply-To: <20210519094221.27792-2-o.rempel@pengutronix.de>
References: <20210519094221.27792-1-o.rempel@pengutronix.de> <20210519094221.27792-2-o.rempel@pengutronix.de>
Subject: Re: [PATCH v4 1/5] dt-bindings: touchscreen: validate nodename
Date:   Wed, 19 May 2021 10:29:24 -0500
Message-Id: <1621438164.148746.3134237.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 May 2021 11:42:17 +0200, Oleksij Rempel wrote:
> Validate touchscreen nodes. Make sure it is named touchscreen*.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/input/touchscreen/touchscreen.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.example.dt.yaml: edt-ft5x06@38: $nodename:0: 'edt-ft5x06@38' does not match '^touchscreen(@.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/goodix.example.dt.yaml: gt928@5d: $nodename:0: 'gt928@5d' does not match '^touchscreen(@.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs626a.example.dt.yaml: iqs626a@44: $nodename:0: 'iqs626a@44' does not match '^touchscreen(@.*)?$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/iqs626a.yaml

See https://patchwork.ozlabs.org/patch/1480791

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

