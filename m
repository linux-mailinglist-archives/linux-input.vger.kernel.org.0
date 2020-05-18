Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAC31D6F8E
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 06:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgEREFh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 00:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgEREFh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 00:05:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C63CDC061A0C;
        Sun, 17 May 2020 21:05:35 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s10so1959714pgm.0;
        Sun, 17 May 2020 21:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HHiEm16/4xq3MMtfPri9/a/cmBcNfYbkXXVh01N5Jmc=;
        b=Gq8oTz42VuMggbYwL0Pc6kbWlihL0/DOkyOcBTPOl82BQwQ5eYQ/kXCS9R62KmpH2u
         dlfgqMroZLPD417zHzIXAdn8qavm0nB7i15Bo72v1oM2I1n2M33Gb53GY4++nVTJSJR0
         vwph2dgoA1fiKzFHd+qGYfEIankY6peFOVjgJ8dSs0bQmXPi2ilq+D4m4qMxWojCKCtV
         SSzod9H/x1217c9n4e0QWHluchjSstEs8tim8Dw9L50Tg20xHZZKsCoiAGrksS8XklU1
         pDkMiU5nK+hEiCWMaD4WS6YzVWjFv8vcMxs442YPot8F3UjltV/+iC51ga6A//Yiz/ux
         Bfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HHiEm16/4xq3MMtfPri9/a/cmBcNfYbkXXVh01N5Jmc=;
        b=tFjUvdZr6B8CbdnHhLsM1OzI9UK+rUrLvc9GH+FlJ71XwvDswPfxqz2FvI+/GiJgNp
         q9I4MPGTVRnnypie4GKFqongAUPyMQ6x69KJpGDRqvDFN49XKk2FVTyxQ7zbQNT8qMlB
         pwl0yG7JjqsUFkSvWnT1OcD8nR1iSUXM13NAtsVwQarG+XgrVSCL8ZJ7Q5Jsfej7+nLw
         z6I52aEFV672T9O6YdhPgl/DEGeyYxqCbJovlRabG+LStn91qJNcsqvEJPRxfX5gD4sY
         4cCGP5NfcmUelQvsbjMdUtN27usUHyGYeBl6jsbrV7SjyO2UCjLD18dGfuFKU38+DxXX
         gAag==
X-Gm-Message-State: AOAM531bul8lWpEBguZh5RSw3NnHGYx+kI6TpCFXrSVMVy2Bwk0rOzMi
        M+pHRotl6ae/O3nzo+wBx8k=
X-Google-Smtp-Source: ABdhPJxeM2GvoO4bJ+QyqyBR4glZb9YGdl+Qx/9T0hFrxaeYAaC84R6rILJ02H0T9hVdYz4aBN9iNQ==
X-Received: by 2002:a63:4911:: with SMTP id w17mr13105303pga.13.1589774735117;
        Sun, 17 May 2020 21:05:35 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id a16sm7298692pff.41.2020.05.17.21.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 21:05:34 -0700 (PDT)
Date:   Sun, 17 May 2020 21:05:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/10] input: elants: support 0x66 reply opcode for
 reporting touches
Message-ID: <20200518040532.GP89269@dtor-ws>
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <02dc25c5851e50d77bc707a2e1b44caf9d6354eb.1587923061.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02dc25c5851e50d77bc707a2e1b44caf9d6354eb.1587923061.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:47:52PM +0200, Michał Mirosław wrote:
> From: Dmitry Osipenko <digetx@gmail.com>
> 
> eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
> reporting touch events: one is 0x63 (used by older firmware) and other is
> 0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
> eKTH3500, while 0x63 needs small adjustment of the touch pressure value.
> 
> Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
> reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
> use 0x63.
> 
> Note: CMD_HEADER_REK is used for replying to calibration requests, it has
> the same 0x66 opcode number which eKTF3624 uses for reporting touches.
> The calibration replies are handled separately from the the rest of the
> commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
> and thus this change shouldn't change the old behavior.

Is it possible to know what format a device will use by querying it at
probe time?

Thanks.

-- 
Dmitry
