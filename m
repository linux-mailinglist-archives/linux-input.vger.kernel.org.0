Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887FC68DFA2
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 19:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjBGSND (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 13:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbjBGSNC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 13:13:02 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C957E3B0D0
        for <linux-input@vger.kernel.org>; Tue,  7 Feb 2023 10:13:00 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id r6so5983463ioj.5
        for <linux-input@vger.kernel.org>; Tue, 07 Feb 2023 10:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EZ45IrDKWNh1GNaH0rrm//oqvmlJdwek0NLAA12C2Vo=;
        b=T59XGzvemWTikM7hwUHfvZCLjUg5glA42NwS6JXky+FROsPYDZt3ETpCRj+yhMmtlq
         jG7gMn3L/yC6/WeestH3Je3lwsmD12d78g1J1RBSB0hSAaibXqOLuu37W+5LdoK0Wy3/
         j84c5/iCgZ5wE3MyUe7FJQGCvHElhfv6bznwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZ45IrDKWNh1GNaH0rrm//oqvmlJdwek0NLAA12C2Vo=;
        b=LfCWFZ39fRB1tek63aJy9xLjvfMH5X6EzxF4Rur4gRyquigAcWkhlztcECeZVVNMWK
         MeDPzLhNiuRgwIrtF7MW+1IgqQmIDfxsKyrzGpMhLZ9+ELYBNd9yHXes23YEFNt78Glt
         8RFXi5hi3oo5GNsMqkBfbB0X5tVxu7gv0nN0qGH49USwIJEvGXmCHFDTowsCNWsVF1oE
         WGPa7rdws6RfiLv5DqqmhErczp/HJYgiyySOHIphcjXoWL0ri+Vl0uERNXEhfX+hq6UY
         1Rm04WpSNbS3tU/0FXrob1FaQwdIr9lIcI9CQtjki4fl3rfu1lNTVvyB8qk69pLqBVUO
         pd3Q==
X-Gm-Message-State: AO0yUKVCXFYuyIwIGZU0ejkLV3Dh05J2jTk/5249QFTa9DfvV/l1Pza4
        TKCY1PjZfsEk4VmS9BxACSVV/g==
X-Google-Smtp-Source: AK7set/2CIz6vckraH4+UdivsUaT7YNmbbx2aeIn8vJA1GS+BD+ZOfrqFLZZ0fOBAu7/GBnr5etJzA==
X-Received: by 2002:a5d:97cc:0:b0:719:80c7:43c2 with SMTP id k12-20020a5d97cc000000b0071980c743c2mr3734058ios.9.1675793580147;
        Tue, 07 Feb 2023 10:13:00 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id c6-20020a92cf06000000b00313dda6b853sm818226ilo.39.2023.02.07.10.12.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 10:12:59 -0800 (PST)
Date:   Tue, 7 Feb 2023 18:12:59 +0000
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sc7280: On QCard, regulator L3C
 should be 1.8V
Message-ID: <Y+KUq8zc/kmtovVJ@google.com>
References: <20230207024816.525938-1-dianders@chromium.org>
 <20230206184744.1.I784f4b3d7e4a06edafff4a3129f52e749889bc05@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230206184744.1.I784f4b3d7e4a06edafff4a3129f52e749889bc05@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 06, 2023 at 06:48:10PM -0800, Douglas Anderson wrote:
> On the first sc7280 QCards the L3C rail was never really used for
> anything. Stuffing options on the QCard meant that the QCard itself
> didn't use this rail for anything. This rail did get sent to the
> mainboard, but no existing mainboards ever did anything with it other
> that route it to a testpoint.

nit: s/that/than/

no need to re-spin just for that

> On later sc7280 QCards, the L3C rail was repurposed. Instead of being
> a (nominally) 3.3V rail, it was decided to make it a 1.8V rail. It is
> now provided to the display connector (which might route it to the
> touchscreen) and also used to power some buffers relating to
> touchscreen IO. This rail is getting the additional tag "ts_avccio",
> though some places still refer to it as "vreg_l3c_3p0" despite the
> fact that the name now specifies the wrong voltage.
> 
> Since it never hurts for this rail to be 1.8V (even on old QCards /
> old boards), let's just change it to 1.8V across the board and add the
> extra "ts_avccio" moniker as a label in the device tree.
> 
> Future patches will start using this rail in their touchscreens.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
