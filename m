Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A838176C145
	for <lists+linux-input@lfdr.de>; Wed,  2 Aug 2023 01:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjHAXy6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Aug 2023 19:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjHAXy6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Aug 2023 19:54:58 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546321BD
        for <linux-input@vger.kernel.org>; Tue,  1 Aug 2023 16:54:57 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686efdeabaeso4196191b3a.3
        for <linux-input@vger.kernel.org>; Tue, 01 Aug 2023 16:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690934097; x=1691538897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xdQxSuzsJDDfGXAZnUDv40as2WZDyQN5YWSLWKXqkbo=;
        b=BvXW1R1aHI5BoPkVMaHKOaM2FQIROPBEzZzwOFfW/NYiQRkT3JaOThyWzDVlBdT2ao
         yeCIJxrsVt1P//xupfcyWUsE094UXpCzatXm0cEnY6r/DDbR1NmJFDyNiQj8Th5pehyk
         ZCLD8fWcqmME2ViFPCecap2qz/iNOFK9rJNZeuP9gSM1FmvMSbPHLdP5YETQ9MCC/U4C
         6sjGwQpAHjIr9kB14DFNPqn2igrWpC5jZSwe9qGEzTN4p0CeuTRzzjRSZX0nzDC3SvZj
         BTi38h+YHSHTnuVuWn9byKGQywdsayMwod9mcXfC8B8kK6S6S8NM5ajyAbpY/L2XY2eU
         PLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690934097; x=1691538897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdQxSuzsJDDfGXAZnUDv40as2WZDyQN5YWSLWKXqkbo=;
        b=I1SBQr7gcluE+5sIhPCa2N1Cgw+2VR1rc+BwPrnu9hLoZmuagrahM+EJcdyUiNMb10
         GhYMPhmk4JKAb74iyiAlSzu5DfKNImCFVDr1ev+21+C1w0YMA1ZGRg/g8hvn+RqY2E72
         vevR2rQAYclv1UQnrbUrO3/4DJ7jbc9wZtzrg2osH7WMVALemf01TQt4OpiO7STazrAZ
         wtwwncdAsbTsrAJ2Om0Ght8Vz/cEksuL7P809LtjsH5DxqgYdZYcqSr5hgAwZOaKowdC
         xlRDYeVWjzGT+cgg00W0xpQsizdEHCWR69NtXyj7dTogI1kMnQZP7J3Jq1ZYH5t2QbTz
         VbqQ==
X-Gm-Message-State: ABy/qLYbMqwkHGiQ2Bg36c+pmj3zw0Ts5C+lpyjnk+xQ+w9Tz4ttVFHI
        mT0ayEwqf24W3B7q+GRkql0=
X-Google-Smtp-Source: APBJJlGQZRFi3JOfLmL56gOTxnjagPEq/xmkuqJsyQ1Znk5A4/WQLH877GdYIKPeudtvDg5uTrbDyw==
X-Received: by 2002:a05:6a00:14c5:b0:668:9bf9:fa70 with SMTP id w5-20020a056a0014c500b006689bf9fa70mr16398274pfu.34.1690934095569;
        Tue, 01 Aug 2023 16:54:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:877e:78a5:c7ac:e1d4])
        by smtp.gmail.com with ESMTPSA id g22-20020a62e316000000b00686bef984e2sm4814467pfh.80.2023.08.01.16.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 16:54:55 -0700 (PDT)
Date:   Tue, 1 Aug 2023 16:54:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     wsa+renesas@sang-engineering.com, christophe.jaillet@wanadoo.fr,
        linux-input@vger.kernel.org
Subject: Re: [PATCH -next] input: serio: fix the return value handle for
 platform_get_irq()
Message-ID: <ZMmbTESQhAmflvUK@google.com>
References: <20230731122246.2028651-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731122246.2028651-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 31, 2023 at 08:22:46PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>

Applied, thank you.

-- 
Dmitry
