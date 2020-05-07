Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226921C95D1
	for <lists+linux-input@lfdr.de>; Thu,  7 May 2020 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgEGQBS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 May 2020 12:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726661AbgEGQBR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 May 2020 12:01:17 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C681CC05BD43;
        Thu,  7 May 2020 09:01:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so3202099pfx.7;
        Thu, 07 May 2020 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qb1yn5t1IPTyFXfHjM+vtDPWSLy9RS5I827KfmdCCPo=;
        b=Ck3JfrNRWLl4iKhvrbrwAo0aqn2iznGCOPLQN7AZB/I6QIqhcf3pbDchgXrgdxsUQZ
         r09bBzmYp0r9JmGWIo+471PZRPGKWNqRKYmQcv0AWtZQeweBK//Zkc92SQm0LU/TKDRK
         cjaTyCgRetkk61Zos0idJaFJ8Uc22QzAahcybaafa3ZFz9Vmg/rbNgBfZ1LiQ6Gc2SSH
         f+PzK5YUS6X+9FiOIykPkrxpfpEPbSqwIsYXna7y5JukxEIAe25gCn5auYl0BnYGouvU
         Iu/s7vL+POy1Yz8gtgmUB7kqFQttbdsL2otyzz41gvINlKeOaaLCgpeJP4iCsURPZZb4
         EluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qb1yn5t1IPTyFXfHjM+vtDPWSLy9RS5I827KfmdCCPo=;
        b=chANEeeUwFnet7FOpf4hSQ2hFKZlL2bDV+Lh0mLrzHUht9CaFJ9XaB+x+tjpfJ8ncY
         qr+ntAfw18YMIyzNdCu7WhOdSHgTnJ7YVK24DF37EpdtR5gTik6dgR0J8AuggjLpkhap
         untkAcxS2d8GEKIYOvGfCH2nHkpTFb2qnEBXTQADkA69j10fgOPxqtTwC3RvTwk2Fyb1
         NHYi6KY+DOuKXuTBKCIH1C+OzpKZrPK86Pw38WobCxM9Anl6MJb6MLmzJEtk2elSvwD+
         Vl7XuywROvy2NsTbhHiGRZFOukgqLzYa8chY32ngWNu1GYLOLCYvIVIDoSYfMk6E1mLg
         LUgg==
X-Gm-Message-State: AGi0PubUwQIt6w7LJHaS2EXal7HdU1SSLPGqxB2yiGTEOhBp3V2uhJwZ
        cAIh07IAwieRcwVBnuXy9Yc=
X-Google-Smtp-Source: APiQypIwGDuQgimi4V/sjeD/CcQ9q76z4XBPPy4eInhw8zbWKN+NgHOwT1svgrCLdMyW4GrW/Ppe3w==
X-Received: by 2002:a62:7d8c:: with SMTP id y134mr15435058pfc.231.1588867276268;
        Thu, 07 May 2020 09:01:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id e11sm5321395pfl.85.2020.05.07.09.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 09:01:15 -0700 (PDT)
Date:   Thu, 7 May 2020 09:01:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: stmfts - add missed input_unregister_device
Message-ID: <20200507160113.GG89269@dtor-ws>
References: <20200507151147.792578-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507151147.792578-1-hslester96@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 11:11:47PM +0800, Chuhong Yuan wrote:
> This driver calls input_register_device() in probe, but misses
> input_unregister_device() in probe failure and remove.
> Add the missed function calls to fix it.

The input device in question is devm-managed and therefore does not need
explicit unregistering.

Thanks.

-- 
Dmitry
