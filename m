Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295D31C9AF5
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 21:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbgEGTXi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 15:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726863AbgEGTXh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 15:23:37 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4075C05BD43;
        Thu,  7 May 2020 12:23:37 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id f6so3109083pgm.1;
        Thu, 07 May 2020 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rg8nxTro0ISSd5M3WvCA/ngLZr53aAa4/KH8D93b/O4=;
        b=RLie9QZOhVw1NcAtFZTDYovRs49qmnHhtfylH7BwGQSFFCJd2kZUiX1Kr1psd7a5PR
         l59oxsPMPt5FKfqUCsENGVbzVgsoJ2OYMv0drdgk5KVQviEsvp/R4SBfVCsA4u5WttpA
         mm2wzXpRGW0nJWd0t8O+lgZcNzOhqyURIYlsPR/ZQZzETz79CInBAzOrvlTxEH1vmLwA
         3YIsl4Z1uru+8hMuLU8fOwxQmLXh3CPruXdHgpJQhHCzAvHFKKZM/YCkZPUaiyMaRB8F
         0b4FPrqZIS5pVqzwaexGir7wpP4aVnjee7nPRm1yLuQgIHHqbAsrumvdGVPh4R22BSso
         vpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rg8nxTro0ISSd5M3WvCA/ngLZr53aAa4/KH8D93b/O4=;
        b=I9UoHTVe43KXdISk4AQqsRgoR7GZMiw2QBnYLnlVuuQn4EXf9MUbnM9SRxBVVG0+5j
         xGORx0/TcWDHllZQ4D6ABDYY+SnfCnQWAuTnfLxVcFuCNLYREjaZ+M08L2BxAqnJX4/Y
         Tc4NrDWX+zgpQ1zhZfOedPwW2B04VEY+A523g9gtfNzZ4xQnk9KigTQekYal0/HNw+lv
         +QpC2k2UOBkkDkBU4fMkx0JG1jK9sfrM7ZtfqQ6xwF0UkKalJjGrnXfe65qmzgq7oudz
         qu5VBwpA0NH5S2nsdGzntiDTdCw8kJtqzgyDKt+QJsWI6pwpg9qTjZWycdex+RWeH0Np
         za9w==
X-Gm-Message-State: AGi0PuYjeYZmTE8uDGGNYIyzxcbG7FRY+dDfMPRG9GyDWf358LgacTWa
        Q16ej6YAzSeYZwCRySZs9r0=
X-Google-Smtp-Source: APiQypLGGInIi5niVq/AuZHDEALyOPU+N0V7vmKLHNfsYnKpiZ6g2Bqhtvw0Yo1/qPM1pWj8QAM56Q==
X-Received: by 2002:aa7:8a92:: with SMTP id a18mr15680900pfc.0.1588879417137;
        Thu, 07 May 2020 12:23:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x7sm5717399pfj.122.2020.05.07.12.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 12:23:36 -0700 (PDT)
Date:   Thu, 7 May 2020 12:23:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: add driver for power button on Dell Wyse 3020
Message-ID: <20200507192334.GJ89269@dtor-ws>
References: <20200503201237.413864-1-lkundrak@v3.sk>
 <20200503201237.413864-3-lkundrak@v3.sk>
 <20200507174644.GF1216@bug>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507174644.GF1216@bug>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 07:46:44PM +0200, Pavel Machek wrote:
> Hi!
> 
> > +struct ec_input_response {
> > +	u8 reserved;
> > +	u8 msg_counter:2;
> > +	u8 count:2;
> > +	u8 type:4;
> > +	u8 data[3];
> > +} __packed;
> 

> Bitfields, and relying on them being in the right place for
> communication with hardware.
> 
> We don't usually do that, and there may be reasons why we don't. I'm
> pretty sure it breaks on big endian... and Im not sure if there's
> something else.

Usually it is endianness first and foremost, but this hardware is not
going to be used anywhere else...

-- 
Dmitry
