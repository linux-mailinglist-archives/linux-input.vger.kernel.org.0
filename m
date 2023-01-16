Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9112A66D207
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 23:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbjAPWwd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 17:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbjAPWwa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 17:52:30 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFCF193EF
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 14:52:29 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id q23-20020a17090a065700b002290913a521so12992451pje.5
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 14:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TpJum0JFSl5W1OQKC/dR08caHxefq+LKDABmVZnJYCA=;
        b=SjVLkBHKkGXpiK6Q0JUL9jjNmTx/GeENMEt3g7DMbF0l1EXVTzcnOBedUwMJ2B5Uhl
         Q2dBrrlit12ByMIqFKYWDQLE0iJQPdFsdpXjCKfMi5Gj9rfdF8bNWR9WUa6Xhnl8P+sD
         lIbDkhobKa0eMszH0FoXGkZ5YySg4Zl7IDRTVstaP26w3OLowtnHqVEj5CgsIZ/IPzRX
         MpFUCNFvuqlK6TLcrBnEl99eblz1IVx0qsx6Gp1m8AFc/frq24SYDjjZ3zT3O2oH8YTh
         4CcbfjpsaEyJKrLBoIMfRdmscYHt8Yb/qWzZSiosszggfs+i6msuNFcUNFM+YfoFwsf7
         3j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TpJum0JFSl5W1OQKC/dR08caHxefq+LKDABmVZnJYCA=;
        b=EXBdKSukNVHEfFU6A1HmCfNRuDeGnyi2noVnk2Rh4ZCDu0eSY6ls+DWPT+kiO8Dniw
         KPASkqDHo0hmcesUJOS7cUPi0Y1SCM8mlNyS2uxeFRthzCDawxHGcE2nJV23TaHkeyog
         x6YiC/YNF4LSRNAlhUEOXCCxeVM7479Ex0mNDz4vDyrZ/O/R0L8CVSFwp5dMDKGdTe4C
         Fe4J8j1TRbadxajyOGODZqyXIsH28IkMU/oXv8p9I9CpU+u1Y08xAGppiXsfhuecCaUW
         Q/m+krAci+a916yrUx/uMBHdOfY9v3sAvykVrySRnyO/vchAgRUN5VfDkn+768Cc1W+B
         2ACQ==
X-Gm-Message-State: AFqh2ko0Mz6u42LVZ5x8jUUzi07NnniOXkSOS+92kaPnQnwZQgc0zjU7
        XRDq5vO2wY3aLtqsbYQnIws=
X-Google-Smtp-Source: AMrXdXvDGDny3BTbawlkUBz4ybBCtHbQx3FUdyMXEzpzsUJNbgjA7ZpvNVO8TrcVVCEWTt3CNcJz4A==
X-Received: by 2002:a17:903:186:b0:194:7ba1:938 with SMTP id z6-20020a170903018600b001947ba10938mr15842215plg.65.1673909548811;
        Mon, 16 Jan 2023 14:52:28 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:e122:9dd9:de80:8e84])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b00194974a2b3asm1775736plr.151.2023.01.16.14.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 14:52:27 -0800 (PST)
Date:   Mon, 16 Jan 2023 14:52:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Gergo Koteles <soyer@irl.hu>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - add support for linux,input-value dts
 property
Message-ID: <Y8XVKAqSL4AC7MH+@google.com>
References: <20230116215947.354660-1-soyer@irl.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116215947.354660-1-soyer@irl.hu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Jan 16, 2023 at 10:59:47PM +0100, Gergo Koteles wrote:
> Allows setting the value of EV_ABS events from dts.

This needs adjustment to the binding documentation.

Thanks.

-- 
Dmitry
