Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF801A3C46
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 00:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgDIWPJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 18:15:09 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36290 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgDIWPJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 18:15:09 -0400
Received: by mail-pf1-f195.google.com with SMTP id n10so186738pff.3;
        Thu, 09 Apr 2020 15:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ujIvz9GcBjbJuHCPIeZlZ7rRjsp8syypvJqphKFEdJE=;
        b=bxJf7lMTyc82+mfaQpWqRniXABYCY4giiTtvZqjIyeftjGKiIT9KnIVVZWVOi7LL36
         djimTInYz+dOuBxZZl957si303OdBIQtk1T2xEdoq2hHcwS+bw1h6TOicDMsvswouiuk
         1OT/RdrMGIlAGwSKmNMnDP47xbaR0ovqQu22WOZOXms2NvIHBj8Ja/FGFznJdmoklKo1
         NmGGIOEjxWzy/9I5wKtnQa7eSvwO0y1gE7KYLwbl5iVvAk9dOTDM6I7PerlR9GQQ8lQk
         AUyMK4yCwtZHcIFh9Oq4udFSWareLdhwaq/CXEZdkx9Yv7nQlADYpkNEQZpFR67z1AFU
         gcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ujIvz9GcBjbJuHCPIeZlZ7rRjsp8syypvJqphKFEdJE=;
        b=lquQ0ZuYyz3RFfeCf0NoP+Ef7JGXcLaL/MQJJmVl3has4pieo08qwYiPPjlxcYtwKd
         O6eO83ABdD2RMGNeYcGrqVbJx/kryFMeVT53zhoLZh5fRHGw7xLANbXyTIsG3pXecDFG
         ZGoPyupJnHUTk5Zc9lqinoV0RjAEZeXpaCCcdkawD9s00tQhhtUGEn5P9UOG+B2hVFex
         OIJ6QoBvgEaeFzdUD+3rGZ6E2d9pZV9g6klQb0Vji7EaBiSK1hYGB/Cg2srEF3UYeQnI
         lJrjt/Y6InXkJxaZ6qCa9t0ubQn2l4zBWfndN/SDw2mMJpKM4O7QmFpSrA3qCZWsdRNm
         Pvsg==
X-Gm-Message-State: AGi0PuZ2K2XyouablEY2ZfTVxeqqNI1U0DxOjxYmT7LRbxF7IpWJKlO2
        dqHWPKZR5hslZuyWacpD7Pc=
X-Google-Smtp-Source: APiQypInhl9ZwTmwR4A+ZU5hQ66TzyPv70UkR4VTu5xufs/7Xigf6TeCLde4qQvqyvr889CSdFk5GA==
X-Received: by 2002:aa7:96b2:: with SMTP id g18mr1877611pfk.221.1586470506825;
        Thu, 09 Apr 2020 15:15:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m29sm107299pgl.35.2020.04.09.15.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 15:15:06 -0700 (PDT)
Date:   Thu, 9 Apr 2020 15:15:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] Input: mms114 - add support for mms345l
Message-ID: <20200409221503.GS75430@dtor-ws>
References: <20200405170904.61512-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200405170904.61512-1-stephan@gerhold.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

On Sun, Apr 05, 2020 at 07:09:03PM +0200, Stephan Gerhold wrote:
> MMS345L is another first generation touch screen from Melfas,
> which uses the same registers as MMS152.
> 
> However, using I2C_M_NOSTART for it causes errors when reading:
> 
> 	i2c i2c-0: sendbytes: NAK bailout.
> 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> 
> The driver works fine as soon as I2C_M_NOSTART is removed.
> 
> Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> only for MMS114 and MMS152.
> 
> Reviewed-by: Andi Shyti <andi@etezian.org>
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>

Sorry for sitting on this for so long. I looked around, and I think that
instead of adding separate handling for 345L we shoudl simply drop the
"no start" bit for everyone. I am not sure what the original version
tried to do here, as far as I can see in various public Android trees the
driver for these devices does not use I2C_M_NOSTART.

Actually, I wonder if the difference is not in the touch controller that
is being used, but rather in the I2C controller the device in connected
to.

I would like to apply the version of the patch below.

Thanks.

-- 
Dmitry


Input: mms114 - fix handling of mms345l

From: Stephan Gerhold <stephan@gerhold.net>

MMS345L is another first generation touch screen from Melfas,
which uses the same registers as MMS152.

However, using I2C_M_NOSTART for it causes errors when reading:

	i2c i2c-0: sendbytes: NAK bailout.
	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)

The driver works fine as soon as I2C_M_NOSTART is removed.

Reviewed-by: Andi Shyti <andi@etezian.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Link: https://lore.kernel.org/r/20200405170904.61512-1-stephan@gerhold.net
Patchwork-Id: 11474771
[dtor: removed separate mms345l handling, made everyone use standard
transfer mode, propagated the 10bit addressing flag to the read part of the
transfer as well.]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/mms114.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 69c6d559eeb0..2ef1adaed9af 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -91,15 +91,15 @@ static int __mms114_read_reg(struct mms114_data *data, unsigned int reg,
 	if (reg <= MMS114_MODE_CONTROL && reg + len > MMS114_MODE_CONTROL)
 		BUG();
 
-	/* Write register: use repeated start */
+	/* Write register */
 	xfer[0].addr = client->addr;
-	xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
+	xfer[0].flags = client->flags & I2C_M_TEN;
 	xfer[0].len = 1;
 	xfer[0].buf = &buf;
 
 	/* Read data */
 	xfer[1].addr = client->addr;
-	xfer[1].flags = I2C_M_RD;
+	xfer[1].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
@@ -428,10 +428,8 @@ static int mms114_probe(struct i2c_client *client,
 	const void *match_data;
 	int error;
 
-	if (!i2c_check_functionality(client->adapter,
-				I2C_FUNC_PROTOCOL_MANGLING)) {
-		dev_err(&client->dev,
-			"Need i2c bus that supports protocol mangling\n");
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "Not supported I2C adapter\n");
 		return -ENODEV;
 	}
 
