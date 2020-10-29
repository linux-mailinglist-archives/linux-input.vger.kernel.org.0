Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6E729F07B
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 16:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728229AbgJ2Pu4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 11:50:56 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:35305 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgJ2Pu4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 11:50:56 -0400
Received: by mail-oo1-f68.google.com with SMTP id n16so822810ooj.2;
        Thu, 29 Oct 2020 08:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iNrItceSx1kMGmkUqnj6iHlC9+yjJU/megR871MH1s4=;
        b=mCQ/VPJSZmlk+GktZFGxZGnhRM42IVSV/lBJEavqslAbikCQ6RvOaqtct7sUcJdl4/
         CXknJi2+ZlyiTpF60mzmrgyI4vE/q/vODWDxa2iukxZZF7lz5g0rdQINF3OMd7AiYnqS
         wuirLazlhAiP48Y0h2yPh9o0Oj0hlT5jt+ggptBGIm7fSAbRQdKuOjvbHTZ+xevSbRzV
         a8CqQ1lkNIj9lnzsp+zL8xAw5fcoy9VH3pvyspKnCwNoBBADKVmaU72zZrYfNi8H3FFM
         Vr7cts2GEGtiCauLweBUM3a0zTcQV5ifi+eLsIaDZGzAsdgul6/BY4WlBpKMo46bLuJC
         RRhg==
X-Gm-Message-State: AOAM531EhCHPLER39hYPS3qZ3o09XCsce34DC5gRu3mWEow201XTwCVO
        EZe67CaGySTHYYDqjoR/nQ==
X-Google-Smtp-Source: ABdhPJyTP+mCicpc5AnG/HZYKCTQJtVyQOPkORFZReqYr/zd44XZQERaPinW/ElNg0S3NKukxqwgHA==
X-Received: by 2002:a4a:c302:: with SMTP id c2mr3725486ooq.26.1603986655094;
        Thu, 29 Oct 2020 08:50:55 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r21sm157018otc.0.2020.10.29.08.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 08:50:54 -0700 (PDT)
Received: (nullmailer pid 1937485 invoked by uid 1000);
        Thu, 29 Oct 2020 15:50:53 -0000
Date:   Thu, 29 Oct 2020 10:50:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     robh+dt@kernel.org, konradybcio@gmail.com,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        priv.luk@gmail.com, marijns95@gmail.com,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        andy.shevchenko@gmail.com, rydberg@bitmath.org,
        martin.botka1@gmail.com, krzk@kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v9 1/3] dt-bindings: Add vendor prefix for Novatek
 Microelectronics Corp.
Message-ID: <20201029155053.GA1936493@bogus>
References: <20201028221302.66583-1-kholk11@gmail.com>
 <20201028221302.66583-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028221302.66583-2-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 28 Oct 2020 23:13:00 +0100, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add prefix for Novatek Microelectronics Corp.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

