Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB7BD7DA687
	for <lists+linux-input@lfdr.de>; Sat, 28 Oct 2023 12:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjJ1KkU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Oct 2023 06:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjJ1KkT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Oct 2023 06:40:19 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA6A126;
        Sat, 28 Oct 2023 03:40:12 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3DB291C007C; Sat, 28 Oct 2023 12:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1698489611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PSth4Mdhtx4iGpZmumOOpeS2KofR5ROVqUGGwL8j3rs=;
        b=VQAjXRm+ivsQlkb0qwiEdNlYeo1hguL8j1ZPUEr5hECd5OdSTeMHxVx4cKexVWfyU/HfB2
        bSUm9jZRMyeybPwY2NCLaME1lHhzg0uvKrkiAqZTayOpXK7zMDuQQ6V6OcCtRR7Q3K83Xc
        /Hu5955njfX7rwy/xju5+FgJlnz7IRM=
Date:   Sat, 28 Oct 2023 12:40:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Caleb Connolly <caleb.connolly@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/7] Input: synaptics-rmi4 - f12: use hardcoded values
 for aftermarket touch ICs
Message-ID: <ZTzlChOS0OR95Ykp@localhost>
References: <20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org>
 <20230929-caleb-rmi4-quirks-v1-3-cc3c703f022d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-caleb-rmi4-quirks-v1-3-cc3c703f022d@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

> Some replacement displays include third-party touch ICs which are
> devoid of register descriptors. Create a fake data register descriptor
> for such ICs and provide hardcoded default values.
> 
> It isn't possible to reliably determine if the touch IC is original or
> not, so these fallback values are offered as an alternative to the error
> path when register descriptors aren't available.
> 
> Signed-off-by: methanal <baclofen@tuta.io>

I guess we should have full/real name here.

Best regards,
							Pavel
							
-- 
