Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E54679456
	for <lists+linux-input@lfdr.de>; Tue, 24 Jan 2023 10:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbjAXJjY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Jan 2023 04:39:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232143AbjAXJjX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Jan 2023 04:39:23 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B362122
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:39:21 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id r2so13244949wrv.7
        for <linux-input@vger.kernel.org>; Tue, 24 Jan 2023 01:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLePn8OhuoaUv9PDQtjAVG0l1fLO1cf500iV63vkUrE=;
        b=QmfWCWG8Pmgw8kt6n3fI1lmG1Qvz7FH2Y9ViymvvEv/zi0IRwfXZ7QjJWjmeBex6lE
         z11Jn0rlygTupp/CFeSp390aIr51QcpG2pumgZRqtfxic2hzn1b0MojvSGl8gT8zbFyC
         l0MZPUE470Yt3V5KP9W5LyHnm4+/B1swlh6swh9GQNJ7rdUGZvF6f97owQuWI5+6cnxI
         BEwbaN9//98pEssrY++a7a+56xEzguxLloBiSVsOI3CsMW49GwS8DLKKPD+7dzExlpX8
         7LzuTj40ovsFu+PfYM4gQDTpMRsNXkoUtBb0wQyBdnoQCiNGFwDXBDs/WAEamNc5vHy4
         BR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLePn8OhuoaUv9PDQtjAVG0l1fLO1cf500iV63vkUrE=;
        b=FGmDeErWnrLvdKeMbvPj8ql3dR8agLvTn3dpLD/5UYDgKPc/zQ+i3J1VhjmsMBrIPw
         jnLppyCh7Uw0nFXP777inVpH0HRHSpj53VfgtU5JfDbkZXOsvS0lYD/Zit8YBdpuPqOI
         OgRqR7LktWITFbpsf/cLgVfSI1lsGF4C9/IX6uw590W6Hudw0HiBWxhsbCAmAXvNxHRQ
         C++RFgsyJlEqqmy34IHXn0f8n10L4v8o4shBvHXDsCVQPqL1PsBYPiv4sTlNl5rPlohN
         ipwuolHe6Fh3A6nZM2t0jLHbADgWHCVQutOmJ28lRySth6JE7Fs7R5gfPkh2TBuDmtOv
         nEIg==
X-Gm-Message-State: AFqh2kq6pmsl0zKKEexoXG5yvjXsoawi/b7JVyGrg7ZcdImJL5VrCp3O
        KS9dKYmSWEpsQa9dXLC+HLh9JA==
X-Google-Smtp-Source: AMrXdXsFf4FUuXCUISp01GCmAg0U6f3Km+wNpKSCYTtk7LXfPOfLQdApTh6o1bobyjsTrP2nVCpNdA==
X-Received: by 2002:a05:6000:a03:b0:244:48b3:d138 with SMTP id co3-20020a0560000a0300b0024448b3d138mr27432628wrb.54.1674553159307;
        Tue, 24 Jan 2023 01:39:19 -0800 (PST)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id w14-20020a5d608e000000b002bc84c55758sm1757545wrt.63.2023.01.24.01.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:39:18 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4: use correct function name in
 kernel-doc
In-Reply-To: <20230113063841.17191-1-rdunlap@infradead.org>
References: <20230113063841.17191-1-rdunlap@infradead.org>
Date:   Tue, 24 Jan 2023 10:38:15 +0100
Message-ID: <878rhs2ry0.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 12, 2023 at 22:38, Randy Dunlap <rdunlap@infradead.org> wrote:

> Use the correct function name in kernel-doc notation to prevent a warning:
>
> drivers/input/rmi4/rmi_bus.c:300: warning: expecting prototype for rmi_register_function_handler(). Prototype was for __rmi_register_function_handler() instead
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/rmi4/rmi_bus.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff -- a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
> --- a/drivers/input/rmi4/rmi_bus.c
> +++ b/drivers/input/rmi4/rmi_bus.c
> @@ -285,7 +285,7 @@ void rmi_unregister_function(struct rmi_
>  }
>  
>  /**
> - * rmi_register_function_handler - register a handler for an RMI function
> + * __rmi_register_function_handler - register a handler for an RMI function
>   * @handler: RMI handler that should be registered.
>   * @owner: pointer to module that implements the handler
>   * @mod_name: name of the module implementing the handler
