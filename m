Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 061B559D00E
	for <lists+linux-input@lfdr.de>; Tue, 23 Aug 2022 06:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234779AbiHWE1v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Aug 2022 00:27:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236382AbiHWE1u (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Aug 2022 00:27:50 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74E73D5A2
        for <linux-input@vger.kernel.org>; Mon, 22 Aug 2022 21:27:49 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id f21so12946105pjt.2
        for <linux-input@vger.kernel.org>; Mon, 22 Aug 2022 21:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=ExZxSQFmQeosUufPXSj7a9bTORVwoReIbBQhOA+MEaI=;
        b=f11c6PlD9Y/h/5IeDMvWyGm5A9hd3OgjVbwiV5fWsr7lFdIz9lyhjr38wiaZPThMO3
         cC7UzfyU7jfHcYLC95R9ceAyEFrafiSBTO9nJyiHI8FkBZhM42V2+2sAeWRK/Uo1QOVT
         Veq4A/VyyDhHTzK2w9aqGQh4ZXK8aABIrf6wawRp9zAPn/VN9ekqJ9ZcJa8dJ4oz2U0c
         XdkMNE3X0GAwVBHHWAc9MNRdIwfiRZkMwKSVnnkpavEBEDWh6H15F7AuSMkryiOom+89
         uaymplxKIRUHtfeW9dsAnGarm9kAHat3KIazhbkvkx1y6LZ9XMVtgYkw78EFWhjmg6jC
         V2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ExZxSQFmQeosUufPXSj7a9bTORVwoReIbBQhOA+MEaI=;
        b=PtzEdaatoh0MJBM1Bik3lDJ/H53yLxiOgmtkl6Q84DJ3tjMgpglOno75Ep9b2BtQRA
         48xSl3Na6WioPibSXReL5uRr2qIZ7PVDa5pmeFFVKsKLXgvuxLdLuCCtVQYyNdzNl1Hb
         zIVJLHNzNUTIJEY2xiNHb+y6T+9AjvvDm/r1VlaTqEDwP+8s+ZUbaXK+Qt7u2ORJFTzQ
         CrdWKmUQRwyAq4YNCkbFquO7F/N+LhN09YrAYKrKx+fNFfv71MXhvOZ6qEZtqEQf1+Om
         4cxrdba1y9KvMHVU7oUKK0Dw53M+4fVbn8NIKTSXzmjV0ycVF3Ik30yewtxJlaArcdh0
         kAeQ==
X-Gm-Message-State: ACgBeo2j1Wr8hE/21Vi1ta9XTX1xvFPnpkfgdWyHYwGpBeVGzUrIutHn
        sUDgH5FHX6Ux0z9TPW9ZeGrZG06vFaY=
X-Google-Smtp-Source: AA6agR4fSAUvi3MJ2kQAwKG3Is1DZNPvU2BnNXNLutES60RasvCppTQLHGlPQmMBM2ZgcRWKlYPo5g==
X-Received: by 2002:a17:90b:3941:b0:1fb:375:a4be with SMTP id oe1-20020a17090b394100b001fb0375a4bemr1512875pjb.225.1661228869193;
        Mon, 22 Aug 2022 21:27:49 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:ebe5:ba37:26e1:8072])
        by smtp.gmail.com with ESMTPSA id o12-20020a170902bccc00b0016db7f49cc2sm9174131pls.115.2022.08.22.21.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 21:27:48 -0700 (PDT)
Date:   Mon, 22 Aug 2022 21:27:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Peter Robinson <pbrobinson@gmail.com>
Cc:     Joseph Chen <chenjh@rock-chips.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: misc: rk805-pwrkey: Fix module autoloading
Message-ID: <YwRXQjo4uMxSI01s@google.com>
References: <20220612225437.3628788-1-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612225437.3628788-1-pbrobinson@gmail.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 12, 2022 at 11:54:37PM +0100, Peter Robinson wrote:
> Add the module alias so the rk805-pwrkey driver will
> autoload when built as a module.
> 
> Fixes: 5a35b85c2d92 ("Input: add power key driver for Rockchip RK805 PMIC")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied, thank you.

-- 
Dmitry
