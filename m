Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15590549CE3
	for <lists+linux-input@lfdr.de>; Mon, 13 Jun 2022 21:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346966AbiFMTKc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jun 2022 15:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347992AbiFMTIC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jun 2022 15:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7BCFF40A31
        for <linux-input@vger.kernel.org>; Mon, 13 Jun 2022 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655139812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fUq9pFZSDadmVk03boD5Lfs99MFVLc7ZZBPzdHpEJy4=;
        b=EdHqp51nkjJUYrc8HT0yssaLGof3oEYcWg6HXm/nfRD7jgsqd2bJheLraHiZ38NmLjS6ql
        mLvGMHF51ESbx9JVer9BqXkqb8HBIrD06fAFThm2SUwsp7FHLuUFLhqO0dfo4M9rdd4S+/
        U2Zh4s9VQNKd7SzV90wFvzCpIydeUhk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-394-8ltcJ1AnO3Khta-TGdlsDw-1; Mon, 13 Jun 2022 13:03:31 -0400
X-MC-Unique: 8ltcJ1AnO3Khta-TGdlsDw-1
Received: by mail-wm1-f72.google.com with SMTP id l4-20020a05600c1d0400b0039c60535405so2750497wms.6
        for <linux-input@vger.kernel.org>; Mon, 13 Jun 2022 10:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fUq9pFZSDadmVk03boD5Lfs99MFVLc7ZZBPzdHpEJy4=;
        b=Q23xYvjuizXFm1tINhiYe72+sOIbKgJRb2nzXmMXFIC+Aa15SokXJlxfocKsu/wQIs
         P6hEvAhkPDAigdpNbz9sCjCq8jip3UD+/SmltpeUJut/GTfywVhOm1MatvDjb5PDZeSW
         rVqZTt0aRe4tbG+Jrf8bg26tccqWA4VHOBiFdsGf8UbQFmk9gOMypA15Bvtynb7SKp8f
         9ZbZPnAIdYqqnDytSOR03Nr4zQDvhfXI4R3Kn/KOZNhhpoRkd6XJ2+hM8uvr1P0PRgTF
         JJ9evZWkC1NqvB2aimticQKDirXVjuDiLUUWB/tVITX/f8uKySGKxH6zgjfHAN2Yw8mY
         RrFw==
X-Gm-Message-State: AJIora/iW/zM07HtYD0K950YVeF83bwwEugGlj/3iIUi+EIR6Kfv7asy
        UxH9kvB9URZpErd1Vk/mmeNBywtMPirgd9dVeT7BMoySQrX7qHdUNaQLjtA1ggXHHGj/e0DVrLF
        nzi7sbDBoOhGf0fkrplaqyR4=
X-Received: by 2002:adf:f884:0:b0:21a:6a:7b55 with SMTP id u4-20020adff884000000b0021a006a7b55mr775028wrp.376.1655139809911;
        Mon, 13 Jun 2022 10:03:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sZbsH9u0jLeVZOvKYUuyiZI0HIICoNcQV7elyO/gGJMR8TrrYM8yJgqDTeUXeLYQ5cFezuDQ==
X-Received: by 2002:adf:f884:0:b0:21a:6a:7b55 with SMTP id u4-20020adff884000000b0021a006a7b55mr775009wrp.376.1655139809714;
        Mon, 13 Jun 2022 10:03:29 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020adff501000000b002117ef160fbsm9181808wro.21.2022.06.13.10.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 10:03:29 -0700 (PDT)
Message-ID: <35855854-7fbd-e622-c2ac-9f5b30809b0d@redhat.com>
Date:   Mon, 13 Jun 2022 19:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] input: misc: rk805-pwrkey: Fix module autoloading
Content-Language: en-US
To:     Peter Robinson <pbrobinson@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joseph Chen <chenjh@rock-chips.com>,
        linux-input@vger.kernel.org
References: <20220612225437.3628788-1-pbrobinson@gmail.com>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220612225437.3628788-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Peter,

On 6/13/22 00:54, Peter Robinson wrote:
> Add the module alias so the rk805-pwrkey driver will
> autoload when built as a module.
> 
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

