Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27C357D42B
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 21:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233082AbiGUTcd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 15:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiGUTcb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 15:32:31 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD8A88F1E
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 12:32:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x91so3444617ede.1
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 12:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=qlna7oTiSptQ7tN0H9VSjBuiazrFsuWecl4k2lvsb0g=;
        b=Twx7iv2tqFO2oEMSg8BNkGJnpAOuCnv1dXyeAW2keYqRVKj4BXf8tLNVD9Y51NAlNW
         JATZxpN2f4bKRqgiIdyIKqbU+0IetenqL8lwvo2ra7u8VTX0dWbdnL4wrTjz/Jh5J50S
         q3Oeme5SKLgUF6Wpr/ZIALpQxpNR1ykUzZ1Oja4vh3WrttkCx4YecpJjDgiFufrRdYGQ
         9HtsbPLrXTdq6Bubq/G/POY2Xm3VkmUIDPvlPPaLecJvG++zkKvR2xoD0Q1q07o+Uog1
         y0OFn89twSkJRgJ8mahQ2gNgcdFDijHsFZLbPvFH15vw3dZXpRIoJFC4++6ntBXFtWiS
         Eccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=qlna7oTiSptQ7tN0H9VSjBuiazrFsuWecl4k2lvsb0g=;
        b=hpU6Wg5V5NNOLR4CvlZ1Ha2CZhhB+H80cHCl1je0zVEiQvMKdlIe7cHlZPd8eZ1gJ+
         eBsS/lVhRaQNeGXPe3XVbC/ViAi1oWwdYz9l/JS+t0kXSt4AYd3cwfpjboQOnoljmw/b
         iUB+mr2ruN/18oL0J0vPaDfLAW2P0j5WjC252/NERDWf3CYhzlg7zKeEBqZf5Pr1NA59
         ZUWWyDvo+iE1XnhSVOcam7vHu2ltg3hy/VvO7efI1r4VCH7Js0H0GztFMC6oWqR1BgO7
         b+qYvrBzBgns62lshw4ljUQwjFJM6dIPgPJUNYx9Gig19hPge97D9Kc30IDJnY1kd8D9
         vN+Q==
X-Gm-Message-State: AJIora/R6cRnB1zUC3hcITUy3VPup47xIX2GaYdHelWPkap57vgVLAeh
        j1DhVhgjmET7xeO7eWc/4nmRrmujd/Y=
X-Google-Smtp-Source: AGRyM1vhAjFUY+SHmpKjmxv+kpe4yopPhaeAUqnIQQ9oPn6Yl4zCvfc0uCNYpN1UI1LW36/NU1KNag==
X-Received: by 2002:a05:6402:34c8:b0:43b:c782:2419 with SMTP id w8-20020a05640234c800b0043bc7822419mr4570335edc.158.1658431948780;
        Thu, 21 Jul 2022 12:32:28 -0700 (PDT)
Received: from ?IPV6:2a02:168:575a:b00b:c379:f460:84c1:10b7? ([2a02:168:575a:b00b:c379:f460:84c1:10b7])
        by smtp.googlemail.com with ESMTPSA id 26-20020a170906319a00b00722f069fd40sm1128184ejy.159.2022.07.21.12.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 12:32:27 -0700 (PDT)
Message-ID: <92b162b8-40c1-c62d-85b1-ff7449ca17d3@gmail.com>
Date:   Thu, 21 Jul 2022 21:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Stylus battery reported as having 1% charge even though fully
 charged
Content-Language: en-US
To:     linux-input@vger.kernel.org
References: <5d775fec-1c42-927b-affd-c9f7d3c602a8@gmail.com>
 <28d18d2f39fef4da00021d21cf2ccd7eb4a29ac9.camel@hadess.net>
Cc:     Sebastian Arnhold <sebastian.arnhold387@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
From:   Gregor Riepl <onitake@gmail.com>
In-Reply-To: <28d18d2f39fef4da00021d21cf2ccd7eb4a29ac9.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


> You'll probably want to implement a patch similar to this one:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3193ea1b6779023334faa72b214ece457e02656

Does this mean that the driver doesn't support battery status reporting
for some devices, or is the feature simply missing in this controller?
