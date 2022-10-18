Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DF8F602BF4
	for <lists+linux-input@lfdr.de>; Tue, 18 Oct 2022 14:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbiJRMnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Oct 2022 08:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbiJRMnP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Oct 2022 08:43:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65520C355A
        for <linux-input@vger.kernel.org>; Tue, 18 Oct 2022 05:43:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6AB061543
        for <linux-input@vger.kernel.org>; Tue, 18 Oct 2022 12:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461DEC433D6;
        Tue, 18 Oct 2022 12:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666096991;
        bh=wmSuGGxgrusuISyygPHwnqtO2uHJUEYRCPwmc4sX0lM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=fakBP4xIv5kmo515MwkXsZvXVuvblJ5o3NgEQMH3TnzvxdaYNAzqoepVDOrzRBcX7
         iFNYvqPgKx4ICDJN2chIZ5TTRmZBB8c//c7Ee9wAfuDWIge/YmGONrTtlsIFkTW+YS
         80Cme/sp4MZPfnkupl3PQ2wbOPpsIUKd8lX34dtBL3eZRAQeBorLQAa7qyygRrAHad
         IaHCX3gb+l/vXf/RoFQxz9x95DCywBO1HSlWy3P8Y1Z+LS6UcTqfdScfE0JABXDgMV
         rFQAWmDj7DREw6SNmoLWF4Mt7Loti8851kspjczDU4r7P9SwqzrXWRUfnrSo0KQEo+
         rsZ8dCQaGQRcA==
Date:   Tue, 18 Oct 2022 14:43:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Samuel Bailey <samuel.bailey1@gmail.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: saitek: add madcatz variant of MMO7 mouse device
 ID
In-Reply-To: <20221005185123.22219-1-samuel.bailey1@gmail.com>
Message-ID: <nycvar.YFH.7.76.2210181442590.29912@cbobk.fhfr.pm>
References: <20221005185123.22219-1-samuel.bailey1@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 5 Oct 2022, Samuel Bailey wrote:

> The MadCatz variant of the MMO7 mouse has the ID 0738:1713 and the same
> quirks as the Saitek variant.
> 
> Signed-off-by: Samuel Bailey <samuel.bailey1@gmail.com>

Applied, thanks Samuel.

-- 
Jiri Kosina
SUSE Labs

