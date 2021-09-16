Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F4E40EAE0
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 21:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbhIPTfw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 15:35:52 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:35678
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232006AbhIPTfw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 15:35:52 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7FEF33F306
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 19:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631820870;
        bh=mgBzE1LccxDYj5lbzdu52/SrN6CKyxSxvBGDAYwYTWI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=t4uzkFoBLeJqjueC9Sw/uMqb28enUwVVWiyC+pVZ8l0aq+7g9TRDjL3tmsgSGuXhC
         MRt5ak+YnABe+wwRYyvKFskWrcSbbXfPom7+WHF1UObmCpnIVidnoPfrqCE6Musyc9
         f3DqlPzlOkaiI0ZunF/R+KciwRRR0m3HbPgTU2w9dJOp+lInbD2mW7Ic/FYcY15Azh
         QoQsMStuGbn6eX4tWxxPqDlqEVlTS0aHuh349BS/k3GEZoVKN4wEfJ8Z9GqiGBfvkv
         PhL+fKzyeVUOdne6nLO/SNRwCfhnhSxXHBjEzi/6Qba8enJSm3MIitUj6IbjSG8RbN
         +ghcFitKCdArw==
Received: by mail-wr1-f70.google.com with SMTP id e1-20020adfa741000000b0015e424fdd01so2353786wrd.11
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 12:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mgBzE1LccxDYj5lbzdu52/SrN6CKyxSxvBGDAYwYTWI=;
        b=bk74zbBwxRiSGoykx916IgmelLD2z5FkWwU6Vx4sSwUYJh/AbEt9lpkeVylL8c/UWP
         Iay918fVCVHezysyJDhhriSrVnZxT+hTP8xMRYpOhpBGeD6uvUq+HsKO4mujV5E7ICH2
         /3v13tcjDQqMMRCkTE09rkO+fxfDd2JnNZAyoNAiB5wqfZ0g7WIaxtjMHupSLlZKublV
         bob20y/VEmqFgwt91n4t40DMLLqCJncFJ6e7QODe/nOxRrLnhDHDVU9cAeI1vvv4Yu6W
         WI5D+pxBqofvZ+rATaCJp9KiDFtnBz55PGOFDNUzx/dyvwblJcNRg4GbRq/Cf70vvIPa
         25Sw==
X-Gm-Message-State: AOAM530brGVBQ5tYAz+Hp3JSk3uZkCrXKBG3ltsuitWHIgUpdINma/Sw
        sikK3EZvbEtr2K8KdxiIXjTtWI685bCJBDL4YyaOCUfw4oEymdIC11a5sGsJ3dM+Qq8GfTggP47
        3cODjcjEFMb2neQzBigRYNYzuFEonfmst33STSgqo
X-Received: by 2002:adf:c7d1:: with SMTP id y17mr7857899wrg.214.1631820870031;
        Thu, 16 Sep 2021 12:34:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyf+0GFj++u7lbh268H6UF7ugAOIgIOijp92MKCOwUmdhzxURij/a+4xLLMmGgonQR4a46H6w==
X-Received: by 2002:adf:c7d1:: with SMTP id y17mr7857885wrg.214.1631820869817;
        Thu, 16 Sep 2021 12:34:29 -0700 (PDT)
Received: from [192.168.2.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id l19sm4284252wrc.16.2021.09.16.12.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 12:34:28 -0700 (PDT)
Subject: Re: [PATCH] Input: ads7846 - Make use of the helper function
 dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916153104.13727-1-caihuoqing@baidu.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <922265b2-bed7-8daa-3132-8cfc3b5e50fd@canonical.com>
Date:   Thu, 16 Sep 2021 21:34:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916153104.13727-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/09/2021 17:31, Cai Huoqing wrote:
> When possible use dev_err_probe help to properly deal with the
> PROBE_DEFER error, the benefit is that DEFER issue will be logged
> in the devices_deferred debugfs file.
> Using dev_err_probe() can reduce code size, and the error value
> gets printed.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/input/touchscreen/ads7846.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)

You sent 32 independent patches. Do you expect us to copy-paste similar
feedback on each of them? This would not make any sense. Please organize
all your submissions in a series with:

  git format-patch -32
  git send-email ..... 00*

The patches you sent were already sent before:
https://lore.kernel.org/lkml/20200827185829.30096-1-krzk@kernel.org/

Best regards,
Krzysztof
