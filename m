Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A357D6189CE
	for <lists+linux-input@lfdr.de>; Thu,  3 Nov 2022 21:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbiKCUpu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Nov 2022 16:45:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiKCUpt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Nov 2022 16:45:49 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CAD1CFD2;
        Thu,  3 Nov 2022 13:45:49 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so2924876pjk.1;
        Thu, 03 Nov 2022 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TLGL+1sBhWgs2XefR8YTN33XJCg0oqxzr77Q79l6mlE=;
        b=fUHfb08ygdfQEamXM9zHbvfr3Gyk4DgXzrJGP6pYGyGx3iS25SGccmMiP28DUkdHOB
         CjDr2tcd+/XQUAtdx7AxrPd9/eqM40jnQH/s1otATz/lNkQvoh8Qx1ZSNGv0O0W94aut
         JyAR1fjH3oOBICyL/y/mkUq6jZX8BDtMOow3n43lqDuk1Xv7FQ0LJ3zs/VrhESgQz6N/
         1tZE85YD2KnzN4k5bAKYoM+EOoIwnr0mio77E9cq76crETR5G21vEp65EeG+DdahUKYj
         +I9byiyjxHOizx5z0IEdDc2jyYrXH1GbOO2XwXTQSrK+OcOInS4+XgdvFskKKBBh7/e3
         eYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLGL+1sBhWgs2XefR8YTN33XJCg0oqxzr77Q79l6mlE=;
        b=08DAcqyCDLYWrgI9pOy4A+hkkxDKta8P/pKjg0cPIc6ZxkeozdBW/2DKaP7Awae6MM
         ibbqPSp9wdAGTgquQtX5k5Czckyj4lpbfkVuYEfwzLuOIN81NpKdE6ZiChI86yUahHnZ
         Gh0VYMSoQAlfsi8LcSv7JdqtOc4H/+Jh8OE78YuBg7MK8kCNeBHbn7VnfSUDgIChbVfI
         YXJQt52OOfcwfhT95xbAOvn+U9J18gG9VNC6Y4pkeP842V7TT8oAPf08BwXnERA8UCBj
         D7b1pktFj8RGHG4oqmHprP7HtF1HrnnOBI41oGqg9JQfj6GTcHhOJB3MQUH9mm78H9CG
         eBUg==
X-Gm-Message-State: ACrzQf26MGiAfkFBmqbxKXO5iGRROjCqnt4zANC4Ncf4ErcoWe3zSQp6
        dVRg75vTOulEoaCT1LW90Q2gHo15T04=
X-Google-Smtp-Source: AMsMyM7nWdeDmd9380z+yPFUYDyp3AXPhjRf+v30Xcxkxakb97UmFBc2uzh1ldowGZg04rAeZ/xFkA==
X-Received: by 2002:a17:90a:e38b:b0:212:d42a:c0a9 with SMTP id b11-20020a17090ae38b00b00212d42ac0a9mr49817372pjz.179.1667508348480;
        Thu, 03 Nov 2022 13:45:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 76-20020a62194f000000b0056c3d3f5a8dsm1191648pfz.56.2022.11.03.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 13:45:47 -0700 (PDT)
Date:   Thu, 3 Nov 2022 13:45:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 8/9] dt-bindings: input: sun4i-lradc-keys: Add F1C100s
 compatible
Message-ID: <Y2QoeAo8bM7YYJJc@google.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
 <20221101141658.3631342-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101141658.3631342-9-andre.przywara@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 01, 2022 at 02:16:57PM +0000, Andre Przywara wrote:
> The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
> compatible to the version in other SoCs.
> The manual doesn't mention the ratio of the input voltage that is used,
> but comparing actual measurements with the values in the register
> suggests that it is 3/4 of Vref.
> 
> Add an F1C100s compatible string to the list, and pair it with the
> A83T fallback. Since the A64 is the same, combined both using an enum.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Applied, thank you.

-- 
Dmitry
