Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 299922B4C2A
	for <lists+linux-input@lfdr.de>; Mon, 16 Nov 2020 18:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731170AbgKPRIF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 12:08:05 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45987 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730296AbgKPRIE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 12:08:04 -0500
Received: by mail-ot1-f65.google.com with SMTP id k3so16660703otp.12;
        Mon, 16 Nov 2020 09:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c3PlGZKvnThBeL4RGTXTVEITs5dMZKlSaeehmHdp/pc=;
        b=kE3iuuLd6qmdtEQpEPrYJWpCiTtMm1d4+y0Rs4GFv5BVDc026qfrKuPuETrI4sKoRO
         yR6W4GnZatM4clECyjECzCeS8ceVMQSfJ+kQhE2yzdzWbU87oKrms27IErBpzHEoWt47
         /QMIyhtUmQ+BkhNBnrtLbdHJ4MW672SVnc6OHCSRZl1sx/1/+E5s6wihtXFXgTKBVP+Z
         aErDVSswsBoptoIL5y0neEtZ/t0ff2t0yuoNa7Vj8Zxl37PFZonPhUVEf/IuKF3bawl7
         M+KBU20wCJq5wmRYlTMYFIcXrqRfz9jykUXGwS93Hf5CsKwvp/mr7iwm8A9uIXo3Ytpj
         YDxQ==
X-Gm-Message-State: AOAM530y8Eu545NLKL9IuZkyr/e2zTLi3HE3uoQ62X/M7N3o8SElz0wY
        rZairxiD1P+tRmSU8FflsaiqiqGfWQ==
X-Google-Smtp-Source: ABdhPJzUFz56wQhwLDmdiiVzcNi7NkZWZAkrS4xUmbyUhFvZTV6/JsRfeR+pIrYCE/s5+DqQTZsGZg==
X-Received: by 2002:a9d:3d06:: with SMTP id a6mr189293otc.368.1605546484043;
        Mon, 16 Nov 2020 09:08:04 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c190sm4881486oig.34.2020.11.16.09.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:08:03 -0800 (PST)
Received: (nullmailer pid 1815940 invoked by uid 1000);
        Mon, 16 Nov 2020 17:08:02 -0000
Date:   Mon, 16 Nov 2020 11:08:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Andrej Valek <andrej.valek@siemens.com>
Cc:     hadess@hadess.net, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        dmitry.torokhov@gmail.com, nick@shmanahar.org
Subject: Re: [PATCH v4 2/4] dt-bindings: touchscreen: goodix: add info about
 disabling FW loading
Message-ID: <20201116170802.GA1815910@bogus>
References: <20201029170313.25529-1-andrej.valek@siemens.com>
 <20201110181550.23853-3-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201110181550.23853-3-andrej.valek@siemens.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Nov 2020 19:15:48 +0100, Andrej Valek wrote:
> Add information about option how to disable FW loading for each boot.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../devicetree/bindings/input/touchscreen/goodix.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
