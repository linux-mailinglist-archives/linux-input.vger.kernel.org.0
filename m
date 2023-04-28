Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C98DB6F1C59
	for <lists+linux-input@lfdr.de>; Fri, 28 Apr 2023 18:12:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjD1QM3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Apr 2023 12:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjD1QM2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Apr 2023 12:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4874D5249
        for <linux-input@vger.kernel.org>; Fri, 28 Apr 2023 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682698306;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xvahxQLiQFCmxj/da0CErLJVS9PB2G5zFVCmECHMB00=;
        b=Y/45Jo+2OqMeKQ2FUxoXtJDp5J77OfD/W/pGFoRhlHhZ8kwh9tw1NFoUviWZ1rM3dPyIom
        0RrqHkfbeT0iZ7BTDuy54zTXYza+QleabWsoqwZ3ariZm+xvDXBGYkEf9gmZ+S8ald6j5m
        52PAh5N3b3QebVYziRIT2kZAPwTkRT8=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-ICk_qOZDNo66oGCw8Jai0g-1; Fri, 28 Apr 2023 12:11:31 -0400
X-MC-Unique: ICk_qOZDNo66oGCw8Jai0g-1
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-b9a79db4e7fso2620537276.0
        for <linux-input@vger.kernel.org>; Fri, 28 Apr 2023 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682698290; x=1685290290;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvahxQLiQFCmxj/da0CErLJVS9PB2G5zFVCmECHMB00=;
        b=HLAuUHi09rvDXuq2O3K/eUW2l/MZfXdCKbVN8xw5RYMu1Zj1d++IRskN8yP/dfI5JZ
         wBL6RbDHKVClGStpI2A7WZpubSfYxFB4F69rNZC6WAMI6avpQA4UKWGtqEBEO38GFg4K
         an5tRGiYKG/5mPnqs4e/LqG4fmmu9/OgTBRxobX+JfOMg2i39mUoOydBPIc7u1JOL9jm
         NCEoNvWZAZL+uG2u41JZcKgRUKRRJjJNiqvhagFYnOq++IkQcbelz/LF2zd/0CjBAOxd
         4sXDVg+2CD18//i3QBfHSumDRb6/QX3NcEiBm3lGuvt7VszPvKSxXXW6Fkiw4QvTPMqY
         P/RA==
X-Gm-Message-State: AC+VfDyZdMz9C0raSCQZtYh7lblz7uykFDz4njflBwghllP06PQvJTfd
        XEnlf4SzSS2tD7Z7e3Oickmq6AKu7fK3f6JmjByZJoSry8Oqw8JjplCF5oMsP5Mjf/EVxcSuXTX
        jkf3KIAqXN9eODnX55ndFqys=
X-Received: by 2002:a0d:e781:0:b0:54f:7971:4f87 with SMTP id q123-20020a0de781000000b0054f79714f87mr4293696ywe.36.1682698290454;
        Fri, 28 Apr 2023 09:11:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6eQOValmuJ/zOGLy7XBJvtcPQGnD4pUgv35/t3W92dQB8jJAbCq53fx3gGDoRQ4+mPyAlOcw==
X-Received: by 2002:a0d:e781:0:b0:54f:7971:4f87 with SMTP id q123-20020a0de781000000b0054f79714f87mr4293686ywe.36.1682698290218;
        Fri, 28 Apr 2023 09:11:30 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id d190-20020a0df4c7000000b0054fcbf35b94sm5497442ywf.87.2023.04.28.09.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 09:11:29 -0700 (PDT)
Date:   Fri, 28 Apr 2023 12:11:27 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] Input: pwm-vibra - add support for enable GPIO
Message-ID: <ZEvwL69i2Wzdoagt@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-3-e87eeb94da51@z3ntu.xyz>
 <ZEsFV6F4CEh2/av8@x1>
 <8250064.NyiUUSuA9g@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8250064.NyiUUSuA9g@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 28, 2023 at 06:06:20PM +0200, Luca Weiss wrote:
> On Freitag, 28. April 2023 01:29:27 CEST Brian Masney wrote:
> > Take a look at dev_err_probe() to remove the -EPROBE_DEFER check.
> 
> The input subsystem doesn't like dev_err_probe for some reason, you should 
> quickly find examples of that being rejected on the mailing list (or see   
> "git grep dev_err_probe drivers/input/")

OK, that's fine then. Feel free to include my Reviewed-by.

Brian

