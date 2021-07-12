Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326073C61C9
	for <lists+linux-input@lfdr.de>; Mon, 12 Jul 2021 19:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235473AbhGLRYT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jul 2021 13:24:19 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:37535 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235428AbhGLRYS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jul 2021 13:24:18 -0400
Received: by mail-io1-f53.google.com with SMTP id l18so18655303iow.4;
        Mon, 12 Jul 2021 10:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C1Gh49U5kKEaIeYTNBU4R/9/gfXEaZ/1GbVxB1LwqmU=;
        b=UTGwmazCXbQumWsgrqmxzGkJYObGFKp0BdgUvjwRvx+3NxMx1ipyswDTCExpNHCgi6
         KcSPJNWu0tCsxzKb4GQvAanUmkQnnAu8Y0rQkY1C8MPaylV2pbJA1D2C3BxkKU7x9aC6
         aAzqky8En8rROOKKQmOs3Y8yxYj86weZOhHpxGPALiPVP/5Sdp8HOv3XW6llslkFhLwm
         OS4NEvpzo5UgH5IDQ+1WbcvWrZyS/BOI66cVHSNSIcRPZyKpSo44v63Au9vuyzYO2bO/
         jl/LTRo3CGpWP19ptCvw55z+/v3xOP/shuE2+UHhjm3IqbziwsOfr9kIOjG6y4GhQVp4
         1zaQ==
X-Gm-Message-State: AOAM533eTD6SWkro2agpLnWUobJKny/uY1Y3cKronnVUUD4hwEn/JZk0
        Al17d4flw1xqXQzivBm8+Q==
X-Google-Smtp-Source: ABdhPJxgZaL5SD4gaWXd8v56SfoClWh4a33Ndl4BlNRGi8GjN/yavq2FKoRcSUO4Ngsvgdb9kU23oA==
X-Received: by 2002:a05:6602:2bf7:: with SMTP id d23mr1296ioy.107.1626110489553;
        Mon, 12 Jul 2021 10:21:29 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p10sm5936450ilh.57.2021.07.12.10.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 10:21:28 -0700 (PDT)
Received: (nullmailer pid 2141524 invoked by uid 1000);
        Mon, 12 Jul 2021 17:21:23 -0000
Date:   Mon, 12 Jul 2021 11:21:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        linux-kernel@vger.kernel.org, junkpainting@gmail.com,
        alistair23@gmail.com, ping.cheng@wacom.com, kernel@pengutronix.de,
        linux-imx@nxp.com, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/9] dt-bindings: Add Wacom to vendor bindings
Message-ID: <20210712172123.GA2141477@robh.at.kernel.org>
References: <20210708115853.281-1-alistair@alistair23.me>
 <20210708115853.281-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708115853.281-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 08 Jul 2021 21:58:45 +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
