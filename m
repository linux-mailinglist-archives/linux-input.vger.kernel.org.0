Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3D6F9F45
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 01:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbfKMA27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Nov 2019 19:28:59 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40566 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726910AbfKMA27 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Nov 2019 19:28:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id r4so304422pfl.7;
        Tue, 12 Nov 2019 16:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+6UC38FlfW6zBWqP8BAp6EAB/UtH52S4xyRIOBRxva8=;
        b=LFGJxtSwbt9JzGE/xXosvMO7laOZYSPpwiN09NttkUsf5L8bmiWKNl2/h0gCrFuF4u
         jkvvUyVKXZU8RR4dkfJDb0AI6tr6No7bkPhpCFsjqNPRhtW67RILNEG57HFtAc73mCt6
         LwQ2zN1p0j5leWQ32VBYUD1iptQ4gRze9qWnWWLNCeQtloH2vw0Fk0YRBRX6YcM5adk9
         qWvNk6812po+/DoqGJF+8M31NqJABipwex6QaeE+UptkcRoA+/wslhyLEXLtDGgtuxSR
         EUWS3TyRCY8umC7f+MzZvNJrlD0VNsjh7BFsyPlLzGVLULpMgFd5751Ixqvy3QcxGdtd
         iLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+6UC38FlfW6zBWqP8BAp6EAB/UtH52S4xyRIOBRxva8=;
        b=N+Ab+GUPMR9sSjcKX58e7BzPNy3m9cYSXbD+w7KWhiv5kR1PR2Mab+M2bf1sMx5rL3
         c4Srg5MXNS9LoxNykC9X3AlJe1hypkCyCkx+z3LZcku9bPnDvdA+Z2H7+G4t0KMtZDrk
         KCyoQPwhigTb6eoGnDDiUo8aSAAEb/2NEPt996PPZFGVmIpdH4IJOPHo77OktliSzCMl
         N6ksyzj7VZt6zGC8h0Y4XKjq1kEm8crD5WNC15U3uGcwHLSi4UqxMJ/OvaradmhL/jWo
         psb64w4RB2YI+23dDQyTKHw+QSv8WuhBYjYlyj5yl1dr7sQxfjTcbBlKOQs9o3xb2X8c
         vWLw==
X-Gm-Message-State: APjAAAWUPw4sobqFQ8Zr7bGEf5BCy8j7K9rbPoxbUrCtCvxQZSuyTwet
        jzGxV2q6nmv8j/5mPm4KSTU=
X-Google-Smtp-Source: APXvYqyUzu+U1GfY1fNa0qvrlGs3rQh80Mma2kbykoPxWn+oth422zw7pgkjdXPHPS777vRbnDbunQ==
X-Received: by 2002:a65:46c1:: with SMTP id n1mr339639pgr.257.1573604938058;
        Tue, 12 Nov 2019 16:28:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y24sm132709pfr.116.2019.11.12.16.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 16:28:57 -0800 (PST)
Date:   Tue, 12 Nov 2019 16:28:55 -0800
From:   rokhov <dmitry.torokhov@gmail.com>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Armijn Hemel <armijn@tjaldur.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: ar1021: fix typo in preprocessor macro name
Message-ID: <20191113002855.GK13374@dtor-ws>
References: <1573211947-660-1-git-send-email-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573211947-660-1-git-send-email-f.suligoi@asem.it>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 08, 2019 at 12:19:07PM +0100, Flavio Suligoi wrote:
> Fix spelling mistake.
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Applied, thank you.

> ---
>  drivers/input/touchscreen/ar1021_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
> index 28644f3..c0d5c24 100644
> --- a/drivers/input/touchscreen/ar1021_i2c.c
> +++ b/drivers/input/touchscreen/ar1021_i2c.c
> @@ -13,7 +13,7 @@
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
>  
> -#define AR1021_TOCUH_PKG_SIZE	5
> +#define AR1021_TOUCH_PKG_SIZE	5
>  
>  #define AR1021_MAX_X	4095
>  #define AR1021_MAX_Y	4095
> @@ -25,7 +25,7 @@
>  struct ar1021_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> -	u8 data[AR1021_TOCUH_PKG_SIZE];
> +	u8 data[AR1021_TOUCH_PKG_SIZE];
>  };
>  
>  static irqreturn_t ar1021_i2c_irq(int irq, void *dev_id)
> -- 
> 2.7.4
> 

-- 
Dmitry
