Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4686F88F5
	for <lists+linux-input@lfdr.de>; Fri,  5 May 2023 20:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233343AbjEEStJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 May 2023 14:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233322AbjEEStB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 May 2023 14:49:01 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5E921540
        for <linux-input@vger.kernel.org>; Fri,  5 May 2023 11:49:00 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64115e652eeso21815187b3a.0
        for <linux-input@vger.kernel.org>; Fri, 05 May 2023 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683312539; x=1685904539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFb6RViasZ5khMTDjpPAsdq0eju7722XpGIED6KZKsE=;
        b=N9bAmkwSkpHYFpMBML4qVIfcQXbFgvyL0Zt6kU0qG01CyqlFt7R+SUrLRqPT7KzeXt
         t9Lw0Sagv+mzVZg2VoqLL88XweE1O5ogO8skoObyZOqinoejWOp6Cer0+N/41iglA7+s
         3122XJRapecdUjEAlutjL2RBHekNagw55opOeyTHrSlEggrNivCx6PlFysK28HeN8gcu
         BWuArlpwZuFo1ZdvQ/oAhEt1AitH54B9APR646ld3GVglkuDHHy3vM1imFtL/96UVhgn
         3v/Fqj4Ik+hzD1Z6+lzLnE5ETzx3pIxpnpIDFYgIooOYcZWhSnKxhnI1VOY5IfFTFezw
         jL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683312539; x=1685904539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFb6RViasZ5khMTDjpPAsdq0eju7722XpGIED6KZKsE=;
        b=iR4y2fH5iclKmtSRJ4ZAhufFNjkwXeWKSGqKo8qea0eYKQG6Ku11Kv0hrAKXgwA/yJ
         PDfQlDrXaXDsLIIUO6Bl/TLN41c7OpQlQaCPns6sid/DAEP8odEB1QOrj9cVFv+1I8sY
         wdY63GAFeOyDAEy9MJtSPK4TQulWtFZnIwRd5JePc2OF/yZ/TiOSOnUoNvPIGKe5HtkM
         w33AsWasrb7YrBznm+ZSTSkcPqoE4/tOmLf34Bz5HvplOE9m9S1HPRm7wsZW2t/MZShu
         fjytseVdkdrzg2cxXxevg3RuaGuVRN4hD0ZntmeG05l5RJw0ggrKvuZEYDkeWpbo3WVJ
         5l7w==
X-Gm-Message-State: AC+VfDy10rpYLpeO8cLsS4gBw2qNgcwtNUtCRr2yBvr0fqlfHh28Jn1O
        FlTnORaJ7yd4UGUYVeZpEY/leYQ3Aa0=
X-Google-Smtp-Source: ACHHUZ7tlLGGYbRDuExA/L81Op/SwJss9jK+ihYaTStLPnX8DxjAV2NaIm0g6A/RdQCNXTqH0dbbOQ==
X-Received: by 2002:a17:902:cecd:b0:1a2:a904:c42e with SMTP id d13-20020a170902cecd00b001a2a904c42emr3263199plg.24.1683312539543;
        Fri, 05 May 2023 11:48:59 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5658:95c:e1cf:a1b0])
        by smtp.gmail.com with ESMTPSA id v4-20020a1709029a0400b001aafe56ea70sm2134054plp.5.2023.05.05.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 11:48:58 -0700 (PDT)
Date:   Fri, 5 May 2023 11:48:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Philipp Puschmann <p.puschmann@pironex.com>
Cc:     linux-input@vger.kernel.org, dario.binacchi@amarulasolutions.com,
        michael@amarulasolutions.com
Subject: Re: [PATCH] Input: edt-ft5x06: Add delay after waking up
Message-ID: <ZFVPmKaqnskF/F1D@google.com>
References: <20230505115823.545803-1-p.puschmann@pironex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505115823.545803-1-p.puschmann@pironex.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 05, 2023 at 01:58:24PM +0200, Philipp Puschmann wrote:
> The touch controller needs some time to wake-up after setting the wake-up
> gpio. Without having a delay after wake-up probing regularly fails in
> edt_ft5x06_ts_identify() with an error (i.e. EREMOTEIO) that was caused
> by a failed i2c transfer.
> 
> The datasheet sets the wake-up time to 5 ms, although it is not entirely
> clear.
> 
> Signed-off-by: Philipp Puschmann <p.puschmann@pironex.com>

Applied, thank you.

-- 
Dmitry
