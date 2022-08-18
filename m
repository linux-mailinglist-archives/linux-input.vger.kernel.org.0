Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C05C95983CC
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239276AbiHRNKp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244970AbiHRNKd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:10:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEE3625FC
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:10:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8972D615FF
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 13:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F43FC433C1;
        Thu, 18 Aug 2022 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660828232;
        bh=/z65G4XV6/Cm7ol73EKvoAo8awnGRPFaiPS8khMIJuc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sEYF46B6AbRzQkWl73cYzZ3wkiA+u37VHTiw5DbWMb+EFtHVP9ovm565dmZiEkcPe
         Cu/68SgC8jJPD3LCsOGRTQRRmMWT5JxPUGewVDG1XQWVKrHRpcIA4KoVpePsZcEynN
         dTKFt1IsgQ5n8EZC3ZBgXSThmfs/4lb86TrmUt1M=
Date:   Thu, 18 Aug 2022 15:10:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Rojtberg <rojtberg@gmail.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>,
        Cleber de Mattos Casali <clebercasali@gmail.com>,
        Kyle Gospodnetich <me@kylegospodneti.ch>
Subject: Re: [PATCH 1/4] Input: xpad - add supported devices as contributed
 on github
Message-ID: <Yv46RSWwQDaHqE6f@kroah.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
 <20220818130021.487410-2-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818130021.487410-2-rojtberg@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 18, 2022 at 03:00:18PM +0200, Pavel Rojtberg wrote:
> From: Pavel Rojtberg <rojtberg@gmail.com>
> 
> This is based on multiple commits at https://github.com/paroj/xpad
> 
> Signed-off-by: Jasper Poppe <jgpoppe@gmail.com>
> Signed-off-by: Jeremy Palmer <jpalmer@linz.govt.nz>
> Signed-off-by: Ruineka <ruinairas1992@gmail.com>
> Signed-off-by: Cleber de Mattos Casali <clebercasali@gmail.com>
> Signed-off-by: Kyle Gospodnetich <me@kylegospodneti.ch>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>

Why not just submit the individual commits?

Also, should this be backported to stable kernels?

thanks,

greg k-h
