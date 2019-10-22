Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C245ADFC2A
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 05:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730370AbfJVDVo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 23:21:44 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37154 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730156AbfJVDVo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 23:21:44 -0400
Received: by mail-pl1-f193.google.com with SMTP id u20so7642945plq.4
        for <linux-input@vger.kernel.org>; Mon, 21 Oct 2019 20:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dg/wnIql6RYTJN5pt+F6iTfT+G6njW3vlJptMe/vUZ8=;
        b=IzBztQKbWdEWY4SKSXG4nBnFscBYLiMwuUVLwPMJ3D8rw9xqJKbzepBF7/aqrvjf7d
         sRsfLaKUBwz8dHwyWvfPLxYwEK9+q5FwDrvQ7ewVUKWVVGZuZnLwnY8AHh7fSTJ9c7Kw
         EcGrUJvtiqb/Dg86ejXqDt3Eoq5KJyrO8ohkT5QASRwXmh/7THWZf2R4uHm9MIRrp5Fb
         6xV4jLUTBfc17pK7XuUUPCb/9Qjv4mY6vK5Rkwj8w2kgfJW00deCLagyNGlnq6p3Yt6x
         cHrpLiZd05znph5FQywt67dbeFy3wyKkz+/djRAhrw+xgbUgt3aiYE8bEF0CyGtCIvJv
         LDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dg/wnIql6RYTJN5pt+F6iTfT+G6njW3vlJptMe/vUZ8=;
        b=LPKU7FUC8W9fVkc3ePBw5h7sgT9beuMtG6pHiTn+6SG7WgAnjDrYDU1Ynv5ItvSFkE
         3t1E2UTjhu7omfe5MlcY2tUahh8KA9LjueHQoIV3vfd+WDlFK4lqKBtpUS2RrsjzoMww
         qpL7ec1vyppVzuwosDBCIySyjYoCJWISehrkXOTvD0BviL82v9R7uuFMHXmQ7Ya4ciJl
         fShc+GCKBg6L2IdZicH5gL8BzWe3FgJaT42Ucvr9pOUTlzNI0zS7XN63RRiGpdEdr1ax
         rVQqxlwkalhF3wXgdYwWElYh1QnS833SMombWGhkY8R//hAmZCNh9t2nwJNz8suqLfVh
         3m+g==
X-Gm-Message-State: APjAAAXgwQKeplbwbus64kb0yxyWnXjOxtjKdKq5VYPO/pvVsNnmA+Da
        4VPb5BfLdAY4lKhupNIV9UQ=
X-Google-Smtp-Source: APXvYqzQjudvPUxj9Jdyl4KUC7kd404Z3gADXieKJQKHVkDBT956z+LAB5Wym7B0aezZoKuilupREw==
X-Received: by 2002:a17:902:8487:: with SMTP id c7mr1361597plo.20.1571714502924;
        Mon, 21 Oct 2019 20:21:42 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id m123sm18459174pfb.133.2019.10.21.20.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 20:21:42 -0700 (PDT)
Date:   Mon, 21 Oct 2019 20:21:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andi Shyti <andi@etezian.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191022032140.GV35946@dtor-ws>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
 <20191021162632.GA83253@gerhold.net>
 <20191021163956.GB1353@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021163956.GB1353@jack.zhora.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 21, 2019 at 07:39:56PM +0300, Andi Shyti wrote:
> > > > On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > > > > The exchange of data to and from the mms114 touchscreen never
> > > > > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > > > > the interrupt handler while reading the events.
> > > > > 
> > > > 
> > > > i2c_smbus_read_i2c_block_data() is actually limited to
> > > > I2C_SMBUS_BLOCK_MAX = 32.
> > > 
> > > oh sorry, I don't know how I slipped on this.
> > > 
> > > But this means that the i2c in the kernel is wrong (or outdated),
> > > smbus specifies 256 bytes of data[*]. I might have relied on the
> > > specification more than the code.
> > > 
> > > I guess SMBUS needs some update.
> > 
> > You are right. It seems like that part of the specification was changed
> > with SMBus version 3.0 [1]:
> > 
> >   D.6 255 Bytes in Process Call:
> >     The maximum number of bytes allowed in the Block Write-Block Read
> >     Process Call (Section 6.5.8) was increased from 32 to 255.
> > 
> > [1]: http://www.smbus.org/specs/SMBus_3_0_20141220.pdf
> 
> yes :)
> 
> OK, then I would ask Dmitry to hold on this patch I will try to
> update the smbus properly.

3.0 is from 2014, so we can't simply update the limits. And we need to
handle the case where device connected to a controller that does not
implement 3.0 standard.

If regmap is too much work then as a stop gap we could maybe only
convert write functions and mention why read needs to be custom.

Thanks.

-- 
Dmitry
