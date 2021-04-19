Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71328363D2D
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhDSIRI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:17:08 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101]:40735 "EHLO
        smtpcmd10101.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232271AbhDSIRH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:17:07 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id YP54lgfxuSvjVYP55lMM7u; Mon, 19 Apr 2021 10:16:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618820195; bh=EgjvdP/tGfj217l54hOzQFhxxNRicPHj7+iUKb5Klzk=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=OdGiKazruJIOzO2Lw+iFZsKaL+ePF+h5fiuJ+4J2kXiwQJW1M3HJ6O1dLIvUFukYR
         e6QpVNABlg5iS1HBfloytPLpR+0vNQiYKk6p4solbGpDmhFLg1owlizCn5wEZrP0HI
         GLvW5wJ6uDDQNn0sIFbdN/3Y98yysEOGYTv3VE4W9G1Dw84PHRw2G+jFnsDLGBYggD
         QmgtAFoJz10fBUpJ0QBLZV/zNc5f7m3FQcq87t8m7lcN28iuuEuZbV6lStDE4aieoM
         ttyfJAJjfgiSxBKz25KzWds2eYSKTL7Aw8u50XI9uwINfYc0qnaFg0uwniRiguvtRX
         0/rbY5sZoY5Xw==
Subject: Re: [PATCH] MAINTAINERS: repair reference in HYCON HY46XX TOUCHSCREEN
 SUPPORT
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210419060023.3460-1-lukas.bulwahn@gmail.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <02ce3130-f86e-7a91-ba06-e79d96d7eab7@benettiengineering.com>
Date:   Mon, 19 Apr 2021 10:16:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210419060023.3460-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFBxJkjiGMfFM17OV5dn0SLigDntxG2hC2J3+yB/AC7MPEPD5xXgRLQ11iql2I2X3jqwoT5knCQpXDuf+J/zMGQGD13NUrXSbKT1wSPBxrlSZyf36BUG
 tYcsYv9QQDGsn5SvPQ7AtR7WFpoJ0wRrsYB+kShf7hno7mtDJ9dMTy1nRgM1qh7QOcHMp3pqz9cYJyXF14yN1FIzabScoPqREx0AI6/UYWgmAn/6Yos2he9v
 vtBsi1Fde9Y9An5JlXpVnwa8pLG8Advgzm6iwXroShhnpwlKHWXsXiPY7caVj93E0lTca4qG7p0ceNYFm4LKkziarb/gApSxo9gL/lpnLAggB7fRuRynkQcu
 gQQx6lY5JLnrb8Kk0HhxPHgy3MSKP8/8qqN2sS4mNC0pUaqDb60aqJpOAHD2w4tqe2diZcZyKjQCFoJDljMhhXKCP0rOMRhwzel8rh3de8OaS+UOpyn5mRBw
 +fR8xSpgLwZihyrb
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lukas,

thank you,

On 4/19/21 8:00 AM, Lukas Bulwahn wrote:
> Commit aa2f62cf211a ("Input: add driver for the Hycon HY46XX touchpanel
> series") adds the file ./drivers/input/touchscreen/hycon-hy46xx.c, but the
> file entry in MAINTAINERS refers to ./drivers/input/touchscreen/hy46xx.c.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>    warning: no file matches    F:    drivers/input/touchscreen/hy46xx.c
> 
> Repair the file entry by referring to the right location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> ---
> applies cleanly on next-20210419
> 
> Guilio, please ack.
> Dmitry, please pick this minor clean up patch for your -next tree.
> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c54b8e4520d1..bbe356508f29 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8425,7 +8425,7 @@ M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
>   L:	linux-input@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
> -F:	drivers/input/touchscreen/hy46xx.c
> +F:	drivers/input/touchscreen/hycon-hy46xx.c
>   
>   HYGON PROCESSOR SUPPORT
>   M:	Pu Wen <puwen@hygon.cn>
> 

