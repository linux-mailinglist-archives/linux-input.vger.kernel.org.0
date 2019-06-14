Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1879D46869
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 21:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfFNT40 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 15:56:26 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35172 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbfFNT40 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 15:56:26 -0400
Received: by mail-qt1-f193.google.com with SMTP id d23so3926039qto.2;
        Fri, 14 Jun 2019 12:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mgqg9Qp/GW7FbJr1PlYQp1Nxx2r3iqTaKl4BOq/b22c=;
        b=fEXfcBoU5C6/geBQ+wYivPAlqDCkvm7NW8Qo/th7OU7YIubTLO+Hpxb/KMaROrKwTl
         332+DKpzqahkICm0J6ueB+5Z0JpVL6nSrDtLo/phJOeET23cJRApV3D5QuyN3lkXrO/+
         CRYoPBWMMrjTeWC5UHmogFIHu1RNTGVEZZeQJKcli02EzigkEX/4E824RH1KW7P5KGI/
         JA9DV0y5L6pvgZAqdSA2wV/5hayHhIjaKrGIMwAmSj4NtXBfINSocF/YVcxm5qsJZjLP
         ALoentv0cLmv6F+FtPfLfKfVQXhbjP+Xq6lKM9a5PXf10Z4gy0jNPxKtM8G0CYe7jlRP
         TX6A==
X-Gm-Message-State: APjAAAX7sx+TziRSM5iGZEMLc0bW6xkMHTJcE8Bb9/b3Bqk+xvm/mj5w
        RSDXpnWbnfh1VhaL6UNv6Q==
X-Google-Smtp-Source: APXvYqyKx/fUFIdcWxu52k1qLnudSlVv2idg6LJ/bFETpbgV1XAAEPYdiEHIJeFCNPBrco/EJ57HLw==
X-Received: by 2002:ac8:22db:: with SMTP id g27mr82787629qta.221.1560542185162;
        Fri, 14 Jun 2019 12:56:25 -0700 (PDT)
Received: from localhost ([64.188.179.243])
        by smtp.gmail.com with ESMTPSA id z50sm2722502qtz.36.2019.06.14.12.56.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 12:56:24 -0700 (PDT)
Date:   Fri, 14 Jun 2019 13:56:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Leif Middelschulte <leif.middelschulte@klsmartin.com>
Cc:     dmitry.torokhov@gmail.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH 07/10] dt-bindings: input: touchscreen: stmpe: add axes
 inversion and swap
Message-ID: <20190614195623.GA5499@bogus>
References: <20190527160736.30569-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-1-leif.middelschulte@klsmartin.com>
 <20190527161938.31871-3-leif.middelschulte@klsmartin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527161938.31871-3-leif.middelschulte@klsmartin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 27, 2019 at 06:19:35PM +0200, Leif Middelschulte wrote:
> This driver too supports coordinate inversion on X,Y axes and
> axes swapping via the common properties defined in touchscreen.txt
> 
> Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/stmpe.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> index aee1abf06ddb..09d2d4f288cc 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/stmpe.txt
> @@ -42,6 +42,10 @@ Optional properties:
>  				The given window also affects the value range (limits) set
>  				within the input subsystem which, in turn, affects
>  				the input resolution calculation on both axes.
> +- touchscreen-inverted-x: X axis is inverted (boolean)
> +- touchscreen-inverted-y: Y axis is inverted (boolean)
> +- touchscreen-swapped-x-y: X and Y axis are swapped (boolean)
> +				Swapping is done after inverting the axis

Just reference common definition.

>  - touchscreen-x-mm	: horizontal length in mm of the touchscreen. It affects
>  				the input resolution calculation on the horizontal axis.
>  - touchscreen-y-mm	: vertical length in mm of the touchscreen. It affects
> -- 
> 2.21.0
> 
