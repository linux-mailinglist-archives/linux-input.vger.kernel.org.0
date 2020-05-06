Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B24E1C64DA
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 02:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729603AbgEFAIl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 20:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728642AbgEFAIl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 20:08:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D169C061A0F;
        Tue,  5 May 2020 17:08:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id v63so91480pfb.10;
        Tue, 05 May 2020 17:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QFGJdIdUd6NUXC1ZHECnuWqkthSdUxvUFmMdn3gACEE=;
        b=HRCEs4EhrAqAXHsr0ImCIuBZoEc3aWfUDEY3weOpTde1339ZNl5M1C8w7CWzpKSYu9
         w5d2it+CuWhkFz1TuYdXPqGX1XZj3uGwNGT2s281Vg4I634g6nTt9QXZakx9DegF4Bsm
         u6SHxwUYN2hr2GufMMJNxzjhBdcDfu8KOpnXLyFp3nh0EIEO+lBn5gCJzq4m9pMxGgYt
         qpJgjGHCF7mQ701QZpLMqaXo2ABku/4gWrU2WqmutNLLoR8QYNSKAiaHTpqAamEKePLJ
         ajVZDP0Na7hARj147zx/lmd8GAMidsQrUbVb5+d7m0JOHvZfujBBm9Dw9pIsFTQS59OC
         HOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QFGJdIdUd6NUXC1ZHECnuWqkthSdUxvUFmMdn3gACEE=;
        b=Pp92XTzR+WTtyyptVPKonSANE7Xyq32MUhb75MHE7fsyB2TOb5x0zV6MRsi5umABLT
         AMdHy5Eho1sxuYAREyh8cqOeBAEgumxO5RLIhF00C2iEPLEJ93422uNXr2UZ8g0PwwG9
         ggQHbjE6Bej/Zvz1JlfrCTsYQXl7r1yT3qRKkzttAPZVQ918l8lOIGWhtAayIq9Ffn3x
         KkCtl+VUNw9mKtC0DzJmpayY5ZBvQFFLNq5w9gO6Hh+ejSiFaNxJSnzRqny45L5XJw4n
         aei3qpD92AjXRSCQAu+JmcAQ5NlupneNOZteVhRE6xtJaW0kN7lXg76rfRCQnNKJM4qP
         hhug==
X-Gm-Message-State: AGi0PublJhuZXbkDxDYBbcrCZpuy6ZZTM11x4EaUNdUA3b3bK7CEcrlj
        8WVGeH3bsYnvEEd7/xc6INE=
X-Google-Smtp-Source: APiQypKSbrUwOjOd161Efeu0hYnppBpwMnjdsK3GuHpmNRed+3SPFzKkQ/6Ylm7PSvg536tOLbC9TQ==
X-Received: by 2002:aa7:9832:: with SMTP id q18mr5790073pfl.179.1588723720455;
        Tue, 05 May 2020 17:08:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 184sm136054pfy.144.2020.05.05.17.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:08:39 -0700 (PDT)
Date:   Tue, 5 May 2020 17:08:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Dell Wyse 3020 Power Button
 binding
Message-ID: <20200506000837.GB70193@dtor-ws>
References: <20200503201237.413864-1-lkundrak@v3.sk>
 <20200503201237.413864-2-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200503201237.413864-2-lkundrak@v3.sk>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lubomir,

On Sun, May 03, 2020 at 10:12:36PM +0200, Lubomir Rintel wrote:
> Add binding document for the Dell Wyse 3020 a.k.a. "Ariel" Power Button.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Are there any changes compared to the version Rob has acked?

Thanks.

-- 
Dmitry
