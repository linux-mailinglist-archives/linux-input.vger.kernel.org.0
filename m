Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 385B474DD95
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 20:51:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjGJSvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 14:51:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbjGJSvE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 14:51:04 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601AACA
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:51:03 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1b89bc52cd1so21302235ad.1
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689015063; x=1691607063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yVej8ALIFND5nuxsCs/mCH8qvlOrthYfmyQVdHzDoBg=;
        b=m1ubXdR4DeFki1wuJhusOOV4QStApZelbAFKfhVLzsRWhg1Bfdbaj2D+LVyP4M6rCs
         ZFl1T0G4m9u1jx+bWzxa89/bL1lCu54fkIM6fONzT6wfCgeRsdteex9jGxprcfR/y9Gx
         tKDaLP6mrdI2s/FtAkBy/ihGAxQzocivrMa7QsnN62/r85L4e+79kfja41bdw/EH7PuJ
         FJLEbnvPFFJGF5MKnVh2vYc2vjjImkGiVWhJfK6BANoqMABymbYf+fK81xIXdIrJ4xgh
         5QJlcPc5Gq1mfwt5SqGOIJ5PLZKOzdYSPvdpm6NNMaKCYi2Uj/d7/rJ5ZeB240TpqxoF
         xRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689015063; x=1691607063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVej8ALIFND5nuxsCs/mCH8qvlOrthYfmyQVdHzDoBg=;
        b=bRQBrIGuVB+9YTC0yCnGN76QcM7FDz4QHa1qE8GNGi+pU5e9TRchjGn3pYhZzVG+7k
         3oud6W/YIGzLcGdkkIpMCMFyBji7BcHP36dEP5WcdT9lK/U1C26+0qWTQpFFy3reOWRX
         Fvd9Nlmxoaf2PV/NJUYUfOxLhLZ39Grl4Yu5zaorBH0jx5yakEMT3c/ymbrlNUoLRl82
         ZzOxynNL5KQMmeggOM2RyaAfODtzYFJ+gbF5o8rUHYUP6O9cIoFuvcGvVm8BD4XC4ZdL
         9Yg0IAbIb50ZjVUfoI/wkoj3xG86GWMldyWQYi9URQjiizTdUQ7+KTWZcIIzwLo51ms2
         TzRQ==
X-Gm-Message-State: ABy/qLbC+HvvWk14ecypFyis3yx5wqy/G0CUtg9gyGvOrbXDP1eGt9GC
        fmpoYIy9wxfOb+9eq9/gw1g=
X-Google-Smtp-Source: APBJJlFsQSGljTDX5LUw7/tCHF2OFakP6pABtBVODTxws/p452I/2Cn2oQBdHEQ4NJ4nFLCpeQjsbw==
X-Received: by 2002:a17:902:e54a:b0:1b8:9552:ca with SMTP id n10-20020a170902e54a00b001b8955200camr12908992plf.45.1689015062683;
        Mon, 10 Jul 2023 11:51:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:96bf:7e77:39eb:7a23])
        by smtp.gmail.com with ESMTPSA id z10-20020a170903018a00b001b3f9a5d4besm210017plg.255.2023.07.10.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:51:02 -0700 (PDT)
Date:   Mon, 10 Jul 2023 11:50:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>
Subject: Re: [PATCH resend 1/2] Input: novatek-nvt-ts - fix
 input_register_device() failure error message
Message-ID: <ZKxTE3Pqa2RTQLmI@google.com>
References: <20230710123633.323937-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710123633.323937-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 10, 2023 at 02:36:32PM +0200, Hans de Goede wrote:
> Fix input_register_device() failure logging "failed to request irq"
> as error message.
> 
> Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
