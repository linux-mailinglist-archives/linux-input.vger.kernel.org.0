Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B1206B47E4
	for <lists+linux-input@lfdr.de>; Fri, 10 Mar 2023 15:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233074AbjCJO4Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Mar 2023 09:56:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233302AbjCJOyX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Mar 2023 09:54:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5D7C1223AB
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 06:50:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C36AD6196E
        for <linux-input@vger.kernel.org>; Fri, 10 Mar 2023 14:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF9BC4339B;
        Fri, 10 Mar 2023 14:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678459804;
        bh=QSiGl2YAdAGsmfCWq2WtCLj+0Ez162pQjq7zaxIAl2o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Uoo0CZSUNtCSbYK1Ilwk3a7ISmxXlnYty+t84E39HN5QBCti+L4c8DzbXVjFaAkz8
         kaP4fxD9abhTpIRnZ4TVrrF/bIzFjRmbFASVEIYo1roZRBBPvU7IaQXoxrvwvGCOQR
         FwTcCI5TyFhZ8mETwU4qFDTyxlY0mz0JqSFRBB7GYw14ihiG5wOEMhnPSwW2ZM7k2P
         lOrFISOz3yiWBHsn0vMmtRGMv9kihzes7wNu5RVCgbZ8J6v8g4pPPNKo57B0b9VFil
         Y2elb1nol0X9hi4iYaIibbo2fQXlSG/Db2C6ME5qfEM2JbfjIrW8vcMUKQb1ro9e5m
         EYv5Su2fkIrKw==
Date:   Fri, 10 Mar 2023 15:50:07 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Alex Henrie <alexhenrie24@gmail.com>
cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: apple: Set the tilde quirk flag on the Geyser
 4 and later
In-Reply-To: <20230227030614.827480-1-alexhenrie24@gmail.com>
Message-ID: <nycvar.YFH.7.76.2303101549590.1142@cbobk.fhfr.pm>
References: <20230227030614.827480-1-alexhenrie24@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 26 Feb 2023, Alex Henrie wrote:

> I recently tested several old MacBooks and as far as I can tell, all
> MacBooks that have an ISO keyboard have the tilde key quirk:
> 
> Product    Model  Year  System      CPU    Shape  Labels     Country  Quirky
> ============================================================================
> 05ac:021b  A1181  2006  MacBook2,1  T5600  ISO    British    13       Yes
> 05ac:021b  A1181  2007  MacBook2,1  T7200  ISO    Québécois  13       Yes
> 05ac:0229  A1181  2007  MacBook4,1  T8300  ANSI   Usonian    33       No
> 05ac:022a  A1181  2007  MacBook4,1  T8100  ISO    English    13       Yes
> 05ac:022a  A1181  2007  MacBook5,2  P7350  ISO    Québécois  13       Yes
> 05ac:0237  A1278  2008  MacBook5,1  P7350  ISO    Dutch      13       Yes
> 05ac:0237  A1278  2009  MacBook5,5  P7550  ISO    British    13       Yes
> 
> The model number and year are from the laptop case. Since Apple printed
> the same model and year on many different laptops, the system name (as
> reported in the SMBIOS tables) and CPU form a more precise identifier.
> 
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
> ---
> v2: Added system names from SMBIOS tables to commit message, no code
> changes

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

