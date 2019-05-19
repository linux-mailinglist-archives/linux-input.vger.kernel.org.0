Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E912422958
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 00:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbfESWey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 May 2019 18:34:54 -0400
Received: from p3plsmtpa08-06.prod.phx3.secureserver.net ([173.201.193.107]:50432
        "EHLO p3plsmtpa08-06.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726074AbfESWey (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 May 2019 18:34:54 -0400
Received: from labundy.com ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id SUOKhKtfx8XKZSUOLhk9ks; Sun, 19 May 2019 15:34:53 -0700
Date:   Sun, 19 May 2019 17:34:52 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Axel Lin <axel.lin@ingics.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs5xx - Remove redundant dev_set_drvdata call
Message-ID: <20190519223452.GA23823@labundy.com>
References: <20190519041148.32146-1-axel.lin@ingics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519041148.32146-1-axel.lin@ingics.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CMAE-Envelope: MS4wfEcIOlSYrGbrrRT/90CAbrhZIrkfsJJIWPmZSkEziBheAAUwEJgZiO4YvNnE4WbRJ16oJ3yLuW2TfCPK0gzv65ixFJjwOHT4PIxjYlDiQf9USQcvm0bn
 TjLCqQiVJMW4oOc9BsR7ThEf/fs9/csN/xulhNev+CcZgfePa2P7DTRn2Vn5NqkEJN7TLMPYrLUKFe+bymYYFwUHqgjKUqwCjBlGlBuffxq2yKmgQL2Zel7G
 SMIcDjmW2YKpOsS4p1p0tg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Axel,

On Sun, May 19, 2019 at 12:11:48PM +0800, Axel Lin wrote:
> Calling i2c_set_clientdata() is enough.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/input/touchscreen/iqs5xx.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> index b832fe062645..158707897c2d 100644
> --- a/drivers/input/touchscreen/iqs5xx.c
> +++ b/drivers/input/touchscreen/iqs5xx.c
> @@ -1054,8 +1054,6 @@ static int iqs5xx_probe(struct i2c_client *client,
>  	if (!iqs5xx)
>  		return -ENOMEM;
>  
> -	dev_set_drvdata(&client->dev, iqs5xx);
> -
>  	i2c_set_clientdata(client, iqs5xx);
>  	iqs5xx->client = client;
>  
> -- 
> 2.20.1
> 
> 

Thank you for spotting this.

Acked-by: Jeff LaBundy <jeff@labundy.com>

Thanks,
Jeff L.

