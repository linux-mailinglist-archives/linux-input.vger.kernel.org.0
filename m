Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF6C62ED7E
	for <lists+linux-input@lfdr.de>; Fri, 18 Nov 2022 07:12:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240920AbiKRGME (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Nov 2022 01:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiKRGMB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Nov 2022 01:12:01 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1254090D
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 22:11:59 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id k7so3710042pll.6
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 22:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9KLdj5PztcCw0IycA4UcaK++RIfFFqYN3KXUUhzE3Q=;
        b=nOLgciT5FgtxSOUGcJJ6sFqttPnjc6zOnnPNljPaDejAndWYelAp23umQ7WsR96XBm
         2af+kH4t1g+NpwkLZWv2zjtUGPN2Gvbz8AlHx2YTYYgfYGXzP/75RzoaGgsolV/t+uQk
         t+uK74lm+addVQZ4uqf98s8tmaV8d/JSM0+nLNs0oCunluvk29e2ZBd6hd6oW6Zvj7Ur
         vo/4CcQPpiXS0oLD26J6frQIid4AiG4jiDBziotGs5xSPNmy/ZbZwLeptwvq5fx5xfHB
         p7T71CvFl4ITVj2GRIsWpN607KMyqt0js33gOk0xnDfRrfG3Xrn67aIJTmqgO5hQ045E
         48Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9KLdj5PztcCw0IycA4UcaK++RIfFFqYN3KXUUhzE3Q=;
        b=aRrGSQTv9Ztgp2bc4hDDJGR07H40rIayu6ZqtPmpaFe7oiSa5AkB1j4ZH2WW17jp+n
         aoHW551BC5zvxiBgfaZp9l6uvoGBL2tyxfz1BZffEPGFjmKCaKAnpDErYwxmvEOlsAjv
         ssraITafPhDlrWa5Y+ZjWgDuDAbWDwfHaE4HH968ju7Opy9uEpx4J0bbyLhlMR7IdphN
         lXUac/5y+YqWWpfQF5gHlycnofts5k+l4PvKmYfSsLK5G6srphnx0YFw6Rh7ijW4HlnC
         PZYjdcKStbxfHtNX80msEzRcF7PDGAYHRjhRalBJhQDEg4Vzr1qWpFBFcDqgGZIC7ZZD
         V16A==
X-Gm-Message-State: ANoB5plW5Bc5jH2PR3ex6yFO//aqMc7vjHvbAkWhO/SiQkYYRAk8Hurv
        OUAtMl3z+gHlUijgeKYEUdM=
X-Google-Smtp-Source: AA0mqf4W3haw+1WirGsZ2g9RnwZsFJI0OaXA4SHyqacDhCQKHZV42+Q7AAh+ChZOpX6zPG+39qs6YA==
X-Received: by 2002:a17:90a:8a82:b0:210:7cd5:db0e with SMTP id x2-20020a17090a8a8200b002107cd5db0emr6584067pjn.30.1668751918811;
        Thu, 17 Nov 2022 22:11:58 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e4c5:c31d:4c68:97a0])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902b20900b0018099c9618esm2530991plr.231.2022.11.17.22.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 22:11:57 -0800 (PST)
Date:   Thu, 17 Nov 2022 22:11:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] hynitron_cstxxx: Initialize tmp to 0 to fix
 uninitialized variable issue
Message-ID: <Y3ciKoAJWdFoCXIX@google.com>
References: <20221117195921.2291-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117195921.2291-1-macroalpha82@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 17, 2022 at 01:59:21PM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> In the very unlikely event the cst3xx_i2c_write() fails inside of the
> cst3xx_bootloader_enter() function 5 times in a row, the uninitalized
> value of tmp will get compared to CST3XX_BOOTLDR_CHK_VAL. Initialize
> the value of tmp to 0 so that in this unlikely event we are comparing
> 0 instead of an uninitalized variable.
> 
> Fixes: 66603243f528 ("Input: add driver for Hynitron cstxxx touchscreens")
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Reported-by: Dan Carpenter <error27@gmail.com>

Applied, thank you.

-- 
Dmitry
