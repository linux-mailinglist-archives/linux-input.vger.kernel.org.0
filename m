Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D522C978C
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgLAG2w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgLAG2v (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:28:51 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9591CC0613CF;
        Mon, 30 Nov 2020 22:28:11 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id w16so594301pga.9;
        Mon, 30 Nov 2020 22:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yqx6zM711Pnh7g1lwNmUVpCKz8tAsH3hdarFZLoWhKg=;
        b=qfYpfGZqMzr5SvU1XOTzTEqQqYolRzE7qLbjeImg7pLpKzeMjNz0LVVB5yGDEv8ytC
         sye+v8yK/1GhA166uui03Br8k70WugsMn2fEDvZq9B6LepkaToqKw0n0psu83D855KNi
         euCS04PYbhK1ycUTpja1bAYewsWEv58dsShyKqZLU1e7BxWCNxlrQaJswqY7IKA/mK9p
         PWwXAUlVCwHwbgnxlkTU15MjFpIn7NqJIufOjZiRIkEMKxdKnChB+XTPNPFU0EaqYWam
         hzfIQQVdgaImKaMEaQW5kS1jXaeMDkzxTjHdtHYt704eQ12vMCX4r7t9ncHkh6lNouTn
         k1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yqx6zM711Pnh7g1lwNmUVpCKz8tAsH3hdarFZLoWhKg=;
        b=tNDuiRxLLs0ZAC197Mdyc1Tc5ihaPxu0Y5uGWEbngCy5HW5bJ9mTkzUdClUZe3uj5k
         tdIi+b4DrvKvVhCqKqsfSQZWIVbwM3YzCGUzO0cZV7cyKfFcOWpnpdxGebAutHcJXyTO
         GLx8vObWprvSVViq/NI/91O92cmZgrJ3HmddwVCxXhAy1CPukGJ3HQzyF9kKbAf4TQVz
         nZ2crp0p108lTr0U0MitTGV0OaLFDURCeJYPRKfncRUA/jveJ6m06qrZ2GXCLbZbZyYK
         tmuPf+x5eWA9WHmdnHpTnHdyqyaeximWCQJuDqVC1Dspu19VRfaK5raPRM+2xUNftBdN
         H2AQ==
X-Gm-Message-State: AOAM5327Q2lZYeX3Tf7hejNqBHRiAiL+P2DaroZNyCPxCw4iAr2BKVAw
        8IlFb5L2M03UeFQFmZXfixU=
X-Google-Smtp-Source: ABdhPJzhqC6rYhPoqsCpVbsVGxMQSOs1zq71W/jw5ToW8WadcpFDvuQiOMX6nMXrPemYsgfSb0YQhA==
X-Received: by 2002:a63:83:: with SMTP id 125mr1018030pga.423.1606804090949;
        Mon, 30 Nov 2020 22:28:10 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m3sm1111874pgh.5.2020.11.30.22.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 22:28:10 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:28:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: raydium_ts_i2c: Do not split tx transactions
Message-ID: <20201201062807.GO2034289@dtor-ws>
References: <20201201060050.1193986-1-furquan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201060050.1193986-1-furquan@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Furquan,

On Mon, Nov 30, 2020 at 10:00:50PM -0800, Furquan Shaikh wrote:
> Raydium device does not like splitting of tx transactions into
> multiple messages - one for the register address and one for the
> actual data. This results in incorrect behavior on the device side.
> 
> This change updates raydium_i2c_read and raydium_i2c_write to create
> i2c_msg arrays separately and passes those arrays into
> raydium_i2c_xfer which decides based on the address whether the bank
> switch command should be sent. The bank switch header is still added
> by raydium_i2c_read and raydium_i2c_write to ensure that all these
> operations are performed as part of a single I2C transfer. It
> guarantees that no other transactions are initiated to any other
> device on the same bus after the bank switch command is sent.

i2c_transfer locks the bus [segment] for the entire time, so this
explanation on why the change is needed does not make sense.

Also, does it help if you mark the data message as I2C_M_NOSTART in case
of writes?

I also wonder if we should convert the driver to regmap, which should
help with handling the bank switch as well as figuring out if it can do
"gather write" or fall back to allocating an additional send buffer.

Thanks.

-- 
Dmitry
