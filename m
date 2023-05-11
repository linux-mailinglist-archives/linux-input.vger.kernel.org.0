Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24DE36FE8A8
	for <lists+linux-input@lfdr.de>; Thu, 11 May 2023 02:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjEKA2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 May 2023 20:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236563AbjEKA2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 May 2023 20:28:44 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33CF1BEE
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 17:28:42 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-52c6f81193cso5561966a12.1
        for <linux-input@vger.kernel.org>; Wed, 10 May 2023 17:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683764922; x=1686356922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjv9krHRpHWBa3BfKJivUmYHH2PXCcG9GaNKVrGNWKs=;
        b=OmGkpkErRVbxaZnZpHqFYtDWZTxzJKIZvLzoTKaXPEGgb25XqgrJV23oRBMYYHgz9b
         OdJxkmCwMqP8fxznqA+oIRuBgm6KP0blL5ibBvLcjEXn/buLoWyK/X9a/RzIjJ3aIuEm
         HiegApILx9V9wSNCFrKkfBxZKcVP+ts25u95lrMja/2A3jNWWXSXjtY+RmzsaYOsgeMB
         9rtTUEsAtNZKnzGJ+fpTG7wB3EIMZHtIQWX/QRjeBbHkZFUblFZUfXN9ro5ydSgHcWpH
         TNU+ES0SOTZv1jVkvUHvY7Be3ol4JhErtAf/t92W5PexutlK6ImcVnY0u7ywAuEFD7UP
         yqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683764922; x=1686356922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjv9krHRpHWBa3BfKJivUmYHH2PXCcG9GaNKVrGNWKs=;
        b=Hc9flsxssikcyd1Vh9YLCBRMMk/D5FQ9XCYijVx/XmKkTlW0BQo2LZBBfxTLCxpy8p
         c6roYWsXpOZbdFpLusLAEbRisxNXXPBki/iuHIKIlQLcxj7CUrSHysnvK1NufXxd3iOi
         pcuw8POjfE+xBDe0jlOBFeleodoykt4MnJ3AkteSfANzBt4XtuybdP9IAez8mxvHCwPy
         P3n2JVR//HjXxYYzlE07kEOgZT6AVRtK8kzAi5/yFLUAPmnDQXxTfmtdJGKUPJ5ymqIE
         9CLN1aj3+pW3DZuegcFucjnCxu1pswr+VH4ulxIMkZvnnWfAFvH+9rnWkX82MLH1iPZv
         J34g==
X-Gm-Message-State: AC+VfDwAiLE0mBUn7OKwe2ylwViOkk2wkX/sbjpwq5S5U9//jqatudoH
        Swzy5hHEkGwKGB7L2Fg3FrvHniZi5BA=
X-Google-Smtp-Source: ACHHUZ42g50ISR6r3h/JA4aAc7Kia63ESzlDCiW7GsONo39Krm/Z+0b/d3A0lFtYeXQRapNIHi2Iog==
X-Received: by 2002:a17:902:9897:b0:1ab:1bdd:b307 with SMTP id s23-20020a170902989700b001ab1bddb307mr18060420plp.51.1683764921743;
        Wed, 10 May 2023 17:28:41 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:84a:ed9c:4024:c347])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902c10d00b001aaf1679c9fsm4377364pli.221.2023.05.10.17.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 17:28:41 -0700 (PDT)
Date:   Wed, 10 May 2023 17:28:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org,
        Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] Input: adxl34x - do not hardcode interrupt trigger type
Message-ID: <ZFw2tnfhA5g6CAWt@google.com>
References: <20230509203555.549158-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509203555.549158-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 09, 2023 at 10:35:55PM +0200, Marek Vasut wrote:
> Instead of hardcoding IRQ trigger type to IRQF_TRIGGER_HIGH, let's
> respect the settings specified in the firmware description.
> 
> Fixes: e27c729219ad2 ("Input: add driver for ADXL345/346 Digital Accelerometers")
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thank you.

-- 
Dmitry
